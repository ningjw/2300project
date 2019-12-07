--下面列出了常用的回调函数
--更多功能请阅读<<物联型LUA脚本API.pdf>>
--建议使用visual code studio 并安装Bookmarks与luaide-lite(或者LuaCoderAssist)插件,
--通过打开同目录下的2300project.code-workspace工作空间查看main.lua文件,该文件使用Bookmarks插件插入了很多标签,方便跳转


--[[-----------------------------------------------------------------------------------------------------------------
    宏定义&全局变量
--------------------------------------------------------------------------------------------------------------------]]
MAIN_SCREEN = 0;
RUN_CONTROL_SCREEN = 1;
PROCESS_SET1_SCREEN = 2;
PROCESS_SET2_SCREEN = 3;
PROCESS_SET3_SCREEN = 4;
PROCESS_INIT_SCREEN = 5;
PROCESS_INJECT_SCREEN = 6;
PROCESS_INJECT_ADD_SCREEN = 7;
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

BLANK_SPACE = " ";
PERIOD_PROCESS = 0;--周期流程
TIMED_PROCESS = 1;--定时流程

COLOR_METHOD = 0; --比色法
ELEC_METHOD = 1;--电极法

ENABLE_STRING = "1.0"
DISABLE_STRING = "0.0"

ENABLE = 1.0
DISABLE = 0.0

CHN = 1;--中文
ENG = 2;--英文

SET = 1;
RESET = 0;

OK = 0;
ERR = 1;

FINISHED = 0;--子流程执行完成

OPEN = 1;--阀打开
CLOSE = 0;--阀关闭

UNLOCKED = 0;--串口未上锁
LOCKED = 1;--串口已上锁

NO_NEED_REPLY = 0;--串口数据不需要回复
NEED_REPLY = 1;--串口数据需要回复

Direction = {
    [CHN] = {FWD = "正转",REV = "反转"},
}



TipsTab = {
    [CHN] = {
        insertSdUsb = "请插入SD卡或者U盘",
        insertSd    = "插入SD卡",
        insertUsb   = "插入U盘",
        pullOutSd   = "拔出SD卡",
        pullOutUSB  = "拔出U盘",
        importing   = "正在导入配置文件...",
        imported    = "配置文件导入成功",
        exporting   = "正在导出配置文件...",
        exported    = "配置文件导出成功",
        exportTips  = "请在SD卡或U盘创建config文件夹后重试",
        selectProcess = "请选择流程",
        sysInit = "系统初始化",
        null    = "无",
    },
};

WorkStatus = {
    [CHN] = {
        run = "运行",--此时系统正在运行流程
        stop = "停止",
        readyRun = "待机", --此时为自动运行方式, 且在等待时间到后自动进行下一次流程的状态.
    }
};

WorkType = {
    [CHN] = {
        hand = "手动",--按启动按钮后,执行一次
        auto = "自动",--按启动按钮后,可以根据时间判断是否进行周期流程与定时流程
        controlled = "反控",--通过上位机发送指令运行流程.
    },
}

SysUser = {
    [CHN] = {
        operator = {"操作员"},
        maintainer = "运维员",
        administrator = "管理员",
    },
}


ValveStatus = {
    [CHN] = {
        open = "打开",
        close = "关闭"
    },
}


CalcType = {
    [CHN] = {
        log = "取对数",
        diff = "取差值",
    },
}

ProcessItem = {
    [CHN] = {"分析","校正","清洗","管路填充","零点核查","标样核查","跨度核查",BLANK_SPACE},
    };
ActionItem = {
    [CHN] = {"初始化","注射泵","注射泵加液体","读取信号","蠕动泵加液","计算","等待时间","消解","阀操作",BLANK_SPACE},
};

Sys = {
    language = CHN,--系统语言
    userName = "",--用于保存当前用户
    status = 0,--系统状态:对应WorkStatus中的值
    runType = 0,--运行方式: 对应WorkType中的值
    analysisType = COLOR_METHOD,--分析方法
    rangetypeId = 1,--用于记录量程选择

    handRunTimes = 0;--记录了手动运行次数

    periodStartDateTime = "",--周期流程开始时间
    periodicIndex = 1,--周期流程id, 周期流程总共有四个, 该变量值的范围为1-4.

    actionTotal = 0,--所有的动作步数,可以通过统计<action>标签获得
    actionStep = 1,--取值范围为1-24,对应了流程设置2/3界面中的共24个步骤
    actionSubStep = 1,--该变量用于控制"初始化"注射泵""消解""注射泵加液"等等子动作.
    --actionIdTab保存了各个动作的序号,例如SystemArg.actionIdTab[1] = 3, 表示第一步就执行序号为3的action, 也意味着序号为1/2的action为空格(没有设置)
    actionIdTab = {[1] = 0,[2] = 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0,[7] = 0,[8] = 0, [9] = 0, [10] = 0,[11] = 0,[12] = 0,
                 [13]= 0,[14]= 0,[15]= 0,[16]= 0,[17]= 0,[18]= 0,[19]= 0,[20] = 0,[21] = 0,[22] = 0,[23] = 0,[24] = 0},

    actionNameTab = {[1] = 0,[2] = 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0,[7] = 0,[8] = 0, [9] = 0, [10] = 0,[11] = 0,[12] = 0,
                 [13]= 0,[14]= 0,[15]= 0,[16]= 0,[17]= 0,[18]= 0,[19]= 0,[20] = 0,[21] = 0,[22] = 0,[23] = 0,[24] = 0},

    actionFunction = nil,--用于指向需要执行的动作函数,例如 excute_init_process, excute_get_sample_process等
    actionString,--截取流程配置文件中的action标签后, 内容保存到该变量
    actionType="",--用于保存type标签中的内容, 表示该动作是""初始化""注射泵""注射泵加液"等等
    contentTabStr = "",--用于保存content标签中的内容
    contentTab = {},  --用于保存content标签中的内容,此时已经调用split对contentTabStr中的内容进行了分割

    currentProcessId = 0,--当前正在执行的流程,所对应的的序号.
    processFileStr = nil,--读出取流程相关的配置文件后,保存到该变量当中
    processName = nil ,--流程名称
    processType = nil,--流程类型, 通过该变量判断是校正 还是 非校正. 校正使用一种算法, 非校正使用另一种算法
    processStep = 1,--执行流程时,会分步骤, 比如第一步读取action内容,解析动作类型,确定执行的动作函数, 第二步就可以执行动作函数了
    isPeriodOrTimed = 0,--使用该变量判断是周期流程还是定时流程

    startTime =  {year = 0, mon=0, day = 0, hour = 0, min = 0, sec = 0},--开始时间
    resultTime = {year = 0, mon=0, day = 0, hour = 0, min = 0, sec = 0},--结果时间
    dateTime =   {year = 0, mon=0, day = 0, hour = 0, min = 0, sec = 0},--系统日期时间,在1S定时器中不断刷新

    driverStep = 1,--用于控制所有最子层的动作,例如在开阀时: 第一步需要通过串口发送开阀指令, 第二步需要等待回复成功, 第三步需要等待一定的时间.这个就是由该变量控制
    driverStep1Func = nil,--当step=driverStep时,需要执行的函数,比如调用开阀函数/关阀函数/操作注射泵函数/等等
    driverSubStep = 1,--用于driverSubStep用于控制driverStep1Func指向的函数,例如在运行流程时,运行到了注射泵加液,
                               --此时:第一步需要设置注射泵速度, 第二步需要设置注射泵方向

    waitTimeFlag = RESET,--用于标志是否正在等待超时时间到; 取值0或者1; 1(SET)= 当前正在等待超时, 0(RESET)表示等待超时完成
    waitTime = 0,--用于保存需要等待的时间

    valcoChannel = 0,--用于保存在运行流程时的十通阀通道号
    valveOperate , --用于指示关阀还是开阀
                                      --valveIdTab 保存16个阀是否选中
    valveIdTab = {[1] = 0,[2] = 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0,[7] = 0,[8] = 0, [9] = 0, [10] = 0,[11] = 0,[12] = 0,[13]= 0,[14]= 0,[15]= 0,[16]= 0},

    injectId = 1,--取值1或者2 表示注射泵1或者注射泵2
    injectSpeed = 0,
    injectScale = 0,
    injectCurrentSpd = 0,

    peristalticId = 1,--取值1/2/3
    peristalticSpeed = 0,
    peristalticVolume = 0,
    peristalticDir = "";
    peristalticCurrentSpd = 0,
    peristalticCurrentDir = 0,

    dispelTemp,--消解温度
    dispelTime,--消解时间
    dispelEmptyTemp,--消解排空温度

    signalTab = {},--用于保存多个连续的电位信号
    signalTotal = 0,--用于统计当前信号个数
    signalE1 = 0,--用于保存信号E1的值
    signalE2 = 0,--用于保存信号E2的值
    signalDrift = 0,--信号漂移
    signalMinTime = 0,--读取信号最小时间
    signalMaxTime = 0,--读取信号最大时间

    calculateType = "",--计算类型: 取对数 或者 取差值 方式
    result = 0,--进行一次流程运行后得到的结果,该结果可能是分析结果/校正结果/...

    hand_control_func = nil;
}



--[[-----------------------------------------------------------------------------------------------------------------
    入口函数
--------------------------------------------------------------------------------------------------------------------]]


--***********************************************************************************************
--初始化函数,系统加载LUA脚本后，立即调用次回调函数
--***********************************************************************************************
function on_init()
    set_text(PROCESS_SET2_SCREEN, ProcesstypeId, BLANK_SPACE);
    set_text(PROCESS_SET3_SCREEN, ProcesstypeId, BLANK_SPACE);
    for i = 1,12,1 do
        set_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId,BLANK_SPACE);
        set_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId,BLANK_SPACE);
        set_text(PROCESS_SET2_SCREEN, TabAction[i].typeId,BLANK_SPACE);
        set_text(PROCESS_SET2_SCREEN, TabAction[i].nameId,BLANK_SPACE);
        set_text(PROCESS_SET3_SCREEN, TabAction[i+12].typeId,BLANK_SPACE);
        set_text(PROCESS_SET3_SCREEN, TabAction[i+12].nameId,BLANK_SPACE);
    end
    for i = 1,24,1 do
        set_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].textId,BLANK_SPACE);
    end
    for i=1,4,1 do
        set_text(RUN_CONTROL_SCREEN,PeriodicTab[i].textId,BLANK_SPACE);
    end
    set_text(RUN_CONTROL_SCREEN,HandProcessTab[1].textId ,BLANK_SPACE);
    
    ReadProcessFile();--加载流程设置1界面/运行控制界面/量程设置界面中的参数配置
    if record_get_count(SYSTEM_INFO_SCREEN,6) == 0 then --表示还未设置初始密码
        record_add(SYSTEM_INFO_SCREEN, pwdRecordId, "171717");--运维员与管理员的默认密码都是171717
        record_add(SYSTEM_INFO_SCREEN, pwdRecordId, "171717");--运维员与管理员的默认密码都是171717
    end

    Sys.hand_control_func = sys_init;--开机首先进行初始化操作
    SetSysUser(SysUser[Sys.language].maintainer);   --开机之后默认为运维员
    -- SetSysUser(SysUser.operator);   --开机之后默认为操作员
    uart_set_timeout(2000,1); --设置串口超时, 接收总超时2000ms, 字节间隔超时1ms
    start_timer(0, 100, 1, 0) --开启定时器 0，超时时间 100ms,1->使用倒计时方式,0->表示无限重复
end

--***********************************************************************************************
--定时器超时，执行此回调函数,定时器编号 0~3
--定时器0: 1ms超时中断, 流程相关函数主要运行在该定时器当中
--定时器1: 3ms超时中断, 主要用于判断串口数据回复是否超时
--定时器2: 用于读取E1/E2信号时的超时判断; 用于流程控制中的超时判断
--***********************************************************************************************
function on_timer(timer_id)
    if  timer_id == 0 then --定时器0,定时时间到
        if Sys.status == WorkStatus[Sys.language].run then--运行
            excute_process();
        elseif Sys.hand_control_func ~= nil then
            Sys.hand_control_func();
        end
    elseif timer_id == 1 then--串口超时
        uart_time_out();
    elseif timer_id == 2 then--等待时间完成
        Sys.waitTimeFlag = RESET ;
    end
end

 

--***********************************************************************************************
--定时回调函数，系统每隔1秒钟自动调用。
--***********************************************************************************************
function on_systick()
    Sys.dateTime.year,Sys.dateTime.mon,Sys.dateTime.day,
    Sys.dateTime.hour,Sys.dateTime.min,Sys.dateTime.sec = get_date_time();--获取当前时间
    
    if Sys.status == WorkStatus[Sys.language].readyRun then           --当系统处于待机状态时,
        process_ready_run();
    end
end

--***********************************************************************************************
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--***********************************************************************************************
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
	elseif screen == PROCESS_INIT_SCREEN then--流程设置-开始界面
		process_init_control_notify(screen,control,value);
	elseif screen == PROCESS_INJECT_SCREEN	then--流程设置-取样界面
		process_inject_control_notify(screen,control,value);
	elseif screen == PROCESS_INJECT_ADD_SCREEN	then--流程设置-注射泵加液
		process_inject_add_control_notify(screen,control,value);
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
    elseif screen == HAND_OPERATE2_SCREEN then --手动操作2
        hand_operate2_control_notify(screen,control,value);	
	elseif screen == SYSTEM_INFO_SCREEN then --系统信息界面
		system_info_control_notify(screen,control,value);	
    elseif screen == LOGIN_SYSTEM_SCREEN then--登录系统界面
		login_system_control_notify(screen,control,value);	
	elseif screen == PASSWORD_SET_SCREEN then--密码设置界面
		password_set_control_notify(screen,control,value);		
	end
end

--***********************************************************************************************
--当画面切换时，执行此回调函数，screen为目标画面。
--***********************************************************************************************
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

--***********************************************************************************************
--插入 U 盘后，执行此回调函数
--***********************************************************************************************
function on_usb_inserted(dir)
    ShowSysTips(TipsTab[Sys.language].insertUsb);
    UsbPath = dir;
end

--***********************************************************************************************
--拔出 U 盘后，执行此回调函数
--***********************************************************************************************
function on_usb_removed()
    ShowSysTips(TipsTab[Sys.language].pullOutUSB);
end

--***********************************************************************************************
--插入 SD 卡后，执行此回调函数
--***********************************************************************************************
function on_sd_inserted(dir)
    ShowSysTips(TipsTab[Sys.language].insertSd);
    SdPath = dir;
end

--***********************************************************************************************
--拔出 SD 卡后，执行此回调函数
--***********************************************************************************************
function on_sd_removed()
    ShowSysTips(TipsTab[Sys.language].pullOutUSB);
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程控制函数
--------------------------------------------------------------------------------------------------------------------]]
--***********************************************************************************************
--系统初始化, 一般在开机或者急停时调用该函数
--***********************************************************************************************
function sys_init()
    if UartArg.lock == LOCKED then
        return;
    end

    if Sys.processStep == 1 then--第一步: 关闭阀11
        close_single_valve(11);
        Sys.processStep = Sys.processStep + 1;
        ShowSysCurrentAction(TipsTab[Sys.language].sysInit);
    elseif Sys.processStep == 2 then --第二步:关闭阀12
        close_single_valve(12);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then --第三步:使能注射泵1
        enable_inject1();
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 4 then --第四步:复位注射泵
        Sys.waitTimeFlag = SET;
        Sys.waitTime = 8;
        start_timer(2, Sys.waitTime * 1000, 1, 1); --开启定时器2，超时时间8s,1->表示只执行一次
        reset_inject1();
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 5 then --第五步:初始化结束
        ShowSysCurrentAction(TipsTab[Sys.language].null);
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    串口收发
--------------------------------------------------------------------------------------------------------------------]]

