@echo off
title Minecraft Server Auto-Restart Script with Backup
color 0A

REM Forge requires a configured set of both JVM and program arguments.
REM Add custom JVM arguments to the user_jvm_args.txt
REM Add custom program arguments {such as nogui} to this file in the next line before the %* or
REM  pass them to this script directly

:start_backup
start "Backup" /min cmd /c "call :backup_routine"
timeout /t 5 /nobreak
goto Start

:backup_routine
echo Starting backup...
set BACKUP_PATH=D:\ATLauncher\backups
set TIMESTAMP=%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%-%TIME:~0,2%-%TIME:~3,2%
set TIMESTAMP=%TIMESTAMP: =0%
mkdir "%BACKUP_PATH%\%TIMESTAMP%"
xcopy /s /i /q /y /r /exclude:exclude.txt . "%BACKUP_PATH%\%TIMESTAMP%"
echo Backup completed.
timeout /t 900 /nobreak
goto backup_routine

:Start
echo Starting Minecraft server...
java -Xmx40G -Xms40G @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.19.2-43.2.0/win_args.txt %*
echo Server crashed or stopped. Restarting in 5 seconds...
timeout /t 5 /nobreak
goto Start
