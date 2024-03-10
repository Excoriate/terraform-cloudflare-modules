module "main_module" {
  source     = "../../../modules/cloudflare-records"
  is_enabled = var.is_enabled
  zone_id    = var.zone_id
  records    = var.records
  zone_name  = var.zone_name
}