--设置全局变量uart_free_protocol，使用自由串口协议
uart_free_protocol = 1;


uartSendTab = {
    getSoftVer = {[0] = 0xEE, 0x03, 0x10, 0x03, 0x00, 0x03, 0x00, 0x00, len = 6, note = "获取软件版本" },
    getHardVer = {[0] = 0xEE, 0x03, 0x10, 0x02, 0x00, 0x03, 0x00, 0x00, len = 6, note = "获取硬件版本" },
    getTemp    = {[0] = 0xEE, 0x03, 0x10, 0x0A, 0x00, 0x01, 0x00, 0x00, len = 6, note = "测量池温度" },
    getVoltage = {[0] = 0xEE, 0x03, 0x10, 0x14, 0x00, 0x01, 0x00, 0x00, len = 6, note = "光电管电压"},
    openLed    = {[0] = 0xEE, 0x06, 0x10, 0x0E, 0x00, 0x01, 0x00, 0x00, len = 6, note = "开LED灯" },
    closeLed   = {[0] = 0xEE, 0x06, 0x10, 0x0E, 0x00, 0x00, 0x00, 0x00, len = 6, note = "关LED灯" },
    getDrvVer  = {[0] = 0xE0, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "版本号"},
    openValco  = {[0] = 0xE0, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "十通阀"},--开十通阀
    openV11    = {[0] = 0xE0, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "开阀11"},
    closeV11   = {[0] = 0xE0, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "关阀11"},
    openV12    = {[0] = 0xE0, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "开阀12"},
    closeV12   = {[0] = 0xE0, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "关阀12"},
    enInject1  = {[0] = 0xE0, 0x0F, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "使能注射泵"},
    mvInject1To= {[0] = 0xE0, 0x0D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "移动注射泵"},
    setInject1Spd={[0]= 0xE0, 0x0E, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "设置注射泵速度"},
    rstInject1 = {[0] = 0xE0, 0x0D, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "复位注射泵"},
}



UartArg = {
    repeat_times = 0,--用于记录重发次数
    repeat_data ,--用于保存本次重发数据
    recv_data,--用于保存接收到的数据
    reply_data = {[0] = 0, [1] = 0},--用于保存需要接受到的回复数据
    lock = UNLOCKED,--用于指示串口是否上锁, 当发送一条需要等待回复的串口指令时,串口上锁, 当收到回复时,串口解锁
};


--***********************************************************************************************
--串口接受函数 
--串口波特率为38400, 传送1bit需要 1000000/38400 = 26us, 传送一个字节的数据需要10bit,则传送1Byte数据需要260us
--***********************************************************************************************
function on_uart_recv_data(packet)

    local rev_len = 0;

    --获取数据长度
    for i=0,50,1 do
        rev_len = i;
        if packet[i] == nil then
            break;
        end
    end

    --将接受到的数据保存到全局变量
    UartArg.recv_data = packet;

    if packet[0] == UartArg.reply_data[0] and packet[1] == UartArg.reply_data[1] then--接受到数据回复
        UartArg.lock = UNLOCKED;
        stop_timer(1)--停止超时定时器
        local UartDateTime =  string.format("%02d-%02d %02d:%02d",Sys.dateTime.mon,Sys.dateTime.day,Sys.dateTime.hour,Sys.dateTime.min);
        local UartData = "";--将需要发送的数据保存到该字符串中
        for i=0, rev_len-1, 1 do
            UartData = UartData..string.format("%02x ", packet[i]);
        end
        record_add(HAND_OPERATE4_SCREEN, UartRecordId, "RX;"..UartDateTime..";"..UartData..";".."回复");--添加通信记录
    end
end

--***********************************************************************************************
--发送串口数据
--packet : 取值为uartSendTab中的参数, 例如uartSendTab.openV11
--reply : 表示是否是要等待回复,取值 NEED_REPLY  与 NO_NEED_REPLY
--***********************************************************************************************
function on_uart_send_data(packet, reply)
    if UartArg.lock == LOCKED then
        return;
    end

    if reply == NEED_REPLY then --表示需要等待回复
        start_timer(1, 3000, 1, 0); --开启定时器1，超时时间 3s, 1->使用倒计时方式,0->表示无限重复
        UartArg.lock = LOCKED;      --给串口上锁, 收到回复后自动解锁
        UartArg.repeat_data = packet;--设置重发数据
        UartArg.reply_data[0] = packet[0];--设置回复数据,用于判断是否成功接受到回复
        UartArg.reply_data[1] = packet[1];
    end
    
    packet[packet.len], packet[packet.len+1] = CalculateCRC16(packet, packet.len);--计算crc16
    uart_send_data(packet) --将数据通过串口发送出去

    --以下代码功能: 每发送一次数据,就将该数据保存在手动操作4的串口收发记录当中,方便从触摸屏查看.
    local UartDateTime =  string.format("%02d-%02d %02d:%02d",Sys.dateTime.mon,Sys.dateTime.day,Sys.dateTime.hour,Sys.dateTime.min);
    local UartData = "";--将需要发送的数据保存到该字符串中
    for i=0, packet.len+1, 1 do
        UartData = UartData..string.format("%02x ", packet[i]);
    end
    print(packet.note);--调试输出
    record_add(HAND_OPERATE4_SCREEN, UartRecordId, "TX;"..UartDateTime..";"..UartData..";"..packet.note);--添加通信记录
end


--***********************************************************************************************
--进入到该函数表示串口一定回复超时, 因为如果回复成功, 在on_uart_recv_data函数中就会停止定时器1,就不会进入到该函数
--***********************************************************************************************
function uart_time_out()
    UartArg.repeat_times = UartArg.repeat_times + 1;
    if UartArg.repeat_times <= 3 then
        UartArg.lock = UNLOCKED;
        on_uart_send_data(UartArg.repeat_data, NEED_REPLY);--数据重发
    else  --重发三次都没有回复,不再重发
        UartArg.repeat_times = 0;
        --此时如果系统在运行流程,则锁住串口,不再继续往下执行,在按停止后会解锁串口; 如果是手动操作发送串口指令,则解锁串口
        if Sys.status == WorkStatus[Sys.language].run then
            UartArg.lock = LOCKED;
        else
            UartArg.lock = UNLOCKED;
        end
        stop_timer(1)--停止超时定时器
    end
end

--***********************************************************************************************
--右移一位的操作,在计算校验码中使用
--***********************************************************************************************
function right_shift_one(data)
    local new_data;
    if math.fmod(data,2) == 1 then
        new_data = math.modf((data-1)/2);
    else
        new_data = math.modf(data/2);
    end
    return new_data
end

--***********************************************************************************************
--异或操作,在计算校验码中使用
--***********************************************************************************************
function xor(num1,num2)
	local tmp1 = num1
	local tmp2 = num2
	local str = ""
	repeat
		local s1 = tmp1 % 2
		local s2 = tmp2 % 2
		if s1 == s2 then
			str = "0"..str
		else
			str = "1"..str
		end
		tmp1 = math.modf(tmp1/2)
		tmp2 = math.modf(tmp2/2)
	until(tmp1 == 0 and tmp2 == 0)
	return tonumber(str,2)
end


--***********************************************************************************************
--计算校验码: ModeBusCRC16
--***********************************************************************************************
function CalculateCRC16(data, len)
    local crc16 = 0xffff;
    for i = 0, len-1 ,1 do  
        crc16 = xor(crc16, data[i]);
        for j=0, 7, 1 do
            if math.fmod(crc16,2) == 1 then
                crc16 = right_shift_one(crc16);
                crc16 = xor(crc16, 0xA001);
            else
                crc16 = right_shift_one(crc16);
            end
        end
    end
    local crc1 = math.fmod(crc16,256);
    local crc2 = math.modf(crc16/256);
    return crc1, crc2;
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
NextProcessTimeTextId = 2  --下次启动时间

SysWorkStatusId = 901;   --工作状态
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
    Sys.status = status;--设置系统状态为运行
    --在底部的状态栏显示工作状态:停止/运行/待机
    for i = 1,16,1 do
        set_text(PublicTab[i], SysWorkStatusId, status);
        if status == WorkStatus[Sys.language].stop or status == WorkStatus[Sys.language].readyRun then
            set_text(PublicTab[i], SysCurrentActionId, TipsTab[Sys.language].null);
        end
    end
end

--***********************************************************************************************
--  在底部的状态栏显示当前动作
--***********************************************************************************************
function ShowSysCurrentAction(action)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysCurrentActionId, action);
    end
end

--***********************************************************************************************
--  在底部的状态栏显示告警信息
--***********************************************************************************************
function ShowSysAlarm(alarm)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysAlarmId, alarm);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    阀/注射泵/蠕动泵控制
--------------------------------------------------------------------------------------------------------------------]]


--***********************************************************************************************
--控制单个阀关闭
--valveId 阀id
--***********************************************************************************************
function close_single_valve(valveId)
    if valveId == 11 then
        on_uart_send_data(uartSendTab.closeV11, NEED_REPLY);
    elseif valveId == 12 then
        on_uart_send_data(uartSendTab.closeV12, NEED_REPLY);
    end
end

--***********************************************************************************************
--控制单个阀打开
--***********************************************************************************************
function open_single_valve(valveId)
    if valveId == 11 then
        on_uart_send_data(uartSendTab.openV11, NEED_REPLY);
    elseif valveId == 12 then
        on_uart_send_data(uartSendTab.openV12, NEED_REPLY);
    end
end


--***********************************************************************************************
--控制多个阀打开或者关闭, 在函数在流程运行时调用,当添加了阀操作或者注射泵加液时,可能会调用该函数(这两个子流程中,允许同时操作多个阀)
--Sys.valveIdTab 中保存各16个阀是需要进行关闭还是打开操作
--Sys.valveOperate 记录了需要打开还是关闭
--***********************************************************************************************
function control_multi_valve()
    if UartArg.lock == LOCKED then
        return;
    end

    for i = 1, 16, 1 do
        if Sys.valveIdTab[i] == ENABLE_STRING then--需要进行操作
            Sys.valveIdTab[i] = DISABLE_STRING;
            if Sys.valveOperate == ValveStatus[Sys.language].open then
                open_single_valve(i);--开阀并退出程序
            else
                close_single_valve(i);--关阀并退出程序
            end
            break;--跳出for循环
        end
        if i == 16 then--所有操作都完成
            Sys.driverSubStep = FINISHED;
        end
    end
end

--***********************************************************************************************
--控制十通阀
--channel:通道号，取值0-9
--***********************************************************************************************
function control_valco(channel)
    uartSendTab.openValco[2] = channel;
    uartSendTab.openValco.note = "开十通阀"..channel;
    on_uart_send_data(uartSendTab.openValco, NEED_REPLY);
end

--***********************************************************************************************
--使能注射泵
--***********************************************************************************************
function enable_inject1(void)
    on_uart_send_data(uartSendTab.enInject1, NEED_REPLY);
end

--***********************************************************************************************
--复位注射泵
--***********************************************************************************************
function reset_inject1(void)
    on_uart_send_data(uartSendTab.rstInject1, NEED_REPLY);
end

--***********************************************************************************************
--设置注射泵速度
--speed:注射泵速度,取值0-27
--***********************************************************************************************
function set_inject1_speed(speed)
    uartSendTab.setInject1Spd[2] = speed;
    on_uart_send_data(uartSendTab.setInject1Spd, NEED_REPLY);
end

--***********************************************************************************************
--移动注射泵到指定位置
--scale：注射泵移动到的刻度，最大值45
--***********************************************************************************************
function move_inject1_to(scale)
    uartSendTab.mvInject1To[4] = scale;
    on_uart_send_data(uartSendTab.mvInject1To, NEED_REPLY);
end

--***********************************************************************************************
--控制注射泵
--Sys.driverSubStep 用于控制执行哪一段代码块
--Sys.injectId 变量保存了需要操作的注射泵
--Sys.injectSpeed 变量保存了需要设置速度
--Sys.injectScale 变量保存了需要将注射泵移动到什么刻度
--***********************************************************************************************
function control_inject1()
    -----------------设置注射泵速度------------------------------
    if Sys.driverSubStep == 1 then
        if Sys.injectCurrentSpd == Sys.injectSpeed then --设置的速度与当前速度相等, 不需要重复设置
            Sys.driverSubStep = 3;
        else
            set_inject1_speed(Sys.injectSpeed);--发送设置速度的串口指令
            Sys.driverSubStep = Sys.driverSubStep + 1;
        end
    elseif Sys.driverSubStep == 2 then--等待串口回复
        if UartArg.lock == UNLOCKED then
            Sys.injectCurrentSpd = Sys.injectSpeed;
            Sys.driverSubStep = Sys.driverSubStep + 1;
        end
    -----------------将注射泵移动到指定位置------------------------
    elseif Sys.driverSubStep == 3 then
            move_inject1_to(Sys.injectScale)--将注射泵移动到指定的位置
            Sys.driverSubStep = Sys.driverSubStep + 1;
    elseif Sys.driverSubStep == 4 then--等待串口回复
        if UartArg.lock == UNLOCKED then
            Sys.driverSubStep = FINISHED;
        end
    end
end


--***********************************************************************************************
--控制蠕动泵(目前硬件暂未有蠕动泵)   ##待完善##
--Sys.peristalticSpeed  保存了需要设置的速度
--Sys.peristalticDir    保存了需要设置的方向
--Sys.peristalticVolume 保存了需要抽取的体积
--***********************************************************************************************
function control_peristaltic()
    -----------------设置蠕动泵速度------------------------------
    if Sys.driverSubStep == 1 then
        if Sys.peristalticCurrentSpd == Sys.peristalticSpeed then --设置的速度与当前速度相等, 不需要重复设置
            Sys.driverSubStep = Sys.driverSubStep + 2;
        else
            --发送设置速度的串口指令
            Sys.driverSubStep = Sys.driverSubStep + 1;
        end
    elseif Sys.driverSubStep == 2 then--等待串口回复
        if UartArg.lock == UNLOCKED then
            Sys.peristalticCurrentSpd = Sys.peristalticSpeed;
            Sys.driverSubStep = Sys.driverSubStep + 1;
        end
    -----------------设置蠕动泵方向------------------------
    elseif Sys.driverSubStep == 3 then
            if Sys.peristalticCurrentDir == Sys.peristalticDir then--设置的方向与当前方向相同, 不需要重复设置
                Sys.driverSubStep = Sys.driverSubStep + 2;
            else
                
                Sys.driverSubStep = Sys.driverSubStep + 1;
            end
    elseif Sys.driverSubStep == 4 then--等待串口回复
        if UartArg.lock == UNLOCKED then
            Sys.peristalticCurrentDir = Sys.peristalticDir;
            Sys.driverSubStep = Sys.driverSubStep + 1;
        end
    -----------------设置蠕动泵抽取指定体积的液体------------
    elseif Sys.driverSubStep == 5 then
        Sys.driverSubStep = Sys.driverSubStep + 1;
    elseif Sys.driverSubStep == 6 then--等待串口回复
        if UartArg.lock == UNLOCKED then
            Sys.driverSubStep = FINISHED;
        end
    end
