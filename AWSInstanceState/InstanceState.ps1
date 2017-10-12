<# Waits for Instance state to be anything but creating.
#>
Param([string]$instanceID, [string]$Region)
if(-not($instanceID)) { Throw "You must supply a value for -instanceID" }
if(-not($Region)) { Throw "You must supply a value for -Region" }

########## Edit For your Environment ##########
write-host "Waiting for "$instanceID " in " $Region "to be OK"
$sleepseconds = 20
#########################################################
### Do Not edit below this line
#########################################################
$CredPath = "C:\Scripts\aws.pwd"

# Import Secure Credentials to variable
$Cred = Import-Clixml $CredPath
# Convert credentials to secure String
$Cred.Password = $cred.Password | ConvertTo-SecureString
# Push Credentials to PSCredential variable that can be used
$Credentials = New-Object System.Management.Automation.PsCredential($Cred.UserName, $Cred.Password) 

#Output Credentials
$SecretKey = $Credentials.GetNetworkCredential().Password 
$AccessKey = $Credentials.GetNetworkCredential().UserName 

###################
$moduleName = "AWSPowerShell"
If (-not (Get-Module -name $moduleName)) {
    Import-Module -Name $moduleName 
}

$AWSCred=(Set-AWSCredentials -AccessKey $AccessKey -SecretKey $SecretKey -StoreAs vCommander)
Initialize-AWSDefaults -ProfileName vCommander -Region $Region
$Instance = Get-EC2InstanceStatus -InstanceId $instanceID
$counter=0

 Do {$Instance = Get-EC2InstanceStatus -InstanceId $instanceID
    $Status = $Instance.Status.Status.Value
    Start-Sleep -seconds $sleepseconds
    $counter= $counter +$sleepseconds
    Write-host $Status " after " $counter " seconds"
    if ($Status -ne "initializing") {
      $Status="Not_Initializing"}
    }
    Until(($Status -eq "Not_Initializing") -or ($Status -eq "ok"))
 #   Write-Host "Instance state is $Status"
