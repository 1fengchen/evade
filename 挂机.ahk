; ---------- 仅针对游戏窗口生效 ----------
#IfWinActive ahk_exe RobloxPlayerBeta.exe

; ---------- Delete 键控制←↑持续按下 ----------
toggle_movement := false  ; 初始化状态变量

Delete::
    toggle_movement := !toggle_movement
    if (toggle_movement) {
        SendInput {Left Down}{Up Down}
        SetTimer KeepAlive, 180000  ; 改为每 10 秒（10000 毫秒）
    } else {
        SendInput {Left Up}{Up Up}
        SetTimer KeepAlive, Off
    }
return

; ---------- 新心跳机制 ----------
KeepAlive:
    SendInput {Blind}{t}  ; 改为发送 T 键
    Sleep 50  ; 添加短暂延迟
    SendInput {Blind}{t Up}  ; 显式释放按键
return