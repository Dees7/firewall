@echo off
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
    netsh advfirewall firewall delete rule name=%~n1
    echo Creating rule named %~n1 in OUT chain
    netsh advfirewall firewall add rule name=%~n1 dir=out action=allow program=%1 enable=yes profile=any
    echo Creating rule named %~n1 in IN chain
    netsh advfirewall firewall add rule name=%~n1 dir=in  action=allow program=%1 enable=yes profile=any
)
