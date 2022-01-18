# Instructions

## 1. Build the image
run this from within the current directory
```bash
# Example docker build . -t harbor.vrabbi.cloud/library/tce-helper:0.9.1
docker build . -t <IMAGE NAME : TAG>
docker push <IMAGE NAME : TAG>
```
## 2. Update TCE\_HELPER\_IMAGE\_REF variable in the install-tanzu-software-default-values.yaml file
This file should be located in the .config/tanzu/tkg/providers/ytt/04\_user\_customizations/ folder.
if the file is not there, go to the folder in this repo at the path tce-customizations/installations/ and follow the README for instructions
