# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "qualys_bucket" {
  description = "The name of the S3 bucket where the Qualys Cloud Agent files live."
  nullable    = false
  type        = string
}

variable "terraform_state_bucket" {
  description = "The name of the S3 bucket where Terraform state is stored."
  nullable    = false
  type        = string
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults.
# ------------------------------------------------------------------------------

variable "aws_region" {
  default     = "us-east-1"
  description = "The AWS region to deploy into (e.g. us-east-1)."
  nullable    = false
  type        = string
}

variable "qualys_objects" {
  type        = list(string)
  description = "The Qualys Cloud Agent system package objects inside the bucket."
  default = [
    "QualysCloudAgent*.deb",
    "QualysCloudAgent*.rpm",
    "sha2_qualys_cloud_agent_gpg.key",
  ]
}

variable "tags" {
  default = {
    Team        = "VM Fusion - Development"
    Application = "ansible-role-qualys-cloud-agent testing"
  }
  description = "Tags to apply to all AWS resources created"
  nullable    = false
  type        = map(string)
}
