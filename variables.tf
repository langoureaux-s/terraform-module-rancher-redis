variable "project_name" {
    description = "The project name (environment name)"
}
variable "stack_name" {
    description = "The name for the Elasticsearch stack"
}
variable "finish_upgrade" {
  description = "Automatically finish upgrade on Rancher when apply new plan"
}
variable "label_global_scheduling" {
  description = "The label to use when schedule this stack as global scheduling"
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





