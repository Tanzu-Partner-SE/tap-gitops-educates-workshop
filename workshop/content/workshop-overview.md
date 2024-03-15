# Tanzu Application Platform GitOps Workshop

Welcome! In this hands-on workshop, participants will learn GitOps benefits and best practices. They will bring their own Kubernetes cluster and perform a fresh deployment of TAP using the GitOps installer. They will experiment with incrementally adding new features, in-place upgrades, and uninstall-restore. We will discuss how to preconfigure working environments for pilots, so that customers are spending time getting value from TAP, not learning the install process.

### Prerequisites

Participants need to set up the following prerequisites before attending the workshop:
* A public-cloud Kubernetes environment, version 1.25 or higher
* [Cluster Essentials](https://docs.vmware.com/en/Cluster-Essentials-for-VMware-Tanzu/1.6/cluster-essentials/deploy.html) must be installed on the Kubernetes cluster.
* A container registry (GCR, ACR, or Harbor) with read/write access
* A wildcard domain (e.g. *.tap.mydomain.com) that the workshop participant owns. If you don't have one, it will be provided during the workshop.
* A [Github Developer Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic) with permissions to read and write to your repos
* Account credentials on [Tanzu Network](https://network.tanzu.vmware.com/)
* Current CLI tools for working with the environment: kubectl, [k9s](https://k9scli.io/topics/install/), git, [github](https://cli.github.com/manual/installation), [SOPS](https://github.com/mozilla/sops/releases) and [age](https://github.com/FiloSottile/age#installation) for encrypting secrets, [Carvel](https://carvel.dev/#install) and Tanzu CLI with plugins.

```dashboard:open-url
url: https://docs.vmware.com/en/VMware-Tanzu-Application-Platform/1.7/tap/overview.html
```

###### Short Video on TAP: 

```dashboard:open-url
url: https://www.youtube.com/watch?v=H6rbIkaJ1xc
```

<p style="color:blue"><strong> Easy path to production using VMware Tanzu Application Platform </strong></p>

```dashboard:open-url
url: https://www.youtube.com/watch?v=dbWSPQ9tTEk
```

<p style="color:blue"><strong> Improve Developer Experience using Tanzu Application Platform </strong></p>

```dashboard:open-url
url: https://www.youtube.com/watch?v=3p9lNSn8DSc
```

<p style="color:blue"><strong> Securing end to end Kubernetes application supply chain using Tanzu </strong></p>

```dashboard:open-url
url: https://www.youtube.com/watch?v=V5voRJJ6qTs
```
