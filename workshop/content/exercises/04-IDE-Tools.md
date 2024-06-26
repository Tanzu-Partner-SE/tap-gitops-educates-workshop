As we saw previously, Application Accelerator allows you to download your project template as a .zip file to your local machine, using the Web UI. Here, we are going to use a command-line tool to download the template to our workshop terminal session. The Tanzu CLI provides plugin features for working with Tanzu Application Platform. Let's download the project template:

```execute
tanzu accelerator generate {{ session_namespace }} --server-url https://accelerator.{{ ENV_VIEW_CLUSTER_DOMAIN }}
```

It was downloaded as a .zip file, so we'll need to unzip it:

```execute
unzip -o {{ session_namespace }}.zip
```

This is a Java web application, let's take a look at the source code:

```editor:open-file
file: /home/eduk8s/{{ session_namespace }}/src/main/java/com/partnertapdemo/partnertapdemo/HelloController.java
```

```execute
code-server -r /home/eduk8s/{{ session_namespace }}
```

With Learning Center, we are using the embedded Coder dev environment that runs in your browser. Of course, you can also code on your local machine using supported IDEs like Visual Studio Code and IntelliJ IDEA. Your scaffold code contains a **workload.yaml** file that can be used to deploy workload from VSCode with a single click. Look at the screenshot below:

![workload-apply](images/tap-workload-apply.png)
Now, let's change the label in the template file to add the workload as part of the partnertapdemo catalog. 

```editor:select-matching-text
file: {{ session_namespace }}/config/workload.yaml
text: "app.kubernetes.io/part-of: {{ session_namespace }}"
```

You can replace the selected text by typing in the code editor, or automatically apply a replacement string by clicking below:

```editor:replace-text-selection
file: {{ session_namespace }}/config/workload.yaml
text: "app.kubernetes.io/part-of: partnertapdemo"
```
Also, let's change the git url in the template file to your gitrepo. 

```editor:select-matching-text
file: {{ session_namespace }}/config/workload.yaml
text: "https://github.com/Eknathreddy09/{{ session_namespace }}-app"
```

You can replace the selected text by typing in the code editor, or automatically apply a replacement string by clicking below:

```editor:replace-text-selection
file: {{ session_namespace }}/config/workload.yaml
text: "https://github.com/Eknathreddy09/partnertapdemo-app"
```

But, Let's use another Developer Tooling in Tanzu Application Platform to run the application.

```editor:open-file
file: /home/eduk8s/{{ session_namespace }}/Tiltfile
``` 

Tiltfile was generated by Application Accelerator as part of our project template. If you've never used Tilt before, this script may seem like a lot. Let's kick it off, and then we'll talk through what it's doing. You can right click on the Tiltfile in the code editor, and select `Tanzu: Live Update Start` in the pop-up menu. **Or**, you can click on the command below to accomplish the same thing.

```editor:execute-command
command: tanzu.liveUpdateStart
```

![IDE app](images/IDE-2.png)

###### List the applications in tap-install namespace

```execute
tanzu apps workload list -n tap-workload
```

###### Get app details of {{ session_namespace }} in tap-install namespace

```execute
tanzu apps workload get {{ session_namespace }} -n tap-workload
```

**Note**: The Tiltfile script is going to deploy our application into our development environment, and it will take about 2.5 minutes to run to completion the first time. But don't worry! It is setting us up to run iterative deployments that will be much, much faster.

Verify the application status and should be in ready state as shown below: 

```
Knative Services
NAME                 READY   URL
{{ session_namespace }}   Ready   http://{{ session_namespace }}-tap-workload.apjworkshop.vmwareexploreindia.com
```

###### Access the application in a browser

```dashboard:open-url
url: http://{{ session_namespace }}-tap-workload.apjworkshop.vmwareexploreindia.com/
```

![IDE app](images/IDE-1.png)

