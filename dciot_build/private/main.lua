--下面列出了常用的回调函数
--更多功能请阅读<<物联型LUA脚本API.pdf>>
--建议使用visual code studio 并安装Bookmarks与luaide-lite(或者LuaCoderAssist)插件,
--通过打开同目录下的2300project.code-workspace工作空间查看main.lua文件,该文件使用Bookmarks插件插入了很多标签,方便跳转
--内存地址分配：
--0-35：保存的是操作员与管理员的密码，通过“系统信息”界面的Id为13的历史记录控件进行配置。
--36-199：预留空间
--200-4724：保存的是校正历史记录
--4724-7498：保存的是报警记录
--7498-13022：保存的是运行日志
--13022开始保存的是历史记录。



--[[-----------------------------------------------------------------------------------------------------------------
    宏定义&全局变量
--------------------------------------------------------------------------------------------------------------------]]
MAIN_SCREEN = 0;
RUN_CONTROL_SCREEN = 1;
PROCESS_SET1_SCREEN = 2;
PROCESS_SET2_SCREEN = 3;
PROCESS_EDIT1_SCREEN = 4;
PROCESS_EDIT2_SCREEN = 5;
PROCESS_INIT_SCREEN = 6;
PROCESS_INJECT_SCREEN = 7;
PROCESS_INJECT_ADD_SCREEN = 8;
PROCESS_PERISTALTIC_SCREEN = 9;
PROCESS_DISPEL_SCREEN =10;
PROCESS_READ_SIGNAL_SCREEN = 11;
PROCESS_CALCULATE_SCREEN = 12;
PROCESS_VALVE_CTRL_SCREEN = 13;
PROCESS_WAIT_TIME_SCREEN = 14;
PROCESS_TYPE_SELECT_SCREEN = 15;
PROCESS_NAME_SELECT_SCREEN = 16;
ACTION_SELECT_SCREEN = 17;
RANGE_SET_SCREEN = 18;
RANGE_SELECT_SCREEN = 19;
HAND_OPERATE1_SCREEN = 20;
HAND_OPERATE2_SCREEN = 21;
HAND_OPERATE3_SCREEN = 22;
HAND_OPERATE4_SCREEN = 23;
IN_OUT_SCREEN = 24;
HISTORY_ANALYSIS_SCREEN = 25;
HISTORY_CALIBRATION_SCREEN = 26;
HISTORY_ALARM_SCREEN = 27;
HISTORY_LOG_SCREEN = 28;
SYSTEM_INFO_SCREEN = 29;
PASSWORD_SET_SCREEN = 30;
LOGIN_SYSTEM_SCREEN = 31;
DIALOG_SCREEN = 33;
WIFI_CONNECT_SCREEN = 35;
REMOTE_UPDATE_SCREEN = 36;

--这里定义的Public table包含了有状态栏的界面, 方便更新"工作状态""当前动作""用户""报警"
PublicTab = {
    [1]  = MAIN_SCREEN,
    [2]  = RUN_CONTROL_SCREEN,
    [3]  = PROCESS_SET1_SCREEN,
    [4]  = PROCESS_EDIT1_SCREEN,
    [5]  = PROCESS_EDIT2_SCREEN,
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

SEND_OK = 0;
SEND_FAIL = 1;

FINISHED = 0;--子流程执行完成

OPEN = 1;--阀打开
CLOSE = 0;--阀关闭

UNLOCKED = 0;--串口未上锁
LOCKED = 1;--串口已上锁

NO_NEED_REPLY = 0;--串口数据不需要回复
NEED_REPLY = 1;--串口数据需要回复

--processIdType:
processId = 0;
autoRangeProcessId = 1;

--stopType
stopByNormal = 0;
stopByClickButton = 1;

Direction = {
    [CHN] = {FWD = "正转",REV = "反转"},
    [ENG] = {FWD = "CW",REV="CCW"},
}

CalcOrder = {
    [CHN] = {first = "一阶", second = "二阶", Third = "三阶"},
    [ENG] = {first = "First",second="Second", Third = "Third"},
}

--提示信息
TipsTab = {
    [CHN] = {
        insertSdUsb = "请插入SD卡",
        insertSd    = "插入SD卡",
        insertUsb   = "插入U盘",
        pullOutSd   = "拔出SD卡",
        pullOutUSB  = "拔出U盘",
        importing   = "正在导入配置文件...",
        imported    = "配置文件导入成功",
        exporting   = "正在导出配置文件...",
        exported    = "配置文件导出成功",
        exportTips  = "请在SD卡创建config文件夹后重试",
        selectProcess = "请选择流程",
        sysInit = "系统初始化",
        getVerFileFail = "获取版本文件失败",
        saveVerFileFail = "保存版本文件失败",
        openVerFileFail = "打开版本文件失败",
        getFirmwareFail = "获取固件失败",
        saveFirmwareFail = "保存固件失败",
        saveFirmwareOk  = "下载并保存固件成功",
        openFirmwareFail = "打开固件失败",
        updateFail = "升级失败",
        sendFirmwareOk   = "固件发送成功",
        updateDrvBd = "升级驱动板",
        reply = "回复",
        connected = "已连接",
        unconnected = "未连接",
        NoPermission = "当前用户无权限执行该操作",
        stopFirst = "系统运行中,不可执行该操作",
        null  = "无",
    },
    [ENG] = {
        insertSdUsb = "Please Insert SD Card",
        insertSd    = "Please Insert SD Card",
        insertUsb   = "Please Insert U Disk",
        pullOutSd   = "Pull Out The SD card",
        pullOutUSB  = "Pull Out The U Disk",
        importing   = "Importing Configuration File...",
        imported    = "Configuration File Imported Successfully",
        exporting   = "Exporting Configuration File...",
        exported    = "Configuration File Exported Successfully",
        exportTips  = "Create The \"config\" Folder On The SD Card First",
        selectProcess = "Select Process",
        sysInit = "System Initial",
        getVerFileFail = "Failed to get version file",
        saveVerFileFail= "Failed to save version file",
        openVerFileFail = "Failed to open version file ",
        getFirmwareFail = "Failed to get firmware",
        saveFirmwareFail ="Failed to save firmware",
        saveFirmwareOk  = "Download and save the firmware",
        openFirmwareFail = "Failed to open firmware",
        updateFail = "Upgrade failed",
        sendFirmwareOk  = "Send firmware successfully",
        updateDrvBd = "Upgrade Drv Board.",
        reply = "reply",
        connected = "connected",
        unconnected = "unconnected",
        NoPermission = "No Permission to Exceut",
        stopFirst = "System running, stop first",
        null    = "NULL",
    },
};

--系统日志信息
 SysLog = {
    [CHN] = {
        uartTimeOut = "回复超时",
        start = "开始",
        stop = "结束",
        highDensity = "浓度偏高",
        lowDensity = "浓度偏低",
        lack = "缺",
    },
    [ENG] = {
        uartTimeOut = "Timeout",
        start = "Start",
        stop = "Stop",
        highDensity = "High Density",
        lowDensity = "Ligh Density",
        lack = "Lack of "
    },
};

--工作状态
WorkStatus = {
    [CHN] = {
        run = "运行",--此时系统正在运行流程
        stop = "停止",
        readyRun = "待机", --此时为自动运行方式, 且在等待时间到后自动进行下一次流程的状态.
    },
    [ENG] = {
        run = "RUN",--此时系统正在运行流程
        stop = "STOP",
        readyRun = "READY", --此时为自动运行方式, 且在等待时间到后自动进行下一次流程的状态.
    }
};

--工作类型: 要与运行控制界面的运行方式菜单一一对应
WorkType = {
    [CHN] = {
        hand = "手动",--按启动按钮后,执行一次
        auto = "自动",--按启动按钮后,可以根据时间判断是否进行周期流程与定时流程
        controlled = "反控",--通过上位机发送指令运行流程.
    },
    [ENG] = {
        hand = "Manual",--按启动按钮后,执行一次
        auto = "Auto",--按启动按钮后,可以根据时间判断是否进行周期流程与定时流程
        controlled = "Controlled",--通过上位机发送指令运行流程.
    },
}

--系统用户
SysUser = {
    [CHN] = {
        operator = "操作员",
        maintainer = "运维员",
        administrator = "管理员",
    },
    [ENG] = {
        operator = "Operator",
        maintainer = "Maintainer",
        administrator = "Admin",
    },
}



--阀状态
ValveStatus = {
    [CHN] = {
        open = "打开",
        close = "关闭"
    },
    [ENG] = {
        open = "Open",
        close = "Close"
    },
};

--LED状态
LedStatus = {
    [CHN] = {
        open = "打开",
        close = "关闭"
    },
    [ENG] = {
        open = "ON",
        close = "OFF"
    },
};

--自动量程切换
AutoRangeStatus = {
    [CHN] = {
        open = "打开",
        close = "关闭"
    },
    [ENG] = {
        open = "ON",
        close = "OFF"
    },
};

--计算方式
CalcWay = {
    [CHN] = {
        log = "取对数",
        diff = "取差值",
    },
    [ENG] = {
        log = "Log10",
        diff = "Diff",
    },
};

CalcType = {
    [CHN] = {"分析","校正一","校正二","校正三","校正四"},
    [ENG] = {"Analysis","Calibration 1","Calibration 2","Calibration 3","Calibration 4"},
};

ProcessItem = {
    [CHN] = {"分析","校正","清洗","管路填充","零点核查","标样核查","跨度核查",BLANK_SPACE},
    [ENG] = {"Analysis","Calibration","Washing","Fill","Zero Check","STD Check","Span Check",BLANK_SPACE},
};

--ActionItem里面的值一定要与动作选择界面按钮中的值一一对应
ActionItem = {
    [CHN] = {"初始化","注射泵","注射泵加液体","读取信号","蠕动泵加液","计算","等待时间","消解","阀操作",BLANK_SPACE},
    [ENG] = {"Initialize","Injector","Injector Add","Read Signal","Pump Add","Calculation","Wait Time","Dispel","Valve",BLANK_SPACE},
};

--用于保存配置文件字符串
--配置文件使用 "0" "1" ... "12"进行命名,其中 "0" 中保存了运行控制界面/输入输入出界面/ 手动控制3界面/量程设置界面的参数
--配置文件 "1" - "24" 对应了流程设置界面中的1-24的流程.
--在上电后, 就将配置文件 "0" 中的数据读取到 ConfigStr[0]
--在从流程设置1界面跳转到流程编辑1界面当中时,需要选择流程,此时读取流程对应的配置文件 "?" ,将数据读取到ConfigStr[?]. (?取值1-12)
ConfigStr = {};


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
    actionStep = 1,--取值范围为1-24,对应了流程编辑1/3界面中的共24个步骤
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
    processFileStr = "",--读出取流程相关的配置文件后,保存到该变量当中
    processName = "" ,--流程名称
    processType = "",--流程类型, 通过该变量判断是校正 还是 非校正. 校正使用一种算法, 非校正使用另一种算法
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
    eWaitTimeFlag = RESET,--在测量E1,E2时的定时器

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
    signalCount = 0,--用于统计当前信号个数
    signalE1 = 0,--用于保存信号E1的值
    signalE2 = 0,--用于保存信号E2的值
    signalDrift = 0,--信号漂移
    signalMinTime = 0,--读取信号最小时间
    signalMaxTime = 0,--读取信号最大时间
    signalNumber = 0,--取样数，默认为10

    calculateWay = "",--计算方式: 取对数 或者 取差值 方式
    calculateType = "",--计算类型：有分析，校正一，校正二，校正三，校正四。
    calibrationValue = 0,--校正值
    caliE1 = {},--用于保存校正时的E1
    caliE2 = {},--用于保存校正时的E2
    caliValue = {},--用于保存校正浓度值
    result = 0,--进行一次流程运行后得到的结果,该结果可能是分析结果/校正结果/...

    hand_control_func = nil;

    alarmContent = "",--用于保存当前报警信息
    logContent = "",--用于保存当前日志信息


    reagentStatus = RESET;
    
    ssid = 0,
    wifi_connect = 0,
    binIndex = 0,--用于驱动板升级时,控制数据包位置

    flag_save_uart_log = ENABLE,--该变量用于是否保存串口通信log(获取电极电位的时候,会不断的获取,为了减少log,增加该变量进行控制)
    isAutoRangeProcess = false,--用于指示当前流程是否为自动量程切换流程,该变量用于保证只运行一次量程切换流程

    ReadyToReadConfigFile = false,--导入配置文件后,不能第一时间读取,需要过一段时间,该变量用于指示配置文件已经导入,可以延时读取了
}



--[[-----------------------------------------------------------------------------------------------------------------
    入口函数
--------------------------------------------------------------------------------------------------------------------]]


--***********************************************************************************************
--初始化函数,系统加载LUA脚本后，立即调用次回调函数
--***********************************************************************************************
function on_init()
    print(_VERSION);

    Sys.dateTime.year,Sys.dateTime.mon,Sys.dateTime.day,
    Sys.dateTime.hour,Sys.dateTime.min,Sys.dateTime.sec = get_date_time();--获取当前时间

    set_text(SYSTEM_INFO_SCREEN, TouchScreenHardVerId, "190311");--显示触摸屏硬件版本号
    set_text(SYSTEM_INFO_SCREEN, TouchScreenSoftVerId, "19121015");--显示触摸屏软件版本号

    --为了防止报nil错误,将一些必要的文本设置为BLANK_SPACE
    set_text(PROCESS_EDIT1_SCREEN, ProcesstypeId, BLANK_SPACE);
    set_text(PROCESS_EDIT2_SCREEN, ProcesstypeId, BLANK_SPACE);
    for i = 1,12,1 do
        set_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId,BLANK_SPACE);
        set_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId,BLANK_SPACE);
        set_text(PROCESS_SET2_SCREEN, ProcessTab[i+12].typeId,BLANK_SPACE);
        set_text(PROCESS_SET2_SCREEN, ProcessTab[i+12].nameId,BLANK_SPACE);
        set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId,BLANK_SPACE);
        set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId,BLANK_SPACE);
        set_text(PROCESS_EDIT2_SCREEN, TabAction[i+12].typeId,BLANK_SPACE);
        set_text(PROCESS_EDIT2_SCREEN, TabAction[i+12].nameId,BLANK_SPACE);
    end
    for i = 1,24,1 do
        set_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].textId,BLANK_SPACE);
    end
    for i=1,4,1 do
        set_text(RUN_CONTROL_SCREEN,PeriodicTab[i].textId,BLANK_SPACE);
    end
    set_text(RUN_CONTROL_SCREEN,HandProcessTab[1].textId ,BLANK_SPACE);
    
    LoadConfigFile();
    if record_get_count(SYSTEM_INFO_SCREEN,6) == 0 then --表示还未设置初始密码
        record_add(SYSTEM_INFO_SCREEN, pwdRecordId, "171717");--运维员与管理员的默认密码都是171717
        record_add(SYSTEM_INFO_SCREEN, pwdRecordId, "171717");--运维员与管理员的默认密码都是171717
    end

    --反控模式下,隐藏开始按钮
    Sys.runType = get_text(RUN_CONTROL_SCREEN, RunTypeID);
    if Sys.runType == WorkType[Sys.language].controlled then
        set_visiable(RUN_CONTROL_SCREEN, RunStopButtonId, 0);
    end
    
    set_unit();--设置单位
    -- Sys.hand_control_func = sys_init;--开机首先进行初始化操作
 --   Sys.hand_control_func = UpdataDriverBoard;--开机读取升级文件(调试时使用的代码)
    SetSysUser(SysUser[Sys.language].maintainer);   --开机之后默认为运维员(调试时使用的代码)
 --   SetSysUser(SysUser[Sys.language].operator);  --开机之后默认为操作员
    uart_set_timeout(2000,1); --设置串口超时, 接收总超时2000ms, 字节间隔超时1ms
    start_timer(0, 100, 1, 0) --开启定时器 0，超时时间 100ms,1->使用倒计时方式,0->表示无限重复

    --以下代码用于测试自动量程切换功能
    -- Sys.rangetypeId = 1;--预设当前量程id为1
    -- Sys.result = 5;--预设当前分析结果为5
    -- process_ready_run(autoRangeProcessId);--运行自动量程切换流程
    --end  测试自动量程切换功能

    --以下代码用于测试当记录满了之后, 是否会删除一条最旧记录的记录(报警记录)
    -- SdPath = "";
    -- for i = 1,55,1 do
    --     Sys.alarmContent = i;
    --     add_history_record(HISTORY_ALARM_SCREEN);--记录报警内容
    -- end
    --以下代码用于测试删除文件首行内容
    -- getFileLines("AlarmHistory.txt");
end

--***********************************************************************************************
--定时器超时，执行此回调函数,定时器编号 0~2
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
    elseif timer_id == 4 then
        Sys.eWaitTimeFlag = RESET ;
    end
end

 

--***********************************************************************************************
--定时回调函数，系统每隔1秒钟自动调用。
--***********************************************************************************************
function on_systick()
    Sys.dateTime.year,Sys.dateTime.mon,Sys.dateTime.day,
    Sys.dateTime.hour,Sys.dateTime.min,Sys.dateTime.sec = get_date_time();--获取当前时间
    
    if Sys.status == WorkStatus[Sys.language].readyRun then           --当系统处于待机状态时,
        process_ready_run(processId);
    end

    --判断wifi连接状态
    if string.len(Sys.ssid) > 0 then
        Sys.wifi_connect = get_network_state() --获取网络状态
        wifimode,secumode,ssid,password = get_wifi_cfg() --获取WIFI配置
        local dhcp, ipaddr, netmask, gateway, dns = get_network_cfg() --获取ip地址
        if Sys.wifi_connect ~= 0 then
            set_text(WIFI_CONNECT_SCREEN, WifiStatusTextId, TipsTab[Sys.language].connected);
            set_text(WIFI_CONNECT_SCREEN, WifiSsid, ssid);
            set_text(WIFI_CONNECT_SCREEN, WifiIpAddrId, ipaddr);
        end
    else
        set_text(WIFI_CONNECT_SCREEN, WifiStatusTextId, TipsTab[Sys.language].unconnected);
    end

    --判断触摸屏更新进度
    local state,process = get_upgrade_state()                    --获取更新状态与进度      
    set_value(REMOTE_UPDATE_SCREEN, RemoteUpdateTsStaId, state)  --升级状态提示
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
	elseif screen == PROCESS_TYPE_SELECT_SCREEN then --流程选择界面
		process_type_select_control_notify(screen,control,value);
	elseif screen == PROCESS_NAME_SELECT_SCREEN then--流程名称选择界面
		process_name_select_control_notify(screen,control,value);	
	elseif screen == PROCESS_SET1_SCREEN or screen == PROCESS_SET2_SCREEN then --流程设置1/2界面
		process_set12_control_notify(screen,control,value);
	elseif screen == PROCESS_EDIT1_SCREEN then --流程编辑1界面
		process_edit1_control_notify(screen,control,value);
    elseif screen == PROCESS_EDIT2_SCREEN then --流程编辑2界面
		process_edit2_control_notify(screen,control,value);
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
    elseif screen == HAND_OPERATE3_SCREEN then --手动操作3
        hand_operate3_control_notify(screen,control,value);	
    elseif screen == IN_OUT_SCREEN then--输入输出界面
        in_out_control_notify(screen,control,value);
	elseif screen == SYSTEM_INFO_SCREEN then --系统信息界面
		system_info_control_notify(screen,control,value);	
    elseif screen == LOGIN_SYSTEM_SCREEN then--登录系统界面
        login_system_control_notify(screen,control,value);
    elseif screen == DIALOG_SCREEN then
        dialog_screen_control_notify(screen,control,value);
	elseif screen == PASSWORD_SET_SCREEN then--密码设置界面
        password_set_control_notify(screen,control,value);	
    elseif screen == WIFI_CONNECT_SCREEN then--Wifi设置界面
        wifi_connect_control_notify(screen,control,value);		
    elseif screen == REMOTE_UPDATE_SCREEN then
        remote_update_control_notify(screen,control,value);
    elseif screen == HISTORY_ALARM_SCREEN or screen == HISTORY_ANALYSIS_SCREEN or screen == HISTORY_CALIBRATION_SCREEN or screen == HISTORY_LOG_SCREEN then
        history_control_notify(screen,control,value);
    end

