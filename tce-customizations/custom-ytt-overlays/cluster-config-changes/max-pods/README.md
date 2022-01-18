# Setting Maximum Pods per Core on worker nodes and on control plane nodes
## Instructions
1. Create the following directory if it does not exist:
~/.config/tanzu/tkg/providers/ytt/04\_user\_customizations
2. move the 2 files in this folder to the folder you just created / validated exists
3. in your cluster config file you can add the following variables:
* CONTROL\_PLANE\_MAX\_PODS\_PER\_CORE
* WORKER\_MAX\_PODS\_PER\_CORE
4. this will take at runtime your CPU count config on MachineDeployments and KubeadmControlPlane objects and do the math to set the Max Pods value for the kubelet configuration