end


--***********************************************************************************************
--开始等待时间
--time_s
--***********************************************************************************************
function start_wait_time(time_s)
    Sys.waitTimeFlag = SET;
    start_timer(2, time_s * 1000, 1, 1); --开启定时器2，超时时间 wait_time, 1->使用倒计时方式,1->表示只执行一次
end


--***********************************************************************************************
--该table实现了发送串口指令->等待回复->跳转到下一步   的流程框架
--***********************************************************************************************
driver = {
    [1] = function()
        if UartArg.lock == UNLOCKED then--发送串口指令
            Sys.driverStep1Func();
            if Sys.driverSubStep == FINISHED then
                Sys.driverSubStep = 1;
                Sys.driverStep = Sys.driverStep + 1;
            end
        end
    end,
    [2] = function()
        if UartArg.lock == UNLOCKED then--等待串口回复成功
            Sys.driverStep = Sys.driverStep + 1;
        end
    end,
    [3] = function()                     --启动定时器
        if Sys.waitTime ~= 0 then
            Sys.waitTimeFlag = SET;
            start_timer(2, Sys.waitTime * 1000, 1, 1); --开启定时器2，超时时间 wait_time, 1->使用倒计时方式,1->表示只执行一次
            Sys.driverStep = Sys.driverStep + 1;
        else
            Sys.driverStep = 5;--完成 (无需等待)
        end
    end,
    [4] = function()
        if Sys.waitTimeFlag == RESET then--等待定时完成
            Sys.driverStep = 5;--完成
        end
    end,
    [5] = function()
        Sys.driverStep = 1;
        Sys.actionSubStep = Sys.actionSubStep + 1;--本次串口指令执行完成,继续执行下一个动作
    end,
}

--***********************************************************************************************
--该table实现了
--***********************************************************************************************
function start_wait_time()
end

--[[-----------------------------------------------------------------------------------------------------------------
    运行控制
--------------------------------------------------------------------------------------------------------------------]]


--流程设置相关的按钮id从101 - 129, 其中101为周期流程第一个, id129为手动流程
RUNCTRL_TextStartId = 1;
RUNCTRL_TextEndId = 85;

RunTypeID = 30;--运行方式对应的文本空间ID
RunTypeMenuId = 243;--运行方式菜单
RunStopButtonId = 229;--运行状态切换按钮"初始化""停止"按钮

TimedProcessClear = 410;--一键清空所有的定时设置


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
                nextStartTime = {year=0, mon=0, day=0, hour=0, min=0};
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

    --当按下开始时, 首先设置系统状态为待机状态,因为只有在该状态调用get_current_process_id返回值才是需要执行的流程序号
    --得到流程序号后, 就可以读取已该序号命名的配置文件,该配置文件保存了该流程的所有动作.
    elseif control == RunStopButtonId then
        if get_value(RUN_CONTROL_SCREEN,control) == ENABLE then      --按钮按下,此时系统状态变为运行
            SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态
            process_ready_run();--开始运行前的一些初始化操作
        else--按钮松开,此时系统状态应变为停止
            SystemStop();
        end
    elseif control == RunTypeMenuId then--更改运行方式
        Sys.runType = get_text(RUN_CONTROL_SCREEN, RunTypeID);
        WriteProcessFile(2);
    elseif control == HandProcessTab[1].TimesId then--更改手动运行次数
        HandProcessTab[1].times = tonumber(get_text(RUN_CONTROL_SCREEN, control));
        WriteProcessFile(2);
    elseif control >= PeriodicTab[5].textId and control <= PeriodicTab[10].textId then --更改周期开始时间与频率
        PeriodicTab[control-27].value = tonumber(get_text(RUN_CONTROL_SCREEN, control));--control-27后,对应了周期流程开始时间与频率
        WriteProcessFile(2);
    elseif control >= TimedProcessTab[1].startHourId and control <= TimedProcessTab[24].startHourId then--更改定时流程时间中的小时
        TimedProcessTab[control-37].startHour = tonumber(get_text(RUN_CONTROL_SCREEN,control));--control-37后,对应了定时流程的序号
        WriteProcessFile(2);
    elseif control >= TimedProcessTab[1].startMinuteId and control <= TimedProcessTab[24].startMinuteId then--更改定时流程时间中的分钟
        TimedProcessTab[control-61].startMinute = tonumber(get_text(RUN_CONTROL_SCREEN,control));--control-61后,对应了定时流程的序号
        WriteProcessFile(2);
    elseif control == TimedProcessClear then--一键清空所有定时设置
        for i = 1,24,1 do
            set_text(RUN_CONTROL_SCREEN, TimedProcessTab[i].textId, BLANK_SPACE);
            set_text(RUN_CONTROL_SCREEN, TimedProcessTab[i].startHourId, string.format( "%02d",i));
            set_text(RUN_CONTROL_SCREEN, TimedProcessTab[i].startMinuteId, "00");
            process_change(i+4);
            TimedProcessTab[i].startHour   = tonumber(get_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].startHourId));
            TimedProcessTab[i].startMinute = tonumber(get_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].startMinuteId));
        end
        WriteProcessFile(2);
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
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), get_text(RUN_CONTROL_SCREEN, control), 1) ~= nil then
            --找到当前是设置的第几个周期流程, 且流程名称不是一个空格(在流程选择2界面中,提供一个空流程,用于删除功能)
            if get_text(PROCESS_SELECT2_SCREEN, control) == BLANK_SPACE then
                processId = 0;
            else
                processId = i;
            end
            break;
        end
    end

    --设置流程id号
    if control == HandProcessTab[1].textId then--手动流程设置
        HandProcessTab[1].processId = processId;
    elseif control >= PeriodicTab[1].textId and control <= PeriodicTab[4].textId then--周期流程
        for i=1,4,1 do
            if control == PeriodicTab[i].textId  then
                PeriodicTab[i].processId = processId;
            end
        end
    elseif control >= TimedProcessTab[1].textId and control <= TimedProcessTab[24].textId then--定时流程
        for i=1,24,1 do
            if control == TimedProcessTab[i].textId  then --找到当前设置的是定时流程中的哪个
                TimedProcessTab[i].processId = processId;
            end
        end
    end
end



--***********************************************************************************************
--判断是否闰年
--返回1表示闰年, 返回0表示平年
--***********************************************************************************************
function isLeapYear(year)
    if math.fmod(year,4) == 0 and math.fmod(year,100) ~= 0 then
        return 1;
    elseif math.fmod(year,400) == 0 then
        return 1;
    end
    return 0;
end

--***********************************************************************************************
--根据加上的天数,设置新的开始日期
--diffDays:需要加上的天数
--***********************************************************************************************
function set_period_start_date(diffDays)
    normalMonthDays = {[1]=31, [2]=28, [3]=31, [4]=30, [5]=31, [6]=30, [7]=31, [8]=31, [9]=30, [10]=31, [11]=30, [12]=31};
    
    local year = PeriodicTab[5].value;
    local mon = PeriodicTab[6].value;
    local day = PeriodicTab[7].value;

    PeriodicTab.nextStartTime.year  = year;
    PeriodicTab.nextStartTime.mon = mon;
    PeriodicTab.nextStartTime.day = day;

    if diffDays == 0 then
        return 
    end

    --1.get years (days >=366 or 365)
    local daysAyear = 365;
    if isLeapYear(year) then
        daysAyear = 366;
    end
    while math.modf(diffDays/daysAyear) >= 1 do -- 大于365天或者366天
        diffDays = diffDays - daysAyear;
        year = year + 1;
        ShowSysTips(year)
        if isLeapYear(year) then
			daysAyear = 366;
        end
    end

    --2.get months (days < 366 or 365)
    if isLeapYear(year) then
        normalMonthDays[2]=29;
    end
    while math.modf(diffDays/normalMonthDays[mon]) >= 1  do
		diffDays = diffDays - normalMonthDays[mon];
		mon = mon + 1;
		if mon >= 13 then
			year = year + 1;
			if isLeapYear(year) then
				normalMonthDays[2]=29;
            end
			mon = math.fmod(mon,12);
        end
    end
    
    --3.get days
    if isLeapYear(year) then
        normalMonthDays[2]=29;
    end
    if(diffDays + day <= normalMonthDays[mon]) then
		day = diffDays + day;
	else
		day = diffDays + day - normalMonthDays[mon];
		mon = mon + 1;
		if mon > 12 then
			year = year + 1;
			mon = math.fmod(mon,12);
        end
    end

    PeriodicTab[5].value = year;
    PeriodicTab[6].value = mon;
    PeriodicTab[7].value = day;
    set_text(RUN_CONTROL_SCREEN, PeriodicTab[5].textId, PeriodicTab[5].value);
    set_text(RUN_CONTROL_SCREEN, PeriodicTab[6].textId, PeriodicTab[6].value);
    set_text(RUN_CONTROL_SCREEN, PeriodicTab[7].textId, PeriodicTab[7].value);
    PeriodicTab.nextStartTime.year  = year;
    PeriodicTab.nextStartTime.mon = mon;
    PeriodicTab.nextStartTime.day = day;
end

--***********************************************************************************************
--根据频率设置下一次开始的时间, 在自动模式下, 进行一次流程后会调用该函数计算下次流程开始时间.
--minFreq: 天数
--***********************************************************************************************
function set_period_start_date_time(minFreq)
    local dayHour = 1440;--24 * 60 一天有多少分钟
    local hour = PeriodicTab[8].value;
    local min = PeriodicTab[9].value;
    
    local minTotal = minFreq + hour * 60 + min;--math.fmod(minFreq,dayHour) + ;

    local minRemain = math.fmod(minTotal,dayHour);
    
    
    PeriodicTab.nextStartTime.hour = math.modf(minRemain/60);
    PeriodicTab.nextStartTime.min = math.fmod(minRemain,60);

    PeriodicTab[8].value = math.modf(minRemain/60);
    PeriodicTab[9].value = math.fmod(minRemain,60);
    set_text(RUN_CONTROL_SCREEN, PeriodicTab[8].textId, PeriodicTab[8].value );
    set_text(RUN_CONTROL_SCREEN, PeriodicTab[9].textId, PeriodicTab[9].value );

    set_period_start_date(math.modf(minTotal / dayHour));
    
    --显示下次自动运行启动流程的时间
    set_text(MAIN_SCREEN,NextProcessTimeTextId,string.format("%d-%02d-%02d  %02d:%02d",
             PeriodicTab.nextStartTime.year,PeriodicTab.nextStartTime.mon,PeriodicTab.nextStartTime.day,
             PeriodicTab.nextStartTime.hour,PeriodicTab.nextStartTime.min));
    WriteProcessFile(2);
end

--***********************************************************************************************
--将当前时间设置为本次流程开始时间
--***********************************************************************************************
function set_process_start_date_time(year,mon,day,hour,min)
    PeriodicTab[5].value = year;
    PeriodicTab[6].value = mon;
    PeriodicTab[7].value = day;
    PeriodicTab[8].value = hour;
    PeriodicTab[9].value = min;

    set_text(RUN_CONTROL_SCREEN, PeriodicTab[5].textId, PeriodicTab[5].value);
    set_text(RUN_CONTROL_SCREEN, PeriodicTab[6].textId, PeriodicTab[6].value);
    set_text(RUN_CONTROL_SCREEN, PeriodicTab[7].textId, PeriodicTab[7].value);
    set_text(RUN_CONTROL_SCREEN, PeriodicTab[8].textId, PeriodicTab[8].value );
    set_text(RUN_CONTROL_SCREEN, PeriodicTab[9].textId, PeriodicTab[9].value );

    WriteProcessFile(2);
end

--***********************************************************************************************
--当点击开始按钮时,调用该函数执行流程
--***********************************************************************************************
function get_current_process_id()
    local processId = 0;
    if Sys.status == WorkStatus[Sys.language].run then--当前状态为运行,直接返回; 如果为停止或者待机则继续往下执行.
        return Sys.currentProcessId;
    end

    --------------------------手动模式 ,这个比较简单,只有一个流程可设置--------------------------------
    if Sys.runType == WorkType[Sys.language].hand then 
        processId = HandProcessTab[1].processId;
    ----------------------自动模式  自动模式中的定时时间错过了会直接跳过该流程--------------------------
    elseif Sys.runType == WorkType[Sys.language].auto then 

        local currentDateTime =  string.format("%d%02d%02d%02d%02d",
                                          Sys.dateTime.year, Sys.dateTime.mon,Sys.dateTime.day,
                                          Sys.dateTime.hour, Sys.dateTime.min);

        Sys.periodStartDateTime = string.format("%d%02d%02d%02d%02d",
                                                       PeriodicTab[5].value,PeriodicTab[6].value,PeriodicTab[7].value,
                                                       PeriodicTab[8].value,PeriodicTab[9].value);


        if Sys.periodStartDateTime <= currentDateTime then--设置的周期开始时间到了,查找是否有满足条件的流程
            local temp_i = 0;
            for i = Sys.periodicIndex, Sys.periodicIndex + 3, 1 do --因为周期流程有4个,所以需要循环查找四次
                if i > 4 then
                    temp_i = i - 4;
                else 
                    temp_i = i;
                end
                if PeriodicTab[temp_i].processId ~= 0 then--流程序号不为0 ,表示该流程有设置,跳出循环, i-diff 表示4个周期流程的第几个流程
                    processId = PeriodicTab[temp_i].processId;--获取流程对应的序号
                    Sys.periodicIndex = temp_i;
                    Sys.isPeriodOrTimed = PERIOD_PROCESS;
                    break;
                end
            end
        end

        if  processId == 0 then   --运行到这里,表示没有满足条件的周期流程, 开始循环查找定时设置中,是否有满足条件的流程
            for i=1,24,1 do
                if TimedProcessTab[i].startHour == Sys.dateTime.hour and 
                   TimedProcessTab[i].startMinute == Sys.dateTime.min and
                   TimedProcessTab[i].processId ~= 0 --序号不为0, 表示该流程有设置
                then
                   processId = TimedProcessTab[i].processId;
                   Sys.isPeriodOrTimed = TIMED_PROCESS;
                end
            end
        end

    -------------------------------------------------反控-----------------------------------------------
    elseif Sys.runType == WorkType[Sys.language].controlled then 

    end
    return processId;
end


--***********************************************************************************************
--禁止流程设置相关的操作
--state : 取值 ENABLE / DISABLE
--***********************************************************************************************
function set_process_edit_state(state)
    --------------------------------流程设置1/2/3界面的参数------------------------------
    for i = 1,12,1 do
        set_enable(PROCESS_SET1_SCREEN, ProcessTab[i].typeId ,state);
        set_enable(PROCESS_SET1_SCREEN, ProcessTab[i].nameId   ,state);
        set_enable(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId  ,state);
        set_enable(PROCESS_SET1_SCREEN, ProcessTab[i].deleteId ,state);

        set_enable(PROCESS_SET2_SCREEN, TabAction[i].typeId, state);
        set_enable(PROCESS_SET2_SCREEN, TabAction[i].nameId,   state);

        set_enable(PROCESS_SET3_SCREEN, TabAction[i+12].typeId, state);
        set_enable(PROCESS_SET3_SCREEN, TabAction[i+12].nameId,   state);
    end

    ----------------------------以上各界面中的""确定"按钮-----------------------------------------
    set_enable(PROCESS_INIT_SCREEN, SureButtonId, state)
    set_enable(PROCESS_INJECT_SCREEN, SureButtonId, state)
    set_enable(PROCESS_INJECT_ADD_SCREEN, SureButtonId, state)
    set_enable(PROCESS_READ_SIGNAL_SCREEN, SureButtonId, state)
    set_enable(PROCESS_PERISTALTIC_SCREEN, SureButtonId, state)
    set_enable(PROCESS_CALCULATE_SCREEN, SureButtonId, state)
    set_enable(PROCESS_WAIT_TIME_SCREEN, SureButtonId, state)
    set_enable(PROCESS_VALVE_CTRL_SCREEN, SureButtonId, state)
    set_enable(PROCESS_SELECT_SCREEN, SureButtonId, state)
    set_enable(PROCESS_SELECT2_SCREEN, SureButtonId, state)
    set_enable(ACTION_SELECT_SCREEN, SureButtonId, state)
