FROM mbentley/win-oracle-jre7:latest

RUN mkdir "%ProgramFiles%\docker" &&\
  powershell -Command "wget -uri 'https://packages.docker.com/1.11/builds/windows/amd64/docker-1.11.2-cs5.exe' -OutFile $env:ProgramFiles\docker\docker.exe"

RUN powershell -Command "wget -uri 'https://github.com/git-for-windows/git/releases/download/v2.10.1.windows.1/Git-2.10.1-64-bit.exe' -OutFile 'c:\Git-2.10.1-64-bit.exe'" &&\
  .\Git-2.10.1-64-bit.exe /verysilent &&\
  del c:\Git-2.10.1-64-bit.exe

RUN setx /M PATH "%PATH%;%ProgramFiles%\git;%ProgramFiles%\docker"
COPY entrypoint.ps1 c:\entrypoint.ps1

ENTRYPOINT powershell -File c:\entrypoint.ps1
