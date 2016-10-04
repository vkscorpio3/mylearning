# STS 闪退

> 新装的系统，安装后就闪退。

```
!SESSION 2016-10-03 13:03:49.065 -----------------------------------------------
eclipse.buildId=3.7.3.201602250940-RELEASE-e45
java.version=1.8.0_92
java.vendor=Oracle Corporation
BootLoader constants: OS=win32, ARCH=x86_64, WS=win32, NL=zh_CN
Framework arguments:  -product org.springsource.sts.ide
Command-line arguments:  -os win32 -ws win32 -arch x86_64 -product org.springsource.sts.ide

!ENTRY org.eclipse.egit.ui 2 0 2016-10-03 13:03:56.051
!MESSAGE Warning: The environment variable HOME is not set. The following directory will be used to store the Git
user global configuration and to define the default location to store repositories: 'C:\Users\Wen'. If this is
not correct please set the HOME environment variable and restart Eclipse. Otherwise Git for Windows and
EGit might behave differently since they see different configuration options.
This warning can be switched off on the Team > Git > Confirmations and Warnings preference page.
```

http://stackoverflow.com/

```
 1. In Windows 7, type "environment" at the start menu        
 2. Select "Edit environment variables for your account"
 3. Click the "New" button.
 4. Enter "HOME" in the name field
 5. Enter "%USERPROFILE%" or some other path in the value field.
 6. Click OK, and OK again. You have just added the Home directory on Windows.
```