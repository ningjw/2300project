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


TipsTab = {
    insertSdUsb = "请插入SD卡或者U盘",
    insertSd    = "插入SD卡",
    insertUsb   = "插入U盘",
    pullOutSd   = "拔出SD卡",
    pullOutUSB  = "拔出U盘",
    importing   = "正在导入配置文件...",
    imported    = "配置文件导入成功",
    outporting  = "正在导出配置文件...",
    outported   = "配置文件导出成功",
    selectProcess = "请选择流程"
};


WorkStatus = {
    run = "运行",
    stop = "停止",
    readyRun = "待机"
};

WorkType = {
    hand = "手动",
    auto = "自动",
    controlled = "反控"
}

User = {
    administrator = "管理员",
    maintainer = "运维员",
    operator = "操作员",
};

SystemArg = {
    status = 0,--系统状态:对应WorkStatus中的值
    runType = 0,--运行方式: 对应WorkType中的值
    
    dateTime,--系统日期时间,以字符串的形式保存,例如"201911051148"
    minute = 0,--系统时间-分钟
    hour = 0,--系统时间-小时
    periodStartDateTime,--周期流程开始时间

    periodicIndex = 1,--周期流程id, 周期流程总共有四个, 该变量值的范围为1-4.
    totalAction = 0,--所有动作类型
    actionStep = 0,--取值范围为1-24,对应了流程设置2/3界面中的共24个步骤
    actionSubStep = 0,
    actionNumber = 0,--所有的动作步数,可以通过统计<action>标签获得
                    --actionTab
    actionTab = {[1] = 0,[2] = 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0,[7] = 0,[8] = 0, [9] = 0, [10] = 0,[11] = 0,[12] = 0,
                 [13]= 0,[14]= 0,[15]= 0,[16]= 0,[17]= 0,[18]= 0,[19]= 0,[20] = 0,[21] = 0,[22] = 0,[23] = 0,[24] = 0},
    currentProcessId = 0,--当前正在执行的流程,所对应的的序号.
    processFileStr = nil,--读出取流程相关的配置文件后,保存到该变量当中
    processName = nil ,--流程名称
}


--[[-----------------------------------------------------------------------------------------------------------------
    入口函数
--------------------------------------------------------------------------------------------------------------------]]
--设置全局变量uart_free_protocol，使用自由串口协议
uart_free_protocol = 1
--初始化函数,系统加载LUA脚本后，立即调用次回调函数
function on_init()
    start_timer(0, 100, 1, 0) --开启定时器 0，超时时间 100ms,1->使用倒计时方式,0->表示无限重复
    uart_set_timeout(1000,200);--设置串口超时
    ShowSysUser(User.operator);--开机之后默认为操作员
    ReadConfigFile(1);--加载流程设置1界面中的参数配置
    ReadConfigFile(2);--加载运行控制界面中的参数配置

    ReadProcessFile(1);
    printf(SystemArg.actionTab[1]..","..SystemArg.actionTab[2]..","..SystemArg.actionTab[3]..","..SystemArg.actionTab[4]);
end

--定时器超时，执行此回调函数,定时器编号 0~31
function on_timer(timer_id)
    if  timer_id == 0 then --定时器0,定时时间到
        if SystemArg.status == WorkStatus.run then--系统为运行状态,或者准备运行状态
            excute_process();
        end
    end
end

--定时回调函数，系统每隔1秒钟自动调用。
function on_systick()
    if SystemArg.status == WorkStatus.readyRun then
        
    end
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function on_control_notify(screen,control,value)
    if screen == MAIN_SCREEN then--首页
        main_control_notify(screen,control,value);
    elseif screen == RUN_CONTROL_SCREEN then --运行控制界面
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
    elseif screen == RANGE_SET_SCREEN then --量程设置
        range_set_control_notify(screen,control,value);	
    elseif screen == HAND_OPERATE1_SCREEN then --手动操作1
        hand_operate1_control_notify(screen,control,value);	
	elseif screen == SYSTEM_INFO_SCREEN then --系统信息界面
		system_info_control_notify(screen,control,value);	
	elseif screen == LOGIN_SYSTEM_SCREEN then--登录系统界面
		login_system_control_notify(screen,control,value);	
	elseif screen == PASSWORD_SET_SCREEN then--密码设置界面
		login_system_control_notify(screen,control,value);		
	end
end


--当画面切换时，执行此回调函数，screen为目标画面。
function on_screen_change(screen)
    if screen == PROCESS_SET1_SCREEN then--流程设置1
        goto_ProcessSet1();
    elseif screen == PROCESS_SET2_SCREEN then --流程设置2
        goto_ProcessSet2();
    elseif screen == PROCESS_SET3_SCREEN then --流程设置3
        goto_ProcessSet3();
    elseif(screen == RANGE_SELECT_SCREEN) then --跳转到量程选择
		goto_range_select();
	elseif screen== PROCESS_SELECT2_SCREEN then --跳转到流程选择2
		goto_ProcessSelect2();
	elseif screen== LOGIN_SYSTEM_SCREEN then--登录系统
		goto_LoginSystem();
	elseif screen== PASSWORD_SET_SCREEN then--密码设置
		goto_PasswordSet();
	end
end


--插入 U 盘后，执行此回调函数
function on_usb_inserted(dir)
    ShowSysTips(TipsTab.insertUsb);
    UsbPath = dir;
end

--拔出 U 盘后，执行此回调函数
function on_usb_removed()
    ShowSysTips(TipsTab.pullOutUSB);
end

--插入 SD 卡后，执行此回调函数
function on_sd_inserted(dir)
    ShowSysTips(TipsTab.insertSd);
    SdPath = dir;
end

--拔出 SD 卡后，执行此回调函数
function on_sd_removed()
    ShowSysTips(TipsTab.pullOutUSB);
end


--串口自定义函数
function on_uart_recv_data(packet)

end


--[[-----------------------------------------------------------------------------------------------------------------
    首页
--------------------------------------------------------------------------------------------------------------------]]

LastAnalysisTimeId = 20;   --分析时间
LastAnalyteId = 17;        --分析物
LastAnalysisResultId = 18; --分析结果
LastAnalysisUnitId = 19;   --单位
LastAnalysisE1Id = 25;     --E1
LastAnalysisE2Id = 26;     --E2

SysWorkStatusId = 901;      --工作状态
SysCurrentActionId = 902;--当前动作
SysUserNameId = 903      --显示用户
SysAlarmId = 904;        --显示当前告警信息
SysTipsId = 905;         --界面底部用于显示提示信息的文本id



function main_control_notify(screen,control,value)

end


--***********************************************************************************************
--用于调试显示,在tips状态栏
--name : 流程名称
--***********************************************************************************************
function printf(text)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysTipsId, text);
    end
end

--***********************************************************************************************
--  在底部的状态栏显示提示信息
--***********************************************************************************************
function ShowSysTips(tips)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysTipsId, tips);
    end
end

--***********************************************************************************************
--  设置工作状态
--***********************************************************************************************
function SetSysWorkStatus(status)
    SystemArg.status = status;--设置系统状态为运行
    --在底部的状态栏显示工作状态
    for i = 1,16,1 do
        set_text(PublicTab[i], SysWorkStatusId, status);
    end
end

--***********************************************************************************************
--  在底部的状态栏显示当前动作
--***********************************************************************************************
function ShowSysAlarm(alarm)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysAlarmId, alarm);
    end
end

--***********************************************************************************************
--  在底部的状态栏显示告警信息
--***********************************************************************************************
function ShowSysCurrentAction(action)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysCurrentActionId, action);
    end
