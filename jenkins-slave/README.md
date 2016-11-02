jenkins-slave
=============

docker image for jenkins slaves (jnlp) on Windows

To build this image:
`docker build -t jenkins-slave jenkins-slave`

*Note*: It is expected that you have built the Java JRE image as `oracle-jre` found in the `orace-jre` subdirectory of this project

Example usage (this is a work in progress so much of this will not work):

```
docker run -d --name jenkins-slave \
  -v jenkins-slave:/data \
  -e PROTOCOL=http \
  -e JENKINS_MASTER=jenkins.example.com:8080 \
  -e SLAVE_NAME=nodename \
  -e SECRET=secret \
  jenkins-slave
```

### Arguments
The arguments after the image name are used to configure the slave to know where the master is.  There are three arguments:
 - Jenkins master hostname and port (example: jenkins.example.com:8080)
 - Slave node name (example: nodename)
 - Secret key from Master (Optional) (example: dfa46f00cda7fec625f782b094bb618a684b8325d576e69dde2228d037aa9ae5)

### How to add a slave
To add a slave, go to your Jenkins master, Manage Jenkins > Manage Nodes > New Node.  Give your node a name and choose OK.  Set the number of executors, set the Remote root directory to `/data` (assuming you use the above `docker run` command), set Launch method to "Launch agent via Java Web Start".  Add any other options you wish and click Save.  If secuity is enabled, click on the node name to get the secret and use that as the third parameter in the `docker run` command above.
