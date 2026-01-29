locals {
  ssh_from_file =file("/home/vlad/netology_github/MyNetology/ter-homeworks/terraform-cloud/your_ssh_ed25519_key.pub")
metadata = {
    ssh-keys = "ubuntu:${local.ssh_from_file}"
    }
}