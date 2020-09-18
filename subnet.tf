# サブネット（subnet）

# public-1a
resource "aws_subnet" "sample-app-public-subnet-1a" {
  vpc_id                  = "${aws_vpc.sample-app-vpc.id}"
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.prefix}-public-subnet-1a"
  }
}

# public-1c
resource "aws_subnet" "sample-app-public-subnet-1c" {
  vpc_id                  = "${aws_vpc.sample-app-vpc.id}"
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.prefix}-public-subnet-1c"
  }
}
