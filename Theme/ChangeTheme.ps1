<# Waits Updates the CSS files for vCommander themes.
           .SYNOPSIS
            
            .DESCRIPTION
            Udates ui.custom.css and ui.theme.css

            Tested with vCommander 6.1.2 using the following execute script step commandline:

            
            .EXAMPLE Command in vCommander
             
             powershell.exe c:\scripts\InstanceState.ps1 #{form1.background} #{form1.content}

            .LINK
           

#>
Param([string]$backgroundColor, [string]$contentColor)
if(-not($backgroundColor)) { Throw "You must supply a value for -backgroundColor" }
if(-not($ContentColor)) { Throw "You must supply a value for -contentColor" }

########## Edit For your Environment ##########
write-host "Updating vCommander Portal Colors"

#########################################################
### Do Not edit below this line
#########################################################

(Get-Content c:\repo\vCmdrScripts\ui.custom.orig612) | 
Foreach-Object {$_ -replace 'F16531',$backgroundColor}
               {$_ -replace 'FF6E2A',$contentColor}  | 
Out-File c:\repo\vCmdr-Scripts\ui.custom.css

(Get-Content c:\repo\vCmdrScripts\ui.theme.orig612) | 
Foreach-Object {$_ -replace 'F16531',$backgroundColor}
               {$_ -replace 'FF6E2A',$contentColor}  | 
Out-File c:\repo\vCmdr-Scripts\ui.theme.css

