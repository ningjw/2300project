--下面列出了常用的回调函数
--更多功能请阅读<<物联型LUA脚本API.pdf>>
--建议使用visual code studio 并安装Bookmarks插件,通过打开同目录下的2300project.code-workspace工作空间查看该文件.


--定义对界面id进行宏定义
MAIN_SCREEN = 0;
RUN_CONTROL_SCREEN = 1;
PROCESS_SET1_SCREEN = 2;
PROCESS_SET2_SCREEN = 3;
PROCESS_SET3_SCREEN = 4;
PROCESS_START_SCREEN = 5;
PROCESS_GET_SANPLE_SCREEN = 6;
PROCESS_INJECT_SCREEN = 7;
PROCESS_PERISTALTIC_SCREEN = 8;
PROCESS_DISPEL_SCREEN = 9;
PROCESS_READ_SIGNAL_SCREEN = 10;
PROCESS_CALCULATE_SCREEN = 11;
PROCESS_VALVE_CTRL_SCREEN = 12;
PROCESS_WAIT_TIME_SCREEN = 13;
PROCESS_SELECT_SCREEN = 14;
PROCESS_SELECT2_SCREEN = 15;
ACTION_SELECT_SCREEN = 16;
RANGE_SET_SCREEN = 17;
RANGE_SELECT_SCREEN = 18;
HAND_OPERATE1_SCREEN = 19;
HAND_OPERATE2_SCREEN = 20;
HAND_OPERATE3_SCREEN = 21;
HAND_OPERATE4_SCREEN = 22;
IN_OUT_SCREEN = 23;
HISTORY_ANALYSIS_SCREEN = 24;
HISTORY_CALIBRATION_SCREEN = 25;
HISTORY_ALARM_SCREEN = 26;
HISTORY_LOG_SCREEN = 27;
SYSTEM_INFO_SCREEN = 28;
PASSWORD_SET_SCREEN = 29;
LOGIN_SYSTEM_SCREEN = 30;

--这里定义的Public table包含了有状态栏的界面, 方便更新"工作状态""当前动作""用户""报警"
PublicTab = {
    [1]  = MAIN_SCREEN,
    [2]  = RUN_CONTROL_SCREEN,
    [3]  = PROCESS_SET1_SCREEN,
    [4]  = PROCESS_SET2_SCREEN,
    [5]  = PROCESS_SET3_SCREEN,
    [6]  = RANGE_SET_SCREEN,
    [7]  = HAND_OPERATE1_SCREEN,
    [8]  = HAND_OPERATE2_SCREEN,
    [9]  = HAND_OPERATE3_SCREEN,
    [10] = HAND_OPERATE4_SCREEN,
    [11] = IN_OUT_SCREEN,
    [12] = HISTORY_ANALYSIS_SCREEN,
    [13] = HISTORY_CALIBRATION_SCREEN,
    [14] = HISTORY_ALARM_SCREEN,
    [15] = HISTORY_LOG_SCREEN,
    [16] = SYSTEM_INFO_SCREEN
};

-----------------------------首页 控件ID----------------------------------------------------
LastAnalysisTimeId = 20;   --分析时间
LastAnalyteId = 17;        --分析物
LastAnalysisResultId = 18; --分析结果
LastAnalysisUnitId = 19;   --单位
LastAnalysisE1Id = 25;     --E1
LastAnalysisE2Id = 26;     --E2



-------------------------运行控制 控件ID-----------------------------------------------------
RunTypeID = 43;--运行方式对应的文本空间ID
RunStatusId = 131;--运行状态切换按钮"开始""停止"按钮
--手动设置
HandProcessID = 300;--手动设置：手动流程对应的文本控件ID
HandProcessTimesID = 171; --手动设置：次数对应的文本空间ID

--周期设置
PeriodicTab = { Process1Id = 301, Process2Id = 302, Process3Id = 303, Process4Id = 304,
                YearId = 155, MonthId = 156, DayId = 157, HourId = 158, MinuteId = 159, FreqId = 176};

