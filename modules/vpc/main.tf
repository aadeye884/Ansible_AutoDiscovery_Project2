#1 create vpc
resource "aws_vpc" "VPC" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

#2 create Public Subnet 1
resource "aws_subnet" "PubSn1" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.PubSn1_cidr
  availability_zone = var.az1

  tags = {
    Name = var.PubSn1
  }
}

#3 create Public Subnet 2
resource "aws_subnet" "PubSn2" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.PubSn2_cidr
  availability_zone = var.az2

  tags = {
    Name = var.PubSn2
  }
}

#4 create an IGW
resource "aws_internet_gateway" "Igw" {
  vpc_id = aws_vpc.VPC.id

  tags = {
    Name = var.igw_name
  }
}

#5 create public Subnet route table
resource "aws_route_table" "PubSnRT" {
  vpc_id = aws_vpc.VPC.id
  route {
    cidr_block = var.all
    gateway_id = aws_internet_gateway.Igw.id
    
  }
  tags = {
    Name = var.PubSnRT
  }
}

#6 create Route table Association for Public Subnet 1 
resource "aws_route_table_association" "PubRTAss1" {
  subnet_id      = aws_subnet.PubSn1.id
  route_table_id = aws_route_table.PubSnRT.id
}

#7 create Route table Association for Public Subnet 2
resource "aws_route_table_association" "PubRTAss2" {
  subnet_id      = aws_subnet.PubSn2.id
  route_table_id = aws_route_table.PubSnRT.id
}

#8 create Private Subnet 1
resource "aws_subnet" "PrvSn1" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.PrvSn1_cidr
  availability_zone = var.az1

  tags = {
    Name = var.PrvSn1
  }
}

#9 create Private Subnet 2
resource "aws_subnet" "PrvSn2" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.PrvSn2_cidr
  availability_zone = var.az2

  tags = {
    Name = var.PrvSn2
  }
}

#10 create elastic ip
resource "aws_eip" "EIP" {
  vpc = true
}
#11 create Nat gateway
resource "aws_nat_gateway" "NGW" {
  allocation_id = aws_eip.EIP.id
  subnet_id     = aws_subnet.PubSn1.id

  tags = {
    Name = var.Ngw_name
  }
}

#12 create private route table
resource "aws_route_table" "PrvSnRT" {
  vpc_id = aws_vpc.VPC.id
  route {
    cidr_block     = var.all
    nat_gateway_id = aws_nat_gateway.NGW.id
  }
  
  tags = {
    Name = var.PrvSnRT
  }
}

#13 create Route table Association for Private Subnet 1 
resource "aws_route_table_association" "PrvRTAss1" {
  subnet_id      = aws_subnet.PrvSn1.id
  route_table_id = aws_route_table.PrvSnRT.id
}

#14 create Route table Association for Private Subnet 2
resource "aws_route_table_association" "PrvRTAss2" {
  subnet_id      = aws_subnet.PrvSn2.id
  route_table_id = aws_route_table.PrvSnRT.id
}