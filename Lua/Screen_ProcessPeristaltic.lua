require("Lua/ScreenId");

local THIS_SCREEN =  PROCESS_PERISTALTIC_SCREEN
local SureButtonId = 99;--确认按钮
local CancelButtonId = 98;--取消按钮

local DestScreen;

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_peristaltic_set(screen)
	DestScreen = screen;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_peristaltic_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end