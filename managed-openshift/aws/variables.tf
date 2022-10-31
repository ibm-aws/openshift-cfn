##### AWS Configuration #####
variable "region" {
  description = "The region to deploy the cluster in, e.g: us-west-2."
  default     = "ap-southeast-1"
}

variable "tenancy" {
  description = "Amazon EC2 instances tenancy type, default/dedicated"
  default     = "default"
}

variable "access_key_id" {
  type        = string
  description = "Access Key ID for the AWS account"

  validation {
    condition     = length(var.access_key_id) > 0
    error_message = "Access Key ID must be provided."
  }
}

variable "secret_access_key" {
  type        = string
  description = "Secret Access Key for the AWS account"

  validation {
    condition     = length(var.secret_access_key) > 0
    error_message = "Secret Access Key must be provided."
  }
}
##############################

variable "new_or_existing_vpc_subnet" {
  description = "For existing VPC and SUBNETS use 'exist' otherwise use 'new' to create new VPC and SUBNETS, default is 'new' "
  default     = "new"
}

##############################
# New Network
##############################
variable "vpc_cidr" {
  description = "The CIDR block for the VPC, e.g: 10.0.0.0/16"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr1" {
  default = "10.0.0.0/20"
}

variable "public_subnet_cidr2" {
  default = "10.0.16.0/20"
}

variable "public_subnet_cidr3" {
  default = "10.0.32.0/20"
}

variable "private_subnet_cidr1" {
  default = "10.0.128.0/20"
}

variable "private_subnet_cidr2" {
  default = "10.0.144.0/20"
}

variable "private_subnet_cidr3" {
  default = "10.0.160.0/20"
}

##############################
# Existing Network
##############################
variable "vpc_id" {
  default = ""
}
variable "public_subnet1_id" {
  default = ""
}

variable "public_subnet2_id" {
  default = ""
}

variable "public_subnet3_id" {
  default = ""
}

variable "private_subnet1_id" {
  default = ""
}

variable "private_subnet2_id" {
  default = ""
}

variable "private_subnet3_id" {
  default = ""
}
#############################

##########
# ROSA
##########
variable "openshift_version" {
  default = "4.10.34"
}

variable "cluster_name" {
  type    = string
  default = "ibmrosa"
}

variable "rosa_token" {
  type = string
}

variable "worker_machine_type" {
  type    = string
  default = "m5.4xlarge"
}

variable "worker_machine_count" {
  type    = number
  default = 3
}

variable "private_cluster" {
  type        = bool
  description = "Endpoints should resolve to Private IPs"
  default     = false
}

variable "cluster_network_cidr" {
  type    = string
  default = "10.128.0.0/14"
}

variable "cluster_network_host_prefix" {
  type    = number
  default = 23
}

variable "service_network_cidr" {
  type    = string
  default = "172.30.0.0/16"
}

# Enter the number of availability zones the cluster is to be deployed, default is single zone deployment.
variable "az" {
  description = "single_zone / multi_zone"
  default     = "single_zone"
}

variable "availability_zone1" {
  description = "example eu-west-2a"
  default     = ""
}

variable "availability_zone2" {
  description = "example eu-west-2b"
  default     = ""
}

variable "availability_zone3" {
  description = "example eu-west-2c"
  default     = ""
}

###################################
# Enable only one Storage option
###################################

variable "storage_option" {
  type = string
}

variable "ocs" {
  type = map(string)
  default = {
    enable            = false
    ocs_instance_type = "m5.4xlarge"
  }
}

# EFS - See known issues
variable "efs" {
  type = map(string)
  default = {
    enable            = true
  }
}
