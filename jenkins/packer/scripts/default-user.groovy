import jenkins.model.*
import hudson.security.*

def env = System.getenv()

def jenkins = Jenkins.getInstance()
if(!(jenkins.getSecurityRealm() instanceof HudsonPrivateSecurityRealm))
    jenkins.setSecurityRealm(new HudsonPrivateSecurityRealm(false))

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
jenkins.setAuthorizationStrategy(strategy)

// create new Jenkins user account
// username & password from environment variables
def user = jenkins.getSecurityRealm().createAccount(env.JENKINS_USER, env.JENKINS_PASSWORD)
user.save()

jenkins.save()