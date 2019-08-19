# TDB Builder

Builds a tdb image from and nquads file, then indexes it through a provided asm.ttl

# Building Docker image

docker build -t tdb-builder .

# Usage

Create your own values.yaml file providing the arguments to the chart

```yaml
image:
  # If keeping the image private you will need to tag and push it to your own repo
  repository: 173681544495.dkr.ecr.eu-west-1.amazonaws.com/epimorphics/tdb-builder
  tag: "0.0.1"

arguments:
  # Location of the nquads file in s3, this will need to be accessable using the secret
  # provided in awsSecret.name
  nquadsFile: s3://fsa-static-fuseki-data/offset-45522130-ds_2019-08-12_08-42-00.nq.gz
  # Name of the final image, does not end in a suffix
  outputName: offset-45522130-image
  # Bucket and subdirectory the file will be placed, does not end in a '/'
  outputLocation: s3://fsa-static-fuseki-data
  assemblyFile: 
    # Name of the configmap which contains the assemblyFile
    configMap: alpha-prerelease-3-fuseki-config
    # Name of the entry in the configmap which will be used for the assembly
    subPath: config-tdb.ttl

awsSecret:
  # provides the AWS_SECRET_ACCESS_KEY and AWS_ACCESS_KEY_ID environment variables
  name: fsa-aws-secrets

# Storage to be used by pod
storage:
  spec:
    storageClassName: local-storage
    accessModes:
    - ReadWriteOnce
    resources:
      requests:
        storage: 100Gi
```

```bash
helm install --name=load-tdb --values=values.yaml epi-charts/tdb-builder 
```
