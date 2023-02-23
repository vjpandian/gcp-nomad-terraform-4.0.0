
provider "google-beta" {
  # Specify backend here
  backend "gcs" {
    bucket  = "tf-state-nomad-vijay"
    prefix  = "terraform/state"
  }
  credentials = "${file("terraform-sa.json")}"
  project = "dev-vijay-pandian"
  region  = "northamerica-northeast2"
  zone    = "northamerica-northeast2-a"
}

module "nomad" {
  # We strongly recommend pinning the version using ref=<<release tag>> as is done here
  source = "git::https://github.com/vjpandian/gcp-nomad-terraform-4.0.0.git//nomad-gcp?ref=main"

  zone            = "northamerica-northeast2-a"
  region          = "northamerica-northeast2"
  network         = "default"
  server_endpoint = "cci4.vijaypandian.xyz:4647"
}

output "module" {
  value = module.nomad
}
