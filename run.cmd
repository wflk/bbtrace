@echo off

IF [%1]==[] (
  (echo Please suply a client)
  GOTO exit
)

SET LOCAL=%~dp0

REM Example: run -only_from_app -logdir %LOCAL%\logs
IF [%1]==[drltrace] (
  SET ARGS=-logdir %LOCAL%\logs -t drltrace %2 %3 %4 %5 %6 %7 %8 %9
  GOTO run
)
IF [%1]==[tracedump] (
  SET ARGS=-logdir %LOCAL%\logs -tracedump_binary %2 %3 %4 %5 %6 %7 %8 %9
  GOTO run
)

SET ARGS=-logdir %LOCAL%\logs -c %LOCAL%\build\%1.dll %2 %3 %4 %5 %6 %7 %8 %9

:run

echo %DYNAMORIO_HOME%\bin32\drrun.exe -syntax_intel %ARGS% -- EXECUTABLE

:exit
