require("Lua/ScreenId");
require("Lua/Screen_ProcessSet2");

local THIS_SCREEN = PROCESS_SET3_SCREEN;
local ProcessSelectTextId = 38;


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set3_control_notify(screen,control,value)
    if control == ProcessSelectButtonId then--当点击流程选择按钮时
        process_select2_set(THIS_SCREEN, ProcessSelectId);
    elseif (control-100) >= ActionTab[13].selectId and (control-100) <= ActionTab[24].selectId then--当点击"动作选择"下面的按钮时
        action_select_set(THIS_SCREEN, control-100);
    elseif control >= ActionTab[13].EditId and control <= ActionTab[24].EditId then--当点击"编辑"按钮时
        if string.len( get_text(THIS_SCREEN, control+100) ) ~= 0 then--如果设置了动作名称(编辑按钮的id+100等于动作名称id)
            set_edit_screen(get_text(THIS_SCREEN, control+200), THIS_SCREEN);--control+200表示对应的"动作选择"id
        end
    end
end


--当画面切换时，执行此回调函数，screen为目标画面。
function goto_ProcessSet3()
    set_text(THIS_SCREEN, ProcessSelectTextId, get_text(PROCESS_SET2_SCREEN,ProcessSelectId));
end