require("Lua/ScreenId");
require("Lua/Screen_ProcessSet1")
require("Lua/Screen_ProcessSelect2");

ProcessSelectButtonId = 35;
ProcessSelectId = 38;



--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set2_control_notify(screen,control,value)
    if control == ProcessSelectButtonId then
        process_select2_set(PROCESS_SET2_SCREEN,ProcessSelectId);
    end
end

--当画面切换时，执行此回调函数，screen为目标画面。
function goto_ProcessSet2()
    
end