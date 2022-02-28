resource "aws_iam_user" "user" {
  name          = "${local.resource_prefix.value}-user"
  force_destroy = true

  tags = merge({
    Name        = "${local.resource_prefix.value}-user"
    Environment = local.resource_prefix.value
    }, {
    }, {
    yor_trace = "7af7cae0-7f32-4fbb-bffb-c6d1033a6527"
    }, {
    git_commit           = "6d1874d7aa9c8cd223e1b69abee38e3ab60dd907"
    git_file             = "terraform/aws-2/iam.tf"
    git_last_modified_at = "2022-01-04 19:59:09"
    git_last_modified_by = "mike70@gmail.com"
    git_modifiers        = "mike70"
    git_org              = "5toCode"
    git_repo             = "github-terragoat"
  })

}

resource "aws_iam_access_key" "user" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "userpolicy" {
  name = "excess_policy"
  user = "${aws_iam_user.user.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "s3:*",
        "lambda:*",
        "cloudwatch:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

output "username" {
  value = aws_iam_user.user.name
}

output "secret" {
  value = aws_iam_access_key.user.encrypted_secret
}

