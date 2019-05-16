FROM microsoft/mcr.microsoft.com/windows/servercore:ltsc2019
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ADD ./install.ps1 C:/Users/ContainerAdministrator/AppData/Local/Temp
RUN C:/Users/ContainerAdministrator/AppData/Local/Temp/install.ps1

# Enable this for faster iteration when trying to install new packages.
# This is for dev use ONLY. It should never be enabled in a final release.
#ADD ./edge.ps1 C:/Users/ContainerAdministrator/AppData/Local/Temp
#RUN C:/Users/ContainerAdministrator/AppData/Local/Temp/edge.ps1
