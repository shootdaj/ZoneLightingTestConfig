ECHO OFF

::Check number of arguments, must be exactly 1
SET syncmsg=
SET argC=0
FOR %%x in (%*) DO SET /A argC+=1
IF (%argC%) == (0) GOTO ASKFORMSG 
GOTO SETMSGTOARG

:ASKFORMSG
::CHOICE /C YN /N /M "Are you sure you want to sync?" --commented out in case it's needed in the future
SET /P syncmsg=Please enter commit message (empty for generic sync message): 
IF ("%syncmsg%") == ("") GOTO SYNCNOMSG 
GOTO SYNCWITHMSG

:SETMSGTOARG 
SET syncmsg=%1
GOTO SYNCWITHMSG

:SYNCWITHMSG
DEL syncoutput.txt
ECHO ON
ECHO +++++++++++ START +++++++++++++ >> syncoutput.txt 
ECHO =====Add Files====== >> syncoutput.txt
@call git add -A . >> syncoutput.txt 2>&1
@ECHO.>> syncoutput.txt
PAUSE
ECHO =======Status======= >> syncoutput.txt
@call git status >> syncoutput.txt 2>&1
@ECHO.>> syncoutput.txt
PAUSE
ECHO ====Commit Files==== >> syncoutput.txt
@SET syncmsg=%syncmsg:"=%
@call git commit -m "%syncmsg%" >> syncoutput.txt 2>&1
@ECHO.>> syncoutput.txt
PAUSE
ECHO ====Pull==== >> syncoutput.txt
@call git pull --rebase >> syncoutput.txt 2>&1
@ECHO.>> syncoutput.txt
PAUSE
ECHO ====Push==== >> syncoutput.txt
@call git push >> syncoutput.txt 2>&1
@call git push VSO >> syncoutput.txt 2>&1
@ECHO.>> syncoutput.txt
ECHO ++++++++++++ DONE +++++++++++++>> syncoutput.txt
PAUSE

GOTO EXIT

:SYNCNOMSG
SET syncmsg=SYNC from NOVA
DEL syncoutput.txt
ECHO ON
ECHO +++++++++++ START +++++++++++++ >> syncoutput.txt
ECHO =====Add Files====== >> syncoutput.txt
@call git add -A . >> syncoutput.txt 2>&1
@ECHO.>> syncoutput.txt
PAUSE
ECHO =======Status======= >> syncoutput.txt
@call git status >> syncoutput.txt 2>&1
@ECHO.>> syncoutput.txt
PAUSE
ECHO ====Commit Files==== >> syncoutput.txt
@SET syncmsg=%syncmsg:"=%
@call git commit -m "%syncmsg%" >> syncoutput.txt 2>&1
@ECHO.>> syncoutput.txt
PAUSE
ECHO ====Pull==== >> syncoutput.txt
@call git pull --rebase >> syncoutput.txt 2>&1
@ECHO.>> syncoutput.txt
PAUSE
ECHO ====Push==== >> syncoutput.txt
@call git push >> syncoutput.txt 2>&1
@call git push VSO >> syncoutput.txt 2>&1
@ECHO.>> syncoutput.txt
ECHO ++++++++++++ DONE +++++++++++++>> syncoutput.txt
PAUSE
 
GOTO EXIT

:EXIT