--定时设置
TimedTab = {
	Process1  = {Id = 305, StartHourId = 94,  StartMinuteId = 95},
	Process2  = {Id = 306, StartHourId = 92,  StartMinuteId = 96},
	Process3  = {Id = 307, StartHourId = 119, StartMinuteId = 120},
	Process4  = {Id = 308, StartHourId = 49,  StartMinuteId = 50},
	Process5  = {Id = 309, StartHourId = 98,  StartMinuteId = 99},
	Process6  = {Id = 310, StartHourId = 122, StartMinuteId = 123},
	Process7  = {Id = 311, StartHourId = 54,  StartMinuteId = 56},
	Process8  = {Id = 312, StartHourId = 101, StartMinuteId = 102},
	Process9  = {Id = 313, StartHourId = 125, StartMinuteId = 126},
	Process10 = {Id = 314, StartHourId = 60,  StartMinuteId = 62},
	Process11 = {Id = 315, StartHourId = 104, StartMinuteId = 105},
	Process12 = {Id = 316, StartHourId = 128, StartMinuteId = 129},
	Process13 = {Id = 317, StartHourId = 67,  StartMinuteId = 69},
	Process14 = {Id = 318, StartHourId = 107, StartMinuteId = 108},
	Process15 = {Id = 319, StartHourId = 132, StartMinuteId = 133},
	Process16 = {Id = 320, StartHourId = 73,  StartMinuteId = 76},
	Process17 = {Id = 321, StartHourId = 11,  StartMinuteId = 111},
	Process18 = {Id = 322, StartHourId = 135, StartMinuteId = 136},
	Process19 = {Id = 323, StartHourId = 80, StartMinuteId  = 82},
	Process20 = {Id = 324, StartHourId = 113, StartMinuteId = 114},
	Process21 = {Id = 325, StartHourId = 138, StartMinuteId = 139},
	Process22 = {Id = 326, StartHourId = 86, StartMinuteId  = 88},
	Process23 = {Id = 327, StartHourId = 116, StartMinuteId = 117},
	Process24 = {Id = 328, StartHourId = 141, StartMinuteId = 142},
};


-------------------------流程设置1 控件ID------------------------------------------------------------------

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



--------------------------------------流程设置2/3 控件ID------------------------------------------------------

ProcessSelectButtonId = 35;--位于流程设置2
ProcessSelectId = 38;      --位于流程设置2
ProcessSelectShowId = 38;  --位于流程设置3

--这里注意观察动作选择id,动作名称id,编辑id之间的数学转换关系:selectId = nameId + 100; nameId = EditId + 100
--其中[1]-[12]中包含的id控件在流程设置2界面中,[13]-[24]中包含的id控件在流程设置3界面中
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
    [13] = {selectId = 300, nameId = 200, EditId = 100},
    [14] = {selectId = 301, nameId = 201, EditId = 101},
    [15] = {selectId = 302, nameId = 202, EditId = 102},
    [16] = {selectId = 303, nameId = 203, EditId = 103},
    [17] = {selectId = 304, nameId = 204, EditId = 104},
    [18] = {selectId = 305, nameId = 205, EditId = 105},
    [19] = {selectId = 306, nameId = 206, EditId = 106},
    [20] = {selectId = 307, nameId = 207, EditId = 107},
    [21] = {selectId = 308, nameId = 208, EditId = 108},
    [22] = {selectId = 309, nameId = 209, EditId = 109},
    [23] = {selectId = 310, nameId = 210, EditId = 110},
    [24] = {selectId = 311, nameId = 211, EditId = 111},
};

-----------------------------------流程设置-开始 控件ID--------------------------------------------
--在所有子界面中("开始/取样/消解/......"),确认按钮的id都是99,取消按钮的id都是98.
SureButtonId = 99;--确认按钮
CancelButtonId = 98;--取消按钮
DestScreen = nil;
DestControl = nil;

AnalysisTypeMenuId = 4;
AnalysisTypeTextId = 7;
ResetSystemButtonId = 5;

-----------------------------------流程设置-取样 控件ID--------------------------------------------




