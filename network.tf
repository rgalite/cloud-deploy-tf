module "vpc" {
  source = "terraform-google-modules/network/google"

  project_id   = module.project-factory.project_id
  network_name = var.network

  subnets = [
    {
      subnet_name   = var.subnet
      subnet_ip     = var.subnet_ip
      subnet_region = "europe-west1"
    },
  ]

  secondary_ranges = {
    (var.subnet) = [
      {
        range_name    = "${var.subnet}-gke-dev-pods"
        ip_cidr_range = "192.168.0.0/22"
      },
      {
        range_name    = "${var.subnet}-gke-dev-services"
        ip_cidr_range = "192.169.0.0/22"
      },
      {
        range_name    = "${var.subnet}-gke-test-pods"
        ip_cidr_range = "192.170.0.0/22"
      },
      {
        range_name    = "${var.subnet}-gke-test-services"
        ip_cidr_range = "192.171.0.0/22"
      },
      {
        range_name    = "${var.subnet}-gke-prod-pods"
        ip_cidr_range = "192.172.0.0/22"
      },
      {
        range_name    = "${var.subnet}-gke-prod-services"
        ip_cidr_range = "192.173.0.0/22"
      },
    ]
  }
}
