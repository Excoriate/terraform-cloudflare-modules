variable "is_enabled" {
  type        = bool
  description = <<-DESC
    Determines whether the resources within this module should be created. This variable is particularly useful for
    scenarios where the inclusion of resources provided by this module is conditional based on the broader infrastructure
    or stack configuration. Setting this to false effectively bypasses the creation of all module resources, allowing
    for more dynamic and flexible Terraform configurations.
  DESC
}

variable "zone_id" {
  type        = string
  description = <<-DESC
    The unique identifier for your Cloudflare account. This ID is required to interact with Cloudflare's API
    and manage resources under your account. You can find your account ID in the Cloudflare Dashboard under
    the "Overview" section of any domain.
  DESC
  default     = null
}

variable "zone_name" {
  type        = string
  description = <<-DESC
    The domain name to be managed within Cloudflare, such as "example.com". This variable specifies the target
    domain for DNS records, SSL certificates, and other Cloudflare services configured by this Terraform module.
    The domain must already be added to your Cloudflare account, and its nameservers should be pointed to Cloudflare.
  DESC
  default     = null
}

variable "records" {
  type = list(object({
    name    = string
    type    = string
    value   = string
    ttl     = optional(number, 300)
    proxied = optional(bool, false)
    data = optional(object({
      algorithm      = optional(number)
      altitude       = optional(number)
      certificate    = optional(string)
      content        = optional(string)
      digest         = optional(string)
      digest_type    = optional(number)
      fingerprint    = optional(string)
      flags          = optional(number)
      key_tag        = optional(number)
      lat_degrees    = optional(number)
      lat_direction  = optional(string)
      lat_minutes    = optional(number)
      lat_seconds    = optional(number)
      long_degrees   = optional(number)
      long_direction = optional(string)
      long_minutes   = optional(number)
      long_seconds   = optional(number)
      matching_type  = optional(number)
      name           = optional(string)
      order          = optional(number)
      port           = optional(number)
      precision_horz = optional(number)
      precision_vert = optional(number)
      preference     = optional(number)
      priority       = optional(number)
      proto          = optional(string)
      protocol       = optional(number)
      public_key     = optional(string)
      regex          = optional(string)
      replacement    = optional(string)
      selector       = optional(number)
      service        = optional(string)
      size           = optional(number)
      tag            = optional(string)
      target         = optional(string)
      type           = optional(number)
      usage          = optional(number)
      value          = optional(string)
      weight         = optional(number)
    }))
    comment         = optional(string)
    tags            = optional(list(string))
    priority        = optional(number)
    allow_overwrite = optional(bool, false)
    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
    }))
  }))
  default     = []
  description = <<-DESC
    A list of DNS records to be managed in Cloudflare. Each record is an object containing key details for the DNS record configuration, including specialized 'data' attributes for certain types of DNS records. The 'data' object accommodates optional fields required by specific DNS record types, such as 'SRV', 'CAA', 'DNSKEY', and others.

    Common attributes:
    - 'name': The name of the record, e.g., 'www' for 'www.example.com'.
    - 'type': The type of DNS record, e.g., 'A', 'AAAA', 'CNAME', etc.
    - 'value': The value of the DNS record, such as the IP address for 'A' records or the destination hostname for 'CNAME' records.
    - 'ttl': The Time To Live (TTL) for the DNS record. Defaults to 300 seconds if not specified.
    - 'proxied': Whether the record is proxied through Cloudflare (true) or DNS only (false). Defaults to false if not specified.

    The 'data' object includes fields like 'algorithm', 'certificate', 'service', 'proto', etc., that are necessary for specific DNS record types. Consult the Cloudflare documentation for the appropriate use of these fields based on the record type.

    Note: Not all fields within the 'data' object will apply to every record type. Only include fields relevant to the specific type of DNS record you are creating or updating.
  DESC
}
