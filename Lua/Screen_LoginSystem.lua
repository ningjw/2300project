require("Lua/ScreenId")

local THIS_SCREEN = LOGIN_SYSTEM_SCREEN;
local UserNameId = 26;
local userName;

--该函数在on_control_notify中进行调用,当点击系统信息中的密码设置相关按钮时调用该函数
function login_system_set(user)
    userName = user;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function login_system_control_notify(screen,control,value)
    
end

--当画面切换时，执行此回调函数，screen为目标画面。
function goto_LoginSystem()
    set_text(THIS_SCREEN, UserNameId, userName);
end
