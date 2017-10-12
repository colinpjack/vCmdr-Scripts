<# Waits for Instance state to be anything but initializing.

            .SYNOPSIS
            Waits for Instance state to be anything but initializing.  AWS Tool for Windows Powershell must be installed for this script to work.

            .EXAMPLE (from vCommander Execute Script Step)
            
            powershell.exe c:\scripts\InstanceState.ps1 #{target.instanceType.remoteId} #{target.region.name}
            
            .LINK
            https://aws.amazon.com/powershell/

#>

[CmdletBinding()]
	param(
        [Parameter(Mandatory=$true)]
        [String] $instanceID = $(Throw "You must supply a value for -instanceID"),
        [String] $Region = $(Throw "Provide the region to Continue.")
        ) 

########## Edit For your Environment ##########

$CredPath = "C:\Scripts\aws.pwd"

#########################################################
### Do Not edit below this line
#########################################################

$moduleName = "AWSPowerShell"
If (-not (Get-Module -name $moduleName)) {
	Import-Module -Name $moduleName 
}

$Cred = Import-Clixml $CredPath
$Cred.Password = $cred.Password | ConvertTo-SecureString
$Credentials = New-Object System.Management.Automation.PsCredential($Cred.UserName, $Cred.Password) 
$SecretKey = $Credentials.GetNetworkCredential().Password
$AccessKey = $Credentials.GetNetworkCredential().UserName

$AWSCred=(Set-AWSCredentials -AccessKey $AccessKey -SecretKey $SecretKey -StoreAs vCommander)
Initialize-AWSDefaults -ProfileName vCommander -Region $Region
$Instance = Get-EC2InstanceStatus -InstanceId $instanceID

 Do {$Instance = Get-EC2InstanceStatus -InstanceId $instanceID
    $Status = $Instance.Status.Status.Value
    Start-Sleep -seconds 10
    Write-host $Status
        if ($Status -ne "initializing") {
        $Status="Not_Initializing"}
        }
    Until(($Status -eq "Not_Initializing") -or ($Status -eq "ok"))
    Write-Host "Instance state is $Status"
