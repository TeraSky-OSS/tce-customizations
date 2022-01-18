# Multi Machine Deployment Clusters

## Pre Reqs
1. You must add the cluster plane "multimd" as per this repos instructions in the cluster-plan folder

## Installation
1. Copy the multi-md-overlay.yaml and multi-md-overlay-default-values.yaml files from this folder to the following path
~/.config/tanzu/tkg/providers/infrastructure-vsphere/ytt/

## Important node on usage
Variables that are customizable per MD currently are:
1. Datacenter
2. Datastore
3. Resource Pool
4. Network
5. Disk
6. CPU
7. Memory
8. Template
9. Autoscaling min and max
10. number of initial replicas
11. Labels

For each variable it will default to the standard variable eg VSPHERE_DATASTORE or VSPHERE_NETWORK etc.

The override variables are optional and are defined as <ORIGINAL PARAM NAME>_<Machine Deployment Number>. eg VSPHERE_NETWORK_3 for MD-3.
  
you must also set the ADDITIONAL_MD_COUNT variable in any multi MD clusters config file. the value is for any MD beyond MD-0 the cluster will have. eg. if i want 3 different MDs in my cluster MD-0,MD-1 and MD-2 the value of ADDITIONAL_MD_COUNT must be set to 2

Currently the implementation supports up to 15 additional Machine Deployments but can be extended very easily if more types of nodes are needed.
