��&cls
ÿþ&cls
@echo off
title Creat Point Restore
color 0d
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f
powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'Team Optimizer 3.0.0' -RestorePointType 'MODIFY_SETTINGS'"
exit