end

--***********************************************************************************************
--在开始执行流程前,需要一些准备工作
--***********************************************************************************************
function process_ready_run()
    Sys.currentProcessId = get_current_process_id();--获取当前需要运行的流程id
    
    if Sys.currentProcessId ~= 0  and io.open(Sys.currentProcessId, "r") ~= nil then--不等于0,表示有满足条件的流程待执行,
        set_process_edit_state(DISABLE);            --禁止流程设置相关的操作
        ReadProcessFile();                          --加载流程设置1界面/运行控制界面/量程设置界面中的参数配置
        ReadActionFile(Sys.currentProcessId);       --读取流程配置文件,主要保存的是流程设置2/3 以及开始/注射泵/注射泵加液/蠕动泵加液/消解/阀操作等界面的参数
        if Sys.isPeriodOrTimed == PERIOD_PROCESS then
            set_process_start_date_time(Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day, Sys.dateTime.hour, Sys.dateTime.min);--设置本次流程开始时间
        end
        Sys.driverSubStep = 1; --所有步骤都是从1开始
        Sys.actionStep = 1;
        Sys.actionSubStep = 1;
        Sys.driverStep = 1;
        Sys.driverSubStep = 1;
        Sys.handRunTimes = 0;
        SetSysWorkStatus(WorkStatus[Sys.language].run);--设置工作状态为运行
    end
end

--***********************************************************************************************
--该函数在定时器中调用,在运行状态时调用该函数
--系统为运行状态,此时SystemArg.currentProcessId保存了当前需要运行的流程序号, 而该以该序号为名的流程配置文件保存了该流程的所有动作,通过解析该文件可以知道该做什么动作.
--Sys.actionNumber统计了action的总数
--Sys.actionTab数组长度为24,表示最多可记录24个action, 其值保存的是当前步骤对应的action序号
--Sys.actionTab中保存了各个动作的序号,例如SystemArg.actionIdTab[1] = 3, 表示第一步就执行序号为3的action, 也意味着序号为1/2的action为空格(没有设置)
--Sys.processFileStr中已经读取了配置文件中的所有数据.(还未经过任何处理)
--Sys.actionStep用于控制当前执行的动作序号.
--***********************************************************************************************
function excute_process()
    --------------------------------------------------------------------------
    --第一步:解析action表中type标签获得动作类型,通过动作类型可以知道该执行什么动作函数, 解析content中的内容,该内容作为动作函数的参数
    if Sys.processStep == 1 then
        local actionId = Sys.actionIdTab[Sys.actionStep];
        Sys.actionString  = GetSubString(Sys.processFileStr, "<action"..actionId..">", "</action"..actionId..">");--截取文件中<action?>标签之间的字符串
        local typeString  = GetSubString(Sys.actionString, "<type>","</type>");--获动作类型与名称
        local tab = split(typeString, ",");--将动作类型与名称放在tab表中
        Sys.actionType    = tab[1];--获取动作类型
        Sys.contentTabStr = GetSubString(Sys.actionString,"<content>","</content>");--再截取<content>标签中的内容
        Sys.contentTab    = split(Sys.contentTabStr, ",");--分割字符串,并将字符串存入tab数组
        --Sys.startTime.year,Sys.startTime.mon,Sys.startTime.day,Sys.startTime.hour,Sys.startTime.min--获取当前时间
        Sys.startTime = Sys.dateTime;
        ShowSysCurrentAction( Sys.processName..":"..Sys.actionNameTab[Sys.actionStep]);--显示流程名称-动作名称
        if Sys.actionType == ActionItem[Sys.language][1] then 
            Sys.actionFunction = excute_init_process;--执行 初始化流程
        elseif Sys.actionType == ActionItem[Sys.language][2] then 
            Sys.actionFunction = excute_inject_process;--执行 注射泵流程
        elseif Sys.actionType == ActionItem[Sys.language][3] then
            Sys.actionFunction = excute_inject_add_process;--执行 注射泵加液流程
        elseif Sys.actionType == ActionItem[Sys.language][4] then 
            Sys.actionFunction = excute_read_signal_process;--执行-读取信号流程
        elseif Sys.actionType == ActionItem[Sys.language][5] then 
            Sys.actionFunction = excute_peristaltic_process--执行-蠕动泵加液流程
        elseif Sys.actionType == ActionItem[Sys.language][6] then 
            Sys.actionFunction = excute_calculate_process;--执行-计算流程
        elseif Sys.actionType == ActionItem[Sys.language][7] then 
            Sys.actionFunction = excute_wait_time_process;--执行-等待时间流程
        elseif Sys.actionType == ActionItem[Sys.language][8] then 
            Sys.actionFunction = excute_dispel_process;--执行-消解流程
        elseif Sys.actionType == ActionItem[Sys.language][9] then 
            Sys.actionFunction = excute_valve_ctrl_process;--执行-阀操作流程
        end
        Sys.driverStep = 1;--孙流程从第一步开始
        Sys.actionSubStep = 1;--子流程从第一步开始执行
        Sys.processStep = Sys.processStep + 1;--跳转到下一步执行子流程
    --------------------------------------------------------------------------------------------------
    --第二步: 执行子流程函数
    elseif Sys.processStep == 2 then
        if Sys.actionFunction(Sys.contentTab) == FINISHED then
            Sys.processStep = Sys.processStep + 1;
        end
    ---------------------------------------------------------------------------------------------------
    --第三步:判断动作是否执行完毕
    elseif Sys.processStep == 3 then
        ----------------所有动作执行完毕-------------------------------------------
        if Sys.actionStep >= Sys.actionTotal then
            Sys.actionStep = 1;                       --指向第一个动作
            Sys.processStep = 1;                      --返回第一步执行动作
            ----------------手动模式--------------------
            if Sys.runType == WorkType[Sys.language].hand then                    
                Sys.handRunTimes = Sys.handRunTimes + 1;  --分析次数+1
                if  Sys.handRunTimes >= HandProcessTab[1].times then--已达到指定的运行次数,系统停止
                    SystemStop();
                end
            ----------------自动模式--------------------
            elseif Sys.runType == WorkType[Sys.language].auto then
                if Sys.isPeriodOrTimed == PERIOD_PROCESS then--如果当前流程为周期流程, 则需要设置下次周期流程的时间.
                    Sys.periodicIndex = Sys.periodicIndex + 1;--指向下一个流程
                    if Sys.periodicIndex > 4 then
                        Sys.periodicIndex = 1;
                    end
                    set_period_start_date_time(PeriodicTab[10].value);--设置下一次周期运行的时间
                end
                WriteProcessFile(2);
                SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态,此时会在系统定时器中不断的判断是否可以进行下一次流程了
            ----------------反控模式--------------------
            elseif Sys.runType == WorkType[Sys.language].controlled then
                SystemStop();
            end
        ----------------动作未执行完,继续下一个动作-------------------------------------------
        else
            Sys.actionStep = Sys.actionStep + 1;--指向下一个动作
            Sys.processStep = 1;                      --返回第一步执行下一个动作
        end
    end
end

--***********************************************************************************************
--  在底部的状态栏显示提示信息
--***********************************************************************************************
function SystemStop()
    SetSysWorkStatus(WorkStatus[Sys.language].stop);--将状态栏显示为停止
    ShowSysCurrentAction(TipsTab[Sys.language].null);--将当前动作显示为"无"
    set_value(RUN_CONTROL_SCREEN, RunStopButtonId, 0.0);--将开始/停止按钮弹出
    if Sys.userName == SysUser[Sys.language].maintainer or  Sys.userName == SysUser[Sys.language].administrator then--运维员/管理员
        set_process_edit_state(ENABLE);--允许编辑流程
    end
    UartArg.lock = UNLOCKED;--解锁串口
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置1
--------------------------------------------------------------------------------------------------------------------]]

--流程设置表中各控件Id,注意selecId与nameId的数学关系:typeId = nameId + 100, typeId = deleteId + 220 等等
ProcessTab = {[1] = {typeId = 300, nameId = 200, rangeId = 312, deleteId = 80},
              [2] = {typeId = 301, nameId = 201, rangeId = 313, deleteId = 81},
              [3] = {typeId = 302, nameId = 202, rangeId = 314, deleteId = 82},
              [4] = {typeId = 303, nameId = 203, rangeId = 315, deleteId = 83},
              [5] = {typeId = 304, nameId = 204, rangeId = 316, deleteId = 84},
              [6] = {typeId = 305, nameId = 205, rangeId = 317, deleteId = 85},
              [7] = {typeId = 306, nameId = 206, rangeId = 318, deleteId = 85},
              [8] = {typeId = 307, nameId = 207, rangeId = 319, deleteId = 87},
              [9] = {typeId = 308, nameId = 208, rangeId = 320, deleteId = 88},
              [10]= {typeId = 309, nameId = 209, rangeId = 321, deleteId = 89},
              [11]= {typeId = 310, nameId = 210, rangeId = 322, deleteId = 90},
              [12]= {typeId = 311, nameId = 211, rangeId = 323, deleteId = 91},
       };


AnalyteSetId = 38;--分析物选择
CodeSetId = 107;--代码
ProcessSaveBtId = 19;--保存按钮,流程设置1/2/3的保存按钮都是这个id
ExportBtId = 41;--导出按钮
InportBtId = 42;--导入按钮
NextSetScreen = 128;--下一个流程设置界面

--***********************************************************************************************
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--***********************************************************************************************
function process_set1_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- 保存
        WriteProcessFile(1);
    ------------------------------------------------------------------------
    elseif control == InportBtId then --导入按钮
        if SdPath  ~= nil then
            ShowSysTips(TipsTab[Sys.language].importing);
            for i = 0,12,1 do--依次导出文件"0"~"12"
                ConfigFileCopy( SdPath.."config/"..i, i);--将Sd卡中的配置文件导入都系统
            end
            ShowSysTips(TipsTab[Sys.language].imported);
            ReadProcessFile();--加载流程设置1界面/运行控制界面/量程设置界面中的参数配置
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab[Sys.language].importing);
            for i = 0,12,1 do--依次导出文件"0"~"12"
                ConfigFileCopy( UsbPath.."config/"..i, i);--将Sd卡中的配置文件导入都系统
            end
            ShowSysTips(TipsTab[Sys.language].imported);
            ReadProcessFile();--加载流程设置1界面/运行控制界面/量程设置界面中的参数配置
        else
            ShowSysTips(TipsTab[Sys.language].insertSdUsb);
        end;
    ------------------------------------------------------------------------
    elseif control == ExportBtId then --导出按钮(将流程配置导出到SD卡中)
        if SdPath  ~= nil then
            ShowSysTips(TipsTab[Sys.language].exporting);
            for i = 0,12,1 do--依次导出文件"0"~"12"
                ConfigFileCopy(i, SdPath.."config/"..i);--将文件导出到config文件中,配置文件名为0~12
            end
            ShowSysTips(TipsTab[Sys.language].exported);
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab[Sys.language].exporting);
            for i = 0,12,1 do--依次导出文件"0"~"12"
                ConfigFileCopy(i, UsbPath.."config/"..i);--将文件导出到config文件中,配置文件名为0~12
            end
            ShowSysTips(TipsTab[Sys.language].exported);
        else
            ShowSysTips(TipsTab[Sys.language].insertSdUsb);
        end;
    ------------------------------------------------------------------------
    elseif control == NextSetScreen then--跳转到流程设置2界面按钮
        if get_text(PROCESS_SET2_SCREEN, ProcesstypeId) == BLANK_SPACE then
            process_select2_set(PROCESS_SET2_SCREEN, ProcesstypeId);
            change_screen(PROCESS_SELECT2_SCREEN);
        end
    ------------------------------------------------------------------------
    elseif control == AnalyteSetId then--
        set_text(MAIN_SCREEN, LastAnalyteId, get_text(PROCESS_SET1_SCREEN, AnalyteSetId));--设置分析物
    ------------------------------------------------------------------------
    elseif (control-100) >= ProcessTab[1].typeId and (control-100) <= ProcessTab[12].typeId then --这里是流程类型下的各个按钮
        process_select_set(screen, control-100);
    ------------------------------------------------------------------------
    elseif (control-100) >= ProcessTab[1].rangeId and (control-100) <= ProcessTab[12].rangeId  then --这里是量程选择下的各个按钮
        range_select_set(screen, control-100);
    ------------------------------------------------------------------------
    elseif control >= ProcessTab[1].deleteId and control <= ProcessTab[12].deleteId then--删除按钮
        if get_text(PROCESS_SET1_SCREEN, control+120) ~= BLANK_SPACE then --名称不为空格
            local file = control - 79;--control取值80-91,减去79后,对应了1-12,此为序号.
            set_text(PROCESS_SET1_SCREEN, control+220,BLANK_SPACE);
			set_text(PROCESS_SET1_SCREEN, control+120,BLANK_SPACE);
            set_text(PROCESS_SET1_SCREEN, control+232,BLANK_SPACE);
            WriteProcessFile(1);--保存流程设置1界面中的参数
            os.remove(file);--删除配置文件
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
ProcesstypeId = 38;      --位于流程设置2/3都是这个id
ProcessSelectTipsTextId = 21;--用于显示提示信息的文本框,流程设置2/3界面中都是这个id

--这里注意观察动作选择id,动作名称id,编辑id之间的数学转换关系:typeId = nameId + 100; nameId = editId + 100
--其中[1]-[12]中包含的id控件在流程设置2界面中,[13]-[24]中包含的id控件在流程设置3界面中
TabAction = {
    [1 ] = {typeId = 301, nameId = 201, insertId = 501 , editId = 101},
    [2 ] = {typeId = 302, nameId = 202, insertId = 502 , editId = 102},
    [3 ] = {typeId = 303, nameId = 203, insertId = 503 , editId = 103},
    [4 ] = {typeId = 304, nameId = 204, insertId = 504 , editId = 104},
    [5 ] = {typeId = 305, nameId = 205, insertId = 505 , editId = 105},
    [6 ] = {typeId = 306, nameId = 206, insertId = 506 , editId = 106},
    [7 ] = {typeId = 307, nameId = 207, insertId = 507 , editId = 107},
    [8 ] = {typeId = 308, nameId = 208, insertId = 508 , editId = 108},
    [9 ] = {typeId = 309, nameId = 209, insertId = 509 , editId = 109},
    [10] = {typeId = 310, nameId = 210, insertId = 510 , editId = 110},
    [11] = {typeId = 311, nameId = 211, insertId = 511 , editId = 111},
    [12] = {typeId = 312, nameId = 212, insertId = 512 , editId = 112},
    [13] = {typeId = 313, nameId = 213, insertId = 513 , editId = 113},
    [14] = {typeId = 314, nameId = 214, insertId = 514 , editId = 114},
    [15] = {typeId = 315, nameId = 215, insertId = 515 , editId = 115},
    [16] = {typeId = 316, nameId = 216, insertId = 516 , editId = 116},
    [17] = {typeId = 317, nameId = 217, insertId = 517 , editId = 117},
    [18] = {typeId = 318, nameId = 218, insertId = 518 , editId = 118},
    [19] = {typeId = 319, nameId = 219, insertId = 519 , editId = 119},
    [20] = {typeId = 320, nameId = 220, insertId = 520 , editId = 120},
    [21] = {typeId = 321, nameId = 221, insertId = 521 , editId = 121},
    [22] = {typeId = 322, nameId = 222, insertId = 522 , editId = 122},
    [23] = {typeId = 323, nameId = 223, insertId = 523 , editId = 123},
    [24] = {typeId = 324, nameId = 224, insertId = 524 , editId = 124},
};

