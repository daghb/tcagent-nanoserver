Write-Host 'Installing Build Tools'

### NOTE! The line below will install several Workloads and standalone components which may not fit your installation. 
### Please refer to https://docs.microsoft.com/en-us/visualstudio/install/workload-and-component-ids
### Build Tools component ids only: https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-build-tools
/install/vs_BuildTools.exe --quiet --norestart --includeRecommended --add Microsoft.VisualStudio.Workload.MSBuildTools --add Microsoft.VisualStudio.Workload.NetCoreBuildTools --add Microsoft.VisualStudio.Workload.VCTools --add Microsoft.VisualStudio.Workload.WebBuildTools --add Microsoft.Net.Component.4.6.2.SDK --add Microsoft.Net.Component.4.6.2.TargetingPack --add Microsoft.Net.Component.4.7.SDK --add Microsoft.Net.Component.4.7.TargetingPack --add Microsoft.Net.Component.4.5.1.TargetingPack

Write-Host 'Waiting for Build Tools background setup to start'
Start-Sleep -s 180

$loopit = $true

### Wait for installation sto end. Poll every 10 seconds
while ($loopit)
{
    if ((Get-Process "vs_installer" -ErrorAction SilentlyContinue) -ne $null)
    {
        Write-Host '.' -NoNewline
        Start-Sleep -s 10
    }
    else
    {
        $loopit = $false
    }
}