end


--***********************************************************************************************
--  在底部的状态用户名
--***********************************************************************************************
function ShowSysUser(user)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysUserNameId, user);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    运行控制                                                                                                          
--------------------------------------------------------------------------------------------------------------------]]

--流程设置相关的按钮id从101 - 129, 其中101为周期流程第一个, id129为手动流程
RUNCTRL_TextStartId = 1;
RUNCTRL_TextEndId = 85;

RunTypeID = 30;--运行方式对应的文本空间ID
RunTypeMenuId = 243;--运行方式菜单
RunStopButtonId = 229;--运行状态切换按钮"开始""停止"按钮

--手动设置
HandProcessTab = {
    --  用于显示流程名称的文本id, 与文本重合的按钮id, 手动分析次数id, 手动分析次数, 流程名称对应的流程序号
    [1] = {textId = 29, buttonId = 129, TimesId = 31, times = 0, processId = 0},
};

--周期设置
PeriodicTab = { [1] = {textId = 1, buttonId = 101, processId = 0}, 
                [2] = {textId = 2, buttonId = 102, processId = 0},
                [3] = {textId = 3, buttonId = 103, processId = 0},
                [4] = {textId = 4, buttonId = 104, processId = 0},
                [5] = {textId = 32, value = 0},--年 这里需要注意数学关系:   textId - 27 = 序号
                [6] = {textId = 33, value = 0},--月
                [7] = {textId = 34, value = 0},--日
                [8] = {textId = 35, value = 0},--时
                [9] = {textId = 36, value = 0},--分
                [10]= {textId = 37, value = 0},--频率
};

--定时设置  这里注意StartHourId - 37 = 序号; startMinuteId - 61 = 序号
TimedProcessTab = {
	[1 ] = {textId = 5,  buttonId = 105, startHourId = 38, startHour = 0, startMinuteId = 62, startMinute = 0, processId = 0},
	[2 ] = {textId = 6,  buttonId = 106, startHourId = 39, startHour = 0, startMinuteId = 63, startMinute = 0, processId = 0},
	[3 ] = {textId = 7,  buttonId = 107, startHourId = 40, startHour = 0, startMinuteId = 64, startMinute = 0, processId = 0},
	[4 ] = {textId = 8,  buttonId = 108, startHourId = 41, startHour = 0, startMinuteId = 65, startMinute = 0, processId = 0},
	[5 ] = {textId = 9,  buttonId = 109, startHourId = 42, startHour = 0, startMinuteId = 66, startMinute = 0, processId = 0},
	[6 ] = {textId = 10, buttonId = 110, startHourId = 43, startHour = 0, startMinuteId = 67, startMinute = 0, processId = 0},
	[7 ] = {textId = 11, buttonId = 111, startHourId = 44, startHour = 0, startMinuteId = 68, startMinute = 0, processId = 0},
	[8 ] = {textId = 12, buttonId = 112, startHourId = 45, startHour = 0, startMinuteId = 69, startMinute = 0, processId = 0},
	[9 ] = {textId = 13, buttonId = 113, startHourId = 46, startHour = 0, startMinuteId = 70, startMinute = 0, processId = 0},
	[10] = {textId = 14, buttonId = 114, startHourId = 47, startHour = 0, startMinuteId = 71, startMinute = 0, processId = 0},
	[11] = {textId = 15, buttonId = 115, startHourId = 48, startHour = 0, startMinuteId = 72, startMinute = 0, processId = 0},
	[12] = {textId = 16, buttonId = 116, startHourId = 49, startHour = 0, startMinuteId = 73, startMinute = 0, processId = 0},
	[13] = {textId = 17, buttonId = 117, startHourId = 50, startHour = 0, startMinuteId = 74, startMinute = 0, processId = 0},
	[14] = {textId = 18, buttonId = 118, startHourId = 51, startHour = 0, startMinuteId = 75, startMinute = 0, processId = 0},
	[15] = {textId = 19, buttonId = 119, startHourId = 52, startHour = 0, startMinuteId = 76, startMinute = 0, processId = 0},
	[16] = {textId = 20, buttonId = 120, startHourId = 53, startHour = 0, startMinuteId = 77, startMinute = 0, processId = 0},
	[17] = {textId = 21, buttonId = 121, startHourId = 54, startHour = 0, startMinuteId = 78, startMinute = 0, processId = 0},
	[18] = {textId = 22, buttonId = 122, startHourId = 55, startHour = 0, startMinuteId = 79, startMinute = 0, processId = 0},
	[19] = {textId = 23, buttonId = 123, startHourId = 56, startHour = 0, startMinuteId = 80, startMinute = 0, processId = 0},
	[20] = {textId = 24, buttonId = 124, startHourId = 57, startHour = 0, startMinuteId = 81, startMinute = 0, processId = 0},
	[21] = {textId = 25, buttonId = 125, startHourId = 58, startHour = 0, startMinuteId = 82, startMinute = 0, processId = 0},
	[22] = {textId = 26, buttonId = 126, startHourId = 59, startHour = 0, startMinuteId = 83, startMinute = 0, processId = 0},
	[23] = {textId = 27, buttonId = 127, startHourId = 60, startHour = 0, startMinuteId = 84, startMinute = 0, processId = 0},
	[24] = {textId = 28, buttonId = 128, startHourId = 61, startHour = 0, startMinuteId = 85, startMinute = 0, processId = 0},
};

--***********************************************************************************************
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--***********************************************************************************************
function run_control_notify(screen,control,value)
	--control-100表示与该按钮重合的文本框
	if (control) >= PeriodicTab[1].buttonId  and control <= HandProcessTab[1].buttonId then--当点击需要选择流程的文本框时
        process_select2_set(screen, control-100);--(control100)表示与该按钮重合的文本框
    elseif control == RunStopButtonId then--当按下开始按钮和停止按钮时.
        if get_value(RUN_CONTROL_SCREEN,control) == 1.0 then--按钮按下,此时系统状态变为运行
            SystemArg.status = WorkStatus.readyRun;
            SystemArg.currentProcessId = get_current_process_id();--获取当前需要运行的流程id
            if SystemArg.currentProcessId ~= 0 then
                SetSysWorkStatus(WorkStatus.run);--设置工作状态为运行
                ReadProcessFile(SystemArg.currentProcessId);--读取流程配置文件
            end
        else--按钮松开,此时系统状态应变为停止
            SystemStop();
        end
    elseif control == RunTypeMenuId then--更改运行方式
        SystemArg.runType = get_text(RUN_CONTROL_SCREEN, RunTypeID);
        WriteConfigFile(2);--更新文件中<RunCtrl>标签中的内容
    elseif control == HandProcessTab[1].TimesId then--更改手动运行次数
        HandProcessTab[1].TimesId = tonumber(get_text(RUN_CONTROL_SCREEN,control));
        WriteConfigFile(2);
    elseif control >= PeriodicTab[5].textId and control <= PeriodicTab[10].textId then --更改周期开始时间与频率
        PeriodicTab[control-27].value = tonumber(get_text(RUN_CONTROL_SCREEN, control));--control-27后,对应了周期流程开始时间与频率
        WriteConfigFile(2);
    elseif control >= TimedProcessTab[1].startHourId and control <= TimedProcessTab[24].startHourId then--更改定时流程时间中的小时
        TimedProcessTab[control-37].startHour = tonumber(get_text(RUN_CONTROL_SCREEN,control));--control-37后,对应了定时流程的序号
        WriteConfigFile(2);
    elseif control >= TimedProcessTab[1].startMinuteId and control <= TimedProcessTab[24].startMinuteId then--更改定时流程时间中的分钟
        TimedProcessTab[control-61].startHour = tonumber(get_text(RUN_CONTROL_SCREEN,control));--control-61后,对应了定时流程的序号
        WriteConfigFile(2);
    end
