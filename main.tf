module "project-factory" {
  source                  = "terraform-google-modules/project-factory/google"
  random_project_id       = true
  name                    = var.project_name
  org_id                  = var.organization_id
  billing_account         = var.billing_account
  default_service_account = "deprivilege"

  activate_apis = [
    "compute.googleapis.com",
    "container.googleapis.com",
    "sourcerepo.googleapis.com",
    "clouddeploy.googleapis.com",
    "artifactregistry.googleapis.com",
  ]
}

module "org-policy-requireOsLogin" {
  source = "terraform-google-modules/org-policy/google"

  policy_for  = "project"
  constraint  = "compute.requireOsLogin"
  project_id  = module.project-factory.project_id
  policy_type = "boolean"
  enforce     = false
}

module "org-policy-requireShieldedVm" {
  source = "terraform-google-modules/org-policy/google"

  policy_for  = "project"
  constraint  = "compute.requireShieldedVm"
  project_id  = module.project-factory.project_id
  policy_type = "boolean"
  enforce     = false
}

module "org-policy-vmCanIpForward" {
  source = "terraform-google-modules/org-policy/google"

  policy_for  = "project"
  constraint  = "compute.vmCanIpForward"
  project_id  = module.project-factory.project_id
  policy_type = "list"
  enforce     = false
}

module "org-policy-vmExternalIpAccess" {
  source = "terraform-google-modules/org-policy/google"

  policy_for  = "project"
  constraint  = "compute.vmExternalIpAccess"
  project_id  = module.project-factory.project_id
  policy_type = "list"
  enforce     = false
}

module "org-policy-restrictVpcPeering" {
  source = "terraform-google-modules/org-policy/google"

  policy_for  = "project"
  constraint  = "compute.restrictVpcPeering"
  project_id  = module.project-factory.project_id
  policy_type = "list"
  enforce     = false
}

module "project-iam-bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  projects = [module.project-factory.project_id]
  mode     = "additive"

  bindings = {
    "roles/clouddeploy.admin" = [
      "serviceAccount:${module.project-factory.project_number}@cloudbuild.gserviceaccount.com",
    ]

    "roles/editor" = [
      "serviceAccount:${module.project-factory.project_number}-compute@developer.gserviceaccount.com",
    ]
  }
}
