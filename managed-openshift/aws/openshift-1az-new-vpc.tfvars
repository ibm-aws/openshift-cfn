##### AWS Configuration #####
region                = "us-east-1"

access_key_id         = "<required>"
secret_access_key     = "<required>"

##############################

 # Enter the number of availability zones the cluster is to be deployed, default is single zone deployment.
 az                   = "single_zone"

##########
# ROSA
##########

 cluster_name          = "<required>"
 rosa_token            = "<required>"
 worker_machine_type   = "m5.4xlarge"
 worker_machine_count  = 3 
 private_cluster       = false
 ocs                   = { "enable" : "false", "ocs_instance_type" : "m5.4xlarge" }  ##Install OCS storage
 efs                   = { "enable" : "true" } ##Install efs storage

#Storage
storage_option = "efs-ebs" # ocs,nfs,efs,efs-ebs ,
