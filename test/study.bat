::@echo on 
@echo off

rem 启用延迟环境变量扩展
setlocal enabledelayedexpansion

@REM 确定要操作的目录
SET WORK_PATH=C:\SteamLibrary\steamapps\workshop\content\431960
@REM SET WORK_PATH=C:\Users\desti\Documents\work-test\bat\test1

@REM 设置目标地址为bat文件所在目录
@REM SET WORK_PATH=%~dp0  

@REM 输出bat地址用以确认
@REM echo %%~dp0 = %~dp0

@REM 进入目标地址
cd %WORK_PATH%

@REM 确认bat所操作的当前地址
echo WORK_PATH is %WORK_PATH%

@REM 设置想要查找的文件
SET File=project.json

echo ------------------------

@REM IF 学习
@REM net user 
@REM IF %ERRORLEVEL% == 0 echo net user 执行成功了! 

@REM IF ELSE 学习
@REM net usertest
@REM compare-op NEQ - 不等于
@REM IF %ERRORLEVEL% == 0 (
@REM   echo net usertest 执行成功了! 
@REM ) ELSE (
@REM   echo net usertest 执行失败了!
@REM ) 


@REM for学习
@REM for /r %%i in (*.json) do (
@REM   IF EXIST  *.json (
@REM     echo item = %%i
@REM   ) ELSE (
@REM      echo item missing
@REM   ) 
@REM )

@REM for +if
@REM for /r %%i in (project.json) do (
@REM   if exist %%i (
@REM     @REM @REM echo 目标地址 = %%i
@REM     @REM SET target=%%i
@REM     @REM @REM echo target = %target%

@REM     @REM echo !target:%File%=!
@REM     @REM SET var=%target:%File%=%
@REM     @REM echo 替换前的值: "%target%"
@REM     @REM echo 替换后的值: "%var%"
@REM      echo %%i
@REM   ) else (
@REM     @REM  echo %%i
@REM   )

@REM   @REM cd %%i

@REM   @REM if exist  project.json (
@REM   @REM   echo  %%i 命中
@REM   @REM ) ELSE (
@REM   @REM   echo missing
@REM   @REM )
@REM )

@REM 双重遍历
@REM set Recycle=C:\hsz

set Recycle=C:\WallpaperBack
md %Recycle%

for /f "delims=" %%a in ('dir /ad/b') do (
    if not exist "%%~a\%File%" (          
          @REM echo;%WORK_PATH%\%%a      
          if exist %%a (
            echo;target》 %WORK_PATH%\%%a   》》》》》》》》》》》》》》》》%Recycle%
            @REM md %Recycle%
            move %WORK_PATH%\%%a %Recycle%
            if %errorlevel% NEQ 0 echo error》%errorlevel%
            if %errorlevel% EQU 0 echo %%a move complete 
          ) ELSE (
            @REM echo %%a需要删除的目录不存在
          )   
    )   
)

::知识点1， 如何将bat伪装成其他格式
@REM start https://pranx.com/hacker/

::知识点2， 无限弹框
::for /l %%i in (1,1,65535) do start cmd

pause 