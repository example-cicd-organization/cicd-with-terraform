// provider "google-beta" {
//   project = var.kubernetes_dev_gcp_project_id
//   region = var.kubernetes_dev_gcp_region
//   alias = "dev"
// }
// provider "google-beta" {
//   project = var.kubernetes_prod_gcp_project_id
//   region = var.kubernetes_prod_gcp_region
//   alias = "prod"
// }
module "kubernetes" {
  source = "./kubernetes/cluster"
  // providers = {
  //   google-beta.dev = google-beta.dev
  //   google-beta.prod = google-beta.prod
  // }

  dev_gcp_project_id = var.kubernetes_dev_gcp_project_id
  dev_gcp_region = var.kubernetes_dev_gcp_region
  prod_gcp_project_id = var.kubernetes_prod_gcp_project_id
  prod_gcp_region = var.kubernetes_prod_gcp_region
  k8_default_cidr = var.kubernetes_default_cidr
}


// After module kubernetes has been deployed
provider "kubernetes" {
  host = "https://${module.kubernetes.dev_k8_cluster_host}"
  token = module.kubernetes.dev_k8_cluster_access_token
  cluster_ca_certificate = base64decode(module.kubernetes.dev_k8_cluster_certificate_base64)
  alias = "dev"
}
provider "kubernetes" {
  host = "https://${module.kubernetes.prod_k8_cluster_host}"
  token = module.kubernetes.prod_k8_cluster_access_token
  cluster_ca_certificate = base64decode(module.kubernetes.prod_k8_cluster_certificate_base64)
  alias = "prod"
}

module "kubernetes-config" {
  depends_on = [module.kubernetes]
  source = "./kubernetes/cluster-config"
  providers = {
    kubernetes.dev = kubernetes.dev
    kubernetes.prod = kubernetes.prod
  }
  prod_k8_infrastructure_namespace_name = var.kubernetes_prod_infrastructure_namespace
  prod_k8_services_namespace_name = var.kubernetes_prod_services_namespace
  dev_k8_infrastructure_namespace_name = var.kubernetes_dev_infrastructure_namespace
  dev_k8_services_namespace_name = var.kubernetes_dev_services_namespace
}
module "jenkins" {
  depends_on = [module.kubernetes, module.kubernetes-config]
  source = "./jenkins"

  providers = {
    kubernetes = kubernetes.dev
  }

  // aws_region = var.jenkins_aws_region
  dockerhub_organization = var.dockerhub_organization
  dockerhub_repository = var.dockerhub_repository
  dockerhub_username = var.dockerhub_username
  dockerhub_password = var.dockerhub_password
  image_version = var.jenkins_image_version
  k8_cluster_access_token = module.kubernetes.dev_k8_cluster_access_token
  k8_cluster_certificate_base64 = module.kubernetes.dev_k8_cluster_certificate_base64
  k8_cluster_endpoint = "https://${module.kubernetes.dev_k8_cluster_host}"
  master_name = var.jenkins_master_name
  master_k8_namespace = var.kubernetes_dev_infrastructure_namespace
  cloud_agents_k8_namespace = var.jenkins_k8_cluster_jenkins_cloud_agents_namespace
  admin_password = var.jenkins_admin_password
  admin_user = var.jenkins_admin_user
}