resource "aws_s3_bucket" "data" {
  # bucket is public!
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning enabled
  bucket        = "${local.resource_prefix.value}-data"
  acl           = "public-read"
  force_destroy = true
  tags = merge({
    Name        = "${local.resource_prefix.value}-data"
    Environment = local.resource_prefix.value
    }, {
    }, {
    yor_trace = "64526934-7629-4847-859f-ee6dae1d064d"
    }, {
    git_commit           = "6d1874d7aa9c8cd223e1b69abee38e3ab60dd907"
    git_file             = "terraform/aws-2/s3.tf"
    git_last_modified_at = "2022-01-04 19:59:09"
    git_last_modified_by = "mike70@gmail.com"
    git_modifiers        = "mike70"
    git_org              = "5toCode"
    git_repo             = "github-terragoat"
  })
}

resource "aws_s3_bucket_object" "data_object" {
  bucket = aws_s3_bucket.data.id
  key    = "customer-master.xlsx"
  source = "resources/customer-master.xlsx"
  tags = merge({
    Name        = "${local.resource_prefix.value}-customer-master"
    Environment = local.resource_prefix.value
    }, {
    }, {
    yor_trace = "e9e2a19e-0f95-453f-a53a-64ddd5e13415"
    }, {
    git_commit           = "6d1874d7aa9c8cd223e1b69abee38e3ab60dd907"
    git_file             = "terraform/aws-2/s3.tf"
    git_last_modified_at = "2022-01-04 19:59:09"
    git_last_modified_by = "mike70@gmail.com"
    git_modifiers        = "mike70"
    git_org              = "5toCode"
    git_repo             = "github-terragoat"
  })
}

resource "aws_s3_bucket" "financials" {
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-financials"
  acl           = "private"
  force_destroy = true
  tags = merge({
    }, {
    yor_trace = "6c55629d-a111-4fa6-b779-41fac062eea2"
    }, {
    git_commit           = "6d1874d7aa9c8cd223e1b69abee38e3ab60dd907"
    git_file             = "terraform/aws-2/s3.tf"
    git_last_modified_at = "2022-01-04 19:59:09"
    git_last_modified_by = "mike70@gmail.com"
    git_modifiers        = "mike70"
    git_org              = "5toCode"
    git_repo             = "github-terragoat"
  })
}

resource "aws_s3_bucket" "operations" {
  # bucket is not encrypted
  # bucket does not have access logs
  bucket = "${local.resource_prefix.value}-operations"
  acl    = "private"
  versioning {
    enabled = true
  }
  force_destroy = true
  tags = merge({
    Name        = "${local.resource_prefix.value}-operations"
    Environment = local.resource_prefix.value
    }, {
    }, {
    yor_trace = "19e1ae8c-ed3c-4989-a881-0a0329d9c17a"
    }, {
    git_commit           = "6d1874d7aa9c8cd223e1b69abee38e3ab60dd907"
    git_file             = "terraform/aws-2/s3.tf"
    git_last_modified_at = "2022-01-04 19:59:09"
    git_last_modified_by = "mike70@gmail.com"
    git_modifiers        = "mike70"
    git_org              = "5toCode"
    git_repo             = "github-terragoat"
  })
}

resource "aws_s3_bucket" "data_science" {
  # bucket is not encrypted
  bucket = "${local.resource_prefix.value}-data-science"
  acl    = "private"
  versioning {
    enabled = true
  }
  logging {
    target_bucket = "${aws_s3_bucket.logs.id}"
    target_prefix = "log/"
  }
  force_destroy = true
  tags = {
    yor_trace            = "8ffb077a-54f8-4660-9d6b-f50b7922db26"
    git_commit           = "6d1874d7aa9c8cd223e1b69abee38e3ab60dd907"
    git_file             = "terraform/aws-2/s3.tf"
    git_last_modified_at = "2022-01-04 19:59:09"
    git_last_modified_by = "mike70@gmail.com"
    git_modifiers        = "mike70"
    git_org              = "5toCode"
    git_repo             = "github-terragoat"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${local.resource_prefix.value}-logs"
  acl    = "log-delivery-write"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "${aws_kms_key.logs_key.arn}"
      }
    }
  }
  force_destroy = true
  tags = merge({
    Name        = "${local.resource_prefix.value}-logs"
    Environment = local.resource_prefix.value
    }, {
    }, {
    yor_trace = "a4ba4883-ae73-4dbe-a8d8-030339f285e3"
    }, {
    git_commit           = "6d1874d7aa9c8cd223e1b69abee38e3ab60dd907"
    git_file             = "terraform/aws-2/s3.tf"
    git_last_modified_at = "2022-01-04 19:59:09"
    git_last_modified_by = "mike70@gmail.com"
    git_modifiers        = "mike70"
    git_org              = "5toCode"
    git_repo             = "github-terragoat"
  })
}
