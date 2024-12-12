resource "cloudflare_zone" "this" {
  for_each   = local.domains_to_create
  account = {
    id = var.cloudflare_account_id
  }
  name       = each.value
}
