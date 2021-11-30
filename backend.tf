# the s3 bucket "momobucketbackend" was deployed in an other project or manually 
# the dynamoDB table "momo-s3-State" was deployed in an other project or manually with a Primary Key of type LockID

terraform {
  backend "s3" {
    bucket         = "demostatebucket"
    key            = "demo_statefile.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "demo_terraform_lock"
    profile        = "MyAWS"
  }
}




