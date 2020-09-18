# インターネットゲートウェイ（internet_gateway）

resource "aws_internet_gateway" "sample-app-igw" {
  vpc_id = "${aws_vpc.sample-app-vpc.id}"

  tags = {
    Name = "${var.prefix}-igw"
  }
}
