tanzu cluster list -o json | jq -r .[].name | while read i; do tanzu cluster kubeconfig get --admin $i; done
