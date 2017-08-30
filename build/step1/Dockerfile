FROM microsoft/nanoserver
# Update with latest Windows Update packages
RUN powershell  $ci = New-CimInstance -Namespace root/Microsoft/Windows/WindowsUpdate -ClassName MSFT_WUOperationsSession; Invoke-CimMethod -InputObject $ci -MethodName ApplyApplicableUpdates
