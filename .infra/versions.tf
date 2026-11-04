# State for the Zynora docs site. The container runs on the Dokploy VM.
# Atlantis inits this with `terraform init -input=false`, so the backend
# block has to carry the bucket. The Atlantis role can write this key.

terraform {
  required_version = ">= 1.17.0"

  backend "s3" {
    bucket       = "even7-sre-terraform-state"
    key          = "apps/zynora/docs/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}
