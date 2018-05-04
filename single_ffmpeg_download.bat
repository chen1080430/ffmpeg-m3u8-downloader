@echo OFF
Title ffmpeg for m3u8 Downloader by @Heroichen
Mode con: cols=111 lines=31

GOTO menu


:menu
color 0E
echo.
echo.
echo.
echo                                              ======================
echo                                              =        Menu        =
echo                                              ======================
echo.
echo.
echo                                         Enter a Number to select a Task.
echo.
echo                               1. single m3u8 stream file download enter number 1
echo                               9. number 9 to exit.
echo.
set choice=
SET /P choice=Enter number: 
echo. 
if '%choice%'=='1' GOTO :singlem3u8
if '%choice%'=='9' (GOTO :exit) else (
cls
echo.
echo PLEASE ENTER CORRECTLY! 
echo.
goto :menu
)
echo. 
echo.
echo.


:singlem3u8
cls
echo.
echo.Video URL:
SET /P VAR1=
echo.
echo.File Name:
SET /P VAR2=
echo.
echo =================  Download Info =================
echo.
ECHO Video URL:  %VAR1% 
echo. 
ECHO File Name:  %VAR2% 
echo. 
echo =================  Download Info =================
echo.
echo.           Input CORRECT (yes=1/no=2)?
set inputcorrect1=
set /p inputcorrect1=
echo.
if '%inputcorrect1%'=='1' (echo ============Press any key to Continue...===========) else (
echo.
echo                                 =================================================
echo. 														
echo                                                      Cancel...
echo                                      Make sure your input number 1 to Continue.
echo                                             Press any key to Continue...
echo.
echo                                 =================================================
pause >nul
cls
GOTO menu
)
pause >nul
ffmpeg\bin\ffmpeg -i "%var1%" -c copy "%var2%.mp4"
echo.
echo                                    ===========================================
echo                                    =                                         =
echo                                    =         ! ! !Download Sucess! ! !       =
echo                                    =        Press any key to Continue...     =
echo                                    =                                         =
echo                                    ===========================================
pause >nul
echo.
cls
GOTO menu
GOTO menu

:exit
echo.
echo.
echo.
ECHO ============Press any key to Continue...===========
pause >nul
exit

:download_test
ffmpeg -i "%var1%" -c copy "%var2%.mp4"