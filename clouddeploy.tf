resource "google_clouddeploy_delivery_pipeline" "cloud_deploy_pipeline" {
  location = var.region
  name     = "hello-app"
  project = module.project.project_id

  description = "main application pipeline"

  serial_pipeline {
    stages {
      profiles  = []
      target_id = "test"
    }

    stages {
      profiles  = []
      target_id = "prod"
    }
  }
}

resource "google_clouddeploy_target" "cloud_deploy_test_target" {
  location    = var.region
  name        = "test"
  description = "test cluster"

  gke {
    cluster = "projects/${module.project.project_id}/locations/${var.region}/clusters/test"
  }

  project          = module.project.project_id
  require_approval = false
}

resource "google_clouddeploy_target" "cloud_deploy_prod_target" {
  location    = var.region
  name        = "prod"
  description = "test cluster"

  gke {
    cluster = "projects/${module.project.project_id}/locations/${var.region}/clusters/prod"
  }

  project          = module.project.project_id
  require_approval = true
}
