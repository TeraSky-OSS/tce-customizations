FROM ubuntu:bionic
LABEL maintainer="Scott Rosenberg"
LABEL description="Container for installing TCE Extensions and Tanzu Advanced Suite Products"
RUN apt-get update -y \
    && apt-get install -y gzip curl wget perl jq ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN wget -O- https://carvel.dev/install.sh | bash
RUN curl -H "Accept: application/vnd.github.v3.raw" \
    -L https://api.github.com/repos/vmware-tanzu/community-edition/contents/hack/get-tce-release.sh | \
    bash -s v0.9.1 linux \
    && tar -zxvf tce-linux-amd64-v0.9.1.tar.gz \
    && cd tce-linux-amd64-v0.9.1 \
    && sed -i 's/sudo / /g' install.sh \
    && ALLOW_INSTALL_AS_ROOT=true ./install.sh
RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
COPY install-tanzu-software.sh ./
RUN curl -LO https://dl.k8s.io/release/v1.21.2/bin/linux/amd64/kubectl \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && curl -LO https://github.com/vmware-tanzu/velero/releases/download/v1.7.1/velero-v1.7.1-linux-amd64.tar.gz \
    && tar -zxvf velero-v1.7.1-linux-amd64.tar.gz \
    && mv velero-v1.7.1-linux-amd64/velero /usr/local/bin/velero
RUN rm -rf velero* tce-linux*
