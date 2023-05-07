#bat学习
@(batch)[批处理]

-------------------

[TOC]

## 1, bat简介
批处理文件（英语：Batch file），在DOS、OS/2、Microsoft Windows中，是一种用来当成脚本语言运作程序的文件。它本身是文本文件，其中包含了一系列让具备命令行界面的解释器读取并执行的指令。它应用于DOS和Windows系统中，它是由DOS或者Windows系统内嵌的解释器（通常是COMMAND.COM或者CMD.EXE）解释运行。它相当于是类Unix系统下的Shell script。[官网地址](https://en.wikibooks.org/wiki/Windows_Batch_Scripting)

### .bat与.sh的关系
bat用于window平台，shell用于Linux平台,bat也可为.cmd后缀
[bat与shell参考](https://www.jianshu.com/p/ffa5b937580d)


## 2, 常用语法
多数情况下，bat指令名称对大小写不敏感，对变量值不敏感，对变量值的名称敏感，简而言之，大小写要统一不要前后不一致。

```
	echo 回显，显示doc命令的执行信息
	echo:on|off 关闭当前回显
	ehco. 回车
	ECHO Y|CHKDSK/F 答复语句
	
	@ 关闭当前命令的回显
	@echo:off 关闭回显，并关闭本条回显
    REM 注释,但能回显
    @REM 不能回显 
    :: 注释，冒号后接非字母符号将被忽略，例如:+亦可
    
	PAUSE 暂停，请按任意键继续. . . 
	Echo 其他提示语 & pause > nul ，暂停，自定义提示语
	
	errorlevel 上一条命令执行返回码，错误码0~255区间，默认成功0
	if errorlevel 错误码 cmd 含义:如返回的错误码值大于或等于值，执行cmd
	if %errorlevel% NEQ 0 echo error  使用compare-op进行对比，如NEQ 
	%errorlevel% 同上，只是使用时机有区别
	if %errorlevel% == 错误码 cmd 含义:如返回的错误码值等于值，执行cmd
	
	SET 命令赋值自定义变量
	SETX 修改windows环境变量
	SET File=project.json 等号左右两侧不可有空格，bat对空格敏感
	SET /P variable=[promptString] 使用用户输入的值做设置
	SET /A 计算值
	set /a aa=1%aa%-10000
	set/a z=0x3204de4a 16进制qq号
	
	IF 执行批处理程序中的条件处理
	IF [NOT] ERRORLEVEL number command
	IF [NOT] string1==string2 command
	IF [NOT] EXIST filename command
	if not exist "%%~a\%File%"
	
	FOR
	for /f "delims=" %%a in ('dir /ad/b') do (
		cmd...
	)	
```
 

## 3,  常用变量
%CD%  获取当前目录
%~dp0 bat脚本当前所在路径
%PATH%  获取命令搜索路径
%DATE%  获取当前日期。
%TIME%  获取当前时间。
%RANDOM% 获取 0 和 32767 之间的任意十进制数字。
%ERRORLEVEL% 获取上一命令执行结果码

## 4, 详细解析
4.1, `%`  批处理变量引导符
- 引用变量用%var%
- 调用程序外部参数用%1 至%9，%0 %1 %2 %3 %4 %5 %6 %7 %8 %9 %*为命令行传递给批处理的参数。
%0 批处理文件本身，包括完整的路径和扩展名，可调用自身

4.2 `FOR`
`FOR [-d | -l | -r | -f] %%variable IN (set) DO command [command-parameters]`

-d  
仅搜索当前的目录，不包括其下的子目录，仅显示目录名称，不显示文件名称，不显示隐藏目录

-l
`FOR /L %%variable IN (start,step,end) DO command [command-parameters]`
start 起始值，step 增值，end 结束值，类似与**JavaScript**中的**for**
```
@echo off
for /l %%i in (1,1,65535) do start cmd  一个恶搞程序
pause
```

```
@REM 多重查找
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
```

-r  
查找完整的目录树，[[drive:]path]，默认查找当前目录，可使用通配符?或*,-r 与`dir /ad /s`  功能相似，细节有差异。待补充...

-f
使用文件解析来处理命令输出、字符串及文件内容。使用迭代变量定义要检查的内容或字符串，并使用各
种 options 选项进一步修改解析方式。使用 options 令牌选项指定哪些令牌应该作为迭代变量传递。一般用于解析文本或字符串

```
REM delims= 待后续研究  dir /ad/b 
for /f "delims=" %%a in ('dir /ad/b') do ()
```

待补充

4.3 `IF` 待补充
4.4 `pushd `  待补充


## 5, 常用命令
`dir`
https://www.jianshu.com/p/8ddf14bf03d5


## 6, 总结
batch学习浅尝截止，毕竟是一个比较久远的脚本工具，其语法等在现在看来有很多不便的地方，在2023的今天可替代它操作File的有很多选择，比如node，gulp，paython等

## 7, 参考
bat入门优秀博客1 https://www.cnblogs.com/linyfeng/p/8072002.html
bat入门优秀博客2 https://so.csdn.net/so/search?q=bat&t=blog&u=shihengzhen101
学习bat的初衷1 https://steamcommunity.com/app/431960/discussions/1/3819659084189795256/
学习bat的初衷2 https://www.bilibili.com/read/cv23519696


