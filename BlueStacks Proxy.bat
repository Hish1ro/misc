@echo off
rem 获取电脑本机IP
for /f "tokens=16" %%i in ('ipconfig ^|find /i "ipv4"') do set ip=%%i

rem 根据本机IP生成http代理地址
set http_proxy=%ip%:7890

rem 连接BlueStacks5的ADB，并为模拟器设置http代理
cd C:\Program Files\BlueStacks_nxt
HD-Adb connect 127.0.0.1:5556
HD-Adb shell settings put global http_proxy %http_proxy%
echo BlueStacks Proxy Setting Done!
pause

rem 清除模拟器的http代理
@ if 1==0 (
@echo off
cd C:\Program Files\BlueStacks_nxt
adb connect 127.0.0.1:5556
adb shell settings put global http_proxy :0
echo Proxy Clear Sucess!
pause
)