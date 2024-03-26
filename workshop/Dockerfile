FROM ghcr.io/vmware-tanzu-labs/educates-jdk21-environment:2.7
RUN curl --fail -sL -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip
RUN unzip /tmp/terraform.zip
USER root
RUN mv terraform /usr/local/bin/ 
RUN sudo dnf -y install azure-cli
USER 1001