end


--***********************************************************************************************
--当修改了某个流程时,调用该函数,一般按了流程选择2界面中的确认按钮会调用该函数
--control 运行控制界面中流程文本的id
--***********************************************************************************************
function process_change(control)
    local processId = 0;

    --遍历流程1-12, 找到运行控制界面中设置的流程名称,在流程设置1界面中对应的流程序号
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId), get_text(RUN_CONTROL_SCREEN, control), 1) ~= nil then
            processId = i;
            break;
        end
    end

    --设置流程id号
    if control == HandProcessTab[1].textId then--手动流程设置
        HandProcessTab[1].processId = processId;
    elseif control >= PeriodicTab[1].textId and control <= PeriodicTab[4].textId then--周期流程
        for i=1,4,1 do
            if control == PeriodicTab[i].textId then--找到当前是设置的第几个周期流程
                PeriodicTab[i].processId = processId;
            end
        end
    elseif control >= TimedProcessTab[1].textId and control <= TimedProcessTab[24].textId then--定时流程
        for i=1,24,1 do
            if control == TimedProcessTab[i].textId then --找到当前设置的是定时流程中的哪个
                TimedProcessTab[i].processId = processId;
            end
        end
    end
end

--***********************************************************************************************
--当点击开始按钮时,调用该函数执行流程
--***********************************************************************************************
function get_current_process_id()
    local processId = 0;
    if SystemArg.status == WorkStatus.run then--当前状态为运行,直接返回; 如果为停止或者待机则继续往下执行.
        return SystemArg.currentProcessId;
    end

    if SystemArg.runType == WorkType.hand then --手动模式 ,这个比较简单,只有一个流程可设置.
        processId = HandProcessTab[1].processId;
    elseif SystemArg.runType == WorkType.auto then --自动模式  自动模式中的定时时间错过了会直接跳过该流程.

        local year,mon,day,hour,min,sec,week = get_date_time();--获取当前时间
        SystemArg.hour = hour;
        SystemArg.minute = min;
        SysDateTime =  string.format("%02d,%02d,%02d,%02d,%02d",year,mon,day,hour,min);
        SystemArg.periodStartDateTime = string.format("%02d,%02d,%02d,%02d,%02d",
                                                       PeriodicTab[5].value,PeriodicTab[6].value,PeriodicTab[7].value,
                                                       PeriodicTab[8].value,PeriodicTab[9].value);

        if SystemArg.periodStartDateTime <= SysDateTime then--设置的周期开始时间到了,查找定时设置中,是否有满足条件的流程
            local diff = SystemArg.periodicIndex - 1;
            for i = SystemArg.periodicIndex, SystemArg.periodicIndex + 3, 1 do --因为周期流程有4个,所以需要循环查找四次
                if PeriodicTab[i- diff].processId ~= 0 then--流程序号不为0 ,表示该流程有设置,跳出循环, i-diff 表示4个周期流程的第几个流程
                    processId = PeriodicTab[i - diff].processId;--获取流程对应的序号

                    SystemArg.periodicIndex = i - diff + 1;--该变量使用完后加1, 指向下一个周期流程
                    if SystemArg.periodicIndex > 4 then
                        SystemArg.periodicIndex = 1;--从新指向第一个流程
                    end
                    break;
                end
            end
        else     --循环查找定时设置中,是否有满足条件的流程
            for i=1,24,1 do
                if TimedProcessTab[i].startHour == SystemArg.hour and 
                   TimedProcessTab[i].startMinute == SystemArg.minute and
                   TimedProcessTab[i].processId ~= 0 --序号不为0, 表示该流程有设置
                then
                    processId = TimedProcessTab[i].processId;
                end
            end
        end
        
    elseif SystemArg.runType == WorkType.controlled then --反控

    end
    return processId;
end

--***********************************************************************************************
--该函数在定时器中调用,当
--***********************************************************************************************

function excute_process()

end

--***********************************************************************************************
--  在底部的状态栏显示提示信息
--***********************************************************************************************
function SystemStop()
    SetSysWorkStatus(WorkStatus.stop);--将状态栏显示为停止
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置1
--------------------------------------------------------------------------------------------------------------------]]

--流程设置表中各控件Id,注意selecId与nameId的数学关系:selectId = nameId + 100, selectId = deleteId + 220 等等
TabProcess = {[1] = {selectId = 300, nameId = 200, rangeId = 312, deleteId = 80},
              [2] = {selectId = 301, nameId = 201, rangeId = 313, deleteId = 81},
              [3] = {selectId = 302, nameId = 202, rangeId = 314, deleteId = 82},
              [4] = {selectId = 303, nameId = 203, rangeId = 315, deleteId = 83},
              [5] = {selectId = 304, nameId = 204, rangeId = 316, deleteId = 84},
              [6] = {selectId = 305, nameId = 205, rangeId = 317, deleteId = 85},
              [7] = {selectId = 306, nameId = 206, rangeId = 318, deleteId = 85},
              [8] = {selectId = 307, nameId = 207, rangeId = 319, deleteId = 87},
              [9] = {selectId = 308, nameId = 208, rangeId = 320, deleteId = 88},
              [10]= {selectId = 309, nameId = 209, rangeId = 321, deleteId = 89},
              [11]= {selectId = 310, nameId = 210, rangeId = 322, deleteId = 90},
              [12]= {selectId = 311, nameId = 211, rangeId = 323, deleteId = 91},
       };


AnalyteSetId = 38;--分析物选择
CodeSetId = 107;--代码
ProcessSaveBtId = 19;--保存按钮,流程设置1/2/3的保存按钮都是这个id
ExportBtId = 41;--导出按钮
InportBtId = 42;--导入按钮

--***********************************************************************************************
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--***********************************************************************************************
function process_set1_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- 保存
        WriteConfigFile(1);
    elseif control == InportBtId then --导入按钮
        if SdPath  ~= nil then
            ShowSysTips(TipsTab.importing);
            for i = 0,12,1 do--依次导出文件"0"~"12"
                ConfigFileCopy( SdPath.."config/"..i, i);--将Sd卡中的配置文件导入都系统
            end
            ShowSysTips(TipsTab.imported);
            ReadConfigFile(1);--加载流程设置1界面中的参数配置
            ReadConfigFile(2);--加载运行控制界面中的参数配置
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab.importing);
            for i = 0,12,1 do--依次导出文件"0"~"12"
                ConfigFileCopy( UsbPath.."config/"..i, i);--将Sd卡中的配置文件导入都系统
            end
            ShowSysTips(TipsTab.imported);
            ReadConfigFile(1);--加载流程设置1界面中的参数配置
            ReadConfigFile(2);--加载运行控制界面中的参数配置
        else
            ShowSysTips(TipsTab.insertSdUsb);
        end;
    elseif control == ExportBtId then --导出按钮(将流程配置导出到SD卡中)
        if SdPath  ~= nil then
            ShowSysTips(TipsTab.outporting);
            for i = 0,12,1 do--依次导出文件"0"~"12"
                    ConfigFileCopy(i, SdPath.."config/"..i);--将文件导出到config文件中,配置文件名为0~12
            end
            ShowSysTips(TipsTab.outported);
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab.outporting);
            for i = 0,12,1 do--依次导出文件"0"~"12"
                    ConfigFileCopy(i, UsbPath.."config/"..i);--将文件导出到config文件中,配置文件名为0~12
            end
            ShowSysTips(TipsTab.outported);
        else
            ShowSysTips(TipsTab.insertSdUsb);
        end;
    elseif control == AnalyteSetId then
        set_text(MAIN_SCREEN, LastAnalyteId, get_text(PROCESS_SET1_SCREEN, AnalyteSetId));--设置分析物
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



