resource "google_service_account" "gkeclusterk8s" {
  account_id = "gkeclusterk8s"
}

resource "google_container_node_pool" "nodepool" {
  name       = "nodepool"
  cluster    = google_container_cluster.gke.id
  node_count = 2
  location       = "us-central1"

  management {
    auto_repair  = true
    auto_upgrade = true
  }
   autoscaling {
    max_node_count = 1
    min_node_count = 1
  }

  upgrade_settings {
    max_surge       = 1
    max_unavailable = 1
  }
  
  
  node_config {
    preemptible  = true
    disk_size_gb = 10

    labels = {
      role = "general"
    }

    service_account = google_service_account.gkeclusterk8s.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }
}