--设置编辑按钮对应的跳转界面
--para:获取对应的动作类型名称
--screen: 当前屏幕的id, 子界面按"确认" ,"返回" 按钮后需要返回的界面
--control:"编辑"按钮的id号
function set_edit_screen(para, screen, control)
    if screen == PROCESS_SET2_SCREEN then
        ReadActionTag(control-100);--在流程设置2界面, 当编辑按钮id号为101时, 当前动作序号为1, 依次类推
        set_screen_actionNumber(screen, control-100);
    elseif screen == PROCESS_SET3_SCREEN then
        ReadActionTag(control-100);
        set_screen_actionNumber(screen, control-100+12);
    end

    if para == ActionItem[Sys.language][1] then --开始界面
        change_screen(PROCESS_INIT_SCREEN);
    elseif para == ActionItem[Sys.language][2] then --取样界面
        change_screen(PROCESS_INJECT_SCREEN);
    elseif para == ActionItem[Sys.language][3] then --注射泵加液体
        change_screen(PROCESS_INJECT_ADD_SCREEN);
    elseif para == ActionItem[Sys.language][4] then --读取信号
        change_screen(PROCESS_READ_SIGNAL_SCREEN);
    elseif para == ActionItem[Sys.language][5] then --蠕动泵加液
        change_screen(PROCESS_PERISTALTIC_SCREEN);
    elseif para == ActionItem[Sys.language][6] then --计算
        change_screen(PROCESS_CALCULATE_SCREEN);
    elseif para == ActionItem[Sys.language][7] then --等待时间
        change_screen(PROCESS_WAIT_TIME_SCREEN);
    elseif para == ActionItem[Sys.language][8] then --消解
        change_screen(PROCESS_DISPEL_SCREEN);
    elseif para == ActionItem[Sys.language][9] then --阀操作
        change_screen(PROCESS_VALVE_CTRL_SCREEN);
    end
end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set2_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- 保存
        if string.len(get_text(PROCESS_SET2_SCREEN, ProcesstypeId)) == 0  then
            set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 1);--显示提示信息
        else
            set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 0);--隐藏提示信息
            --手动保存当前正在编辑的流程
            WriteActionFile(0);
        end
    elseif control == ProcessSelectButtonId then--当点击流程选择按钮时,
        if get_text(PROCESS_SET2_SCREEN, ProcesstypeId) ~= BLANK_SPACE then
            process_select2_set(PROCESS_SET2_SCREEN, ProcesstypeId);--设置流程选择2界面中按确认/返回按钮后,返回流程设置2界面
        else

        end
    elseif control == ProcesstypeId then

    elseif (control-100) >= TabAction[1].typeId and (control-100) <= TabAction[12].typeId then--当点击"动作类型"下面的按钮时
        action_select_set(PROCESS_SET2_SCREEN, control-100, control-400);
    elseif control >= TabAction[1].editId and control <= TabAction[12].editId then--当点击"编辑"按钮时
        if get_text(PROCESS_SET2_SCREEN, control+200) ~= BLANK_SPACE then--如果设置了动作类型(编辑按钮的id+200等于动作名称id)
            set_edit_screen(get_text(PROCESS_SET2_SCREEN, control+200), PROCESS_SET2_SCREEN, control);--control+200表示对应的"动作类型"id
        end
    elseif control >= TabAction[1].insertId and control <= TabAction[12].insertId then--当点击插入按钮时
        local insertActionId = control - 500;
        if get_text(PROCESS_SET2_SCREEN,control-200) ~= BLANK_SPACE then--control-200对应了插入按钮前面的动作类型
            InsertAction(insertActionId);
        end
    end
end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_set3_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- 保存
        if string.len(get_text(PROCESS_SET3_SCREEN, ProcesstypeId)) == 0 then
            set_visiable(PROCESS_SET3_SCREEN, ProcessSelectTipsTextId, 1);--显示提示信息
        else
            set_visiable(PROCESS_SET3_SCREEN, ProcessSelectTipsTextId, 0);--隐藏提示信息
            --手动保存当前正在编辑的流程
            WriteActionFile(0);
        end
    elseif (control-100) >= TabAction[13].typeId and (control-100) <= TabAction[24].typeId then--当点击"动作类型"下面的按钮时
        action_select_set(PROCESS_SET3_SCREEN, control-100, control-400);
    elseif control >= TabAction[13].editId and control <= TabAction[24].editId then--当点击"编辑"按钮时
        if get_text(PROCESS_SET3_SCREEN, control+100) ~= BLANK_SPACE then--如果设置了动作名称(编辑按钮的id+100等于动作名称id)
            set_edit_screen(get_text(PROCESS_SET3_SCREEN, control+200), PROCESS_SET3_SCREEN, control);--control+200表示对应的"动作类型"id
        end
    elseif control >= TabAction[13].insertId and control <= TabAction[24].insertId then--当点击插入按钮时
        local insertActionId = control - 500;
        if get_text(PROCESS_SET3_SCREEN,control-200) ~= BLANK_SPACE then--control-200对应了插入按钮前面的动作类型
            InsertAction(insertActionId);
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
    set_text(PROCESS_SET3_SCREEN, ProcesstypeId, get_text(PROCESS_SET2_SCREEN,ProcesstypeId));
end

--***********************************************************************************************
--当在流程设置2/3界面上点击"插入"按钮时, 且此时当前行的"动作类型"不为空时,会调用该函数
--该函数实现表格的"插入"功能, 实际上就是修改配置文件,然后再读取
--***********************************************************************************************
function InsertAction(actionNumber)
    --将当前行插入的行设置为空格显示
    if actionNumber >= 1 and actionNumber <= 12 then
        for i = 24, 14, -1 do--
            set_text(PROCESS_SET3_SCREEN, TabAction[i].typeId, get_text(PROCESS_SET3_SCREEN, TabAction[i-1].typeId));
            set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId, get_text(PROCESS_SET3_SCREEN, TabAction[i-1].nameId));
        end
        set_text(PROCESS_SET3_SCREEN, TabAction[13].typeId, get_text(PROCESS_SET2_SCREEN, TabAction[12].typeId));
        set_text(PROCESS_SET3_SCREEN, TabAction[13].nameId, get_text(PROCESS_SET2_SCREEN, TabAction[12].nameId));
        for i = 12, actionNumber, -1 do--
            set_text(PROCESS_SET2_SCREEN, TabAction[i].typeId, get_text(PROCESS_SET2_SCREEN, TabAction[i-1].typeId));
            set_text(PROCESS_SET2_SCREEN, TabAction[i].nameId, get_text(PROCESS_SET2_SCREEN, TabAction[i-1].nameId));
        end
        set_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);
        set_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    else
        for i = 24, actionNumber+1, -1 do--
            set_text(PROCESS_SET3_SCREEN, TabAction[i].typeId, get_text(PROCESS_SET3_SCREEN, TabAction[i-1].typeId));
            set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId, get_text(PROCESS_SET3_SCREEN, TabAction[i-1].nameId));
        end
        set_text(PROCESS_SET3_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--当前行显示为空格
        set_text(PROCESS_SET3_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    end

    ChangeActionFileTag(actionNumber, 1);
end

--***********************************************************************************************
--当在流程设置2/3界面上点击"删除"按钮时, 且此时当前行的"动作类型"不为空时,会调用该函数
--该函数实现表格的"删除"功能, 实际上就是修改配置文件,然后再读取
--***********************************************************************************************
function DeleteAction(actionNumber)
    if actionNumber >= 1 and actionNumber <= 12 then
        for i = actionNumber, 12, 1 do--
            set_text(PROCESS_SET2_SCREEN, TabAction[i].typeId, get_text(PROCESS_SET2_SCREEN, TabAction[i+1].typeId));
            set_text(PROCESS_SET2_SCREEN, TabAction[i].nameId, get_text(PROCESS_SET2_SCREEN, TabAction[i+1].nameId));
        end
        set_text(PROCESS_SET2_SCREEN, TabAction[12].typeId, get_text(PROCESS_SET3_SCREEN, TabAction[13].typeId));
        set_text(PROCESS_SET2_SCREEN, TabAction[12].nameId, get_text(PROCESS_SET3_SCREEN, TabAction[13].nameId));
        for i = 13, 23, 1 do
            set_text(PROCESS_SET3_SCREEN, TabAction[i].typeId, get_text(PROCESS_SET3_SCREEN, TabAction[i+1].typeId));
            set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId, get_text(PROCESS_SET3_SCREEN, TabAction[i+1].nameId));
        end
        set_text(PROCESS_SET3_SCREEN, TabAction[24].typeId, BLANK_SPACE);
        set_text(PROCESS_SET3_SCREEN, TabAction[24].nameId, BLANK_SPACE);
    else
        for i = actionNumber, 23, 1 do
            set_text(PROCESS_SET3_SCREEN, TabAction[i].typeId, get_text(PROCESS_SET3_SCREEN, TabAction[i+1].typeId));
            set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId, get_text(PROCESS_SET3_SCREEN, TabAction[i+1].nameId));
        end
        set_text(PROCESS_SET3_SCREEN, TabAction[24].typeId, BLANK_SPACE);
        set_text(PROCESS_SET3_SCREEN, TabAction[24].nameId, BLANK_SPACE);
    end
    ChangeActionFileTag(actionNumber, 2);
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-初始化
--------------------------------------------------------------------------------------------------------------------]]
--在所有子界面中("初始化/注射泵/消解/......"),确认按钮的id都是99,取消按钮的id都是98.
SureButtonId = 99;--确认按钮
CancelButtonId = 98;--取消按钮
DestScreen = nil;
DestControl = nil;
DestActionNum = 0;--指向当前动作序号

AnalysisTypeMenuId = 108;
AnalysisTypeTextId = 22;

INIT_BtStartId = 1;
INIT_BtEndId = 21;
INIT_TextStartId = 22;
INIT_TextEndId = 23;

--该函数在on_control_notify中进行调用（当需要选择流程时）
function set_screen_actionNumber(screen, actionNumber)
    DestScreen = screen;
    DestActionNum = actionNumber;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_init_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  执行初始化流程
--  paraTab:保存了相应界面中的参数设置, 该表中第i个元素,表示初始化界面中编号为i的控件的元素的值,
--          由于这些编号只在这个函数中使用,所以就不再额外定义宏了
--***********************************************************************************************
function excute_init_process(paraTab)
    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--串口锁定或者正在等待超时.
        return;
    end

    --------------------------------------------------------------
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--判断是否需要对十通阀复位
            control_valco( tonumber(paraTab[23]) );--id为23的控件为通道号
            start_wait_time(1);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对阀进行复位(读取参数)
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+5];--将阀状态保存到valveIdTab中,如果值为1.0表示需要复位,如果值为0.0则不需要
            end
            Sys.valveOperate = ValveStatus[Sys.language].close;--阀关闭
            Sys.waitTime = 8;
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 3 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对阀进行复位(执行阀复位函数)
            Sys.driverStep1Func = control_multi_valve;--控制多个阀的打开或者关闭
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        if paraTab[3] == ENABLE_STRING then--判断是否需要对注射泵1进行复位
            start_wait_time(8);
            reset_inject1();
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 5 then
        if paraTab[4] == ENABLE_STRING then--判断是否需要对注射泵2进行复位
            Sys.actionSubStep = Sys.actionSubStep + 1;
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        if paraTab[4] == ENABLE_STRING then--判断是否需要对消解进行复位
            Sys.actionSubStep = Sys.actionSubStep + 1;
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 7 then--结束
        Sys.actionSubStep = FINISHED;
    end
    
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-注射泵
--------------------------------------------------------------------------------------------------------------------]]

INJECT_BtStartId = 1;--注射泵界面中按钮开始id
INJECT_BtEndId = 2; --注射泵界面中按钮结束id

INJECT_TextStartId = 3;--取样界面中文本开始id
INJECT_TextEndId = 10; --取样界面中文本结束id

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_inject_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  执行注射泵流程
--  paraTab:保存了相应界面中的参数设置, 该表中第i个元素,表示初始化界面中编号为i的控件的元素的值,
--          由于这些编号只在这个函数中使用,所以就不再额外定义宏了
--***********************************************************************************************
function excute_inject_process(paraTab)

    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--判断是否需要对注射泵1进行操作
            Sys.injectSpeed = tonumber(paraTab[3]);
            Sys.injectScale = tonumber(paraTab[4]) * 10;
            Sys.waitTime = tonumber(paraTab[6]);
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 2 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对注射泵2进行操作
            Sys.injectSpeed = tonumber(paraTab[7]);
            Sys.injectScale = tonumber(paraTab[8]) * 10;
            Sys.waitTime = tonumber(paraTab[10]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 3 then--结束
        Sys.actionSubStep = FINISHED;
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-注射泵加液
--------------------------------------------------------------------------------------------------------------------]]

