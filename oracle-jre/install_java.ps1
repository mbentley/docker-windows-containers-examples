$source = "http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jre-7u80-windows-i586.exe"
$destination = "C:\jre-7u80-windows-i586.exe"
$client = new-object System.Net.WebClient
$cookie = "oraclelicense=accept-securebackup-cookie"
$client.Headers.Add([System.Net.HttpRequestHeader]::Cookie, $cookie)
$client.downloadFile($source, $destination)

powershell start-process -filepath C:\jre-7u80-windows-i586.exe -passthru -wait -argumentlist "/s,INSTALLDIR=C:\jre7,/L,c:/jre.log"

rm C:\jre-7u80-windows-i586.exe
