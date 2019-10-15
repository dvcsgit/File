@echo off
rem
set NAME="ÒÒÌ«¾WÂ· 2"
rem 
set ADDR=10.214.226.118
set MASK=255.255.255.0
set GATEWAY=10.214.226.254
set DNS1=10.214.3.31
set DNS2=

set ADDR1=10.214.226.118
set MASK1=255.255.255.0
set GATEWAY1=10.214.226.252
set DNS11=61.177.7.1
set DNS21=
rem

set ADDR3=192.168.0.1
set MASK3=255.255.255.0
set GATEWAY3=192.168.0.1
set DNS13=0.0.0.0
set DNS23=
rem

set ADDR4=192.168.0.2
set MASK4=255.255.255.0
set GATEWAY4=192.168.0.1
set DNS14=0.0.0.0
set DNS24=
rem

echo Options:
echo 0 Set static company
echo 1 Set static internet
echo 2 Set dynamic ip
echo 3 Set share principal
echo 4 Set share dependent
echo 5 Exit

echo Enter after your choose
set /p operate=
if %operate%==0 goto 0
if %operate%==1 goto 1
if %operate%==2 goto 2
if %operate%==3 goto 3
if %operate%==4 goto 4
if %operate%==5 goto 5

:0
echo Setting static ip...
rem
echo IP ADDRESS = %ADDR%
echo MASK= %MASK%
echo GETEWAY= %GATEWAY%
netsh interface ipv4 set address %NAME% static %ADDR% %MASK% %GATEWAY% 
echo DEFAULT DNS = %DNS1% 
netsh interface ipv4 set dns %NAME% static %DNS1%
echo ADD DNS = %DNS2% 
if "%DNS2%"=="" (echo DNS2 is null) else (netsh interface ipv4 add dns %NAME% %DNS2%) 
echo Static ip has setted
pause
goto 5

:1
echo Setting static ip...
rem
echo IP ADDRESS = %ADDR1%
echo MASK= %MASK1%
echo GETEWAY= %GATEWAY1%
netsh interface ipv4 set address %NAME% static %ADDR1% %MASK1% %GATEWAY1% 
echo DEFAULT DNS = %DNS11% 
netsh interface ipv4 set dns %NAME% static %DNS11%
echo ADD DNS = %DNS21% 
if "%DNS21%"=="" (echo DNS21 is null) else (netsh interface ipv4 add dns %NAME% %DNS21%) 
echo Static ip has setted
pause
goto 5

:2
echo Setting dynamic ip...
echo Obtaining ip address from DHCP...
netsh interface ip set address %NAME% dhcp
echo Obtaining DNS address from DHCP...
netsh interface ip set dns %NAME% dhcp 
echo IP setted!
pause
goto 5

:3
echo Setting static ip...
rem
echo IP ADDRESS = %ADDR3%
echo MASK= %MASK3%
echo GETEWAY= %GATEWAY3%
netsh interface ipv4 set address %NAME% static %ADDR3% %MASK3% %GATEWAY3% 
echo DEFAULT DNS = %DNS13% 
netsh interface ipv4 set dns %NAME% static %DNS13%
echo ADD DNS = %DNS23% 
if "%DNS23%"=="" (echo DNS23 is null) else (netsh interface ipv4 add dns %NAME% %DNS23%) 
echo Static ip has setted
pause
goto 5

:4
echo Setting static ip...
rem
echo IP ADDRESS = %ADDR4%
echo MASK= %MASK4%
echo GETEWAY= %GATEWAY4%
netsh interface ipv4 set address %NAME% static %ADDR4% %MASK4% %GATEWAY4% 
echo DEFAULT DNS = %DNS14% 
netsh interface ipv4 set dns %NAME% static %DNS14%
echo ADD DNS = %DNS24% 
if "%DNS24%"=="" (echo DNS24 is null) else (netsh interface ipv4 add dns %NAME% %DNS24%) 
echo Static ip has setted
pause
goto 5

:5
exit