@ECHO OFF
title YouTube Downloader
cd %~dp0
echo Ilooh YouTube Downloader 1.01
timeout /t 3 /nobreak > NUL
:mainmenu
cls
echo Sei nel menu principale.
echo.
echo 1) Scarica video
echo 2) Scarica audio
echo 3) Controlla aggiornamenti
echo 0) Esci
:choice
set /p choice=La tua scelta (1,2,0):
if %choice%==1 goto :videodl
if %choice%==2 goto :audiodl
if %choice%==3 goto :chkupd
if %choice%==0 exit
goto :choice

:videodl
cls
SET /P URL=Inserisci url video: 
cd Lib
youtube-dl -o Video/%%(title)s.%%(ext)s -i --ignore-config --hls-prefer-native %URL%
cd ../
ECHO Fatto!
start Lib\Video\
PAUSE
goto :mainmenu

:audiodl
cls
SET /P URL=Inserisci url video: 
cd Lib
youtube-dl -o Audio/%%(title)s.%%(ext)s -f 140 -i --ignore-config --hls-prefer-native %URL%
cd ../
ECHO Fatto!
start Lib\Audio\
PAUSE
goto :mainmenu

:chkupd

cd Lib
youtube-dl -U
echo Per controllare gli aggiornamenti di Ilooh YT Downloader, vai su https://iloohtechnology.it/ &start https://iloohtechnology.it/
pause
cd ../
goto :mainmenu 
