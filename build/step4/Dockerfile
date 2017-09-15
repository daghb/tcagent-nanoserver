FROM tctest/javawindowsserver

ADD buildAgent.tar.gz C:\\BuildAgent
ADD buildAgent.properties C:\\BuildAgent\\buildAgent\\conf\\buildAgent.properties

### Add if you build ClickOnce Windows clients
# ADD ClickOnceBootstrapper.tar.gz C:\\ClickOnceBootstrapper

### Add if your TeamCity installation uses GIT
# ADD https://github.com/git-for-windows/git/releases/download/v2.14.1.windows.1/Git-2.14.1-64-bit.exe /install/git-install.exe
# ADD GitOptions.txt /install
# RUN /install/git-install.exe /VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh" /LOADINF="/install/GitOptions.txt"

### Add if you use NPM
# ENV NPM_CONFIG_LOGLEVEL info
# ENV NODE_VERSION 6.11.2
# ENV NODE_SHA256 b8a7f49baece10b01a51145edc95d5093e385e9e598a38f2e66c247caf6d0286
# RUN powershell -Command \
#     $ErrorActionPreference = 'Stop' ; \
#     (New-Object System.Net.WebClient).DownloadFile('https://nodejs.org/dist/v%NODE_VERSION%/node-v%NODE_VERSION%-win-x64.zip', 'node.zip') ; \
#     if ((Get-FileHash node.zip -Algorithm sha256).Hash -ne $env:NODE_SHA256) {exit 1} ; \
#     Expand-Archive node.zip -DestinationPath C:\ ; \
#     Rename-Item 'C:\node-v%NODE_VERSION%-win-x64' 'C:\nodejs' ; \
#     $env:PATH = 'C:\nodejs;' + $env:PATH ; \
#     [Environment]::SetEnvironmentVariable('PATH', $env:PATH, [EnvironmentVariableTarget]::Machine) ; \
#     Remove-Item -Path node.zip

### Add if you use MS Build Tools (msbuild etc)
# ADD https://aka.ms/vs/15/release/vs_buildtools.exe /install/vs_buildtools.exe
### BUG in Visual Studio which makes ToolsVersion in .csproj files complain. Bot lines below can be removed after MS Build Tools 15.5
# ENV VSINSTALLDIR C:\\Program Files (x86)\\Microsoft Visual Studio\\2017\\BuildTools
# ENV VisualStudioVersion 15.0
# ADD installMSBuildTools.ps1 /install
# RUN powershell.exe /install/installBuildTools.ps1

### Add if you wish to use Telnet
# RUN powershell.exe -Command Install-WindowsFeature Telnet-Client

