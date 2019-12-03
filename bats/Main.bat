@echo off
setlocal enabledelayedexpansion


call:Init
:: 如果是模拟器
if "%1"=="MuMu" (
	set addr=127.0.0.1:7555
	adb connect %addr%
)
goto MENU
:: 如果是模拟器
if "%1"=="MuMu" (
	adb disconnect %addr%
)


:MENU
echo.
echo. ----- 拷贝日志 -----
echo.
echo. 【1】拷贝全部平台日志
echo. 【2】拷贝指定平台日志
echo. 【3】退出
echo.
echo.  请输入选择编号：
set /p optionId=

if "%optionId%"=="1" goto CopyAll
if "%optionId%"=="2" goto CopySpecify
if "%optionId%"=="0" goto exit
goto:eof


:CopySpecify
echo.
echo. ----- 平台 -----
echo.
set index=0
for /f "tokens=1*delims==" %%a in ('set keys[ 2^>nul') do (
	echo  【!index!】%%b
	set /A index+=1
)
echo. 【!index!】返回上一级
echo.  请输入选择编号：
set /p pl=

if "%pl%"=="%index%" (
	goto MENU
) else (
	call:CopyLog !values[%pl%]!
)
goto:eof



:CopyAll
for /f "tokens=1*delims==" %%a in ('set values[ 2^>nul') do (
	call:CopyLog %%b
)
goto:eof


:Init
:: 路径信息
call ".\libs\FilePath.bat" ".\Main.bat"
:: 环境变量
set PATH=%DirectoryPath%libs;%PATH%
:: 平台配置
call ".\libs\FilePath.bat" ".\..\identifier.ini"
call ".\libs\INIReader.bat" "%AbsolutePath%"
:: 日志文件夹
set log_folder=.\..\Log
if not exist %log_folder% md %log_folder%
goto:eof


:CopyLog
:: 包名
set apk_identifier=%1
:: 以包名创建日志子目录
set sub_log_path=%log_folder%\%apk_identifier%
if not exist %sub_log_path% md %sub_log_path%
:: 拉取日志文件
adb pull "/storage/self/primary/Android/data/%apk_identifier%/files/Log/." %sub_log_path%
goto:eof

