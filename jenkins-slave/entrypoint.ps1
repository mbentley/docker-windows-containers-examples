# set default action to stop on error
$ErrorActionPreferences = "Stop"

# check to see if protocol was specified
if([string]::IsNullOrEmpty($env:PROTOCOL)) {
  # set protocol to http by default
  $env:PROTOCOL = "http"
}

# check to see if jenkins master was specified
if([string]::IsNullOrEmpty($env:JENKINS_MASTER)) {
  Write-Host "Please specify the JENKINS_MASTER environment variable"
  exit
}

# check and see if slave name was provided
if([string]::IsNullOrEmpty($env:SLAVE_NAME)) {
  Write-Host "Please specify the SLAVE_NAME environment variable"
  exit
}

# download slave.jar if necessary
if(![System.IO.File]::Exists("C:\slave.jar")) {
  $progressPreference = 'silentlyContinue'
  wget -Uri ${env:PROTOCOL}://${env:JENKINS_MASTER}/jnlpJars/slave.jar -OutFile c:\slave.jar
}

# check and see if secret was provided
if([string]::IsNullOrEmpty($env:SECRET)) {
  # start the jenkins slave without a secret
  java -jar c:\slave.jar -jnlpUrl ${env:PROTOCOL}://${env:JENKINS_MASTER}/computer/${env:SLAVE_NAME}/slave-agent.jnlp
} else {
  # start the jenkins slave with the secret
  java -jar c:\slave.jar -jnlpUrl ${env:PROTOCOL}://${env:JENKINS_MASTER}/computer/${env:SLAVE_NAME}/slave-agent.jnlp -secret ${env:SECRET}
}
