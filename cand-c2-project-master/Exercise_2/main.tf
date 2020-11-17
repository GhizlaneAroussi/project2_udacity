# Designate a cloud provider, region, and credentials
provider "aws" {
  access_key = "<Access key to be replaced>"
  secret_key = "<Secret key to be replaced>"
  region =  var.aws_region
}

provider "archive" {}

data "archive_file" "zip" {
  type        = "zip"
  source_file = "greet_lambda.py"
  output_path = "greet_lambda.zip"
}

resource "aws_lambda_function" "Udacity_lambda" {
  function_name = "greet_udacity"
  handler = "greet_lambda.lambda_handler"
  runtime = "python3.8"
  role="arn:aws:iam::593335954963:role/Lambda_role_project2"

  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256

  environment {
    variables = {
      greeting = "Hello udacity"
    }
  }
}
