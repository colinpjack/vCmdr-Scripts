<# Creates Credentials on disk

            .SYNOPSIS
            Creates an encrypted password file so you don't need to put passwords in plaintext in your scripts.

            .EXAMPLE
            createCredential.ps1 -path c:\Scripts\password.txt
            
            .LINK
            https://www.pdq.com/blog/secure-password-with-powershell-encrypting-credentials-part-1/

#>

Param([string]$Path)
if(-not($Path)) { Throw "You must supply a file. syntax: createCredential.ps1 -path c:\Scripts\password.txt" }
# Prompt for Credentials and allow them to be editable
$cred = (Get-Credential) | Select-Object *
# Convert Password from Securestring to Hash
$cred.Password = $cred.Password | ConvertFrom-SecureString
# Export credentials to the path above
$cred | Export-Clixml $path 