INJECT_ADD_BtStartId = 1;
INJECT_ADD_BtEndId = 40;
INJECT_ADD_TextStartId = 41;
INJECT_ADD_TextEndId = 64;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_inject_add_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  执行注射泵加液体流程
--  paraTab:保存了相应界面中的参数设置, 该表中第i个元素,表示初始化界面中编号为i的控件的元素的值,
--          由于这些编号只在这个函数中使用,所以就不再额外定义宏了
--***********************************************************************************************
function excute_inject_add_process(paraTab)

    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--串口锁定或者正在等待超时.
        return;
    end

    -----------------------------------------------------------------
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--判断是否需要对十通阀操作
            control_valco( tonumber(paraTab[62]) );--id为23的控件为通道号
            start_wait_time( tonumber(paraTab[41]) );
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(开阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+8];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = tonumber(paraTab[42]);--等待时间
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 3 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(开阀)操作
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then--判断对注射泵的操作(注射泵1与注射泵2只能选择一个)
        if paraTab[3] == ENABLE_STRING then
            Sys.injectSpeed = tonumber(paraTab[44]);
            Sys.injectScale = tonumber(paraTab[45]) * 10;
            Sys.waitTime = tonumber(paraTab[47]);
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        elseif paraTab[4] == ENABLE_STRING then
            Sys.injectSpeed = tonumber(paraTab[48]);
            Sys.injectScale = tonumber(paraTab[49]) * 10;
            Sys.waitTime = tonumber(paraTab[51]);
            -- Sys.driverStep1Func = ;
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 5 then
        if paraTab[5] == ENABLE_STRING then--判断是否需要对十通阀操作
            control_valco( tonumber(paraTab[63]) );--id为63的控件为通道号
            start_wait_time( tonumber(paraTab[64]) );
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(关阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+8];
            end
            Sys.valveOperate = ValveStatus[Sys.language].close;
            Sys.waitTime = 0
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 7 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(关阀)操作
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 8 then
        if paraTab[6] == ENABLE_STRING then--判断是否需要对输出2进行(开阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+24];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = tonumber(paraTab[52]);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 9 then
        if paraTab[6] == ENABLE_STRING then--判断是否需要对输出2进行(开阀)操作
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 10 then--判断对注射泵的操作(注射泵1与注射泵2只能选择一个)
        if paraTab[7] == ENABLE_STRING then
            Sys.injectId = 1;
            Sys.injectSpeed = tonumber(paraTab[54]);
            Sys.injectScale = tonumber(paraTab[55]) * 10;
            Sys.waitTime = tonumber(paraTab[57]);
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        elseif paraTab[7] == ENABLE_STRING then
            Sys.injectId = 2;
            Sys.injectSpeed = tonumber(paraTab[58]);
            Sys.injectScale = tonumber(paraTab[59]) * 10;
            Sys.waitTime = tonumber(paraTab[61]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 11 then
        if paraTab[6] == ENABLE_STRING then--判断是否需要对输出2进行(关阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+24];
            end
            Sys.valveOperate = ValveStatus[Sys.language].close;
            Sys.waitTime = 0;
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 12 then
        if paraTab[6] == ENABLE_STRING then--判断是否需要对输出2进行(关阀)操作
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 13 then--结束
        Sys.actionSubStep = FINISHED;
    end
    
    return Sys.actionSubStep;
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
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  执行蠕动泵加液体流程
--  paraTab:保存了相应界面中的参数设置, 该表中第i个元素,表示初始化界面中编号为i的控件的元素的值,
--          由于这些编号只在这个函数中使用,所以就不再额外定义宏了
--***********************************************************************************************
function excute_peristaltic_process(paraTab)
    ----------------------------------------------------------------
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--判断是否需要对十通阀操作
            Sys.valcoChannel = tonumber(paraTab[22]);--通道号
            Sys.waitTime = tonumber(paraTab[23]);--等待时间
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    ----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(开阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+5];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = tonumber(paraTab[24]);
        -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    ----------------------------------------------------------------
    elseif Sys.actionSubStep == 3 then
        if paraTab[3] == ENABLE_STRING then--判断对蠕动泵的操作
            Sys.periodicIndex = 1;
            Sys.periodicSpeed = tonumber(paraTab[25]);
            Sys.periodicVolume = tonumber(paraTab[26]);
            Sys.periodicDir = paraTab[27];
            Sys.waitTime = tonumber(paraTab[28]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        elseif paraTab[4] == ENABLE_STRING then
            Sys.periodicIndex = 2;
            Sys.periodicSpeed = tonumber(paraTab[29]);
            Sys.periodicVolume = tonumber(paraTab[30]);
            Sys.periodicDir = paraTab[31];
            Sys.waitTime = tonumber(paraTab[32]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        elseif paraTab[5] == ENABLE_STRING then
            Sys.periodicIndex = 3;
            Sys.periodicSpeed = tonumber(paraTab[33]);
            Sys.periodicVolume = tonumber(paraTab[34]);
            Sys.periodicDir = paraTab[35];
            Sys.waitTime = tonumber(paraTab[36]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    ----------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(关阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+5];
            end
            Sys.valveOperate = ValveStatus[Sys.language].close;
            Sys.waitTime = 0;
        -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    ----------------------------------------------------------------
    elseif Sys.actionSubStep == 5 then--结束
        Sys.actionSubStep = FINISHED;
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-消解
--------------------------------------------------------------------------------------------------------------------]]

DISPEL_BtStartId = 1;
DISPEL_BtEndId = 1;
DISPEL_TextStartId = 2;
DISPEL_TextEndId = 5;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_dispel_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end



--***********************************************************************************************
--  执行消解流程(目前硬件上还没有消解) ##待完善##
--***********************************************************************************************
function excute_dispel_process(paraTab)
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--判断是否需要消解
            Sys.dispelTemp = tonumber(paraTab[24]);
            Sys.dispelTime = tonumber(paraTab[25]);
            Sys.dispelEmptyTemp = tonumber(paraTab[26]);
            Sys.waitTime = tonumber(paraTab[27]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 2 then
        Sys.actionSubStep = FINISHED;--结束
    end
    return Sys.actionSubStep;
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
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end



--***********************************************************************************************
--  执行读取信号流程
--***********************************************************************************************
function excute_read_signal_process(paraTab)
    -----------------------------------------------------------
    if Sys.actionSubStep == 1 then
        Sys.signalDrift = tonumber(paraTab[2]);
        Sys.signalMinTime = tonumber(paraTab[3]);
        Sys.signalMaxTime = tonumber(paraTab[4]);

        start_timer(2, Sys.signalMinTime * 1000, 1, 1); --开启定时器2，超时时间(最小时间), 1->使用倒计时方式,1->表示只执行一次
        getValidSignalData = RESET;
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if Sys.waitTimeFlag == RESET then  --最小定时时间到,跳转下一步读取信号
            start_timer(2, (Sys.signalMaxTime - Sys.signalMinTime) * 1000, 1, 1); --开启定时器2，超时时间(最大时间-最小时间)
            Sys.actionSubStep = Sys.actionSubStep + 1;
            Sys.signalTotal = 0;
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 3 then
        if UartArg.lock == UNLOCKED then--通过串口读取信号
            --发送串口指令
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        if UartArg.lock == UNLOCKED then--解析串口数据, 并判断是否满足信号漂移要求
            local signalE = 0;
            local maxSignal = 0;
            local minSignal = 0;
            
            Sys.signalTab[math.fmod(Sys.signalTotal, 10)] = signalE;--将电压信号保存到数组中
            Sys.signalTotal = Sys.signalTotal + 1;
            if Sys.signalTotal >= 10 then--已经获取到足够的信号(10个)
                maxSignal = math.max(Sys.signalTab[0],Sys.signalTab[1],Sys.signalTab[2],Sys.signalTab[3],Sys.signalTab[4],
                                     Sys.signalTab[5],Sys.signalTab[6],Sys.signalTab[7],Sys.signalTab[8],Sys.signalTab[9]);
                minSignal = math.min(Sys.signalTab[0],Sys.signalTab[1],Sys.signalTab[2],Sys.signalTab[3],Sys.signalTab[4],
                                     Sys.signalTab[5],Sys.signalTab[6],Sys.signalTab[7],Sys.signalTab[8],Sys.signalTab[9]);
                if (maxSignal - minSignal <= Sys.signalDriftthen) or --满足信号漂移条件
                   (Sys.waitTimeFlag == RESET and getValidSignalData == SET) then--最大定时时间到
                    local signalSum = 0;
                    for i = 0, 9, 1 do
                        signalSum = signalSum + Sys.signalTab[i];
                    end
                    signalE = (signalSum - maxSignal - minSignal) / 8;--减去Sys.signalTab中的最大值与最小值后取平均值
                    
                    if paraTab[1] == "E1" then
                        Sys.signalE1 = signalE;
                    else
                        Sys.signalE2 = signalE;
                    end
                    Sys.actionSubStep = Sys.actionSubStep + 1;
                else
                    Sys.actionSubStep = Sys.actionSubStep - 1;--执行上一步,继续通过串口读取电压信号
                end
            end
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 5 then
        Sys.actionSubStep = FINISHED;--结束
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-计算
--------------------------------------------------------------------------------------------------------------------]]

CALCULATE_BtStartId = 1;
CALCULATE_BtEndId = 3;
CALCULATE_TextStartId = 4;
CALCULATE_TextEndId = 10;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_calculate_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  计算校正结果
--***********************************************************************************************
function calc_calibrate_result(type)
    local x,a,b,c,d = 0;
    if type == CalcType[Sys.language].log then
        x = Sys.signalE1 - Sys.signalE2;
    else
        x = math.log10(Sys.signalE1/Sys.signalE2);
    end

end

--***********************************************************************************************
--  计算分析结果
--***********************************************************************************************
function calc_analysis_result(type)
    local x,a,b,c,d = 0;
    if type == CalcType[Sys.language].log then
        x = Sys.signalE1 - Sys.signalE2;
    else
        x = math.log10(Sys.signalE1/Sys.signalE2);
    end

    a = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId));
    b = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId));
    c = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId));
    d = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId));

    Sys.result = a*(x^3) + b*(x^2) + c*x + d;
end

--***********************************************************************************************
--  执行计算流程
--***********************************************************************************************
function excute_calculate_process(paraTab)
    Sys.calculateType = paraTab[10];
    if Sys.processType == ProcessItem[Sys.language][2] then--当前流程类型为校正
        calc_calibrate_result(Sys.calculateType);
    else
        calc_analysis_result(Sys.calculateType);
        if paraTab[1] == ENABLE_STRING then--结果调整
            Sys.result = tonumber(paraTab[4]) * Sys.result + tonumber(paraTab[5]);
        end
    end

    Sys.resultTime = Sys.dateTime;--获取当前时间

    return FINISHED;
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-阀操作
--------------------------------------------------------------------------------------------------------------------]]

VALVE_BtStartId = 1;
VALVE_BtEndId = 18;
VALVE_TextStartId = 19;
VALVE_TextEndId = 22;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_valve_ctrl_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  执行阀操作流程
--***********************************************************************************************
function excute_valve_ctrl_process(paraTab)
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--判断是否需要对十通阀操作
            Sys.valcoChannel = tonumber(paraTab[19]);--通道号
            Sys.waitTime = tonumber(paraTab[20]);--等待时间
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 2 then--判断是否需要对输出进行操作
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(开阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+2];
            end
            Sys.valveOperate = paraTab[22];
            Sys.waitTime = tonumber(paraTab[21]);--等待时间
        -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 3 then--结束
        Sys.actionSubStep = FINISHED;
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-等待时间
--------------------------------------------------------------------------------------------------------------------]]

WAITTIME_TextId = 1;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_wait_time_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  执行等待时间流程
--***********************************************************************************************
function excute_wait_time_process(paraTab)
    if Sys.actionSubStep == 1 then
        Sys.waitTimeFlag = SET;
        start_timer(2, tonumber(paraTab[1]) * 1000, 1, 1); --开启定时器1，超时时间, 1->使用倒计时方式,1->表示只执行一次
    elseif Sys.actionSubStep == 2 then
        if Sys.waitTimeFlag == RESET then
            Sys.actionSubStep = FINISHED
        end
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程选择
--------------------------------------------------------------------------------------------------------------------]]

AnalysisButtonId = 1;--分析按钮
NullButtonId = 8;--空按钮

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
			set_text(DestScreen, DestControl, ProcessItem[Sys.language][ProcessSelectItem]);--DestControl对应流程选择
			if DestScreen == PROCESS_SET1_SCREEN  then
                set_text(DestScreen, DestControl-100, ProcessItem[Sys.language][ProcessSelectItem]);--DestControl-100对应流程名称
            end
        end
        WriteProcessFile(1);--保存流程设置1界面中的参数
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
                ReadActionTag(0);
            elseif DestScreen == RUN_CONTROL_SCREEN then --如果是回到运行控制界面,则保存文件名为0"的配置文件
                process_change(DestControl);--流程改变后,通过调用该函数修改流程对应的id号
                WriteProcessFile(2);--2对应<RunCtrl>标签
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
    --如果是运行控制界面,除了需要判断是否设置了流程名称, 还需要判断该流程是否有对应的配置文件
    NumberOfProcess = 0;

    local processFile = nil;
    for i = 1, 12, 1 do
        if DestScreen == RUN_CONTROL_SCREEN then--当为运行控制界面时,需要判断是否有对应的流程配置文件
            processFile = io.open(i, "r");
        else
            processFile = 1;
        end
        if get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId) ~= BLANK_SPACE--获取名称长度,当名称长度不为0时表示有效
           and  processFile ~= nil then--该流程含有配置文件
            if DestScreen == RUN_CONTROL_SCREEN then
                processFile:close();
            end
            NumberOfProcess = NumberOfProcess + 1;--个数+1
            set_visiable(PROCESS_SELECT2_SCREEN, NumberOfProcess,  1);--显示id为NumberOfProcess的文本
            set_text(PROCESS_SELECT2_SCREEN, NumberOfProcess, get_text(PROCESS_SET1_SCREEN,ProcessTab[i].nameId))--为该文本框设置内容
            set_visiable(PROCESS_SELECT2_SCREEN,100+NumberOfProcess,1);--显示与该文本框对应的按钮
        end
    end

    if NumberOfProcess ~= 0 and DestScreen == RUN_CONTROL_SCREEN then
        -- 设置一个为"无"的选项
        NumberOfProcess = NumberOfProcess + 1;
        set_visiable(PROCESS_SELECT2_SCREEN, NumberOfProcess,  1);--显示id为NumberOfProcess的文本
        set_text(PROCESS_SELECT2_SCREEN, NumberOfProcess, BLANK_SPACE)--为该文本框设置内容
        set_visiable(PROCESS_SELECT2_SCREEN,100 + NumberOfProcess,1);--显示与该文本框对应的按钮
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
ActionSelectItem = nil;


--该函数在on_control_notify中进行调用（当需要选择流程时）
function action_select_set(screen,control,actionNumber)
	DestScreen = screen;
    DestControl = control;
    DestActionNum = actionNumber;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function action_select_control_notify(screen,control,value)
    if control >= ActionStartButtonId and control <= ActionEndButtonId then --动作类型选择按钮
        ActionSelectItem = control;
    elseif control == SureButtonId then --确认按钮
        change_screen(DestScreen);
        if ActionSelectItem ~= nil then
            set_text(DestScreen, DestControl, ActionItem[Sys.language][ActionSelectItem]);--动作选择
            set_text(DestScreen, DestControl-100, ActionItem[Sys.language][ActionSelectItem]);--DestControl-100对应动作名称
        end
        WriteDefaultActionTag(DestActionNum);
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    量程设置
--------------------------------------------------------------------------------------------------------------------]]

--在量程设置/量程选择界面中,量程1/2/3文本的id都是一样的

RANGESET_TextStartId = 1;
RANGESET_TextEndId = 25;

UniteSetTextId = 25--单位设置成功后,用于显示单位文本的id
UniteSetMenuId = 26;--单位选择

RangeTab = {
    [1] = {LowId = 1, HighId = 2,  densityCalLowId = 3,  densityCalHighId = 4,  aId = 5,  bId = 6,  cId = 7,  dId = 8},
    [2] = {LowId = 9, HighId = 10, densityCalLowId = 11, densityCalHighId = 12, aId = 13, bId = 14, cId = 15, dId = 16},
    [3] = {LowId = 17,HighId= 18,  densityCalLowId = 19, densityCalHighId = 20, aId = 21, bId = 22, cId = 23, dId = 24},
};

