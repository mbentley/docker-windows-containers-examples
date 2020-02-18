# Swarm Mode Service + gMSA as a Swarm config

Create the cred spec as a config object and add a label for the gMSA name as com.docker.gmsa.name and the access control label:

```
docker config create -l com.docker.gmsa.name=credspectest -l com.docker.ucp.access.label=/Windows credspectest credspectest.json
```

Update your compose file to use version 3.8, change the credspec to use a config and add a config section to specify that the credspec has been externally created; for example:

```
version: '3.8'
services:
  trademanagementservice:
    image: dtr.demo.dckr.org/demo/dotnetdemo:latest
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role==worker
          - node.platform.os==windows
      labels:
        com.docker.ucp.access.label: /Windows
    credential_spec:
      config: credspectest
    ports:
      - "8150:80"

configs:
  credspectest:
    external: true
```

Deploy the stack:

```
docker stack deploy -c docker-compose.yml test
```

If you would rather have the config specified in compose, you can do that.  Here is an example that doesn't have the proper access control labels on the config: https://docs.docker.com/compose/compose-file/#example-gmsa-configuration
