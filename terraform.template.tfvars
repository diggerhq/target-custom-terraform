aws_key = "{{aws_key}}"
aws_secret = "{{aws_secret}}"
app = "{{app_name}}"
region = "{{region}}"
tags = {
  application   = "{{app_name}}"
  team          = "{{app_name}}-team"
  customer      = "{{app_name}}-customer"
  contact-email = "me@domain.com"
}

public_subnets = {{public_subnets}}
private_subnets = {{private_subnets}}
vpc_id = "{{vpc_id}}"
