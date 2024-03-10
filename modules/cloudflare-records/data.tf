data "cloudflare_zone" "selected" {
  count = local.is_lookup_by_zone_name ? 1 : 0
  name  = var.zone_name
}