-----------------------------------流程设置-注射泵取样 控件ID--------------------------------------------




-----------------------------------流程设置-蠕动泵取样 控件ID--------------------------------------------



-----------------------------------流程设置-消解 控件ID--------------------------------------------



-----------------------------------流程设置-读取信号 控件ID-----------------------------------



-----------------------------------流程设置-计算 控件ID--------------------------------------



-----------------------------------流程设置-阀操作 控件ID------------------------------------




-----------------------------------流程设置-等待时间 控件ID------------------------------------



-----------------------------------流程选择 控件ID--------------------------------------------
AnalysisButtonId = 1;--分析按钮
NullButtonId = 8;--空按钮


-----------------------------------流程选择2 控件ID--------------------------------------------
FirstButtonId = 101;--第一个按钮
LastButtonId = 112;--最后一个按钮
TipsTextId = 13;--提示文本框

-----------------------------------动作选择 控件ID--------------------------------------------
ActionStartButtonId = 1;
ActionEndButtonId = 10;


-----------------------------------量程设置 控件ID--------------------------------------------
--在量程设置/量程选择界面中,量程1/2/3文本的id都是一样的
Range1LowId = 64;--量程1文本id
Range1HighId = 65;--量程1文本id
Range2LowId = 77;--量程2文本id
Range2HighId = 78;--量程2文本id
Range3LowId = 115;--量程3文本id
Range3HighId = 116;--量程3文本id

RangeTab = {
    [1] = {LowId = 64, HighId = 65, densityCalLowId = 81, densityCalHighId = 84, aId = 48, bId = 49, cId = 50, dId = 51},
    [2] = {LowId = 77, HighId = 78, densityCalLowId = 67, densityCalHighId = 70, aId = 52, bId = 53, cId = 54, dId = 55 },
    [3] = {LowId = 115,HighId= 116, densityCalLowId = 105,densityCalHighId = 108,aId = 92, bId = 93, cId = 94, dId = 95},
};


-----------------------------------量程选择 控件ID--------------------------------------------
Range1Id = 1;--量程1按钮Id
Range2Id = 2;--量程2按钮Id
Range3Id = 3;--量程3按钮Id


-----------------------------------手动操作1 控件ID--------------------------------------------




-----------------------------------手动操作2 控件ID--------------------------------------------





-----------------------------------手动操作3 控件ID--------------------------------------------




-----------------------------------手动操作4 控件ID--------------------------------------------





-----------------------------------输入输出 控件ID--------------------------------------------





-----------------------------------分析记录 控件ID--------------------------------------------





-----------------------------------校准记录 控件ID--------------------------------------------




-----------------------------------报警记录 控件ID--------------------------------------------




-----------------------------------运行日志 控件ID--------------------------------------------




-----------------------------------系统信息 控件ID--------------------------------------------



-----------------------------------密码设置 控件ID--------------------------------------------



-----------------------------------登录系统 控件ID--------------------------------------------




-----------------------------------分界线,上面是各种空间的id定义,下面是函数调用---------------------


------------------------------------系统入口函数--------------------------------------------------
--初始化函数,系统加载LUA脚本后，立即调用次回调函数
function on_init()
	
	uart_set_baudrate(38400);
end

--定时回调函数，系统每隔1秒钟自动调用。
function on_systick()

