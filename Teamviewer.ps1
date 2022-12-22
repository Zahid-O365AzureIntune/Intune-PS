###############################################################################################################################
<#

.DESCRIPTION
This script does the following tasks.

1. Copy PS file and Icon file to a specific folder.
2. Create a short cut in the desktop.

#>
################################################################################################################################

# Make directory for logs
$localpath = "C:\TV"
if (-not (Test-Path $localpath))
{
    mkdir $localpath
}
Start-Transcript "$localpath\Teamviewer.log" -Append

$SourcePath = Get-Location

# Copy items in a folder
if (-not (Test-Path "$localpath\TeamViewer_Host.msi"))
{
    $msiFile = "$SourcePath\TeamViewer_Host.msi"
    Copy-Item $msiFile $localpath
    Write-Host "msi file is copied."
}

Sleep -Seconds 5

cmd.exe /c 'msiexec.exe /i "C:\TV\TeamViewer_Host.msi" /qn CUSTOMCONFIGID=6yjjntb APITOKEN=12961472-Aof4pzBdv7AheoJHYKeX ASSIGNMENTOPTIONS=" --grant-easy-access"'

Stop-Transcript