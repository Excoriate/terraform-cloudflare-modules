output "is_enabled" {
  value       = var.is_enabled
  description = "Whether the module is enabled or not"
}

output "cloudflare_zone_ids" {
  value       = module.main_module.cloudflare_zone_ids
  description = "the zone ids"
}

output "cloudflare_zone_name_servers" {
  value       = module.main_module.cloudflare_zone_name_servers
  description = "the zone name servers"
}

output "cloudflare_zone_plan" {
  value       = module.main_module.cloudflare_zone_plan
  description = "the zone plans"
}

output "cloudflare_zone_plan_id" {
  value       = module.main_module.cloudflare_zone_plan_id
  description = "the zone plan ids"
}
