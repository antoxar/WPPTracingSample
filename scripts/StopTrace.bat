SET MYFOLDER=%~1
IF [%MYFOLDER%] == [] SET MYFOLDER=c:\log
SET LOGTIME=%TIME::=.%
SET DATETIME=%DATE:/=.%
set MYTIMESTAMP=%DATETIME%--%LOGTIME%


ver | find "XP"
if %ERRORLEVEL% == 0 goto ver_xp

logman stop testlog -ets

goto exit

:ver_xp
echo TraceLog is starting for Windows XP

tracelog -stop   testlog_driver
tracelog -stop   testlog_binary

tracelog -remove  testlog_driver
tracelog -remove  testlog_binary

:exit
pause