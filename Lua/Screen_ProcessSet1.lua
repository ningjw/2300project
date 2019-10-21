require("Lua/Screen_ProcessSelect");
require("Lua/Screen_RangeSelect");
require("Lua/ScreenId");


--流程设置表中各控件Id
Tab1 = {process1 = {selectId = 300, nameId = 92,  rangeId = 312, activeId = 95},
        process2 = {selectId = 301, nameId = 94,  rangeId = 313, activeId = 96},
        process3 = {selectId = 302, nameId = 113, rangeId = 314, activeId = 97},
        process4 = {selectId = 303, nameId = 115, rangeId = 315, activeId = 99},
        process5 = {selectId = 304, nameId = 117, rangeId = 316, activeId = 100},
        process6 = {selectId = 305, nameId = 119, rangeId = 317, activeId = 101},
        process7 = {selectId = 306, nameId = 121, rangeId = 318, activeId = 102},
        process8 = {selectId = 307, nameId = 123, rangeId = 319, activeId = 103},
        process9 = {selectId = 308, nameId = 125, rangeId = 320, activeId = 104},
        process10= {selectId = 309, nameId = 127, rangeId = 321, activeId = 105},
        process11= {selectId = 310, nameId = 50,  rangeId = 322, activeId = 48},
        process12= {selectId = 311, nameId = 93,  rangeId = 323, activeId = 91},
       };


AnalyteSetId = 38;--分析物选择
CodeSetId = 107;--代码
UniteSetId = 36;--单位选择

--设置单位
function set_unit()

end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set1_control_notify(screen,control,value)
    if(control == UniteSetId) then --设置单位
        set_unit();
    end

    --control-100表示与该按钮重合的文本框id
    if (control-100) >= Tab1.process1.selectId and (control-100) <= Tab1.process12.selectId then --这里是流程选择下的各个按钮
        process_select_set(screen, control-100);
    elseif (control-100) >= Tab1.process1.rangeId and (control-100) <= Tab1.process12.rangeId  then --这里是量程选择下的各个按钮
        range_select_set(screen, control-100);
    end


end


