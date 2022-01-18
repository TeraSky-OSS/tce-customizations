# Setting Cluster Role Bindings for relevant AD Groups automatically on all clusters
In TCE we get the ability to configure External Identity providers for authentication with our clusters via Pinniped.  
While this is great, by default no permissions are given in a cluster.  
This CRS resource will add the for an example 2 AD groups to the cluster and give them the relevant RBAC permissions based on our organizational standards.
This is meant to be an example and should be updated to reflect the group names and permissions you want to offer those groups.
This simple addition which you apply to any namespace in the management cluster you want to deploy clusters in, will make sure to create the RBAC resources on all TCE clusters.
## Instructions
1. Update the Group Names and Permissions in the default-rbac-config.yaml file
2. Run the following when targetting the TCE management cluster
```bash
kubectl apply -f default-rbac-config.yaml -n <TARGETNAMESPACE>
kubectl apply -f default-rbac-crs.yaml -n <TARGETNAMESPACE>
```  
3. Deploy a workload cluster and see that the RBAC config was configured as expected. this will also apply to all existing workload clusters.
