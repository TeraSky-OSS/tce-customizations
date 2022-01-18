# Setting Starboard Operator to be installed automatically on all TCE clusters
## Instructions
1. run the following when targetting the TCE management cluster
```bash
kubectl apply -f ./ -n <TARGETNAMESPACE>
```  
2. Deploy a workload cluster and see that the operator is installed and configured. this will also apply to all existing workload clusters.
