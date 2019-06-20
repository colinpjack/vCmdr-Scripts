$start_time = Get-Date

#Automation

Write-Output "Pulling Ansible Plugin"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/ansible/wfplugins-ansible-1.1.jar -Outfile c:\progra~1\embotics\vcommander\tomcat\wfplugins\wfplugins-ansible-1.1.jar
Write-Output "Pulling Email Attachment Plugin"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/email/wfplugins-email-1.1.jar -Outfile 
c:\progra~1\embotics\vcommander\tomcat\wfplugins\wfplugins-email-1.1.jar
Write-Output "Pulling Jenkins Plugin"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/jenkins/wfplugins-jenkins-1.0.jar -Outfile c:\progra~1\embotics\vcommander\tomcat\wfplugins\wfplugins-jenkins-1.0.jar
Write-Output "Pulling Saltstack Plugin"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/salt/wfplugins-saltstack-1.0.jar -Outfile c:\progra~1\embotics\vcommander\tomcat\wfplugins\wfplugins-saltstack-1.0.jar
Write-Output "Pulling Snapshot Plugin"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/snapshot/wfplugins-snapshot-1.0.jar -Outfile c:\progra~1\embotics\vcommander\tomcat\wfplugins\wfplugins-snapshot-1.0.jar
Write-Output "Pulling Terraform Plugin"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/terraform/wfplugins-terraform-1.1.jar -Outfile c:\progra~1\embotics\vcommander\tomcat\wfplugins\wfplugins-terraform-1.1.jar
Write-Output "Pulling Text Plugin"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/text/wfplugins-text-1.1.jar -Outfile c:\progra~1\embotics\vcommander\tomcat\wfplugins\wfplugins-text-1.1.jar


#K8s
Write-Output "Pulling Kubernetes Plugin"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/k8s/wfplugins-k8s-2.0.jar -Outfile c:\progra~1\embotics\vcommander\tomcat\wfplugins\wfplugins-k8s-2.0.jar
Write-Output "Pulling PKS Plugin"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/pks/wfplugins-pks-2.0.jar -Outfile c:\progra~1\embotics\vcommander\tomcat\wfplugins\wfplugins-pks-2.0.jar
Write-Output "Pulling AKS Plugin"
Invoke-WebRequest -uri https://github.com/Embotics/Plug-in-Workflow-Steps/raw/master/azure/wfplugins-azure-1.0.jar -Outfile c:\progra~1\embotics\vcommander\tomcat\wfplugins\wfplugins-azure-1.0.jar


Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
