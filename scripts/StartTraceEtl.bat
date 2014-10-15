SET MYFOLDER=%~1
IF [%MYFOLDER%] == [] SET MYFOLDER=c:\log
mkdir %MYFOLDER%
copy ..\sample\WppTracing\tracelog.exe %MYFOLDER%\tracelog.exe
cd %MYFOLDER%

ver | find "XP"
if %ERRORLEVEL% == 0 goto ver_xp

logman stop   testlog -ets
logman delete testlog
logman start  testlog -p "{c34f5c45-3569-896c-ba85-bf8dcc85aa62}" 0xffff 0xff -rt -ets -o test.etl
logman update testlog -p "{a34f5c45-3569-896c-ba85-bf8dcc85aa62}" 0xffff 0xff -rt -ets -o test.etl


goto exit

:ver_xp
echo TraceLog is starting for Windows XP

tracelog -stop   testlog_driver
tracelog -stop   testlog_user

tracelog -remove  testlog_driver
tracelog -remove  testlog_user


tracelog -start  testlog_driver-guid #c34f5c45-3569-896c-ba85-bf8dcc85aa62 -ft 1 -flag 0xff -level 0xffff -f testlog_driver.etl
tracelog -start  testlog_user-guid #a34f5c45-3569-896c-ba85-bf8dcc85aa62 -ft 1 -flag 0xff -level 0xffff -f testlog_user.etl

:exit
pause