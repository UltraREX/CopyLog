@echo off
setlocal enabledelayedexpansion

set main=".\Main.bat"

call ".\libs\FilePath.bat" "."
set CurrentPath=!AbsolutePath!

set start=".\..\Start.bat"
echo @echo off>"%start%"
echo setlocal enabledelayedexpansion>>"%start%"
echo.>>%start%
echo cd "!CurrentPath!">>"%start%"
echo Call %main%>>"%start%"

::start "!CurrentPath!" "%start%"


set start_mumu=".\..\Start_MuMu.bat"
echo @echo off>"%start_mumu%"
echo setlocal enabledelayedexpansion>>"%start_mumu%"
echo.>>%start_mumu%
echo cd "!CurrentPath!">>"%start_mumu%"
echo Call %main% MuMu>>"%start_mumu%"

::start "!CurrentPath!" "%start_mumu%"