--设置单位
function set_unit()
    local Unite = get_text(RANGE_SET_SCREEN, UniteSetTextId);
    --量程设置界面中,控件Id = 300 ~ 308为单位显示文本
    for i = 300,308,1 do 
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
    elseif control == 50 then --保存按钮
        WriteProcessFile(3);
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
    set_text(RANGE_SELECT_SCREEN, 4,  get_text(RANGE_SET_SCREEN,RangeTab[1].LowId));
    set_text(RANGE_SELECT_SCREEN, 5, get_text(RANGE_SET_SCREEN,RangeTab[1].HighId));
    set_text(RANGE_SELECT_SCREEN, 6,  get_text(RANGE_SET_SCREEN,RangeTab[2].LowId));
    set_text(RANGE_SELECT_SCREEN, 7, get_text(RANGE_SET_SCREEN,RangeTab[2].HighId));
    set_text(RANGE_SELECT_SCREEN, 8,  get_text(RANGE_SET_SCREEN,RangeTab[3].LowId));
    set_text(RANGE_SELECT_SCREEN, 9, get_text(RANGE_SET_SCREEN,RangeTab[3].HighId));
end


--[[-----------------------------------------------------------------------------------------------------------------
    手动操作1
--------------------------------------------------------------------------------------------------------------------]]
HandValve11BtId = 43;
HandValve12BtId = 44;
HandCloseAllValveId = 47;
HandValcoChnlId = 130;
HandValcoCtrlId = 131;
HandInject1ScaleId = 99;
HandInject1SpdId = 103;
HandInject1SendId = 101;
HandInject1WaitTimeId = 3;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function hand_operate1_control_notify(screen, control, value)
    if control == HandValve11BtId then--控制阀11
        if get_value(HAND_OPERATE1_SCREEN, control) == ENABLE then
            open_single_valve(11);
        else
            close_single_valve(11);
        end
    elseif control == HandValve12BtId then--控制阀12
        if get_value(HAND_OPERATE1_SCREEN, control) == ENABLE then
            open_single_valve(12);
        else
            close_single_valve(12);
        end
    elseif control == HandCloseAllValveId then--关闭所有阀

    elseif control == HandValcoCtrlId then--控制十通阀
        control_valco( tonumber( get_text(screen, HandValcoChnlId) ) );
    elseif control == HandInject1SendId then--控制注射泵
        Sys.hand_control_func = hand_control_inject1;
    end
end

--***********************************************************************************************
--手动操作-控制注射泵1
--sta: 0-复位; 1-移动到指定位置
--***********************************************************************************************
function hand_control_inject1(sta)
    if UartArg.lock == LOCKED then
        return;
    end
    
    if Sys.processStep == 1 then--第一步: 使能注射泵
        enable_inject1();
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 2 then --第二步:设置注射泵速度
        set_inject1_speed( tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1SpdId)) );
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then --第三步:移动注射泵到指定位置
        Sys.waitTimeFlag = SET;
        Sys.waitTime = tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1WaitTimeId));
        start_timer(2, Sys.waitTime * 1000, 1, 1); --开启定时器2，超时时间8s,1->表示只执行一次
        if sta == 0 then
            move_inject1_to( 0 );
        else
            move_inject1_to( tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1ScaleId)) * 10 );
        end
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 4 and Sys.waitTimeFlag == RESET then --第四步:初始化结束
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end

end


--[[-----------------------------------------------------------------------------------------------------------------
    手动操作2
--------------------------------------------------------------------------------------------------------------------]]
HandGetVoltageId = 73;
HandShowVoltageId = 35;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function hand_operate2_control_notify(screen,control,value)
    if control == HandGetVoltageId then
        Sys.hand_control_func = hand_get_voltage;
    end
end

--***********************************************************************************************
--手动操作-获取偏置电压
--sta: 0-复位; 1-移动到指定位置
--***********************************************************************************************
function hand_get_voltage()
    if UartArg.lock == LOCKED then
        return;
    end
    
    if Sys.processStep == 1 then--第一步: 发送串口指令获取电压
        on_uart_send_data(uartSendTab.getVoltage, NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 2 then--第二步: 解析电压值并进行显示
        local vol = (UartArg.recv_data[3] * 256 + UartArg.recv_data[4]) / 10;
        set_text(HAND_OPERATE2_SCREEN, HandShowVoltageId, vol);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then--第三步:结束
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    手动操作3
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    手动操作4
--------------------------------------------------------------------------------------------------------------------]]
--虽然命名为手动操作4, 其实是通讯记录界面

UartRecordId = 1--串口通讯记录空间id




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
maintainerPwdSetId = 14;
administratorPwdSetId = 15;
EquipmentTypeSetId = 1;
EquipmentTypeTextId = 900;--每个界面中的仪器型号id都是900
OperatorLoginId = 16;
maintainerLoginId = 17;
administratorLoginId = 18;
pwdRecordId = 13;--用于保存密码的记录控件

ftpAddr1Id = 22;
ftpAddr2Id = 23;
ftpAddr3Id = 24;
ftpAddr4Id = 25;
ftpStartBtId = 26;
--设置仪器型号
function set_equipment_type()
    for i = 1,16,1 do
        set_text(PublicTab[i], EquipmentTypeTextId, get_text(SYSTEM_INFO_SCREEN,EquipmentTypeSetId));
    end
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function system_info_control_notify(screen,control,value)
    if control == EquipmentTypeSetId then--设置仪器型号
        set_equipment_type();
    elseif control == maintainerPwdSetId then--运维员密码设置
        set_user_name(SysUser[Sys.language].maintainer);
    elseif control == administratorPwdSetId then--管理员密码设置
        set_user_name(SysUser[Sys.language].administrator);
    elseif control == OperatorLoginId then --操作员登录
        set_user_name(SysUser[Sys.language].operator);
    elseif control == maintainerLoginId then--运维员登录
        set_user_name(SysUser[Sys.language].maintainer);
        change_screen(LOGIN_SYSTEM_SCREEN);
    elseif control == administratorLoginId then--管理员登录
        set_user_name(SysUser[Sys.language].administrator);
        change_screen(LOGIN_SYSTEM_SCREEN);
    elseif control == ftpStartBtId then--ftp远程升级
    end
end

--***********************************************************************************************
--  设置系统用户
--***********************************************************************************************
function SetSysUser(user)
    
    Sys.userName = user;

    --在底部的状态用户名
    for i = 1,16,1 do
        set_text(PublicTab[i], SysUserNameId, Sys.userName);
    end

    if Sys.userName == SysUser[Sys.language].operator then -- 操作员
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, DISABLE);
        set_process_edit_state(DISABLE);--禁止流程设置
    elseif Sys.userName == SysUser[Sys.language].maintainer then--运维员
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, DISABLE);
        set_process_edit_state(ENABLE);--允许编辑流程
    elseif Sys.userName == SysUser[Sys.language].administrator then--管理员
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, ENABLE);
        set_process_edit_state(ENABLE);--允许编辑流程
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    密码设置
--------------------------------------------------------------------------------------------------------------------]]

UserNameId = 1; --在密码设置与系统登录界面都是该id
OldPwdId = 2;
NewPwdId = 3;
NewPwdConfirmId = 4;
OldPwdTipsId = 5;
NewPwdConfirmTipsId = 6;
NewPwdLenTipsId = 7;
PwdRecordPosition = 0;--该变量取值0或者1; 0表示运维密码在历史界面中的位置,1表示管理员密码在记录空间中的位置
--***********************************************************************************************
--在系统信息界面,点击权限登录或者设置密码时都会调用该函数(权限登录->操作员例外)
--***********************************************************************************************
function set_user_name(user)
    userNameSet = user; --userNameSet: 在界面切换至系统登录界面或者密码设置界面时,该变量保存了需要操作的用户名.
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function password_set_control_notify(screen,control,value)

    local oldPwdInput = get_text(PASSWORD_SET_SCREEN, PwdId);--获取密码

    ------------------------确认按钮-----------------------------------------------------
    if control == SureButtonId then
        if oldPwdInput == record_read(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition) and --旧密码输入正确
           get_text(PASSWORD_SET_SCREEN, NewPwdId) == get_text(PASSWORD_SET_SCREEN, NewPwdConfirmId) and--新密码两次输入一致
           string.len(get_text(PASSWORD_SET_SCREEN, NewPwdId)) == 6 then
            password = get_text(PASSWORD_SET_SCREEN, NewPwdId);
            record_modify(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition, password);--修改记录
            change_screen(SYSTEM_INFO_SCREEN);
        elseif oldPwdInput ~= record_read(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition) then--显示"密码错误"
            set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 1);
        elseif string.len(get_text(PASSWORD_SET_SCREEN, NewPwdId)) ~= 6 then--显示"密码需为6位数字"
            set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 1);
            set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 0);
        elseif get_text(PASSWORD_SET_SCREEN, NewPwdId) ~= get_text(PASSWORD_SET_SCREEN, NewPwdConfirmId) then--显示"两次输入的密码不一致"
            set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 1);
            set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 0);
        end
    ------------------------取消按钮-----------------------------------------------------
    elseif control == CancelButtonId then
        change_screen(SYSTEM_INFO_SCREEN);
    ------------------------旧密码输入完成-------------------------------------------------
    elseif control == OldPwdId then
        if oldPwdInput ~= record_read(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition) then--密码输入不正确
            set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 1);--显示密码错误提示信息
        else
            set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 0);
        end
    elseif control == NewPwdId then --输入新密码
        if string.len(get_text(PASSWORD_SET_SCREEN,NewPwdId)) ~= 6 then
            set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 1);--显示"密码需为6位数字"
            set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 0);
        else
            set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 0);
        end
    elseif control == NewPwdConfirmId then--确认新密码
        if get_text(PASSWORD_SET_SCREEN, NewPwdId) ~= get_text(PASSWORD_SET_SCREEN, NewPwdConfirmId) then
            set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 1);--显示"两次输入的密码不一致"
            set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 0);
        else
            set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 0);
        end
    end
end


--当画面切换时，执行此回调函数，screen为目标画面。
function goto_PasswordSet()
    set_text(PASSWORD_SET_SCREEN, UserNameId, userNameSet);
    set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 0);--隐藏"密码错误"
    set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 0);--隐藏"两次输入的密码不一致"
    set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 0);--隐藏"密码需为6位数字"
    set_text(PASSWORD_SET_SCREEN, OldPwdId, "");
    set_text(PASSWORD_SET_SCREEN, NewPwdId, "");
    set_text(PASSWORD_SET_SCREEN, NewPwdConfirmId, "");
    if userNameSet == SysUser[Sys.language].maintainer then
        PwdRecordPosition = 0;
    elseif userNameSet == SysUser[Sys.language].administrator then
        PwdRecordPosition = 1;
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    登录系统
--------------------------------------------------------------------------------------------------------------------]]
PwdId = 2;
PwdTipsId = 3;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function login_system_control_notify(screen,control,value)
    local pwdInput = get_text(LOGIN_SYSTEM_SCREEN, PwdId);--获取密码

    if control == SureButtonId then--确认按键
        if pwdInput == record_read(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition) then--运维员密码输入正确
            SetSysUser(userNameSet);
            change_screen(SYSTEM_INFO_SCREEN);
        else
            set_visiable(LOGIN_SYSTEM_SCREEN, PwdTipsId, 1);--显示密码错误提示信息
        end
    elseif control == CancelButtonId then--取消按键
        SetSysUser(Sys.userName);
        change_screen(SYSTEM_INFO_SCREEN);
    elseif control == PwdId then --密码输入
        if pwdInput ~= record_read(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition) then--密码输入不正确
            set_visiable(LOGIN_SYSTEM_SCREEN, PwdTipsId, 1);--显示密码错误提示信息
        else
            set_visiable(LOGIN_SYSTEM_SCREEN, PwdTipsId, 0);
        end
    end
end

--当画面切换时，执行此回调函数，screen为目标画面。
function goto_LoginSystem()
    set_text(LOGIN_SYSTEM_SCREEN, UserNameId, userNameSet);
    set_visiable(LOGIN_SYSTEM_SCREEN, PwdTipsId, 0);--隐藏密码错误提示信息
    set_text(LOGIN_SYSTEM_SCREEN, PwdId, "");

    if userNameSet == SysUser[Sys.language].maintainer then
        PwdRecordPosition = 0;
    elseif userNameSet == SysUser[Sys.language].administrator then
        PwdRecordPosition = 1;
    end
end



--[[-----------------------------------------------------------------------------------------------------------------
    配置文件操作相关函数
--------------------------------------------------------------------------------------------------------------------]]

cfgFileTab = {
    [1] = {sTag = "<ProcessSet>",eTag = "</ProcessSet>"};--流程设置1界面中的参数保存在这个tag中
    [2] = {sTag = "<RunControl>",eTag = "</RunControl>"};--运行控制界面中的参数保存在这个tag中
    [3] = {sTag = "<RangeSet>",eTag = "</RangeSet>"};--量程设置界面中的参数保存在这个tag中
};
--***********************************************************************************************
--创建配置文件,并保存在"0"文件中
--tagNum = 1 : 修改流程设置1界面中的参数 
--tagNum = 2 : 修改运行控制界面中的参数
--tagNum = 2 : 运行控制界面中的参数
--***********************************************************************************************
function WriteProcessFile(tagNum)

    local configFile = io.open("0", "a+");        --以可读可写方式打开文本,如文件不存在则创建文件.
    configFile:seek("set");                       --把文件位置定位到开头
    local fileString = configFile:read("a");      --从当前位置读取整个文件，并赋值到字符串中
    configFile:close();                           --关闭文件

    configFile = io.open("0", "w+");              --打开并清空该文件
    fileString = DeleteSubString(fileString, cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);--删除指定的标签内容
    configFile:write(fileString);                 --将处理过的原文件内容重新写入文件
    configFile:write(cfgFileTab[tagNum].sTag);

    if tagNum == 1 then--流程设置1界面中的参数
        for i=1,12,1 do
            configFile:write(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId)..",".. --流程类型选择
                             get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId)..","..   --流程名称
                             get_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId)..",");  --流程量程
        end
    elseif tagNum == 2 then--运行控制界面中的参数
        for i = RUNCTRL_TextStartId, RUNCTRL_TextEndId,1 do
            configFile:write(get_text(RUN_CONTROL_SCREEN,i)..",");
        end
    elseif tagNum == 3 then--量程设置界面中的参数
        for i = RANGESET_TextStartId, RANGESET_TextEndId, 1 do
            configFile:write(get_text(RANGE_SET_SCREEN, i)..",");
        end
    end
    configFile:write(cfgFileTab[tagNum].eTag);
    configFile:close(); --关闭文本
end

--***********************************************************************************************
--读取配置文件中的所有数据
--***********************************************************************************************
function ReadProcessFile()
    ReadProcessTag(1);
    ReadProcessTag(2);
    ReadProcessTag(3);
end

