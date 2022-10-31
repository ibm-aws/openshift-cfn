# Red Hat OpenShift on AWS

Red Hat OpenShift uses cloud native services and features including VNets, VPCs, Availability Zones, security groups, Managed Disks, and Load Balancers to build a highly available, reliable, and scalable cloud platform.

This reference deployment provides Terraform scripts to deploy Red Hat OpenShift on a new Red Hat OpenShift Container Platform 4.10 cluster on AWS. This cluster includes:

 - A Red Hat OpenShift Container Platform cluster created in a new or existing VPC on Red Hat CoreOS (RHCOS) instances, using the [Red Hat OpenShift Installer Provisioned Infrastructure](https://docs.openshift.com/container-platform/4.10/architecture/architecture-installation.html).
 - A highly available storage infrastructure with OpenShift Data Foundation (ODF).  Elastic File System(EFS) and Elastic Block Store(EBS) on AWS.

## Prerequisites

### Step 1. Sign up for a Red Hat Subscription

This deployment requires a Red Hat subscription.  You’ll need to provide your [OpenShift Installer Provisioned Infrastructure pull secret](https://cloud.redhat.com/openshift/install).

If you don’t have a Red Hat account, you can register on the Red Hat website. (Note that registration may require a non-personal email address). To procure a 60-day evaluation license for OpenShift, follow the instructions at [Evaluate Red Hat OpenShift Container Platform](https://www.redhat.com/en/technologies/cloud-computing/openshift/try-it).
The OpenShift pull secret should be downloaded and the file location be made available to Terraform script parameters.

### Step 2. Storage Subscription

You can select one of the two container storages while installing this Quickstart.

Note: You also have the option to select NFS for Azure or EFS and EBS for AWS in which case there is no additional storage subscription required.

####	OpenShift Data Foundation (ODF) Subscription

The [Red Hat OpenShift Data Foundation](https://www.redhat.com/en/technologies/cloud-computing/openshift-data-foundation) license is linked as a separate entitlement to your RedHat subscription. If you do not have a separate subscription for ODF, a 60-day trial version is installed.
Note: OpenShift Container Storage(OCS) is now OpenShift Data Foundation starting from version 4.9.

## Deployment topology

See [AWS topology](aws/README.md#deployment-topology) for more details for AWS.

See [Azure topology](azure/README.md#deployment-topology) for more details for Azure.


## How to Deploy

You need to have [Terraform installed](https://learn.hashicorp.com/terraform/getting-started/install.html) on your client.

See [AWS deployment documentation](aws/README.md#steps-to-deploy) for AWS deployment.

See [Azure deployment documentation](azure/README.md#requirements) for Azure deployment.


## Scaling

The number of compute nodes in the cluster is controlled by [MachineSets](https://docs.openshift.com/container-platform/4.6/scalability_and_performance/recommended-cluster-scaling-practices.html).

To scale up or scale down the cluster:
* Find the MachineSet for the node in the region that you want to scale.

```bash
oc get machineset -n openshift-machine-api
```
* To manually increase or decrease the nodes in a zone, set the replicas to the desired count:
```bash
oc scale --replicas=<number of nodes for the machineset> machineset <machineset> -n openshift-machine-api
```


## Approving CSRs if nodes are rebooted for the first time

When nodes are rebooted for the first time after the cluster is created, the Certificate Signing Requests for the nodes need to
be approved by cluster administrator. Until this is done the oc client will not function. The CSRs can be approved by using the kube config
file created at the time of install.

 - change directory to directory where you executed terraform.
 - `cd installer-files`
 - Run this to get the list of CSRs needing approval

    ```
    $ oc --kubeconfig=auth/config get csr
    ```
 - Run this to approve all CSRs in a single step

    ```
    oc --kubeconfig=auth/config get csr -o name | xargs oc --kubeconfig=auth/config adm certificate approve
    ```
