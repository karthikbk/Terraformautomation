# Azure resources
Creating Repo for Azure access to IZDL

## Local Development

For the local development and validate the syntax

You can also run the following manually:

```
terraform init -backend=false
terraform validate
```

This will validate the full configuration, including submodules, without needing to provide login
credentials.

## Developer cost estimate before adding any new resources

Before creating any new resource please estimate the cost and and maintyain system stability

https://azure.microsoft.com/en-us/pricing/calculator/

