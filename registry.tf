resource "google_artifact_registry_repository" "registry" {
  provider = google-beta

  location      = var.region
  repository_id = "docker-repository"
  format        = "DOCKER"
  project       = module.project-factory.project_id
}