end

--***********************************************************************************************
--当画面切换时，执行此回调函数，screen为目标画面。
--***********************************************************************************************
function on_screen_change(screen)
    if screen == PROCESS_EDIT1_SCREEN then --流程编辑1
        goto_ProcessSet2();
    elseif screen == PROCESS_EDIT2_SCREEN then --流程编辑2
        goto_ProcessSet3();
    elseif(screen == RANGE_SELECT_SCREEN) then --跳转到量程选择
		goto_range_select();
	elseif screen== PROCESS_NAME_SELECT_SCREEN then --跳转到流程名称选择
        goto_ProcessNameSelect();
    elseif screen == HISTORY_ANALYSIS_SCREEN then--跳转到分析记录界面
        goto_history_analysis(screen);
    elseif screen == HISTORY_CALIBRATION_SCREEN then--跳转到校正记录界面
        goto_history_calibration(screen);
    elseif screen ==HISTORY_ALARM_SCREEN then--跳转到报警记录界面
        goto_history_alarm(screen);
    elseif screen == HISTORY_LOG_SCREEN then--跳转到日志记录界面
        goto_history_log(screen);
	elseif screen== LOGIN_SYSTEM_SCREEN then--登录系统
		goto_LoginSystem();
	elseif screen== PASSWORD_SET_SCREEN then--密码设置
        goto_PasswordSet();
    elseif screen== WIFI_CONNECT_SCREEN then--密码设置
        goto_WifiConnect();
	end
end

--***********************************************************************************************
--插入 U 盘后，执行此回调函数
--***********************************************************************************************
function on_usb_inserted(dir)
    ShowSysTips(TipsTab[Sys.language].insertUsb..",路径:"..UsbPath);
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
    ShowSysTips(TipsTab[Sys.language].insertSd..",路径:"..SdPath);
    SdPath = dir;
end

--***********************************************************************************************
--拔出 SD 卡后，执行此回调函数
--***********************************************************************************************
function on_sd_removed()
    ShowSysTips(TipsTab[Sys.language].pullOutSd);
end


--[[-----------------------------------------------------------------------------------------------------------------
    系统初始化函数
--------------------------------------------------------------------------------------------------------------------]]
--***********************************************************************************************
--系统初始化, 一般在开机或者急停时调用该函数
--***********************************************************************************************
function sys_init()
    local softVer1,softVer2,hardVer1,hardVer2;

    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then
        return;
    end
    
    if Sys.processStep == 1 then--第一步: 关闭阀11
        set_enable(RUN_CONTROL_SCREEN, RunStopButtonId, DISABLE)--系统初始化时，禁止按开始按钮
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
        start_wait_time(5);
        reset_inject1();
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 5 then--第五步：获取驱动板版本号
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getDrvVer ,NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 6 then--第六步：显示驱动版本版本号 并 获取传感版与计算卡硬件版本号
        if UartArg.reply_sta == SEND_OK then
            softVer1 = bcd_to_string(UartArg.recv_data[10]).."."..bcd_to_string(UartArg.recv_data[11]); 
            hardVer1 = bcd_to_string(UartArg.recv_data[12]).."."..bcd_to_string(UartArg.recv_data[13]);
            set_text(SYSTEM_INFO_SCREEN, DriverBoardSoftVerId,softVer1);--显示软件版本号
            set_text(SYSTEM_INFO_SCREEN, DriverBoardHardVerId,hardVer1);--显示硬件版本号
        end
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getSCHardVer, NEED_REPLY);--获取传感版与计算卡硬件版本号
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 7 then--第七步：显示传感版与计算卡硬件版本号 并 获取传感版与计算卡软件版本号
        if UartArg.reply_sta == SEND_OK then
            hardVer1 = bcd_to_string(UartArg.recv_data[3])..bcd_to_string(UartArg.recv_data[4]);
            set_text(SYSTEM_INFO_SCREEN, SensorBoardHardVerId, hardVer1);
            hardVer1 = bcd_to_string(UartArg.recv_data[5])..bcd_to_string(UartArg.recv_data[6]);
            hardVer2 = bcd_to_string(UartArg.recv_data[7])..bcd_to_string(UartArg.recv_data[8]);
            set_text(SYSTEM_INFO_SCREEN, CalcBoardHardVerId, hardVer1..hardVer2);
        end
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getSCSoftVer, NEED_REPLY);--获取传感版与计算卡软件版本号
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 8 then--第八步：显示感版与计算卡软件版本号
        if UartArg.reply_sta == SEND_OK then
            softVer1 = bcd_to_string(UartArg.recv_data[3])..bcd_to_string(UartArg.recv_data[4]); 
            set_text(SYSTEM_INFO_SCREEN, SensorBoardSoftVerId, softVer1);
            softVer1 = bcd_to_string(UartArg.recv_data[5])..bcd_to_string(UartArg.recv_data[6]);
            softVer2 = bcd_to_string(UartArg.recv_data[7])..bcd_to_string(UartArg.recv_data[8]);
            set_text(SYSTEM_INFO_SCREEN, CalcBoardSoftVerId, softVer1..softVer2);
        end
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 9 then --第九步:初始化结束
        set_enable(RUN_CONTROL_SCREEN, RunStopButtonId, ENABLE)--初始化完成，使能开始按钮
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
  getSCSoftVer = {[0] = 0xEE, 0x03, 0x10, 0x03, 0x00, 0x03, 0x00, 0x00, len = 6, note = "获取软件版本" },
  getSCHardVer = {[0] = 0xEE, 0x03, 0x10, 0x02, 0x00, 0x03, 0x00, 0x00, len = 6, note = "获取硬件版本" },
    getTemp    = {[0] = 0xEE, 0x03, 0x10, 0x0A, 0x00, 0x01, 0x00, 0x00, len = 6, note = "测量池温度" },
    getVoltage = {[0] = 0xEE, 0x03, 0x10, 0x0C, 0x00, 0x01, 0x00, 0x00, len = 6, note = "光电管电压"},
 setLedCurrnet = {[0] = 0xEE, 0x03, 0x10, 0x0D, 0x00, 0x01, 0x00, 0x00, len = 6, note = "设置LED电流"},
    openLed    = {[0] = 0xEE, 0x06, 0x10, 0x0E, 0x00, 0x01, 0x00, 0x00, len = 6, note = "开LED灯" },
    closeLed   = {[0] = 0xEE, 0x06, 0x10, 0x0E, 0x00, 0x00, 0x00, 0x00, len = 6, note = "关LED灯" },
updateCalcSoft = {[0] = 0xEE, 0x06, 0x10, 0x04, 0x00, 0x00, 0x00, 0x00, len = 6, note = "更新计算板"},
    getDrvVer  = {[0] = 0xE0, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "驱动版本号"},
    openValco  = {[0] = 0xE0, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "十通阀"},--开十通阀
    openV11    = {[0] = 0xE0, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "开阀11"},
    closeV11   = {[0] = 0xE0, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "关阀11"},
    openV12    = {[0] = 0xE0, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "开阀12"},
    closeV12   = {[0] = 0xE0, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "关阀12"},
    enInject1  = {[0] = 0xE0, 0x0F, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "使能注射泵"},
   mvInject1To = {[0] = 0xE0, 0x0D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "移动注射泵"},
 setInject1Spd = {[0] = 0xE0, 0x0E, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "设置注射泵速度"},
    rstInject1 = {[0] = 0xE0, 0x0D, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "复位注射泵"},
    updateDrv  = { },--该变量用于驱动板升级
}



UartArg = {
    repeat_times = 0,--用于记录重发次数
    repeat_data ,--用于保存本次重发数据
    note = "",--用于保存串口指令说明
    recv_data,--用于保存接收到的数据
    reply_data = {[0] = 0, [1] = 0},--用于保存需要接受到的回复数据
    reply_sta = SEND_OK;--用于指示发送的串口指令是否有正确回复
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

    --当前为反控模式
    if Sys.runType == WorkType[Sys.language].controlled and package[0] == tonumber(get_text(IN_OUT_SCREEN,IOSET_ComputerAddr)) then
        ComputerControl(packet);
    --判断是否为指令数据回复
    elseif packet[0] == UartArg.reply_data[0] and packet[1] == UartArg.reply_data[1] then
        UartArg.repeat_times = 0;--重发计数请0
        UartArg.reply_sta = SEND_OK;
        UartArg.lock = UNLOCKED;
        stop_timer(1)--停止超时定时器
    end
    
    --添加通信记录
    local UartDateTime =  string.format("%02d-%02d %02d:%02d",Sys.dateTime.mon,Sys.dateTime.day,Sys.dateTime.hour,Sys.dateTime.min);
    local UartData = "";--将需要发送的数据保存到该字符串中
    for i=0, rev_len-1, 1 do
        UartData = UartData..string.format("%02x ", packet[i]);
    end
    --判断是否打开串口通信记录功能
    if Sys.flag_save_uart_log == ENABLE then
        record_add(HAND_OPERATE4_SCREEN, UartRecordId, "RX;"..UartDateTime..";"..UartData..";"..TipsTab[Sys.language].reply);
    end
end

--***********************************************************************************************
--串口发送函数
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
        UartArg.repeat_times = 0;
        UartArg.reply_data[0] = packet[0];--设置回复数据,用于判断是否成功接受到回复
        UartArg.reply_data[1] = packet[1];
    end
    
    packet[packet.len], packet[packet.len+1] = CalculateCRC16(packet, packet.len);--计算crc16
    UartArg.reply_sta = SEND_FAIL;
    print(packet.note);--调试输出,方便电脑端调试时查看串口收发数据
    uart_send_data(packet) --将数据通过串口发送出去

    UartArg.note = packet.note;--在保存串口回复超时的日志时，需要用到UartArg.note

    --以下代码功能: 每发送一次数据,就将该数据保存在手动操作4的串口收发记录当中,方便从触摸屏查看.
    local UartDateTime =  string.format("%02d-%02d %02d:%02d",Sys.dateTime.mon,Sys.dateTime.day,Sys.dateTime.hour,Sys.dateTime.min);
    local UartData = "";--将需要发送的数据保存到该字符串中
    --判断为升级数据,只保存前6字节与后两字节的CRC
    if packet[0] == 0xD0 and packet[1] == 0x10 and packet[2] == 0x30 then
        for i=0, 5, 1 do
            UartData = UartData..string.format("%02x ", packet[i]);
        end
        UartData = UartData.."..."..string.format("%02x ", packet[packet.len])..string.format("%02x ", packet[packet.len+1]);
    else
        for i=0, packet.len+1, 1 do
            UartData = UartData..string.format("%02x ", packet[i]);
        end
    end
    --判断是否打开串口通信记录功能
    if Sys.flag_save_uart_log == ENABLE then
        record_add(HAND_OPERATE4_SCREEN, UartRecordId, "TX;"..UartDateTime..";"..UartData..";"..packet.note);--添加通信记录
    end
    
end



--***********************************************************************************************
--串口接受超时函数
--进入到该函数表示串口一定回复超时, 因为如果回复成功, 在on_uart_recv_data函数中就会停止定时器1,就不会进入到该函数
--***********************************************************************************************
function uart_time_out()
    UartArg.repeat_times = UartArg.repeat_times + 1;
    if UartArg.repeat_times < 4 then
        UartArg.lock = UNLOCKED;
        uart_send_data(UartArg.repeat_data);--数据重发
    else  --重发2次都没有回复,不再重发
        print("串口接受超时");
        --判断为升级驱动板数据,此时升级失败
        if UartArg.repeat_data[0] == 0xD0 and UartArg.repeat_data[1] == 0x10 and UartArg.repeat_data[2] == 0x30 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].updateFail)
            Sys.hand_control_func = nil;
        end
        UartArg.repeat_times = 0;
        --此时如果系统在运行流程,则锁住串口,不再继续往下执行,在按停止后会解锁串口; 如果是手动操作发送串口指令,则解锁串口
        if Sys.status == WorkStatus[Sys.language].run then
            UartArg.lock = LOCKED;
        else
           UartArg.lock = UNLOCKED;
        end
        stop_timer(1)--停止超时定时器
        beep(1000);--串口回复超时，蜂鸣器响1秒钟。
        Sys.alarmContent = UartArg.note..SysLog[Sys.language].uartTimeOut;--初始化报警内容（串口回复超时）
        add_history_record(HISTORY_ALARM_SCREEN);--记录报警内容
        ShowSysAlarm(Sys.alarmContent);--在底部状态栏显示报警信息
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
    首页/状态栏显示函数
--------------------------------------------------------------------------------------------------------------------]]

LastResultTimeId = 20;   --分析时间
LastAnalyteId = 17;        --分析物
LastResultId = 18; --分析结果
LastResultUnitId = 19;   --单位
LastResultE1Id = 25;     --E1
LastResultE2Id = 26;     --E2
NextProcessTimeTextId = 2  --下次启动时间

ProgressBarId = 14--进度条，范围0-100

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
    if time_s == 0 then
        return;
    end
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
            start_wait_time(Sys.waitTime);
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


--[[-----------------------------------------------------------------------------------------------------------------
    运行控制
--------------------------------------------------------------------------------------------------------------------]]


--流程设置相关的按钮id从101 - 129, 其中101为周期流程第一个, id129为手动流程
RUNCTRL_TextStartId = 1;
RUNCTRL_TextEndId = 85;
RUNCTRL_SaveBtId = 88;
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
    if control == RUNCTRL_SaveBtId and get_value(RUN_CONTROL_SCREEN,control) == ENABLE then
        print("保存运行控制界面参数")
        WriteProcessFile(2);
    end
	--control-100表示与该按钮重合的文本框
	if (control) >= PeriodicTab[1].buttonId  and control <= HandProcessTab[1].buttonId then--当点击需要选择流程的文本框时
        process_name_select_set(screen, control-100);--(control100)表示与该按钮重合的文本框

    --当按下开始时, 首先设置系统状态为待机状态,因为只有在该状态调用get_current_process_id返回值才是需要执行的流程序号
    --得到流程序号后, 就可以读取已该序号命名的配置文件,该配置文件保存了该流程的所有动作.
    elseif control == RunStopButtonId then
        if get_value(RUN_CONTROL_SCREEN,control) == ENABLE then --按钮按下,此时系统状态变为待机运行
            SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态
            process_ready_run(processId);--开始运行前的一些初始化操作
        else--按钮松开,此时系统状态应变为停止
            SystemStop(stopByClickButton);
            print("SystemStop");
        end
    elseif control == RunTypeMenuId then--更改运行方式
        Sys.runType = get_text(RUN_CONTROL_SCREEN, RunTypeID);
        if Sys.runType == WorkType[Sys.language].controlled then
            set_visiable(RUN_CONTROL_SCREEN, RunStopButtonId, 0);
        else
            set_visiable(RUN_CONTROL_SCREEN, RunStopButtonId, 1);
        end
    elseif control == HandProcessTab[1].TimesId then--更改手动运行次数
        HandProcessTab[1].times = tonumber(get_text(RUN_CONTROL_SCREEN, control));
    elseif control >= PeriodicTab[5].textId and control <= PeriodicTab[10].textId then --更改周期开始时间与频率
        PeriodicTab[control-27].value = tonumber(get_text(RUN_CONTROL_SCREEN, control));--control-27后,对应了周期流程开始时间与?德?
    elseif control >= TimedProcessTab[1].startHourId and control <= TimedProcessTab[24].startHourId then--更改定时流程时间中的小时
        TimedProcessTab[control-37].startHour = tonumber(get_text(RUN_CONTROL_SCREEN,control));--control-37后,对应了定时流程的序号
    elseif control >= TimedProcessTab[1].startMinuteId and control <= TimedProcessTab[24].startMinuteId then--更改定时流程时间中的分钟
        TimedProcessTab[control-61].startMinute = tonumber(get_text(RUN_CONTROL_SCREEN,control));--control-61后,对应了定时流程的序号
    elseif control == TimedProcessClear then--一键清空所有定时设置
        for i = 1,24,1 do
            set_text(RUN_CONTROL_SCREEN, TimedProcessTab[i].textId, BLANK_SPACE);
            set_text(RUN_CONTROL_SCREEN, TimedProcessTab[i].startHourId, string.format( "%02d",i));
            set_text(RUN_CONTROL_SCREEN, TimedProcessTab[i].startMinuteId, "00");
            process_change(i+4);
            TimedProcessTab[i].startHour   = tonumber(get_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].startHourId));
            TimedProcessTab[i].startMinute = tonumber(get_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].startMinuteId));
        end
    end
end


--***********************************************************************************************
--当修改了某个流程时,调用该函数,一般按了流程名称选择界面中的确认按钮会调用该函数
--control 运行控制界面中流程文本的id
--***********************************************************************************************
function process_change(control)
    local processId = 0;

    --遍历流程1-12, 找到运行控制界面中设置的流程名称,在流程设置1界面中对应的流程序号
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), get_text(RUN_CONTROL_SCREEN, control), 1) ~= nil then
            --找到当前是设置的第几个周期流程, 且流程名称不是一个空格(在流程名称选择界面中,提供一个空流程,用于删除功能)
            if get_text(PROCESS_NAME_SELECT_SCREEN, control) == BLANK_SPACE then
                processId = 0;
            else
                processId = i;
            end
            break;
        end
    end
    --遍历流程13-24, 找到运行控制界面中设置的流程名称,在流程设置1界面中对应的流程序号
    for i = 13, 24, 1 do
        if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId), get_text(RUN_CONTROL_SCREEN, control), 1) ~= nil then
            --找到当前是设置的第几个周期流程, 且流程名称不是一个空格(在流程名称选择界面中,提供一个空流程,用于删除功能)
            if get_text(PROCESS_NAME_SELECT_SCREEN, control) == BLANK_SPACE then
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
--[获取自动量程切换时需要运行的流程id
--当点击开始按钮时,调用该函数获取需要执行的流程id
--***********************************************************************************************
function get_auto_range_process_id()
    local destRangeId = 0;
    local processId = 0;
    --浓度偏高当前量程为1
    if Sys.rangetypeId == 1 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN,RangeTab[1].HighId)) then
        destRangeId = 2;
    --浓度偏高当前量程为2
    elseif Sys.rangetypeId == 2 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN,RangeTab[2].HighId)) then
        destRangeId = 3;
    --浓度偏低当前量程为2
    elseif Sys.rangetypeId == 2 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN,RangeTab[2].LowId)) then
        destRangeId = 1;
    --浓度偏低当前量程为3
    elseif Sys.rangetypeId == 3 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN,RangeTab[3].LowId)) then
        destRangeId = 2;
    end
    print("量程自动切换,查找量程为"..destRangeId.."的流程");

    --查找类型为分析且量程为destRangeId的 流程的id
    for i=1,12,1 do
        if get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId) == ProcessItem[Sys.language][1] and--类型为分析
            tonumber(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId)) == destRangeId then--量程为目的量程
                processId = i;
                break;
        end
    end
    for i=13,24,1 do
        if get_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId) == ProcessItem[Sys.language][1] and--类型为分析
            tonumber(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].rangeId)) == destRangeId then--量程为目的量程
                processId = i;
                break;
        end
    end
    --如果满足了自动量程切换的条件, 且找到了可运行的流程,则直接返回
    ShowSysTips("量程自动切换,执行流程id为"..processId.."的流程");

    return processId;
