ECHO OFF
CLS
ECHO.

IF [%1]==[] GOTO :EXIT
IF [%1]==[/?] GOTO :EXIT

:1
logman start testlog -p "{c34f5c45-3569-896c-ba85-bf8dcc85aa62}" 0xffff 0xff -rt -ets



ECHO PLEASE TRY TO REPRODUCE BUG. PUSH "KEY" AFTER YOU ARE FINISHED
ECHO TO GET MSG RUNTIME use tracefmt.exe -rt testlog -display -p tmfpath
pause 



logman stop testlog -ets
GOTO :eof

:EXIT
	ECHO Invalid argument: %1
	ECHO.
	ECHO Usage:  %~n0 path_to_etl_file
	ECHO.