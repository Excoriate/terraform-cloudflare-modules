resource "cloudflare_record" "this" {
  for_each = { for k, v in local.records_create : k => v if v["data"] == null }

  zone_id         = local.is_lookup_by_zone_id ? var.zone_id : local.is_lookup_by_zone_name ? data.cloudflare_zone.selected[0].id : null
  name            = each.value["name"]
  type            = each.value["type"]
  value           = each.value["value"]
  ttl             = each.value["ttl"]
  proxied         = each.value["proxied"]
  tags            = each.value["tags"]
  priority        = each.value["priority"]
  comment         = each.value["comment"]
  allow_overwrite = each.value["allow_overwrite"]

  dynamic "timeouts" {
    for_each = each.value["timeouts"] != null ? [each.value["timeouts"]] : []
    content {
      create = timeouts["create"]
      update = timeouts["update"]
    }
  }
}

resource "cloudflare_record" "with_data" {
  for_each = { for k, v in local.records_create : k => v if v["data"] != null }

  zone_id         = local.is_lookup_by_zone_id ? var.zone_id : local.is_lookup_by_zone_name ? data.cloudflare_zone.selected[0].id : null
  name            = each.value["name"]
  type            = each.value["type"]
  value           = null
  ttl             = each.value["ttl"]
  proxied         = each.value["proxied"]
  tags            = each.value["tags"]
  priority        = each.value["priority"]
  comment         = each.value["comment"]
  allow_overwrite = each.value["allow_overwrite"]


  dynamic "timeouts" {
    for_each = each.value["timeouts"] != null ? [each.value["timeouts"]] : []
    content {
      create = timeouts["create"]
      update = timeouts["update"]
    }
  }

  dynamic "data" {
    for_each = each.value["data"] != null ? [each.value["data"]] : []
    content {
      algorithm      = lookup(data.value, "algorithm", null)
      altitude       = lookup(data.value, "altitude", null)
      certificate    = lookup(data.value, "certificate", null)
      content        = lookup(data.value, "content", null)
      digest         = lookup(data.value, "digest", null)
      digest_type    = lookup(data.value, "digest_type", null)
      fingerprint    = lookup(data.value, "fingerprint", null)
      flags          = lookup(data.value, "flags", null)
      key_tag        = lookup(data.value, "key_tag", null)
      lat_degrees    = lookup(data.value, "lat_degrees", null)
      lat_direction  = lookup(data.value, "lat_direction", null)
      lat_minutes    = lookup(data.value, "lat_minutes", null)
      lat_seconds    = lookup(data.value, "lat_seconds", null)
      long_degrees   = lookup(data.value, "long_degrees", null)
      long_direction = lookup(data.value, "long_direction", null)
      long_minutes   = lookup(data.value, "long_minutes", null)
      long_seconds   = lookup(data.value, "long_seconds", null)
      matching_type  = lookup(data.value, "matching_type", null)
      name           = lookup(data.value, "name", null)
      order          = lookup(data.value, "order", null)
      port           = lookup(data.value, "port", null)
      precision_horz = lookup(data.value, "precision_horz", null)
      precision_vert = lookup(data.value, "precision_vert", null)
      preference     = lookup(data.value, "preference", null)
      priority       = lookup(data.value, "priority", null)
      proto          = lookup(data.value, "proto", null)
      protocol       = lookup(data.value, "protocol", null)
      public_key     = lookup(data.value, "public_key", null)
      regex          = lookup(data.value, "regex", null)
      replacement    = lookup(data.value, "replacement", null)
      selector       = lookup(data.value, "selector", null)
      service        = lookup(data.value, "service", null)
      size           = lookup(data.value, "size", null)
      tag            = lookup(data.value, "tag", null)
      target         = lookup(data.value, "target", null)
      type           = lookup(data.value, "type", null)
      usage          = lookup(data.value, "usage", null)
      weight         = lookup(data.value, "weight", null)
    }
  }
}