--***********************************************************************************************
--当画面切换到流程设置1时，执行此回调函数
--***********************************************************************************************
function goto_ProcessSet1()
    
end

--[[-----------------------------------------------------------------------------------------------------------------
    流程设置2/3
--------------------------------------------------------------------------------------------------------------------]]

ProcessSelectButtonId = 35;--位于流程设置2
ProcessSelectId = 38;      --位于流程设置2/3都是这个id
ProcessSelectTipsTextId = 21;--用于显示提示信息的文本框,流程设置2/3界面中都是这个id

--这里注意观察动作选择id,动作名称id,编辑id之间的数学转换关系:selectId = nameId + 100; nameId = editId + 100
--其中[1]-[12]中包含的id控件在流程设置2界面中,[13]-[24]中包含的id控件在流程设置3界面中
TabAction = {
    [1]  = {selectId = 300, nameId = 200, editId = 100},
    [2]  = {selectId = 301, nameId = 201, editId = 101},
    [3]  = {selectId = 302, nameId = 202, editId = 102},
    [4]  = {selectId = 303, nameId = 203, editId = 103},
    [5]  = {selectId = 304, nameId = 204, editId = 104},
    [6]  = {selectId = 305, nameId = 205, editId = 105},
    [7]  = {selectId = 306, nameId = 206, editId = 106},
    [8]  = {selectId = 307, nameId = 207, editId = 107},
    [9]  = {selectId = 308, nameId = 208, editId = 108},
    [10] = {selectId = 309, nameId = 209, editId = 109},
    [11] = {selectId = 310, nameId = 210, editId = 110},
    [12] = {selectId = 311, nameId = 211, editId = 111},
    [13] = {selectId = 300, nameId = 200, editId = 100},
    [14] = {selectId = 301, nameId = 201, editId = 101},
    [15] = {selectId = 302, nameId = 202, editId = 102},
    [16] = {selectId = 303, nameId = 203, editId = 103},
    [17] = {selectId = 304, nameId = 204, editId = 104},
    [18] = {selectId = 305, nameId = 205, editId = 105},
    [19] = {selectId = 306, nameId = 206, editId = 106},
    [20] = {selectId = 307, nameId = 207, editId = 107},
    [21] = {selectId = 308, nameId = 208, editId = 108},
    [22] = {selectId = 309, nameId = 209, editId = 109},
    [23] = {selectId = 310, nameId = 210, editId = 110},
    [24] = {selectId = 311, nameId = 211, editId = 111},
};

--设置编辑按钮对应的跳转界面
--para:获取对应的动作类型名称
--screen: 当前屏幕的id, 子界面按"确认" ,"返回" 按钮后需要返回的界面
--control:"编辑"按钮的id号
function set_edit_screen(para, screen, control)
    if screen == PROCESS_SET2_SCREEN then
        ReadProcessTag(control-99);--在流程设置2界面, 当编辑按钮id号为100时, 当前动作序号为1, 依次类推
        set_screen_actionNumber(screen, control-99);
    elseif screen == PROCESS_SET3_SCREEN then
        ReadProcessTag(control-99+12);
        set_screen_actionNumber(screen, control-99+12);
    end

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

    if control == ProcessSaveBtId then -- 保存
        if string.len(get_text(PROCESS_SET2_SCREEN, ProcessSelectId)) == 0 then
            set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 1);--显示提示信息
        else
            set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 0);--隐藏提示信息
            --手动保存当前正在编辑的流程
            WriteProcessFile(0);
        end
    elseif control == ProcessSelectButtonId then--当点击流程选择按钮时,
        process_select2_set(PROCESS_SET2_SCREEN, ProcessSelectId);--设置流程选择2界面中按确认/返回按钮后,返回流程设置2界面
        --自动保存当前正在编辑的流程
        if string.len(get_text(PROCESS_SET2_SCREEN, ProcessSelectId)) ~= 0 then
            WriteProcessFile(0);
        end
    elseif control == ProcessSelectId then

    elseif (control-100) >= TabAction[1].selectId and (control-100) <= TabAction[12].selectId then--当点击"动作选择"下面的按钮时
        action_select_set(PROCESS_SET2_SCREEN, control-100);
    elseif control >= TabAction[1].editId and control <= TabAction[12].editId then--当点击"编辑"按钮时
        if string.len( get_text(PROCESS_SET2_SCREEN, control+100) ) ~= 0 then--如果设置了动作名称(编辑按钮的id+100等于动作名称id)
            set_edit_screen(get_text(PROCESS_SET2_SCREEN, control+200), PROCESS_SET2_SCREEN, control);--control+200表示对应的"动作选择"id
        end
    end
end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set3_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- 保存
        if string.len(get_text(PROCESS_SET3_SCREEN, ProcessSelectId)) == 0 then
            set_visiable(PROCESS_SET3_SCREEN, ProcessSelectTipsTextId, 1);--显示提示信息
        else
            set_visiable(PROCESS_SET3_SCREEN, ProcessSelectTipsTextId, 0);--隐藏提示信息
            --手动保存当前正在编辑的流程
            WriteProcessFile(0);
        end
    elseif (control-100) >= TabAction[13].selectId and (control-100) <= TabAction[24].selectId then--当点击"动作选择"下面的按钮时
        action_select_set(PROCESS_SET3_SCREEN, control-100);
    elseif control >= TabAction[13].editId and control <= TabAction[24].editId then--当点击"编辑"按钮时
        if string.len( get_text(PROCESS_SET3_SCREEN, control+100) ) ~= 0 then--如果设置了动作名称(编辑按钮的id+100等于动作名称id)
            set_edit_screen(get_text(PROCESS_SET3_SCREEN, control+200), PROCESS_SET3_SCREEN, control);--control+200表示对应的"动作选择"id
        end
    end
end

--当画面切换到流程设置2时，执行此回调函数
function goto_ProcessSet2()
    set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 0);--隐藏提示信息
end

--当画面切换到流程设置3时，执行此回调函数
function goto_ProcessSet3()
    set_visiable(PROCESS_SET3_SCREEN, ProcessSelectTipsTextId, 0);--隐藏提示信息
    set_text(PROCESS_SET3_SCREEN, ProcessSelectId, get_text(PROCESS_SET2_SCREEN,ProcessSelectId));
end




--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-开始
--------------------------------------------------------------------------------------------------------------------]]
--在所有子界面中("开始/取样/消解/......"),确认按钮的id都是99,取消按钮的id都是98.
SureButtonId = 99;--确认按钮
CancelButtonId = 98;--取消按钮
DestScreen = nil;
DestControl = nil;
DestActionNum = 0;--指向当前动作序号

AnalysisTypeMenuId = 4;
AnalysisTypeTextId = 7;
ResetSystemButtonId = 5;--是否硬件复位


--该函数在on_control_notify中进行调用（当需要选择流程时）
function set_screen_actionNumber(screen,actionNumber)
    DestScreen = screen;
    DestActionNum = actionNumber;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_start_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  执行开始流程
--***********************************************************************************************
function excute_start_process()
    ShowSysCurrentAction("开始");
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-取样
--------------------------------------------------------------------------------------------------------------------]]


