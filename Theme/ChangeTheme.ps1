<# Waits Updates the CSS files for vCommander themes.
           .SYNOPSIS
            
            .DESCRIPTION
            Udates ui.custom.css and ui.theme.css

            Tested with vCommander 6.1.2 using the following execute script step commandline:

            
            .EXAMPLE Command in vCommander
             
             powershell.exe c:\scripts\InstanceState.ps1 #{form1.background} #{form1.content}

            .LINK
           

#>
Param([string]$backgroundColor, [string]$contentColor, [string]$loginPanelColor)
if(-not($backgroundColor)) { Throw "You must supply a value for -backgroundColor" }
if(-not($contentColor)) { Throw "You must supply a value for -contentColor" }
if(-not($loginPanelColor)) { Throw "You must supply a value for -loginPanelColor" }

########## Edit For your Environment ##########
write-host "Updating vCommander Portal Colors"
write-host "Background =" $backgroundColor
write-host "Command =" $contentColor

#########################################################
### Do Not edit below this line
#########################################################


##Top Banner##

(Get-Content c:\Scripts\repo\Theme\ui.custom.css.orig612) | 
Foreach-Object {$_ -replace 'ff6e2a',$contentColor} |
Out-File c:\Scripts\repo\Theme\ui.custom.css


## Login Backgroud ##
(Get-Content c:\Scripts\repo\Theme\ui.custom.css) | 
Foreach-Object {$_ -replace 'F16531',$backgroundColor} |
Set-content c:\Scripts\repo\Theme\ui.custom.css

## Login panel##
(Get-Content c:\Scripts\repo\Theme\ui.custom.css) | 
Foreach-Object {$_ -replace 'body.login-screen #loginForm\:loginPanel{
	min-height:340px;
	margin:20px auto;
	background: #FFFFFF;','body.login-screen #loginForm\:loginPanel{
	min-height:340px;
	margin:20px auto;
	background: #'$loginPanelColor';'} |
Set-content c:\Scripts\repo\Theme\ui.custom.css


(Get-Content c:\Scripts\repo\Theme\ui.theme.css.orig612) | 
Foreach-Object {$_ -replace 'E6E6E6',$backgroundColor},
               {$_ -replace 'ff6e2a',$contentColor} |
Set-content c:\Scripts\repo\Theme\ui.theme.css


cp C:\Scripts\repo\Theme\ui.custom.css C:\progra~1\Embotics\vCommander\tomcat\webapps\portal\resources\css\ui.custom.css -force
write-host "Replaced ui.custom.css"
cp C:\Scripts\repo\Theme\ui.theme.css C:\progra~1\Embotics\vCommander\tomcat\webapps\portal\resources\css\ui.theme.css -force
write-host "Replaced ui.theme.css"



