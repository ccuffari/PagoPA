module "database" {
  source = "../../modules/database"

  databases      = var.databases
  admin_password = var.admin_password  # Variabile opzionale
}
