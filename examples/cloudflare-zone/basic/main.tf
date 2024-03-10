module "main_module" {
  source                = "../../../modules/cloudflare-zone"
  is_enabled            = var.is_enabled
  cloudflare_account_id = var.cloudflare_account_id
  domains               = var.domains
  cloudflare_api_key    = var.cloudflare_api_key
  cloudflare_email      = var.cloudflare_email
}
