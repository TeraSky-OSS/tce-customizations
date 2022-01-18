# TCE Helper Scripts
This repo contains scripts that can help manage a TCE Environment

## Content:
1. generate-tce-kubeconfigs.sh - this script will generate both per cluster and also a merged kubeconfig in 3 different formats:
  * admin kubeconfig
  * pinniped kubeconfig for use with a browser
  * pinniped kubeconfig for use without a browser
2. generate-tce-cluster-tf-config.sh - this script will generate a terraform config for deploying your TKG clusters
  * run this script with 1 variable which is the path to the cluster config file
  * you must have yq,jq and tfk8s installed on your machine
  * the script will output all needed files in a directory named with the new clusters name
3. add-tce-admin-contexts-to-kubeconfig.sh - this script will add all TCE cluster's admin contexts to your default kubeconfig
4. get-package-default-values.sh - this script will generate the default values for for a package
  * this requires yamlpath (https://github.com/wwkimball/yamlpath/) and jq
