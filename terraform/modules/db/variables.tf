variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  description = "Path to the private key used for ssh access"
}
variable db_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-db-base"
}
variable subnet_id {
  description = "Subnet for modules"
}
variable provision_enable {
  description = "Provision switch"
  default     = false
}
