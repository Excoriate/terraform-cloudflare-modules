locals {
  is_enabled = var.is_enabled

  domains_normalised = !local.is_enabled ? [] : [
    for domain in var.domains : {
      name   = domain["name"]
      domain = trimspace(domain["domain"])
  }]

  domains_to_create = !local.is_enabled ? {} : {
    for domain in var.domains : domain["name"] => domain["domain"]
  }
}
