# Fluentd cluster

Creates a chart that will log services with select labels to s3 (or elsewhere dependent on config)

# Usage

Fill out the envFrom and environment arrays with the required variables, some examples are available in the values.yaml file.

Add the following labels to you pods

```
labels:
  fluentd: true
  fluentd-app: app-name
```

On shutdown of the pod or end of timekey (default 3600 seconds) the logs for the app will be flushed to

$S3_PATH/namespace/app-name/
