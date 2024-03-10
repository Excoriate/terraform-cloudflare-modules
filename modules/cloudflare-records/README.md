<!-- BEGIN_TF_DOCS -->
# ☁️ Cloudflare Records
## Description

This module creates [Cloudflare](https://www.cloudflare.com/) [records](https://developers.cloudflare.com/api/v4/zones/dns-records) for a given zone.
* 🚀 Create many records
* 📦 Create a single record
* 📦 Create records by using the [data] configuration.

---
## Example
Examples of this module's usage are available in the [examples](./examples) folder.

```hcl
module "main_module" {
  source     = "../../../modules/cloudflare-records"
  is_enabled = var.is_enabled
  zone_id    = var.zone_id
  records    = var.records
  zone_name  = var.zone_name
}
```
A quick recipe for this simple module can be found here:
```hcl
is_enabled = true
zone_name  = "example.com"
records = [
  {
    name  = "@"
    type  = "TXT"
    value = "zoho-verification=xxxxasdad.zmverify.zoho.eu"
  },
]
```

For module composition, It's recommended to take a look at the module's `outputs` to understand what's available:
```hcl
output "is_enabled" {
  value       = var.is_enabled
  description = "Whether the module is enabled or not"
}

output "cloudflare_record_ids" {
  value = {
    "without_data" = local.is_enabled ? { for k, v in cloudflare_record.this : v.name => v.id } : {}
    "with_data"    = local.is_enabled ? { for k, v in cloudflare_record.with_data : v.name => v.id } : {}
  }
  description = "Map of Cloudflare DNS record names to their IDs, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_names" {
  value = {
    "without_data" = local.is_enabled ? { for k, v in cloudflare_record.this : v.name => v.name } : {}
    "with_data"    = local.is_enabled ? { for k, v in cloudflare_record.with_data : v.name => v.name } : {}
  }
  description = "Map of Cloudflare DNS record names to their names, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_types" {
  value = {
    "without_data" = local.is_enabled ? { for k, v in cloudflare_record.this : v.name => v.type } : {}
    "with_data"    = local.is_enabled ? { for k, v in cloudflare_record.with_data : v.name => v.type } : {}
  }
  description = "Map of Cloudflare DNS record names to their types, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_ttl" {
  value = {
    "without_data" = local.is_enabled ? { for k, v in cloudflare_record.this : v.name => v.ttl } : {}
    "with_data"    = local.is_enabled ? { for k, v in cloudflare_record.with_data : v.name => v.ttl } : {}
  }
  description = "Map of Cloudflare DNS record names to their TTLs, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_proxied" {
  value = {
    "without_data" = local.is_enabled ? { for k, v in cloudflare_record.this : v.name => v.proxied } : {}
    "with_data"    = local.is_enabled ? { for k, v in cloudflare_record.with_data : v.name => v.proxied } : {}
  }
  description = "Map of Cloudflare DNS record names to their proxied status, separated by records created with and without 'data' attributes."
}
```
---

## Module's documentation
(This documentation is auto-generated using [terraform-docs](https://terraform-docs.io))
## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.with_data](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_zone.selected](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_is_enabled"></a> [is\_enabled](#input\_is\_enabled) | Determines whether the resources within this module should be created. This variable is particularly useful for<br>scenarios where the inclusion of resources provided by this module is conditional based on the broader infrastructure<br>or stack configuration. Setting this to false effectively bypasses the creation of all module resources, allowing<br>for more dynamic and flexible Terraform configurations. | `bool` | n/a | yes |
| <a name="input_records"></a> [records](#input\_records) | A list of DNS records to be managed in Cloudflare. Each record is an object containing key details for the DNS record configuration, including specialized 'data' attributes for certain types of DNS records. The 'data' object accommodates optional fields required by specific DNS record types, such as 'SRV', 'CAA', 'DNSKEY', and others.<br><br>Common attributes:<br>- 'name': The name of the record, e.g., 'www' for 'www.example.com'.<br>- 'type': The type of DNS record, e.g., 'A', 'AAAA', 'CNAME', etc.<br>- 'value': The value of the DNS record, such as the IP address for 'A' records or the destination hostname for 'CNAME' records.<br>- 'ttl': The Time To Live (TTL) for the DNS record. Defaults to 300 seconds if not specified.<br>- 'proxied': Whether the record is proxied through Cloudflare (true) or DNS only (false). Defaults to false if not specified.<br><br>The 'data' object includes fields like 'algorithm', 'certificate', 'service', 'proto', etc., that are necessary for specific DNS record types. Consult the Cloudflare documentation for the appropriate use of these fields based on the record type.<br><br>Note: Not all fields within the 'data' object will apply to every record type. Only include fields relevant to the specific type of DNS record you are creating or updating. | <pre>list(object({<br>    name    = string<br>    type    = string<br>    value   = string<br>    ttl     = optional(number, 300)<br>    proxied = optional(bool, false)<br>    data = optional(object({<br>      algorithm      = optional(number)<br>      altitude       = optional(number)<br>      certificate    = optional(string)<br>      content        = optional(string)<br>      digest         = optional(string)<br>      digest_type    = optional(number)<br>      fingerprint    = optional(string)<br>      flags          = optional(number)<br>      key_tag        = optional(number)<br>      lat_degrees    = optional(number)<br>      lat_direction  = optional(string)<br>      lat_minutes    = optional(number)<br>      lat_seconds    = optional(number)<br>      long_degrees   = optional(number)<br>      long_direction = optional(string)<br>      long_minutes   = optional(number)<br>      long_seconds   = optional(number)<br>      matching_type  = optional(number)<br>      name           = optional(string)<br>      order          = optional(number)<br>      port           = optional(number)<br>      precision_horz = optional(number)<br>      precision_vert = optional(number)<br>      preference     = optional(number)<br>      priority       = optional(number)<br>      proto          = optional(string)<br>      protocol       = optional(number)<br>      public_key     = optional(string)<br>      regex          = optional(string)<br>      replacement    = optional(string)<br>      selector       = optional(number)<br>      service        = optional(string)<br>      size           = optional(number)<br>      tag            = optional(string)<br>      target         = optional(string)<br>      type           = optional(number)<br>      usage          = optional(number)<br>      value          = optional(string)<br>      weight         = optional(number)<br>    }))<br>    comment         = optional(string)<br>    tags            = optional(list(string))<br>    priority        = optional(number)<br>    allow_overwrite = optional(bool, false)<br>    timeouts = optional(object({<br>      create = optional(string)<br>      update = optional(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The unique identifier for your Cloudflare account. This ID is required to interact with Cloudflare's API<br>and manage resources under your account. You can find your account ID in the Cloudflare Dashboard under<br>the "Overview" section of any domain. | `string` | `null` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | The domain name to be managed within Cloudflare, such as "example.com". This variable specifies the target<br>domain for DNS records, SSL certificates, and other Cloudflare services configured by this Terraform module.<br>The domain must already be added to your Cloudflare account, and its nameservers should be pointed to Cloudflare. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudflare_record_ids"></a> [cloudflare\_record\_ids](#output\_cloudflare\_record\_ids) | Map of Cloudflare DNS record names to their IDs, separated by records created with and without 'data' attributes. |
| <a name="output_cloudflare_record_names"></a> [cloudflare\_record\_names](#output\_cloudflare\_record\_names) | Map of Cloudflare DNS record names to their names, separated by records created with and without 'data' attributes. |
| <a name="output_cloudflare_record_proxied"></a> [cloudflare\_record\_proxied](#output\_cloudflare\_record\_proxied) | Map of Cloudflare DNS record names to their proxied status, separated by records created with and without 'data' attributes. |
| <a name="output_cloudflare_record_ttl"></a> [cloudflare\_record\_ttl](#output\_cloudflare\_record\_ttl) | Map of Cloudflare DNS record names to their TTLs, separated by records created with and without 'data' attributes. |
| <a name="output_cloudflare_record_types"></a> [cloudflare\_record\_types](#output\_cloudflare\_record\_types) | Map of Cloudflare DNS record names to their types, separated by records created with and without 'data' attributes. |
| <a name="output_is_enabled"></a> [is\_enabled](#output\_is\_enabled) | Whether the module is enabled or not |
<!-- END_TF_DOCS -->