GetSample_BtStartId = 1;--取样界面中按钮开始id
GetSample_BtEndId = 34; --取样界面中按钮结束id
GetSample_Out1EnableId = 1;--取样界面中输出1使能按钮id (GS->GetSample)
GS_OUT1_Valve1Id = 2;--输出1中阀1的id
GS_OUT1_Valve16Id= 17;--输出1中阀16的id

GS_OUT2_EnableId = 18;--取样界面中输出1使能按钮id (GS->GetSample)
GS_OUT2_Valve1Id = 19;--输出1中阀1的id
GS_OUT2_Valve16Id= 34;--输出1中阀16的id

GetSample_Out1WaitTimeId = 35;--输出1等待时间
GetSample_Out2WaitTimeId = 36;--输出1等待时间

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_get_sample_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  执行取样流程
--***********************************************************************************************
function excute_get_sample_process()
    ShowSysCurrentAction("取样");--显示当前步骤
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-注射泵加液
--------------------------------------------------------------------------------------------------------------------]]

INJECT_VALCO_EnableId = 1;--十通阀使能
INJECT_VALCO_ChannelId = 40;--十通阀通道号
INJECT_VALCO_WaitTimeId = 41;--十通阀等待时间
INJECT_OUT1_EnableId = 2;
INJECT_OUT1_Valve1Id = 8;
INJECT_OUT1_Valve16Id = 23;
INJECT_OUT1_WaitTimeId = 42;
INJECT_OUT1_OnOffId = 43;
INJECT_NUM11_EnableId = 3;
INJECT_NUM11_SpeedId = 44;
INJECT_NUM11_VolumeId = 45;
INJECT_NUM11_DirectionId = 46;
INJECT_NUM11_WaitTimeId = 47;
INJECT_NUM12_EnableId = 3;
INJECT_NUM12_SpeedId = 48;
INJECT_NUM12_VolumeId = 49;
INJECT_NUM12_DirectionId = 50;
INJECT_NUM12_WaitTimeId = 51;
INJECT_OUT2_EnableId = 5;
INJECT_OUT2_Valve1Id = 24;
INJECT_OUT2_Valve16Id = 39;
INJECT_OUT2_WaitTimeId = 52;
INJECT_OUT2_OnOffId = 53;


INJECT_BtStartId = 1;
INJECT_BtEndId = 39;
INJECT_TextStartId = 40;
INJECT_TextEndId = 61;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_inject_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  执行注射泵加液体流程
--***********************************************************************************************
function excute_inject_process()
    ShowSysCurrentAction("注射泵加液");--显示当前步骤
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-蠕动泵加液
--------------------------------------------------------------------------------------------------------------------]]


PERISTALTIC_BtStartId = 1;
PERISTALTIC_BtEndId = 21;
PERISTALTIC_TextStartId = 22;
PERISTALTIC_TextEndId = 36;


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_peristaltic_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  执行蠕动泵加液体流程
--***********************************************************************************************
function excute_peristaltic_process()
    ShowSysCurrentAction("蠕动泵加液");--显示当前步骤
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-消解
--------------------------------------------------------------------------------------------------------------------]]

DISPEL_BtStartId = 1;
DISPEL_BtEndId = 23;
DISPEL_TextStartId = 24;
DISPEL_TextEndId = 46;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_dispel_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end



--***********************************************************************************************
--  执行消解流程
--***********************************************************************************************
function excute_dispel_process()
    ShowSysCurrentAction("消解加液");--显示当前步骤
end



--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-读取信号
--------------------------------------------------------------------------------------------------------------------]]

ReadSignal_TextStartId = 1;
ReadSignal_TextEndId = 4;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_read_signal_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end



--***********************************************************************************************
--  执行读取信号流程
--***********************************************************************************************
function excute_read_signal_process()
    ShowSysCurrentAction("读取信号");--显示当前步骤
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-计算
--------------------------------------------------------------------------------------------------------------------]]

CALCULATE_BtStartId = 1;
CALCULATE_BtEndId = 3;
CALCULATE_TextStartId = 4;
CALCULATE_TextEndId = 9;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_calculate_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  执行计算流程
--***********************************************************************************************
function excute_calculate_process()
    ShowSysCurrentAction("计算");--显示当前步骤
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-阀操作
--------------------------------------------------------------------------------------------------------------------]]

VALVE_BtStartId = 1;
VALVE_BtEndId = 18;
VALVE_TextStartId = 19;
VALVE_TextEndId = 23;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_valve_ctrl_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  执行阀操作流程
--***********************************************************************************************
function excute_valve_ctrl_process()
    ShowSysCurrentAction("阀操作");--显示当前步骤
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-等待时间
--------------------------------------------------------------------------------------------------------------------]]

WAITTIME_TextId = 1;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_wait_time_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  执行等待时间流程
--***********************************************************************************************
function excute_wait_time_process()
    ShowSysCurrentAction("等待时间");--显示当前步骤
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程选择
--------------------------------------------------------------------------------------------------------------------]]

AnalysisButtonId = 1;--分析按钮
NullButtonId = 8;--空按钮

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

--[[-----------------------------------------------------------------------------------------------------------------
    流程选择2
--------------------------------------------------------------------------------------------------------------------]]

FirstButtonId = 101;--第一个按钮
LastButtonId = 112;--最后一个按钮
TipsTextId = 13;--提示文本框

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

    elseif control == SureButtonId then --确认按钮,返回之前的界面
        change_screen(DestScreen);

        if ProcessSelec2tItem ~= nil then --ProcessSelec2tItem默认为nil,如果选择了某个流程则该值不为nil
            set_text(DestScreen, DestControl, get_text(PROCESS_SELECT2_SCREEN, ProcessSelec2tItem));--DestControl对应动作选择
            set_text(DestScreen, DestControl-100, get_text(PROCESS_SELECT2_SCREEN, ProcessSelec2tItem));--DestControl-100对应动作名称
            if DestScreen == PROCESS_SET2_SCREEN then --如果是回到流程设置2界面,则加载该流程对应的配置文件
                ReadProcessTag(0);
            elseif DestScreen == RUN_CONTROL_SCREEN then --如果是回到运行控制界面,则保存文件名为0"的配置文件
                process_change(DestControl);--流程改变后,通过调用该函数修改流程对应的id号
                WriteConfigFile(2);--2对应<RunCtrl>标签
            end
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


--[[-----------------------------------------------------------------------------------------------------------------
    动作选择
--------------------------------------------------------------------------------------------------------------------]]

ActionStartButtonId = 1;
ActionEndButtonId = 10;
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

--[[-----------------------------------------------------------------------------------------------------------------
    量程设置
--------------------------------------------------------------------------------------------------------------------]]

--在量程设置/量程选择界面中,量程1/2/3文本的id都是一样的
Range1LowId = 64;--量程1文本id
Range1HighId = 65;--量程1文本id
Range2LowId = 77;--量程2文本id
Range2HighId = 78;--量程2文本id
Range3LowId = 115;--量程3文本id
Range3HighId = 116;--量程3文本id

UniteSetMenuId = 17;--单位选择
UniteSetTextId = 15--单位设置成功后,用于显示单位文本的id

RangeTab = {
    [1] = {LowId = 64, HighId = 65, densityCalLowId = 81, densityCalHighId = 84, aId = 48, bId = 49, cId = 50, dId = 51},
    [2] = {LowId = 77, HighId = 78, densityCalLowId = 67, densityCalHighId = 70, aId = 52, bId = 53, cId = 54, dId = 55 },
    [3] = {LowId = 115,HighId= 116, densityCalLowId = 105,densityCalHighId = 108,aId = 92, bId = 93, cId = 94, dId = 95},
};

