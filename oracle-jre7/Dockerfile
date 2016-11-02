FROM microsoft/windowsservercore

COPY install_java.ps1 c:/
RUN powershell -Command "C:\install_java.ps1"
RUN setx /M PATH "%PATH%;c:\jre7\bin"
