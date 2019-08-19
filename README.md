# Epimorphics Helm Charts

Provides reusable helm charts for epimorphics projects.

# Usage

All charts are available in the epimorphics chart repository. s3://epi-charts/charts, you may need to set your aws profile to your experimental credentials for this

`aws s3 --profile=expt ls s3://epi-charts/charts`

To make this repo available to helm use

```bash
helm plugin install https://github.com/hypnoglow/helm-s3.git
AWS_PROFILE=expt helm repo add epi-charts s3://epi-charts/charts
```

You can now use the chart as follows 

```bash
AWS_PROFILE=expt helm install --name=production-api epi-charts/sapi-api
```

## Available Charts

- Fuseki
- Nginx Proxy
- Registry
- Sapi Api
- Sapi App
- SNS Webhook
- TDB Builder

## Deployment

This Repo is build and deployed by Travis. On every push to master the Makefile is run to build and publish all of the charts to the repository. All charts are versioned, so when making a change be sure to update the version in Chart.yaml
