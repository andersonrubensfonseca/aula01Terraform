provider "aws"{
    region = "us-east-1"
}

resource "aws_s3_bucket" "meu_bucket" {
  bucket = "aula01-terraform-02022024"
  acl    = "private"  
  
  versioning {
    enabled = true
  }
}
