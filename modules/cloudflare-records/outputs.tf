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
