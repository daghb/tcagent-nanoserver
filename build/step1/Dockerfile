FROM microsoft/nanoserver
# Alternatiuvely: FROM microsoft/windowsservercore:10.0.14393.1480
# Note: image version 10.0.14393.1480 is used, as installtion of MS Build Tools / Visual Studio fail on lates version per Sept. 10, 2017. Known issue @ Microsoft.

# Update with latest Windows Update packages
RUN powershell  $ci = New-CimInstance -Namespace root/Microsoft/Windows/WindowsUpdate -ClassName MSFT_WUOperationsSession; Invoke-CimMethod -InputObject $ci -MethodName ApplyApplicableUpdates