end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function on_control_notify(screen,control,value)
	if screen == RUN_CONTROL_SCREEN then --运行控制界面
		run_control_notify(screen,control,value);
	elseif screen == PROCESS_SELECT_SCREEN then --流程选择界面
		process_select_control_notify(screen,control,value);
	elseif screen == PROCESS_SELECT2_SCREEN then--流程选择2界面
		process_select2_control_notify(screen,control,value);	
	elseif screen == PROCESS_SET1_SCREEN then --流程设置1界面
		process_set1_control_notify(screen,control,value);
	elseif screen == PROCESS_SET2_SCREEN then --流程设置2界面
		process_set2_control_notify(screen,control,value);
   elseif screen == PROCESS_SET3_SCREEN then --流程设置3界面
		process_set3_control_notify(screen,control,value);
	elseif screen == RANGE_SELECT_SCREEN then --量程选择界面
		range_select_control_notify(screen,control,value);
	elseif screen == ACTION_SELECT_SCREEN then--动作选择界面
		action_select_control_notify(screen,control,value);
	elseif screen == PROCESS_START_SCREEN then--流程设置-开始界面
		process_start_control_notify(screen,control,value);
	elseif screen == PROCESS_GET_SANPLE_SCREEN	then--流程设置-取样界面
		process_get_sample_control_notify(screen,control,value);
	elseif screen == PROCESS_INJECT_SCREEN	then--流程设置-注射泵加液
		process_inject_control_notify(screen,control,value);
	elseif screen == PROCESS_PERISTALTIC_SCREEN	then--流程设置-蠕动泵加液
		process_peristaltic_control_notify(screen,control,value);
	elseif screen == PROCESS_DISPEL_SCREEN then--流程设置-消解
		process_dispel_control_notify(screen,control,value);
   elseif screen == PROCESS_READ_SIGNAL_SCREEN then--流程设置-读取信号
		process_read_signal_control_notify(screen,control,value);
   elseif screen == PROCESS_CALCULATE_SCREEN then--流程设置-计算
		process_calculate_control_notify(screen,control,value);	
   elseif screen == PROCESS_VALVE_CTRL_SCREEN then--流程设置-阀操作
		process_valve_ctrl_control_notify(screen,control,value);
   elseif screen == PROCESS_WAIT_TIME_SCREEN then--流程设置-等待时间
		process_wait_time_control_notify(screen,control,value);	
	elseif screen == SYSTEM_INFO_SCREEN then --系统信息界面
		system_info_control_notify(screen,control,value);	
	elseif screen== LOGIN_SYSTEM_SCREEN then--登录系统界面
		login_system_control_notify(screen,control,value);	
	elseif screen== PASSWORD_SET_SCREEN then--密码设置界面
		login_system_control_notify(screen,control,value);		
	end
end



--当画面切换时，执行此回调函数，screen为目标画面。
function on_screen_change(screen)
	if(screen == RANGE_SELECT_SCREEN) then --跳转到量程选择
		goto_range_select();
	elseif screen== PROCESS_SELECT2_SCREEN then --跳转到流程选择3
		goto_ProcessSelect2();
	elseif screen== PROCESS_SELECT3_SCREEN then --跳转到流程选择3
		goto_ProcessSelect3();
	elseif screen== ACTION_SELECT_SCREEN then --跳转到动作选择
		goto_ActionSelect();
	elseif screen== LOGIN_SYSTEM_SCREEN then--登录系统
		goto_LoginSystem();
	elseif screen== PASSWORD_SET_SCREEN then--密码设置
		goto_PasswordSet();
	end
end


--定时器超时，执行此回调函数,定时器编号 0~31
function on_timer(timer_id)

end


--插入 U 盘后，执行此回调函数
function on_usb_inserted(dir)

end

--拔出 U 盘后，执行此回调函数
function on_usb_removed()

end

--插入 SD 卡后，执行此回调函数
function on_sd_inserted(dir)

end

--拔出 SD 卡后，执行此回调函数
function on_sd_removed()

end

--设置全局变量uart_free_protocol，使用自由串口协议
uart_free_protocol = 1
--串口自定义函数
function on_uart_recv_data(rev_data)

end


-----------------------------------首页 函数定义----------------------------------------------------


-----------------------------------运行控制 函数定义-------------------------------------------------
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function run_control_notify(screen,control,value)
	--control-100表示与该按钮重合的文本框
	if (control-100) >= HandProcessID and (control-100) <= TimedTab.Process24.Id then--当点击需要选择流程的文本框时
		process_select2_set(screen, control-100);--(control100)表示与该按钮重合的文本框
	end
end


