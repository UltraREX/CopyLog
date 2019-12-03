@echo off
setlocal enabledelayedexpansion


call:Init
:: �����ģ����
if "%1"=="MuMu" (
	set addr=127.0.0.1:7555
	adb connect %addr%
)
goto MENU
:: �����ģ����
if "%1"=="MuMu" (
	adb disconnect %addr%
)


:MENU
echo.
echo. ----- ������־ -----
echo.
echo. ��1������ȫ��ƽ̨��־
echo. ��2������ָ��ƽ̨��־
echo. ��3���˳�
echo.
echo.  ������ѡ���ţ�
set /p optionId=

if "%optionId%"=="1" goto CopyAll
if "%optionId%"=="2" goto CopySpecify
if "%optionId%"=="0" goto exit
goto:eof


:CopySpecify
echo.
echo. ----- ƽ̨ -----
echo.
set index=0
for /f "tokens=1*delims==" %%a in ('set keys[ 2^>nul') do (
	echo  ��!index!��%%b
	set /A index+=1
)
echo. ��!index!��������һ��
echo.  ������ѡ���ţ�
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
:: ·����Ϣ
call ".\libs\FilePath.bat" ".\Main.bat"
:: ��������
set PATH=%DirectoryPath%libs;%PATH%
:: ƽ̨����
call ".\libs\FilePath.bat" ".\..\identifier.ini"
call ".\libs\INIReader.bat" "%AbsolutePath%"
:: ��־�ļ���
set log_folder=.\..\Log
if not exist %log_folder% md %log_folder%
goto:eof


:CopyLog
:: ����
set apk_identifier=%1
:: �԰���������־��Ŀ¼
set sub_log_path=%log_folder%\%apk_identifier%
if not exist %sub_log_path% md %sub_log_path%
:: ��ȡ��־�ļ�
adb pull "/storage/self/primary/Android/data/%apk_identifier%/files/Log/." %sub_log_path%
goto:eof

