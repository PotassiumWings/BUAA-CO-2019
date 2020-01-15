@echo off
setlocal
set /a nowtime = 0
set /a limit = 200
echo Will run for %limit% times.
echo.  
:loop
TIMEOUT /T 2
set /a nowtime = %nowtime% + 1
if %nowtime% == %limit% (
	goto end
)
echo nowtime: %nowtime%

python rand_ins.py > ins.asm
call judge.bat p6 ins.asm
echo errorlevel:%errorlevel%
if "%errorlevel%" == "0" (
	goto loop
)
:error
echo Error! at %nowtime%
endlocal
:end
pause
exit /b