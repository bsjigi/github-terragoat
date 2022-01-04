resource "aws_kms_key" "logs_key" {
  # key does not have rotation enabled
  description = "${local.resource_prefix.value}-logs bucket key"

  deletion_window_in_days = 7
  tags = {
    yor_trace            = "a98cba9b-561a-42b5-9b84-d8fc59edaf1c"
    git_commit           = "6d1874d7aa9c8cd223e1b69abee38e3ab60dd907"
    git_file             = "terraform/aws-2/kms.tf"
    git_last_modified_at = "2022-01-04 19:59:09"
    git_last_modified_by = "mike70@gmail.com"
    git_modifiers        = "mike70"
    git_org              = "5toCode"
    git_repo             = "github-terragoat"
  }
}

resource "aws_kms_alias" "logs_key_alias" {
  name          = "alias/${local.resource_prefix.value}-logs-bucket-key"
  target_key_id = "${aws_kms_key.logs_key.key_id}"
}
