require("Lua/ScreenId");

ActionItem = {"开始","取样","注射泵加液体","读取信号","蠕动泵加液","计算","等待时间","消解","阀操作"," "};
ActionSelectItem = nil;

local SureButtonId = 19;--确认按钮
local CancelButtonId = 18;--取消按钮
local StartButtonId = 1;
local NullButtonId = 10;

local DestScreen;
local DestControl;


--该函数在on_control_notify中进行调用（当需要选择流程时）
function action_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function action_select_control_notify(screen,control,value)
    if control >= StartButtonId and control <= NullButtonId then
        ActionSelectItem = control;
    elseif control == SureButtonId then --确认按钮
        change_screen(DestScreen);
        if ActionSelectItem ~= nil then
            set_text(DestScreen, DestControl, ActionItem[ActionSelectItem]);--动作选择
            set_text(DestScreen, DestControl-100, ActionItem[ActionSelectItem]);--DestControl-100对应动作名称
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--当画面切换时，执行此回调函数，screen为目标画面。
function goto_ActionSelect()

end

