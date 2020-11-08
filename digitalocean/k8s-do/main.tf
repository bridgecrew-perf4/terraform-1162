provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_kubernetes_versions" "version" {
  version_prefix = "1.18."
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name         = var.name
  region       = var.cluster_region
  version      = data.digitalocean_kubernetes_versions.version.latest_version

  node_pool {
    name       = "do-app"
    size       = var.node_size
    node_count = var.node_count
  }
}
