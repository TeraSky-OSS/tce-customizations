# Setting Kyberno to be installed automatically on all TCE clusters
## Instructions
1. run the following when targetting the TCE management cluster
```bash
kubectl apply -f ./ -n <TARGETNAMESPACE>
```  
2. Deploy a workload cluster and see that Kyverno is installed and configured. this will also apply to all existing workload clusters.

## NOTE
We have not installed any Kyverno Policies yet as part of this CRS but those could easily be added if that is needed.
