### Workshop Stages

Participants will run the workshop in stages, where they perform a base install of TAP 1.6, and then incrementally add features and capabilities to the environment. The GitOps repo produced in this workshop can be re-used for further activities, such as customer demos and pilots.

[**Stage 1: Perform a base install of Tanzu Application Platform**](Stage-1-Base-Install.md)

[**Stage 2: Enable Ingress to Tanzu Application Platform**](Stage-2-Ingress.md)

[**Stage 3: Add Namespace Provisioner to Tanzu Application Platform**](Stage-3-Namespace-Provisioner.md)

[**Stage 4: Configure Scanning-Testing Supply Chain**](Stage-4-Scanning-Testing.md)

[**Stage 5: Customize TAP Developer Portal**](Stage-5-Customize-TDP.md)

[**Stage 6: Blow it Away! Reinstall!**](Stage-6-reinstall.md)

### Verify Your Enviroment

Run the following commands to check to see if a few CLIs are functioning properly.


 ### Tanzu Network auth check
 ``` execute
pivnet eulas
```

### GitHub auth check
 ``` execute
gh auth status
```
### Tanzu CLI installed check
 ``` execute
tanzu version # should be v0.90 at least
```
### Tanzu CLI plugins check; reinstall via "tanzu plugin install --group vmware-tap/default:v1.6.1"
 ``` execute
tanzu plugin list
```


