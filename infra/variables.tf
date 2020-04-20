variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

variable "server_name" {
    description = "Security group name for defining egress and ingress rules"
    type        = string
    default     = "foo_webserver"
}

variable "security_group_name" {
    description = "Security group name for defining egress and ingress rules"
    type        = string
    default     = "foo_webserver_sg"
}