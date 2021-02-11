provider "vsphere" {
  user           = "administrator@vcenter.local"
  password       = "CHANGE_ME"
  vsphere_server = "192.168.X.X"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" datacenter {
  name = "Datacenter"
}

data "vsphere_virtual_machine" template {
  name = "CentOS7-Template"
  datacenter_id = "${data.vsphere_datacenter.datacenter.id}"
}

data "vsphere_role" role1 {
  label = "Administrator"
}

resource "vsphere_entity_permissions" p1 {
  entity_id = data.vsphere_virtual_machine.template.id
  entity_type = "VirtualMachine"
  permissions {
    user_or_group = "domain.com\\Domain Users"
    propagate = true
    is_group = true
    role_id = data.vsphere_role.role1.id
  }
}