-----------------------------------流程设置1 函数定义------------------------------------------------
--设置单位
function set_unit()
    local Unite = get_text(PROCESS_SET1_SCREEN, UniteSetTextId);
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


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set1_control_notify(screen,control,value)
    if(control == UniteSetId) then --设置单位
        set_unit();
    elseif control == AnalyteSetId then
        set_text(MAIN_SCREEN, LastAnalyteId, get_text(PROCESS_SET1_SCREEN, AnalyteSetId));--设置分析物
    --control-100表示与该按钮重合的文本框id
    elseif (control-100) >= TabProcess[1].selectId and (control-100) <= TabProcess[12].selectId then --这里是流程选择下的各个按钮
        process_select_set(screen, control-100);
    elseif (control-100) >= TabProcess[1].rangeId and (control-100) <= TabProcess[12].rangeId  then --这里是量程选择下的各个按钮
        range_select_set(screen, control-100);
    elseif control >= TabProcess[1].deleteId and control <= TabProcess[12].deleteId then--删除按钮
        if string.len(get_text(PROCESS_SET1_SCREEN, control+120)) ~= 1 and  --名称可能为一个空格,此时当做名称没有设置
           string.len(get_text(PROCESS_SET1_SCREEN, control+120)) ~= 0 then --名称的长度为0,表示名称没有设置
            set_text(PROCESS_SET1_SCREEN, control+220," ");--将对应流程选择的文本显示为空格
			set_text(PROCESS_SET1_SCREEN, control+120," ");--将对应流程名称的文本显示为空格
			set_text(PROCESS_SET1_SCREEN, control+232," ");--将对应流程的量程设置为空格显示
        end
    end
end


-----------------------------------流程设置2/3 函数定义------------------------------------------------
--设置编辑按钮对应的跳转界面
function set_edit_screen(para,screen)
    if para == ActionItem[1] then --开始界面
        change_screen(PROCESS_START_SCREEN);
        process_start_set(screen)
    elseif para == ActionItem[2] then --取样界面
        change_screen(PROCESS_GET_SANPLE_SCREEN);
        process_get_sample_set(screen);
    elseif para == ActionItem[3] then --注射泵加液体
        change_screen(PROCESS_INJECT_SCREEN);
        process_inject_set(screen);
    elseif para == ActionItem[4] then --读取信号
        change_screen(PROCESS_READ_SIGNAL_SCREEN);
        process_read_signal_set(screen);
    elseif para == ActionItem[5] then --蠕动泵加液
        change_screen(PROCESS_PERISTALTIC_SCREEN);
        process_peristaltic_set(screen);
    elseif para == ActionItem[6] then --计算
        change_screen(PROCESS_CALCULATE_SCREEN);
        process_calculate_set(screen);
    elseif para == ActionItem[7] then --等待时间
        change_screen(PROCESS_WAIT_TIME_SCREEN);
        process_wait_time_set(screen);
    elseif para == ActionItem[8] then --消解
        change_screen(PROCESS_DISPEL_SCREEN);
        process_dispel_set(screen);
    elseif para == ActionItem[9] then --阀操作
        change_screen(PROCESS_VALVE_CTRL_SCREEN);
        process_valve_ctrl_set(screen);
    end
end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set2_control_notify(screen,control,value)
    if control == ProcessSelectButtonId then--当点击流程选择按钮时
        process_select2_set(PROCESS_SET2_SCREEN, ProcessSelectId);
    elseif control == ProcessSelectId then
        --        set_text(process_set1_control_notify,);
    elseif (control-100) >= ActionTab[1].selectId and (control-100) <= ActionTab[12].selectId then--当点击"动作选择"下面的按钮时
        action_select_set(PROCESS_SET2_SCREEN, control-100);
    elseif control >= ActionTab[1].EditId and control <= ActionTab[12].EditId then--当点击"编辑"按钮时
        if string.len( get_text(PROCESS_SET2_SCREEN, control+100) ) ~= 0 then--如果设置了动作名称(编辑按钮的id+100等于动作名称id)
            set_edit_screen(get_text(PROCESS_SET2_SCREEN, control+200), PROCESS_SET2_SCREEN);--control+200表示对应的"动作选择"id
        end
    end
