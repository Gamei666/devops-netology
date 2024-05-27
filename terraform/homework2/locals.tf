locals {
    vmname = {
     vm1="${var.vm_web.name}-${var.vms_resources.web.cores}-${var.vms_resources.web.memory}"
     vm2="${var.vm_db.name}-${var.vms_resources.db.memory}-${var.vms_resources.db.memory}"
    }
}


