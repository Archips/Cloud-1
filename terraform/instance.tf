resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "data" {
  size_in_gb = 5
  type = "l_ssd"
}

resource "scaleway_instance_security_group" "security-cloud-1" {
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = "22"
  }

  inbound_rule {
    action = "accept"
    port   = "443"
  }

  inbound_rule {
    action = "accept"
    port   = "80"
  }
}

resource "scaleway_instance_server" "cloud-1" {
  type  = "DEV1-S"
  image = "ubuntu_jammy"
  name  = "cloud-1-server"

  ip_id = scaleway_instance_ip.public_ip.id

  additional_volume_ids = [ scaleway_instance_volume.data.id ]

  root_volume {
    size_in_gb = 15
  }

  security_group_id = scaleway_instance_security_group.security-cloud-1.id
}