end

--***********************************************************************************************
--[获取流程id
--当点击开始按钮时,调用该函数获取需要执行的流程id
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

        set_enable(PROCESS_SET2_SCREEN, ProcessTab[i+12].typeId ,state);
        set_enable(PROCESS_SET2_SCREEN, ProcessTab[i+12].nameId   ,state);
        set_enable(PROCESS_SET2_SCREEN, ProcessTab[i+12].rangeId  ,state);
        set_enable(PROCESS_SET2_SCREEN, ProcessTab[i+12].deleteId ,state);

        set_enable(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, state);
        set_enable(PROCESS_EDIT1_SCREEN, TabAction[i].nameId,   state);

        set_enable(PROCESS_EDIT2_SCREEN, TabAction[i+12].typeId, state);
        set_enable(PROCESS_EDIT2_SCREEN, TabAction[i+12].nameId,   state);
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
    set_enable(PROCESS_TYPE_SELECT_SCREEN, SureButtonId, state)
    -- set_enable(PROCESS_NAME_SELECT_SCREEN, SureButtonId, state)
    set_enable(ACTION_SELECT_SCREEN, SureButtonId, state)
end

--***********************************************************************************************
--[读取并解析流程配置
--actionNumber:当前动作为第几步
--***********************************************************************************************
function LoadActionStr(index)
    local configFile = io.open(index, "r")          --打开文本
    if configFile ~= nil then              
        configFile:seek("set")                  --把文件位置定位到开头
        ConfigStr[index] = configFile:read("a")     --从当前位置读取整个文件，并赋值到字符串
        configFile:close()                      --关闭文本
    else
        ShowSysTips("未找到配置文件");
    end
    Sys.processFileStr = ConfigStr[index];
    --统计action个数,给SystemArg.actionNumber变量,以及SystemArg.actionTab赋值 ----------------------
    --Sys.actionTab数组长度为24,表示最多可记录24个action, 其值保存的是当前步骤对应的action序号
    --假如SystemArg.actionIdTab[1] = 3, 表示第一步就执行序号为3的action, 也意味着序号为1/2的action为空格(没有设置)
    local actionString = GetSubString(Sys.processFileStr, "<action0>", "</action0>");--截取文件中<action0>标签之间的字符串
    local typeString = GetSubString(actionString, "<type>","</type>");--获取流程类型与流程名称
    local tab = split(typeString, ",");
    Sys.processType = tab[1];
    Sys.processName = tab[2];
    if index <= 12 then
        Sys.rangetypeId = tonumber(get_text(PROCESS_SET1_SCREEN, ProcessTab[index].rangeId));
    elseif index <= 24 then
        Sys.rangetypeId = tonumber(get_text(PROCESS_SET2_SCREEN, ProcessTab[index].rangeId));
    end
    local contentTabStr = GetSubString(actionString,"<content>","</content>");--再截取<content>标签中的内容
    tab = split(contentTabStr, ",");--分割字符串,并将字符串存入tab数组
    Sys.actionTotal = 0; 
    --将流程编辑1界面中的动作id 与 动作名称保存到 tab数组中
    for i = 1,24,2 do -- tab中[1][2]分别保存了一个动作的类型与名称,占用了2个, 由于我们是统计action个数,所以这里步进需要设置为2
        if tab[i] ~= BLANK_SPACE then--判断动作类型不为nil
            Sys.actionTotal = Sys.actionTotal + 1;--action个数+1
            Sys.actionIdTab[Sys.actionTotal] = math.modf((i+1)/2);--由于这个for循环是从1开始,且步进是2,所以需要取 (i+1)/2 (1,3,5...)
            Sys.actionNameTab[Sys.actionTotal] = tab[i+1];--i+1对应了(2,4,6...)
        end
    end
    --将流程编辑2界面中的动作id 与 动作名称保存到 tab数组中
    for i = 25,48,2 do
        if tab[i] ~= BLANK_SPACE then
            Sys.actionTotal = Sys.actionTotal + 1;
            Sys.actionIdTab[Sys.actionTotal] = math.modf((i+1)/2);--由于这个for循环是从1开始,且步进是2,所以需要取 i+1/2
            Sys.actionNameTab[Sys.actionTotal] = tab[i+1];--i+1对应了(2,4,6...)
        end
    end
    ------------------------试剂余量判断----------------------------------------------------------
    --统计跑完该流程,需要消耗的各试剂多少量
    Sys.reagentStatus = RESET;
    local reagentUse = {[1]=0,[2]=0,[3]=0,[4]=0,[5]=0,[6]=0};
    local reagentPreRemain = {};
    for i=1,6,1 do
        reagentPreRemain[i] = tonumber(get_text(HAND_OPERATE3_SCREEN,ReagentTab[i].remainId));
    end
    for i=1,Sys.actionTotal,1 do
        --截取文件中<action?>标签之间的字符串
        local actionStr = GetSubString(Sys.processFileStr, "<action"..Sys.actionIdTab[i]..">", "</action"..Sys.actionIdTab[i]..">");
        local typeStr  = GetSubString(actionStr, "<type>","</type>");--获动作类型与名称
        local typeTab = split(typeStr, ",");--将动作类型与名称放在tab表中
        local contentTabStr = GetSubString(actionStr,"<content>","</content>");--再截取<content>标签中的内容
        local contentTab    = split(contentTabStr, ",");--分割字符串,并将字符串存入tab数组
        --判断是否为注射泵加液
        if typeTab[1] == ActionItem[Sys.language][3] then
            if contentTab[9] == ENABLE_STRING then--注射泵加液界面的试剂一栏有选中
                local index = tonumber(contentTab[62])--试剂序号
                reagentUse[index] = tonumber(contentTab[61])--试剂用量
                print("本次流程将消耗试剂"..index..":"..reagentUse[index].."mL");
                if reagentPreRemain[index] > reagentUse[index] then
                    reagentPreRemain[index] = reagentPreRemain[index] - reagentUse[index];
                else
                    reagentPreRemain[index] = 0;
                end
                print("试剂"..index.."将会剩余"..reagentPreRemain[index].."mL");
            end
        end
    end
    --计算跑完该流程后,试剂的余量, 并将该余量与报警值进行比较
    for i=1,6,1 do
        --试剂总量不为0,开启检测 ;试剂余量少于报警值
        if tonumber(get_text(HAND_OPERATE3_SCREEN,ReagentTab[i].totalId)) ~= 0 and 
           reagentPreRemain[i] <= tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].alarmId)) then
            Sys.alarmContent = SysLog[Sys.language].lack..get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].nameId);--初始化报警内容（串口回复超时）
            add_history_record(HISTORY_ALARM_SCREEN);--记录报警内容
            ShowSysAlarm(Sys.alarmContent);--在底部状态栏显示报警信息
            print(Sys.alarmContent);
            Sys.reagentStatus = SET;
        end
    end
end


--***********************************************************************************************
--[流程执行入口函数  
--processIdType: 参数为 processId,调用get_current_process_id函数获取id
--               参数为 autoRangeProcessId,调用get_auto_range_process_id函数获取id,该参数一般在执行自动量程切换的时候使用
--***********************************************************************************************
function process_ready_run(processIdType)
    if processIdType == autoRangeProcessId then
        Sys.currentProcessId = get_auto_range_process_id();
        Sys.isAutoRangeProcess = true;
    else
        Sys.currentProcessId = get_current_process_id();--获取当前需要运行的流程id
        Sys.isAutoRangeProcess = false;
    end
    ShowSysTips("当前需要运行的流程id="..Sys.currentProcessId);
    print("当前需要运行的流程id="..Sys.currentProcessId);
    if Sys.currentProcessId ~= 0  then--不等于0,表示有满足条件的流程待执行,
        set_process_edit_state(DISABLE);           --禁止流程设置相关的操作
        LoadActionStr(Sys.currentProcessId);       --读取流程配置
        if Sys.reagentStatus == SET then           --当前缺液,不执行流程
            SystemStop(stopByNormal);
            ShowSysAlarm(Sys.alarmContent);        --在底部状态栏显示报警信息
            return;
        end
        Sys.startTime = Sys.dateTime;
        if Sys.isPeriodOrTimed == PERIOD_PROCESS then
            set_process_start_date_time(Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day, Sys.dateTime.hour, Sys.dateTime.min);--设置本次流程开始时间
        end
        Sys.driverSubStep = 1; --所有步骤都是从1开始
        Sys.actionStep = 1;
        Sys.actionSubStep = 1;
        Sys.driverStep = 1;
        Sys.driverSubStep = 1;
        Sys.handRunTimes = 0;
        Sys.flag_save_uart_log = ENABLE;--打开串口通信日志记录功能
        set_value(MAIN_SCREEN, ProgressBarId, 0);--设置进度条的值为0
        Sys.logContent = WorkStatus[Sys.language].run.."\""..Sys.processName.."\"";--“运行”+流程名称
        add_history_record(HISTORY_LOG_SCREEN);--添加一条日志信息
        ShowSysAlarm(TipsTab[Sys.language].null);--清空报警
        set_text(MAIN_SCREEN, LastResultE1Id, 0);--E1显示清0
        set_text(MAIN_SCREEN, LastResultE2Id, 0);--E2显示清0
        SetSysWorkStatus(WorkStatus[Sys.language].run);--设置工作状态为运行,定时器中断中检测到运行状态后,会跳转到excute_process函数执行流程
    end
end

--***********************************************************************************************
--[主流程执行函数
--该函数在定时器中调用,在运行状态时调用该函数
--系统为运行状态,此时SystemArg.currentProcessId保存了当前需要运行的流程序号, 而该以该序号为名的流程配置文件保存了该流程的所有动??通过解析该文件可以知道该做什么动作.
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
        print("当前需要执行的Action="..Sys.actionString);
        local typeString  = GetSubString(Sys.actionString, "<type>","</type>");--获动作类型与名称
        local tab = split(typeString, ",");--将动作类型与名称放在tab表中
        Sys.actionType    = tab[1];--获取动作类型
        Sys.contentTabStr = GetSubString(Sys.actionString,"<content>","</content>");--再截取<content>标签中的内容
        set_text(IN_OUT_SCREEN, 9, Sys.actionString);
        Sys.contentTab    = split(Sys.contentTabStr, ",");--分割字符串,并将字符串存入tab数组
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
            print("单个action执行完成");
        end
    ---------------------------------------------------------------------------------------------------
    --第三步:判断动作是否执行完毕
    elseif Sys.processStep == 3 then
        print("判断是否还有action未执行?总Action="..Sys.actionTotal.."当前Action="..Sys.actionStep);
        set_value(MAIN_SCREEN, ProgressBarId, math.floor(Sys.actionStep/Sys.actionTotal*100));--更新进度条
        ----------------所有动作执行完毕(流程结束)-------------------------------------------
        if Sys.actionStep >= Sys.actionTotal then
            Sys.actionStep = 1;                       --重新指向第一个动作
            Sys.processStep = 1;                      --重新计算指向第一个动作的第一步
            ------类型为分析且开启了自动量程切换----------
            if  Sys.processType == ProcessItem[Sys.language][1] and 
                get_text(RANGE_SET_SCREEN,RANGESET_AutoTextId) == AutoRangeStatus[Sys.language].open and 
                Sys.isAutoRangeProcess == false then
                if get_auto_range_process_id() ~= 0 then
                    process_ready_run(autoRangeProcessId);--运行自动量程切换流程
                else
                    SystemStop(stopByNormal);
                end
            ----------------手动模式--------------------
            elseif Sys.runType == WorkType[Sys.language].hand then                    
                Sys.handRunTimes = Sys.handRunTimes + 1;  --分析次数+1
                if  Sys.handRunTimes >= HandProcessTab[1].times then--已达到指定的运行次数,系统停止
                    SystemStop(stopByNormal);
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
                SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态,此时会在系统定时器中不断的判断是否可以进行?乱淮瘟鞒塘?
            ----------------反控模式--------------------
            elseif Sys.runType == WorkType[Sys.language].controlled then
                SystemStop(stopByNormal);
            end
        ----------------动作未执行完,继续下一个动作-------------------------------------------
        else
            Sys.actionStep = Sys.actionStep + 1;--指向下一个动作
            Sys.processStep = 1;                --返回第一步执行下一个动作
        end
    end
end

--***********************************************************************************************
--[流程停止函数
--  在底部的状态栏显示提示信息
--stopType : stopByNormal-跑完一次流程后正常停止 ;stopByClickButton-通过手动点击停止按钮强制停止流程
--***********************************************************************************************
function SystemStop(stopType) 
    SetSysWorkStatus(WorkStatus[Sys.language].stop);--将状态栏显示为停止
    ShowSysCurrentAction(TipsTab[Sys.language].null);--将当前动作显示为"无"
    ShowSysAlarm(TipsTab[Sys.language].null);--清空报警
    ShowSysTips("");
    set_value(RUN_CONTROL_SCREEN, RunStopButtonId, 0.0);--将开始/停止按钮弹出
    if Sys.userName == SysUser[Sys.language].maintainer or  Sys.userName == SysUser[Sys.language].administrator then--运维员/管?碓?
        set_process_edit_state(ENABLE);--允许编辑流程
    end
    Sys.processStep = 1;
    Sys.isAutoRangeProcess = false;
    Sys.flag_save_uart_log = ENABLE;--打开串口通信日志记录功能
    UartArg.lock = UNLOCKED;--解锁串口
    UartArg.repeat_times = 0;--重发计数请0
    UartArg.reply_sta = SEND_OK;
    UartArg.lock = UNLOCKED;
    stop_timer(1)--停止超时定时器
    Sys.logContent = WorkStatus[Sys.language].stop.."\""..Sys.processName.."\"";--“停止”+流程名称
    add_history_record(HISTORY_LOG_SCREEN);--添加一条停止流程的日志信息
end

--***********************************************************************************************
--  通过电脑控制仪器的运转
--***********************************************************************************************
function ComputerControl(package)
    local replayData = {};
    --判断第0个字节(地址)
    if package[0] == tonumber(get_text(IN_OUT_SCREEN,IOSET_ComputerAddr)) then
        
        --判断第1个字节(读或写)
        if package[1] == 0x03 then----读
            replayData[0] = package[0];--地址
            replayData[1] = package[1];
            if package[3] == 0x02 then--读单位
            elseif package[3] == 0x00 then--读分析结果
            elseif package[3] == 0x02 then--读校正结果
            end
        elseif package[1] == 0x06 then--写
            if package[3] == 0x04 then--开始分析
                -- Sys.runType = 
                SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态
                process_ready_run(processId);--开始运行前的一些初始化操作
            elseif package[3] == 0x06 then--停止分析
                SystemStop(stopByClickButton);
            end
            uart_send_data(package) --回复
        end
        
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    流程设置1/2
--------------------------------------------------------------------------------------------------------------------]]

--流程设置表中各控件Id,注意selecId与nameId的数学关系:typeId = nameId + 100, typeId = deleteId + 50 等等
ProcessTab = {[1] = {typeId = 301, nameId = 201, rangeId = 351, deleteId = 251, editId = 51},
              [2] = {typeId = 302, nameId = 202, rangeId = 352, deleteId = 252, editId = 52},
              [3] = {typeId = 303, nameId = 203, rangeId = 353, deleteId = 253, editId = 53},
              [4] = {typeId = 304, nameId = 204, rangeId = 354, deleteId = 254, editId = 54},
              [5] = {typeId = 305, nameId = 205, rangeId = 355, deleteId = 255, editId = 55},
              [6] = {typeId = 306, nameId = 206, rangeId = 356, deleteId = 256, editId = 56},
              [7] = {typeId = 307, nameId = 207, rangeId = 357, deleteId = 257, editId = 57},
              [8] = {typeId = 308, nameId = 208, rangeId = 358, deleteId = 258, editId = 58},
              [9] = {typeId = 309, nameId = 209, rangeId = 359, deleteId = 259, editId = 59},
              [10]= {typeId = 310, nameId = 210, rangeId = 360, deleteId = 260, editId = 60},
              [11]= {typeId = 311, nameId = 211, rangeId = 361, deleteId = 261, editId = 61},
              [12]= {typeId = 312, nameId = 212, rangeId = 362, deleteId = 262, editId = 62},
              [13]= {typeId = 313, nameId = 213, rangeId = 363, deleteId = 263, editId = 63},
              [14]= {typeId = 314, nameId = 214, rangeId = 364, deleteId = 264, editId = 64},
              [15]= {typeId = 315, nameId = 215, rangeId = 365, deleteId = 265, editId = 65},
              [16]= {typeId = 316, nameId = 216, rangeId = 366, deleteId = 266, editId = 66},
              [17]= {typeId = 317, nameId = 217, rangeId = 367, deleteId = 267, editId = 67},
              [18]= {typeId = 318, nameId = 218, rangeId = 368, deleteId = 268, editId = 68},
              [19]= {typeId = 319, nameId = 219, rangeId = 369, deleteId = 269, editId = 69},
              [20]= {typeId = 320, nameId = 220, rangeId = 370, deleteId = 270, editId = 70},
              [21]= {typeId = 321, nameId = 221, rangeId = 371, deleteId = 271, editId = 71},
              [22]= {typeId = 322, nameId = 222, rangeId = 372, deleteId = 272, editId = 72},
              [23]= {typeId = 323, nameId = 223, rangeId = 373, deleteId = 273, editId = 73},
              [24]= {typeId = 324, nameId = 224, rangeId = 374, deleteId = 274, editId = 74},
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
function process_set12_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- 保存
        WriteProcessFile(1);
    --导入按钮----------------------------------------------------------------------
    elseif control == InportBtId then --
        if SdPath  ~= nil then
            ShowSysTips(TipsTab[Sys.language].importing);
            for i = 0,24,1 do--依次导出文件"0"~"24"
                ConfigFileCopy( SdPath.."config/"..i, i);--将Sd卡中的配置文件导入都系统
            end
            on_init();
            Sys.hand_control_func = nil;
            SystemStop(stopByNormal);
            ShowSysTips(TipsTab[Sys.language].imported);
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab[Sys.language].importing);
            for i = 0,24,1 do--依次导出文件"0"~"24"
                ConfigFileCopy( UsbPath.."config/"..i, i);--将Sd卡中的配置文件导入都系统
            end
            on_init();
            Sys.hand_control_func = nil;
            SystemStop(stopByNormal);
            ShowSysTips(TipsTab[Sys.language].imported);
        else
            ShowSysTips(TipsTab[Sys.language].insertSdUsb);
        end;
    --导出按钮----------------------------------------------------------------------
    elseif control == ExportBtId then --(将流程配置导出到SD卡中)
        if SdPath  ~= nil then
            ShowSysTips(TipsTab[Sys.language].exporting);
            for i = 0,24,1 do--依次导出文件"0"~"24"
                ConfigFileCopy(i, SdPath.."config/"..i);--将文件导出到config文件中,配置文件名为0~24
            end
            ShowSysTips(TipsTab[Sys.language].exported);
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab[Sys.language].exporting);
            for i = 0,24,1 do--依次导出文件"0"~"24"
                ConfigFileCopy(i, UsbPath.."config/"..i);--将文件导出到config文件中,配置文件名为0~24
            end
            ShowSysTips(TipsTab[Sys.language].exported);
        else
            ShowSysTips(TipsTab[Sys.language].insertSdUsb);
        end;
    --设置分析物----------------------------------------------------------------------
    elseif control == AnalyteSetId then
        set_text(MAIN_SCREEN, LastAnalyteId, get_text(PROCESS_SET1_SCREEN, AnalyteSetId));
        set_text(PROCESS_SET2_SCREEN,AnalyteSetId, get_text(PROCESS_SET1_SCREEN, AnalyteSetId));
    ------------------------------------------------------------------------
    elseif (control-100) >= ProcessTab[1].typeId and (control-100) <= ProcessTab[24].typeId then --这里是流程类型下的各个按钮
        process_select_set(screen, control-100);
    --量程选择----------------------------------------------------------------------
    elseif (control-100) >= ProcessTab[1].rangeId and (control-100) <= ProcessTab[24].rangeId  then
        range_select_set(screen, control-100);
    --删除按钮----------------------------------------------------------------------
    elseif control >= ProcessTab[1].deleteId and control <= ProcessTab[24].deleteId and value == ENABLE then
        if get_text(screen, control-50) ~= BLANK_SPACE then --名称不为空格
            process_delete_set(screen, control);
        end
     --编辑按钮----------------------------------------------------------------------
    elseif control >= ProcessTab[1].editId and control <= ProcessTab[24].editId and 
          get_text(screen, control+250) ~= BLANK_SPACE and value == ENABLE then
        set_text(PROCESS_EDIT1_SCREEN, AnalyteSetId, get_text(screen, control+150));
        set_text(PROCESS_EDIT2_SCREEN, AnalyteSetId, get_text(screen, control+150));
        ReadActionTag(0);
        change_screen(PROCESS_EDIT1_SCREEN);
    end
