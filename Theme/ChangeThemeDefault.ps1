<# Reset the vCommander theme back to default.
           .SYNOPSIS
            
            .DESCRIPTION
            

            Tested with vCommander 6.1.2 using the following execute script step commandline:

            
            .EXAMPLE Command in vCommander
             
             powershell.exe c:\scripts\InstanceState.ps1 #{form1.background} #{form1.content}

            .LINK
           

#>
write-host "Updating vCommander Portal Colors back to Original"

#########################################################
### Do Not edit below this line
#########################################################

##Inject the updated CSS files##
cp C:\Scripts\repo\Theme\ui.custom.css.orig612 C:\progra~1\Embotics\vCommander\tomcat\webapps\portal\resources\css\ui.custom.css -force
write-host "Replaced ui.custom.css"
cp C:\Scripts\repo\Theme\ui.theme.css.orig612 C:\progra~1\Embotics\vCommander\tomcat\webapps\portal\resources\css\ui.theme.css -force
write-host "Replaced ui.theme.css"



