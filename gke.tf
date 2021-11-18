module "gke-test" {
  source                   = "terraform-google-modules/kubernetes-engine/google"
  project_id               = module.project-factory.project_id
  name                     = "test"
  region                   = var.region
  network                  = module.vpc.network_name
  subnetwork               = module.vpc.subnets_names[0]
  ip_range_pods            = "${var.subnet}-gke-test-pods"
  ip_range_services        = "${var.subnet}-gke-test-services"
  remove_default_node_pool = true
}

module "gke-prod" {
  source                   = "terraform-google-modules/kubernetes-engine/google"
  project_id               = module.project-factory.project_id
  name                     = "prod"
  region                   = var.region
  network                  = module.vpc.network_name
  subnetwork               = module.vpc.subnets_names[0]
  ip_range_pods            = "${var.subnet}-gke-prod-pods"
  ip_range_services        = "${var.subnet}-gke-prod-services"
  remove_default_node_pool = true
}
