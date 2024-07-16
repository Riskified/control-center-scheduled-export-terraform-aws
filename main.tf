locals {
  s3_policy = [
    {
      name   = "S3Access"
      policy = <<-EOT
      {
        "Version": "2012-10-17",
          "Statement": [
            {
              "Effect": "Allow",
              "Action": [
                "s3:PutObject"
              ],
              "Resource": "arn:aws:s3:::${var.s3_bucket_name}/*"
            }
          ]
        }
      EOT
    }
  ]
  kms_policy = var.kms_key_arn != null ? [
    {
      name   = "KMSAccess"
      policy = <<-EOT
      {
        "Version": "2012-10-17",
          "Statement": [
            {
              "Effect": "Allow",
              "Action": [
                "kms:GenerateDataKey*"
              ],
              "Resource": ${jsonencode(var.kms_key_arn)}
            }
          ]
        }
      EOT
  }] : []
  iprestriction_policy = length(var.allowed_ip_ranges) > 0 ? [
    {
      name   = "IPRestriction"
      policy = <<-EOT
      {
        "Version": "2012-10-17",
          "Statement": [
            {
              "Effect": "Deny",
              "Action": "*",
              "Resource": "*",
              "Condition": {
                "NotIpAddress": {
                  "aws:SourceIp": ${jsonencode(var.allowed_ip_ranges)}
                }
              }
            }
          ]
        }
      EOT
    }
  ] : []

  policy = concat(local.s3_policy, local.kms_policy, local.iprestriction_policy)
}

resource "aws_iam_role" "r" {
  name                 = var.name
  description          = var.description
  path                 = var.path
  max_session_duration = var.max_session_duration
  tags                 = var.tags
  assume_role_policy   = <<-EOT
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "${var.iam_role_assume_role_arn}"
        },
        "Action": "sts:AssumeRole",
        "Condition": {
          "StringEquals": {
            "sts:ExternalId": "${var.iam_role_external_id}"
          }
        }
      }
    ]
  }
  EOT

  dynamic "inline_policy" {
    for_each = local.policy
    content {
      name   = inline_policy.value["name"]
      policy = inline_policy.value["document"]
    }
  }
}
