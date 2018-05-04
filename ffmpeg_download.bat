@echo OFF
Title ffmpeg for m3u8 Downloader by @chen1080430
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
echo                               2. multi  m3u8 stream file download enter number 2
echo                               9. number 9 to exit.
echo.
set choice=
SET /P choice=Enter number: 
echo. 
if '%choice%'=='1' GOTO :singlem3u8
if '%choice%'=='2' GOTO :multim3u8
if '%choice%'=='9' (GOTO :exit1) else (
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
echo                                    =             Download Success            =
echo                                    =        Press any key to Continue...     =
echo                                    =                                         =
echo                                    ===========================================
pause >nul
echo.
cls
GOTO menu
GOTO menu





:multim3u8
echo How many video do you want to download?
SET /P downloadnumber=Enter number: 
echo.
SET loopcount=1
SET loopdisplaycount=1
set /a downloadnumberloop=downloadnumber+1

:loop
cls
echo.
echo m3u8 url: 
SET /P URL[%loopcount%]=
echo.
echo.mp4 file name: 
SET /P NAME[%loopcount%]=
echo.
echo ==============   %loopcount%  download info ===================
echo.
call echo m3u8 url: %%URL[%loopcount%]%%
echo. 
call echo file name: %%NAME[%loopcount%]%%
echo. 
echo =================== download info ===================
echo.
echo           Input CORRECT (yes=1/no=2)?
set /p inputcorrect=
echo.
if '%inputcorrect%'=='1' (
echo ======== save success... input next... ===========
echo.
echo.
pause >nul
) else (
set /a loopcount=loopcount-1
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
)
if %loopcount%==%downloadnumber% ( 
cls
echo ************ ALL DOWNLOAD INFO  ************ 
goto :loopexit
)
set /a loopcount=loopcount+1
goto :loop

:loopexit
echo.
CALL ECHO m3u8 url:  %%URL[%loopdisplaycount%]%%
echo. 
CALL ECHO file name:  %%NAME[%loopdisplaycount%]%%
echo. 
set /a loopdisplaycount=loopdisplaycount+1
if '%loopdisplaycount%'=='%downloadnumberloop%' (
echo ********************************************
echo.
echo.
call echo   Are these input all correct[yes=1/no=2]?
set /p inputcorrect=
goto :looptemp
) else (
echo ..........................................
goto :loopexit
)

:looptemp
if '%inputcorrect%'=='1' (
echo ============Press any key to Start download...===========
set loopdisplaycount1=1
pause >nul
goto :loopexecute
) else (
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
goto :menu
)
goto :menu


:loopexecute
cls
call set URL_TEMP=%%URL[%loopdisplaycount1%]%%
call set NAME_TEMP=%%NAME[%loopdisplaycount1%]%%
echo =================  Download Info =================
echo.
ECHO Video URL:  %URL_TEMP% 
echo. 
ECHO File Name:  %NAME_TEMP% 
echo. 
echo =================  Download Info =================
echo                wait for download...
timeout 5
ffmpeg\bin\ffmpeg -i "%URL_TEMP%" -c copy "Download_m3u8\%NAME_TEMP%.mp4"

set /a loopdisplaycount1=loopdisplaycount1+1
if %loopdisplaycount1%==%downloadnumberloop% (
echo
echo.
echo.
echo                                    ===========================================
echo                                    =                                         =
echo                                    =              Download Success           =
echo                                    =        Press any key to Continue...     =
echo                                    =                                         =
echo                                    ===========================================
echo.
echo.
pause >nul
cls
goto :menu
)
echo.
goto :loopexecute


:exit1
echo.
echo.
echo.
ECHO ============ Press any key to Exit... ============
pause >nul
exit

:download_test
ffmpeg -i "%var1%" -c copy "%var2%.mp4"
