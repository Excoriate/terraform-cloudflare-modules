## ---------------------------------------------------------------------------------------------------------------------
## GENERAL-PURPOSE VARIABLES
## ---------------------------------------------------------------------------------------------------------------------
variable "is_enabled" {
  type        = bool
  description = <<-DESC
    Determines whether the resources within this module should be created. This variable is particularly useful for
    scenarios where the inclusion of resources provided by this module is conditional based on the broader infrastructure
    or stack configuration. Setting this to false effectively bypasses the creation of all module resources, allowing
    for more dynamic and flexible Terraform configurations.
  DESC
}

## ---------------------------------------------------------------------------------------------------------------------
## SPECIFIC STACK VARIABLES
## ---------------------------------------------------------------------------------------------------------------------
variable "cloudflare_account_id" {
  type        = string
  description = <<-DESC
    The unique identifier for your Cloudflare account. This ID is required to interact with Cloudflare's API
    and manage resources under your account. You can find your account ID in the Cloudflare Dashboard under
    the "Overview" section of any domain.
  DESC
}

variable "cloudflare_api_key" {
  type        = string
  description = <<-DESC
    The API key generated within the Cloudflare dashboard, used to authenticate against the Cloudflare API.
    This key, in combination with the email associated with your Cloudflare account, allows Terraform to make
    changes to your Cloudflare settings. It's recommended to use API tokens instead of the global API key
    for enhanced security and scoped access control.
  DESC
}

variable "cloudflare_email" {
  type        = string
  description = <<-DESC
    The email address associated with your Cloudflare account. When using your Cloudflare API key for
    authentication, this email is used to identify your account. For operations requiring API authentication,
    both your API key and this email address must be provided.
  DESC
}

variable "domains" {
  type = list(object({
    name   = string
    domain = string
  }))
  description = <<-DESC
    The domain name to be managed within Cloudflare, such as "example.com". This variable specifies the target
    domain for DNS records, SSL certificates, and other Cloudflare services configured by this Terraform module.
    The domain must already be added to your Cloudflare account, and its nameservers should be pointed to Cloudflare.
  DESC
}
