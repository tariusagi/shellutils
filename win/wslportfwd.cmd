@ECHO OFF
IF "%~1" == "" GOTO USAGE

ECHO Checking permission
net session >nul 2>&1
IF %ERRORLEVEL% == 0 (
	ECHO Permission OK
) ELSE (
	ECHO ERROR: Requires administrive right
	GOTO EOF
)

IF "%~1" == "delete" GOTO DELETE
SET action=add
GOTO ADD

:USAGE
ECHO Add/delete port forwarding rule for a WSL distro. Need admnistrative right.
ECHO Syntax: %0 [delete] distro_name wsl_port host_port
ECHO If "delete" was specified, then the forward rule will be deleted.
ECHO Run "wsl --list" to get a list of active distro(s).
ECHO Example 1: %0 Ubuntu-20.04 80 8080
ECHO Forward port 8080 on host computer to port 80 on Ubuntu-20.04 WSL distro.
ECHO Example 2: %0 delete Ubuntu-20.04 80 8080
ECHO Delete the corresponding port forwarding rule.
GOTO EOF

:DELETE
SET action=delete
SET distro=%2
SET wsl_port=%3
SET host_port=%4
GOTO SET_RULE_NAME

:ADD
SET distro=%1
SET wsl_port=%2
SET host_port=%3

:SET_RULE_NAME
SET rule_name="WSL %distro% port %wsl_port% to host %host_port%"
ECHO Rule name set to %rule_name%

:GET_IP
ECHO Get the distro IP
WSL -d %distro% -- ip addr show eth0 ^| grep -oP '(?^<=inet\s)\d+(\.\d+){3}' > %distro%-ip.txt
SET /p ip=<%distro%-ip.txt
ECHO %distro% IP: %ip%

:PROCEED
IF "%action%" == "add" GOTO ADD_RULE
ECHO Deleting rule
netsh interface portproxy delete v4tov4 listenport=%host_port% listenaddress=0.0.0.0 > NUL
netsh advfirewall firewall delete rule name=%rule_name% > NUL
ECHO Port forwarding rule was deleted
GOTO EOF

:ADD_RULE
ECHO Adding rule
REM netsh interface portproxy reset
netsh interface portproxy add v4tov4 listenport=%host_port% listenaddress=0.0.0.0 connectport=%wsl_port% connectaddress=%ip% > NUL
netsh advfirewall firewall add rule name=%rule_name% dir=in action=allow protocol=tcp localport=%host_port% > NUL
ECHO %COMPUTERNAME%:%host_port% was forwarded to its %distro% %IP%:%wsl_port% 

:EOF
