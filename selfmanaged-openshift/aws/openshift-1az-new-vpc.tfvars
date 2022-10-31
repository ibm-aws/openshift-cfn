region                          = "<required>"
az                              = "single_zone"
availability_zone1              = "<required>"
access_key_id                   = "<required>"
secret_access_key               = "<required>"
base_domain                     = "<required>"

cluster_name                    = "openshift-1az-new-vpc"
worker_replica_count            = 3
openshift_pull_secret_file_path = "<required>"
public_ssh_key                  = "<required>"
openshift_username              = "ocadmin"
openshift_password              = "<required>"

######################################
# Storage Options: Enable only one   #
######################################
efs                  = { "enable" : "true" }  #Install efs storage
#ocs                 = { enable: true, ami_id: "", dedicated_node_instance_type: "m5.4xlarge"} #Install ocs storage

storage_option = "efs-ebs" # ocs,nfs,efs,efs-ebs ,
##################################################################### DEFAULTS ##################################################################

#key_name                      = "openshift-key"
#tenancy                       = "default"
#new_or_existing_vpc_subnet    = "new"
#availability_zone2            = ""
#availability_zone3            = ""
enable_permission_quota_check = false

##############################
# New Network
##############################
#vpc_cidr             = "10.0.0.0/16"
#master_subnet_cidr1  = "10.0.0.0/20"
#master_subnet_cidr2  = "10.0.16.0/20"
#master_subnet_cidr3  = "10.0.32.0/20"
#worker_subnet_cidr1  = "10.0.128.0/20"
#worker_subnet_cidr2  = "10.0.144.0/20"
#worker_subnet_cidr3  = "10.0.160.0/20"

##############################
# Existing Network
##############################
#vpc_id            = ""
#master_subnet1_id = ""
#master_subnet2_id = ""
#master_subnet3_id = ""
#worker_subnet1_id = ""
#worker_subnet2_id = ""
#worker_subnet3_id = ""

##################################
# New Openshift Cluster Variables
##################################
#worker_instance_type          = "m5.4xlarge"
#worker_instance_volume_iops   = 2000
#worker_instance_volume_size   = 300
#worker_instance_volume_type   = "io1"
#master_instance_type          = "m5.2xlarge"
#master_instance_volume_iops   = 4000
#master_instance_volume_size   = 300
#master_instance_volume_type   = "io1"
#master_replica_count          = 3
#cluster_network_cidr          = "10.128.0.0/14"
#cluster_network_host_prefix   = 23
#service_network_cidr          = "172.30.0.0/16"
#private_cluster               = false
#enable_fips                   = true
#enable_autoscaler             = false

#openshift_version       = "4.10.15"
