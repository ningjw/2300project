require("Lua/ScreenId");
require("Lua/Screen_ProcessSet1");

local FirstButtonId = 101;--第一个按钮
local LastButtonId = 112;--最后一个按钮

local SureButtonId = 19;--确认按钮
local CancelButtonId = 18;--取消按钮

local TipsTextId = 13;

local DestScreen;--点击"确认""取消"按钮后切换到哪一个目标画面
local DestControl;--点击"确认""取消"按钮后,对哪一个目标控件进行操作

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_select2_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_select2_control_notify(screen,control,value)
    if control >= FirstButtonId and control <= LastButtonId then
        ProcessSelec2tItem = control-100;--control-100 = 与该按钮重合的文本框id
    elseif control == SureButtonId then --确认按钮
        change_screen(DestScreen);
        if ProcessSelec2tItem ~= nil then --ProcessSelec2tItem默认为nil,如果选择了某个流程则该值不为nil
            set_text(DestScreen, DestControl, get_text(PROCESS_SELECT2_SCREEN, ProcessSelec2tItem));--DestControl对应动作选择
            set_text(DestScreen, DestControl-100, get_text(PROCESS_SELECT2_SCREEN, ProcessSelec2tItem));--DestControl-100对应动作名称
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--当画面切换时，执行此回调函数，screen为目标画面。
function goto_ProcessSelect2()
    --将所有按钮进行隐藏
    for i = FirstButtonId, LastButtonId,1 do
        set_visiable(PROCESS_SELECT2_SCREEN, i, 0);
    end
    --将所有与按钮重合的文本框进行隐藏
    for i = FirstButtonId-100, LastButtonId-100,1 do
        set_visiable(PROCESS_SELECT2_SCREEN, i, 0);
    end
    --隐藏提示信息
    set_visiable(PROCESS_SELECT2_SCREEN,TipsTextId,0);

    --遍历流程1-12,看是否有设置名称,如果设置了名称,则在流程选择2界面中进行显示
    NumberOfProcess = 0;
    for i = 1, 12, 1 do
        if string.len(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId)) ~= 1 and 
           string.len(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId)) ~= 0 then--获取名称长度,当名称长度不为0时表示有效
            NumberOfProcess = NumberOfProcess + 1;--个数+1
            set_visiable(PROCESS_SELECT2_SCREEN, NumberOfProcess,  1);--显示id为NumberOfProcess的文本
            set_text(PROCESS_SELECT2_SCREEN, NumberOfProcess, get_text(PROCESS_SET1_SCREEN,TabProcess[i].nameId))--为该文本框设置内容
            set_visiable(PROCESS_SELECT2_SCREEN,100+NumberOfProcess,1);--显示与该文本框对应的按钮
        end
    end

    --显示提示信息
    if NumberOfProcess == 0 then
        set_visiable(PROCESS_SELECT2_SCREEN,TipsTextId, 1);
    end

end