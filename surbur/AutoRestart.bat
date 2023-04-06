@echo off
title Minecraft Server Auto-Restart Script
color 0A
REM Forge requires a configured set of both JVM and program arguments.
REM Add custom JVM arguments to the user_jvm_args.txt
REM Add custom program arguments {such as nogui} to this file in the next line before the %* or
REM  pass them to this script directly
:Start
echo Starting Minecraft server...
java -Xmx40G -Xms40G @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.19.2-43.2.0/win_args.txt %*
echo Server crashed or stopped. Restarting in 5 seconds...
timeout /t 5 /nobreak
goto Start

