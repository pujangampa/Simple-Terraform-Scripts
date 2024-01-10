provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-0c7217cdde317cfec"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
    key_name      = "tf-login" # Key must be downloaded in local
    tags = {
            Name="first-instance"
        }

}
