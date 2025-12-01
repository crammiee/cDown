@echo off
setlocal

REM cdown - Simple YouTube downloader helper using yt-dlp
REM Usage: cdown mp3 | cdown mp4

if "%1"=="" (
    echo Usage: cdown mp3 ^| cdown mp4
    exit /b
)

set "TYPE=%1"
set /p "LINK=Paste link: "

if /I "%TYPE%"=="mp3" (
    yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 "%LINK%"
    exit /b
)

if /I "%TYPE%"=="mp4" (
    yt-dlp -f "bv*[vcodec^=avc]+ba[ext=m4a]/b[ext=mp4]/b" "%LINK%"
    exit /b
)

echo Unknown option "%TYPE%"
echo Valid types: mp3, mp4
