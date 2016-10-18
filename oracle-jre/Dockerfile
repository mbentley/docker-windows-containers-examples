FROM microsoft/windowsservercore

COPY install_java.ps1 c:/
RUN powershell -Command "C:\install_java.ps1"

CMD ["C:\\jre7\\bin\\java.exe","-version"]