end




--[[-----------------------------------------------------------------------------------------------------------------
    流程编辑1/2
--------------------------------------------------------------------------------------------------------------------]]

ProcessSelectButtonId = 35;--位于流程编辑1
ProcesstypeId = 38;      --位于流程编辑1/3都是这个id
ProcessSelectTipsTextId = 21;--用于显示提示信息的文本框,流程编辑1/3界面中都是这个id
ProcessSaveId = 19;
--这里注意观察动作选择id,动作名称id,编辑id之间的数学转换关系:typeId = nameId + 100; nameId = editId + 100
--其中[1]-[12]中包含的id控件在流程编辑1界面中,[13]-[24]中包含的id控件在流程编辑2界面中
TabAction = {
    [1 ] = {typeId = 301, nameId = 201, insertId = 501 ,deleteId = 601 , editId = 101},
    [2 ] = {typeId = 302, nameId = 202, insertId = 502 ,deleteId = 602 , editId = 102},
    [3 ] = {typeId = 303, nameId = 203, insertId = 503 ,deleteId = 603 , editId = 103},
    [4 ] = {typeId = 304, nameId = 204, insertId = 504 ,deleteId = 604 , editId = 104},
    [5 ] = {typeId = 305, nameId = 205, insertId = 505 ,deleteId = 605 , editId = 105},
    [6 ] = {typeId = 306, nameId = 206, insertId = 506 ,deleteId = 606 , editId = 106},
    [7 ] = {typeId = 307, nameId = 207, insertId = 507 ,deleteId = 607 , editId = 107},
    [8 ] = {typeId = 308, nameId = 208, insertId = 508 ,deleteId = 608 , editId = 108},
    [9 ] = {typeId = 309, nameId = 209, insertId = 509 ,deleteId = 609 , editId = 109},
    [10] = {typeId = 310, nameId = 210, insertId = 510 ,deleteId = 610 , editId = 110},
    [11] = {typeId = 311, nameId = 211, insertId = 511 ,deleteId = 611 , editId = 111},
    [12] = {typeId = 312, nameId = 212, insertId = 512 ,deleteId = 612 , editId = 112},
    [13] = {typeId = 313, nameId = 213, insertId = 513 ,deleteId = 613 , editId = 113},
    [14] = {typeId = 314, nameId = 214, insertId = 514 ,deleteId = 614 , editId = 114},
    [15] = {typeId = 315, nameId = 215, insertId = 515 ,deleteId = 615 , editId = 115},
    [16] = {typeId = 316, nameId = 216, insertId = 516 ,deleteId = 616 , editId = 116},
    [17] = {typeId = 317, nameId = 217, insertId = 517 ,deleteId = 617 , editId = 117},
    [18] = {typeId = 318, nameId = 218, insertId = 518 ,deleteId = 618 , editId = 118},
    [19] = {typeId = 319, nameId = 219, insertId = 519 ,deleteId = 619 , editId = 119},
    [20] = {typeId = 320, nameId = 220, insertId = 520 ,deleteId = 620 , editId = 120},
    [21] = {typeId = 321, nameId = 221, insertId = 521 ,deleteId = 621 , editId = 121},
    [22] = {typeId = 322, nameId = 222, insertId = 522 ,deleteId = 622 , editId = 122},
    [23] = {typeId = 323, nameId = 223, insertId = 523 ,deleteId = 623 , editId = 123},
    [24] = {typeId = 324, nameId = 224, insertId = 524 ,deleteId = 624 , editId = 124},
};

--设置编辑按钮对应的跳转界面
--para:获取对应的动作类型名称
--screen: 当前屏幕的id, 子界面按"确认" ,"返回" 按钮后需要返回的界面
--control:"编辑"按钮的id号
function set_edit_screen(para, screen, control)

    ReadActionTag(control-100);--在流程编辑1界面, 当编辑按钮id号为101时, 当前动作序号为1, 依次类推
    set_screen_actionNumber(screen, control-100);

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
function process_edit1_control_notify(screen,control,value)

    if control == ProcessSaveBtId and get_value(screen,control) == ENABLE then -- 保存
        if string.len(get_text(PROCESS_EDIT1_SCREEN, ProcesstypeId)) == 0  then
            set_visiable(PROCESS_EDIT1_SCREEN, ProcessSelectTipsTextId, 1);--显示提示信息
        else
            set_visiable(PROCESS_EDIT1_SCREEN, ProcessSelectTipsTextId, 0);--隐藏提示信息
            --手动保存当前正在编辑的流程
            WriteCfgToFlash();
        end
    elseif control == ProcessSelectButtonId then--当点击流程选择按钮时,
        if get_text(PROCESS_EDIT1_SCREEN, ProcesstypeId) ~= BLANK_SPACE then
            process_name_select_set(PROCESS_EDIT1_SCREEN, ProcesstypeId);--设置流程名称选择界面中按确认/返回按钮后,返回流程编辑1界面
        else

        end
    elseif control == ProcesstypeId then

    elseif (control-100) >= TabAction[1].typeId and (control-100) <= TabAction[12].typeId then--当点击"动作类型"下面的按钮时
        action_select_set(PROCESS_EDIT1_SCREEN, control-100, control-400);
    elseif control >= TabAction[1].editId and control <= TabAction[12].editId then--当点击"编辑"按钮时
        if get_value(screen,control) == ENABLE then
            if get_text(PROCESS_EDIT1_SCREEN, control+200) ~= BLANK_SPACE then--如果设置了动作类型,(编辑按钮的id+200等于动作名称id)
                set_edit_screen(get_text(PROCESS_EDIT1_SCREEN, control+200), PROCESS_EDIT1_SCREEN, control);--control+200表示对应的"动作类型"id
            end
        end
    elseif control >= TabAction[1].insertId and control <= TabAction[12].insertId then--当点击插入按钮时
        if get_value(screen,control) == ENABLE then
            InsertAction(control - 500);
        end
    elseif control >= TabAction[1].deleteId and control <= TabAction[12].deleteId then--当点击删除按钮时
        if get_value(screen,control) == ENABLE then
            DeleteAction(control - 600);
        end
    end
end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_edit2_control_notify(screen,control,value)

    if control == ProcessSaveBtId and get_value(screen,control) == ENABLE then -- 保存
        if string.len(get_text(PROCESS_EDIT2_SCREEN, ProcesstypeId)) == 0 then
            set_visiable(PROCESS_EDIT2_SCREEN, ProcessSelectTipsTextId, 1);--显示提示信息
        else
            set_visiable(PROCESS_EDIT2_SCREEN, ProcessSelectTipsTextId, 0);--隐藏提示信息
            --手动保存当前正在编辑的流程
            WriteCfgToFlash();
        end
    elseif (control-100) >= TabAction[13].typeId and (control-100) <= TabAction[24].typeId then--当点击"动作类型"下面的按钮时
        action_select_set(PROCESS_EDIT2_SCREEN, control-100, control-400);
    elseif control >= TabAction[13].editId and control <= TabAction[24].editId then--当点击"编辑"按钮时
        if get_text(PROCESS_EDIT2_SCREEN, control+100) ~= BLANK_SPACE and get_value(screen,control) == ENABLE then--如果设置了动?髅???编辑按钮的id+100等于动作名称id)
            set_edit_screen(get_text(PROCESS_EDIT2_SCREEN, control+200), PROCESS_EDIT2_SCREEN, control);--control+200表示对应的"动作类型"id
        end
    elseif control >= TabAction[13].insertId and control <= TabAction[24].insertId then--当点击插入按钮时
        if get_value(screen,control) == ENABLE then
            InsertAction(control - 500);
        end
    elseif control >= TabAction[13].deleteId and control <= TabAction[24].deleteId then--当点击删除按钮时
        if get_value(screen,control) == ENABLE then
            DeleteAction(control - 600);
        end
    end
end

--当画面切换到流程编辑1时，执行此回调函数
function goto_ProcessSet2()
    set_visiable(PROCESS_EDIT1_SCREEN, ProcessSelectTipsTextId, 0);--隐藏提示信息
end

--当画面切换到流程编辑2时，执行此回调函数
function goto_ProcessSet3()
    set_visiable(PROCESS_EDIT2_SCREEN, ProcessSelectTipsTextId, 0);--隐藏提示信息
    set_text(PROCESS_EDIT2_SCREEN, ProcesstypeId, get_text(PROCESS_EDIT1_SCREEN,ProcesstypeId));
end

--***********************************************************************************************
--当在流程编辑1/3界面上点击"插入"按钮时, 且此时当前行的"动作类型"不为空时,会调用该函数
--该函数实现表格的"插入"功能, 实际上就是修改配置文件,然后再读取
--***********************************************************************************************
function InsertAction(actionNumber)
    --将当前行插入的行设置为空格显示
    if actionNumber >= 1 and actionNumber <= 12 then
        for i = 24, 14, -1 do--
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i-1].typeId));
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i-1].nameId));
        end
        set_text(PROCESS_EDIT2_SCREEN, TabAction[13].typeId, get_text(PROCESS_EDIT1_SCREEN, TabAction[12].typeId));
        set_text(PROCESS_EDIT2_SCREEN, TabAction[13].nameId, get_text(PROCESS_EDIT1_SCREEN, TabAction[12].nameId));
        for i = 12, actionNumber+1, -1 do--
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT1_SCREEN, TabAction[i-1].typeId));
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT1_SCREEN, TabAction[i-1].nameId));
        end
        set_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--将当前行显示为空格
        set_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    else
        for i = 24, actionNumber+1, -1 do--
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i-1].typeId));
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i-1].nameId));
        end
        set_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--当前行显示为空格
        set_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    end

    ChangeActionFileTag(actionNumber, 1);
end

--***********************************************************************************************
--当在流程编辑1/3界面上点击"删除"按钮时, 且此时当前行的"动作类型"不为空时,会调用该函数
--该函数实现表格的"删除"功能, 实际上就是修改配置文件,然后再读取
--***********************************************************************************************
function DeleteAction(actionNumber)
    if actionNumber >= 1 and actionNumber <= 12 then
        for i = actionNumber, 12, 1 do--
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT1_SCREEN, TabAction[i+1].typeId));
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT1_SCREEN, TabAction[i+1].nameId));
        end
        set_text(PROCESS_EDIT1_SCREEN, TabAction[12].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[13].typeId));
        set_text(PROCESS_EDIT1_SCREEN, TabAction[12].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[13].nameId));
        for i = 13, 23, 1 do
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i+1].typeId));
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i+1].nameId));
        end
        set_text(PROCESS_EDIT2_SCREEN, TabAction[24].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT2_SCREEN, TabAction[24].nameId, BLANK_SPACE);
    else
        for i = actionNumber, 23, 1 do
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i+1].typeId));
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i+1].nameId));
        end
        set_text(PROCESS_EDIT2_SCREEN, TabAction[24].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT2_SCREEN, TabAction[24].nameId, BLANK_SPACE);
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
    if control == SureButtonId  and get_value(screen,control)==ENABLE then --确认按钮
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
INJECT_BtEndId = 3; --注射泵界面中按钮结束id

INJECT_TextStartId = 4;--取样界面中文本开始id
INJECT_TextEndId = 11; --取样界面中文本结束id

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_inject_control_notify(screen,control,value)
    if control == SureButtonId  then --确认按钮
        if get_value(screen,control) == ENABLE then--确认按钮为瞬变按钮,会连续两次调用该函数,增加该判断屏蔽第二次的重复操作
            WriteActionFile(DestActionNum);
            change_screen(DestScreen);
        end
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
            Sys.injectSpeed = tonumber(paraTab[4]);
            Sys.injectScale = tonumber(paraTab[5]) * 10;
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
            Sys.waitTime = tonumber(paraTab[9]);
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
INJECT_ADD_BtEndId = 41;
INJECT_ADD_TextStartId = 42;
INJECT_ADD_TextEndId = 62;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_inject_add_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        if get_value(screen,control) == ENABLE then--确认按钮为瞬变按钮,会连续两次调用该函数,增加该判断屏蔽第二次的重复操作
            WriteActionFile(DestActionNum);
            change_screen(DestScreen);
        end
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
            control_valco( tonumber(paraTab[42]) );--通道号
            start_wait_time( tonumber(paraTab[43]) );
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(开阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+9];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = tonumber(paraTab[44]);--等待时间
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
            Sys.injectSpeed = tonumber(paraTab[45]);
            Sys.injectScale = tonumber(paraTab[46]) * 10;
            Sys.waitTime = tonumber(paraTab[47]);
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        elseif paraTab[4] == ENABLE_STRING then
            Sys.injectSpeed = tonumber(paraTab[48]);
            Sys.injectScale = tonumber(paraTab[49]) * 10;
            Sys.waitTime = tonumber(paraTab[50]);
            -- Sys.driverStep1Func = ;
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 5 then
        if paraTab[5] == ENABLE_STRING then--判断是否需要对十通阀操作
            control_valco( tonumber(paraTab[52]) );--id为63的控件为通道号
            start_wait_time( tonumber(paraTab[53]) );
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(关阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+9];
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
                Sys.valveIdTab[i] = paraTab[i+25];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = tonumber(paraTab[54]);
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
            Sys.injectSpeed = tonumber(paraTab[55]);
            Sys.injectScale = tonumber(paraTab[56]) * 10;
            Sys.waitTime = tonumber(paraTab[57]);
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        elseif paraTab[7] == ENABLE_STRING then
            Sys.injectId = 2;
            Sys.injectSpeed = tonumber(paraTab[58]);
            Sys.injectScale = tonumber(paraTab[59]) * 10;
            Sys.waitTime = tonumber(paraTab[60]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 11 then
        if paraTab[6] == ENABLE_STRING then--判断是否需要对输出2进行(关阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+25];
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
    elseif Sys.actionSubStep == 13 then--判断该步骤用了多少试剂
        if paraTab[9] == ENABLE_STRING and Sys.reagentTotal ~= 0 then
            local index = tonumber(paraTab[62])
            local reagentRemain = tonumber(get_text(HAND_OPERATE3_SCREEN,ReagentTab[index].remainId));
            reagentRemain = reagentRemain - tonumber(paraTab[61]);
            if reagentRemain < 0 then
                reagentRemain = 0;
            end
            print("消耗试剂"..index..":"..reagentRemain.."mL");
            set_text(HAND_OPERATE3_SCREEN,ReagentTab[index].remainId, reagentRemain);--更新界面上的试剂余量显示
            WriteProcessFile(5);--保存试剂余量界面的数据到配置文件
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 14 then--结束
        Sys.actionSubStep = FINISHED;
    end
    
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程设置-蠕动泵加液
--------------------------------------------------------------------------------------------------------------------]]


PERISTALTIC_BtStartId = 1;
PERISTALTIC_BtEndId = 22;
PERISTALTIC_TextStartId = 23;
PERISTALTIC_TextEndId = 39;


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_peristaltic_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        if get_value(screen,control) == ENABLE then--确认按钮为瞬变按钮,会连续两次调用该函数,增加该判断屏蔽第二次的重复操作
            WriteActionFile(DestActionNum);
            change_screen(DestScreen);
        end
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
                Sys.valveIdTab[i] = paraTab[i+6];
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
                Sys.valveIdTab[i] = paraTab[i+6];
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
        if get_value(screen,control) == ENABLE then--确认按钮为瞬变按钮,会连续两次调用该函数,增加该判断屏蔽第二次的重复操作
            WriteActionFile(DestActionNum);
            change_screen(DestScreen);
        end
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
ReadSignal_TextEndId = 5;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_read_signal_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        if get_value(screen,control) == ENABLE then--确认按钮为瞬变按钮,会连续两次调用该函数,增加该判断屏蔽第二次的重复操作
            WriteActionFile(DestActionNum);
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--在测量E1, E2时,用于定时最小时间与最大时间
--time_s
--***********************************************************************************************
function start_e_wait_time(time_s)
    if time_s == 0 then
        return;
    end
    Sys.eWaitTimeFlag = SET;
    start_timer(4, time_s * 1000, 1, 1); --开启定时器4，超时时间 wait_time, 1->使用倒计时方式,1->表示只执行一次
end

