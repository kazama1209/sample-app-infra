# ルートテーブル（route_table）

resource "aws_route_table" "sample-app-public-rt" {
  vpc_id = "${aws_vpc.sample-app-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.sample-app-igw.id}"
  }

  tags = {
    Name = "${var.prefix}-public-rt"
  }
}

resource "aws_route_table_association" "sample-app-public-rt-assoc-1a" {
  subnet_id      = "${aws_subnet.sample-app-public-subnet-1a.id}"
  route_table_id = "${aws_route_table.sample-app-public-rt.id}"
}

resource "aws_route_table_association" "sample-app-public-rt-assoc-1c" {
  subnet_id      = "${aws_subnet.sample-app-public-subnet-1c.id}"
  route_table_id = "${aws_route_table.sample-app-public-rt.id}"
}
