if (Get-Module WingetTools) {
    Write-Host "WingetTools ps module is already installed."
} else {
    Write-Host "WingetTools ps module not installed. Installing module..."
    Install-Module WingetTools -SkipPublisherCheck -AcceptLicense -Force
}
# Install-Module WingetTools

# winget list
Get-WGPackage #-ID *
Get-WGUpgrade

(Get-WGInstalled <#-Source winget#>).count | gm