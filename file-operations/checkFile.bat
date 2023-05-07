@echo off
 
::设置要检查的文件
set File=mytest.doc
 
for /d %%a in (*) do (
    if exist "%%~a\%File%" (
        call :DoNow "%%~a"
    )
)
pause
exit
 
:DoNow
::让脚本临时进入相关子目录中
pushd "%~1"
 
echo 这里写您在对应的文件夹中做相关处理
 
::退出子目录
popd
goto :eof
