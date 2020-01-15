@echo off
compare.exe
fc log.txt empty.txt
fc marsResult2.txt verilogOut2.txt
pause