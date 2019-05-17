$ErrorActionPreference = "Stop"

# Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$env:ChocolateyInstall = Convert-Path "$((Get-Command choco).path)\..\.."
Import-Module "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"

function Write-PackageInstall($package) {
  Write-Output ""
  Write-Output "----------------------------------------------"
  Write-Output "Installing $package"
  Write-Output "----------------------------------------------"
  Write-Output ""
}
function Install-ChocoPackage($package, $options) {
  Write-PackageInstall $package
  choco install -y $package $options
}

# NVM
Install-ChocoPackage nvm
refreshenv

#Nodejs (8.16.0 & 10.15.3)
nvm install 8.16.0

nvm install 10.15.3
nvm alias default 10.15.3

# Installing Git
Install-ChocoPackage git
Update-SessionEnvironment

# Google Cloud SDK
choco install -y gcloudsdk 

# AWS cli
Install-ChocoPackage awscli

# Azure cli
Install-ChocoPackage azure-cli

# JFrog cli
Install-ChocoPackage jfrog-cli

# jq
Install-ChocoPackage jq

# Kubernetes cli
Install-ChocoPackage kubernetes-cli
