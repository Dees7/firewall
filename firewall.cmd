@echo off
rem ������� �� ��䨫� � ��४����� � ���ﭨ� �����஢��� ��
netsh advfirewall set allprofiles state on 
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound
rem netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound


call :firewalladd "C:\usr\bin\wget.exe"
call :firewalladd "C:\usr\bin\curl.exe"
call :firewalladd "C:\usr\BTSync\BTSync.exe"
call :firewalladd "C:\usr\securecrt\securecrt.exe" "SecureCRT Application"
call :firewalladd "C:\usr\Telegram\Telegram.exe"
call :firewalladd "C:\usr\WebDavMailRuCloud\wdmrc.exe" "WebDavMailRuCloud"

call :firewalladd "C:\Program Files (x86)\Mozilla Firefox\firefox.exe" "Mozilla Firefox"
call :firewalladd "C:\Program Files (x86)\Remote Manipulator System - Host\rutserv.exe" "RMS - Host"
call :firewalladd "C:\Program Files (x86)\rms\rutview.exe" "RMS - View"
call :firewalladd "C:\Program Files\Far Manager\Far.exe" "Far Manager"
call :firewalladd "C:\Program Files (x86)\Synergy\synergys.exe" "Synergy Server"
call :firewalladd "C:\Program Files (x86)\Synergy\synergyc.exe" "Synergy Client"

call :firewalladd "C:\Windows\System32\mstsc.exe"
call :firewalladd "C:\Windows\System32\PING.EXE"
call :firewalladd "C:\Windows\System32\nslookup.exe"
call :firewalladd "C:\Windows\System32\TFTP.EXE"
call :firewalladd "C:\Windows\System32\telnet.exe"

goto :firewalladdend

:firewalladd
set name=%2
IF DEFINED name ( 
    echo Deleting rule named %2
    netsh advfirewall firewall delete rule name=%2
    echo Creating rule named %2
    netsh advfirewall firewall add rule name=%2 dir=out action=allow program=%1 enable=yes profile=any
    netsh advfirewall firewall add rule name=%2 dir=in  action=allow program=%1 enable=yes profile=any
) ELSE (
    echo Deleting rule named %1
    netsh advfirewall firewall delete rule name=%1
    echo Creating rule named %1
    netsh advfirewall firewall add rule name=%1 dir=out action=allow program=%1 enable=yes profile=any
    netsh advfirewall firewall add rule name=%1 dir=in  action=allow program=%1 enable=yes profile=any
)
set name=
goto :eof
:firewalladdend

netsh advfirewall firewall add rule name="Lockalnet" dir=in action=allow profile=any remoteip=localsubnet
netsh advfirewall firewall add rule name="Lockalnet" dir=out action=allow profile=any remoteip=localsubnet
netsh advfirewall firewall add rule name="KMS" dir=out action=allow  protocol=TCP remoteport=1688 enable=yes profile=any

netsh advfirewall firewall set rule dir=in name="�������� ࠡ�稩 �⮫ - RemoteFX (TCP - �室�騩)" new  enable=yes
netsh advfirewall firewall set rule dir=in name="���⠭樮���� �ࠢ����� ࠡ�稬 �⮫�� (TCP - �室�騩)" new  enable=yes
netsh advfirewall firewall set rule dir=out name="�᭮�� �⥩ - DNS (UDP - ��室�騩 ��䨪)" new  enable=yes

netsh advfirewall firewall set rule dir=out name="��騩 ����� � 䠩��� � �ਭ�ࠬ (��-����� - ��室�騩 ��䨪 ICMPv4)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=out name="��騩 ����� � 䠩��� � �ਭ�ࠬ (��-����� - ��室�騩 ��䨪 ICMPv6)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=in  name="��騩 ����� � 䠩��� � �ਭ�ࠬ (��-����� - �室�騩 ��䨪 ICMPv4)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=in  name="��騩 ����� � 䠩��� � �ਭ�ࠬ (��-����� - �室�騩 ��䨪 ICMPv6)" new  enable=yes remoteip=any

netsh advfirewall firewall set rule dir=in  name="���� - ��-����� (ICMPv6 - �室�騩 ��䨪)" new  enable=yes remoteip=any
netsh advfirewall firewall set rule dir=in  name="���� - ��-����� (ICMPv4 - �室�騩 ��䨪)" new  enable=yes remoteip=any

:end