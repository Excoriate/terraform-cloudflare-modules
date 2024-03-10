output "is_enabled" {
  value       = var.is_enabled
  description = "Whether the module is enabled or not"
}

output "cloudflare_record_ids" {
  value       = module.main_module.cloudflare_record_ids
  description = "Map of Cloudflare DNS record names to their IDs, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_names" {
  value       = module.main_module.cloudflare_record_names
  description = "Map of Cloudflare DNS record names to their names, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_types" {
  value       = module.main_module.cloudflare_record_types
  description = "Map of Cloudflare DNS record names to their types, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_ttl" {
  value       = module.main_module.cloudflare_record_ttl
  description = "Map of Cloudflare DNS record names to their TTLs, separated by records created with and without 'data' attributes."
}

output "cloudflare_record_proxied" {
  value       = module.main_module.cloudflare_record_proxied
  description = "Map of Cloudflare DNS record names to their proxied status, separated by records created with and without 'data' attributes."
}
