resource "local_file" "manifest" {
  content  = templatefile("./clouddeploy.tpl", { PROJECT_ID = module.project-factory.project_id, REGION = var.region })
  filename = "clouddeploy.yaml"
}

module "clouddeploy_cmd" {
  source = "terraform-google-modules/gcloud/google"

  platform              = "darwin"
  additional_components = ["beta"]
  skip_download         = true

  create_cmd_entrypoint  = "gcloud"
  create_cmd_body        = "beta deploy apply --file=${local_file.manifest.filename} --region=${var.region} --project=${module.project-factory.project_id}"
  destroy_cmd_entrypoint = "gcloud"
  destroy_cmd_body       = "beta deploy delete --file=${local_file.manifest.filename} --region=${var.region}  --project=${module.project-factory.project_id} --force"
}
