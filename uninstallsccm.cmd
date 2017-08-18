@echo off
:: +:::-----------------------------------------------------------------+
::  Copyright (C) 2017 Anne Gerben van Assen
:: +--------------+-----------------------------------------------------+
::  File:          uninstall.cmd                        
:: +--------------+-----------------------------------------------------+
::  Purpose :      remove sccm client and open log
:: +--------------+-----------------------------------------------------+
::  Author:        Anne Gerben van Assen                                        
:: +--------------+-----------------------------------------------------+
::  Date:          17-08-2017
:: +--------------+-----------------------------------------------------+
::  Version:       1.0.0                                               
:: +--------------+-----------------------------------------------------+
::  File History:                                                      
:: +-------+----------+-------------------------------------------------+ 
::   Name    Date       Change                                      
::  +-------+----------+------------------------------------------------+ 
::   AG      17-08-2017 initial version
::   AG      19-08-2017 fixed some bugs
::  +-------+----------+------------------------------------------------+
:: +--------------------------------------------------------------------+
title uninstall SCCM client
cls
pushd "%~dp0"
echo rename logfile and start uninstall
powershell.exe -Command "Start-Process cmd '/c rename %systemdrive%\Windows\CCMsetup\logs\ccmsetup.log beforeuninstall_ccmsetup.log && cd /d %cd% && %systemdrive%\Windows\ccmsetup\ccmsetup.exe /uninstall && exit' -Verb RunAs"
echo open logfile
cd .. 
xcopy %CD:~0,3%\trace32.exe C:\dxc\ /y
C:\dxc\trace32.exe %systemdrive%\Windows\CCMsetup\logs\ccmsetup.log
pause 
exit
