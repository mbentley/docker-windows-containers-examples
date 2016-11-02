FROM microsoft/windowsservercore:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

RUN mkdir c:\build\nginx\source &&\
  powershell -Command "wget -uri 'http://nginx.org/download/nginx-1.9.3.zip' -OutFile 'c:\nginx-1.9.3.zip'" &&\
  powershell -Command "Expand-Archive -Path C:\nginx-1.9.3.zip -DestinationPath C:\nginx -Force" &&\
  del c:\nginx-1.9.3.zip

COPY ./html /nginx/nginx-1.9.3/html/

WORKDIR /nginx/nginx-1.9.3
EXPOSE 80
ENTRYPOINT ["nginx.exe"]