end



--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set3_control_notify(screen,control,value)
    if control == ProcessSelectButtonId then--当点击流程选择按钮时
        process_select2_set(PROCESS_SET3_SCREEN, ProcessSelectId);
    elseif (control-100) >= ActionTab[13].selectId and (control-100) <= ActionTab[24].selectId then--当点击"动作选择"下面的按钮时
        action_select_set(PROCESS_SET3_SCREEN, control-100);
    elseif control >= ActionTab[13].EditId and control <= ActionTab[24].EditId then--当点击"编辑"按钮时
        if string.len( get_text(PROCESS_SET3_SCREEN, control+100) ) ~= 0 then--如果设置了动作名称(编辑按钮的id+100等于动作名称id)
            set_edit_screen(get_text(PROCESS_SET3_SCREEN, control+200), PROCESS_SET3_SCREEN);--control+200表示对应的"动作选择"id
        end
    end
end


--当画面切换到流程设置3时，执行此回调函数
function goto_ProcessSet3()
    set_text(PROCESS_SET3_SCREEN, ProcessSelectShowId, get_text(PROCESS_SET2_SCREEN,ProcessSelectId));
end


-----------------------------------流程设置-开始 函数定义--------------------------------------------
--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_start_set(screen)
	DestScreen = screen;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_start_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


-----------------------------------流程设置-取样 函数定义--------------------------------------------
--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_get_sample_set(screen)
	DestScreen = screen;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_get_sample_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end



-----------------------------------流程设置-注射泵加液 函数定义--------------------------------------------
--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_inject_set(screen)
	DestScreen = screen;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_inject_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end



-----------------------------------流程设置-蠕动泵加液 函数定义--------------------------------------------
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




-----------------------------------流程设置-消解 函数定义--------------------------------------------
--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_dispel_set(screen)
	DestScreen = screen;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_dispel_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


-----------------------------------流程设置-读取信号 函数定义--------------------------------------------

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_read_signal_set(screen)
	DestScreen = screen;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_read_signal_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

-----------------------------------流程设置-计算 函数定义--------------------------------------------

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_calculate_set(screen)
	DestScreen = screen;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_calculate_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

-----------------------------------流程设置-阀操作 函数定义--------------------------------------------

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_valve_ctrl_set(screen)
	DestScreen = screen;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_valve_ctrl_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


-----------------------------------流程设置-等待时间 函数定义--------------------------------------------

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_wait_time_set(screen)
	DestScreen = screen;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_wait_time_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

-----------------------------------流程选择 函数定义--------------------------------------------

ProcessItem = {"分析","校正","清洗","管路填充","零点核查","标样核查","跨度核查"," "};
ProcessSelectItem = nil;

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_select_control_notify(screen, control, value)

	if control >= AnalysisButtonId and control <= NullButtonId then
		ProcessSelectItem = control;
	elseif control == SureButtonId then --确认按钮
		change_screen(DestScreen);
		if ProcessSelectItem ~= nil then
			set_text(DestScreen, DestControl, ProcessItem[ProcessSelectItem]);--DestControl对应流程选择
			if DestScreen == PROCESS_SET1_SCREEN  then
				set_text(DestScreen, DestControl-100, ProcessItem[ProcessSelectItem]);--DestControl-100对应流程名称
			end
		end
	elseif control == CancelButtonId then --取消按钮
		change_screen(DestScreen);
	end
end


-----------------------------------流程选择2 函数定义--------------------------------------------

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

-----------------------------------动作选择 函数定义--------------------------------------------
ActionItem = {"开始","取样","注射泵加液体","读取信号","蠕动泵加液","计算","等待时间","消解","阀操作"," "};
ActionSelectItem = nil;


--该函数在on_control_notify中进行调用（当需要选择流程时）
function action_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function action_select_control_notify(screen,control,value)
    if control >= ActionStartButtonId and control <= ActionEndButtonId then --动作类型选择按钮
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


-----------------------------------量程设置 函数定义--------------------------------------------



-----------------------------------量程选择 函数定义--------------------------------------------
RangeSelectItem = 1;

