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
