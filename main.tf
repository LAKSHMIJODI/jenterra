provider "aws" {
  access_key = "${var.accesskey}"
  secret_key = "${var.secretkey}"
  region = "${var.region}"
  }

resource "aws_instance" "web" {
  ami = "${var.ami}"
  instance_type = "${var.instance_type}"
  key_name = "jenkins"
  vpc_security_group_ids= ["${aws_security_group.allow_tls1.id}"]
  subnet_id="${aws_subnet.db.id}"
  associate_public_ip_address=true
  tags = {
    Name = "lakshmi"
  }

 connection {
    type = "ssh"
    user = "ubuntu"
    private_key = "${file("./jenkins.pem")}"

 }

provisioner "remote-exec" {
      inline = ["sudo apt-get update -y",
              "sudo apt-get install software-properties-common -y",
	            "sudo apt-add-repository --yes --update ppa:ansible/ansible -y",
	            "sudo apt-get install ansible -y"
             /* "sudo ansible-playbook -u ubuntu --private-key ./jenkins.pem ./local.yml" */
             /*"sudo ansible-playbook local.yml"*/]
      /*command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ./jenkins.pem local.yml"*/
      /*command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ./jenkins.pem local.yml"*/ 

  }
}


