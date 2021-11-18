resource "google_cloudbuild_trigger" "main-trigger" {
  trigger_template {
    project_id  = module.project-factory.project_id
    branch_name = "^main$"
    repo_name   = google_sourcerepo_repository.repo.name
  }

  filename = "cloudbuild.yaml"
  project  = module.project-factory.project_id

  substitutions = {
    "_REGION"     = var.region
    "_REPOSITORY" = "${var.region}-docker.pkg.dev/${module.project-factory.project_id}/docker-repository"
  }
}
