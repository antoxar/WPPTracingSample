ECHO OFF
CLS
ECHO.

IF [%1]==[] GOTO :EXIT
IF [%1]==[/?] GOTO :EXIT
IF [%2]==[] GOTO :EXIT
IF [%3]==[] GOTO :EXIT

:1
%~1\wintools\tracing\tracepdb.exe -i %~1 -p %~2\tmf
GOTO :eof

:EXIT
	ECHO Invalid argument: %1
	ECHO.
	ECHO Usage:  %~n0 path_of_repository path_of_dll path_to_save_tmf
	ECHO Sample: Make_tmf_file.bat  binary.dll fullpath
	ECHO.
	


