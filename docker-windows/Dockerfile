FROM microsoft/nanoserver:latest

RUN powershell -Command "Invoke-WebRequest -UseBasicParsing -OutFile "docker.zip" https://download.docker.com/components/engine/windows-server/17.06/docker-17.06.1-ee-2.zip" &&\
  powershell -Command "Expand-Archive docker.zip -DestinationPath $Env:ProgramFiles" &&\
  powershell -Command "Remove-Item -Force docker.zip"

RUN setx /M PATH "%PATH%;c:\Program Files\docker"