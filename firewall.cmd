@echo off
rem Включить все профили и переключить в состояние блокировать все
netsh advfirewall set allprofiles state on 
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
rem netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound



call :firewalladd "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" "Mozilla Firefox"
call :firewalladd "C:\Program Files (x86)\Remote Manipulator System - Host\rutserv.exe" "RMS - Host"
call :firewalladd "C:\Program Files (x86)\rms\rutview.exe" "RMS - View"
call :firewalladd "C:\Program Files (x86)\Synergy\synergyc.exe" "Synergy Client"
call :firewalladd "C:\Program Files (x86)\Synergy\synergys.exe" "Synergy Server"

call :firewalladd "C:\Program Files\Far Manager\Far.exe" "Far Manager"
call :firewalladd "C:\Program Files\OpenVPN\bin\openvpn.exe" "openvpn"
call :firewalladd "C:\Program Files\OpenVPN\bin\openvpnserv.exe" "openvpnserv"

call :firewalladd "C:\Users\user\AppData\Local\Atlassian\SourceTree\git_local\cmd\git.exe"
call :firewalladd "C:\Users\user\AppData\Local\Atlassian\SourceTree\git_local\mingw32\libexec\git-core\git-remote-https.exe"
call :firewalladd "C:\Users\user\AppData\Local\SourceTree\app-2.0.20.1\SourceTree.exe"

call :firewalladd "C:\usr\bin\curl.exe" 
call :firewalladd "C:\usr\bin\wget.exe" 
call :firewalladd "C:\usr\BTSync\BTSync.exe"
call :firewalladd "C:\usr\putty\plink.exe"
call :firewalladd "C:\usr\putty\pscp.exe"
call :firewalladd "C:\usr\putty\psftp.exe"
call :firewalladd "C:\usr\putty\putty.exe"
call :firewalladd "C:\usr\securecrt\securecrt.exe" "SecureCRT Application"
call :firewalladd "C:\usr\Telegram\Telegram.exe"
call :firewalladd "C:\usr\WebDavMailRuCloud\wdmrc.exe" "WebDavMailRuCloud"
call :firewalladd "C:\usr\xming\xming.exe" "Xming X Server"

call :firewalladd "C:\Windows\System32\mstsc.exe"
call :firewalladd "C:\Windows\System32\nslookup.exe"
call :firewalladd "C:\Windows\System32\PING.EXE"
call :firewalladd "C:\Windows\System32\telnet.exe"
call :firewalladd "C:\Windows\System32\TFTP.EXE"

goto :firewalladdend

:firewalladd
set name=%2
IF DEFINED name ( 
    echo Deleting rule named %2 from all chains
    netsh advfirewall firewall delete rule name=%2
    echo Creating rule named %2 in OUT chain
    netsh advfirewall firewall add rule name=%2 dir=out action=allow program=%1 enable=yes profile=any
    echo Creating rule named %2 in IN chain
    netsh advfirewall firewall add rule name=%2 dir=in  action=allow program=%1 enable=yes profile=any
) ELSE (
    echo Deleting rule named %~n1 from all chains
    netsh advfirewall firewall delete rule name=%1
    echo Creating rule named %~n1 in OUT chain
    netsh advfirewall firewall add rule name=%~n1 dir=out action=allow program=%1 enable=yes profile=any
    echo Creating rule named %~n1 in IN chain
    netsh advfirewall firewall add rule name=%~n1 dir=in  action=allow program=%1 enable=yes profile=any
)
set name=
goto :eof
:firewalladdend

netsh advfirewall firewall delete rule name="Lockalnet"
netsh advfirewall firewall add rule name="Lockalnet" dir=in action=allow profile=any remoteip=localsubnet
netsh advfirewall firewall add rule name="Lockalnet" dir=out action=allow profile=any remoteip=localsubnet

netsh advfirewall firewall delete rule name="KMS"
netsh advfirewall firewall add rule name="KMS" dir=out action=allow  protocol=TCP remoteport=1688 enable=yes profile=any

netsh advfirewall firewall delete rule name="WindowsUpdate"
netsh advfirewall firewall add rule name="WindowsUpdate" dir=out action=allow service=wuauserv enable=yes profile=any

netsh advfirewall firewall delete rule name="BITS"
netsh advfirewall firewall add rule name="BITS" dir=out action=allow service=BITS enable=yes profile=any
  

netsh advfirewall firewall set rule dir=in name="Удаленный рабочий стол - RemoteFX (TCP - входящий)" new  enable=yes
netsh advfirewall firewall set rule dir=in name="Дистанционное управление рабочим столом (TCP - входящий)" new  enable=yes
netsh advfirewall firewall set rule dir=out name="Основы сетей - DNS (UDP - исходящий трафик)" new  enable=yes

netsh advfirewall firewall set rule dir=out name="Общий доступ к файлам и принтерам (эхо-запрос - исходящий трафик ICMPv4)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=out name="Общий доступ к файлам и принтерам (эхо-запрос - исходящий трафик ICMPv6)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=in  name="Общий доступ к файлам и принтерам (эхо-запрос - входящий трафик ICMPv4)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=in  name="Общий доступ к файлам и принтерам (эхо-запрос - входящий трафик ICMPv6)" new  enable=yes remoteip=any

netsh advfirewall firewall set rule dir=in  name="Сеть - эхо-запрос (ICMPv6 - входящий трафик)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=in  name="Сеть - эхо-запрос (ICMPv4 - входящий трафик)" new  enable=yes remoteip=any

:end