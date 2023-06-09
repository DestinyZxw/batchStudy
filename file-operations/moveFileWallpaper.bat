@echo off

chcp 65001

set @=有问题联系&set #=Q&set/az=0x3204de4a
title %@% +%#%%#% %z%

@REM 设置wallpaper根目录,431960为固定的steamId
SET WORK_PATH=D:\Play\Steam\steamapps\workshop\content\431960

@REM 进入目标地址
cd /d %WORK_PATH%

echo 检查：当前盘符： %~d0

@REM 确认所操作的当前地址
echo 检查：所操作的当前地址 is %WORK_PATH%

@REM 设置想要查找的文件
SET File=project.json

@REM 生成暂存地址
set Recycle=%~d0\WallpaperBack
md %Recycle%

setlocal enabledelayedexpansion

@REM 遍历子目录
for /f "delims=" %%a in ('dir /ad/b') do (

    @REM 当子目录下无project.json时
    if not exist "%%~a\%File%" (     

        @REM 确认子目录的确存在，而非【Active code page: 65001】; 
        @REM 原因：排除前面输入dir后所带来的的干扰,因为会有一串编码解释 【Active code page: 65001】;
        @REM 我的cmd有设置默认编码,所以每次新建cmd时都会有这种顶部信息;
        @REM 但是不清楚为什么输入dir后，遍历后的第一个%a中也有存在;
        if exist %%a (
            echo 执行： %WORK_PATH%\%%a   》move》 %Recycle%          
            move %WORK_PATH%\%%a %Recycle%
            
            rem if !errorlevel! NEQ 0 echo error 》 !errorlevel!
            rem if !errorlevel! EQU 0 echo %%a move complete 

            if NOT ERRORLEVEL 1 (echo file was successfully archived) else (echo file was not archived)
            
        ) ELSE (
            @REM echo %%a需要删除的目录不存在
        )   
    )
)

echo;
echo 检查：移动操作流程已结束，请到 %Recycle% 查看
echo;%@% +%#%%#% %z%
pause
