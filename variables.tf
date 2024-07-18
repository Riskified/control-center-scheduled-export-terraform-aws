# IAM role parameters

variable "name" {
  type        = string
  description = "The name of the IAM role."
}

variable "description" {
  type        = string
  description = "The description of the IAM role."
}

variable "region" {
  description = "The region in which the resources will be created."
  default     = "us-east-1"
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "path" {
  description = "The path in which to create the IAM role."
  default     = "/"
}

variable "max_session_duration" {
  description = "The maximum session duration for the IAM role."
  default     = 28800 # 8 hours
}

variable "iam_role_assume_role_arn" {
  type        = string
  description = "The ARN of the role that can assume this role."
  default     = "arn:aws:iam::164676829276:role/k8s-production-cortex-control-center-assumer-role"
}

variable "iam_role_external_id" {
  type        = string
  description = "The external ID to use in the assume role policy."
  default     = "123468456"
}

variable "policy" {
  description = "A list of inline policies to attach to the IAM role."
  type = list(object({
    name       = string
    policy_arn = string
  }))
  default = []
}

# IAM role policy parameters

variable "s3_bucket_name" {
  type        = string
  description = "The name of the S3 bucket to use in the IAM role policy."
}

variable "kms_key_arn" {
  description = "The ARN of the KMS key to use in the IAM role policy."
  type        = string
  default     = null
}

variable "allowed_ip_ranges" {
  description = "A list of IP ranges that are allowed to assume the role."
  type        = list(string)
  default = [
    # Add your IP ranges here
  ]
}