--设置单位
function set_unit()
    local Unite = get_text(RANGE_SET_SCREEN, UniteSetTextId);
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
function range_set_control_notify(screen,control,value)
    if(control == UniteSetMenuId) then --设置单位
        set_unit();
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    量程选择
--------------------------------------------------------------------------------------------------------------------]]

Range1Id = 1;--量程1按钮Id
Range2Id = 2;--量程2按钮Id
Range3Id = 3;--量程3按钮Id
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


--[[-----------------------------------------------------------------------------------------------------------------
    手动操作1
--------------------------------------------------------------------------------------------------------------------]]

Valve16BtId = 67;
Valve16Close = {53,0,0,0,0,154,127};
Valve16Open  = {53,0,1,0,0,155,239};
Valve16Close[0] = 224;
Valve16Open[0] = 224;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function hand_operate1_control_notify(screen, control, value)
    if control == Valve16BtId then
        if get_value(HAND_OPERATE1_SCREEN, Valve16BtId) == 1.0 then
            uart_send_data(Valve16Close);
        else
            uart_send_data(Valve16Open);
        end
    end
end




--[[-----------------------------------------------------------------------------------------------------------------
    手动操作2
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    手动操作3
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    手动操作4
--------------------------------------------------------------------------------------------------------------------]]





--[[-----------------------------------------------------------------------------------------------------------------
    输入输出
--------------------------------------------------------------------------------------------------------------------]]





--[[-----------------------------------------------------------------------------------------------------------------
    分析记录
--------------------------------------------------------------------------------------------------------------------]]





--[[-----------------------------------------------------------------------------------------------------------------
    校准记录
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    报警记录
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    运行日志
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    系统信息
--------------------------------------------------------------------------------------------------------------------]]
maintainerPwdSetId = 50;
administratorPwdSetId = 51;
EquipmentTypeSetId = 60;
EquipmentTypeTextId = 900;--每个界面中的仪器型号id都是11
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

--[[-----------------------------------------------------------------------------------------------------------------
    密码设置
--------------------------------------------------------------------------------------------------------------------]]

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

--[[-----------------------------------------------------------------------------------------------------------------
    登录系统
--------------------------------------------------------------------------------------------------------------------]]


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



--[[-----------------------------------------------------------------------------------------------------------------
    配置文件操作相关函数
--------------------------------------------------------------------------------------------------------------------]]

cfgFileTab = {
    [1] = {sTag = "<ProcessSet>",eTag = "</ProcessSet>"};--流程设置1界面中的参数保存在这个tag中
    [2] = {sTag = "<RunControl>",eTag = "</RunControl>"};--运行控制界面中的参数保存在这个tag中
};
--***********************************************************************************************
--创建配置文件,并保存在"0"文件中
--tagNum = 1 : 修改流程设置界面中的参数
--tagNum = 2 : 修改运行控制界面中的参数
--***********************************************************************************************
function WriteConfigFile(tagNum)
    if tagNum ~= 1 and tagNum ~= 2 then
        return;
    end

    local configFile = io.open("0", "a+");        --以覆盖写入的方式打开文本
    configFile:seek("set");                       --把文件位置定位到开头
    local fileString = configFile:read("a");      --从当前位置读取整个文件，并赋值到字符串中
    configFile:close();                           --关闭文件

    configFile = io.open("0", "w+");         --打开并清空该文件
    fileString = DeleteSubString(fileString, cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);--删除指定的标签内容
    configFile:write(fileString);                 --将处理过的原文件内容重新写入文件
    configFile:write(cfgFileTab[tagNum].sTag);
    if tagNum == 1 then--流程设置1界面中的参数
        for i=1,12,1 do
            configFile:write(get_text(PROCESS_SET1_SCREEN, TabProcess[i].selectId)..",".. --流程类型选择
                             get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId)..","..   --流程名称
                             get_text(PROCESS_SET1_SCREEN, TabProcess[i].rangeId)..",");  --流程量程
        end
    elseif tagNum == 2 then--运行控制界面中的参数
        for i = RUNCTRL_TextStartId, RUNCTRL_TextEndId,1 do
            configFile:write(get_text(RUN_CONTROL_SCREEN,i)..",");
        end
    end
    configFile:write(cfgFileTab[tagNum].eTag);
    configFile:close(); --关闭文本
end


--***********************************************************************************************
--读取配置文件中的数据
--***********************************************************************************************
function ReadConfigFile(tagNum)
	local configFile = io.open("0", "r")      --打开文本
    if configFile == nil then--如果没有该文件则返回
        --创建一个默认配置文件
        WriteConfigFile(1);
        WriteConfigFile(2);
        return;
    end
	configFile:seek("set")                        --把文件位置定位到开头
	local fileString = configFile:read("a")       --从当前位置读取整个文件，并赋值到字符串中
	configFile:close()                            --关闭文本
    
    tagString = GetSubString(fileString, cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);--截取标签之间的字符串
    if tagString == nil then--如果文件中没有该标签,则返回.
        return 
    end
    local tab = split(tagString, ",")--将读出的字符串按逗号分割,并以此存入tab表
    if tagNum == 1 then--流程设置1界面中的参数
        for i=1,12,1 do
            set_text(PROCESS_SET1_SCREEN, TabProcess[i].selectId, tab[(i-1)*3+1]);  --把数据显示到文本框中
            set_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId,   tab[(i-1)*3+2]);  --把数据显示到文本框中
            set_text(PROCESS_SET1_SCREEN, TabProcess[i].rangeId,  tab[(i-1)*3+3]);  --把数据显示到文本框中
        end
    elseif tagNum == 2 then
        --将文件中的参数在界面上进行解析
        for i = RUNCTRL_TextStartId, RUNCTRL_TextEndId,1 do
            set_text(RUN_CONTROL_SCREEN, i, tab[i])
        end
        --将文件中的参数赋值给相应的变量
        SystemArg.runType = tab[RunTypeID];
        HandProcessTab[1].processId = get_process_Id(tab[HandProcessTab[1].textId]);
        HandProcessTab[1].times = tonumber(tab[HandProcessTab[1].TimesId]);
        for i = 1,4,1 do
            PeriodicTab[i].processId = get_process_Id(tab[i]);
        end
        for i = 5,10,1 do
            PeriodicTab[i].value = tonumber(tab[i+27]);--周期流程的时间是从32开始,所以需要 i+27
        end
        for i = 1,24,1 do
            TimedProcessTab[i].processId = get_process_Id(tab[i+4]);--定时流程的文本id从5开始,所以要 i+4
        end
        for i = 1,24,1 do
            TimedProcessTab[i].startHour = get_process_Id(tab[i+37]);--定时流程的开始小时从38开始,所以需要 i+37
        end
        for i = 1,24,1 do
            TimedProcessTab[i].startMinute = get_process_Id(tab[i+61]);--定时流程的开始分钟从61开始,所以需要 i+61
        end
    end
end

