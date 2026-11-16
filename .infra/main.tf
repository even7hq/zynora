# The shared module lives on the Forgejo VM and publishes this repo on the host below.
# docker-compose.yml stays at the repo root. Dokploy does not deploy this repo.
# Today the host is the VM where Dokploy is installed.
# The Dokploy container name is removed after the image build, before the new one starts.

module "docs" {
  source = "/opt/forgejo/compose-ssh"

  source_patterns = [
    "Dockerfile",
    "package.json",
    "yarn.lock",
    "nayr.lock",
    "deploy/**",
    "docs/**",
    "icons/**",
    "lib/**",
    "scripts/**",
    "src/**",
    "tsconfig.lemon-plugin.json",
    ".infra/*",
  ]

  ssh_host        = "100.89.216.29"
  ssh_identity    = "/etc/atlantis/dokploy-deploy"
  remote_dir      = "/home/ubuntu/even7/zynora"
  compose_project = "zynora-docs"
  old_container   = "zynora-640lwe-zynora-docs-1"
}
