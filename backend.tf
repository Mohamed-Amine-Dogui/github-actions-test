terraform {
  backend "s3" {
    bucket         = "momobucketbackend"
    key            = "mystatefile.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "momo-s3-State"
    profile        = "MyAWS"
  }
}




# the s3 bucket "momobucketbackend" was deployed in an other project or manually 
# the dynamoDB table "momo-s3-State" was deployed in an other project or manually with a Primary Key of type LockID