--***********************************************************************************************
--  执行读取信号流程
--***********************************************************************************************
function excute_read_signal_process(paraTab)
    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--串口锁定，直接返回
        return;
    end
    start_wait_time(1);
    -----------------------------------------------------------
    if Sys.actionSubStep == 1 then
        -- Sys.flag_save_uart_log = DISABLE;--关闭串口通信日志记录功能(获取电位时会连续不断的获取)
        Sys.signalDrift = tonumber(paraTab[2]);--信号漂移
        Sys.signalMinTime = tonumber(paraTab[3]);--最小时间
        Sys.signalMaxTime = tonumber(paraTab[4]);--最大时间
        Sys.signalNumber = tonumber(paraTab[5]);--取样个数
        start_e_wait_time(Sys.signalMinTime);--等待最小的定时器时间
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        on_uart_send_data(uartSendTab.getVoltage, NEED_REPLY);--通过串口读取信号
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 3 then--解析串口信号
        if Sys.eWaitTimeFlag == RESET then  --最小定时时间到,跳转下一步读取信号
            if Sys.signalMaxTime < Sys.signalMinTime then
                Sys.signalMaxTime = Sys.signalMinTime;
            end
            start_e_wait_time(Sys.signalMaxTime - Sys.signalMinTime) --开启定时器,用于定时最大定时时间
            Sys.signalCount = 0;
            Sys.actionSubStep = Sys.actionSubStep + 1;
        else 
            if UartArg.reply_sta ~= SEND_OK or UartArg.recv_data[2] ~= 0x02 then
                Sys.actionSubStep = Sys.actionSubStep - 1;--不满足条件,执行上一步,继续读取电压信号
                return;
            end
            local signalE = (UartArg.recv_data[3] * 256 + UartArg.recv_data[4]) / 10;--获取的信号值需要除以10才是实际值
            --将获取的电压实时显示在首页当中
            if paraTab[1] == "E1" then
                set_text(MAIN_SCREEN, LastResultE1Id, signalE);
            else
                set_text(MAIN_SCREEN, LastResultE2Id, signalE);
            end
            Sys.actionSubStep = Sys.actionSubStep-1;--跳转第二步继续读取信号
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        on_uart_send_data(uartSendTab.getVoltage, NEED_REPLY);--通过串口读取信号
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 5  then--解析串口数据, 并判断是否满足信号漂移要求
        if UartArg.reply_sta ~= SEND_OK or UartArg.recv_data[2] ~= 0x02 then
            Sys.actionSubStep = Sys.actionSubStep - 1;--不满足条件,执行上一步,继续读取电压信号
            return;
        end

        local signalE = (UartArg.recv_data[3] * 256 + UartArg.recv_data[4]) / 10;--获取的信号值需要除以10才是实际值
        --将获取的电压实时显示在首页当中
        if paraTab[1] == "E1" then
            set_text(MAIN_SCREEN, LastResultE1Id, signalE);
        else
            set_text(MAIN_SCREEN, LastResultE2Id, signalE);
        end
        
        Sys.signalTab[ math.fmod(Sys.signalCount, Sys.signalNumber) ] = signalE;--将电压信号保存到数组中
        Sys.signalCount = Sys.signalCount + 1;
        
        if Sys.signalCount >= Sys.signalNumber then--已经获取到足够的信号（取样数）
            local tempMax,tempMin,maxSignal,minSignal;
            tempMax = Sys.signalTab[0];
            tempMin = Sys.signalTab[0];
            for i = 1, (Sys.signalNumber-1) ,1 do
                tempMax = math.max(tempMax, Sys.signalTab[i]);
                tempMin = math.min(tempMin, Sys.signalTab[i]);
            end
            maxSignal = tempMax;--获取最大值
            minSignal = tempMin;--获取最小值
            
            --满足信号漂移条件 或者 最大定时时间到
            if (maxSignal - minSignal <= Sys.signalDrift) or Sys.eWaitTimeFlag == RESET  then
                local signalSum = 0;
                for i = 0, Sys.signalNumber-1, 1 do
                    signalSum = signalSum + Sys.signalTab[i];
                end
                signalE = (signalSum - maxSignal - minSignal) / (Sys.signalNumber - 2);--减去Sys.signalTab中的最大值与最小值后取平均值
                
                if paraTab[1] == "E1" then
                    Sys.signalE1 = signalE;
                    Sys.signalE1 = GetPreciseDecimal(Sys.signalE1, 1);--保留小数点后1位
                    set_text(MAIN_SCREEN, LastResultE1Id, signalE);
                    print("E1=",signalE);
                else
                    Sys.signalE2 = signalE;
                    Sys.signalE2 = GetPreciseDecimal(Sys.signalE2, 1);--保留小数点后1位
                    set_text(MAIN_SCREEN, LastResultE2Id, signalE);
                    print("E2=",signalE);
                end
                Sys.eWaitTimeFlag = RESET;
                stop_timer(4); --关闭定时器4
                Sys.actionSubStep = Sys.actionSubStep + 1;--满足条件,跳转下一步结束采集
            else
                Sys.actionSubStep = Sys.actionSubStep - 1;--不满足条件,执行上一步,继续读取电压信号
            end
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        -- Sys.flag_save_uart_log = ENABLE;--打开串口通信日志记录功能
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
CALCULATE_TextEndId = 13;

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_calculate_control_notify(screen,control,value)
    if control == SureButtonId then --确认按钮
        if get_value(screen,control) == ENABLE then--确认按钮为瞬变按钮,会连续两次调用该函数,增加该判断屏蔽第二次的重复操作
            WriteActionFile(DestActionNum);
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  执行计算流程
--***********************************************************************************************
function excute_calculate_process(paraTab)
    Sys.calculateWay = paraTab[10];
    Sys.calculateType = paraTab[12];
    Sys.calibrationValue = tonumber(paraTab[13]);
    Sys.resultTime = Sys.dateTime;--获取当前时间
    if Sys.calculateType == CalcType[Sys.language][1] then--当前计算为分析
        calc_analysis_result(Sys.calculateWay);
        if paraTab[1] == ENABLE_STRING then--结果线性补偿
            Sys.result = tonumber(paraTab[4]) * Sys.result + tonumber(paraTab[5]);
        end
        if paraTab[2] == ENABLE_STRING then--是否需要进行报警
            if Sys.result > paraTab[9] then
                Sys.alarmContent = SysLog[Sys.language].highDensity;
            elseif Sys.result <paraTab[8] then
                Sys.alarmContent = SysLog[Sys.language].lowDensity;
            end
            add_history_record(HISTORY_ALARM_SCREEN);
        end
        print("分析结果 =",Sys.result);
    elseif Sys.calculateType == CalcType[Sys.language][2] then--当前计算为校正1
        Sys.caliE1[1] = Sys.signalE1;
        Sys.caliE2[1] = Sys.signalE2;
        Sys.caliValue[1] = Sys.calibrationValue;
        print("校正1：E1=",Sys.caliE1[1],",E2=",Sys.caliE2[1]);
    elseif Sys.calculateType == CalcType[Sys.language][3] then--当前计算为校正2
        Sys.caliE1[2] = Sys.signalE1;
        Sys.caliE2[2] = Sys.signalE2;
        Sys.caliValue[2] = Sys.calibrationValue;
        print("校正2：E1=",Sys.caliE1[2],",E2=",Sys.caliE2[2]);
        if Sys.calculateWay == CalcWay[Sys.language].log then--如果是取对数方式，则在校正2时就计算结果
            calc_calibrate_result_by_log();
        elseif Sys.calculateWay == CalcWay[Sys.language].diff and paraTab[11] == CalcOrder[Sys.language].First then
            calc_calibrate_result_by_diff(2);--通过行列式与克莱姆法则自动算出c,d的值
        end
    elseif Sys.calculateType == CalcType[Sys.language][4] then--当前计算为校正3
        Sys.caliE1[3] = Sys.signalE1;
        Sys.caliE2[3] = Sys.signalE2;
        Sys.caliValue[3] = Sys.calibrationValue;
        if Sys.calculateWay == CalcWay[Sys.language].diff and paraTab[11] == CalcOrder[Sys.language].Second then
            calc_calibrate_result_by_diff(3);--通过行列式与克莱姆法则自动算出b,c,d的值
        end
        print("校正3：E1=",Sys.caliE1[3],",E2=",Sys.caliE2[3]);
    elseif Sys.calculateType == CalcType[Sys.language][5] then--当前计算为校正4
        Sys.caliE1[4] = Sys.signalE1;
        Sys.caliE2[4] = Sys.signalE2;
        Sys.caliValue[4] = Sys.calibrationValue;
        calc_calibrate_result_by_diff(4);--通过行列式与克莱姆法则自动算出a,b,c,d的值
        print("校正4：E1=",Sys.caliE1[4],",E2=",Sys.caliE2[4]);
    end

    if paraTab[3] == ENABLE_STRING then--是否需要保存历史记录
        if Sys.calculateType == CalcType[Sys.language][1] then--当前计算为分析
            add_history_record(HISTORY_ANALYSIS_SCREEN);
        else
            add_history_record(HISTORY_CALIBRATION_SCREEN);--当前计算为校准
        end
    end

    --在主界面进行显示结果与结果时间
    if Sys.calculateType == CalcType[Sys.language][1] then--当前计算为分析
        set_text(MAIN_SCREEN, LastResultId, Sys.result);
    else
        set_text(MAIN_SCREEN, LastResultId, Sys.calibrationValue);
    end
    local resultTime = string.format("%d-%02d-%02d %02d:%02d",Sys.resultTime.year,Sys.resultTime.mon,Sys.resultTime.day,
                                                               Sys.resultTime.hour,Sys.resultTime.min);
    set_text(MAIN_SCREEN, LastResultTimeId, resultTime);
    print("执行完成计算流程");
    return FINISHED;
end

--***********************************************************************************************
--  克莱姆法则计算a,b,c,d的值时,会用到该函数
--  n表示为四元一次方程(求a,b,c,d),还是三元一次方程(求b,c,d,a等于0)
--***********************************************************************************************
function term (n, k, x)
    local p,q,t = 1,1,1;

    for p = 1, n-1, 1 do
        for q = 0, p-1, 1 do
            if k[q] > k[p] then
                t = -t;
            end
        end
    end
    for p = 0, n-1, 1 do
        t = t * x[p][k[p]];
    end
    return (t);
end

--***********************************************************************************************
--  克莱姆法则计算a,b,c,d的值时,会用到该函数
--  n表示为四元一次方程(求a,b,c,d),还是三元一次方程(求b,c,d,a等于0)
--***********************************************************************************************
function det(n, x)
    local j0, j1, j2, j3, j4, j5, j6, d;
    local k = {};
    d = 0;
    for j0 = 0, n-1, 1 do
        if(x[0][j0] == 0)  then goto for0_ctn end;
        k[0] = j0;
        for j1 = 0, n-1, 1 do
            if(j1 == j0 or x[1][j1] == 0) then goto for1_ctn end;

            k[1] = j1;
            if(n == 2) then d = d + term(n, k, x); end
            for j2 = 0, n-1, 1 do
                if(j2 == j0 or j2 == j1 or x[2][j2] == 0) then goto for2_ctn end;
                k[2] = j2;
                if(n == 3) then d = d + term(n, k, x); end
                for j3 = 0, n-1, 1 do
                    if(j3 == j0 or j3 == j1 or j3 == j2 or x[3][j3] == 0) then goto for3_ctn; end
                    k[3] = j3;
                    d = d + term(n, k, x);
                    ::for3_ctn:: ;
                end
                ::for2_ctn:: ;
            end
            ::for1_ctn:: ;
        end
        ::for0_ctn:: ;
    end
    return (d);
end


--***********************************************************************************************
--  通过对数方式计算校正结果
--***********************************************************************************************
function calc_calibrate_result_by_log(void)
    local a,b,c,d;

    --以下模拟数据 c = 2706.5566，d = -81.1261； 
    -- Sys.caliE1[1] = 4351.5;
    -- Sys.caliE2[1] = 4061.3;
    -- Sys.caliValue[1] = 0;

    -- Sys.caliE1[2] = 4345.7;
    -- Sys.caliE2[2] = 3421.3;
    -- Sys.caliValue[2] = 200;

    a = 0;
    b = 0;
    print( math.log(Sys.caliE1[1]/Sys.caliE2[1],10) );
    print( math.log(Sys.caliE1[2]/Sys.caliE2[2],10) )
    c = (Sys.caliValue[2] - Sys.caliValue[1]) / ( math.log(Sys.caliE1[2]/Sys.caliE2[2],10) - math.log(Sys.caliE1[1]/Sys.caliE2[1],10) );
    d = Sys.caliValue[2] - c * math.log(Sys.caliE1[2]/Sys.caliE2[2],10);
    print("c=",c,",d=",d)
    --设置计算出的a,b,c,d结果
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId, a);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId, b);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId, c);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId, d);
    WriteProcessFile(3);--保存量程设置界面的参数
end

--***********************************************************************************************
--  通过差值方式计算校正结果
--***********************************************************************************************
function calc_calibrate_result_by_diff(n)
    local diff0,diff1,diff2,diff3,detV;-- = Sys.caliE1[1] - Sys.caliE2[1];
    local x,y,detVs = {},{},{};
    for i = 0,3,1 do
        x[i] = {};
        y[i] = {};
    end
    diff0 = Sys.caliE1[1] - Sys.caliE2[1];
    diff1 = Sys.caliE1[2] - Sys.caliE2[2];
    diff2 = Sys.caliE1[3] - Sys.caliE2[3];
    diff3 = Sys.caliE1[4] - Sys.caliE2[4];

    --以下注释为模拟数据,得出的结果应该为a = 0.8333 b=0 c=-0.83333 d = 10.0
    -- n = 4;
    -- local diff0 = 1;
    -- local diff1 = 2;
    -- local diff2 = 3;
    -- local diff3 = 4;
    -- Sys.caliValue[1] = 10;
    -- Sys.caliValue[2] = 15;
    -- Sys.caliValue[3] = 30;
    -- Sys.caliValue[4] = 60;

    if n == 4 then 
        x[0][0] = diff0*diff0*diff0; x[0][1] = diff0*diff0; x[0][2] = diff0; x[0][3] = 1; y[0] = Sys.caliValue[1];
        x[1][0] = diff1*diff1*diff1; x[1][1] = diff1*diff1; x[1][2] = diff1; x[1][3] = 1; y[1] = Sys.caliValue[2];
        x[2][0] = diff2*diff2*diff2; x[2][1] = diff2*diff2; x[2][2] = diff2; x[2][3] = 1; y[2] = Sys.caliValue[3];
        x[3][0] = diff3*diff3*diff3; x[3][1] = diff3*diff3; x[3][2] = diff3; x[3][3] = 1; y[3] = Sys.caliValue[4];
    elseif n == 3 then
        x[0][0] = diff0*diff0; x[0][1] = diff0; x[0][2] = 1; y[0] = Sys.caliValue[1];
        x[1][0] = diff1*diff1; x[1][1] = diff1; x[1][2] = 1; y[1] = Sys.caliValue[2];
        x[2][0] = diff2*diff2; x[2][1] = diff2; x[2][2] = 1; y[2] = Sys.caliValue[3];
    elseif n == 2 then
        x[0][0] = diff0; x[0][1] = 1; y[0] = Sys.caliValue[1];
        x[1][0] = diff1; x[1][1] = 1; y[1] = Sys.caliValue[2];
    end
    local detV = det(n,x);
--   print("D = "..detV);

    for j = 0, n-1, 1 do
        for i = 0, n-1, 1 do
            temp[i] = x[i][j];
            x[i][j] = y[i];
        end
        detVs[j] = det(n,x);
--        print("D"..j.."="..detVs[j]);
        for i = 0, n-1, 1 do
            x[i][j] = temp[i];
        end
    end

    local a,b,c,d
    if n == 2 then
        a = 0;
        b = 0;
        c = detVs[0] / detV;
        d = detVs[1] / detV;
    elseif n == 3 then
        a = 0;
        b = detVs[0] / detV;
        c = detVs[1] / detV;
        d = detVs[2] / detV;
    elseif n == 4 then
        a = detVs[0] / detV;
        b = detVs[1] / detV;
        c = detVs[2] / detV;
        d = detVs[3] / detV;
    end
    
    --设置计算出的a,b,c,d结果
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId, a);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId, b);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId, c);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId, d);
    print("a="..a..",b="..b..",c="..c..",d="..d);
    WriteProcessFile(3);--保存量程设置界面的参数
end

--***********************************************************************************************
--  计算分析结果
--type：对数方式或者差值方式
--***********************************************************************************************
function calc_analysis_result(type)
    local x,a,b,c,d = 0;

    --以下模拟数据采用对数方式，结果为73.272
    -- Sys.signalE1 = 4278.91;
    -- Sys.signalE2 = 3752.21;

    if type == CalcWay[Sys.language].log then--取对数方式
        x = math.log(Sys.signalE1/Sys.signalE2,10);
        print("对数方式，x=",x);
    else
        x = Sys.signalE1 - Sys.signalE2;
    end

    a = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId));
    b = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId));
    c = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId));
    d = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId));
    print(string.format( "a=%f,b=%f,c=%f,d=%f",a,b,c,d));
    Sys.result = a*(x^3) + b*(x^2) + c*x + d;
    Sys.result = GetPreciseDecimal(Sys.result, 4);--保留小数点后四位
    set_text(MAIN_SCREEN, LastResultId, Sys.result);--在主界面显示结果
end

--- nNum 源数字
--- n 小数位数
function GetPreciseDecimal(nNum, n)
    if type(nNum) ~= "number" then
        return nNum;
    end
    n = n or 0;
    n = math.floor(n)
    if n < 0 then
        n = 0;
    end
    local nDecimal = 10 ^ n
    local nTemp = math.floor(nNum * nDecimal);
    local nRet = nTemp / nDecimal;
    return nRet;
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
        if get_value(screen,control) == ENABLE then--确认按钮为瞬变按钮,会连续两次调用该函数,增加该判断屏蔽第二次的重复操作
            WriteActionFile(DestActionNum);
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  执行阀操作流程
--***********************************************************************************************
function excute_valve_ctrl_process(paraTab)

    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--串口锁定或者正在等待超时.
        return;
    end
    -----------------------------------------------------------
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--判断是否需要对十通阀操作
            control_valco( tonumber(paraTab[19]) );--id为23的控件为通道号
            start_wait_time( tonumber(paraTab[20]) );
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--判断是否需要对输出进行操作
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(开阀)操作
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+2];
            end
            Sys.valveOperate = paraTab[22];
            Sys.waitTime = tonumber(paraTab[21]);--等待时间
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 3 then--判断是否需要对输出进行操作
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(开阀)操作
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 4 then--结束
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
        if get_value(screen,control) == ENABLE then--确认按钮为瞬变按钮,会连续两次调用该函数,增加该判断屏蔽第二次的重复操作
            WriteActionFile(DestActionNum);
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  执行等待时间流程
--***********************************************************************************************
function excute_wait_time_process(paraTab)
    if Sys.actionSubStep == 1 then
        start_wait_time(tonumber(paraTab[1]));
        Sys.actionSubStep = Sys.actionSubStep + 1;
    elseif Sys.actionSubStep == 2 then
        if Sys.waitTimeFlag == RESET then
            Sys.actionSubStep = FINISHED
        end
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程类型选择
--------------------------------------------------------------------------------------------------------------------]]

AnalysisButtonId = 1;--分析按钮
NullButtonId = 8;--空按钮

ProcessTypeSelectItem = nil;

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_type_select_control_notify(screen, control, value)
	if control >= AnalysisButtonId and control <= NullButtonId then
		ProcessTypeSelectItem = control;
    elseif control == SureButtonId then --确认按钮
        if get_value(screen,control) == ENABLE then--确认按钮为瞬变按钮,会连续两次调用该函数,增加该判断屏蔽第二次的重复操作
            change_screen(DestScreen);
            if ProcessTypeSelectItem ~= nil then
                set_text(DestScreen, DestControl, ProcessItem[Sys.language][ProcessTypeSelectItem]);--DestControl对应流程选择
                if DestScreen == PROCESS_SET1_SCREEN or DestScreen == PROCESS_SET2_SCREEN then
                    set_text(DestScreen, DestControl-100, ProcessItem[Sys.language][ProcessTypeSelectItem]..(DestControl-300));--DestControl-100对应流程名称
                end
            end
            WriteProcessFile(1);--保存流程设置1界面中的参数
        end
	elseif control == CancelButtonId then --取消按钮
		change_screen(DestScreen);
	end
end

--[[-----------------------------------------------------------------------------------------------------------------
    流程名称选择
--------------------------------------------------------------------------------------------------------------------]]

