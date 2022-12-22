###############################################################################################################################
<#

.DESCRIPTION
 This script is to create Registry key for Windows 10 Account Extension in Chrome Browser

#>
################################################################################################################################

# Making log folder and starting Transcript
$localpath = "C:\Intune\Chrome - Windows 10 Extension"
if (-not (Test-Path $localpath))
{
    mkdir $localpath
}

Start-Transcript -Path "$localpath\Chrome - Windows 10 Extension.log" -Append

# Check for Existing Reg Key
try
  {
    New-Itemproperty -path "HKLM:\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist\" -PropertyType String -Name 2 -value "ppnbnpeolgkicgegkbkbjmhlideopiji;https://clients2.google.com/service/update2/crx"
    write-host "Chrome - Windows 10 registry Key is created" 
  }
catch
  {
    return "Exception $_."
    break
  }

Stop-Transcript