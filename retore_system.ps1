$A = Read-Host -Prompt "Ready to restore your system? "

if ($A -eq "y" -or $A -eq "yes"){
    Write-Output "Installing Apps!"
    $Apps2download = Get-Content $PSScriptRoot"/App2download.txt" 
    foreach ($app in $Apps2download) {
         winget install -e -h --id $app
        

         
    }
}