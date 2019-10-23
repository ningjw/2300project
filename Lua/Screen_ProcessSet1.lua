require("Lua/Screen_ProcessSelect");
require("Lua/Screen_RangeSelect");
require("Lua/ScreenId");
require("Lua/Screen_Main");

local THIS_SCREEN = PROCESS_SET1_SCREEN

--流程设置表中各控件Id,注意selecId与nameId的数学关系:selectId = nameId + 100, selectId = deleteId + 220 等等
TabProcess = {[1] = {selectId = 300, nameId = 200, rangeId = 312, activeId = 95, deleteId = 80},
              [2] = {selectId = 301, nameId = 201, rangeId = 313, activeId = 96, deleteId = 81},
              [3] = {selectId = 302, nameId = 202, rangeId = 314, activeId = 97, deleteId = 82},
              [4] = {selectId = 303, nameId = 203, rangeId = 315, activeId = 99, deleteId = 83},
              [5] = {selectId = 304, nameId = 204, rangeId = 316, activeId = 100,deleteId = 84},
              [6] = {selectId = 305, nameId = 205, rangeId = 317, activeId = 101,deleteId = 85},
              [7] = {selectId = 306, nameId = 206, rangeId = 318, activeId = 102,deleteId = 85},
              [8] = {selectId = 307, nameId = 207, rangeId = 319, activeId = 103,deleteId = 87},
              [9] = {selectId = 308, nameId = 208, rangeId = 320, activeId = 104,deleteId = 88},
              [10]= {selectId = 309, nameId = 209, rangeId = 321, activeId = 105,deleteId = 89},
              [11]= {selectId = 310, nameId = 210, rangeId = 322, activeId = 48, deleteId = 90},
              [12]= {selectId = 311, nameId = 211, rangeId = 323, activeId = 92, deleteId = 91},
       };


AnalyteSetId = 38;--分析物选择
CodeSetId = 107;--代码
UniteSetId = 36;--单位选择
UniteSetTextId = 111--单位设置成功后,用于显示单位文本的id


--设置单位
function set_unit()
    local Unite = get_text(THIS_SCREEN, UniteSetTextId);
    --量程设置界面中,控件Id = 200 ~ 208为单位显示文本
    for i = 200,208,1 do 
        set_text(RANGE_SET_SCREEN, i, Unite);
    end
    --首页中,空间Id= 19 为单位显示
    set_text(MAIN_SCREEN,LastAnalysisUnitId, Unite);
    --量程选择界面中,控件Id = 15/20/25为单位显示文本
    set_text(RANGE_SELECT_SCREEN,15 , Unite);
    set_text(RANGE_SELECT_SCREEN,20 , Unite);
    set_text(RANGE_SELECT_SCREEN,25 , Unite);
end


--设置分析物
function set_analyte()
    set_text(MAIN_SCREEN, LastAnalyteId, get_text(THIS_SCREEN, AnalyteSetId));
end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set1_control_notify(screen,control,value)
    if(control == UniteSetId) then --设置单位
        set_unit();
    elseif control == AnalyteSetId then
        set_analyte();
    --control-100表示与该按钮重合的文本框id
    elseif (control-100) >= TabProcess[1].selectId and (control-100) <= TabProcess[12].selectId then --这里是流程选择下的各个按钮
        process_select_set(screen, control-100);
    elseif (control-100) >= TabProcess[1].rangeId and (control-100) <= TabProcess[12].rangeId  then --这里是量程选择下的各个按钮
        range_select_set(screen, control-100);
    elseif control >= TabProcess[1].deleteId and control <= TabProcess[12].deleteId then--删除按钮
        if string.len(get_text(THIS_SCREEN, control+120)) ~= 1 and  --名称可能为一个空格,此时当做名称没有设置
           string.len(get_text(THIS_SCREEN, control+120)) ~= 0 then --名称的长度为0,表示名称没有设置
            set_text(THIS_SCREEN, control+220," ");--将对应流程选择的文本显示为空格
            set_text(THIS_SCREEN, control+120," ");--将对应流程名称的文本显示为空格
        end
    end   


end


