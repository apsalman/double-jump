#SingleInstance, Force
#if WinExist("ahk_exe MapleIdleRPG.exe")

;항상 관리자 권한으로 실행(PC버전은 관리자 권한 실행을 안하면 동작을 안함)
if not A_IsAdmin
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}

;Gui 쪽인데 건드릴 필요 없음
Gui, Add, Text, x10 y14 w100 h20, 점프 주기(ms)
Gui, Add, Edit, x120 y10 w80 h20 vJumpTiming, 4000
Gui, Add, Text, x10 y44 w100 h20, 점프 키
Gui, Add, Edit, x120 y40 w80 h20 vJumpKey, Space
Gui, Add, Button, x10 y70 w90 h30 gStart, 시작
Gui, Add, Button, x110 y70 w90 h30 gStop, 정지
Gui, Show
return

Start:
Gui, Submit, NoHide
SetTimer, Jump, % JumpTiming
return

Stop:
Gui, Submit, NoHide
SetTimer, Jump, Off
return

Jump:
if(!WinExist("ahk_exe MapleIdleRPG.exe"))
	return    

Gui, Submit, NoHide
SendInput, % "{" JumpKey "}"
Sleep, 100
SendInput, % "{" JumpKey "}"
return  
  
GuiClose:
ExitApp