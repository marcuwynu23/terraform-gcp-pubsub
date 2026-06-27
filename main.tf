provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_project_service" "pubsub_api" {
  service            = "pubsub.googleapis.com"
  disable_on_destroy = false
}

resource "google_pubsub_topic" "topic" {
  name                       = var.topic_name
  message_retention_duration = var.message_retention_duration
  labels                     = var.labels

  depends_on = [google_project_service.pubsub_api]
}

resource "google_pubsub_subscription" "subscription" {
  name                 = var.subscription_name
  topic                = google_pubsub_topic.topic.id
  ack_deadline_seconds = var.ack_deadline_seconds

  push_config {
    push_endpoint = var.push_endpoint
    attributes    = var.push_attributes
  }

  expiration_policy {
    ttl = var.expiration_ttl
  }

  retry_policy {
    minimum_backoff = var.min_retry_backoff
    maximum_backoff = var.max_retry_backoff
  }

  enable_message_ordering = var.enable_message_ordering

  depends_on = [google_pubsub_topic.topic]
}
