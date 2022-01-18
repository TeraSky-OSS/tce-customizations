# TCE Customization Repo
This repository containes experimental examples for how to customize TCE to provision clusters with additional capabilities beyond the standard offering of TCE.
The repository is not well documented currently and does not follow in all cases best practices and should be used as a starting point / point of reference and not considered by any means as production ready at this point. 
There are 4 main folders in the Repo:
1. docker-image - containes scripts and a Dockerfile to build a docker image needed for running many of the custom installations
2. tce-customizations - YAML / YTT templates for customizing TCE
3. tce-helper-scripts - A set of scripts to help manage TCE
4. carvel-packages - A set of custom packages built for use on TCE
  
## Key Functionality included in this repo
### 1. Create Clusters with Multiple Machine Deployments
By default TCE only creates a single Machine Deployment (MD-0) 
there are many use cases where a homogeneous cluster is not optimal and we need to go down a hetrogeneous cluster approach. 
Examples: 
1. Nodes of different sizes
2. Nodes with Different OSes
3. Nodes with GPUs and nodes without GPUs
4. Nodes on different underlying networks

### 2. Install TCE Extensions Automatically
TCE comes with optional extensions that you can install which will provide additional capabilities to your cluster.
The TCE Extensions currently are:
1. Monitoring - Prometheus + Grafana
2. Ingress (Layer 7 Load Balancing) - Contour
3. DNS Management for services and ingress resources - External DNS
4. Log Aggregation - FluentBit
5. Container Registry - Harbor
6. Backup and Restore - Velero
7. Networking - Multus

While these extensions are available and supported, there is no OOTB way to install them automatically on every new cluster. this repo contains A way to do this

### 3. Automated installation of Tanzu Advanced Products
If we have purchased Tanzu Advance, we may want to automate the deployment of the different operators provided automatically on all of are clusters.
Examples:
1. Auto install the Tanzu RabbitMQ Operators
2. Auto install the Tanzu MySQL Operator
3. Auto install the Tanzu Postgres Operator
4. Auto install Tanzu Build Service

### 4. Attach clusters to external systems
Kubernetes clusters many times need to be attached to external systems. these could be Tanzu SaaS offerings or different solutions.
Examples:
1. Add cluster as a K8s endpoint in VROPS for monitroing
2. Attach cluster to Tanzu Mission Control (TMC)
3. Attach cluster to Tanzu Observability (Wavefront)

### 5. Trusting an internal CA Certificate
Many times we need our clusters to trust an organizations internal CA. in order to do this we must add custom YTT templates and the CA PEM file in order for it to be trusted automatically by all nodes

### 6. Installing Custom CNIs
While TCE comes with calico and antrea, we may want a different version of one of those CNIs or an entirely different CNI. in this repo we have automations built to do:
1. Cilium CNI
2. Calico Operator based installation - including routable Pods and Typha
3. Antrea 1.3 with the new NSX-T interworking integration

### 7. MUCH MUCH MORE!!!!!!!
