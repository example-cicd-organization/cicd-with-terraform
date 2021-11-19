module "dev" {
  source = "./dev"

  // providers = {
  //   google-beta.src = google-beta.dev
  // }
  gcp_project_id = var.dev_gcp_project_id
  gcp_region = var.dev_gcp_region
  k8_subnet_cidr = var.k8_default_cidr
}
module "prod" {
  source = "./prod"

  // providers = {
  //   google-beta.prod = google-beta.prod
  // }
  gcp_project_id = var.prod_gcp_project_id
  gcp_region = var.prod_gcp_region
  k8_subnet_cidr = var.k8_default_cidr
}
