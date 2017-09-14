# TeamCity Agent on Nano Server / Windows Server Core on Docker

### Purpose
Step by step build a Windows TeamCity Build Agent on Docker, suitable for .NET Core builds (Nano Server) and .NET Framework builds (Windows Server Core)

### Prerequisites
* Running TeamCity Server
* Available TeamCity Agent license(s)
* Latest Docker for Windows installed
* Windows Features "Containers" enabled (When starting Docker for Windows, this feature will be prompted for and added)
* 7zip is required in the build process and should be installed in the "C:\Program files\7-zip" folder

### How do I build my docker image?
You will build the image using the latest nano server image from Microsoft as a base image. Please follow the instructions below closely

##### Step 1
1. Start a CMD prompt
2. cd into build\step1
3. If you want to build a Windows Server Core image instead of a Nano Server one, edit Dockerfile, comment "FROM microsoft/nanoserver", uncomment "FROM microsoft/windowsservercore..." in the Dockerfile
4. Run build.cmd

This will download the nanoserver image and run windows update on it
##### Step 2
1. cd into ..\step2
2. Download the latest Windows JDK exe file from http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
3. Run ```pack-jdk-64.cmd path-and-filename-of-the-downloaded-jdk-exe-file```

This optional step takes care of the unpacking and repacking of the necessary JDK files into a .tar.gz file that will be put on ..\step3. Thanks to https://github.com/smaudet for the base packing file
##### Step 3
1. cd into ..\step3
2. Run build.cmd

This step will upload the JDK to Nano Server, unpack it and set the JAVA_HOME environment variable
##### Step 4
1. cd into ..\step4
2. Edit the .\buildAgent.properties file and insert your own server's name/port (serverUrl parameter) and the name of the build agent (name parameter)
3. Edit the Dockerfile and eventually the installMSBuildTools.ps1 (if you enable MS Build Tools install in Dockerfile). Several tools and options may be included by uncommenting lines in the Dockerfile
4. Run build.cmd
5. Run run.cmd
6. cd into BuildAgent\buildAgent\bin folder and start the agent with "agent start"
7. Bring up your TeamCity Server admin console and authorize the new agent as it asks for permission to connect
8. After a while, the agent will download and install all plugins and make itself available on the default pool

This step will install the Build Agent files and prepare the environment config files. **Note**: The supplied run.cmd is for testing only. You should definitely not be giving the build agent a static name when running the container
