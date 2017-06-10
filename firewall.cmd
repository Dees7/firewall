netsh advfirewall firewall show rule name="wget" verbose
netsh advfirewall firewall show rule name=all verbose
netsh advfirewall firewall add rule name="wget" dir=out action=allow program="C:\upd\wget.exe" enable=yes profile=any

netsh advfirewall firewall add rule name="ping" dir=out action=allow program="C:\Windows\System32\PING.EXE" enable=yes profile=any
netsh advfirewall firewall add rule name="nslookup" dir=out action=allow program="C:\Windows\System32\nslookup.exe" enable=yes profile=any
netsh advfirewall firewall add rule name="nslookup" dir=in action=allow program="C:\Windows\System32\nslookup.exe" enable=yes profile=any

netsh advfirewall firewall add rule name="RMS - Host" dir=out action=allow program="C:\Program Files (x86)\Remote Manipulator System - Host\rutserv.exe" enable=yes profile=any
netsh advfirewall firewall add rule name="RMS - View" dir=out action=allow program="C:\Program Files (x86)\rms\rutview.exe" enable=yes profile=any
netsh advfirewall firewall add rule name="KMS" dir=out action=allow  remoteport=1688 enable=yes profile=any

netsh advfirewall firewall set rule dir=in name="Удаленный рабочий стол - RemoteFX (TCP - входящий)" new  enable=yes
netsh advfirewall firewall set rule dir=in name="Дистанционное управление рабочим столом (TCP - входящий)" new  enable=yes

netsh advfirewall firewall set rule dir=out name="Основы сетей - DNS (UDP - исходящий трафик)" new  enable=yes

netsh advfirewall firewall set rule dir=out name="Общий доступ к файлам и принтерам (эхо-запрос - исходящий трафик ICMPv4)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=in  name="Сеть - эхо-запрос (ICMPv4 - входящий трафик)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=out name="Общий доступ к файлам и принтерам (эхо-запрос - исходящий трафик ICMPv6)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=in  name="Сеть - эхо-запрос (ICMPv6 - входящий трафик)" new  enable=yes remoteip=any