--该函数在on_control_notify中进行调用（当需要选择流程时）
function range_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function range_select_control_notify(screen, control, value)

    if control >= Range1Id and control <= Range3Id then--量程选择按钮
        RangeSelectItem = control;
    elseif control == SureButtonId then --确认按钮
        change_screen(DestScreen);
        set_text(DestScreen, DestControl, RangeSelectItem);
    elseif control == CancelButtonId then--取消按钮
        change_screen(DestScreen);
    end
end


--当画面切换时，执行此回调函数，screen为目标画面。
function goto_range_select ()
    set_text(RANGE_SELECT_SCREEN, Range1LowId,  get_text(RANGE_SET_SCREEN,64));
    set_text(RANGE_SELECT_SCREEN, Range1HighId, get_text(RANGE_SET_SCREEN,65));
    set_text(RANGE_SELECT_SCREEN, Range2LowId,  get_text(RANGE_SET_SCREEN,77));
    set_text(RANGE_SELECT_SCREEN, Range2HighId, get_text(RANGE_SET_SCREEN,78));
    set_text(RANGE_SELECT_SCREEN, Range3LowId,  get_text(RANGE_SET_SCREEN,115));
    set_text(RANGE_SELECT_SCREEN, Range3HighId, get_text(RANGE_SET_SCREEN,116));
end


-----------------------------------手动操作1 函数定义--------------------------------------------




-----------------------------------手动操作2 函数定义--------------------------------------------





-----------------------------------手动操作3 函数定义--------------------------------------------




-----------------------------------手动操作4 函数定义--------------------------------------------





-----------------------------------输入输出 函数定义--------------------------------------------





-----------------------------------分析记录 函数定义--------------------------------------------





-----------------------------------校准记录 函数定义--------------------------------------------




-----------------------------------报警记录 函数定义--------------------------------------------




-----------------------------------运行日志 函数定义--------------------------------------------




-----------------------------------系统信息 函数定义--------------------------------------------
maintainerPwdSetId = 50;
administratorPwdSetId = 51;
EquipmentTypeSetId = 60;
EquipmentTypeTextId = 11;--每个界面中的仪器型号id都是11
OperatorLoginId = 72;
maintainerLoginId = 47;
administratorLoginId = 48;

PwdSetTab = {
    [maintainerPwdSetId] = {userName = "运维员"},
    [administratorPwdSetId] = {userName = "管理员"}
};

LoginTab = {
    [OperatorLoginId] = {userName = "操作员"},
    [maintainerLoginId] = {userName = "运维员"},
    [administratorLoginId] = {userName = "管理员"}
};


--设置仪器型号
function set_equipment_type()
    for i = 1,16,1 do
        set_text(PublicTab[i], EquipmentTypeTextId, get_text(SYSTEM_INFO_SCREEN,EquipmentTypeSetId));
    end
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function system_info_control_notify(screen,control,value)
    if control == EquipmentTypeSetId then
        set_equipment_type();
    elseif control == maintainerPwdSetId or control == administratorPwdSetId then--运维员与管理员密码设置按钮
        password_set_set(PwdSetTab[control].userName);
    elseif control == OperatorLoginId or control == maintainerLoginId or control == administratorLoginId then--操作员/运维员/管理员密码设置按钮
        login_system_set(LoginTab[control].userName);
        change_screen(LOGIN_SYSTEM_SCREEN);

    end
end

-----------------------------------密码设置 函数定义--------------------------------------------
UserNameId = 26;

--该函数在on_control_notify中进行调用,当点击系统信息中的密码设置相关按钮时调用该函数
function password_set_set(user)
    userName = user;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function password_set_control_notify(screen,control,value)

end


--当画面切换时，执行此回调函数，screen为目标画面。
function goto_PasswordSet()
    set_text(PASSWORD_SET_SCREEN, UserNameId, userName);
end

-----------------------------------登录系统 函数定义--------------------------------------------

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
    set_text(LOGIN_SYSTEM_SCREEN, UserNameId, userName);
end







