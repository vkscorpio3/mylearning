@echo off

rem 环境配置

SET NGINX_PATH=D:
SET NGINX_DIR=D:\work\nginx-1.11.3

color 0a

TITLE Nginx 管理程序

CLS

ECHO *******************************************************
ECHO **********   Nginx 管理程序                  **********
ECHO **********   Update by Eric.Wen 2016-08-10   **********
ECHO *******************************************************
ECHO. 
ECHO ENV:
ECHO =======================================================
ECHO. 
ECHO Nginx 目录：%NGINX_DIR%
ECHO. 

:MENU
	ECHO.
	ECHO Nginx进程列表：
	ECHO =======================================================
	tasklist|findstr /i "nginx.exe"


	ECHO.
	ECHO 选项:
	ECHO =======================================================
	ECHO.  [1] 启动Nginx  
	ECHO.  [2] 关闭Nginx  
	ECHO.  [3] 重启Nginx
	ECHO.  [4] 进程Nginx
	ECHO.  [5] 退 出 
	ECHO. 
	ECHO.请输入选择项目的序号:

	SET/p ID=
		
		IF "%ID%"=="1" GOTO start 
		IF "%ID%"=="2" GOTO stop 
		IF "%ID%"=="3" GOTO restart 
		IF "%ID%"=="4" GOTO MENU 
		IF "%ID%"=="5" EXIT

	PAUSE

:start
	CALL :nginxStart
	GOTO MENU

:stop
	CALL :nginxStop
	GOTO MENU

:restart
	CALL :nginxStop
	CALL :nginxStart
	GOTO MENU
	
rem 执行启动和关闭

:nginxStart
	
	%NGINX_PATH%
	
	cd %NGINX_DIR%
	
	start "" nginx.exe
	
	goto MENU

:nginxStop
	
	taskkill /F /IM nginx.exe > nul
	
	goto MENU
	