FirstButtonId = 101;--第一个按钮
LastButtonId = 125;--最后一个按钮
TipsTextId = 79;--提示文本框

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_name_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_name_select_control_notify(screen,control,value)
    if control >= FirstButtonId and control <= LastButtonId then
        ProcessNameSelecItem = control-100;--control-100 = 与该按钮重合的文本框id
    elseif control == SureButtonId and value == ENABLE then --确认按钮,返回之前的界面
        change_screen(DestScreen);
        if ProcessNameSelecItem ~= nil then --ProcessNameSelecItem默认为nil,如果选择了某个流程则该值不为nil
            set_text(DestScreen, DestControl, get_text(PROCESS_NAME_SELECT_SCREEN, ProcessNameSelecItem));--DestControl对应动作选择
            set_text(DestScreen, DestControl-100, get_text(PROCESS_NAME_SELECT_SCREEN, ProcessNameSelecItem));--DestControl-100
            process_change(DestControl);--流程改变后,通过调用该函数修改流程对应的id号
            WriteProcessFile(2);--2对应<RunCtrl>标签
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--当画面切换时，执行此回调函数，screen为目标画面。
function goto_ProcessNameSelect()
    --将所有按钮进行隐藏
    for i = FirstButtonId, LastButtonId,1 do
        set_visiable(PROCESS_NAME_SELECT_SCREEN, i, 0);
    end
    --将所有与按钮重合的文本框进行隐藏
    for i = FirstButtonId-100, LastButtonId-100,1 do
        set_visiable(PROCESS_NAME_SELECT_SCREEN, i, 0);
    end
    --隐藏提示信息
    set_visiable(PROCESS_NAME_SELECT_SCREEN,TipsTextId,0);
    
    --遍历流程1-12,看是否有设置名称,如果设置了名称,则在流程名称选择界面中进行显示
    --如果是运行控制界面,除了需要判断是否设置了流程名称, 还需要判断该流程是否有对应的配置文件
    NumberOfProcess = 0;

    local processFile = nil;
    for i = 1, 12, 1 do
        if get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId) ~= BLANK_SPACE then--获取名称长度,当名称长度不为0时表示有效
            NumberOfProcess = NumberOfProcess + 1;--个数+1
            set_text(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, get_text(PROCESS_SET1_SCREEN,ProcessTab[i].nameId))--为该文本框设置文本
            set_visiable(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess,  1);--显示id为NumberOfProcess的文本
            set_visiable(PROCESS_NAME_SELECT_SCREEN,100+NumberOfProcess, 1);--显示与该文本框对应的按钮
        end
    end
    for i = 13, 24, 1 do
        if get_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId) ~= BLANK_SPACE then--获取名称长度,当名称长度不为0时表示有效
            NumberOfProcess = NumberOfProcess + 1;--个数+1
            set_text(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, get_text(PROCESS_SET2_SCREEN,ProcessTab[i].nameId))--为该文本框设置文本
            set_visiable(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess,  1);--显示id为NumberOfProcess的文本
            set_visiable(PROCESS_NAME_SELECT_SCREEN,100+NumberOfProcess, 1);--显示与该文本框对应的按钮
        end
    end
    -- 当从运行控制界面跳转过来时,需要额外设置一个为"无"的选项
    if NumberOfProcess ~= 0 and DestScreen == RUN_CONTROL_SCREEN then
        NumberOfProcess = NumberOfProcess + 1;
        set_text(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, BLANK_SPACE)--为该文本框设置内容
        set_visiable(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess,  1);--显示id为NumberOfProcess的文本
        set_visiable(PROCESS_NAME_SELECT_SCREEN, 100 + NumberOfProcess,1);--显示与该文本框对应的按钮
    end

    --显示提示信息
    if NumberOfProcess == 0 then
        set_visiable(PROCESS_NAME_SELECT_SCREEN,TipsTextId, 1);
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
        if get_value(screen,control) == ENABLE then--确认按钮为瞬变按钮,会连续两次调用该函数,增加该判断屏蔽第二次的重复操作
            change_screen(DestScreen);
            if ActionSelectItem ~= nil then
                set_text(DestScreen, DestControl, ActionItem[Sys.language][ActionSelectItem]);--动作选择
                set_text(DestScreen, DestControl-100, ActionItem[Sys.language][ActionSelectItem]);--DestControl-100对应动作名称
            end
            WriteDefaultActionTag(DestActionNum);
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    量程设置
--------------------------------------------------------------------------------------------------------------------]]

--在量程设置/量程选择界面中,量程1/2/3文本的id都是一样的

RANGESET_TextStartId = 1;
RANGESET_TextEndId = 20;

UniteSetTextId = 19--单位设置成功后,用于显示单位文本的id
UniteSetMenuId = 26;--单位选择
RANGESET_AutoTextId = 20;--自动量程设置文本
RangeTab = {
    [1] = {LowId = 1, HighId = 2,   aId = 3,  bId = 4,  cId = 5,  dId = 6},
    [2] = {LowId = 7, HighId = 8,   aId = 9, bId = 10, cId = 11, dId = 12},
    [3] = {LowId = 13,HighId= 14,   aId = 15, bId = 16, cId = 17, dId = 18},
};

--设置单位
function set_unit()
    local Unite = get_text(RANGE_SET_SCREEN, UniteSetTextId);
    --量程设置界面中,控件Id = 300 ~ 302为单位显示文本
    for i = 300,302,1 do 
        set_text(RANGE_SET_SCREEN, i, Unite);
    end
    --首页中,空间Id= 19 为单位显示
    set_text(MAIN_SCREEN,LastResultUnitId, Unite);

    --量程选择界面中,控件Id = 15/20/25为单位显示文本
    set_text(RANGE_SELECT_SCREEN,15 , Unite);
    set_text(RANGE_SELECT_SCREEN,20 , Unite);
    set_text(RANGE_SELECT_SCREEN,25 , Unite);
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function range_set_control_notify(screen,control,value)
    if(control == UniteSetMenuId) and get_value(screen,control) == ENABLE then --设置单位
        set_unit();
    elseif control == 50 and get_value(screen,control) == ENABLE then --保存按钮
        WriteProcessFile(3);
    elseif control >= 1 and control <= 18 then
        if get_text(RANGE_SET_SCREEN,control) == "" then
            set_text(RANGE_SET_SCREEN,control,0);
        end
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
HandOpenValve11BtId = 19;
HandOpenValve12BtId = 20;
HandCloseValve11BtId = 35;
HandCloseValve12BtId = 36;
HandValcoChnlId = 130;
HandValcoCtrlId = 131;
HandInject1ScaleId = 99;
HandInject1SpdId = 103;
HandInject1SendId = 101;
HandInject1WaitTimeId = 3;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function hand_operate1_control_notify(screen, control, value)
    if get_value(screen,control) == DISABLE then--瞬变按钮会调用两次该函数, 增加该判断使得第二次调用后可以立马退出
        return;
    end
    if control == HandOpenValve11BtId then--控制阀11
            on_uart_send_data(uartSendTab.openV11, NO_NEED_REPLY);
    elseif control == HandCloseValve11BtId then
        on_uart_send_data(uartSendTab.closeV11, NO_NEED_REPLY);
    elseif control == HandOpenValve12BtId then--控制阀12
        on_uart_send_data(uartSendTab.openV12, NO_NEED_REPLY);
    elseif control == HandCloseValve12BtId then--控制阀12
        on_uart_send_data(uartSendTab.closeV12, NO_NEED_REPLY);
    elseif control == HandValcoCtrlId then--控制十通阀
        uartSendTab.openValco[2] = tonumber( get_text(screen, HandValcoChnlId) );
        on_uart_send_data(uartSendTab.openValco, NO_NEED_REPLY);
    elseif control == HandInject1SendId  then--控制注射泵
        if Sys.hand_control_func==nil then
            Sys.processStep = 1;
            UartArg.lock = UNLOCKED;
            Sys.hand_control_func = hand_control_inject1;
        else
            set_value(screen, control, DISABLE);
        end
        
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

    if UartArg.reply_sta == SEND_FAIL and Sys.processStep >= 2 then
        Sys.processStep = 4;
        Sys.waitTimeFlag = RESET;
    end

    if Sys.processStep == 1 then--第一步: 使能注射泵
        enable_inject1();
        ShowSysCurrentAction("手动操作-移动注射泵");
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
    elseif Sys.processStep == 4 and Sys.waitTimeFlag == RESET then --第四步:流程结束
        ShowSysCurrentAction(TipsTab[Sys.language].null);
        set_value(HAND_OPERATE1_SCREEN, HandInject1SendId, DISABLE);
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    手动操作2
--------------------------------------------------------------------------------------------------------------------]]
HandGetVoltageId = 74;
HandLedCurrentTextId = 43;
HandSetLedCurrentId = 72;
HandShowVoltageId = 42;
HandLedStatusId = 6;
HandLedCtrlBtId = 3;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function hand_operate2_control_notify(screen,control,value)
    if get_value(screen,control) == DISABLE then--瞬变按钮会调用两次该函数, 增加该判断使得第二次调用后可以立马退出
        return;
    end
    if control == HandGetVoltageId then--获取电压
        if  Sys.hand_control_func == nil then
            Sys.processStep = 1;
            UartArg.lock = UNLOCKED;
            set_enable(screen, control, DISABLE);
            Sys.hand_control_func = hand_get_voltage;
        else
        end
    elseif control == HandSetLedCurrentId  then
        if  Sys.hand_control_func == nil then
            Sys.processStep = 1;
            UartArg.lock = UNLOCKED;
            Sys.hand_control_func = hand_set_led_current;
        else
        end
    elseif control == HandLedCtrlBtId then--控制led灯开关按钮
        if get_text(HAND_OPERATE2_SCREEN, HandLedStatusId) == LedStatus[ Sys.language ].open then--打开
            on_uart_send_data(uartSendTab.openLed, NO_NEED_REPLY);
        else
            on_uart_send_data(uartSendTab.closeLed, NO_NEED_REPLY);
        end
    end
end
--***********************************************************************************************
--手动操作-手动设置电流
--sta: 0-复位; 1-移动到指定位置
--***********************************************************************************************
function hand_set_led_current()
    if UartArg.lock == LOCKED then
        return;
    end
    
    if Sys.processStep == 1 then--第一步: 发送串口指令设置LED电流
        ShowSysCurrentAction("手动操作-设置LED电流");
        local ledCurrentValue = tonumber( get_text(HAND_OPERATE2_SCREEN, HandLedCurrentTextId) );
        ledCurrentValue = ledCurrentValue * 2048 / 50;
        ledCurrentValue = math.floor(ledCurrentValue + 0.5);--四舍五入
        uartSendTab.setLedCurrnet[4] = math.modf( ledCurrentValue / 256 );
        uartSendTab.setLedCurrnet[5] = math.fmod( ledCurrentValue , 256 );
        on_uart_send_data(uartSendTab.setLedCurrnet, NO_NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 2 then--第二步: 解析电压值并进行显示
        set_value(HAND_OPERATE2_SCREEN, HandSetLedCurrentId, DISABLE);
        set_enable(HAND_OPERATE2_SCREEN, HandSetLedCurrentId, ENABLE);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then--第三步:结束
        ShowSysCurrentAction(TipsTab[Sys.language].null);
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end
end
--***********************************************************************************************
--手动操作-手动获取偏置电压
--sta: 0-复位; 1-移动到指定位置
--***********************************************************************************************
function hand_get_voltage()
    if UartArg.lock == LOCKED then
        return;
    end
    
    if Sys.processStep == 1 then--第一步: 发送串口指令获取电压
        ShowSysCurrentAction("手动操作-获取电压");
        on_uart_send_data(uartSendTab.getVoltage, NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 2 then--第二步: 解析电压值并进行显示
        local vol = "time out";
        if UartArg.reply_sta == SEND_OK then
            vol = (UartArg.recv_data[3] * 256 + UartArg.recv_data[4]) / 10;
        end
        set_enable(HAND_OPERATE2_SCREEN, HandGetVoltageId, ENABLE);
        set_value(HAND_OPERATE2_SCREEN, HandGetVoltageId, DISABLE);
        set_text(HAND_OPERATE2_SCREEN, HandShowVoltageId, vol);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then--第三步:结束
        ShowSysCurrentAction(TipsTab[Sys.language].null);
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    手动操作3
--------------------------------------------------------------------------------------------------------------------]]
REAGENT_BtStartId = 1;
REAGENT_BtEndId = 6;
REAGENT_TextStartId = 7;
REAGENT_TexEndId = 30;
REAGENT_SaveId = 45;

ReagentTab = {
    [1] = {BubbleChkId = 1, nameId = 9,  totalId = 7,  remainId = 8,  alarmId = 10},
    [2] = {BubbleChkId = 2, nameId = 13, totalId = 11, remainId = 12, alarmId = 14},
    [3] = {BubbleChkId = 3, nameId = 17, totalId = 15, remainId = 16, alarmId = 18},
    [4] = {BubbleChkId = 4, nameId = 21, totalId = 19, remainId = 20, alarmId = 22},
    [5] = {BubbleChkId = 5, nameId = 25, totalId = 23, remainId = 24, alarmId = 26},
    [6] = {BubbleChkId = 6, nameId = 29, totalId = 27, remainId = 28, alarmId = 30},
}

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function hand_operate3_control_notify(screen,control,value)
    if control == REAGENT_SaveId and get_value(screen,control) == ENABLE then--保存按钮
        WriteProcessFile(5);
    elseif control >=7 and control <= 30 then--试剂判断
        ShowSysAlarm("");
        for i=1,6,1 do
            if tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].remainId)) <= tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].alarmId)) then
                Sys.alarmContent = SysLog[Sys.language].lack..get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].nameId);--初始化报警内容
                ShowSysAlarm(Sys.alarmContent);--在底部状态栏显示报警信息
            end
        end
    end
end




--[[-----------------------------------------------------------------------------------------------------------------
    手动操作4
--------------------------------------------------------------------------------------------------------------------]]
--虽然命名为手动操作4, 其实是通讯记录界面

UartRecordId = 1--串口通讯记录空间id




--[[-----------------------------------------------------------------------------------------------------------------
    输入输出
--------------------------------------------------------------------------------------------------------------------]]
IOSET_TextStartId = 1;
IOSET_TextEndId = 8;
IOSET_ComputerAddr = 1;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function in_out_control_notify(screen,control,value)
    if control >=IOSET_TextStartId and control <= IOSET_TextEndId then
        WriteProcessFile(4);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    分析、校准、报警、日志记录
--------------------------------------------------------------------------------------------------------------------]]
HistoryRecordId = 32;--历史记录控件Id号，分析、校准、报警、日志都是这个。
HistoryClear = 2;
HistoryExport = 1;
MAX_ANALYSIS_HISTORY_NUM = 1200;
MAX_CALIBRARE_HISTORY_NUM = 100;
MAX_ALARM_HISTORY_NUM = 50;
MAX_LOG_HISTORY_NUM = 100;

MAX_ANALYSIS_FILE_NUM = 20000;
MAX_CALIBRARE_FILE_NUM = 2000;
MAX_ALARM_FILE_NUM = 1000;
MAX_LOG_FILE_NUM = 1000;
--***********************************************************************************************
--  添加一条历史记录
-- screen:在哪一个界面的历史记录控件添加内容
--***********************************************************************************************
function add_history_record(screen)
    local date,time;
    if screen == HISTORY_ANALYSIS_SCREEN or screen == HISTORY_CALIBRATION_SCREEN then
        date = string.format("%d%02d%02d",Sys.resultTime.year,Sys.resultTime.mon,Sys.resultTime.day);
        time = string.format("%02d:%02d",Sys.resultTime.hour,Sys.resultTime.min);
    else
        date = string.format("%d%02d%02d",Sys.dateTime.year,Sys.dateTime.mon,Sys.dateTime.day);
        time = string.format("%02d:%02d",Sys.dateTime.hour,Sys.dateTime.min);
    end
    --------------------添加分析记录----------------------------------------
    if screen == HISTORY_ANALYSIS_SCREEN then
        record_count =  record_get_count(screen, HistoryRecordId);--获取记录个数
        if record_count >= MAX_ANALYSIS_HISTORY_NUM then
            record_delete(screen, HistoryRecordId, 0);--删除最旧的一条记录
        end
        record_count = record_count + 1;
        history_content = record_count..";"..date..";"..time..";"..--序号,日期,时间
                  Sys.result..";"..Sys.signalE1..";"..Sys.signalE2..";"..Sys.rangetypeId;--结果/E2/E2/量程
        record_add(screen, HistoryRecordId, history_content);
        
        --添加历史记录到文件当中
        if SdPath ~= nil then
            file_lines,lastContent = getFileLines(SdPath.."AnalysisHistory.txt");--获取文件行数以及最后一行的数据
            if file_lines >= MAX_ANALYSIS_FILE_NUM then
                lastContentTab = split(lastContent, ";");
                record_count = tonumber(lastContentTab[1])+1;--提取该字符串中的序号
                deleteFirstLineInFile(SdPath.."AnalysisHistory.txt");--获取文件中最后一行的数据
            else
                record_count = file_lines+1;
            end
            file_content = record_count..";"..date..";"..time..";"..--序号,日期,时间
                           Sys.result..";"..Sys.signalE1..";"..Sys.signalE2..";"..Sys.rangetypeId;--结果/E2/E2/量程
            historyFile = io.open(SdPath.."AnalysisHistory.txt", "a+") --以可读可写的方式打开文本,且写入数据为末尾追加模式.
            if historyFile ~= nil then
                historyFile:write(file_content.."\n");--添加一行历史记录
                historyFile:close()                        --关闭文本
            else
                ShowSysTips("未检测到SD卡,分析结果未存入文件");
            end
        end
    -------------------添加校准记录-----------------------------------------------
    elseif screen == HISTORY_CALIBRATION_SCREEN then
        record_count =  record_get_count(screen, HistoryRecordId);
        if record_count >= MAX_CALIBRARE_HISTORY_NUM then
            record_delete(screen, HistoryRecordId, 0);--删除最旧的一条记录
            record_count = MAX_CALIBRARE_HISTORY_NUM;
        else
            record_count = record_count + 1;
        end
        history_content = record_count..";"..date..";"..time..";"..--序号,日期,时间
                          Sys.calibrationValue..";"..Sys.signalE1..";"..Sys.signalE2..";".."1"
        record_add(screen, HistoryRecordId, history_content);
        --添加历史记录到文件当中
        if SdPath ~= nil then
            file_lines,lastContent = getFileLines(SdPath.."CalibrationHistory.txt");--获取文件行数以及最后一行的数据
            if file_lines >= MAX_CALIBRARE_FILE_NUM then
                lastContentTab = split(lastContent, ";");
                record_count = tonumber(lastContentTab[1])+1;--提取该字符串中的序号
                deleteFirstLineInFile(SdPath.."CalibrationHistory.txt");--获取文件中最后一行的数据
            else
                record_count = file_lines+1;
            end
            file_content = record_count..";"..date..";"..time..";"..--序号,日期,时间
                           Sys.calibrationValue..";"..Sys.signalE1..";"..Sys.signalE2..";".."1"
            historyFile = io.open(SdPath.."CalibrationHistory.txt", "a+") --以可读可写的方式打开文本,且写入数据为末尾追加模式.
            if historyFile ~= nil then
                historyFile:write(file_content.."\n");--添加一行历史记录
                historyFile:close()                        --关闭文本
            else
                ShowSysTips("未检测到SD卡,校正结果未存入文件");
            end
        end
    -------------------添加报警记录-----------------------------------------------
    elseif screen == HISTORY_ALARM_SCREEN then--添加报警记录
        record_count =  record_get_count(screen, HistoryRecordId);--获取记录个数
        if record_count >= MAX_ALARM_HISTORY_NUM then
            record_content = record_read(screen, HistoryRecordId, record_count-1);--读取最后一条记录
            record_content_tab = split(record_content, ";");--分割字符串,并保存到一个table中
            record_count = tonumber(record_content_tab[1]) + 1;--提取该字符串中的序号
            record_delete(screen, HistoryRecordId, 0);--删除最旧的一条记录
        else
            record_count = record_count + 1;
        end
        history_content = record_count..";"..date..";"..time..";"..Sys.alarmContent.."; "--序号,日期,时间
        record_add(screen, HistoryRecordId, history_content);
        --添加历史记录到文件当中
        if SdPath ~= nil then
            file_lines,lastContent = getFileLines(SdPath.."AlarmHistory.txt");--获取文件行数以及最后一行的数据
            if file_lines >= MAX_ALARM_FILE_NUM then
                lastContentTab = split(lastContent, ";");
                record_count = tonumber(lastContentTab[1])+1;--提取该字符串中的序号
                deleteFirstLineInFile(SdPath.."AlarmHistory.txt");--获取文件中最后一行的数据
            else
                record_count = file_lines+1;
            end
            file_content = record_count..";"..date..";"..time..";"..Sys.alarmContent.."; "--序号,日期,时间
            historyFile = io.open(SdPath.."AlarmHistory.txt", "a+") --以可读可写的方式打开文本,且写入数据为末尾追加模式.
            if historyFile ~= nil then
                historyFile:write(file_content.."\n");--添加一行历史记录
                historyFile:close()                        --关闭文本
            else
                ShowSysTips("未检测到SD卡,报警未存入文件");
            end
        end
    -------------------添加日志记录------------------------------------------------
    elseif screen == HISTORY_LOG_SCREEN then
        record_count =  record_get_count(screen, HistoryRecordId);
        if record_count >= MAX_LOG_HISTORY_NUM then
            record_delete(screen, HistoryRecordId, 0);--删除最旧的一条记录
            record_count = MAX_LOG_HISTORY_NUM;
        else
            record_count = record_count + 1;
        end
        history_content = record_count..";"..date..";"..time..";"..Sys.logContent..";"..Sys.userName--序号,日期,时间
        record_add(screen, HistoryRecordId, history_content);
        --添加历史记录到文件当中
        if SdPath ~= nil then
            file_lines,lastContent = getFileLines(SdPath.."LogHistory.txt");--获取文件行数以及最后一行的数据
            if file_lines >= MAX_LOG_FILE_NUM then
                lastContentTab = split(lastContent, ";");
                record_count = tonumber(lastContentTab[1])+1;--提取该字符串中的序号
                deleteFirstLineInFile(SdPath.."LogHistory.txt");--获取文件中最后一行的数据
            else
                record_count = file_lines+1;
            end
            file_content = record_count..";"..date..";"..time..";"..Sys.logContent..";"..Sys.userName--序号,日期,时间
            historyFile = io.open(SdPath.."LogHistory.txt", "a+") --以可读可写的方式打开文本,且写入数据为末尾追加模式.
            if historyFile ~= nil then
                historyFile:write(file_content.."\n");--添加一行历史记录
                historyFile:close()                        --关闭文本
            else
                ShowSysTips("未检测到SD卡,日志未存入文件");
            end
        end
    end
