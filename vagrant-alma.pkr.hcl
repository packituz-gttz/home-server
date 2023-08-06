source "vagrant" "almalinux9" {
  communicator = "ssh"
  source_path  = "almalinux/9"
  provider     = "virtualbox"
  add_force    = true
  box_name     = "almalinux-server/9"
  box_version  = "20230605.0.0"
}

build {
  name    = "almalinux-server"
  sources = ["source.vagrant.almalinux9"]
#  provisioner "shell" {
#    inline = [
#      "sudo yum update -y",
#      "sudo yum install libX11 libXt libXext libXmu kernel-devel -y",
#    ]
#  }

  provisioner "ansible" {
    playbook_file   = "./gui_server.yml"
    use_proxy = false
    extra_arguments = [
#      "--tags=os-setup",
      "-vvv",
#      "--ask-vault-password"
#      "--ssh-extra-args",
#      "'-o StrictHostKeyChecking=no'",
#      "--ssh-extra-args",
#      "'-o PreferredAuthentications=password'"
#      "--extra-vars",
#      "ansible_ssh_pass=vagrant ansible_user=vagrant"
    ]
    ansible_env_vars = [
      "ANSIBLE_HOST_CHECKING=False",
    ]
  }
}
