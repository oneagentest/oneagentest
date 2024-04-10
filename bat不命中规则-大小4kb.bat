echo off
set  local_dir="%cd%"
set temp_file="%temp%\running_path_query_result.txt"

set  reg_path="HKLM\Software\AliedrSrv"
set running_path=""
for /f "skip=2 tokens=1,2*" %%i in ('reg query %reg_path%  /v running_path') do (
     if "%%j"=="REG_SZ" (set running_path=%%k ) 
)
if not  "%running_path%" =="""" (goto main_entry)

set  reg_path=" HKLM\Software\WOW6432Node\AliedrSrv"
set running_path=""
for /f "skip=2 tokens=1,2*" %%i in ('reg query %reg_path%  /v running_path') do (
     if "%%j"=="REG_SZ" (set running_path=%%k)  
)
if  "%running_path%" =="""" (
    @echo running_path not find!!!!!
    goto exit_lable
)

:main_entry
echo on
cd "%running_path%"

"AliedrSrv.exe" /stop

sc stop AliEdrProtectDrv
sc delete AliEdrProtectDrv

sc stop AliEdrBaseDrv
sc delete AliEdrBaseDrv

sc stop montage-drv
sc delete montage-drv

sc stop netm
sc delete netm

"AliedrSrv.exe" /start

pause
:exit_lable
echo on
cd %local_dir%
pause