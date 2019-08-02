# Nginx Proxy

This configuration allows remote services to be proxied through K8's without being exposed to the public

## Configuration

The main element of configuration is the `config:` section of `values.yaml` this is a simple nginx proxy setup, It forwards all requests to the remote application. 

## Setup

The security group of the k8's cluster nodes will need to be added to the security group for the proxied application. 

`helm install --name=app-proxy .`
