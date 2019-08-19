# SNS Webhook

Simple chart to allow usage of the SNS Webhook app in other charts

SNS Webhook app ( [github](https://github.com/epimorphics/prometheus-sns-webhook) )

# Usage

Create your own values.yaml providing arguments to the chart

```yaml
sns:
  # arn of the topic in Amazon SNS
  topicarn:	""
  # Region the arn is in
  region: eu-west-1
  # name of kubernetes secret which provides the AWS_SECRET_ACCESS_KEY and AWS_ACCESS_KEY_ID environment variables
  secret: ""

image:
  repository: epimorphics/prometheus-sns-webhook
  tag: 0.0.1
  pullPolicy: Always
```
