terraform {
  backend "gcs" {
   bucket = "tf-state-nomad-vijay"
   prefix = "cci4-nomad"
  }
  required_providers {
    google = {
      version = "~> 3.0"
      # NOTE: This can be set to hashicorp/google once scaling_schedules are
      # out of beta on google_compute_autoscaler resources
      source = "hashicorp/google-beta"
    }
  }
    provider "google-beta" {
      credentials = "${file("terraform-sa.json")}"
      project = "dev-vijay-pandian"
      region  = "northamerica-northeast2"
      zone    = "northamerica-northeast2-a"
}
}
