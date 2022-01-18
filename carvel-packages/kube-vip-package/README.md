## Installing as a direct Package
1. apply the needed files
``` bash
kubectl apply -n tanzu-package-repo-global -f metadata.yaml
kubectl apply -n tanzu-package-repo-global -f package.yaml
```  
2. View what configuration options are available for the package
```bash
tanzu package available get kubevip.terasky.com/0.3.9 --values-schema
```
2. Create a values file with your specific values
``` bash
#For Example
cat <<EOF > values.yaml
vip_range: 10.100.100.100-10.100.100.150
agent_node_selector:
  tce.terasky.com/tier: frontend
EOF
```
3. Install the Package
``` bash
tanzu package install kubevip -p kubevip.terasky.com -v 0.3.9 -f values.yaml
```  
