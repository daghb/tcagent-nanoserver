rem @echo off
set vernum=8u144
set jdkbasename=jdk8
set tool7z="C:\Program Files\7-Zip\7z.exe"
set jdk_exe="%1"

echo Extracting '.rsrc/1033/JAVA_CAB10/111'
%tool7z% e %jdk_exe% .rsrc/1033/JAVA_CAB10/111
rem :: %tool7z% e %jdk_exe% .rsrc/1033/version.txt

echo Extracting '111'
extrac32 111

echo Removing '111'
del 111

echo Extracting 'tools.zip'
%tool7z% x tools.zip -otools

echo Removing 'tools.zip'
del tools.zip

echo Extracting '*.pack'
cd tools
for /r %%x in (*.pack) do .\bin\unpack200 -r "%%x" "%%~dx%%~px%%~nx.jar"

cd ..
ren tools %jdkbasename%-%vernum%

%tool7z% a -r -ttar %jdkbasename%-%vernum%.tar %jdkbasename%-%vernum%\*
%tool7z% a -tgzip %jdkbasename%-%vernum%.tar.gz %jdkbasename%-%vernum%.tar
copy %jdkbasename%-%vernum%.tar.gz ..\step3
rd /s /q %jdkbasename%-%vernum%
del *.tar
del *.tar.gz

echo Done - JDK in %jdkbasename%-%vernum%.tar.gz
