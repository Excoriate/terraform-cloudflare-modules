<!-- BEGIN_TF_DOCS -->
# ☁️ Cloudflare Zones
## Description

This module creates [Cloudflare](https://www.cloudflare.com/) zones.
* 🚀 Create one or more zones

---
## Example
Examples of this module's usage are available in the [examples](./examples) folder.

```hcl
module "main_module" {
  source                = "../../../modules/cloudflare-zone"
  is_enabled            = var.is_enabled
  cloudflare_account_id = var.cloudflare_account_id
  domains               = var.domains
  cloudflare_api_key    = var.cloudflare_api_key
  cloudflare_email      = var.cloudflare_email
}
```
A quick recipe for this simple module can be found here:
```hcl
is_enabled         = true
cloudflare_api_key = "your_api"
domains = [
  {
    name   = "example"
    domain = "example.com"
  },
]
cloudflare_email      = "your_email"
cloudflare_account_id = "your_account_id"
```

For module composition, It's recommended to take a look at the module's `outputs` to understand what's available:
```hcl
output "is_enabled" {
  value       = var.is_enabled
  description = "Whether the module is enabled or not"
}

output "cloudflare_zone_ids" {
  value       = !local.is_enabled ? {} : { for zone in cloudflare_zone.this : zone.id => zone.id }
  description = "the zone ids"
}

output "cloudflare_zone_name_servers" {
  value       = !local.is_enabled ? {} : { for zone in cloudflare_zone.this : zone.name_servers => zone.name_servers }
  description = "the zone name servers"
}

output "cloudflare_zone_plan" {
  value       = !local.is_enabled ? {} : { for zone in cloudflare_zone.this : zone.plan => zone.plan }
  description = "the zone plans"
}

output "cloudflare_zone_plan_id" {
  value       = !local.is_enabled ? {} : { for zone in cloudflare_zone.this : zone.id => zone.id }
  description = "the zone plan ids"
}
```
---

## Module's documentation
(This documentation is auto-generated using [terraform-docs](https://terraform-docs.io))
## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_account_id"></a> [cloudflare\_account\_id](#input\_cloudflare\_account\_id) | The unique identifier for your Cloudflare account. This ID is required to interact with Cloudflare's API<br>and manage resources under your account. You can find your account ID in the Cloudflare Dashboard under<br>the "Overview" section of any domain. | `string` | n/a | yes |
| <a name="input_cloudflare_api_key"></a> [cloudflare\_api\_key](#input\_cloudflare\_api\_key) | The API key generated within the Cloudflare dashboard, used to authenticate against the Cloudflare API.<br>This key, in combination with the email associated with your Cloudflare account, allows Terraform to make<br>changes to your Cloudflare settings. It's recommended to use API tokens instead of the global API key<br>for enhanced security and scoped access control. | `string` | n/a | yes |
| <a name="input_cloudflare_email"></a> [cloudflare\_email](#input\_cloudflare\_email) | The email address associated with your Cloudflare account. When using your Cloudflare API key for<br>authentication, this email is used to identify your account. For operations requiring API authentication,<br>both your API key and this email address must be provided. | `string` | n/a | yes |
| <a name="input_domains"></a> [domains](#input\_domains) | The domain name to be managed within Cloudflare, such as "example.com". This variable specifies the target<br>domain for DNS records, SSL certificates, and other Cloudflare services configured by this Terraform module.<br>The domain must already be added to your Cloudflare account, and its nameservers should be pointed to Cloudflare. | <pre>list(object({<br>    name   = string<br>    domain = string<br>  }))</pre> | n/a | yes |
| <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled) | Determines whether the resources within this module should be created. This variable is particularly useful for<br>scenarios where the inclusion of resources provided by this module is conditional based on the broader infrastructure<br>or stack configuration. Setting this to false effectively bypasses the creation of all module resources, allowing<br>for more dynamic and flexible Terraform configurations. | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudflare_zone_ids"></a> [cloudflare\_zone\_ids](#output\_cloudflare\_zone\_ids) | the zone ids |
| <a name="output_cloudflare_zone_name_servers"></a> [cloudflare\_zone\_name\_servers](#output\_cloudflare\_zone\_name\_servers) | the zone name servers |
| <a name="output_cloudflare_zone_plan"></a> [cloudflare\_zone\_plan](#output\_cloudflare\_zone\_plan) | the zone plans |
| <a name="output_cloudflare_zone_plan_id"></a> [cloudflare\_zone\_plan\_id](#output\_cloudflare\_zone\_plan\_id) | the zone plan ids |
| <a name="output_is_enabled"></a> [is\_enabled](#output\_is\_enabled) | Whether the module is enabled or not |
<!-- END_TF_DOCS -->
