# sds-module-certificate

This module is used to add object ID access to the SDS Acme DTS (acmedtssds{env}) Key Vault where SSL Certificates are stored.

## How to use

This module will convert `sbox` to `sandbox`, `stg` to `staging` and `prod` it will not input it into the domain name.

```Terraform
module "get_cert" {
  source        = "github.com/hmcts/sds-module-certificate"
  environment   = "sbox"
  domain_prefix = "sds-app"
}
```

The output would return the certificate for `sds-app.sandbox.platform.hmcts.net`

**Optionally**

You can also add your object ID for Secret and Certificate Get/List access.

```Terraform
module "get_cert" {
  source        = "github.com/hmcts/sds-module-certificate"
  environment   = "sbox"
  domain_prefix = "sds-app"
  object_id     = "a48db592-2a29-4d45-ad04-b3f64785716b"
}
```