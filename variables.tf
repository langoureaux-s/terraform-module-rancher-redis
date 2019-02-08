variable "project_name" {
    description = "The project name (environment name)"
}
variable "stack_name" {
    description = "The name for the Elasticsearch stack"
}
variable "finish_upgrade" {
  description = "Automatically finish upgrade on Rancher when apply new plan"
}
variable "scale" {
  description = "Set the number of instance you should.Don't use it if you should global_scheduling as true"
  default = ""
}
variable "label_scheduling" {
  description = "The label to use when schedule this stack"
  default = ""
}
variable "global_scheduling" {
  description = "Set to true if you should to deploy on all node that match label_scheduling"
  default     = "true"
}

variable "image_version" {
  description = "The image version of Redis to use"
  default = "4.0.9-alpine"
}
variable "max_memory" {
  description = "The maximum memory allowed to Redis in bytes"
}
variable "data_path" {
  description = "The data path"
}
variable "container_memory" {
  description = "The maximum of memory that Redis container can consume"
  default = ""
}
variable "cpu_shares" {
  description = "The maximum of CPU usage that Redis container can consume"
  default = "1024"
}





