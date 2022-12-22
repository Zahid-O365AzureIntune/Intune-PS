# Make directory for logs
$localpath = "$($env:ProgramData)\Microsoft\Forticlient_7.0.5"
if (-not (Test-Path $localpath))
{
    mkdir $localpath
}
#Set-Content -Path "$localpath\Forticlient.ps1.tag" -Value "Installed"
Start-Transcript "$localpath\Forticlientlog.log" -Append

$SourcePath = Get-Location
# Copy items in a folder
<#
if (-not (Test-Path "$localpath\FortiClient.msi"))
{
    $MsiFile = "$SourcePath\FortiClient.msi"
    Copy-Item $MsiFile $localpath
    Write-Host "MSI file is copied."
}

Sleep -Seconds 5


# Copy mst in a folder



if (-not (Test-Path "$localpath\FortiClient.mst"))
{
    $mst_file = "$SourcePath\FortiClient-v7.0.5.mst"
    Copy-Item $mst_file $localpath
    Write-Host "MST file is copied."
}


Sleep -Seconds 5
#>

# Copy cmd file in a folder

if (-not (Test-Path "$localpath\resetFortiClient.cmd"))
{
    $cmd_file = "$SourcePath\resetFortiClient.cmd"
    Copy-Item $cmd_file $localpath
    Write-Host "MST file is copied."
}


Set-location $localpath
.\resetFortiClient.cmd

Sleep -Seconds 120
#Setting URL
<#
$get_path="C:\Program Files\Fortinet\FortiClient"

if(Test-Path $get-path)
{
	Set-Location $get_path
	.\FortiESNAC.exe -u
	Sleep -Seconds 10
	.\FortiESNAC.exe -r ems.rgf-hr.com
}

else
{
	Write-Host "Path Not Found, can not update URL"
}
#>
#Updating Transcription

if (Test-Path "C:\ProgramData\Microsoft\Forticlient_7.0.5")
{
     Write-Host "Folder is created"

}
else
{
    Write-Host "Could not create the folder"
}




Stop-Transcript