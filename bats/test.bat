@echo off
setlocal enabledelayedexpansion


echo %~dp0

call ".\libs\FilePath.bat" ".\test.bat"
echo %DriveLetter%
echo %DirectoryPathWithoutDriveLetter%
echo %DirectoryPath%
echo %FileNameWithoutExtension%
echo %FileExtension%
echo %FileName%
echo %AbsolutePath%
echo %FileSize%



call ".\libs\FilePath.bat" ".\..\identifier.ini"
call ".\libs\INIReader.bat" "%AbsolutePath%"

echo %dev%
echo %trunk%
echo %gw%
echo %dl%
echo %qh%

for /f "tokens=1*delims==" %%a in ('set keys[ 2^>nul') do echo %%b
for /f "tokens=1*delims==" %%a in ('set values[ 2^>nul') do echo %%b


pause