resource "aws_instance" "tf-demo_server" {
  ami                    = "ami-0557a15b87f6559cf"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_Subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.ssh_key.key_name

  tags = {
    Name = "tf-demoserver"
    Env  = "Dev"
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJ/W9uFrbaY8d+4X2bEtCbCqu0a/1dnKCnZxXT5Iq31TkRtEQ4AhLsZIbPQ9xe4NuFjjdAJJDhDQUrIVNs7AmLcYKeVWGZMCnzyDxwdthM8r6HISBkISw8XsFyOhAZ+NrApDLkaYNligpZWwNOCOJa1GfAuSEd3nWlx71htB5QaqR7VUKZ69mruleGWP9ix1sXp3zv8Vmk4jnj9+pd3To5jrYAe7bTSzSUxmFyrhO7AnVySCg6y0lh2U4NCdcDgKKsp2dJlobXaKQbrg12YIIDREr4NXe/COr43mABDkdhIwcHFX/RqcQArDV1No0q0YjSnU+z0u8ksZEgPrq73mCajLmL4123F3iPWtmQWWrHgllvAF7h+SIf0xnf6cAZ2TIgX9Xeuo24ZY2lMvSOdJBRifT0+MWUxSfTSM3lpVJymBPw6T8BFPx1yJVePxtkQKj3XvsQLQmADlimo9GXxhYV95TPVjngSjfa/saYOVaiZ5+UmU6vHi7tQkTN7VW/RLs= chibuzo@chibuzoPC"

}