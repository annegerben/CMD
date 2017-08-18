@echo off
:: +:::-----------------------------------------------------------------+
::  Copyright (C) 2017 Anne Gerben van Assen
:: +--------------+-----------------------------------------------------+
::  File:          resetpolicy.cmd                        
:: +--------------+-----------------------------------------------------+
::  Purpose :      run resetpolicy.vbs
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
title run resetpolicy.vbs
cls
rem pushd %~dp0
powershell.exe -Command "Start-Process cmd '/c cd /d %cd% && %systemdrive%\Windows\system32\cscript.exe %~dp0resetpolicy.vbs' -Verb RunAs"
rem powershell -Command "Start-Process cmd -Verb RunAs"
rem %systemdrive%\Windows\system32\cscript.exe %~dp0resetpolicy.vbs
rem pause