--***********************************************************************************************
--读取配置文件中的数据
--tagNum = 1 : 读取流程设置1界面中的参数 
--tagNum = 2 : 读取运行控制界面中的参数
--tagNum = 3 : 读取量程设置界面中的参数
--***********************************************************************************************
function ReadProcessTag(tagNum)
	local configFile = io.open("0", "r")      --打开文本
    if configFile == nil then--如果没有该文件则返回
        --创建一个默认配置文件
        WriteProcessFile(1);
        WriteProcessFile(2);
        WriteProcessFile(3);
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
    if tagNum == 1 then--流程设置界面中的参数
        for i=1,12,1 do
            set_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId, tab[(i-1)*3+1]);  --把数据显示到文本框中
            set_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId,   tab[(i-1)*3+2]);  --把数据显示到文本框中
            set_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId,  tab[(i-1)*3+3]);  --把数据显示到文本框中
        end

    elseif tagNum == 2 then--运行控制界面中的参数
        
        --将文件中的参数在界面上进行解析
        for i = RUNCTRL_TextStartId, RUNCTRL_TextEndId,1 do
            set_text(RUN_CONTROL_SCREEN, i, tab[i]);
        end
        --将文件中的参数赋值给相应的变量
        Sys.runType = tab[RunTypeID];
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
            TimedProcessTab[i].startHour = tonumber(get_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].startHourId));
            TimedProcessTab[i].startMinute = tonumber(get_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].startMinuteId));
        end
    elseif tagNum == 3 then--量程设置界面中的参数
        for i = RANGESET_TextStartId, RANGESET_TextEndId, 1 do
            set_text(RANGE_SET_SCREEN, i, tab[i]);
        end
    end
end

--***********************************************************************************************
--该函数检测配置文件中是否有<action?>标签, ? 范围1~12. 如果没有该标签,则创建一个默认的配置,如果有则直接返回
--actionNumber:动作标签,范围:action1~action24
--***********************************************************************************************
function WriteDefaultActionTag(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcesstypeId);--获取流程名称
    local fileName = 0;

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            fileName = i;
            break;
        end
    end
    WriteActionTag(fileName, 0);--修改<action0>标签中的内容, 增加或者删除一个动作
    
    local processFile = io.open(fileName, "a+");   --以可读可写的方式打开文本,如果没有该文件则创建
    processFile:seek("set");                       --把文件位置定位到开头
    local fileString = processFile:read("a");      --从当前位置读取整个文件，并赋值到字符串中
    processFile:close();                           --关闭文件

    --如果该配置文件已经有<action?>标签,则直接返回
    if string.find( fileString, "<action"..actionNumber..">", 1) ~= nil then
        return;
    end

    --如果该配置文件已经没有<action?>标签,则继续执行,创建一个默认的标签
    WriteActionTag(fileName, actionNumber);
end

--***********************************************************************************************
--将动作写入配置文件中,该文件在WriteProcessFile中调用
--fileName:配置文件名称:范围:1-12,对应12个流程(每个流程对应一个配置文件)
--actionNumber:动作标签,范围:action0~action24
--***********************************************************************************************
function WriteActionTag(fileName, actionNumber)
    local actionFile = io.open(fileName, "a+");   --以可读可写的方式打开文本,如果没有该文件则创建
    actionFile:seek("set");                       --把文件位置定位到开头
    local fileString = actionFile:read("a");      --从当前位置读取整个文件，并赋值到字符串中
    actionFile:close();                           --关闭文件

    actionFile = io.open(fileName, "w+");         --打开并清空该文件
    fileString = DeleteSubString(fileString, "<action"..actionNumber..">", "</action"..actionNumber..">");--将原来的<action?>-</action?>标签之间的字符串删除
    actionFile:write(fileString);                 --将处理过的原文件内容重写写入文件

    local actionType, actionName
    if actionNumber == 0 then
        actionType = get_text(PROCESS_SET1_SCREEN, ProcessTab[fileName].typeId);--当前流程名称
        actionName = get_text(PROCESS_SET1_SCREEN, ProcessTab[fileName].nameId);--当前流程名称
    elseif actionNumber >= 1 and actionNumber <= 12 then
        actionType = get_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].typeId);--获取当前动作类型
        actionName = get_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].nameId);--获取当前动作名称
    elseif actionNumber >= 13 and actionNumber <= 24 then 
        actionType = get_text(PROCESS_SET3_SCREEN, TabAction[actionNumber].typeId);--获取当前动作类型
        actionName = get_text(PROCESS_SET3_SCREEN, TabAction[actionNumber].nameId);--获取当前动作名称
    end

    actionFile:write("<action"..actionNumber..">");--写入开始标签
    actionFile:write("<type>"..actionType..","..actionName.."</type>");--写入动作类型与动作名称(或流程类型与名称):初始化/注射泵/消解......
    actionFile:write("<content>");
    --------------------------------写<action0>标签内容---------------------------------------------
    --<action0>标签保存的都是该流程中,对应的流程设置2/3界面中的动作选择/动作名称
    if actionNumber == 0 then
        for i=1,12,1 do
            actionFile:write(get_text(PROCESS_SET2_SCREEN, TabAction[i].typeId)..",".. --动作类型选择
                              get_text(PROCESS_SET2_SCREEN, TabAction[i].nameId  )..","); --动作名称
        end
        for i=13,24,1 do
            actionFile:write(get_text(PROCESS_SET3_SCREEN, TabAction[i].typeId)..",".. --动作类型选择
                              get_text(PROCESS_SET3_SCREEN, TabAction[i].nameId  )..","); --动作名称
        end
    --------------------------------写开始界面参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][1] then 
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_INIT_SCREEN, i)..",");--写入按钮值
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_INIT_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写取样界面参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][2] then 
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_INJECT_SCREEN, i)..",");--写入输出1按钮值
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_INJECT_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写注射泵加液参数--------------------------------------------------
    elseif actionType == ActionItem[Sys.language][3] then
        for i = INJECT_ADD_BtStartId, INJECT_ADD_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_INJECT_ADD_SCREEN, i)..",");--写入按钮值
        end
        for i = INJECT_ADD_TextStartId, INJECT_ADD_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_INJECT_ADD_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-读取信号参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][4] then 
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_READ_SIGNAL_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-蠕动泵加液参数--------------------------------------------------
    elseif actionType == ActionItem[Sys.language][5] then 
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_PERISTALTIC_SCREEN, i)..",");--写入按钮值
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_PERISTALTIC_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-计算参数--------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][6] then 
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_CALCULATE_SCREEN, i)..",");--写入按钮值
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_CALCULATE_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-等待时间参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][7] then 
        actionFile:write(get_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId));
    --------------------------------写-消解参数--------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][8] then 
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_DISPEL_SCREEN, i)..",");--写入按钮值
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_DISPEL_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-阀操作参数------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][9] then 
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_VALVE_CTRL_SCREEN, i)..",");--写入按钮值
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_VALVE_CTRL_SCREEN, i)..",");--写入文本值
        end
    --------------------------------写-空操作参数------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][10] then 
        actionFile:write("<content> </content>");
    end
    actionFile:write("</content>");
    actionFile:write("</action"..actionNumber..">");--写入结束标签
    actionFile:close(); --关闭文本
end

--***********************************************************************************************
--保存单个流程配置文件,每个流程都有一个对应的配置文件,文件名为该流程在表格中的序号
--actionNumber:动作标签,范围:action1~action24
--***********************************************************************************************
function WriteActionFile(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcesstypeId);--获取流程名称

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            WriteActionTag(i, 0);--修改<action0>标签中的内容
            WriteActionTag(i, actionNumber);--保存数据到文件中,文件名为1~12, 保存的内容为action0~action12标签
        end
    end
end

--***********************************************************************************************
--actionNumber: 动作id , 从该动作开始,之后的动作都进行+1或者-1的操作
--flag 1=加操作, 2=减操作
--***********************************************************************************************
function ChangeActionFileTag(actionNumber, flag)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcesstypeId);--获取流程名称
    local fileName;
    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            WriteActionTag(i, 0);--调整流程设置2/3界面的显示后,再修改<action0>标签中的内容
            fileName = i;
        end
    end

    local actionFile = io.open(fileName, "a+");   --以可读可写的方式打开文本,如果没有该文件则创建
    actionFile:seek("set");                       --把文件位置定位到开头
    local fileString = actionFile:read("a");      --从当前位置读取整个文件，并赋值到字符串中
    actionFile:close();                           --关闭文件

    --字符替换
    if flag == 1 then
        for i = 23, actionNumber, -1 do
            fileString = string.gsub(fileString, "action"..i, "action"..(i+1));
        end
    else
        for i = actionNumber+1, 24, 1 do
            fileString = string.gsub(fileString, "action"..i, "action"..(i+1));
        end
    end

    actionFile = io.open(fileName, "w+");         --打开并清空该文件
    actionFile:write(fileString);                 --将处理过的原文件内容重写写入文件
    actionFile:close();                           --关闭文件
end

--***********************************************************************************************
--读配置文件函数,这里每次只读取一个标签里的值, 例如<action1>标签之间的值
--actionNumber:当前动作为第几步
--***********************************************************************************************
function ReadActionTag(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcesstypeId);--获取流程名称
    local fileName = 0;
    for i=1,12,1 do--循环查找当前流程名称对应的序号.
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            fileName = i;
            break;
        end
    end
    
    local processFile = io.open(fileName, "r");      --打开文本
    if processFile == nil then--还没有该文件,则创建一个新的配置文件,并返回
        --将流程设置2/3界面清空
        for i = TabAction[1].typeId,TabAction[12].typeId,1 do
            set_text(PROCESS_SET2_SCREEN, i,BLANK_SPACE);    --将对应动作选择的文本清空
            set_text(PROCESS_SET2_SCREEN, i-100,BLANK_SPACE);--将对应动作名称的文本清空
            set_text(PROCESS_SET3_SCREEN, i,BLANK_SPACE);    --将对应动作选择的文本清空
            set_text(PROCESS_SET3_SCREEN, i-100,BLANK_SPACE);--将对应动作名称的文本清空
        end
        WriteActionFile(0);
        return
    end

	processFile:seek("set");                        --把文件位置定位到开头
	fileString = processFile:read("a");             --从当前位置读取整个文件，并赋值到字符串中
    processFile:close();                            --关闭文本

    actionString = GetSubString(fileString, "<action"..actionNumber..">", "</action"..actionNumber..">");--截取fileString文件中<action?> ~ </action?>标签之间的字符串
    if actionString == nil then--如果文件中没有该标签,则返回.
        return 
    end
    
    local actionType = GetSubString(actionString, "<type>","</type>");--截取actionString字符串中<type>标签之间的字符串,获取动作类型与动作名称
    actionType = split(actionType, ",");--分割字符串
    local contentTabStr = GetSubString(actionString,"<content>","</content>");--再截取<content>标签中的内容
    if contentTabStr == nil then--如果没有内容,则清空流程设置2/3界面中的动作选择与动作名称
        return;
    end
    local tab = split(contentTabStr, ",");--分割字符串
    if actionNumber == 0 then --判定为<action0>标签
        for i=1,12,1 do
            set_text(PROCESS_SET2_SCREEN, TabAction[i].typeId, tab[(i-1)*2+1]);  --把数据显示到文本框中
            set_text(PROCESS_SET2_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]); --把数据显示到文本框中
        end
        for i=13,24,1 do
           set_text(PROCESS_SET3_SCREEN, TabAction[i].typeId, tab[(i-1)*2+1]);  --把数据显示到文本框中
           set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]); --把数据显示到文本框中
        end
    --------------------------------读-初始化界面参数--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][1] then
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            set_value(PROCESS_INIT_SCREEN, i, tab[i]);--写入按钮值
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            set_text(PROCESS_INIT_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-折射泵界面参数--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][2] then 
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do 
            set_value(PROCESS_INJECT_SCREEN, i, tab[i]);--tab中前17个位按钮值
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do 
            set_text(PROCESS_INJECT_SCREEN, i, tab[i]);--tab中前17个位按钮值
        end
    --------------------------------读-注射泵加液参数-------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][3] then
        for i = INJECT_ADD_BtStartId, INJECT_ADD_BtEndId, 1 do
            set_value(PROCESS_INJECT_ADD_SCREEN, i, tab[i]);--写入按钮值
        end
        for i = INJECT_ADD_TextStartId, INJECT_ADD_TextEndId, 1 do
            set_text(PROCESS_INJECT_ADD_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-读取信号参数--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][4] then
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            set_text(PROCESS_READ_SIGNAL_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-蠕动泵加液参数------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][5] then 
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            set_value(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--写入按钮值
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            set_text(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-计算参数------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][6] then 
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            set_value(PROCESS_CALCULATE_SCREEN, i, tab[i]);--写入按钮值
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            set_text(PROCESS_CALCULATE_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-等待时间参数--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][7] then 
        set_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId, tab[1]);
    --------------------------------读-消解参数------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][8] then 
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            set_value(PROCESS_DISPEL_SCREEN, i, tab[i]);--写入按钮值
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            set_text(PROCESS_DISPEL_SCREEN, i, tab[i]);--写入文本值
        end
    --------------------------------读-阀操作参数------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][9] then 
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
function ReadActionFile(fileName)
    local processFile = io.open(fileName, "r");      --打开文本

    processFile:seek("set");                         --把文件位置定位到开头
	Sys.processFileStr = processFile:read("a");--从当前位置读取整个文件，并赋值到字符串中
    processFile:close();                             --关闭文本

    --统计action个数,给SystemArg.actionNumber变量,以及SystemArg.actionTab赋值 ----------------------
    --Sys.actionTab数组长度为24,表示最多可记录24个action, 其值保存的是当前步骤对应的action序号
    --假如SystemArg.actionIdTab[1] = 3, 表示第一步就执行序号为3的action, 也意味着序号为1/2的action为空格(没有设置)
    local actionString = GetSubString(Sys.processFileStr, "<action0>", "</action0>");--截取文件中<action0>标签之间的字符串
    local typeString = GetSubString(actionString, "<type>","</type>");--获取流程类型与流程名称
    local tab = split(typeString, ",");
    Sys.processType = tab[1];
    Sys.processName = tab[2];
    Sys.rangetypeId = tonumber(get_text(PROCESS_SET1_SCREEN, ProcessTab[fileName].rangeId));
    local contentTabStr = GetSubString(actionString,"<content>","</content>");--再截取<content>标签中的内容
    tab = split(contentTabStr, ",");--分割字符串,并将字符串存入tab数组
    Sys.actionTotal = 0; 
    for i = 1,24,2 do -- tab中[1][2]分别保存了一个动作的类型与名称,占用了2个, 由于我们是统计action个数,所以这里步进需要设置为2
        if tab[i] ~= BLANK_SPACE then--判断动作类型不为nil
            Sys.actionTotal = Sys.actionTotal + 1;--action个数+1
            Sys.actionIdTab[Sys.actionTotal] = math.modf((i+1)/2);--由于这个for循环是从1开始,且步进是2,所以需要取 i+1/2 (1,3,5...)
            Sys.actionNameTab[Sys.actionTotal] = tab[i+1];--i+1对应了(2,4,6...)
        end
    end

    for i = 25,48,2 do
        if tab[i] ~= BLANK_SPACE then
            Sys.actionTotal = Sys.actionTotal + 1;
            Sys.actionIdTab[Sys.actionTotal] = math.modf((i+1)/2);--由于这个for循环是从1开始,且步进是2,所以需要取 i+1/2
            Sys.actionNameTab[Sys.actionTotal] = tab[i+1];--i+1对应了(2,4,6...)
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
         subString = BLANK_SPACE;
    else
        subString = string.sub(str, e1+1, s2-1);
    end
    return subString  
end

--***********************************************************************************************
---遍历历字符串，删除字符串1与字符串2之间的字符串,返回新字符串
-- @param str  待截取字符串;
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

    if name == BLANK_SPACE then--空格直接返回0
        return 0;
    end
    
    --遍历流程1-12, 找到运行控制界面中设置的流程名称,在流程设置1界面中对应的流程序号
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), name, 1) ~= nil then
                processId = i;
            break;
        end
    end
    return processId;
end 


