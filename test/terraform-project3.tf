/* the land to build on , is the AWS VPC on aws  */

resource "aws_vpc" "my land"{
    cidr_block= "10.0.0.0/16"
}
/* 
the fence and the gate  */
resource "aws_security_group" "my_fence" {

    #connect to the land:

    vpc_id = aws_vpc.my_land.id

    #This is the "gate rule" (allow port 80)

    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0.0/0"] #(from anyone ip )
    }
#the house (the server )
resource "aws_instance" "proserver" {
ami = var.server_ami
instance_type = var.server size  
}
#this is the magic - Atach the server to the fence (security group)

vpc_security_group_ids = [aws_security_group.my_fence.id]
}
