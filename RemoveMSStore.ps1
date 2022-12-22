 ###############################################################################################################################
<#

<#
.DESCRIPTION
	This script will remove Microsoft Store from TaskBar
#>
################################################################################################################################
 
 # Making log folder and starting Transcript
$localpath = "C:\Intune\MSStore-Taskbar"
if (-not (Test-Path $localpath))
{
    mkdir $localpath
}

Start-Transcript -Path "$localpath\MSStore-Taskbar.log" -Append

#Unpin Microsoft Store from Taskbar

try {
    $exec = $false
    $appname = "Microsoft Store"
    ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $appname}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt(); $exec = $true}
    If ($exec = $True) { Write-Host "Microsoft Store is removed from Taskbar" } 

} Catch { Write-Error "Error in unpinng Microsoft Store from Taskbar" }

Stop-Transcript