terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "consul" {}
}

# Template provider
provider "template" {
  version = "~> 1.0"
}

# Get the project data
data "rancher_environment" "project" {
  name = "${var.project_name}"
}


data "template_file" "docker_compose_redis" {
  template = "${file("${path.module}/rancher/redis/docker-compose.yml")}"

  vars {
    label_global_scheduling = "${var.label_global_scheduling}"
    image_version           = "${var.image_version}"
    container_memory        = "${var.container_memory}"
    cpu_shares              = "${var.cpu_shares}"
    data_path               = "${var.data_path}"
    max_memory              = "${var.max_memory}"
  }
}
data "template_file" "rancher_compose_redis" {
  template = "${file("${path.module}/rancher/redis/rancher-compose.yml")}"

  vars {
  }
}
resource "rancher_stack" "this" {
  name            = "${var.stack_name}"
  description     = "Redis"
  environment_id  = "${data.rancher_environment.project.id}"
  scope           = "user"
  start_on_create = true
  finish_upgrade  = "${var.finish_upgrade}"
  docker_compose  = "${data.template_file.docker_compose_redis.rendered}"
  rancher_compose = "${data.template_file.rancher_compose_redis.rendered}"
}