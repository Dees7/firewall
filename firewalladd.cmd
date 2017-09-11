@echo off
set name=%2
IF NOT DEFINED name ( 
set name=%~n1
)

echo Deleting rule named %name% from all chains
netsh advfirewall firewall delete rule name=%name%
echo Creating rule named %name% in OUT chain
netsh advfirewall firewall add rule name=%name% dir=out action=allow program=%1 enable=yes profile=any
echo Creating rule named %name% in IN chain
netsh advfirewall firewall add rule name=%name% dir=in  action=allow program=%1 enable=yes profile=any
