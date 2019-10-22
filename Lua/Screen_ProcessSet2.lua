require("Lua/ScreenId");
require("Lua/Screen_ProcessSet1")
require("Lua/Screen_ProcessSelect2");
require("Lua/Screen_ActionSelect")

local THIS_SCREEN = PROCESS_SET2_SCREEN;

ProcessSelectButtonId = 35;
ProcessSelectId = 38;

--这里注意观察动作选择id,动作名称id,编辑id之间的数学转换关系:selectId = nameId + 100; nameId = EditId + 100
ActionTab = {
    [1]  = {selectId = 300, nameId = 200, EditId = 100},
    [2]  = {selectId = 301, nameId = 201, EditId = 101},
    [3]  = {selectId = 302, nameId = 202, EditId = 102},
    [4]  = {selectId = 303, nameId = 203, EditId = 103},
    [5]  = {selectId = 304, nameId = 204, EditId = 104},
    [6]  = {selectId = 305, nameId = 205, EditId = 105},
    [7]  = {selectId = 306, nameId = 206, EditId = 106},
    [8]  = {selectId = 307, nameId = 207, EditId = 107},
    [9]  = {selectId = 308, nameId = 208, EditId = 108},
    [10] = {selectId = 309, nameId = 209, EditId = 109},
    [11] = {selectId = 310, nameId = 210, EditId = 110},
    [12] = {selectId = 311, nameId = 211, EditId = 111},
};


--设置编辑按钮对应的跳转界面
function set_edit_screen(para)
    if para == ActionItem[1] then --开始界面
        change_screen(PROCESS_START_SCREEN);
    elseif para == ActionItem[2] then --取样界面
        change_screen(PROCESS_GET_SANPLE_SCREEN);
    elseif para == ActionItem[3] then --注射泵加液体
        change_screen(PROCESS_INJECT_SCREEN);
    elseif para == ActionItem[4] then --读取信号
        change_screen(PROCESS_READ_SIGNAL_SCREEN);
    elseif para == ActionItem[5] then --蠕动泵加液
        change_screen(PROCESS_PERISTALTIC_SCREEN);
    elseif para == ActionItem[6] then --计算
        change_screen(PROCESS_CALCULATE_SCREEN);
    elseif para == ActionItem[7] then --等待时间
        change_screen(PROCESS_WAIT_TIME_SCREEN);
    elseif para == ActionItem[8] then --消解
        change_screen(PROCESS_DISPEL_SCREEN);
    elseif para == ActionItem[9] then --阀操作
        change_screen(PROCESS_VALVE_CTRL_SCREEN);
    end

end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set2_control_notify(screen,control,value)
    if control == ProcessSelectButtonId then--当点击流程选择按钮时
        process_select2_set(THIS_SCREEN, ProcessSelectId);
    elseif control == ProcessSelectId then
        --        set_text(process_set1_control_notify,);
    elseif (control-100) >= ActionTab[1].selectId and (control-100) <= ActionTab[12].selectId then--当点击"动作选择"下面的按钮时
        action_select_set(THIS_SCREEN, control-100);
    elseif control >= ActionTab[1].EditId and control <= ActionTab[12].EditId then--当点击"编辑"按钮时
        if string.len( get_text(THIS_SCREEN, control+100) ) ~= 0 then--如果设置了动作名称(编辑按钮的id+100等于动作名称id)
            set_edit_screen(get_text(THIS_SCREEN, control+200));--control+200表示对应的"动作选择"id
        end
    end
end

--当画面切换时，执行此回调函数，screen为目标画面。
function goto_ProcessSet2()
    
end