--***********************************************************************************************
--将动作写入配置文件中,该文件在WriteProcessFile中调用
--fileName:配置文件名称:范围:1-12,对应12个流程(每个流程对应一个配置文件)
--actionNumber:动作标签,范围:action1~action24
--***********************************************************************************************
function WriteActionTag(fileName, actionNumber)
    local processFile = io.open(fileName, "a+");   --以可读可写的方式打开文本,如果没有该文件则创建
    processFile:seek("set");                       --把文件位置定位到开头
    local fileString = processFile:read("a");      --从当前位置读取整个文件，并赋值到字符串中
    processFile:close();                           --关闭文件

    processFile = io.open(fileName, "w+");         --打开并清空该文件
    fileString = DeleteSubString(fileString, "<action"..actionNumber..">", "</action"..actionNumber..">");--将原来的<action?>-</action?>标签之间的字符串删除
    processFile:write(fileString);                 --将处理过的原文件内容重写写入文件

    local actionType
    if actionNumber == 0 then
        actionType = get_text(PROCESS_SET2_SCREEN, ProcessSelectId);--当前流程名称
    elseif actionNumber >= 1 and actionNumber <= 12 then
        actionType = get_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].selectId);--获取当前动作类型
    elseif actionNumber >= 13 and actionNumber <= 24 then 
        actionType = get_text(PROCESS_SET3_SCREEN, TabAction[actionNumber].selectId);--获取当前动作类型
    end

    processFile:write("<action"..actionNumber..">");--写入开始标签
    processFile:write("<type>"..actionType.."</type>");--写入动作类型:开始/取样/消解......
    processFile:write("<content>");
    --------------------------------写<action0>标签内容---------------------------------------------
    --<action0>标签保存的都是该流程中,对应的流程设置2/3界面中的动作选择/动作名称
    if actionNumber == 0 then
        for i=1,12,1 do
            processFile:write(get_text(PROCESS_SET2_SCREEN, TabAction[i].selectId)..",".. --动作类型选择
                              get_text(PROCESS_SET2_SCREEN, TabAction[i].nameId  )..","); --动作名称
        end
        for i=13,24,1 do
            processFile:write(get_text(PROCESS_SET3_SCREEN, TabAction[i].selectId)..",".. --动作类型选择
                              get_text(PROCESS_SET3_SCREEN, TabAction[i].nameId  )..","); --动作名称
        end
    --------------------------------写开始界面参数----------------------------------------------------
    elseif actionType == ActionItem[1] then 
        processFile:write(get_text(PROCESS_START_SCREEN, AnalysisTypeTextId)..","..--分析方法
                          get_value(PROCESS_START_SCREEN,ResetSystemButtonId)..",");--是否硬件复位
    --------------------------------写取样界面参数----------------------------------------------------
    elseif actionType == ActionItem[2] then 
        for i = GetSample_BtStartId, GetSample_BtEndId, 1 do
            processFile:write(get_value(PROCESS_GET_SANPLE_SCREEN, i)..",");--写入输出1按钮值
        end
        processFile:write(get_text(PROCESS_GET_SANPLE_SCREEN, GetSample_Out1WaitTimeId)..",");--写入输出1等待时间
        processFile:write(get_text(PROCESS_GET_SANPLE_SCREEN, GetSample_Out2WaitTimeId));--写入输出2等待时间
    --------------------------------写注射泵加液参数--------------------------------------------------
    elseif actionType == ActionItem[3] then
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            processFile:write(get_value(PROCESS_INJECT_SCREEN, i)..",");--写入按钮值
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            processFile:write(get_text(PROCESS_INJECT_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-读取信号参数----------------------------------------------------
    elseif actionType == ActionItem[4] then 
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            processFile:write(get_text(PROCESS_READ_SIGNAL_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-蠕动泵加液参数--------------------------------------------------
    elseif actionType == ActionItem[5] then 
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            processFile:write(get_value(PROCESS_PERISTALTIC_SCREEN, i)..",");--写入按钮值
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            processFile:write(get_text(PROCESS_PERISTALTIC_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-计算参数--------------------------------------------------------
    elseif actionType == ActionItem[6] then 
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            processFile:write(get_value(PROCESS_CALCULATE_SCREEN, i)..",");--写入按钮值
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            processFile:write(get_text(PROCESS_CALCULATE_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-等待时间参数----------------------------------------------------
    elseif actionType == ActionItem[7] then 
        processFile:write(get_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId));
    --------------------------------写-消解参数--------------------------------------------------------
    elseif actionType == ActionItem[8] then 
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            processFile:write(get_value(PROCESS_DISPEL_SCREEN, i)..",");--写入按钮值
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            processFile:write(get_text(PROCESS_DISPEL_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-阀操作参数------------------------------------------------------
    elseif actionType == ActionItem[9] then 
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            processFile:write(get_value(PROCESS_VALVE_CTRL_SCREEN, i)..",");--写入按钮值
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            processFile:write(get_text(PROCESS_VALVE_CTRL_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-空操作参数------------------------------------------------------
    elseif actionType == ActionItem[10] then 
        processFile:write("<content> </content>");
    end
    processFile:write("</content>");
    processFile:write("</action"..actionNumber..">");--写入结束标签
    processFile:close(); --关闭文本
end

--***********************************************************************************************
--保存单个流程配置文件,每个流程都有一个对应的配置文件,文件名为该流程在表格中的序号
--actionNumber:动作标签,范围:action1~action24
--***********************************************************************************************
function WriteProcessFile(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcessSelectId);--获取流程名称

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            WriteActionTag(i, 0);--修改<action0>标签中的内容
            WriteActionTag(i, actionNumber);--保存数据到文件中,文件名为1~12, 保存的内容为action0~action12标签
        end
    end
end

--***********************************************************************************************
--读配置文件函数,这里每次只读取一个标签里的值, 例如<action1>标签之间的值
--actionNumber:当前动作为第几步
--***********************************************************************************************
function ReadProcessTag(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcessSelectId);--获取流程名称
    local fileName = 0;
    for i=1,12,1 do--循环查找当前流程名称对应的序号.
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            fileName = i;
            break;
        end
    end

    local processFile = io.open(fileName, "r");      --打开文本
    if processFile == nil then--还没有该文件,则创建一个新的配置文件,并返回
        --将流程设置2/3界面清空
        for i = TabAction[1].selectId,TabAction[12].selectId,1 do
            set_text(PROCESS_SET2_SCREEN, i," ");    --将对应动作选择的文本显示为空格
            set_text(PROCESS_SET2_SCREEN, i-100," ");--将对应动作名称的文本显示为空格
            set_text(PROCESS_SET3_SCREEN, i," ");    --将对应动作选择的文本显示为空格
            set_text(PROCESS_SET3_SCREEN, i-100," ");--将对应动作名称的文本显示为空格
        end
        WriteProcessFile(0);
        return
    end

	processFile:seek("set");                        --把文件位置定位到开头
	fileString = processFile:read("a");             --从当前位置读取整个文件，并赋值到字符串中
    processFile:close();                            --关闭文本

    actionString = GetSubString(fileString, "<action"..actionNumber..">", "</action"..actionNumber..">");--截取fileInfo文件中<action?> ~ </action?>标签之间的字符串
    if actionString == nil then--如果文件中没有该标签,则返回.
        return 
    end
    
    actionType = GetSubString(actionString, "<type>","</type>");--截取actionString字符串中<type>标签之间的字符串,获取动作类型
    local contentTab = GetSubString(actionString,"<content>","</content>");--再截取<content>标签中的内容
    if contentTab == nil then--如果没有内容,则清空流程设置2/3界面中的动作选择与动作名称
        return;
    end
    tab = split(contentTab, ",");--分割字符串
    if actionNumber == 0 then --判定为<action0>标签
        for i=1,12,1 do
            set_text(PROCESS_SET2_SCREEN, TabAction[i].selectId, tab[(i-1)*2+1]);  --把数据显示到文本框中
            set_text(PROCESS_SET2_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]);   --把数据显示到文本框中
        end
        for i=13,24,1 do
           set_text(PROCESS_SET3_SCREEN, TabAction[i].selectId, tab[(i-1)*2+1]);  --把数据显示到文本框中
           set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]);  --把数据显示到文本框中
        end
    --------------------------------读-开始界面参数--------------------------------------------------
    elseif actionType == ActionItem[1] then
        set_text(PROCESS_START_SCREEN, AnalysisTypeTextId, tab[1]);
        set_value(PROCESS_START_SCREEN, ResetSystemButtonId, tab[2] );
    --------------------------------读-取样界面参数--------------------------------------------------
    elseif actionType == ActionItem[2] then 
        set_text(PROCESS_SET2_SCREEN,30, tab[1])
        for i = GetSample_BtStartId, GetSample_BtEndId, 1 do 
            set_value(PROCESS_GET_SANPLE_SCREEN, i, tab[i]);--tab中前17个位按钮值
        end
        set_text(PROCESS_GET_SANPLE_SCREEN, GetSample_Out1WaitTimeId, tab[35]);--第18个为输出1等待时间值
        set_text(PROCESS_GET_SANPLE_SCREEN, GetSample_Out2WaitTimeId, tab[36]);--第36个为输出2等待时间值
    --------------------------------读-注射泵加液参数-------------------------------------------------
    elseif actionType == ActionItem[3] then
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            set_value(PROCESS_INJECT_SCREEN, i, tab[i]);--写入按钮值
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            set_text(PROCESS_INJECT_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-读取信号参数--------------------------------------------------
    elseif actionType == ActionItem[4] then
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            set_text(PROCESS_READ_SIGNAL_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-蠕动泵加液参数------------------------------------------------
    elseif actionType == ActionItem[5] then 
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            set_value(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--写入按钮值
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            set_text(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-计算参数------------------------------------------------------
    elseif actionType == ActionItem[6] then 
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            set_value(PROCESS_CALCULATE_SCREEN, i, tab[i]);--写入按钮值
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            set_text(PROCESS_CALCULATE_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-等待时间参数--------------------------------------------------
    elseif actionType == ActionItem[7] then 
        set_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId, tab[1]);
    --------------------------------读-消解参数------------------------------------------------------
    elseif actionType == ActionItem[8] then 
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            set_value(PROCESS_DISPEL_SCREEN, i, tab[i]);--写入按钮值
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            set_text(PROCESS_DISPEL_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-阀操作参数------------------------------------------------------
    elseif actionType == ActionItem[9] then 
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            set_value(PROCESS_VALVE_CTRL_SCREEN, i, tab[i]);--写入按钮值
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            set_text(PROCESS_VALVE_CTRL_SCREEN, i, tab[i]);--写入文本值
        end
    end
end


--***********************************************************************************************
--读取整个流程配置文件中的值,并统计有多少个步骤
--actionNumber:当前动作为第几步
--***********************************************************************************************
function ReadProcessFile(fileName)
    local processFile = io.open(fileName, "r");      --打开文本
    processFile:seek("set");                         --把文件位置定位到开头
	SystemArg.processFileStr = processFile:read("a");--从当前位置读取整个文件，并赋值到字符串中
    processFile:close();                             --关闭文本

    --统计action个数,给SystemArg.actionNumber变量,以及SystemArg.actionTab赋值 ----------------------
    --SystemArg.actionTab数组长度为24,表示最多可记录24个action, 其值保存的是当前步骤对应的action序号
    --假如SystemArg.actionTab[1] = 3, 表示第一步就执行序号为3的action, 也意味着序号为1/2的action为空格(没有设置)
    actionString = GetSubString(SystemArg.processFileStr, "<action0>", "</action0>");--截取文件中<action0>标签之间的字符串
    SystemArg.processName = GetSubString(actionString, "<type>","</type>");--获取流程名称
    contentTab = GetSubString(actionString,"<content>","</content>");--再截取<content>标签中的内容
    tab = split(contentTab, ",");--分割字符串,并将字符串存入tab数组
    SystemArg.actionNumber = 0; 
    for i = 1,24,2 do -- tab中[1][2]分别保存了一个动作的类型与名称,占用了2个, 由于我们是统计action个数,所以这里步进需要设置为2
        if string.len(tab[i]) ~= 1 and string.len(tab[i]) ~= 0 then--判断动作类型不为nil 或者不为一个空格
            SystemArg.actionNumber = SystemArg.actionNumber + 1;--action个数+1
            SystemArg.actionTab[SystemArg.actionNumber] = math.modf((i+1)/2);--由于这个for循环是从1开始,且步进是2,所以需要取 i+1/2
        end
    end

    for i = 25,48,2 do
        if string.len(tab[i]) ~= 1 and string.len(tab[i]) ~= 0 then
            SystemArg.actionNumber = SystemArg.actionNumber + 1;
            SystemArg.actionTab[SystemArg.actionNumber] = math.modf((i+1)/2);--由于这个for循环是从1开始,且步进是2,所以需要取 i+1/2
        end
    end

end



--***********************************************************************************************
--字符串分割函数,str -> 需要分割的字符串;delimiter->分隔符
--***********************************************************************************************
function split(str, delimiter)
    local dLen = string.len(delimiter)--获取字符串长度
    local newDeli = ''
    for i=1,dLen,1 do
        newDeli = newDeli .. "["..string.sub(delimiter,i,i).."]"
    end

    local locaStart,locaEnd = string.find(str,newDeli)
    local arr = {}
    local n = 1
    while locaStart ~= nil
    do
        if locaStart>0 then
            arr[n] = string.sub(str,1,locaStart-1)
            n = n + 1
        end

        str = string.sub(str,locaEnd+1,string.len(str))
        locaStart,locaEnd = string.find(str,newDeli)
    end
    if str ~= nil then
        arr[n] = str
    end
    return arr
end

--***********************************************************************************************
---遍历历字符串，截取字符串1与字符串2之间的字符串
-- @param str  待解取字符串；  
--        substr1 指定字符串1；  
--        substr2 指定字符串2; 
-- @return 截取后的字符串
--***********************************************************************************************
function GetSubString( str, substr1, substr2)  
    local s1,e1 = string.find(str, substr1)  --获取字符串1的位置
    local s2,e2 = string.find(str, substr2)  --获取字符串2的位置
    local subString
    if s1 == nil or s2 == nil then
         subString = " ";
    else
        subString = string.sub(str, e1+1, s2-1);
    end
    return subString  
end

--***********************************************************************************************
---遍历历字符串，删除字符串1与字符串2之间的字符串,返回新字符串
-- @param str  待解取字符串；  
--        substr1 指定字符串1；  
--        substr2 指定字符串2; 
-- @return 截取后的字符串
--***********************************************************************************************
function DeleteSubString(str, substr1, substr2)
    local s1,e1 = string.find(str, substr1)  --获取字符串1的位置
    local s2,e2 = string.find(str, substr2)  --获取字符串2的位置
    if s1 ~= nil and s2 ~= nil then
        str = string.sub(str,1,s1-1)..string.sub(str, e2+1, -1);
    end
    return str
end


--***********************************************************************************************
--复制文件操作, 用于配置文件的导入导出
--***********************************************************************************************
function ConfigFileCopy(sourcefile, destinationfile)
    sFile = io.open(sourcefile, "r");
    if sFile == nil then
        return 
    end
    destFile = io.open(destinationfile, "w");
    destFile:write(sFile:read("*all"));
    sFile:close()
    destFile:close()
end

--***********************************************************************************************
--根据流程名称,获取对应的序号
--name : 流程名称
--***********************************************************************************************
function get_process_Id(name)
    local processId = 0;

    --遍历流程1-12, 找到运行控制界面中设置的流程名称,在流程设置1界面中对应的流程序号
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId), name, 1) ~= nil then
            processId = i;
            break;
        end
    end
    return processId;
end 




