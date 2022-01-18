# Setting The Bitnami Package Repo to be installed automatically
In TCE we get a Package Repo with many tools to install. 
Many tools we may want to install are available today via the bitnami Helm Chart repository.  
This automation is based on https://github.com/TeraSky-OSS/helm-to-carvel-conversion-tool.  
This installs the Package repository generated via the conversion tool into your cluster.  
by doing this we can have the same experience of installing Tanzu Packages for the entire bitnami helm chart repo!!!  
## Instructions
1. run the following when targetting the TCE management cluster
```bash
kubectl apply -f bitnami-pkgr-crs.yaml -n <TARGETNAMESPACE>
```  
2. Deploy a workload cluster and see that the package repository was added. this will also apply to all existing workload clusters.


## Important Note
The package repository adds close to 1000 packages to the system (96 unique packages with the last 10 versions of each).
if you want to use kubectl to get all the packages, you will need to change the chunk-size used by kubectl as by default it will only return 500 items.
```bash
kubectl get packages --chunk-size=1000
```

