resource "aws_iam_role" "iam_for_lambda" {
  name = "${local.resource_prefix.value}-analysis-lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
  tags = {
    yor_trace            = "c806242f-28c5-478a-b0d7-7f9b9e8ff124"
    git_commit           = "6d1874d7aa9c8cd223e1b69abee38e3ab60dd907"
    git_file             = "terraform/aws-2/lambda.tf"
    git_last_modified_at = "2022-01-04 19:59:09"
    git_last_modified_by = "mike70@gmail.com"
    git_modifiers        = "mike70"
    git_org              = "5toCode"
    git_repo             = "github-terragoat"
  }
}

resource "aws_lambda_function" "analysis_lambda" {
  # lambda have plain text secrets in environment variables
  filename      = "resources/lambda_function_payload.zip"
  function_name = "${local.resource_prefix.value}-analysis"
  role          = "${aws_iam_role.iam_for_lambda.arn}"
  handler       = "exports.test"

  source_code_hash = "${filebase64sha256("resources/lambda_function_payload.zip")}"

  runtime = "nodejs12.x"

  environment {
    variables = {
      access_key = "AKIAIOSFODNN7EXAMPLE"
      secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
    }
  }
  tags = {
    yor_trace            = "fbd8b505-c770-4270-b63b-1141b3ab6555"
    git_commit           = "6d1874d7aa9c8cd223e1b69abee38e3ab60dd907"
    git_file             = "terraform/aws-2/lambda.tf"
    git_last_modified_at = "2022-01-04 19:59:09"
    git_last_modified_by = "mike70@gmail.com"
    git_modifiers        = "mike70"
    git_org              = "5toCode"
    git_repo             = "github-terragoat"
  }
}