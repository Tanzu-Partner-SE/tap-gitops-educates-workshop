# Tanzu GitOps Reference Implementation on Azure

In order to get started quickly, Azure infrastructure (e.g. Azure Kubernetes Service (AKS), Azure Container Registry (ACR) and a jumpbox) can be scaffolded via Terraform. The jumpbox contains all of the tools installed required for this workshop.

## Required CLIs, Plugins and Accounts

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Terraform](https://www.terraform.io/)
- [Tanzu Network account](https://network.tanzu.vmware.com/)
  - [Refresh token](https://network.tanzu.vmware.com/users/dashboard/edit-profile)
- SSH Key
- Git provider account (e.g. GitHub, Bitbucket)
  - GitHub personal access token (optional)

Additionally, you will need to accept any Tanzu Application Platform EULAs.

## Configuration

Prepare the variables for installation

- `tanzu_network_refresh_token` (string) - The Tanzu network refresh token utilized to download software
- `tanzu_registry_username` (string) - The Tanzu network username
- `tanzu_rregistry_password` (string) - The Tanzu network password
- `ssh_private_key_path` (string) - The path to the private key.  
Used to SSH into the jumpbox.
    
  
- `ssh_private_key_passphrase_protected` (bool) - On whether the SSH key has a passphrase (true) or not (false)
- `ssh_public_key_path` (string) - The path to the public SSH key. Used in the setup of the jumpbox.
- `ssh_username` (string) - The name used when SSH'ing into the jumpbox

- `gh_username` (string) - Username of the GitHub account.
- `gh_token` (string) - Value of the GitHub personal access token.
  **NOTE:** For Azure, you must use an RSA SSH key, and it's recommended that your key indicate your desired SSH username (not email) or you may have validation issues with the Azure terraform module.  
  An SSH Key is already generated for you with username tapworkshopuser

  **NOTE:** If you choose to use a GitHub Personal Access Token, the minimum required scopes for the `gh` CLI are `repo` (all) and `read:org`. You can add scopes for your tokens in the [GitHub Token Settings](https://github.com/settings/tokens/).
Utilizing Terraform conventions, make a copy `terraform.tfvars.example` and remove the `.example` extension. Edit this file and add values. Descriptions of the values below:
  ```execute
  cd $HOME/infrastructure
  cp $HOME/infrastructure/terraform.tfvars.example $HOME/infrastructure/terraform.tfvars
  ``` 
  ```editor:open-file
  file: $HOME/infrastructure/terraform.tfvars
  ```
## Build Infrastructure

Sign in with Azure Portal
```execute
az login
```
Follow the instructions
Init the Terraform
```execute
terraform init
```
Plan the Terraform scripts
```execute
terraform plan
```
Apply the Terraform scripts
```execute
terraform apply -auto-approve
````

### Infrastructure Information

During the installation of this workshop, some infrastructure information will be required. To obtain it, run the following commands to get AKS and ACR information.


### SSH information, ACR and AKS info
```execute
terraform output
```
Note the ip address of your jumpbox
#### ACR admin password
```execute
terraform output azure_container_registry_password
```

### Jumpbox
#### Login to Jumpbox replace xx.xx.xx.xx with the ip address of the Jumpbox
```copy
ssh tapworkshopuser@xx.xx.xx.xx -i /home/eduk8s/azure-workshop-ssh -o StrictHostKeyChecking=no
```
The jumpbox contains a variety of tools as well as the kubeconfig for the AKS cluster. Installed tools:

- brew
- age
- Carvel
- direnv
- git
- gh (GitHub CLI)
- jq
- k9s
- kubectl
- Mozilla sops
- pivnet (Tanzu Network CLI)
- tree
- yq

After the tools are installed, automatic login into the Tanzu Network and GitHub will occur. Finally, the Tanzu CLI will be downloaded and installed as well as Cluster Essentials onto the AKS cluster.

## Cloud-init

During the setup of the jumpbox, [Cloud-init](https://cloudinit.readthedocs.io/) is utilized. Terraform will wait until this process is complete.

#### Troubleshooting

If for some reason Cloud-init fails, SSH into the jump server. You can run some of the commands below to help troubleshoot the issue.


Get the status of Cloud-init
```execute
cloud-init status
```

Check the Cloud-init log for errors in [cloud-config.yaml](./cloud-init/cloud-config.yaml)
```execute
sudo cat /var/log/cloud-init.log
```
Check the Cloud-init output log for errors in the [scripts](./scripts/)
```execute
sudo cat /var/log/cloud-init-output.log
```
Verify errors in the runcmd script
```execute
sudo vim /var/lib/cloud/instance/scripts/runcmd
```
## Caution!! only for recreating Jumpbox
Additionally, if you need to recreate the jumpbox, the Terraform command below will save some time by only recreating it:

```copy
terraform apply -auto-approve -replace="azurerm_linux_virtual_machine.jump-server-vm
```