end

--***********************************************************************************************
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--***********************************************************************************************
function history_control_notify(screen,control,value)
    if control == HistoryClear and get_value(screen,control) == ENABLE then
        record_clear(screen, HistoryRecordId);--清除记录
        print("清除记录");
    elseif control == HistoryExport and get_value(screen,control) == ENABLE then 
        print("导出记录");
        record_export(screen,HistoryRecordId);--导出记录
    end
end

--***********************************************************************************************
--跳转到分析历史界面时,调用该函数,显示最新的记录
--***********************************************************************************************
function goto_history_analysis(screen)
    record_count =  record_get_count(screen, HistoryRecordId);
    record_setoffset(screen, HistoryRecordId, record_count);
end

--***********************************************************************************************
--跳转到校正历史界面时,调用该函数,显示最新的记录
--***********************************************************************************************
function goto_history_calibration(screen)
    record_count =  record_get_count(screen, HistoryRecordId);
    record_setoffset(screen, HistoryRecordId, record_count);
end

--***********************************************************************************************
--跳转到报警历史界面时,调用该函数,显示最新的记录
--***********************************************************************************************
function goto_history_alarm(screen)
    record_count =  record_get_count(screen, HistoryRecordId);
    record_setoffset(screen, HistoryRecordId, record_count);
end

--***********************************************************************************************
--跳转到日志历史界面时,调用该函数,显示最新的记录
--***********************************************************************************************
function goto_history_log(screen)
    record_count =  record_get_count(screen, HistoryRecordId);
    record_setoffset(screen, HistoryRecordId, record_count);
end


--***********************************************************************************************
--获取文件行数
--***********************************************************************************************
function getFileLines(filePath)
    local lines= 0;
    local lastLineContent = "";
    local file = io.open(filePath)
    if file == nil then
        return lines,lastLineContent;
    end
    
    local line = file:read();
    while line do
        lines = lines + 1;
        lastLineContent = line;--获取文件中最后一行数据
        line = file:read();
    end
    file:close();
    print("文件行数为:"..lines);
    return lines,lastLineContent;
end

--***********************************************************************************************
--按行读取文件, 将每一行的数据都放入tab中.
--***********************************************************************************************
function readFileToTab(file)
    local fileTab = {}
    local line = file:read();
    while line do
        table.insert(fileTab, line);
        line = file:read();
    end
    return fileTab;
end

--***********************************************************************************************
--将Tab中的数据,按行写入文件当中
--***********************************************************************************************
function writeFile(file,fileTab)
    for i,line in ipairs(fileTab) do
        file:write(line)
        file:write("\n")
    end
end

--***********************************************************************************************
--删除文件中的首行数据
--***********************************************************************************************
function deleteFirstLineInFile(filePath)
    local fileRead = io.open(filePath)
    assert(fileRead, "file open failed")
    if fileRead then
        local tab = readFileToTab(fileRead);
        fileRead:close();
        table.remove(tab, 1);--删除第一行数据
        local fileWrite = io.open(filePath, "w")
        if fileWrite then
            writeFile(fileWrite,tab)
            fileWrite:close()
        end
    end
end

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

TouchScreenHardVerId = 3;
TouchScreenSoftVerId = 27;
CtrlBoardHardVerId = 4;
CtrlBoardSoftVerId = 5;
DriverBoardHardVerId = 6;
DriverBoardSoftVerId = 7;
SensorBoardHardVerId = 8;
SensorBoardSoftVerId = 9;
CalcBoardHardVerId = 10;
CalcBoardSoftVerId = 11;

SetChineseId = 19;
SetEnglishId = 20;

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
        set_user_name(SysUser[Sys.language].maintainer);--设置密码修改界面的用户名
    elseif control == administratorPwdSetId then--管理员密码设置
        set_user_name(SysUser[Sys.language].administrator);--设置密码修改界面的用户名
    elseif control == OperatorLoginId then --操作员登录
        SetSysUser(SysUser[Sys.language].operator);
    elseif control == maintainerLoginId then--运维员登录
        set_user_name(SysUser[Sys.language].maintainer);--设置登录界面的用户名
        change_screen(LOGIN_SYSTEM_SCREEN);
    elseif control == administratorLoginId then--管理员登录
        set_user_name(SysUser[Sys.language].administrator);--设置登录界面的用户名
        change_screen(LOGIN_SYSTEM_SCREEN);
    elseif control == SetChineseId then--设置为中文
        Sys.language = CHN;
        set_value(SYSTEM_INFO_SCREEN, SetChineseId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, SetEnglishId, DISABLE);
    elseif control == SetEnglishId then--设置为英文
        Sys.language = ENG;
        set_value(SYSTEM_INFO_SCREEN, SetChineseId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, SetEnglishId, ENABLE );
    end
end

--***********************************************************************************************
--  设置系统用户
--***********************************************************************************************
function SetSysUser(user)
    
    Sys.userName = user;
    
    --在底部的状态用户名
    for i = 1,16,1 do
        set_text(PublicTab[i], SysUserNameId, user);
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

--当画面切换为登录系统界面时，执行此回调函数，screen为目标画面。
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

--***********************************************************************************************
--操作权限检测
--para 1=只检测是否在运行中; 2=同事检测是否在运行中与用户权限
--***********************************************************************************************
function operate_permission_detect(para)
    if Sys.status == WorkStatus[Sys.language].run then --系统运行中,不可执行该操作
        ShowSysTips(TipsTab[Sys.language].stopFirst);
        return DISABLE;
    end
    --只检测是否在运行中
    if para == 1 then 
        return ENABLE
    end
    --检测用户权限
    if Sys.userName == SysUser[Sys.language].operator then
        ShowSysTips(TipsTab[Sys.language].NoPermission);--无权限
        return DISABLE;
    end
    
    return ENABLE;
end

--[[-----------------------------------------------------------------------------------------------------------------
对话框
--------------------------------------------------------------------------------------------------------------------]]
--当在流程设置1/2/3界面中点击删除按钮时调用
function process_delete_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end

--当点击对话框界面中的控件时,调用该函数
function dialog_screen_control_notify(screen,control,value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if DestScreen == PROCESS_SET1_SCREEN or DestScreen == PROCESS_SET2_SCREEN then--删除流程设置1界面中的流程
            change_screen(DestScreen);
            local file = DestControl - 250;--DestControl取值251~273,减去250后,对应了1-24,此为流程序号.
            set_text(DestScreen, DestControl+50,BLANK_SPACE);
            set_text(DestScreen, DestControl-50,BLANK_SPACE);
            set_text(DestScreen, DestControl+100,1);
            WriteProcessFile(1);--保存流程设置1界面中的参数
            os.remove(file);--删除配置文件
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
密码对话框
--------------------------------------------------------------------------------------------------------------------]]


--[[-----------------------------------------------------------------------------------------------------------------
连接wifi
--------------------------------------------------------------------------------------------------------------------]]
ScanBtId = 97;
WifiSsid = 1;
WifiPwdId = 5;
WifiStatusTextId = 9;
WifiConnectBtId = 10;
WifiIpAddrId = 42;
function wifi_connect_control_notify(screen,control,value)
    if control == ScanBtId then
        scan_ap_fill_list();
    elseif control >= 27 and control <= 40 then--选取热点
        Sys.ssid = get_text(WIFI_CONNECT_SCREEN, (control-14)) --文本控件从13~26
        set_text(WIFI_CONNECT_SCREEN, WifiSsid, Sys.ssid)
    elseif control == WifiConnectBtId then
        if string.len(Sys.ssid) > 0 then
            Sys.ssid = get_text(WIFI_CONNECT_SCREEN, WifiSsid);
            wifiPwd = get_text(WIFI_CONNECT_SCREEN, WifiPwdId);
            set_wifi_cfg(1, 0, Sys.ssid, wifiPwd) --连接 WIFI，1 网卡模式，0 自动识别加密
            save_network_cfg();
            set_text(WIFI_CONNECT_SCREEN, WifiStatusTextId,' 连接中...')
        end
    end
end

--切换到wifi连接界面
function goto_WifiConnect()
    scan_ap_fill_list();
end


--扫描wifi与显示
function scan_ap_fill_list()
    ap_cnt = scan_ap()  --扫描可用热点

	for i=1,ap_cnt,1 do
	  Sys.ssid, Sys.security, Sys.quality = get_ap_info(i-1)  --获取信息
	  set_text(WIFI_CONNECT_SCREEN, i+12, Sys.ssid)  --显示id
	end
	
	for i=ap_cnt+1, 14, 1 do
	   set_text(WIFI_CONNECT_SCREEN, i+12, "")  --清空后面的
	end
end

--[[-----------------------------------------------------------------------------------------------------------------
远程升级
--------------------------------------------------------------------------------------------------------------------]]
RemoteFtpAddrTextId = 1;
RemoteTsVerTextId = 2;
RemoteUpdateTsStaId = 3;
RemoteDrvTextId = 4;
RemoteUpdateDrvStaId = 5;
RemoteGetTsVerBtId = 6;
RemoteStartUpdateTsBtId = 7;
RemoteGetDrvVerBtId = 8;
RemoteStartUpdateDrvBtId = 9;

--在远程升级界面，单击控件调用该函数
function remote_update_control_notify(screen,control,value)
    if control == RemoteGetTsVerBtId then--获取触摸屏版本文件
        http_download(1, 'http://'..get_text(REMOTE_UPDATE_SCREEN,RemoteFtpAddrTextId)..'/tsVer.txt', "tsVer.txt");
    elseif control == RemoteStartUpdateTsBtId then--开始触摸屏升级
        --判断权限
        if Sys.userName == SysUser[Sys.language].operator then
            set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, TipsTab[Sys.language].NoPermission)
            return
        end
        --判断系统是否为停止状态
        if Sys.status ~= WorkStatus[Sys.language].stop then 
            set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, TipsTab[Sys.language].stopFirst)
            return
        end
        --开始升级触摸屏程序(在on_systick中获取升级状态进行显示)
        start_upgrade('ftp://'..get_text(REMOTE_UPDATE_SCREEN,RemoteFtpAddrTextId)..'/DCIOT.PKG');
    elseif control == RemoteGetDrvVerBtId then--获取驱动版本文件
        http_download(2, 'http://'..get_text(REMOTE_UPDATE_SCREEN,RemoteFtpAddrTextId)..'/drvVer.txt', "drvVer.txt");
    elseif control == RemoteStartUpdateDrvBtId and Sys.hand_control_func == nil then--获取驱动文件
        --判断权限
        if Sys.userName == SysUser[Sys.language].operator then
            set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, TipsTab[Sys.language].NoPermission)
            return
        end
        --判断系统是否为停止状态
        if Sys.status ~= TipsTab[Sys.language][Sys.language].stop then 
            set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, TipsTab[Sys.language].stopFirst)
            return
        end
        --下载STM.BIN文件,在on_http_download函数中判断下载状态
        http_download(3, 'http://'..get_text(REMOTE_UPDATE_SCREEN,RemoteFtpAddrTextId)..'/STM.BIN', "STM.BIN");
    end
end


--http_download回调函数,系统自动调用
function on_http_download (taskid, status)
    if taskid == 1 then --下载触摸屏版本文件回调函数
		if status == 0 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, TipsTab[Sys.language].getVerFileFail)
        elseif status == 1 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, TipsTab[Sys.language].saveVerFileFail)
		elseif status == 2 then
			local verFile = io.open("tsVer.txt", "r");        --以只读方式打开文件.
            if verFile == nil then
                set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, TipsTab[Sys.language].openVerFileFail)
                return 
            end
            local ts_version = verFile:read("a");      --从当前位置读取整个文件，并赋值到字符串中
            verFile:close();                           --关闭文件
            set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, ts_version);
        end
    elseif taskid == 2 then--下载驱动版本文件回调函数
        if status == 0 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, TipsTab[Sys.language].getVerFileFail)
        elseif status == 1 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, TipsTab[Sys.language].saveVerFileFail)
        elseif status == 2 then
            local verFile = io.open("drvVer.txt", "r");        --以只读方式打开文件.
            if verFile == nil then
                set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, TipsTab[Sys.language].openVerFileFail)
                return
            end
            local ts_version = verFile:read("a");      --从当前位置读取整个文件，并赋值到字符串中
            verFile:close();                           --关闭文件
            set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, ts_version);
        end
    elseif taskid == 3 then--下载驱动升级文件回调函数
        if status == 0 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].getFirmwareFail)
        elseif status == 1 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].saveFirmwareFail)
        elseif status == 2 then
            --STM.BIN文件下载成功, 准备将该文件分包下发给驱动板
            set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].saveFirmwareOk)
            --执行驱动板升级函数
            Sys.binIndex = 0;
            Sys.hand_control_func = UpdataDriverBoard;
        end
    end
end

--***********************************************************************************************
--  升级驱动板
--***********************************************************************************************
function UpdataDriverBoard()
    if UartArg.lock == LOCKED then
        return;
    end

    --判断sd卡是否有STM.BIN文件
    drvFile = io.open("STM.BIN", "rb");
    if drvFile == nil then
        set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].openFirmwareFail)
        return 
    end
    --获取文件长度(调试时使用)
    local fileLen = drvFile:seek("end");

    local dataLen = 0;
    local offset = Sys.binIndex * 1024;

    --判断文件是否传送完毕
    if offset > fileLen then
        drvFile:close()
        set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].sendFirmwareOk)
        print("升级数据发送完成")
        Sys.hand_control_func = nil;
        return;
    end
    --设置文件索引位置
    drvFile:seek("set", offset)
    binCode = {};
    --从当前位置读取1k数据
    charCode = drvFile:read(1024);
    --将读取到的1k数据进行格式转换
    for i=1,1024,1 do
        binCode[i+5] = string.byte(charCode,i,i)
    end
    --计算数据长度,计算出的数据包含头部的6个数据,不包含尾部的两个CRC数据
    dataLen = #binCode + 1;
    --为binCode数据添加头部与尾部的CRC,构成一个完成的串口数据包
    binCode[0] = 0xD0;
    binCode[1] = 0x10;
    binCode[2] = 0x30;--math.modf( Sys.binIndex/256 ) + 0x30;
    binCode[3] = math.fmod( Sys.binIndex, 256 )       --0x3000开始表示的是升级数据的第0个包, ox3001表示的是升级数据的第1个包(最大支持传输256k的数据)
    binCode[4] = math.modf( (dataLen-6)/256 )
    binCode[5] = math.fmod( (dataLen-6),256 )

    uartSendTab.updateDrv = binCode;
    uartSendTab.updateDrv.len = dataLen;
    uartSendTab.updateDrv.note = TipsTab[Sys.language].updateDrvBd;
    on_uart_send_data(uartSendTab.updateDrv, NEED_REPLY);--在调试时可以使用NO_NEED_REPLY参数,这样就可以不用等待回复

    Sys.binIndex = Sys.binIndex + 1;

    --关闭文件
    drvFile:close();
end


--[[-----------------------------------------------------------------------------------------------------------------
    配置文件操作相关函数
--------------------------------------------------------------------------------------------------------------------]]
--
--***********************************************************************************************
--从配置文件中加载数据到ConfigStr{}缓存
--***********************************************************************************************
function LoadConfigFile()
    ReadConfigFile();--读取"0"文件,并将文件里的参数设置到 流程设置1界面/运行控制界面/量程设置界面/手动操作3界面/输入输出界面
    for i=1,24,1 do--循环读取文件"1"-"24"
        local configFile = io.open(i, "r")          --打开文本
        if configFile ~= nil then              
            configFile:seek("set")                  --把文件位置定位到开头
            ConfigStr[i] = configFile:read("a")     --从当前位置读取整个文件，并赋值到字符串
            configFile:close()                      --关闭文本
        else
            ConfigStr[i] = nil;
        end
    end
end


--配置文件的文件名为"0", 在开机时读取到ConfigStr[0]数组当中, 在点击保存时则将ConfigStr[0]字符串保存到"0"文件

cfgFileTab = {
    [1] = {sTag = "<ProcessSet>",eTag = "</ProcessSet>"};--流程设置1界面中的参数保存在这个tag中
    [2] = {sTag = "<RunControl>",eTag = "</RunControl>"};--运行控制界面中的参数保存在这个tag中
    [3] = {sTag = "<RangeSet>",eTag = "</RangeSet>"};--量程设置界面中的参数保存在这个tag中
    [4] = {sTag = "<IOSet>",eTag="</IOSet>"};--输入输出中的参数保存在这个tag中
    [5] = {sTag = "<ReagentSet>",eTag="</ReagentSet>"};--试剂余量中的参数保存咋这个tag中
};

