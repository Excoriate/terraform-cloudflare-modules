output "is_enabled" {
  value       = var.is_enabled
  description = "Whether the module is enabled or not"
}

output "cloudflare_record_ids" {
  value = {
    "without_data" = local.is_enabled ? { for k, v in cloudflare_record.this : v.value => v.id } : {}
    "with_data"    = local.is_enabled ? { for k, v in cloudflare_record.with_data : v.value => v.id } : {}
  }
  description = "Map of Cloudflare DNS record names to their IDs, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_names" {
  value = {
    "without_data" = local.is_enabled ? { for k, v in cloudflare_record.this : v.value => v.value } : {}
    "with_data"    = local.is_enabled ? { for k, v in cloudflare_record.with_data : v.value => v.value } : {}
  }
  description = "Map of Cloudflare DNS record names to their names, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_types" {
  value = {
    "without_data" = local.is_enabled ? { for k, v in cloudflare_record.this : v.value => v.type } : {}
    "with_data"    = local.is_enabled ? { for k, v in cloudflare_record.with_data : v.value => v.type } : {}
  }
  description = "Map of Cloudflare DNS record names to their types, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_ttl" {
  value = {
    "without_data" = local.is_enabled ? { for k, v in cloudflare_record.this : v.value => v.ttl } : {}
    "with_data"    = local.is_enabled ? { for k, v in cloudflare_record.with_data : v.value => v.ttl } : {}
  }
  description = "Map of Cloudflare DNS record names to their TTLs, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_proxied" {
  value = {
    "without_data" = local.is_enabled ? { for k, v in cloudflare_record.this : v.value => v.proxied } : {}
    "with_data"    = local.is_enabled ? { for k, v in cloudflare_record.with_data : v.value => v.proxied } : {}
  }
  description = "Map of Cloudflare DNS record names to their proxied status, separated by records created with and without 'data' attributes."
}
