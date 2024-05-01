module "gke_cluster" {
  source = "github.com/MikityukVarvara/tf-google-gke-cluster"

  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = 2
}

resource "google_container_cluster" "week7" {
  name     = "week7"
  location = var.GOOGLE_REGION

  initial_node_count = 2
}

terraform {
  backend "gcs" {
    bucket = "week7-bucket"
    prefix = "terraform/state"
  }
}
