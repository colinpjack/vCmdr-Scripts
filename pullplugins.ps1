param(
        [Parameter(Mandatory=$false)]
        [String] $cmdrpath = "c:\progra~1\embotics\vcommander\tomcat\wfplugins\"
        )


$start_time = Get-Date

#Automation

Write-Output "Pulling Ansible Plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/ansible/wfplugins-ansible-1.0.jar -Outfile ($cmdrpath + "wfplugins-ansible-1.0.jar")
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/ansible/wfplugins-ansible-1.1.jar -Outfile ($cmdrpath + "wfplugins-ansible-1.1.jar")

Write-Output "Pulling Email Attachment Plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/email/wfplugins-email-1.0.jar -Outfile ($cmdrpath + "wfplugins-email-1.0.jar")
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/email/wfplugins-email-1.1.jar -Outfile ($cmdrpath + "wfplugins-email-1.1.jar") 

Write-Output "Pulling Jenkins Plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/jenkins/wfplugins-jenkins-1.0.jar -Outfile ($cmdrpath + "wfplugins-jenkins-1.0.jar")

Write-Output "Pulling Saltstack Plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/salt/wfplugins-saltstack-1.0.jar -Outfile ($cmdrpath + "wfplugins-saltstack-1.0.jar")

Write-Output "Pulling Snapshot Plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/snapshot/wfplugins-snapshot-1.0.jar -Outfile ($cmdrpath + "wfplugins-snapshot-1.0.jar")

Write-Output "Pulling Terraform Plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/terraform/wfplugins-terraform-1.0.jar -Outfile ($cmdrpath + "wfplugins-terraform-1.0.jar")
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/terraform/wfplugins-terraform-1.1.jar -Outfile ($cmdrpath + "wfplugins-terraform-1.1.jar")

Write-Output "Pulling Text Plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/text/wfplugins-text-1.0.jar -Outfile ($cmdrpath + "wfplugins-text-1.0.jar")
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/text/wfplugins-text-1.1.jar -Outfile ($cmdrpath + "wfplugins-text-1.1.jar")

Write-Output "Pulling AWSRUN plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/blob/master/awsruncmd/wfplugins-awsrunoscommand-1.0.jar -Outfile ($cmdrpath + "wfplugins-awsrunoscommand-1.0.jar")

Write-Output "Pulling AZURERUN Plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/blob/master/azureruncmd/wfplugins-azureruncommand-1.0.jar -Outfile ($cmdrpath + "wfplugins-azureruncommand-1.0.jar")

#K8s
Write-Output "Pulling Kubernetes Plugins"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/k8s/wfplugins-k8s-1.0.jar -Outfile ($cmdrpath + "wfplugins-k8s-1.0.jar")
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/k8s/wfplugins-k8s-2.0.jar -Outfile ($cmdrpath + "wfplugins-k8s-2.0.jar")

Write-Output "Pulling PKS Plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/pks/wfplugins-pks-1.0.jar -Outfile ($cmdrpath + "wfplugins-pks-1.0.jar")
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/pks/wfplugins-pks-2.0.jar -Outfile ($cmdrpath + "wfplugins-pks-2.0.jar")

Write-Output "Pulling AKS Plugins..."
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/azure/wfplugins-azure-1.0.jar -Outfile ($cmdrpath + "wfplugins-azure-1.0.jar")


Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
