locals {
  is_enabled             = var.is_enabled
  is_lookup_by_zone_name = !local.is_enabled ? false : var.zone_name != null && var.zone_id == null
  is_lookup_by_zone_id   = !local.is_enabled ? false : var.zone_name == null && var.zone_id != null

  records = !local.is_enabled ? [] : [for r in var.records : {
    name            = trimspace(r["name"])
    type            = trimspace(r["type"])
    value           = trimspace(r["value"])
    ttl             = r["ttl"] == null ? 300 : r["ttl"]
    proxied         = r["proxied"] == null ? false : r["proxied"]
    data            = r["data"]
    comment         = r["comment"] == null ? "" : r["comment"]
    tags            = r["tags"] == null ? [] : r["tags"]
    priority        = r["priority"]
    allow_overwrite = r["allow_overwrite"] == null ? false : r["allow_overwrite"]
    timeouts        = r["timeouts"]
  }]

  #  records_create = !local.is_enabled ? {} : { for r in local.records : r["value"] => r }
  records_create = { for i, r in local.records : "${r["name"]}-${r["type"]}-${i}" => r }
}
