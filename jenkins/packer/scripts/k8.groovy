import org.csanchez.jenkins.plugins.kubernetes.*
import jenkins.model.*

def env = System.getenv()

def j = Jenkins.getInstance()

def k = new KubernetesCloud(env.K8_CLOUD_AGENTS_NAME)
k.setServerUrl(env.K8_CLOUD_AGENTS_URL)
k.setNamespace(env.K8_CLOUD_AGENTS_NAMESPACE)
def certificateDecodedBytes = env.K8_CLOUD_AGENTS_CERTIFICATE_BASE64.decodeBase64()
def certificate = new String(certificateDecodedBytes)
k.setServerCertificate(certificate)
// def keyDecodedBytes = env.K8_CLOUD_AGENTS_KEY_BASE64.decodeBase64()
// def key = new String(keyDecodedBytes)
// k.setCredentialsId(key)
k.setSkipTlsVerify(true)


println("clouds printing: ")
println(j.clouds)
println("clouds printing done")
println("K printing: ")
println(k)
println("K printing done")
j.clouds.add(k)
j.save()