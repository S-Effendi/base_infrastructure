variable "region" {
  type        = string
  default     = "af-south-1"
  validation {
    condition     = contains(["eu-west-1", "af-south-1"], var.region)
    error_message = "Please use af-south-1 to avoid unwanted costs"
  }
}
