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
::  +-------+----------+------------------------------------------------+
:: +--------------------------------------------------------------------+
title install SCCM client
cls
pushd "%~dp0"
echo rename logfile
rename %systemdrive%\Windows\CCMsetup\logs\ccmsetup.log %systemdrive%\Windows\CCMsetup\logs\beforeinstall_ccmsetup.log
echo start uninstall
cmd /c powershell.exe -Command "Start-Process cmd '/k cd /d %cd% && %systemdrive%\Windows\ccmsetup\ccmsetup.exe SWITCHES HERE && exit' -Verb RunAs"
echo open logfile
cd.. 
trace32.exe %systemdrive%\Windows\CCMsetup\logs\ccmsetup.log
exit
