@echo off
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
