variable "project_id" {
  description = "The GCP project ID where Pub/Sub resources will be created"
  type        = string
}

variable "region" {
  description = "The region for Pub/Sub resources (Free Tier: us-central1, us-east1, us-west1)"
  type        = string
  default     = "us-central1"

  validation {
    condition     = contains(["us-central1", "us-east1", "us-west1"], var.region)
    error_message = "Region must be one of us-central1, us-east1, or us-west1."
  }
}

variable "topic_name" {
  description = "The name of the Pub/Sub topic"
  type        = string
  default     = "my-topic"
}

variable "message_retention_duration" {
  description = "The duration to retain messages in the topic"
  type        = string
  default     = "86600s"
}

variable "labels" {
  description = "Labels for the topic"
  type        = map(string)
  default     = { "environment" = "dev" }
}

variable "subscription_name" {
  description = "The name of the Pub/Sub subscription"
  type        = string
  default     = "my-subscription"
}

variable "ack_deadline_seconds" {
  description = "The acknowledgement deadline in seconds"
  type        = number
  default     = 20
}

variable "push_endpoint" {
  description = "The push endpoint URL (leave empty for pull subscription)"
  type        = string
  default     = ""
}

variable "push_attributes" {
  description = "Attributes for the push configuration"
  type        = map(string)
  default     = {}
}

variable "expiration_ttl" {
  description = "The TTL for the subscription expiration policy"
  type        = string
  default     = "86400s"
}

variable "min_retry_backoff" {
  description = "The minimum retry backoff duration"
  type        = string
  default     = "10s"
}

variable "max_retry_backoff" {
  description = "The maximum retry backoff duration"
  type        = string
  default     = "600s"
}

variable "enable_message_ordering" {
  description = "Whether to enable message ordering"
  type        = bool
  default     = false
}