--***********************************************************************************************
--创建配置文件,并保存在"0"文件中
--tagNum = 1 : 修改流程设置1界面中的参数 
--tagNum = 2 : 修改运行控制界面中的参数
--tagNum = 3 : 运行控制界面中的参数
--tagNum = 4 : 输入输出中的参数
--tagNum = 5 : 试剂余量中的参数
--***********************************************************************************************
function WriteProcessFile(tagNum)
    --删除ConfigStr[0]中指定的标签内容
    ConfigStr[0] = DeleteSubString(ConfigStr[0], cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);
    ConfigStr[0] = ConfigStr[0]..cfgFileTab[tagNum].sTag;--添加开始标签
    if tagNum == 1 then
        --流程设置1界面中的参数
        for i=1,12,1 do
            ConfigStr[0] =  ConfigStr[0]..
                            get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId)..",".. --流程类型选择
                            get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId)..","..   --流程名称
                            get_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId)..",";  --流程量程
        end
        --流程设置2界面中的参数
        for i=13,24,1 do
            ConfigStr[0] =  ConfigStr[0]..
                            get_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId)..",".. --流程类型选择
                            get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId)..","..   --流程名称
                            get_text(PROCESS_SET2_SCREEN, ProcessTab[i].rangeId)..",";  --流程量程
        end
    elseif tagNum == 2 then--运行控制界面中的参数
        for i = RUNCTRL_TextStartId, RUNCTRL_TextEndId,1 do
            ConfigStr[0] = ConfigStr[0]..get_text(RUN_CONTROL_SCREEN,i)..",";
        end
    elseif tagNum == 3 then--量程设置界面中的参数
        for i = RANGESET_TextStartId, RANGESET_TextEndId, 1 do
            ConfigStr[0] = ConfigStr[0]..get_text(RANGE_SET_SCREEN, i)..",";
        end
    elseif tagNum == 4 then
        for i = IOSET_TextStartId,IOSET_TextEndId,1 do
            ConfigStr[0] = ConfigStr[0]..get_text(IN_OUT_SCREEN, i)..",";
        end
    elseif tagNum == 5 then
        for i = REAGENT_BtStartId,REAGENT_BtEndId,1 do
            ConfigStr[0] = ConfigStr[0]..get_value(HAND_OPERATE3_SCREEN, i)..",";
        end
        for i = REAGENT_TextStartId, REAGENT_TexEndId, 1 do
            ConfigStr[0] = ConfigStr[0]..get_text(HAND_OPERATE3_SCREEN, i)..",";
        end
    end
    ConfigStr[0] = ConfigStr[0]..cfgFileTab[tagNum].eTag;--添加结束标签
    
    --设置参数,此处调用该函数可以检查保存的数据是否正确
    SetConfigParaToScreen(tagNum);

    local configFile = io.open("0", "w+");  --打开并清空该文件
    configFile:write(ConfigStr[0]);         --将处理过的原文件内容重新写入文件
    configFile:close(); --关闭文本
end

--***********************************************************************************************
--读取配置文件中的所有数据,并将数据保存到cfgFileStr[0]表当中
--***********************************************************************************************
function ReadConfigFile()
    local configFile = io.open("0", "r")      --打开文本
    if configFile == nil then--如果没有该文件则返回
        print("没有找到配置文件:0,创建一个默认的配置文件");
        WriteProcessFile(1);
        WriteProcessFile(2);
        WriteProcessFile(3);
        WriteProcessFile(4);
        WriteProcessFile(5);
    end
    configFile:seek("set")    --把文件位置定位到开头
    ConfigStr[0] = configFile:read("a")       --从当前位置读取整个文件，并赋值到字符串中
    configFile:close()                            --关闭文本

    print(ConfigStr[0]);

    SetConfigParaToScreen(1);
    SetConfigParaToScreen(2);
    SetConfigParaToScreen(3);
    SetConfigParaToScreen(4);
    SetConfigParaToScreen(5);

end


--***********************************************************************************************
--将参数设置到界面当中
--tagNum = 1 : 修改流程设置1界面中的参数 
--tagNum = 2 : 修改运行控制界面中的参数
--tagNum = 3 : 运行控制界面中的参数
--tagNum = 4 : 输入输出中的参数
--tagNum = 5 : 试剂余量中的参数
--***********************************************************************************************
function SetConfigParaToScreen(tagNum)
    local tagString = GetSubString(ConfigStr[0], cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);--截取标签之间的字符串
    local tab = split(tagString, ",")--将读出的字符串按逗号分割,并以此存入tab表
    if tagNum == 1 then--流程设置界面中的参数
        for i=1,12,1 do
            set_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId, tab[(i-1)*3+1]);  --把数据显示到文本框中
            set_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId,   tab[(i-1)*3+2]);  --把数据显示到文本框中
            set_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId,  tab[(i-1)*3+3]);  --把数据显示到文本框中
        end
        for i=13,24,1 do
            set_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId, tab[(i-1)*3+1]);  --把数据显示到文本框中
            set_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId,   tab[(i-1)*3+2]);  --把数据显示到文本框中
            set_text(PROCESS_SET2_SCREEN, ProcessTab[i].rangeId,  tab[(i-1)*3+3]);  --把数据显示到文本框中
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
    elseif tagNum == 4 then
        for i = IOSET_TextStartId, IOSET_TextEndId, 1 do
            set_text(IN_OUT_SCREEN, i, tab[i]);
        end
    elseif tagNum == 5 then
        for i = REAGENT_BtStartId,REAGENT_BtEndId,1 do
            set_value(HAND_OPERATE3_SCREEN, i,tab[i]);
        end
        for i = REAGENT_TextStartId, REAGENT_TexEndId, 1 do
            set_text(HAND_OPERATE3_SCREEN, i, tab[i]);
        end
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程操作相关函数
--------------------------------------------------------------------------------------------------------------------]]
--***********************************************************************************************
--将配置参数保存至文件
--***********************************************************************************************
function WriteCfgToFlash()
    print("调用 WriteCfgToFlash 函数");
    local processName = get_text(PROCESS_EDIT1_SCREEN, ProcesstypeId);--获取流程名称
    local fileName = 0;

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            fileName = i;
            break;
        end
    end

    for i=13,24,1 do
        if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            fileName = i;
            break;
        end
    end

    local configFile = io.open(fileName, "w+");  --打开并清空该文件
    configFile:write(ConfigStr[fileName]);         --将处理过的原文件内容重新写入文件
    configFile:close(); --关闭文本
end

--***********************************************************************************************
--该函数检测配置文件中是否有<action?>标签, ? 范围1~12. 如果没有该标签,则创建一个默认的配置,如果有则直接返回
--actionNumber:动作标签,范围:action1~action24
--***********************************************************************************************
function WriteDefaultActionTag(actionNumber)
    print("调用 WriteDefaultActionTag 函数");
    local processName = get_text(PROCESS_EDIT1_SCREEN, ProcesstypeId);--获取流程名称
    local fileName = 0;

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            fileName = i;
            break;
        end
    end
    for i=13,24,1 do
        if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            fileName = i;
            break;
        end
    end
    WriteActionTag(fileName, 0);--修改<action0>标签中的内容, 增加或者删除一个动作
    
    local fileString = ConfigStr[fileName]; 

    --如果该配置文件已经有<action?>标签,则直接返回
    if string.find( fileString, "<action"..actionNumber..">", 1) ~= nil then
        return;
    end

    --如果该配置文件已经没有<action?>标签,则继续执行,创建一个默认的标签
    WriteActionTag(fileName, actionNumber);
end

--***********************************************************************************************
--将动作写入配置文件中,该文件在WriteProcessFile中调用
--fileName:配置文件名称:范围:1-24,对应24个流程(每个流程对应一个配置文件)
--actionNumber:动作标签,范围:action0~action24
--***********************************************************************************************
function WriteActionTag(fileName, actionNumber)
    print("调用 WriteActionTag 函数");
    --将原来的<action?>-</action?>标签之间的字符串删除
    if ConfigStr[fileName] ~= nil then
        ConfigStr[fileName] = DeleteSubString(ConfigStr[fileName], "<action"..actionNumber..">", "</action"..actionNumber..">");
    else
        ConfigStr[fileName] = "";
    end
    
    local actionType, actionName
    if actionNumber == 0 and fileName <= 12 then
        actionType = get_text(PROCESS_SET1_SCREEN, ProcessTab[fileName].typeId);--当前流程名称
        actionName = get_text(PROCESS_SET1_SCREEN, ProcessTab[fileName].nameId);--当前流程名称
    elseif actionNumber == 0 and fileName <= 24 then
        actionType = get_text(PROCESS_SET2_SCREEN, ProcessTab[fileName].typeId);--当前流程名称
        actionName = get_text(PROCESS_SET2_SCREEN, ProcessTab[fileName].nameId);--当前流程名称
    elseif actionNumber >= 1 and actionNumber <= 12 then
        actionType = get_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].typeId);--获取当前动作类型
        actionName = get_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].nameId);--获取当前动作名称
    elseif actionNumber >= 13 and actionNumber <= 24 then 
        actionType = get_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].typeId);--获取当前动作类型
        actionName = get_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].nameId);--获取当前动作名称
    end

    ConfigStr[fileName] = ConfigStr[fileName].."<action"..actionNumber..">";--写入开始标签
    ConfigStr[fileName] = ConfigStr[fileName].."<type>"..actionType..","..actionName.."</type>"--写入动作类型与动作名称(或流程类型与名称):初始化/注射泵/消解......
    ConfigStr[fileName] = ConfigStr[fileName].."<content>";
    --------------------------------写<action0>标签内容---------------------------------------------
    --<action0>标签保存的都是该流程中,对应的流程编辑1/3界面中的动作选择/动作名称
    if actionNumber == 0 then
        for i=1,12,1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId)..",".. --动作类型选择
                              get_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId  ).."," --动作名称
        end
        for i=13,24,1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId)..",".. --动作类型选择
                              get_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId  ).."," --动作名称
        end
    --------------------------------写开始界面参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][1] then 
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_value(PROCESS_INIT_SCREEN, i)..","--写入按钮值
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_INIT_SCREEN, i)..","--写入文本值
        end
    --------------------------------写取样界面参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][2] then 
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_value(PROCESS_INJECT_SCREEN, i)..","--写入输出1按钮值
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_INJECT_SCREEN, i)..","--写入文本值
        end
    --------------------------------写注射泵加液参数--------------------------------------------------
    elseif actionType == ActionItem[Sys.language][3] then
        for i = INJECT_ADD_BtStartId, INJECT_ADD_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_value(PROCESS_INJECT_ADD_SCREEN, i)..","--写入按钮值
        end
        for i = INJECT_ADD_TextStartId, INJECT_ADD_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_INJECT_ADD_SCREEN, i)..","--写入文本值
        end
    --------------------------------写-读取信号参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][4] then 
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_READ_SIGNAL_SCREEN, i)..","--写入文本值
        end
    --------------------------------写-蠕动泵加液参数--------------------------------------------------
    elseif actionType == ActionItem[Sys.language][5] then 
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_value(PROCESS_PERISTALTIC_SCREEN, i)..","--写入按钮值
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_PERISTALTIC_SCREEN, i)..","--写入文本值
        end
    --------------------------------写-计算参数--------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][6] then 
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_value(PROCESS_CALCULATE_SCREEN, i)..","--写入按钮值
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_CALCULATE_SCREEN, i)..","--写入文本值
        end
    --------------------------------写-等待时间参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][7] then 
        ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId)
    --------------------------------写-消解参数--------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][8] then 
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_value(PROCESS_DISPEL_SCREEN, i)..","--写入按钮值
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_DISPEL_SCREEN, i)..","--写入文本值
        end
    --------------------------------写-阀操作参数------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][9] then 
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_value(PROCESS_VALVE_CTRL_SCREEN, i)..","--写入按钮值
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName]..get_text(PROCESS_VALVE_CTRL_SCREEN, i)..","--写入文本值
        end
    --------------------------------写-空操作参数------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][10] then 
        ConfigStr[fileName] = ConfigStr[fileName].."<content> </content>"
    end
    ConfigStr[fileName] = ConfigStr[fileName].."</content>"
    ConfigStr[fileName] = ConfigStr[fileName].."</action"..actionNumber..">"--写入结束标签
end

--***********************************************************************************************
--保存单个流程配置文件,每个流程都有一个对应的配置文件,文件名为该流程在表格中的序号
--actionNumber:动作标签,范围:action1~action24
--***********************************************************************************************
function WriteActionFile(actionNumber)
    print("调用 WriteActionFile 函数");
    local processName = get_text(PROCESS_EDIT1_SCREEN, ProcesstypeId);--获取流程名称

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            WriteActionTag(i, actionNumber);--保存数据到文件中,文件名为1~24, 保存的内容为action0~action12标签
        end
    end
    for i=13,24,1 do
        if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            WriteActionTag(i, actionNumber);--保存数据到文件中,文件名为1~24, 保存的内容为action0~action12标签
        end
    end
end

--***********************************************************************************************
--actionNumber: 动作id , 从该动作开始,之后的动作都进行+1或者-1的操作
--flag 1=加操作, 2=减操作
--***********************************************************************************************
function ChangeActionFileTag(actionNumber, flag)
    print("调用 ChangeActionFileTag 函数");
    local processName = get_text(PROCESS_EDIT1_SCREEN, ProcesstypeId);--获取流程名称
    local fileName;
    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            WriteActionTag(i, 0);--调整流程编辑1/3界面的显示后,再修改<action0>标签中的内容
            fileName = i;
        end
    end
    for i=13,24,1 do
        if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--找到当前流程名对应的序号
            WriteActionTag(i, 0);--调整流程编辑1/3界面的显示后,再修改<action0>标签中的内容
            fileName = i;
        end
    end

    --字符替换;1表示需要对动作进行加操作,此时执行的是插入动作,
    if flag == 1 then
        ConfigStr[fileName] = DeleteSubString(ConfigStr[fileName], "<action24>", "</action24>");--删除指定的标签内容
        for i = 23, actionNumber, -1 do
            ConfigStr[fileName] = string.gsub(ConfigStr[fileName], "action"..i, "action"..(i+1));
        end
    else--2表示需要对动作标签进行减操作,此时执行的是删除操作
        ConfigStr[fileName] = DeleteSubString(ConfigStr[fileName], "<action"..actionNumber..">", "</action"..actionNumber..">");--删除指定的标签内容
        for i = actionNumber+1, 24, 1 do
            ConfigStr[fileName] = string.gsub(ConfigStr[fileName], "action"..i, "action"..(i-1));
        end
    end
end

--***********************************************************************************************
--读配置文件函数,这里每次只读取一个标签里的值, 例如<action1>标签之间的值
--actionNumber: 当前动作为第几步
--***********************************************************************************************
function ReadActionTag(actionNumber)
    print("调用 ReadActionTag 函数");
    local processName = get_text(PROCESS_EDIT1_SCREEN, ProcesstypeId);--获取流程名称
    local fileNumber = 0;
    for i=1,12,1 do--循环查找当前流程名称对应的序号.
        if string.find(get_text(PROCESS_SET1_SCREEN,ProcessTab[i].nameId), processName ,1) ~= nil then--找到当前流程名对应的序号
            fileNumber = i;
            break;
        end
    end
    for i=13,24,1 do--循环查找当前流程名称对应的序号.
        if string.find(get_text(PROCESS_SET2_SCREEN,ProcessTab[i].nameId), processName ,1) ~= nil then--找到当前流程名对应的序号
            fileNumber = i;
            break;
        end
    end

    if fileNumber == 0 then
        ShowSysTips("没有找到对应的流程配置文件");
        return;
    end

    if ConfigStr[fileNumber] == nil then
        ShowSysTips("没有找到对应的流程配置文件");
        WriteActionFile(0);--添加<action0>标签中的内容
        return;
    end
    
    --截取fileString文件中<action?> ~ </action?>标签之间的字符串
    local actionString = GetSubString(ConfigStr[fileNumber], "<action"..actionNumber..">", "</action"..actionNumber..">");
    if actionString == nil then--如果文件中没有该标签,则返回.
        ShowSysTips("配置文件没有找到<action?>标签");
        return 
    end
    --截取actionString字符串中<type>标签之间的字符串,获取动作类型与动作名称
    local actionType = GetSubString(actionString, "<type>","</type>");
    actionType = split(actionType, ",");--分割字符串

    --再截取<content>标签中的内容
    local contentTabStr = GetSubString(actionString,"<content>","</content>");
    if contentTabStr == nil then--如果没有内容,则清空流程编辑1/3界面中的动作选择与动作名称
        ShowSysTips("配置文件没有找到content标签");
        return;
    end

    local tab = split(contentTabStr, ",");--分割字符串
    if actionNumber == 0 then --判定为<action0>标签
        for i=1,12,1 do
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, tab[(i-1)*2+1]);  --把数据显示到文本框中
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]); --把数据显示到文本框中
        end
        for i=13,24,1 do
           set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, tab[(i-1)*2+1]);  --把数据显示到文本框中
           set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]); --把数据显示到文本框中
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
    --遍历流程13-24, 找到运行控制界面中设置的流程名称,在流程设置1界面中对应的流程序号
    for i = 13, 24, 1 do
        if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId), name, 1) ~= nil then
                processId = i;
            break;
        end
    end
    return processId;
end 


--***********************************************************************************************
--将BCD转换为字符串，在获取版本信息的时候会使用到。
--***********************************************************************************************
function bcd_to_string(bcd)
    --取模获得低四位,取整获得高四位
    local str = "";
    if bcd ~= nil then
        str = tostring(math.modf(bcd/16))..tostring(math.fmod(bcd, 16));
    end;
    return str;
end

--***********************************************************************************************
--将16进制转换为浮点数表示
--验证网址:https://www.h-schmidt.net/FloatConverter/IEEE754.html
--***********************************************************************************************
function hexToFloat( hexString )
	if hexString == nil then
		return 0
	end
	local t = type( hexString )
	if t == "string" then
		hexString = tonumber(hexString , 16)
	end
 
	local hexNums = hexString
 
	local sign = math.modf(hexNums/(2^31))
 
	local exponent = hexNums % (2^31)
	exponent = math.modf(exponent/(2^23)) -127
 
	local mantissa = hexNums % (2^23)
 
	for i=1,23 do
		mantissa = mantissa / 2
	end
	mantissa = 1+mantissa
--	print(mantissa)
	local result = (-1)^sign * mantissa * 2^exponent
	return result
end


--***********************************************************************************************
--将浮点数转换为16进制表示
--***********************************************************************************************
function FloatToHex( floatNum )
	local S = 0
	local E = 0
	local M = 0
	if floatNum == 0 then
        return "00000000"
    end
	local num1,num2 = math.modf(floatNum/1)
	local InterPart = num1
 
	if floatNum > 0 then
		S = 0 * 2^31
	else
		S = 1 * 2^31
	end
	local intercount = 0
	repeat
		num1 = math.modf(num1/2)
		intercount = intercount + 1
	until (num1 == 0)
 
	E = intercount - 1
	local Elen = 23 - E
	InterPart = InterPart % (2^E)
	InterPart = InterPart * (2^Elen)
 
	E = E + 127
	E = E * 2^23
 
	for i=1,Elen do
		num2 = num2 * 2
		num1,num2 = math.modf(num2/1)
		M = M + num1 * 2^(Elen - i)
	end
 
	M = InterPart + M
 
	--E值为整数部分转成二进制数后左移位数：22.8125 转成二进制10110.1101，左移4位 1.01101101
    --E=4 ，再加上127 就为所需E值
	--010000011 01101101 000000000000000
 
	local Result = S + E + M
 
	Result = string.format("%08X",Result)
	return Result
end

