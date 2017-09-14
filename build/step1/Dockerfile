FROM microsoft/windowsservercore:10.0.14393.1480
# Note: image version 10.0.14393.1480 is used, as installtion of MS Build Tools / Visual Studio fail on lates version per Sept. 10, 2017. Known issue @ Microsoft.
# If you want to use nanoserver instead, use the FROM statement below instead
# FROM microsoft/nanoserver

# Update with latest Windows Update packages
RUN powershell  $ci = New-CimInstance -Namespace root/Microsoft/Windows/WindowsUpdate -ClassName MSFT_WUOperationsSession; Invoke-CimMethod -InputObject $ci -MethodName ApplyApplicableUpdates
RUN powershell /install/setEnvironment.ps1
