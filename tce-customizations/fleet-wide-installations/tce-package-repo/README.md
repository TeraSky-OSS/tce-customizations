# Setting The TCE Package Repo to be installed automatically
In TCE we get a Package Repo with many tools to install. due to current coupling with TKG as oart of the TKR implementation in Tanzu Framework, the TCE package repository is not added by default to clusters.  
This simple addition which you apply to any namespace in the management cluster you want to deploy clusters in, will make sure to install the TCE repo for you at cluster creation time on any TCE cluster.
## Instructions
1. run the following when targetting the TCE management cluster
```bash
kubectl apply -f tce-repo-crs.yaml -n <TARGETNAMESPACE>
```  
2. Deploy a workload cluster and see that the package repository was added. this will also apply to all existing workload clusters.
