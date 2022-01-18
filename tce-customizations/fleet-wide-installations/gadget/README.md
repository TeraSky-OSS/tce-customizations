# Installing Gadget on all TCE clusters automatically
TCE is an amazing distribution for kubernetes. as there is no Enterprise support, it is optimal for test and dev environments and in Prod it is suggested to use a Supported Distribution like TKGm.  
One challenge in Kubernetes is that shifting left in terms of security is key, however this is not an easy task.  
Our developers need to understand network policies, Security Contexts, SecComp profiles and much more in order to create secure deployments.  
Gadget is an OSS tool that helps with this by utilizing BPF technologies to detect current network flows and sys calls made by our pods and can suggest for us what security configurations and network policies we need in order to be with as little attack vectors as possible.
This CRS resource will deploy GAdget into our clusters automatically allowing our developers to simply install the CLI and begin getting the benefits automatically.
This simple addition which you apply to any namespace in the management cluster you want to deploy clusters in, will make sure to install Gadget on all TCE clusters.  
1. Install the Gadget CRS in the MAnagement Cluster namespace where you will be deploying clusters
```bash
kubectl apply -f gadget-crs.yaml -n <TARGETNAMESPACE>
```  
2. Deploy a workload cluster and see that Gadget was installed as expected. this will also apply to all existing workload clusters.
