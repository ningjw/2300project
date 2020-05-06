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
RUN_CONTROL_PERIOD_SCREEN = 2;
RUN_CONTROL_TIMED_SCREEN = 3;
RUN_CONTROL_HAND_SCREEN = 4;
PROCESS_SET1_SCREEN = 5;
PROCESS_SET2_SCREEN = 6;
PROCESS_EDIT1_SCREEN = 7;
PROCESS_EDIT2_SCREEN = 8;
PROCESS_EDIT3_SCREEN = 9;
PROCESS_EDIT4_SCREEN = 10;
PROCESS_INIT_SCREEN = 11;
PROCESS_INJECT_SCREEN = 12;
PROCESS_INJECT_ADD_SCREEN = 13;
PROCESS_PERISTALTIC_SCREEN = 14;
PROCESS_DISPEL_SCREEN = 15;
PROCESS_READ_SIGNAL_SCREEN = 16;
PROCESS_CALCULATE_SCREEN = 17;
PROCESS_VALVE_CTRL_SCREEN = 18;
PROCESS_WAIT_TIME_SCREEN = 19;
PROCESS_TYPE_SELECT_SCREEN = 20;
PROCESS_NAME_SELECT_SCREEN = 21;
ACTION_SELECT_SCREEN = 22;
RANGE_SET_SCREEN = 23;
RANGE_SELECT_SCREEN = 24;
HAND_OPERATE1_SCREEN = 25;
HAND_OPERATE2_SCREEN = 26;
HAND_OPERATE3_SCREEN = 27;
HAND_OPERATE4_SCREEN = 28;
IN_OUT_SCREEN = 29;
HISTORY_ANALYSIS_SCREEN = 30;
HISTORY_CHECK_SCREEN = 31;
HISTORY_CALIBRATION_SCREEN = 32;
HISTORY_ALARM_SCREEN = 33;
HISTORY_LOG_SCREEN = 34;
SYSTEM_INFO_SCREEN = 35;
PASSWORD_SET_SCREEN = 36;
LOGIN_SYSTEM_SCREEN = 37;
CONTACT_US_SCREEN = 38;
DIALOG_SCREEN = 39;
KEYBOARD_SCREEN = 40;
WIFI_CONNECT_SCREEN = 41;
REMOTE_UPDATE_SCREEN = 42;
PASSWORD_DIALOG_SCREEN = 43;
PROCESS_COPY_SCREEN = 44;

--这里定义的Public table包含了有状态栏的界面, 方便更新"工作状态""当前动作""用户""报警"
PublicTab = {
    [1] = MAIN_SCREEN,
    [2] = RUN_CONTROL_SCREEN,
    [3] = PROCESS_SET1_SCREEN,
    [4] = PROCESS_SET2_SCREEN,
    [5] = PROCESS_EDIT1_SCREEN,
    [6] = PROCESS_EDIT2_SCREEN,
    [7] = RANGE_SET_SCREEN,
    [8] = HAND_OPERATE1_SCREEN,
    [9] = HAND_OPERATE2_SCREEN,
    [10] = HAND_OPERATE3_SCREEN,
    [11] = HAND_OPERATE4_SCREEN,
    [12] = IN_OUT_SCREEN,
    [13] = HISTORY_ANALYSIS_SCREEN,
    [14] = HISTORY_CALIBRATION_SCREEN,
    [15] = HISTORY_ALARM_SCREEN,
    [16] = HISTORY_LOG_SCREEN,
    [17] = SYSTEM_INFO_SCREEN,
    [18] = HISTORY_CHECK_SCREEN,
};

MaxProcess = 24;--最多可以编辑24个流程
MaxAction = 48;--单个流程可以有48个步骤(动作)

BLANK_SPACE = " ";
PERIOD_PROCESS = 0;--周期流程
TIMED_PROCESS = 1;--定时流程

ENABLE_STRING = "1.0"
DISABLE_STRING = "0.0"

ENABLE = 1
DISABLE = 0

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

CHK_RUN = 1;--检测权限时,只检测是否运行
CHK_RUN_USER = 2;--检测权限时,除了需要检测是否在运行中, 还需要检测用户是否为管理员或者运维员

--processIdType:
processId = 0;
autoRangeProcessId = 1;
periodProcessId = 2;
--stopType
stopByNormal = 0;
stopByClickButton = 1;

Direction = {
    [CHN] = { FWD = "正转", REV = "反转" },
    [ENG] = { FWD = "CW", REV = "CCW" },
}




--提示信息
TipsTab = {
    [CHN] = {
        insertSdUsb = "请插入SD卡",
        insertSd    = "插入SD卡,路径:",
        insertUsb = "插入U盘,路径:",
        pullOutSd = "拔出SD卡",
        pullOutUSB = "拔出U盘",
        importing = "正在导入配置文件...",
        imported    = "导入成功",
        exporting = "正在导出配置文件...",
        exported    = "导出成功",
        exportTips = "请在SD卡创建config文件夹后重试",
        selectProcess = "请选择流程",
        sysInit = "系统初始化",
        getVerFileFail = "获取版本文件失败",
        saveVerFileFail = "保存版本文件失败",
        openVerFileFail = "打开版本文件失败",
        getFirmwareFail = "获取固件失败",
        saveFirmwareFail = "保存固件失败",
        saveFirmwareOk = "下载并保存固件成功",
        openFirmwareFail = "打开固件失败",
        updateFail = "升级失败",
        sendFirmwareOk = "固件发送成功",
        updateDrvBd = "升级驱动板",
        reply = "回复",
        connected = "已连接",
        unconnected = "未连接",
        NoPermission = "当前用户无权限执行该操作",
        stopFirst = "系统运行中,不可执行该操作",
        null = "无",
        uartTimeOut = "回复超时",
        start = "开始",
        stop = "结束",
        highDensity = "浓度偏高",
        lowDensity = "浓度偏低",
        lack = "缺",
        autoRangeProcess = "量程自动切换,执行的流程id为",
        WillRunId = "当前准备运行的流程id=",
        noSdcard = "未检测到SD卡",
        resultSaveErr = "未检测到SD卡,分析结果未存入文件",
        connecting = " 连接中...",
        stopByHand = "手动停止系统",
    },
    [ENG] = {
        insertSdUsb = "Please Insert SD Card",
        insertSd    = "Insert SD Card, path is",
        insertUsb = "Insert U Disk, path is ",
        pullOutSd = "Pull Out The SD card",
        pullOutUSB = "Pull Out The U Disk",
        importing = "Importing Configuration File...",
        imported    = "Configuration File Imported Successfully",
        exporting = "Exporting Configuration File...",
        exported    = "Configuration File Exported Successfully",
        exportTips = "Create The \"config\" Folder On The SD Card First",
        selectProcess = "Select Process",
        sysInit = "System Initial",
        getVerFileFail = "Failed to get version file",
        saveVerFileFail = "Failed to save version file",
        openVerFileFail = "Failed to open version file ",
        getFirmwareFail = "Failed to get firmware",
        saveFirmwareFail = "Failed to save firmware",
        saveFirmwareOk = "Download and save the firmware",
        openFirmwareFail = "Failed to open firmware",
        updateFail = "Upgrade failed",
        sendFirmwareOk = "Send firmware successfully",
        updateDrvBd = "Upgrade Drv Board.",
        reply = "reply",
        connected = "connected",
        unconnected = "unconnected",
        NoPermission = "No Permission to Exceut",
        stopFirst = "System running, stop first",
        null    = "NULL",
        uartTimeOut = " Timeout",
        start = "Start",
        stop = "Stop",
        highDensity = "High Density",
        lowDensity = "Ligh Density",
        lack = "Lack of ",
        autoRangeProcess = "Automatic range switching, process id=",
        WillRunId = "Process Id that will run is ",
        noSdcard = "No sd card detected",
        resultSaveErr = "No sd card,the result isn't save to the file",
        connecting = "Connecting",
        stopByHand = "Stop system by hand",
    },
};

--工作状态
WorkStatus = {
    [CHN] = {
        run = "运行", --此时系统正在运行流程
        stop = "停止",
        readyRun = "待机", --此时为自动运行方式, 且在等待时间到后自动进行下一次流程的状态.
    },
    [ENG] = {
        run = "RUN", --此时系统正在运行流程
        stop = "STOP",
        readyRun = "READY", --此时为自动运行方式, 且在等待时间到后自动进行下一次流程的状态.
    }
};

--工作类型: 要与运行控制界面的运行方式菜单一一对应
WorkType = {
    [CHN] = {
        hand = "手动", --按启动按钮后,执行一次
        timed = "定时",--定时操作
        period = "周期", --按启动按钮后,可以根据时间判断是否进行周期流程与定时流程
        controlled = "受控", --通过上位机发送指令运行流程.
    },
    [ENG] = {
        hand = "Manual", --按启动按钮后,执行一次
        timed = "Timed",--定时操作
        period = "Period", --按启动按钮后,可以根据时间判断是否进行周期流程与定时流程
        controlled = "Controlled", --通过上位机发送指令运行流程.
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
VariableOnOff = {
    [CHN] = {
        open = "打开",
        close = "关闭"
    },
    [ENG] = {
        open = "ON",
        close = "OFF"
    },
}

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
}

AnalysisWay = {
    [CHN] = { colorimetry = "比色法", electrode = "电极法" },
    [ENG] = { colorimetry = "colorimetry", electrode = "electrode" },
}

CalcType = {
    [CHN] = { "分析", "校准", "核查",},
    [ENG] = { "Ana.", "Cali.", "Chk."},
};

ProcessItem = {
    [CHN] = { "水样分析", "校准", "清洗", "管路填充", "零点核查", "标样核查", "量程核查", "加标回收", "平行样", "线性核查", "空白测试", "空白校准","标样校准","实际水样比对", BLANK_SPACE },
    [ENG] = { "Analysis", "Calibration", "Washing", "Fill", "Zero Check", "Std. Check", "Range Chk.", "Std. Recovery", "Parallel Samp.", "Liner Chk.", "Blank Test", "Blank Cali.","Std. Cali.", "",BLANK_SPACE },
}

--ActionItem里面的值一定要与动作选择界面按钮中的值一一对应
ActionItem = {
    [CHN] = { "初始化", "注射泵", "注射泵加液体", "读取信号", "蠕动泵加液", "计算", "等待时间", "消解", "阀操作", BLANK_SPACE },
    [ENG] = { "Initialize", "Injector", "Injector Add", "Read Signal", "Pump Add", "Calculation", "Wait Time", "Dispel", "Valve", BLANK_SPACE },
};

--用于保存配置文件字符串
--配置文件使用 "0" "1" ... "12"进行命名,其中 "0" 中保存了运行控制界面/输入输入出界面/ 手动控制3界面/量程设置界面的参数
--配置文件 "1" - "24" 对应了流程设置界面中的1-24的流程.
--在上电后, 就将配置文件 "0" 中的数据读取到 ConfigStr[0]
--在从流程设置1界面跳转到流程编辑1界面当中时,需要选择流程,此时读取流程对应的配置文件 "?" ,将数据读取到ConfigStr[?]. (?取值1-12)
ConfigStr = {};


Sys = {
    language = CHN, --系统语言
    userName = "", --用于保存当前用户
    status = 0, --系统状态:对应WorkStatus中的值
    stateBeforePwrOff = 0,--上一次断电时的状态:对应WorkStatus中的值
    runType = 0, --运行方式: 对应WorkType中的值
    analysisType = COLOR_METHOD, --分析方法
    rangetypeId = 1, --用于记录量程选择

    handRunTimes = 0;--记录了手动运行次数
    handProcessIndex = 1,--手动流程id,手动流程共有五个, 该变量值的范围为1-5.
    handProcessTotal = 0,--总共有多少个手动流程需要执行
    
    periodStartDateTime = "", --周期流程开始时间

    
    actionTotal = 0, --所有的动作步数,可以通过统计<action>标签获得
    actionStep = 1, --取值范围为1-24,对应了流程编辑1/3界面中的共24个步骤
    actionSubStep = 1, --该变量用于控制"初始化"注射泵""消解""注射泵加液"等等子动作.
    --actionIdTab保存了各个动作的序号,例如SystemArg.actionIdTab[1] = 3, 表示第一步就执行序号为3的action, 也意味着序号为1/2的action为空格(没有设置)
    actionIdTab = {},
    actionNameTab = {},

    actionFunction = nil, --用于指向需要执行的动作函数,例如 excute_init_process, excute_get_sample_process等
    actionString, --截取流程配置文件中的action标签后, 内容保存到该变量
    actionType = "", --用于保存type标签中的内容, 表示该动作是""初始化""注射泵""注射泵加液"等等
    contentTabStr = "", --用于保存content标签中的内容
    contentTab = {}, --用于保存content标签中的内容,此时已经调用split对contentTabStr中的内容进行了分割

    currentProcessId = 0, --当前正在执行的流程,所对应的的序号.
    processFileStr = "", --读出取流程相关的配置文件后,保存到该变量当中
    processName = "", --流程名称
    processType = "", --流程类型, 通过该变量判断是校正 还是 非校正. 校正使用一种算法, 非校正使用另一种算法
    processRange = 1, --流程量程
    processTag = "", --流程类型标识, 
    processStep = 1, --执行流程时,会分步骤, 比如第一步读取action内容,解析动作类型,确定执行的动作函数, 第二步就可以执行动作函数了


    startTime = { year = 0, mon = 0, day = 0, hour = 0, min = 0, sec = 0 }, --开始时间
    resultTime = { year = 0, mon = 0, day = 0, hour = 0, min = 0, sec = 0 }, --结果时间
    dateTime = { year = 0, mon = 0, day = 0, hour = 0, min = 0, sec = 0 }, --系统日期时间,在1S定时器中不断刷新

    driverStep = 1, --用于控制所有最子层的动作,例如在开阀时: 第一步需要通过串口发送开阀指令, 第二步需要等待回复成功, 第三步需要等待一定的时间.这个就是由该变量控制
    driverStep1Func = nil, --当step=driverStep时,需要执行的函数,比如调用开阀函数/关阀函数/操作注射泵函数/等等
    driverSubStep = 1, --用于driverSubStep用于控制driverStep1Func指向的函数,例如在运行流程时,运行到了注射泵加液,
    --此时:第一步需要设置注射泵速度, 第二步需要设置注射泵方向
    waitTimeFlag = RESET, --用于标志是否正在等待超时时间到; 取值0或者1; 1(SET)= 当前正在等待超时, 0(RESET)表示等待超时完成
    waitTime = 0, --用于保存需要等待的时间
    eWaitTimeFlag = RESET, --在测量E1,E2时的定时器

    valcoChannel = 0, --用于保存在运行流程时的十通阀通道号
    valveOperate, --用于指示关阀还是开阀
    --valveIdTab 保存16个阀是否选中
    valveIdTab = {[1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 0, [12] = 0, [13] = 0, [14] = 0, [15] = 0, [16] = 0 },

    injectId = 1, --取值1或者2 表示注射泵1或者注射泵2
    injectSpeed = 0,
    injectScale = 0,
    injectCurrentSpd = 0,

    peristalticId = 1, --取值1/2/3
    peristalticSpeed = 0,
    peristalticVolume = 0,
    peristalticDir = "";
    peristalticCurrentSpd = 0,
    peristalticCurrentDir = 0,

    dispelTemp, --消解温度
    dispelTime, --消解时间
    dispelEmptyTemp, --消解排空温度

    signalTab = {}, --用于保存多个连续的电位信号
    signalCount = 0, --用于统计当前信号个数
    signalE1 = 0, --用于保存信号E1的值
    signalE2 = 0, --用于保存信号E2的值
    signalDrift = 0, --信号漂移
    signalMinTime = 0, --读取信号最小时间
    signalMaxTime = 0, --读取信号最大时间
    signalNumber = 0, --取样数，默认为10

    calculateWay = "", --计算方式: 取对数 或者 取差值 方式
    calculateType = "", --计算类型：有分析，校正,核查。
    calibratePoint= 1,
    calibrationValue = 0, --校正值
    checkValue = 0, --核查值
    caliE1 = {}, --用于保存校正时的E1
    caliE2 = {}, --用于保存校正时的E2
    caliValue = {}, --用于保存校正浓度值
    result = 0, --进行一次流程运行后得到的结果,该结果可能是分析结果/校正结果/...

    hand_control_func = nil;

    alarmContent = "", --用于保存当前报警信息
    logContent = "", --用于保存当前日志信息


    reagentStatus = RESET;

    ssid = 0,
    wifi_connect = 0,
    binIndex = 0, --用于驱动板升级时,控制数据包位置

    flag_save_uart_log = ENABLE, --该变量用于是否保存串口通信log(获取电极电位的时候,会不断的获取,为了减少log,增加该变量进行控制)
    isAutoRangeProcess = false, --用于指示当前流程是否为自动量程切换流程,该变量用于保证只运行一次量程切换流程

    ReadyToReadConfigFile = false, --导入配置文件后,不能第一时间读取,需要过一段时间,该变量用于指示配置文件已经导入,可以延时读取了

    fileLineTab = {},--读取历史文件时,用于缓存文件数据
}


--[[-----------------------------------------------------------------------------------------------------------------
    入口函数
--------------------------------------------------------------------------------------------------------------------]]


--***********************************************************************************************
--初始化函数,系统加载LUA脚本后，立即调用次回调函数
--***********************************************************************************************
function on_init()
    print(_VERSION);
    uart_set_timeout(2000, 1); --设置串口超时, 接收总超时2000ms, 字节间隔超时1ms
    start_timer(0, 100, 1, 0) --开启定时器 0，超时时间 100ms,1->使用倒计时方式,0->表示无限重复
    -- SdPath = "C:/";--这里复一个空字符串,是为了在电脑端调试时不报SdPath为nil的错误
    -- UsbPath = "";

    for i = 1, MaxAction, 1 do
        Sys.actionIdTab[i] = 0;
        Sys.actionNameTab[i] = 0;
    end
    
    Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day,
    Sys.dateTime.hour, Sys.dateTime.min, Sys.dateTime.sec = get_date_time();--获取当前时间

    set_text(SYSTEM_INFO_SCREEN, TouchScreenHardVerId, "190311");--显示触摸屏硬件版本号
    set_text(SYSTEM_INFO_SCREEN, TouchScreenSoftVerId, "20042909");--显示触摸屏软件版本号

    --将需要选择流程的文本框初始化为BLANK_SPACE---------------------------------------------
    for i = 1, 12, 1 do
        set_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId, BLANK_SPACE);
        set_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId, BLANK_SPACE);
        set_text(PROCESS_SET2_SCREEN, ProcessTab[i + 12].typeId, BLANK_SPACE);
        set_text(PROCESS_SET2_SCREEN, ProcessTab[i + 12].nameId, BLANK_SPACE);
        set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId, BLANK_SPACE);
        set_text(PROCESS_EDIT2_SCREEN, TabAction[i + 12].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT2_SCREEN, TabAction[i + 12].nameId, BLANK_SPACE);
        set_text(PROCESS_EDIT3_SCREEN, TabAction[i + 24].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT3_SCREEN, TabAction[i + 24].nameId, BLANK_SPACE);
        set_text(PROCESS_EDIT4_SCREEN, TabAction[i + 36].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT4_SCREEN, TabAction[i + 36].nameId, BLANK_SPACE);
    end
    for i = 1, #PeriodicTab,1 do
        set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[i].processNameId, BLANK_SPACE);
    end
    for i = 1, #TimedProcessTab, 1 do
        set_text(RUN_CONTROL_TIMED_SCREEN, TimedProcessTab[i].textId, BLANK_SPACE);
        TimedProcessTab[i].isFinished = false;
    end
    for i = 1, #HandProcessTab, 1 do
        set_text(RUN_CONTROL_HAND_SCREEN, HandProcessTab[i].textId, BLANK_SPACE);
    end
    
    if record_get_count(SYSTEM_INFO_SCREEN, SysPwdRecordId) == 0 then --表示还未设置初始密码
        record_add(SYSTEM_INFO_SCREEN, SysPwdRecordId, "171717");--运维员的默认密码
        record_add(SYSTEM_INFO_SCREEN, SysPwdRecordId, "172172");--管理员的默认密码
    end
    --系统信息界面下的仪器型号与序列号默认不能设置,需要输入密码后才可设置
    set_enable(SYSTEM_INFO_SCREEN, SetEquipmentTypeTextId, DISABLE);
    set_enable(SYSTEM_INFO_SCREEN, SerialNumberTextId, DISABLE);

    --表示还未设置仪器型号---------------------------------------------------------------------------------------------
    if record_get_count(SYSTEM_INFO_SCREEN, EquipmentTypeRecordId) == 0 then 
        record_add(SYSTEM_INFO_SCREEN, EquipmentTypeRecordId, "2300");
    end
    set_text(SYSTEM_INFO_SCREEN, SetEquipmentTypeTextId, record_read(SYSTEM_INFO_SCREEN, EquipmentTypeRecordId, 0));
    set_equipment_type();

    --表示还未设置仪器序列号-------------------------------------------------------------------------------------------
    if record_get_count(SYSTEM_INFO_SCREEN, SerialNumberRecordId) == 0 then                                     
        record_add(SYSTEM_INFO_SCREEN, SerialNumberRecordId, "0000000000");--
    end
    set_text(SYSTEM_INFO_SCREEN, SerialNumberTextId, record_read(SYSTEM_INFO_SCREEN, SerialNumberRecordId, 0));

    --表示还未设置系统语言-----------------------------------------------------------------------------------------
    if record_get_count(SYSTEM_INFO_SCREEN, SysLanguageRecordId) == 0 then             
        record_add(SYSTEM_INFO_SCREEN, SysLanguageRecordId, CHN);                      
    end                                                                                
    Sys.language = tonumber(record_read(SYSTEM_INFO_SCREEN, SysLanguageRecordId, 0));  
    if Sys.language == CHN then                                                        
        set_value(SYSTEM_INFO_SCREEN, SetChineseId, ENABLE);                           
        set_value(SYSTEM_INFO_SCREEN, SetEnglishId, DISABLE);                          
    else                                                                               
        set_value(SYSTEM_INFO_SCREEN, SetChineseId, DISABLE);                          
        set_value(SYSTEM_INFO_SCREEN, SetEnglishId, ENABLE);                           
    end                                                                                
    changeCfgFileLanguage(Sys.language);                                               

    --反控模式下,隐藏开始按钮
    Sys.runType = get_text(RUN_CONTROL_SCREEN, RunTypeID);
    if Sys.runType == WorkType[Sys.language].controlled then
        set_visiable(RUN_CONTROL_SCREEN, RunStopBtId, 0);
    end

    set_unit();--设置单位
    set_text(MAIN_SCREEN, LastAnalyteId, get_text(RUN_CONTROL_SCREEN, AnalyteSetId));--设置分析物
    --获取最后一次分析结果并进行显示

    if Sys.stateBeforePwrOff == WorkStatus[Sys.language].run and --在运行时断电
       getProcessIdByName(get_text(RUN_CONTROL_SCREEN,SuddenPwrOffProcessId)) ~= 0 then--异常断电流程不为0
        SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态
    else
        SetSysWorkStatus(WorkStatus[Sys.language].stop);--将状态栏显示为停止
    end
    
    SetSysUser(SysUser[Sys.language].maintainer);     --开机之后默认为运维员(调试时使用的代码)
    --   SetSysUser(SysUser[Sys.language].operator);  --开机之后默认为操作员

    Sys.hand_control_func = sys_init;--开机首先进行初始化操作
    --   Sys.hand_control_func = UpdataDriverBoard;--开机读取升级文件(调试时使用的代码)

    

    --以下代码用于测试自动量程切换功能
    -- Sys.rangetypeId = 1;--预设当前量程id为1
    -- Sys.result = 5;--预设当前分析结果为5
    -- process_ready_run(autoRangeProcessId);--运行自动量程切换流程
    --end  测试自动量程切换功能
    --以下代码用于测试当记录满了之后, 是否会删除一条最旧记录的记录(报警记录)
    
    -- for i = 1,8,1 do
    --     Sys.alarmContent = i;
    --     add_history_record(HISTORY_ALARM_SCREEN);--记录报警内容
    -- end

    -- for i = 1,8,1 do
    --     Sys.startTime = Sys.dateTime;
    --     Sys.result = 1;
    --     Sys.checkValue = 1;
    --     Sys.signalE1 = 3000.0
    --     Sys.signalE2 = 4000.0
    --     Sys.rangetypeId = 1
    --     Sys.processTag = "at"
    --     add_history_record(HISTORY_CHECK_SCREEN);--记录报警内容
    -- end

end

--***********************************************************************************************
--定时器超时，执行此回调函数,定时器编号 0~2
--定时器0: 1ms超时中断, 流程相关函数主要运行在该定时器当中
--定时器1: 3ms超时中断, 主要用于判断串口数据回复是否超时
--定时器2: 用于读取E1/E2信号时的超时判断; 用于流程控制中的超时判断
--定时器3: 调用ShowSysTips显示提示后, 该提示只显示5秒钟
--***********************************************************************************************
function on_timer(timer_id)
    if timer_id == 0 then --定时器0,定时时间到
        if Sys.status == WorkStatus[Sys.language].run then--运行
            excute_process();
        elseif Sys.hand_control_func ~= nil then
            Sys.hand_control_func();
        end
    elseif timer_id == 1 then--串口超时
        uart_time_out();
    elseif timer_id == 2 then--等待时间完成
        Sys.waitTimeFlag = RESET;
    elseif timer_id == 3 then--清除底部tips
        ShowSysTips("");
    elseif timer_id == 4 then
        Sys.eWaitTimeFlag = RESET;
    end
end



--***********************************************************************************************
--定时回调函数，系统每隔1秒钟自动调用。
--***********************************************************************************************
function on_systick()
    Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day,
    Sys.dateTime.hour, Sys.dateTime.min, Sys.dateTime.sec = get_date_time();--获取当前时间

    if Sys.status == WorkStatus[Sys.language].readyRun then           --当系统处于待机状态时,
        process_ready_run(processId);
    end

    --判断wifi连接状态
    if string.len(Sys.ssid) > 0 then
        Sys.wifi_connect = get_network_state() --获取网络状态
        wifimode, secumode, ssid, password = get_wifi_cfg() --获取WIFI配置
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
    local state, process = get_upgrade_state()                    --获取更新状态与进度      
    set_value(REMOTE_UPDATE_SCREEN, RemoteUpdateTsStaId, state)  --升级状态提示
end

--***********************************************************************************************
--[控件回调函数
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--***********************************************************************************************
function on_control_notify(screen, control, value)
    if screen == MAIN_SCREEN then--首页
        main_control_notify(screen, control, value);
    elseif screen == RUN_CONTROL_SCREEN then --运行控制界面
        run_control_notify(screen, control, value);
    elseif screen == RUN_CONTROL_PERIOD_SCREEN then
        run_control_period_notify(screen, control, value);
    elseif screen == RUN_CONTROL_TIMED_SCREEN then
        run_control_timed_notify(screen, control, value);
    elseif screen == RUN_CONTROL_HAND_SCREEN then
        run_control_hand_notify(screen, control, value);
    elseif screen == PROCESS_TYPE_SELECT_SCREEN then --流程选择界面
        process_type_select_control_notify(screen, control, value);
    elseif screen == PROCESS_NAME_SELECT_SCREEN then--流程名称选择界面
        process_name_select_control_notify(screen, control, value);
    elseif screen == PROCESS_SET1_SCREEN or screen == PROCESS_SET2_SCREEN then --流程设置1/2界面
        process_set12_control_notify(screen, control, value);
    elseif screen == PROCESS_EDIT1_SCREEN or screen == PROCESS_EDIT2_SCREEN or screen == PROCESS_EDIT3_SCREEN or screen == PROCESS_EDIT4_SCREEN then --流程编辑1/2/3界面
        process_edit_control_notify(screen, control, value);
    elseif screen == RANGE_SELECT_SCREEN then --量程选择界面
        range_select_control_notify(screen, control, value);
    elseif screen == ACTION_SELECT_SCREEN then--动作选择界面
        action_select_control_notify(screen, control, value);
    elseif screen == PROCESS_INIT_SCREEN then--流程设置-开始界面
        process_init_control_notify(screen, control, value);
    elseif screen == PROCESS_INJECT_SCREEN    then--流程设置-取样界面
        process_inject_control_notify(screen, control, value);
    elseif screen == PROCESS_INJECT_ADD_SCREEN    then--流程设置-注射泵加液
        process_inject_add_control_notify(screen, control, value);
    elseif screen == PROCESS_PERISTALTIC_SCREEN    then--流程设置-蠕动泵加液
        process_peristaltic_control_notify(screen, control, value);
    elseif screen == PROCESS_DISPEL_SCREEN then--流程设置-消解
        process_dispel_control_notify(screen, control, value);
    elseif screen == PROCESS_READ_SIGNAL_SCREEN then--流程设置-读取信号
        process_read_signal_control_notify(screen, control, value);
    elseif screen == PROCESS_CALCULATE_SCREEN then--流程设置-计算
        process_calculate_control_notify(screen, control, value);
    elseif screen == PROCESS_VALVE_CTRL_SCREEN then--流程设置-阀操作
        process_valve_ctrl_control_notify(screen, control, value);
    elseif screen == PROCESS_WAIT_TIME_SCREEN then--流程设置-等待时间
        process_wait_time_control_notify(screen, control, value);
    elseif screen == RANGE_SET_SCREEN then --量程设置
        range_set_control_notify(screen, control, value);
    elseif screen == HAND_OPERATE1_SCREEN then --手动操作1
        hand_operate1_control_notify(screen, control, value);
    elseif screen == HAND_OPERATE2_SCREEN then --手动操作2
        hand_operate2_control_notify(screen, control, value);
    elseif screen == HAND_OPERATE3_SCREEN then --手动操作3
        hand_operate3_control_notify(screen, control, value);
    elseif screen == IN_OUT_SCREEN then--输入输出界面
        in_out_control_notify(screen, control, value);
    elseif screen == SYSTEM_INFO_SCREEN then --系统信息界面
        system_info_control_notify(screen, control, value);
    elseif screen == LOGIN_SYSTEM_SCREEN then--登录系统界面
        login_system_control_notify(screen, control, value);
    elseif screen == DIALOG_SCREEN then--对话框界面
        dialog_screen_control_notify(screen, control, value);
    elseif screen == PASSWORD_SET_SCREEN then--密码设置界面
        password_set_control_notify(screen, control, value);
    elseif screen == WIFI_CONNECT_SCREEN then--Wifi设置界面
        wifi_connect_control_notify(screen, control, value);
    elseif screen == REMOTE_UPDATE_SCREEN then
        remote_update_control_notify(screen, control, value);
    elseif  screen == HISTORY_ANALYSIS_SCREEN or screen == HISTORY_CHECK_SCREEN or screen == HISTORY_CALIBRATION_SCREEN or
           screen == HISTORY_ALARM_SCREEN or screen == HISTORY_LOG_SCREEN then
        history_control_notify(screen, control, value);
    elseif screen == PASSWORD_DIALOG_SCREEN then--密码对话框界面
        password_dialog_screen_control_notify(screen, control, value);
    elseif screen ==PROCESS_COPY_SCREEN then--流程复制
        process_copy_control_notify(screen, control, value);
    end

end

--***********************************************************************************************
--当画面切换时，执行此回调函数，screen为目标画面。
--***********************************************************************************************
function on_screen_change(screen)
    if (screen == RANGE_SELECT_SCREEN) then --跳转到量程选择
        goto_range_select();
    elseif screen == PROCESS_NAME_SELECT_SCREEN then --跳转到流程名称选择
        goto_ProcessNameSelect();
    elseif screen == HISTORY_ANALYSIS_SCREEN or screen == HISTORY_CHECK_SCREEN or
    screen == HISTORY_CALIBRATION_SCREEN or screen == HISTORY_ALARM_SCREEN or screen == HISTORY_LOG_SCREEN then--跳转到历史记录界面
        setHistoryScreen(screen);
    elseif screen == LOGIN_SYSTEM_SCREEN then--登录系统
        goto_LoginSystem();
    elseif screen == PASSWORD_SET_SCREEN then--密码设置
        goto_PasswordSet();
    elseif screen == WIFI_CONNECT_SCREEN then--密码设置
        goto_WifiConnect();
    elseif screen == PASSWORD_DIALOG_SCREEN then --密码对话框
        goto_dialog_screen();
    elseif screen == RUN_CONTROL_PERIOD_SCREEN then --跳转到周期设置界面
        goto_period_mode_set_screen();
    end
end

--***********************************************************************************************
--插入 U 盘后，执行此回调函数
--***********************************************************************************************
function on_usb_inserted(dir)
    UsbPath = dir;
    ShowSysTips(TipsTab[Sys.language].insertUsb .. UsbPath);
end

--***********************************************************************************************
--拔出 U 盘后，执行此回调函数
--***********************************************************************************************
function on_usb_removed()
    ShowSysTips(TipsTab[Sys.language].pullOutUSB..UsbPath);
    UsbPath = nil;
end

--***********************************************************************************************
--插入 SD 卡后，执行此回调函数
--***********************************************************************************************
function on_sd_inserted(dir)
    SdPath = dir;
    ReadFileToConfigStr();--将配置文件加载到ConfigStr数组
    checkHistoryFile();--检测并创建空的历史记录文件
    ShowSysTips(TipsTab[Sys.language].insertSd .. SdPath);
end

--***********************************************************************************************
--拔出 SD 卡后，执行此回调函数
--***********************************************************************************************
function on_sd_removed()
    ShowSysTips(TipsTab[Sys.language].pullOutSd..SdPath);
    SdPath = nil;
end


--[[-----------------------------------------------------------------------------------------------------------------
    系统初始化函数
--------------------------------------------------------------------------------------------------------------------]]
--***********************************************************************************************
--系统初始化, 一般在开机或者急停时调用该函数
--***********************************************************************************************
function sys_init()
    local softVer1, softVer2, hardVer1, hardVer2;

    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then
        return;
    end

    if Sys.processStep == 1 then--第一步: 关闭阀11
        set_enable(RUN_CONTROL_SCREEN, RunStopBtId, DISABLE)--系统初始化时，禁止按开始按钮
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
        on_uart_send_data(uartSendTab.getDrvVer, NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 6 then--第六步：显示驱动版本版本号 并 获取传感版与计算卡硬件版本号
        if UartArg.reply_sta == SEND_OK then
            softVer1 = bcd_to_string(UartArg.recv_data[10]) .. "." .. bcd_to_string(UartArg.recv_data[11]);
            hardVer1 = bcd_to_string(UartArg.recv_data[12]) .. "." .. bcd_to_string(UartArg.recv_data[13]);
            set_text(SYSTEM_INFO_SCREEN, DriverBoardSoftVerId, softVer1);--显示软件版本号
            set_text(SYSTEM_INFO_SCREEN, DriverBoardHardVerId, hardVer1);--显示硬件版本号
        end
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getSCHardVer, NEED_REPLY);--获取传感版与计算卡硬件版本号
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 7 then--第七步：显示传感版与计算卡硬件版本号 并 获取传感版与计算卡软件版本号
        if UartArg.reply_sta == SEND_OK then
            hardVer1 = bcd_to_string(UartArg.recv_data[3]) .. bcd_to_string(UartArg.recv_data[4]);
            set_text(SYSTEM_INFO_SCREEN, SensorBoardHardVerId, hardVer1);
            hardVer1 = bcd_to_string(UartArg.recv_data[5]) .. bcd_to_string(UartArg.recv_data[6]);
            hardVer2 = bcd_to_string(UartArg.recv_data[7]) .. bcd_to_string(UartArg.recv_data[8]);
            set_text(SYSTEM_INFO_SCREEN, CalcBoardHardVerId, hardVer1 .. hardVer2);
        end
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getSCSoftVer, NEED_REPLY);--获取传感版与计算卡软件版本号
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 8 then--第八步：显示感版与计算卡软件版本号
        if UartArg.reply_sta == SEND_OK then
            softVer1 = bcd_to_string(UartArg.recv_data[3]) .. bcd_to_string(UartArg.recv_data[4]);
            set_text(SYSTEM_INFO_SCREEN, SensorBoardSoftVerId, softVer1);
            softVer1 = bcd_to_string(UartArg.recv_data[5]) .. bcd_to_string(UartArg.recv_data[6]);
            softVer2 = bcd_to_string(UartArg.recv_data[7]) .. bcd_to_string(UartArg.recv_data[8]);
            set_text(SYSTEM_INFO_SCREEN, CalcBoardSoftVerId, softVer1 .. softVer2);
        end
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 9 then --第九步:初始化结束
        set_enable(RUN_CONTROL_SCREEN, RunStopBtId, ENABLE)--初始化完成，使能开始按钮
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
    getSCSoftVer = {[0] = 238, 3, 16, 3, 0, 3, 0, 0, len = 6, note = {[CHN] = "获取软件版本", [ENG] = "Get Soft Ver." } },
    getSCHardVer = {[0] = 238, 3, 16, 2, 0, 3, 0, 0, len = 6, note = {[CHN] = "获取硬件版本", [ENG] = "Get Hard Ver." } },
    getTemp    = {[0] = 238, 3, 16, 10, 0, 1, 0, 0, len = 6, note = {[CHN] = "测量池温度", [ENG] = "Get Temperature" } },
    getVoltage = {[0] = 238, 3, 16, 12, 0, 1, 0, 0, len = 6, note = {[CHN] = "光电管电压", [ENG] = "Get Voltage" } },
    setLedCurrnet = {[0] = 238, 3, 16, 13, 0, 1, 0, 0, len = 6, note = {[CHN] = "设置LED电流", [ENG] = "Set Led Current" } },
    openLed    = {[0] = 238, 6, 16, 14, 0, 1, 0, 0, len = 6, note = {[CHN] = "开LED", [ENG] = "Open Led" } },
    closeLed = {[0] = 238, 6, 16, 14, 0, 0, 0, 0, len = 6, note = {[CHN] = "关LED", [ENG] = "Close Led" } },
    updateCalcSoft = {[0] = 238, 6, 16, 4, 0, 0, 0, 0, len = 6, note = {[CHN] = "更新计算板", [ENG] = "Update Calc. BD." } },
    getDrvVer = {[0] = 224, 7, 0, 0, 0, 0, 0, 0, len = 6, note = {[CHN] = "驱动版本号", [ENG] = "Get Drver BD. Ver" } },
    openValco = {[0] = 224, 39, 0, 0, 0, 0, 0, 0, len = 6, note = {[CHN] = "开十通阀", [ENG] = "Open Valco" } },
    openV11    = {[0] = 224, 8, 0, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "开阀11", [ENG] = "Open valve 11" } },
    closeV11 = {[0] = 224, 8, 0, 0, 0, 0, 0, 0, len = 6, note = {[CHN] = "关阀11", [ENG] = "Close valve 11" } },
    openV12    = {[0] = 224, 9, 0, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "开阀12", [ENG] = "Open valve 12" } },
    closeV12 = {[0] = 224, 9, 0, 0, 0, 0, 0, 0, len = 6, note = {[CHN] = "关阀12", [ENG] = "Close valve 12" } },
    enInject1 = {[0] = 224, 15, 0, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "使能注射泵", [ENG] = "Enbale injector" } },
    mvInject1To = {[0] = 224, 13, 0, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "移动注射泵", [ENG] = "Move injector" } },
    setInject1Spd = {[0] = 224, 14, 0, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "设置注射泵速度", [ENG] = "Set injector speed" } },
    rstInject1 = {[0] = 224, 13, 1, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "复位注射泵", [ENG] = "Reset injector" } },
    updateDrv = {}, --该变量用于驱动板升级
}



UartArg = {
    repeat_times = 0, --用于记录重发次数
    repeat_data, --用于保存本次重发数据
    note = "", --用于保存串口指令说明
    recv_data, --用于保存接收到的数据
    reply_data = {[0] = 0, [1] = 0 }, --用于保存需要接受到的回复数据
    reply_sta = SEND_OK;--用于指示发送的串口指令是否有正确回复
    lock = UNLOCKED, --用于指示串口是否上锁, 当发送一条需要等待回复的串口指令时,串口上锁, 当收到回复时,串口解锁
};


--***********************************************************************************************
--串口接受函数 
--串口波特率为38400, 传送1bit需要 1000000/38400 = 26us, 传送一个字节的数据需要10bit,则传送1Byte数据需要260us
--***********************************************************************************************
function on_uart_recv_data(packet)

    local rev_len = 0;

    --获取数据长度
    for i = 0, 50, 1 do
        rev_len = i;
        if packet[i] == nil then
            break;
        end
    end

    --将接受到的数据保存到全局变量
    UartArg.recv_data = packet;

    --当前为反控模式
    if Sys.runType == WorkType[Sys.language].controlled and package[0] == tonumber(get_text(IN_OUT_SCREEN, IOSET_ComputerAddr)) then
        ComputerControl(packet);
        --判断是否为指令数据回复
    elseif packet[0] == UartArg.reply_data[0] and packet[1] == UartArg.reply_data[1] then
        UartArg.repeat_times = 0;--重发计数请0
        UartArg.reply_sta = SEND_OK;
        UartArg.lock = UNLOCKED;
        stop_timer(1)--停止超时定时器
    end

    --添加通信记录
    local UartDateTime = string.format("%02d-%02d %02d:%02d", Sys.dateTime.mon, Sys.dateTime.day, Sys.dateTime.hour, Sys.dateTime.min);
    local UartData = "";--将需要发送的数据保存到该字符串中
    for i = 0, rev_len - 1, 1 do
        UartData = UartData .. string.format("%02x ", packet[i]);
    end
    --判断是否打开串口通信记录功能
    if Sys.flag_save_uart_log == ENABLE then
        record_add(HAND_OPERATE4_SCREEN, UartRecordId, "RX;" .. UartDateTime .. ";" .. UartData .. ";" .. TipsTab[Sys.language].reply);
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
        start_timer(1, 2000, 1, 0); --开启定时器1，超时时间 2s, 1->使用倒计时方式,0->表示无限重复
        UartArg.lock = LOCKED;      --给串口上锁, 收到回复后自动解锁
        UartArg.repeat_data = packet;--设置重发数据
        UartArg.repeat_times = 0;
        UartArg.reply_data[0] = packet[0];--设置回复数据,用于判断是否成功接受到回复
        UartArg.reply_data[1] = packet[1];
    end

    packet[packet.len], packet[packet.len + 1] = CalculateCRC16(packet, packet.len);--计算crc16
    UartArg.reply_sta = SEND_FAIL;
    print(packet.note[Sys.language]);--调试输出,方便电脑端调试时查看串口收发数据
    uart_send_data(packet) --将数据通过串口发送出去

    UartArg.note = packet.note[Sys.language];--在保存串口回复超时的日志时，需要用到UartArg.note

    --以下代码功能: 每发送一次数据,就将该数据保存在手动操作4的串口收发记录当中,方便从触摸屏查看.
    local UartDateTime = string.format("%02d-%02d %02d:%02d", Sys.dateTime.mon, Sys.dateTime.day, Sys.dateTime.hour, Sys.dateTime.min);
    local UartData = "";--将需要发送的数据保存到该字符串中
    --判断为升级数据,只保存前6字节与后两字节的CRC
    if packet[0] == 208 and packet[1] == 16 and packet[2] == 48 then
        for i = 0, 5, 1 do
            UartData = UartData .. string.format("%02x ", packet[i]);
        end
        UartData = UartData .. "..." .. string.format("%02x ", packet[packet.len]) .. string.format("%02x ", packet[packet.len + 1]);
    else
        for i = 0, packet.len + 1, 1 do
            UartData = UartData .. string.format("%02x ", packet[i]);
        end
    end
    --判断是否打开串口通信记录功能
    if Sys.flag_save_uart_log == ENABLE then
        record_add(HAND_OPERATE4_SCREEN, UartRecordId, "TX;" .. UartDateTime .. ";" .. UartData .. ";" .. packet.note[Sys.language]);--添?油ㄐ偶锹?
    end

end



--***********************************************************************************************
--串口接受超时函数
--进入到该函数表示串口一定回复超时, 因为如果回复成功, 在on_uart_recv_data函数中就会停止定时器1,就不会进入到该函数
--***********************************************************************************************
function uart_time_out()
    UartArg.repeat_times = UartArg.repeat_times + 1;
    if UartArg.repeat_times <= 3 then
        uart_send_data(UartArg.repeat_data);--数据重发
    else  --重发3次都没有回复,不再重发
        print("串口接受超时");
        --判断为升级驱动板数据,此时升级失败
        if UartArg.repeat_data[0] == 208 and UartArg.repeat_data[1] == 16 and UartArg.repeat_data[2] == 48 then
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
        Sys.alarmContent = UartArg.note .. TipsTab[Sys.language].uartTimeOut;--初始化报警内容（串口回复超时）
        add_history_record(HISTORY_ALARM_SCREEN);--记录报警内容
        ShowSysAlarm(Sys.alarmContent);--在底部状态栏显示报警信息
    end
end

--***********************************************************************************************
--右移一位的操作,在计算校验码中使用
--***********************************************************************************************
function right_shift_one(data)
    local new_data;
    if math.fmod(data, 2) == 1 then
        new_data = math.modf((data - 1) / 2);
    else
        new_data = math.modf(data / 2);
    end
    return new_data
end

--***********************************************************************************************
--异或操作,在计算校验码中使用
--***********************************************************************************************
function xor(num1, num2)
    local tmp1 = num1
    local tmp2 = num2
    local str = ""
    repeat
        local s1 = tmp1 % 2
        local s2 = tmp2 % 2
        if s1 == s2 then
            str = "0" .. str
        else
            str = "1" .. str
        end
        tmp1 = math.modf(tmp1 / 2)
        tmp2 = math.modf(tmp2 / 2)
    until (tmp1 == 0 and tmp2 == 0)
    return tonumber(str, 2)
end


--***********************************************************************************************
--计算校验码: ModeBusCRC16
--***********************************************************************************************
function CalculateCRC16(data, len)
    local crc16 = 65535;
    for i = 0, len - 1, 1 do
        crc16 = xor(crc16, data[i]);
        for j = 0, 7, 1 do
            if math.fmod(crc16, 2) == 1 then
                crc16 = right_shift_one(crc16);
                crc16 = xor(crc16, 40961);
            else
                crc16 = right_shift_one(crc16);
            end
        end
    end
    local crc1 = math.fmod(crc16, 256);
    local crc2 = math.modf(crc16 / 256);
    return crc1, crc2;
end


--[[-----------------------------------------------------------------------------------------------------------------
    首页/状态栏显示函数
--------------------------------------------------------------------------------------------------------------------]]
LastAnalysisTimeId = 20;   --分析时间
LastAnalyteId = 17;        --分析物
LastResultId = 18; --分析结果
LastResultUnitId = 19;   --单位
LastResultE1Id = 25;     --E1
LastResultE2Id = 26;     --E2
-- NextProcessTimeTextId = 2  --下次启动时间
ProgressBarId = 14--进度条，范围0-100

SysWorkStatusId = 901;   --工作状态
SysCurrentActionId = 902;--当前动作
SysUserNameId = 903      --显示用户
SysAlarmId = 904;        --显示当前告警信息
SysTipsId = 905;         --界面底部用于显示提示信息的文本id

StopSystemDialogMenuId = 3;
StartTimeId = 4;
NextStartTimeId = 6;

function main_control_notify(screen, control, value)
    if control == StopSystemDialogMenuId and value == ENABLE then
        SystemStop(stopByClickButton);
    elseif control == 110 then
        ReadFileToConfigStr();
    end
end


--***********************************************************************************************
--  在底部的状态栏显示提示信息
--***********************************************************************************************
function ShowSysTips(tips)
    for i = 1, #PublicTab, 1 do
        set_text(PublicTab[i], SysTipsId, tips);
    end
    stop_timer(3);
    start_timer(3, 5000, 1, 0) --开启定时器 3，超时时间 5000ms,1->使用倒计时方式,1->表示只执行一次
end

--***********************************************************************************************
--  设置工作状态
--***********************************************************************************************
function SetSysWorkStatus(status)

    if Sys.status ~= status then
        WriteParaToConfigStrAndFile(2);--系统状态改变,将其存入flash
    end

    Sys.status = status;--设置系统状态为运行
    --在底部的状态栏显示工作状态:停止/运行/待机
    for i = 1, #PublicTab, 1 do
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
    for i = 1, #PublicTab, 1 do
        set_text(PublicTab[i], SysCurrentActionId, action);
    end
end


--***********************************************************************************************
--  在底部的状态栏显示告警信息
--***********************************************************************************************
function ShowSysAlarm(alarm)
    for i = 1, #PublicTab, 1 do
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
    if Sys.language == CHN then
        uartSendTab.openValco.note[Sys.language] = "开十通阀" .. channel;
    else
        uartSendTab.openValco.note[Sys.language] = "Open Valco " .. channel;
    end
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
RunTypeID = 1;--运行方式对应的文本空间ID
AnalyteSetId = 2;--分析物选择
CodeSetId = 3;--代码
OfflineModeId = 4;--离线模式
ReagentRemainChkId = 5;--试剂余量开关
RangeAutoSwitchId = 6;--量程自动切换
SuddenPwrOffProcessId = 7;--异常断电执行的流程
DecimalTextId = 8;--小数位数设置
SuddenPowerOff = 107;--异常断电流程选择

RunTypeMenuId = 243;--运行方式菜单
RunStopBtId = 229;--运行状态切换按钮"初始化""停止"按钮
RunModeSetBtId = 25; --运行模式设置按钮
RUNCTRL_TextSid = 1;
RUNCTRL_TextEid = 8;

--***********************************************************************************************
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--***********************************************************************************************
function run_control_notify(screen, control, value)
    if control == RunStopBtId then--运行与停止按钮
        if get_value(RUN_CONTROL_SCREEN, control) == ENABLE then --按钮按下,此时系统状态变为待机运行
            SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态
            process_ready_run(processId);--开始运行前的一些初始化操作
        else--按钮松开,此时系统状态应变为停止
            Sys.logContent = TipsTab[Sys.language].stopByHand;--"手动停止系统"
            add_history_record(HISTORY_LOG_SCREEN);--添加一条停止流程的日志信息
            SystemStop(stopByClickButton);
        end
    --运行方式---------------------------------------------------------------------
    elseif control == RunTypeMenuId then
        Sys.runType = get_text(RUN_CONTROL_SCREEN, RunTypeID);
        if Sys.runType == WorkType[Sys.language].controlled then--判断为反控, 隐藏运行按钮
            set_visiable(RUN_CONTROL_SCREEN, RunStopBtId, 0);
        else
            set_visiable(RUN_CONTROL_SCREEN, RunStopBtId, 1);
        end
    --设置按钮----------------------------------------------------------------------
    elseif control == RunModeSetBtId and value == ENABLE then
        if Sys.runType == WorkType[Sys.language].period then--判断为周期模式
            change_screen(RUN_CONTROL_PERIOD_SCREEN);
        elseif Sys.runType == WorkType[Sys.language].timed then--判断为定时模式
            change_screen(RUN_CONTROL_TIMED_SCREEN);
        elseif Sys.runType == WorkType[Sys.language].hand then--判断为手动模式
            change_screen(RUN_CONTROL_HAND_SCREEN);
        elseif Sys.runType == WorkType[Sys.language].controlled then--判断为反控模式
        end
    --分析物----------------------------------------------------------------------
    elseif control == AnalyteSetId then
        set_text(MAIN_SCREEN, LastAnalyteId, get_text(RUN_CONTROL_SCREEN, control));
    --异常断电流程选择-------------------------------------------------------------
    elseif control == SuddenPowerOff then
        process_name_select_set(screen, control-100);
    --保存按钮---------------------------------------------------------------------
    elseif control == 50 and value == ENABLE then
        WriteParaToConfigStrAndFile(2);
    end
end


--***********************************************************************************************
--当修改了某个流程时,调用该函数,一般按了流程名称选择界面中的确认按钮会调用该函数
--control 运行控制界面中流程文本的id
--***********************************************************************************************
function getProcessIdByName(processName)
    local processId = 0;
    if processName == BLANK_SPACE then
        return processId;
    end
    --遍历流程1-12, 找到运行控制界面中设置的流程名称,在流程设置1界面中对应的流程序号
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then
            processId = i;
            break;
        end
    end
    if processId == 0 then
        --遍历流程13-24, 找到运行控制界面中设置的流程名称,在流程设置1界面中对应的流程序号
        for i = 13, 24, 1 do
            if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then
                processId = i;
                break;
            end
        end
    end
    return processId;
end



--***********************************************************************************************
--判断是否闰年
--返回1表示闰年, 返回0表示平年
--***********************************************************************************************
function isLeapYear(year)
    if math.fmod(year, 4) == 0 and math.fmod(year, 100) ~= 0 then
        return 1;
    elseif math.fmod(year, 400) == 0 then
        return 1;
    end
    return 0;
end

--***********************************************************************************************
--根据加上的天数,设置新的开始日期
--diffDays:需要加上的天数
--***********************************************************************************************
function set_period_start_date(diffDays)
    normalMonthDays = {[1] = 31, [2] = 28, [3] = 31, [4] = 30, [5] = 31, [6] = 30, [7] = 31, [8] = 31, [9] = 30, [10] = 31, [11] = 30, [12] = 31 };

    local year = Sys.startTime.year;
    local mon = Sys.startTime.mon;
    local day = Sys.startTime.day;

    PeriodicTab.sTime.year = year;
    PeriodicTab.sTime.mon = mon;
    PeriodicTab.sTime.day = day;

    if diffDays == 0 then
        return
    end

    --1.get years (days >=366 or 365)
    local daysAyear = 365;
    if isLeapYear(year) then
        daysAyear = 366;
    end
    while math.modf(diffDays / daysAyear) >= 1 do -- 大于365天或者366天
        diffDays = diffDays - daysAyear;
        year = year + 1;
        if isLeapYear(year) then
            daysAyear = 366;
        end
    end

    --2.get months (days < 366 or 365)
    if isLeapYear(year) then
        normalMonthDays[2] = 29;
    end
    while math.modf(diffDays / normalMonthDays[mon]) >= 1 do
        diffDays = diffDays - normalMonthDays[mon];
        mon = mon + 1;
        if mon >= 13 then
            year = year + 1;
            if isLeapYear(year) then
                normalMonthDays[2] = 29;
            end
            mon = math.fmod(mon, 12);
        end
    end

    --3.get days
    if isLeapYear(year) then
        normalMonthDays[2] = 29;
    end
    if (diffDays + day <= normalMonthDays[mon]) then
        day = diffDays + day;
    else
        day = diffDays + day - normalMonthDays[mon];
        mon = mon + 1;
        if mon > 12 then
            year = year + 1;
            mon = math.fmod(mon, 12);
        end
    end

    PeriodicTab.sTime.year = year;
    PeriodicTab.sTime.mon = mon;
    PeriodicTab.sTime.day = day;
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.yearId, PeriodicTab.sTime.year);
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.monId, PeriodicTab.sTime.mon );
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.dayId, PeriodicTab.sTime.day );
    
end

--***********************************************************************************************
--根据频率设置下一次开始的时间, 在自动模式下, 进行一次流程后会调用该函数计算下次流程开始时间.
--minFreq: 天数
--***********************************************************************************************
function setPeriodNextStartTimeByFreq(minFreq)
    local dayHour = 1440;--24 * 60 一天有多少分钟
    local hour = Sys.startTime.hour;
    local min = Sys.startTime.min;
    
    local minTotal = minFreq + hour * 60 + min;

    local minRemain = math.fmod(minTotal, dayHour);

    PeriodicTab.sTime.hour = math.modf(minRemain / 60);
    PeriodicTab.sTime.min = math.fmod(minRemain, 60);

    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.hourId, PeriodicTab.sTime.hour);--设置小时
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.minId, PeriodicTab.sTime.min);--设置分钟

    set_period_start_date(math.modf(minTotal / dayHour));--在该函数中设置年/月日

    --显示下次自动运行启动流程的时间
    set_text(MAIN_SCREEN, NextStartTimeId, string.format("%d-%02d-%02d  %02d:%02d",
             PeriodicTab.sTime.year,PeriodicTab.sTime.mon,PeriodicTab.sTime.day,
             PeriodicTab.sTime.hour,PeriodicTab.sTime.min));

    WriteParaToConfigStrAndFile(2);--周期设置界面有更新, 需要保存到配置文件当中
end

--***********************************************************************************************
--将当前时间设置为周期开始时间
--***********************************************************************************************
function setPeriodStartTime()
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.yearId, Sys.dateTime.year);
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.monId,  Sys.dateTime.mon );
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.dayId,  Sys.dateTime.day);
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.hourId, Sys.dateTime.hour);--设置小时
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.minId,  Sys.dateTime.min);--设置分钟
    WriteParaToConfigStrAndFile(2);--周期设置界面有更新, 需要保存到配置文件当中
end

--***********************************************************************************************
--通过流程类型初始化流程标识
--***********************************************************************************************
function getTagByProcessType(type)
    local tag = "";
    if type == ProcessItem[Sys.language][1] then--水样分析
        tag = "at"
    elseif type == ProcessItem[Sys.language][5] then--"零点核查"
        tag = "dz"
        Sys.checkValue = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, 17))
    elseif type == ProcessItem[Sys.language][6] then--"标样核查"
        tag = "sc"
        Sys.checkValue = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, 21))
    elseif type == ProcessItem[Sys.language][7] then--"量程核查"
        tag = "ds"
        Sys.checkValue = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, 29))
    elseif type == ProcessItem[Sys.language][8] then-- "加标回收"
        tag = "ra"
    elseif type == ProcessItem[Sys.language][9] then--"平行样"
        tag = "pt"
    elseif type == ProcessItem[Sys.language][10] then--"线性核查"
        tag = "lc"
    elseif type == ProcessItem[Sys.language][11] then--"空白测试"
        tag = "bt"
        Sys.checkValue = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, 25))
    elseif type == ProcessItem[Sys.language][12] then--"空白校准"
        tag = "bs"
    elseif type == ProcessItem[Sys.language][13] then--"标样校准"
        tag = "cs"
    elseif type == ProcessItem[Sys.language][13] then--"实际水样比对"
        tag = "ac"
    end
    return tag;
end

--***********************************************************************************************
--[周期模式下,获取需要运行的流程id
--***********************************************************************************************
function get_period_process_id()
    print("调用get_period_process_id");
    local processId = 0;
    --判断本次需要运行哪一类流程
    for i = 2,#PeriodicTab,1 do
        if PeriodicTab[i].isReadyRun == true then
            print("processName="..get_text(RUN_CONTROL_PERIOD_SCREEN,PeriodicTab[i].processNameId ));
            processId = getProcessIdByName(get_text(RUN_CONTROL_PERIOD_SCREEN,PeriodicTab[i].processNameId ));
            break;
        end
    end
    print("processId="..processId);
    return processId;
end

--***********************************************************************************************
--[获取自动量程切换时需要运行的流程id
--当点击开始按钮时,调用该函数获取需要执行的流程id
--***********************************************************************************************
function get_auto_range_process_id()
    local destRangeId = 0;
    local processId = 0;

    if get_text(RUN_CONTROL_SCREEN, RangeAutoSwitchId) == VariableOnOff[Sys.language].close then
        return processId;
    end

    --浓度偏高当前量程为1
    if Sys.rangetypeId == 1 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN, RangeTab[1].HighId)) then
        destRangeId = 2;
        --浓度偏高当前量程为2
    elseif Sys.rangetypeId == 2 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN, RangeTab[2].HighId)) then
        destRangeId = 3;
        --浓度偏低当前量程为2
    elseif Sys.rangetypeId == 2 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN, RangeTab[2].LowId)) then
        destRangeId = 1;
        --浓度偏低当前量程为3
    elseif Sys.rangetypeId == 3 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN, RangeTab[3].LowId)) then
        destRangeId = 2;
    end

    if destRangeId == 0 then
        return processId;
    end

    print("量程自动切换,查找量程为" .. destRangeId .. "的流程");

    --查找类型为分析且量程为destRangeId的 流程的id
    for i = 1, 12, 1 do
        if get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId) == ProcessItem[Sys.language][1] and--类型为分析
        tonumber(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId)) == destRangeId then--量程为目的量程
            processId = i;
            break;
        end
    end
    if processId == 0 then--在流程设置1界面未找到符合条件的流程, 则在流程设置2界面继续查找
        for i = 13, 24, 1 do
            if get_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId) == ProcessItem[Sys.language][1] and--类型为分析
            tonumber(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].rangeId)) == destRangeId then--量程为目的量程
                processId = i;
                break;
            end
        end
    end
    --如果找到了量程自动切换的流程, 则保存一条log记录
    if processId ~= 0 then
        Sys.logContent = TipsTab[Sys.language].autoRangeProcess .. processId;
        ShowSysTips(Sys.logContent);
        add_history_record(HISTORY_LOG_SCREEN);
    end
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

    if Sys.stateBeforePwrOff == WorkStatus[Sys.language].run then --在运行时断电
        processId = getProcessIdByName(get_text(RUN_CONTROL_SCREEN,SuddenPwrOffProcessId));--异常断电流程
        return processId;
    end
    --------------------------手动模式 ,这个比较简单,只有一个流程可设置--------------------------------
    if Sys.runType == WorkType[Sys.language].hand then
        --手动模式下,计算出总共设置了几个流程
        Sys.handProcessTotal = 0;
        for i = 1, #HandProcessTab, 1 do
            if get_text(RUN_CONTROL_HAND_SCREEN,i) ~= BLANK_SPACE then
                Sys.handProcessTotal = Sys.handProcessTotal + 1;
            end
        end
        
        local real_i = 0;
        --因为周期流程有5个(#HandProcessTab值为5),所以需要循环查找6次,形成一个闭环
        for i = Sys.handProcessIndex, Sys.handProcessIndex + #HandProcessTab, 1 do 
            if i > #HandProcessTab then
                real_i = i - #HandProcessTab;
            else
                real_i = i;
            end
           
            --流程序号不为0 ,表示该流程有设置,跳出循环
            processId = getProcessIdByName(get_text(RUN_CONTROL_HAND_SCREEN, HandProcessTab[real_i].textId))
            if processId  ~= 0 then
                Sys.handProcessIndex = real_i;
                break;
            end
        end
        ----------------------自动模式  自动模式中的定时时间错过了会直接跳过该流程--------------------------
    elseif Sys.runType == WorkType[Sys.language].period then
        local currentDateTime = string.format("%d%02d%02d%02d%02d",
        Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day,Sys.dateTime.hour, Sys.dateTime.min);--将当前时间转换为字符串

        Sys.periodStartDateTime = string.format("%d%02d%02d%02d%02d",
                                    tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.yearId)), 
                                    tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.monId )), 
                                    tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.dayId )), 
                                    tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.hourId)), 
                                    tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.minId )));
        
        local processName = get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[1].processNameId);
        if Sys.periodStartDateTime <= currentDateTime and processName ~= BLANK_SPACE then
            --设置的周期开始时间到了,且水样分析流程不为空
            processId = getProcessIdByName(processName);
            --在周期模式设置界面,设置当前开始时间
            setPeriodStartTime();
        end
    ----------------------定时模式 到指定的时间后运行指定的流程--------------------------
    elseif Sys.runType == WorkType[Sys.language].timed then
        local index = Sys.dateTime.hour+1;
        local processName = get_text(RUN_CONTROL_TIMED_SCREEN, index);
        if   processName ~= BLANK_SPACE and TimedProcessTab[index].isFinished == false then --是否有设置流程
            processId = getProcessIdByName(processName);
            TimedProcessTab[index].isFinished = true;
        end

        TimedProcessTab[index+1].isFinished = false;--将下个小时需要运行的流程标志置清空,保证时间到了之后能够运行
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
    for i = 1, 12, 1 do
        set_enable(PROCESS_SET1_SCREEN, ProcessTab[i].typeId, state);
        set_enable(PROCESS_SET1_SCREEN, ProcessTab[i].nameId, state);
        set_enable(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId, state);
        set_enable(PROCESS_SET1_SCREEN, ProcessTab[i].deleteId, state);

        set_enable(PROCESS_SET2_SCREEN, ProcessTab[i + 12].typeId, state);
        set_enable(PROCESS_SET2_SCREEN, ProcessTab[i + 12].nameId, state);
        set_enable(PROCESS_SET2_SCREEN, ProcessTab[i + 12].rangeId, state);
        set_enable(PROCESS_SET2_SCREEN, ProcessTab[i + 12].deleteId, state);

        set_enable(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, state);
        set_enable(PROCESS_EDIT1_SCREEN, TabAction[i].nameId, state);

        set_enable(PROCESS_EDIT2_SCREEN, TabAction[i + 12].typeId, state);
        set_enable(PROCESS_EDIT2_SCREEN, TabAction[i + 12].nameId, state);

        set_enable(PROCESS_EDIT3_SCREEN, TabAction[i + 24].typeId, state);
        set_enable(PROCESS_EDIT3_SCREEN, TabAction[i + 24].nameId, state);

        set_enable(PROCESS_EDIT4_SCREEN, TabAction[i + 36].typeId, state);
        set_enable(PROCESS_EDIT4_SCREEN, TabAction[i + 36].nameId, state);
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
    local configFile = io.open(SdPath .. "config/" .. index, "r")          --打开文本
    if configFile ~= nil then    
        configFile:seek("set")                  --把文件位置定位到开头
        ConfigStr[index] = configFile:read("a") --从当前位置读取整个文件，并赋值到字符串
        configFile:close()                      --关闭文本
    else
        ShowSysTips("未找到配置文件");
    end
    Sys.processFileStr = ConfigStr[index];
    
    --根据流程id过去流程类型与流程名称-----------------------------------------------
    local tagString = GetSubString(ConfigStr[0], cfgFileTab[1].sTag, cfgFileTab[1].eTag);--截取<ProcessSet>标签之间的字符串
    local tab = split(tagString, ",")--将读出的字符串按逗号分割,并以此存入tab表
    Sys.processType = tab[index * 3 - 2];
    Sys.processName = tab[index * 3 - 1];
    Sys.processRange = tab[index * 3 - 0];
    Sys.processTag = getTagByProcessType(Sys.processType);
    print("流程Id="..index.."类型="..Sys.processType.." 名称="..Sys.processName.. " 量程="..Sys.processRange);
    
    --统计action个数,给Sys.actionTotal变量,以及SystemArg.actionTab赋值 ----------------------
    --Sys.actionTab数组长度为36,表示最多可记录36个action, 其值保存的是当前步骤对应的action序号
    --假如SystemArg.actionIdTab[1] = 3, 表示第一步就执行序号为3的action, 也意味着序号为1/2的action为空格(没有设置)
    if index <= 12 then
        Sys.rangetypeId = tonumber(get_text(PROCESS_SET1_SCREEN, ProcessTab[index].rangeId));
    elseif index <= 24 then
        Sys.rangetypeId = tonumber(get_text(PROCESS_SET2_SCREEN, ProcessTab[index].rangeId));
    end
    local actionString = GetSubString(ConfigStr[index],"<action0>","</action0>")
    local contentTabStr = GetSubString(actionString, "<content>", "</content>");--再截取<content>标签中的内容
    tab = split(contentTabStr, ",");--分割字符串,并将字符串存入tab数组
    Sys.actionTotal = 0;
    --将流程编辑1界面中的动作id 与 动作名称保存到 tab数组中
    for i = 1, 96, 2 do -- tab中[1][2]分别保存了一个动作的类型与名称,占用了2个, 由于我们是统计action个数,所以这里步进需要设置为2
        if tab[i] ~= BLANK_SPACE then--判断动作类型不为nil
            print(((i + 1) / 2).."="..tab[i])
            Sys.actionTotal = Sys.actionTotal + 1;--action个数+1
            Sys.actionIdTab[Sys.actionTotal] = math.modf((i + 1) / 2);--由于这个for循环是从1开始,且步进是2,所以需要取 (i+1)/2 (1,3,5...)
            Sys.actionNameTab[Sys.actionTotal] = tab[i + 1];--i+1对应了(2,4,6...)
        end
    end
    ShowSysTips(" 名称="..Sys.processName.." 步数="..Sys.actionTotal);
    ------------------------试剂余量判断----------------------------------------------------------
    --统计跑完该流程,需要消耗的各试剂多少量
    Sys.reagentStatus = RESET;
    local reagentUse = {[1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0 };
    local reagentPreRemain = {};
    for i = 1, 6, 1 do
        reagentPreRemain[i] = tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].remainId));
    end
    for i = 1, Sys.actionTotal, 1 do
        --截取文件中<action?>标签之间的字符串
        local actionStr = GetSubString(Sys.processFileStr, "<action" .. Sys.actionIdTab[i] .. ">", "</action" .. Sys.actionIdTab[i] .. ">");
        local typeStr = GetSubString(actionStr, "<type>", "</type>");--获动作类型与名称
        local typeTab = split(typeStr, ",");--将动作类型与名称放在tab表中
        local contentTabStr = GetSubString(actionStr, "<content>", "</content>");--再截取<content>标签中的内容
        local contentTab    = split(contentTabStr, ",");--分割字符串,并将字符串存入tab数组
        --判断是否为注射泵加液
        if typeTab[1] == ActionItem[Sys.language][3] then
            if contentTab[9] == ENABLE_STRING then--注射泵加液界面的试剂一栏有选中
                local index = tonumber(contentTab[62])--试剂序号
                reagentUse[index] = tonumber(contentTab[61])--试剂用量
                print("本次流程将消耗试剂" .. index .. ":" .. reagentUse[index] .. "mL");
                if reagentPreRemain[index] > reagentUse[index] then
                    reagentPreRemain[index] = reagentPreRemain[index] - reagentUse[index];
                else
                    reagentPreRemain[index] = 0;
                end
                print("试剂" .. index .. "将会剩余" .. reagentPreRemain[index] .. "mL");
            end
        end
    end
    --计算跑完该流程后,试剂的余量, 并将该余量与报警值进行比较
    for i = 1, 6, 1 do
        --1.检测是否开启了试剂余量检测 ;试剂余量少于报警值
        if get_text(RUN_CONTROL_SCREEN, ReagentRemainChkId) == VariableOnOff[srcLanguage].open and
           reagentPreRemain[i] <= tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].alarmId)) then

            Sys.alarmContent = TipsTab[Sys.language].lack .. get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].nameId);--初始化报警内容（串口回复超时）
            add_history_record(HISTORY_ALARM_SCREEN);--记录报警内容
            ShowSysAlarm(Sys.alarmContent);--在底部状态栏显示报警信息
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
    if processIdType == autoRangeProcessId then--自动量程切换获取流程id
        Sys.currentProcessId = get_auto_range_process_id();
    elseif processIdType == periodProcessId then--周期运行获取流程id
        Sys.currentProcessId = get_period_process_id();
    else
        Sys.currentProcessId = get_current_process_id();--获取当前需要运行的流程id
    end
    if Sys.currentProcessId ~= 0 then--不等于0,表示有满足条件的流程待执行,
        -- set_process_edit_state(DISABLE);           --禁止流程设置相关的操作
        LoadActionStr(Sys.currentProcessId);       --读取流程配置
        print("LoadActionStr完成");
        if Sys.reagentStatus == SET then           --当前缺液,不执行流程
            SystemStop(stopByNormal);
            ShowSysAlarm(Sys.alarmContent);        --在底部状态栏显示缺液报警信息, 因为SystemStop会清空报警信息
            return;
        end
        -- if UsbPath == nil then --未检测到SD卡
        --     SystemStop(stopByNormal);
        --     Sys.alarmContent = TipsTab[Sys.language].noSdcard;
        --     ShowSysAlarm(Sys.alarmContent);
        --     return;
        -- end
        Sys.startTime = Sys.dateTime;
        Sys.driverSubStep = 1; --所有步骤都是从1开始
        Sys.actionStep = 1;
        Sys.actionSubStep = 1;
        Sys.driverStep = 1;
        Sys.driverSubStep = 1;
        Sys.flag_save_uart_log = ENABLE;--打开串口通信日志记录功能
        set_value(MAIN_SCREEN, ProgressBarId, 0);--设置进度条的值为0
        Sys.logContent = WorkStatus[Sys.language].run .. "\"" .. Sys.processName .. "\"";--“运行”+流程名称
        add_history_record(HISTORY_LOG_SCREEN);--添加一条日志信息
        ShowSysAlarm(TipsTab[Sys.language].null);--清空报警
        set_text(MAIN_SCREEN, LastResultE1Id, 0);--E1显示清0
        set_text(MAIN_SCREEN, LastResultE2Id, 0);--E2显示清0
        set_text(MAIN_SCREEN, StartTimeId, string.format("%d-%02d-%02d  %02d:%02d",--显示本次启动流程的时间
                 Sys.startTime.year, Sys.startTime.mon, Sys.startTime.day,Sys.startTime.hour, Sys.startTime.min));
        SetSysWorkStatus(WorkStatus[Sys.language].run);--设置工作状态为运行,定时器中断中检测到运行状态后,会跳转到excute_process??数执行流??
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
        Sys.actionString = GetSubString(Sys.processFileStr, "<action" .. actionId .. ">", "</action" .. actionId .. ">");--截取文件中<action?>标签之间的字符串
        print("当前需要执行的Action=" .. Sys.actionString);
        local typeString = GetSubString(Sys.actionString, "<type>", "</type>");--获动作类型与名称
        local tab = split(typeString, ",");--将动作类型与名称放在tab表中
        Sys.actionType    = tab[1];--获取动作类型
        Sys.contentTabStr = GetSubString(Sys.actionString, "<content>", "</content>");--再截取<content>标签中的内容
        set_text(IN_OUT_SCREEN, 9, Sys.actionString);
        Sys.contentTab    = split(Sys.contentTabStr, ",");--分割字符串,并将字符串存入tab数组
        ShowSysCurrentAction(Sys.processName .. ":" .. Sys.actionNameTab[Sys.actionStep]);--显示流程名称-动作名称
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
            -- print("单个action执行完成");
        end
        ---------------------------------------------------------------------------------------------------
        --第三步:判断动作是否执行完毕
    elseif Sys.processStep == 3 then
        -- print("判断是否还有action未执行?总Action=" .. Sys.actionTotal .. "当前Action=" .. Sys.actionStep);
        set_value(MAIN_SCREEN, ProgressBarId, math.floor(Sys.actionStep / Sys.actionTotal * 100));--更新进度条
        ----------------所有动作执行完毕(流程结束)-------------------------------------------
        if Sys.actionStep >= Sys.actionTotal then
            Sys.actionStep = 1;                       --重新指向第一个动作
            Sys.processStep = 1;                      --重新计算指向第一个动作的第一步
            Sys.logContent = WorkStatus[Sys.language].stop .. "\"" .. Sys.processName .. "\"";--“停止”+流程名称
            add_history_record(HISTORY_LOG_SCREEN);--添加一条停止流程的日志信息
            set_text(MAIN_SCREEN, StartTimeId, "0000-00-00  00:00");--将本次启动流程的开始时间清0
            ------类型为分析且满足自动量程切换条件----------
            if Sys.processType == ProcessItem[Sys.language][1] and get_auto_range_process_id() ~= 0 then
                print("执行量程自动切换");
                process_ready_run(autoRangeProcessId);--运行自动量程切换流程

            ----------------手动模式--------------------
            elseif Sys.runType == WorkType[Sys.language].hand then     
                Sys.handProcessIndex = Sys.handProcessIndex + 1;--指向下一个流程
                Sys.handRunTimes = Sys.handRunTimes + 1;
                if tonumber(get_text(RUN_CONTROL_HAND_SCREEN,HandProcessTimesId)) == 0 or
                   Sys.handRunTimes < tonumber(get_text(RUN_CONTROL_HAND_SCREEN, HandProcessTimesId)) * Sys.handProcessTotal then

                    SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态
                else
                    SystemStop(stopByNormal);
                end
            ----------------周期模式--------------------
            elseif Sys.runType == WorkType[Sys.language].period then
                if Sys.processType == PeriodicTab[1].processType then--水样分析
                    --根据水样分析的频率设置下一次周期运行的时间
                    setPeriodNextStartTimeByFreq(tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN,PeriodicTab[1].freqId)));
                    --每运行一次分析流程, 其他流程的频率需要 + 1;
                    for i = 2,#PeriodicTab,1 do 
                        PeriodicTab[i].freq = PeriodicTab[i].freq + 1;

                        local freqOfSet = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN,PeriodicTab[i].freqId));--获取设置的频率
                        --1.判断频率(次数)是否达到要求; 2.判断该流程前方的复选框是否打钩; 3.判断是否设置了流程(不为空格)
                         if PeriodicTab[i].freq >= freqOfSet and 
                            get_value(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[i].enableId) == ENABLE and
                            get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[i].processNameId) ~= BLANK_SPACE then

                            PeriodicTab[i].isReadyRun = true;--该标志位赋值true,表示达到该流程运行的条件了.
                        end
                    end
                else
                    for i = 2,#PeriodicTab,1 do
                        if Sys.processType == PeriodicTab[i].processType then--判断本次流程的流程类型
                            PeriodicTab[i].isReadyRun = false;
                            PeriodicTab[i].freq = 0;
                            break;
                        end
                    end
                end
                
                --判断本次需要运行哪一类流程
                for i = 2,#PeriodicTab,1 do
                    if PeriodicTab[i].isReadyRun == true then
                        process_ready_run(periodProcessId);
                        return;
                    end
                end

                SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态,此时会在系统定时器中不断的判断是否可以进行下一次分析
            ----------------------定时模式------------------
            elseif Sys.runType == WorkType[Sys.language].timed then
                SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态
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
--stopType : SystemStop(stopByNormal)-跑完一次流程后正常停止 ;SystemStop(stopByClickButton)-通过手动点击停止按钮强制停止流程
--***********************************************************************************************
function SystemStop(stopType)
    SetSysWorkStatus(WorkStatus[Sys.language].stop);--将状态栏显示为停止
    ShowSysCurrentAction(TipsTab[Sys.language].null);--将当前动作显示为"无"
    ShowSysAlarm(TipsTab[Sys.language].null);--清空报警
    ShowSysTips("");
    set_value(RUN_CONTROL_SCREEN, RunStopBtId, 0);--将开始/停止按钮弹出
    Sys.processStep = 1;
    Sys.handProcessIndex = 1;
    Sys.handRunTimes = 0;

    Sys.flag_save_uart_log = ENABLE;--打开串口通信日志记录功能
    UartArg.lock = UNLOCKED;--解锁串口
    UartArg.repeat_times = 0;--重发计数请0

    UartArg.reply_sta = SEND_OK;
    UartArg.lock = UNLOCKED;
    stop_timer(1)--停止超时定时器
    set_text(MAIN_SCREEN, StartTimeId, "0000-00-00  00:00");--将本次启动流程的开始时间清0
    set_text(MAIN_SCREEN, NextStartTimeId, "0000-00-00  00:00");--将下次启动流程的开始时间清0
    for i = 1, #TimedProcessTab, 1 do--定时模式下, 要将该标志位置成false
        TimedProcessTab[i].isFinished = false;
    end
    for i = 2, #PeriodicTab, 1 do--周期模式下,频率计数器清0
        PeriodicTab[i].freq = 0;
        PeriodicTab[i].isReadyRun = false;
    end
end

--***********************************************************************************************
--  通过电脑控制仪器的运转
--***********************************************************************************************
function ComputerControl(package)
    local replayData = {};
    --判断第0个字节(地址)
    if package[0] == tonumber(get_text(IN_OUT_SCREEN, IOSET_ComputerAddr)) then

        --判断第1个字节(读或写)
        if package[1] == 3 then----读
            replayData[0] = package[0];--地址
            replayData[1] = package[1];
            if package[3] == 2 then--读单位
            elseif package[3] == 0 then--读分析结果
            elseif package[3] == 2 then--读校正结果
            end
        elseif package[1] == 6 then--写
            if package[3] == 4 then--开始分析
                -- Sys.runType = 
                SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--设置为待机状态
                process_ready_run(processId);--开始运行前的一些初始化操作
            elseif package[3] == 6 then--停止分析
                SystemStop(stopByClickButton);
            end
            uart_send_data(package) --回复
        end

    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    运行控制-周期设置
--------------------------------------------------------------------------------------------------------------------]]
RUNCTRL_PEROID_BtSid = 1;
RUNCTRL_PEROID_BtEid = 7;
RUNCTRL_PEROID_TextSid = 8;
RUNCTRL_PEROID_TextEid = 22;
PeriodicTab = { [1] = { processType = ProcessItem[Sys.language][1], enableId = 1, processNameId = 8,  freqId = 9 , },--分析
                [2] = { processType = ProcessItem[Sys.language][2], enableId = 2, processNameId = 10, freqId = 12, freq = 0, isReadyRun = false, },--校正1
                [3] = { processType = ProcessItem[Sys.language][2], enableId = 2, processNameId = 11, freqId = 12, freq = 0, isReadyRun = false, },--校正2
                [4] = { processType = ProcessItem[Sys.language][7], enableId = 3, processNameId = 13, freqId = 14, freq = 0, isReadyRun = false, densityId = 29, errorId = 30 },--量程校正
                [5] = { processType = ProcessItem[Sys.language][5], enableId = 4, processNameId = 15, freqId = 16, freq = 0, isReadyRun = false, densityId = 17, errorId = 18 },--零点核查
                [6] = { processType = ProcessItem[Sys.language][6], enableId = 5, processNameId = 19, freqId = 20, freq = 0, isReadyRun = false, densityId = 21, errorId = 22 },--标样核查
                [7] = { processType = ProcessItem[Sys.language][11],enableId = 6, processNameId = 23, freqId = 24, freq = 0, isReadyRun = false, densityId = 25, errorId = 26 },--空白测试
                [8] = { processType = ProcessItem[Sys.language][3], enableId = 7, processNameId = 27, freqId = 28, freq = 0, isReadyRun = false},--清洗
                sTime =  { yearId = 31, monId = 32, dayId = 33, hourId = 34, minId = 35, 
                           year = 0, mon = 0, day = 0, hour = 0, min = 0 },--流程开始的时间
};

function run_control_period_notify(screen, control, value)
    if control == SureButtonId then
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteParaToConfigStrAndFile(2);--将数据存入文件
            change_screen(RUN_CONTROL_SCREEN);
        end
    elseif control == CancelButtonId then
        change_screen(RUN_CONTROL_SCREEN);
    elseif control >= RUNCTRL_PEROID_TextSid+100 and control <= RUNCTRL_PEROID_TextEid+100 then
        process_name_select_set(screen, control-100);
    end
end

function goto_period_mode_set_screen()
    
    local currentDateTime = string.format("%d%02d%02d%02d%02d",
        Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day,Sys.dateTime.hour, Sys.dateTime.min);--将当前时间转换为字符串

    Sys.periodStartDateTime = string.format("%d%02d%02d%02d%02d",
                                tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.yearId )), 
                                tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.monId )), 
                                tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.dayId )), 
                                tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.hourId )), 
                                tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.minId )));
                                
    --判断为停止模式, 且周期设置界面的开始时间比当前时间小
    if Sys.status == WorkStatus[Sys.language].stop and Sys.periodStartDateTime <= currentDateTime then--运行
        --在周期模式设置界面,设置当前开始时间
        setPeriodStartTime();
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    运行控制-定时设置
--------------------------------------------------------------------------------------------------------------------]]
RUNCTRL_TIMED_TextSid = 1;
RUNCTRL_TIMED_TextEid = 24;
TimedProcessClear = 410;--一键清空所有的定时设置
--定时设置  这里注意StartHourId - 37 = 序号; startMinuteId - 61 = 序号
TimedProcessTab = {
    [1 ] = { textId = 1 , buttonId = 101, startHourId = 201, startMinuteId = 301, isFinished = false},
    [2 ] = { textId = 2 , buttonId = 102, startHourId = 202, startMinuteId = 302, isFinished = false},
    [3 ] = { textId = 3 , buttonId = 103, startHourId = 203, startMinuteId = 303, isFinished = false},
    [4 ] = { textId = 4 , buttonId = 104, startHourId = 204, startMinuteId = 304, isFinished = false},
    [5 ] = { textId = 5 , buttonId = 105, startHourId = 205, startMinuteId = 305, isFinished = false},
    [6 ] = { textId = 6 , buttonId = 106, startHourId = 206, startMinuteId = 306, isFinished = false},
    [7 ] = { textId = 7 , buttonId = 107, startHourId = 207, startMinuteId = 307, isFinished = false},
    [8 ] = { textId = 8 , buttonId = 108, startHourId = 208, startMinuteId = 308, isFinished = false},
    [9 ] = { textId = 9 , buttonId = 109, startHourId = 209, startMinuteId = 309, isFinished = false},
    [10] = { textId = 10, buttonId = 110, startHourId = 210, startMinuteId = 310, isFinished = false},
    [11] = { textId = 11, buttonId = 111, startHourId = 211, startMinuteId = 311, isFinished = false},
    [12] = { textId = 12, buttonId = 112, startHourId = 212, startMinuteId = 312, isFinished = false},
    [13] = { textId = 13, buttonId = 113, startHourId = 213, startMinuteId = 313, isFinished = false},
    [14] = { textId = 14, buttonId = 114, startHourId = 214, startMinuteId = 314, isFinished = false},
    [15] = { textId = 15, buttonId = 115, startHourId = 215, startMinuteId = 315, isFinished = false},
    [16] = { textId = 16, buttonId = 116, startHourId = 216, startMinuteId = 316, isFinished = false},
    [17] = { textId = 17, buttonId = 117, startHourId = 217, startMinuteId = 317, isFinished = false},
    [18] = { textId = 18, buttonId = 118, startHourId = 218, startMinuteId = 318, isFinished = false},
    [19] = { textId = 19, buttonId = 119, startHourId = 219, startMinuteId = 319, isFinished = false},
    [20] = { textId = 20, buttonId = 120, startHourId = 220, startMinuteId = 320, isFinished = false},
    [21] = { textId = 21, buttonId = 121, startHourId = 221, startMinuteId = 321, isFinished = false},
    [22] = { textId = 22, buttonId = 122, startHourId = 222, startMinuteId = 322, isFinished = false},
    [23] = { textId = 23, buttonId = 123, startHourId = 223, startMinuteId = 323, isFinished = false},
    [24] = { textId = 24, buttonId = 124, startHourId = 224, startMinuteId = 324, isFinished = false},
};

function run_control_timed_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteParaToConfigStrAndFile(2);--将数据存入文件
            change_screen(RUN_CONTROL_SCREEN);
        end
    elseif control == CancelButtonId and value == ENABLE then
        change_screen(RUN_CONTROL_SCREEN);
    elseif control >= TimedProcessTab[1].buttonId and control <= TimedProcessTab[#TimedProcessTab].buttonId then
        process_name_select_set(screen, control-100);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    运行控制-手动设置
--------------------------------------------------------------------------------------------------------------------]]
HandProcessTimesId = 6;
RUNCTRL_HAND_TextSid = 1;
RUNCTRL_HAND_TextEid = 6
--手动设置
HandProcessTab = {
    --  用于显示流程名称的文本id, 与文本重合的按钮id, 手动分析次数id, 手动分析次数, 流程名称对应的流程序号
    [1] = { textId = 1,  buttonId = 101,  processId = 0 },
    [2] = { textId = 2,  buttonId = 102,  processId = 0 },
    [3] = { textId = 3,  buttonId = 103,  processId = 0 },
    [4] = { textId = 4,  buttonId = 104,  processId = 0 },
    [5] = { textId = 5,  buttonId = 105,  processId = 0 },
    times = 0,
};


function run_control_hand_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteParaToConfigStrAndFile(2);--将数据存入文件
            change_screen(RUN_CONTROL_SCREEN);
        end
    elseif control == CancelButtonId and value == ENABLE then
        change_screen(RUN_CONTROL_SCREEN);
    elseif control >= HandProcessTab[1].buttonId and control <= HandProcessTab[5].buttonId then--选择流程
        process_name_select_set(screen, control - 100);--(control100)表示与该按钮重合的文本框
    elseif control == HandProcessTimesId then
        HandProcessTab.times = tonumber(get_text(screen,control));
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    流程设置1/2
--------------------------------------------------------------------------------------------------------------------]]
--流程设置表中各控件Id,注意selecId与nameId的数学关系:typeId = nameId + 100, typeId = deleteId + 50 等等
ProcessTab = {[1] = { typeId = 301, nameId = 201, rangeId = 351, deleteId = 251, editId = 51 },
[2] = { typeId = 302, nameId = 202, rangeId = 352, deleteId = 252, editId = 52 },
[3] = { typeId = 303, nameId = 203, rangeId = 353, deleteId = 253, editId = 53 },
[4] = { typeId = 304, nameId = 204, rangeId = 354, deleteId = 254, editId = 54 },
[5] = { typeId = 305, nameId = 205, rangeId = 355, deleteId = 255, editId = 55 },
[6] = { typeId = 306, nameId = 206, rangeId = 356, deleteId = 256, editId = 56 },
[7] = { typeId = 307, nameId = 207, rangeId = 357, deleteId = 257, editId = 57 },
[8] = { typeId = 308, nameId = 208, rangeId = 358, deleteId = 258, editId = 58 },
[9] = { typeId = 309, nameId = 209, rangeId = 359, deleteId = 259, editId = 59 },
[10] = { typeId = 310, nameId = 210, rangeId = 360, deleteId = 260, editId = 60 },
[11] = { typeId = 311, nameId = 211, rangeId = 361, deleteId = 261, editId = 61 },
[12] = { typeId = 312, nameId = 212, rangeId = 362, deleteId = 262, editId = 62 },
[13] = { typeId = 313, nameId = 213, rangeId = 363, deleteId = 263, editId = 63 },
[14] = { typeId = 314, nameId = 214, rangeId = 364, deleteId = 264, editId = 64 },
[15] = { typeId = 315, nameId = 215, rangeId = 365, deleteId = 265, editId = 65 },
[16] = { typeId = 316, nameId = 216, rangeId = 366, deleteId = 266, editId = 66 },
[17] = { typeId = 317, nameId = 217, rangeId = 367, deleteId = 267, editId = 67 },
[18] = { typeId = 318, nameId = 218, rangeId = 368, deleteId = 268, editId = 68 },
[19] = { typeId = 319, nameId = 219, rangeId = 369, deleteId = 269, editId = 69 },
[20] = { typeId = 320, nameId = 220, rangeId = 370, deleteId = 270, editId = 70 },
[21] = { typeId = 321, nameId = 221, rangeId = 371, deleteId = 271, editId = 71 },
[22] = { typeId = 322, nameId = 222, rangeId = 372, deleteId = 272, editId = 72 },
[23] = { typeId = 323, nameId = 223, rangeId = 373, deleteId = 273, editId = 73 },
[24] = { typeId = 324, nameId = 224, rangeId = 374, deleteId = 274, editId = 74 },
};


ProcessSaveBtId = 19;--保存按钮,流程设置1/2/3的保存按钮都是这个id
ExportBtId = 41;--导出按钮
InportBtId = 42;--导入按钮
NextSetScreen = 128;--下一个流程设置界面
ProcessCopyBtId = 3;--流程设置1界面中的复制按钮
--***********************************************************************************************
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--***********************************************************************************************
function process_set12_control_notify(screen, control, value)

    if control == ProcessSaveBtId then -- 保存
        WriteParaToConfigStrAndFile(1);
        --导入按钮----------------------------------------------------------------------
    elseif control == InportBtId then --
        if UsbPath ~= nil and SdPath ~= nil then
            ShowSysTips(TipsTab[Sys.language].importing);
            for i = 0, 24, 1 do--依次导出文件"0"~"24"
                ConfigFileCopy(UsbPath .. "config/" .. i, SdPath .. "config/"..i);--将Sd卡中的配置文件导入都系统
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
        if UsbPath ~= nil and SdPath ~= nil then
            ShowSysTips(TipsTab[Sys.language].exporting);
            for i = 0, 24, 1 do--依次导出文件"0"~"24"
                ConfigFileCopy(SdPath .. "config/" .. i, UsbPath .. "config/"..i);--将文件导出到config文件中,配置文件名为0~24
            end
            ShowSysTips(TipsTab[Sys.language].exported);
        else
            ShowSysTips(TipsTab[Sys.language].insertSdUsb);
        end;
    --设置流程名称--------------------------------------------------------------------
    elseif control >= ProcessTab[1].nameId and control <= ProcessTab[24].nameId then
        local fileName = control - 200;
        local configFile = io.open(SdPath .. "config/" ..fileName, "r")          --打开文本
        if configFile ~= nil then
            configFile:close();
            WriteActionTagToBuf(fileName, 0);
            configFile = io.open(SdPath .. "config/" ..fileName, "w+");          --打开并清空该文件
            configFile:write(ConfigStr[fileName]);         --将处理过的原文件内容重新写入文件
            configFile:close(); --关闭文本
        end
    --设置流程类型--------------------------------------------------------------------
    elseif control >= ProcessTab[1].typeId and control <= ProcessTab[24].typeId then
        local fileName = control - 300;
        local configFile = io.open(SdPath .. "config/" ..fileName, "r")          --打开文本
        if configFile ~= nil then
            configFile:close();
            WriteActionTagToBuf(fileName, 0);
            configFile = io.open(SdPath .. "config/" ..fileName, "w+");          --打开并清空该文件
            configFile:write(ConfigStr[fileName]);         --将处理过的原文件内容重新写入文件
            configFile:close(); --关闭文本
        end
        ------------------------------------------------------------------------
    elseif (control - 100) >= ProcessTab[1].typeId and (control - 100) <= ProcessTab[24].typeId then --这里是流程类型下的各个按钮
        process_type_select_set(screen, control - 100);
        --量程选择----------------------------------------------------------------------
    elseif (control - 100) >= ProcessTab[1].rangeId and (control - 100) <= ProcessTab[24].rangeId then
        range_select_set(screen, control - 100);
        --删除按钮----------------------------------------------------------------------
    elseif control >= ProcessTab[1].deleteId and control <= ProcessTab[24].deleteId and value == ENABLE then
        if get_text(screen, control - 50) ~= BLANK_SPACE then --名称不为空格
            if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
                set_return_screen_control(screen, control);
            end
            change_screen(DIALOG_SCREEN);
        end
        --查看按钮----------------------------------------------------------------------
    elseif control >= ProcessTab[1].editId and control <= ProcessTab[24].editId and get_text(screen, control + 250) ~= BLANK_SPACE and value == ENABLE then
        local processName = get_text(screen, control + 150);
        set_text(PROCESS_EDIT1_SCREEN, ProcessSelectId, processName);--设置流程名称
        set_text(PROCESS_EDIT2_SCREEN, ProcessSelectId, processName);
        set_text(PROCESS_EDIT3_SCREEN, ProcessSelectId, processName);
        set_text(PROCESS_EDIT4_SCREEN, ProcessSelectId, processName);
        ReadActionTagOfFile(control-50, 0);
        change_screen(PROCESS_EDIT1_SCREEN);
        if control <= ProcessTab[12].editId then--设置当点击流程编辑1界面中的向前按钮时,需要返回哪一个界面
            DestProcessSetScreen = PROCESS_SET1_SCREEN;
        else
            DestProcessSetScreen = PROCESS_SET2_SCREEN;
        end
    --复制按钮----------------------------------------------------------------------------
    elseif control == ProcessCopyBtId and value == ENABLE then
        if operate_permission_detect(CHK_USER) == ENABLE then--检测权限
            change_screen(PROCESS_COPY_SCREEN);
            set_visiable(PROCESS_COPY_SCREEN, 5, 0)
            set_visiable(PROCESS_COPY_SCREEN, 6, 0)
        end
    end
end

--***********************************************************************************************
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--***********************************************************************************************
function process_copy_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then
        local srcFile = get_text(PROCESS_COPY_SCREEN,2);
        local destFile = get_text(PROCESS_COPY_SCREEN,4);
        local configFile = io.open(SdPath .. "config/" ..srcFile, "r")          --打开文本
        if configFile ~= nil then
            ConfigFileCopy(SdPath .. "config/" .. srcFile, SdPath .. "config/" .. destFile);--将文件导出到config文件中,配置文件名为0~24
            set_visiable(PROCESS_COPY_SCREEN, 5, 1);
        else
            set_visiable(PROCESS_COPY_SCREEN, 6, 1);
        end
    elseif control == CancelButtonId then
        change_screen(PROCESS_SET1_SCREEN);
    end
end




--[[-----------------------------------------------------------------------------------------------------------------
    流程编辑1/2/3/4
--------------------------------------------------------------------------------------------------------------------]]
ReturnProcessSetScreenId = 93;
ProcessSelectId = 38;      --位于流程编辑1/3都是这个id
ProcessSelectTipsTextId = 21;--用于显示提示信息的文本框,流程编辑1/3界面中都是这个id
ProcessSaveId = 19;
--这里注意观察动作选择id,动作名称id,编辑id之间的数学转换关系:typeId = nameId + 100; nameId = editId + 100
--其中[1]-[12]中包含的id控件在流程编辑1界面中,[13]-[24]中包含的id控件在流程编辑2界面中
TabAction = {
    [1] = { typeId = 301, nameId = 201, insertId = 501, deleteId = 601, editId = 101 },
    [2] = { typeId = 302, nameId = 202, insertId = 502, deleteId = 602, editId = 102 },
    [3] = { typeId = 303, nameId = 203, insertId = 503, deleteId = 603, editId = 103 },
    [4] = { typeId = 304, nameId = 204, insertId = 504, deleteId = 604, editId = 104 },
    [5] = { typeId = 305, nameId = 205, insertId = 505, deleteId = 605, editId = 105 },
    [6] = { typeId = 306, nameId = 206, insertId = 506, deleteId = 606, editId = 106 },
    [7] = { typeId = 307, nameId = 207, insertId = 507, deleteId = 607, editId = 107 },
    [8] = { typeId = 308, nameId = 208, insertId = 508, deleteId = 608, editId = 108 },
    [9] = { typeId = 309, nameId = 209, insertId = 509, deleteId = 609, editId = 109 },
    [10] = { typeId = 310, nameId = 210, insertId = 510, deleteId = 610, editId = 110 },
    [11] = { typeId = 311, nameId = 211, insertId = 511, deleteId = 611, editId = 111 },
    [12] = { typeId = 312, nameId = 212, insertId = 512, deleteId = 612, editId = 112 },
    [13] = { typeId = 313, nameId = 213, insertId = 513, deleteId = 613, editId = 113 },
    [14] = { typeId = 314, nameId = 214, insertId = 514, deleteId = 614, editId = 114 },
    [15] = { typeId = 315, nameId = 215, insertId = 515, deleteId = 615, editId = 115 },
    [16] = { typeId = 316, nameId = 216, insertId = 516, deleteId = 616, editId = 116 },
    [17] = { typeId = 317, nameId = 217, insertId = 517, deleteId = 617, editId = 117 },
    [18] = { typeId = 318, nameId = 218, insertId = 518, deleteId = 618, editId = 118 },
    [19] = { typeId = 319, nameId = 219, insertId = 519, deleteId = 619, editId = 119 },
    [20] = { typeId = 320, nameId = 220, insertId = 520, deleteId = 620, editId = 120 },
    [21] = { typeId = 321, nameId = 221, insertId = 521, deleteId = 621, editId = 121 },
    [22] = { typeId = 322, nameId = 222, insertId = 522, deleteId = 622, editId = 122 },
    [23] = { typeId = 323, nameId = 223, insertId = 523, deleteId = 623, editId = 123 },
    [24] = { typeId = 324, nameId = 224, insertId = 524, deleteId = 624, editId = 124 },
    [25] = { typeId = 325, nameId = 225, insertId = 525, deleteId = 625, editId = 125 },
    [26] = { typeId = 326, nameId = 226, insertId = 526, deleteId = 626, editId = 126 },
    [27] = { typeId = 327, nameId = 227, insertId = 527, deleteId = 627, editId = 127 },
    [28] = { typeId = 328, nameId = 228, insertId = 528, deleteId = 628, editId = 128 },
    [29] = { typeId = 329, nameId = 229, insertId = 529, deleteId = 629, editId = 129 },
    [30] = { typeId = 330, nameId = 230, insertId = 530, deleteId = 630, editId = 130 },
    [31] = { typeId = 331, nameId = 231, insertId = 531, deleteId = 631, editId = 131 },
    [32] = { typeId = 332, nameId = 232, insertId = 532, deleteId = 632, editId = 132 },
    [33] = { typeId = 333, nameId = 233, insertId = 533, deleteId = 633, editId = 133 },
    [34] = { typeId = 334, nameId = 234, insertId = 534, deleteId = 634, editId = 134 },
    [35] = { typeId = 335, nameId = 235, insertId = 535, deleteId = 635, editId = 135 },
    [36] = { typeId = 336, nameId = 236, insertId = 536, deleteId = 636, editId = 136 },
    [37] = { typeId = 337, nameId = 237, insertId = 537, deleteId = 637, editId = 137 },
    [38] = { typeId = 338, nameId = 238, insertId = 538, deleteId = 638, editId = 138 },
    [39] = { typeId = 339, nameId = 239, insertId = 539, deleteId = 639, editId = 139 },
    [40] = { typeId = 340, nameId = 240, insertId = 540, deleteId = 640, editId = 140 },
    [41] = { typeId = 341, nameId = 241, insertId = 541, deleteId = 641, editId = 141 },
    [42] = { typeId = 342, nameId = 242, insertId = 542, deleteId = 642, editId = 142 },
    [43] = { typeId = 343, nameId = 243, insertId = 543, deleteId = 643, editId = 143 },
    [44] = { typeId = 344, nameId = 244, insertId = 544, deleteId = 644, editId = 144 },
    [45] = { typeId = 345, nameId = 245, insertId = 545, deleteId = 645, editId = 145 },
    [46] = { typeId = 346, nameId = 246, insertId = 546, deleteId = 646, editId = 146 },
    [47] = { typeId = 347, nameId = 247, insertId = 547, deleteId = 647, editId = 147 },
    [48] = { typeId = 348, nameId = 248, insertId = 548, deleteId = 648, editId = 148 },
}

--设置编辑按钮对应的跳转界面
--para:获取对应的动作类型名称
--screen: 当前屏幕的id, 子界面按"确认" ,"返回" 按钮后需要返回的界面
--control:"编辑"按钮的id号
function set_edit_screen(para, screen, control)
    print("动作类型="..para);
    local fileName = getFileNameByProcessName(get_text(PROCESS_EDIT1_SCREEN,ProcessSelectId));

    --在流程编辑1界面, 当编辑按钮时,设置对应界面的参数
    if fileName ~= 0 then
        ReadActionTagOfFile(fileName, control - 100);
    end
    set_screen_actionNumber(screen, control - 100);

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
function process_edit_control_notify(screen, control, value)
    if control == ProcessSaveBtId and value == ENABLE then -- 保存
        WriteCfgToFlash();
    elseif control == ReturnProcessSetScreenId and screen == PROCESS_EDIT1_SCREEN and value == ENABLE then--回退按钮
        if DestProcessSetScreen == nil then
            DestProcessSetScreen = PROCESS_SET1_SCREEN;
        end
        change_screen(DestProcessSetScreen);
    elseif (control - 100) >= TabAction[1].typeId and (control - 100) <= TabAction[#TabAction].typeId then--当点击"动作类型"下面的按钮时
        action_select_set(screen, control - 100, control - 400);
    elseif control >= TabAction[1].editId and control <= TabAction[#TabAction].editId and value == ENABLE then--当点击"编辑"按钮时
        if get_text(screen, control + 200) ~= BLANK_SPACE then--如果设置了动作类型,(编辑按钮的id+200等于动作名称id)
            set_edit_screen(get_text(screen, control + 200), screen, control);--control+200表示对应的"动作类型"id
        end
    elseif control >= TabAction[1].insertId and control <= TabAction[#TabAction].insertId and value == ENABLE then--当点击插入按钮时
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            InsertAction(control - 500);
        end
    elseif control >= TabAction[1].deleteId and control <= TabAction[#TabAction].deleteId and value == ENABLE then--当点击删除按钮时
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            set_return_screen_control(screen, control)
            change_screen(DIALOG_SCREEN);--转换到删除确认界面
        end
    end
end



--***********************************************************************************************
--当在流程编辑1/3界面上点击"插入"按钮时, 且此时当前行的"动作类型"不为空时,会调用该函数
--该函数实现表格的"插入"功能, 实际上就是修改配置文件,然后再读取
--***********************************************************************************************
function InsertAction(actionNumber)
    -- --将当前行插入的行设置为空格显示
    --------在流程编辑1界面插入一行---------------------------------------------------------------
    if actionNumber >= 1 and actionNumber <= 12 then
        for i = 48, 38, -1 do
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT4_SCREEN, TabAction[37].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[36].typeId));
        set_text(PROCESS_EDIT4_SCREEN, TabAction[37].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[36].nameId));

        for i = 36, 26, -1 do
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT3_SCREEN, TabAction[25].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[24].typeId));
        set_text(PROCESS_EDIT3_SCREEN, TabAction[25].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[24].nameId));

        for i = 24, 14, -1 do--
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT2_SCREEN, TabAction[13].typeId, get_text(PROCESS_EDIT1_SCREEN, TabAction[12].typeId));
        set_text(PROCESS_EDIT2_SCREEN, TabAction[13].nameId, get_text(PROCESS_EDIT1_SCREEN, TabAction[12].nameId));

        for i = 12, actionNumber + 1, -1 do--
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT1_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT1_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--将当前行显示为空格
        set_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
        --------在流程编辑2界面插入一行---------------------------------------------------------------
    elseif actionNumber >= 13 and actionNumber <= 24 then
        for i = 48, 38, -1 do
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT4_SCREEN, TabAction[37].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[36].typeId));
        set_text(PROCESS_EDIT4_SCREEN, TabAction[37].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[36].nameId));

        for i = 36, 26, -1 do
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT3_SCREEN, TabAction[25].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[24].typeId));
        set_text(PROCESS_EDIT3_SCREEN, TabAction[25].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[24].nameId));

        for i = 24, actionNumber + 1, -1 do--
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--将当前行显示为空格
        set_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    --------在流程编辑3界面插入一行---------------------------------------------------------------
    elseif actionNumber >= 25 and actionNumber <= 36 then
        for i = 48, 38, -1 do
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT4_SCREEN, TabAction[37].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[36].typeId));
        set_text(PROCESS_EDIT4_SCREEN, TabAction[37].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[36].nameId));

        for i = 36, actionNumber + 1, -1 do--
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT3_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--当前行显示为空格
        set_text(PROCESS_EDIT3_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    --------在流程编辑4界面插入一行---------------------------------------------------------------
    else
        for i = 48, actionNumber + 1, -1 do--
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT4_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--当前行显示为空格
        set_text(PROCESS_EDIT4_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    end
    ChangeActionFileTag(actionNumber, 1);
end

--***********************************************************************************************
--当在流程编辑1/3界面上点击"删除"按钮时, 且此时当前行的"动作类型"不为空时,会调用该函数
--该函数实现表格的"删除"功能, 实际上就是修改配置文件,然后再读取
--***********************************************************************************************
function DeleteAction(actionNumber)
    --------在流程编辑1界面删除一行---------------------------------------------------------------
    if actionNumber >= 1 and actionNumber <= 12 then
        for i = actionNumber, 12, 1 do--
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT1_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT1_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT1_SCREEN, TabAction[12].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[13].typeId));
        set_text(PROCESS_EDIT1_SCREEN, TabAction[12].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[13].nameId));

        for i = 13, 23, 1 do
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT2_SCREEN, TabAction[24].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[25].typeId));
        set_text(PROCESS_EDIT2_SCREEN, TabAction[24].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[25].nameId));

        for i = 25, 35, 1 do
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT3_SCREEN, TabAction[36].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[37].typeId));
        set_text(PROCESS_EDIT3_SCREEN, TabAction[36].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[37].typeId));

        for i = 37, 47, 1 do
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT4_SCREEN, TabAction[48].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT4_SCREEN, TabAction[48].nameId, BLANK_SPACE);
        --------在流程编辑2界面删除一行---------------------------------------------------------------
    elseif actionNumber >= 13 and actionNumber <= 24 then
        for i = actionNumber, 24, 1 do--
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT2_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT2_SCREEN, TabAction[24].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[25].typeId));
        set_text(PROCESS_EDIT2_SCREEN, TabAction[24].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[25].nameId));
        for i = 25, 35, 1 do
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT3_SCREEN, TabAction[36].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[37].typeId));
        set_text(PROCESS_EDIT3_SCREEN, TabAction[36].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[37].typeId));

        for i = 37, 47, 1 do
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT4_SCREEN, TabAction[48].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT4_SCREEN, TabAction[48].nameId, BLANK_SPACE);
    --------在流程编辑3界面删除一行---------------------------------------------------------------
    elseif actionNumber >= 25 and actionNumber <= 36 then
        for i = actionNumber, 35, 1 do
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT3_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT3_SCREEN, TabAction[36].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[37].typeId));
        set_text(PROCESS_EDIT3_SCREEN, TabAction[36].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[37].typeId));

        for i = 37, 47, 1 do
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT4_SCREEN, TabAction[48].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT4_SCREEN, TabAction[48].nameId, BLANK_SPACE);
    --------在流程编辑4界面删除一行---------------------------------------------------------------
    else
        for i = actionNumber, 47, 1 do
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT4_SCREEN, TabAction[48].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT4_SCREEN, TabAction[48].nameId, BLANK_SPACE);
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
INIT_AnalysisWayTextId = 22;
--该函数在on_control_notify中进行调用（当需要选择流程时）
function set_screen_actionNumber(screen, actionNumber)
    DestScreen = screen;
    DestActionNum = actionNumber;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_init_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteActionTagToConfigStr(DestActionNum);
            change_screen(DestScreen);
        end
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
            control_valco(tonumber(paraTab[23]));--id为23的控件为通道号
            start_wait_time(1);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        --------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对阀进行复位(读取参数)
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 5];--将阀状态保存到valveIdTab中,如果值为1.0表示需要复位,如果值为0.0则不需要
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
function process_inject_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteActionTagToConfigStr(DestActionNum);
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
function process_inject_add_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteActionTagToConfigStr(DestActionNum);
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
            control_valco(tonumber(paraTab[42]));--通道号
            start_wait_time(tonumber(paraTab[43]));
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(开阀)操作
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 9];
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
            control_valco(tonumber(paraTab[52]));--id为63的控件为通道号
            start_wait_time(tonumber(paraTab[53]));
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(关阀)操作
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 9];
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
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 25];
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
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 25];
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
        if paraTab[9] == ENABLE_STRING then
            local index = tonumber(paraTab[62])
            local reagentRemain = tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[index].remainId));--获取试剂当前余量
            reagentRemain = reagentRemain - tonumber(paraTab[61]);--计算出最新的试剂余量
            if reagentRemain < 0 then
                reagentRemain = 0;
            end
            print("消耗试剂" .. index .. ":" .. reagentRemain .. "mL");
            set_text(HAND_OPERATE3_SCREEN, ReagentTab[index].remainId, reagentRemain);--更新界面上的试剂余量显示
            WriteParaToConfigStrAndFile(5);--保存试剂余量界面的数据到配置文件
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
function process_peristaltic_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteActionTagToConfigStr(DestActionNum);
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
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 6];
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
            Sys.periodicSpeed = tonumber(paraTab[25]);
            Sys.periodicVolume = tonumber(paraTab[26]);
            Sys.periodicDir = paraTab[27];
            Sys.waitTime = tonumber(paraTab[28]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        elseif paraTab[4] == ENABLE_STRING then
            Sys.periodicSpeed = tonumber(paraTab[29]);
            Sys.periodicVolume = tonumber(paraTab[30]);
            Sys.periodicDir = paraTab[31];
            Sys.waitTime = tonumber(paraTab[32]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--该函数执行完成后Sys.actionSubStep会加1
        elseif paraTab[5] == ENABLE_STRING then
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
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 6];
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
function process_dispel_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteActionTagToConfigStr(DestActionNum);
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
function process_read_signal_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteActionTagToConfigStr(DestActionNum);
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
            if UartArg.reply_sta ~= SEND_OK or UartArg.recv_data[2] ~= 2 then
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
            Sys.actionSubStep = Sys.actionSubStep - 1;--跳转第二步继续读取信号
        end
        -----------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        on_uart_send_data(uartSendTab.getVoltage, NEED_REPLY);--通过串口读取信号
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------
    elseif Sys.actionSubStep == 5 then--解析串口数据, 并判断是否满足信号漂移要求
        if UartArg.reply_sta ~= SEND_OK or UartArg.recv_data[2] ~= 2 then
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

        Sys.signalTab[math.fmod(Sys.signalCount, Sys.signalNumber)] = signalE;--将电压信号保存到数组中
        Sys.signalCount = Sys.signalCount + 1;

        if Sys.signalCount >= Sys.signalNumber then--已经获取到足够的信号（取样数）
            local tempMax, tempMin, maxSignal, minSignal;
            tempMax = Sys.signalTab[0];
            tempMin = Sys.signalTab[0];
            for i = 1, (Sys.signalNumber - 1), 1 do
                tempMax = math.max(tempMax, Sys.signalTab[i]);
                tempMin = math.min(tempMin, Sys.signalTab[i]);
            end
            maxSignal = tempMax;--获取最大值
            minSignal = tempMin;--获取最小值

            --满足信号漂移条件 或者 最大定时时间到
            if (maxSignal - minSignal <= Sys.signalDrift) or Sys.eWaitTimeFlag == RESET then
                local signalSum = 0;
                for i = 0, Sys.signalNumber - 1, 1 do
                    signalSum = signalSum + Sys.signalTab[i];
                end
                signalE = (signalSum - maxSignal - minSignal) / (Sys.signalNumber - 2);--减去Sys.signalTab中的最大值与最小值后取平均值

                if paraTab[1] == "E1" then
                    Sys.signalE1 = signalE;
                    Sys.signalE1 = GetPreciseDecimal(Sys.signalE1, 1);--保留小数点后1位
                    set_text(MAIN_SCREEN, LastResultE1Id, signalE);
                    print("E1=", signalE);
                else
                    Sys.signalE2 = signalE;
                    Sys.signalE2 = GetPreciseDecimal(Sys.signalE2, 1);--保留小数点后1位
                    set_text(MAIN_SCREEN, LastResultE2Id, signalE);
                    print("E2=", signalE);
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
CALCULATE_TextEndId = 16;
CALCULATE_CalcWayTextId = 10;
CALCULATE_CalcTypeTextId = 12;
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_calculate_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteActionTagToConfigStr(DestActionNum);
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
    Sys.calculateType = paraTab[12];--
    Sys.calibratePoint = tonumber(paraTab[15])--校准点
    Sys.calibrationValue = tonumber(paraTab[13]);--校准浓度
    Sys.checkValue = tonumber(paraTab[16]);--核查浓度

    ------当前计算为水样分析或者核查---------------------------------------------------------
    if Sys.calculateType == CalcType[Sys.language][1] or Sys.calculateType == CalcType[Sys.language][3] then

        calc_analysis_result(Sys.calculateWay);
        if paraTab[1] == ENABLE_STRING then--结果线性补偿
            Sys.result = tonumber(paraTab[4]) * Sys.result + tonumber(paraTab[5]);
        end
        if paraTab[2] == ENABLE_STRING then--是否需要进行报警
            if Sys.result > paraTab[9] then
                Sys.alarmContent = TipsTab[Sys.language].highDensity;
            elseif Sys.result < paraTab[8] then
                Sys.alarmContent = TipsTab[Sys.language].lowDensity;
            end
        end
        print("分析结果 =", Sys.result);
    --------当前流程为校准-------------------------------------------------------
    elseif Sys.calculateType == CalcType[Sys.language][2] then
        if Sys.calibratePoint == 1 then
            Sys.caliE1[1] = Sys.signalE1;
            Sys.caliE2[1] = Sys.signalE2;
            Sys.caliValue[1] = Sys.calibrationValue;
            print("校正1：E1=", Sys.caliE1[1], ",E2=", Sys.caliE2[1]);
        elseif Sys.calibratePoint == 2 then--当前计算为校正2
            Sys.caliE1[2] = Sys.signalE1;
            Sys.caliE2[2] = Sys.signalE2;
            Sys.caliValue[2] = Sys.calibrationValue;
            print("校正2：E1=", Sys.caliE1[2], ",E2=", Sys.caliE2[2]);
            if Sys.calculateWay == CalcWay[Sys.language].log then--如果是取对数方式，则在校正2时就计算结果
                calc_calibrate_result_by_log();
            elseif Sys.calculateWay == CalcWay[Sys.language].diff and tonumber(paraTab[11]) == 1 then-----判定为1阶方程 y = cx +d
                calc_calibrate_result_by_diff(2);--通过行列式与克莱姆法则自动算出c,d的值
            end
        elseif Sys.calibratePoint == 3 then--当前计算为校正3
            Sys.caliE1[3] = Sys.signalE1;
            Sys.caliE2[3] = Sys.signalE2;
            Sys.caliValue[3] = Sys.calibrationValue;
            if Sys.calculateWay == CalcWay[Sys.language].diff and tonumber(paraTab[11]) == 2 then-----判定为2阶方程 y = bxx+cx+d 
                calc_calibrate_result_by_diff(3);--通过行列式与克莱姆法则自动算出b,c,d的值
            end
            print("校正3：E1=", Sys.caliE1[3], ",E2=", Sys.caliE2[3]);
        elseif Sys.calibratePoint == 4 then--当前计算为校正4
            Sys.caliE1[4] = Sys.signalE1;
            Sys.caliE2[4] = Sys.signalE2;
            Sys.caliValue[4] = Sys.calibrationValue;
            calc_calibrate_result_by_diff(4);--通过行列式与克莱姆法则自动算出a,b,c,d的值
            print("校正4：E1=", Sys.caliE1[4], ",E2=", Sys.caliE2[4]);
        end
    end

    if paraTab[3] == ENABLE_STRING then--是否需要保存历史记录
        if Sys.calculateType == CalcType[Sys.language][1] then--当前计算为分析
            add_history_record(HISTORY_ANALYSIS_SCREEN)
        elseif Sys.calculateType == CalcType[Sys.language][2] then --当前计算为校准
            add_history_record(HISTORY_CALIBRATION_SCREEN)
        -- elseif Sys.calculateType == CalcType[Sys.language][3] then --当前计算为核查
        else
            add_history_record(HISTORY_CHECK_SCREEN)
        end
    end

    --在主界面进行显示结果与结果时间
    if Sys.calculateType == CalcType[Sys.language][1] or Sys.calculateType == CalcType[Sys.language][3] then--当前计算为分析或者核查
        set_text(MAIN_SCREEN, LastResultId, Sys.result);
    else
        set_text(MAIN_SCREEN, LastResultId, Sys.calibrationValue);
    end
    local sTime = string.format("%d-%02d-%02d %02d:%02d", Sys.startTime.year, Sys.startTime.mon, Sys.startTime.day,
    Sys.startTime.hour, Sys.startTime.min);
    set_text(MAIN_SCREEN, LastAnalysisTimeId, sTime);
    print("执行完成计算流程");
    return FINISHED;
end

--***********************************************************************************************
--  克莱姆法则计算a,b,c,d的值时,会用到该函数
--  n表示为四元一次方程(求a,b,c,d),还是三元一次方程(求b,c,d,a等于0)
--***********************************************************************************************
function term(n, k, x)
    local p, q, t = 1, 1, 1;

    for p = 1, n - 1, 1 do
        for q = 0, p - 1, 1 do
            if k[q] > k[p] then
                t = -t;
            end
        end
    end
    for p = 0, n - 1, 1 do
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
    for j0 = 0, n - 1, 1 do
        if (x[0][j0] == 0) then goto for0_ctn end;
        k[0] = j0;
        for j1 = 0, n - 1, 1 do
            if (j1 == j0 or x[1][j1] == 0) then goto for1_ctn end;

            k[1] = j1;
            if (n == 2) then d = d + term(n, k, x); end
            for j2 = 0, n - 1, 1 do
                if (j2 == j0 or j2 == j1 or x[2][j2] == 0) then goto for2_ctn end;
                k[2] = j2;
                if (n == 3) then d = d + term(n, k, x); end
                for j3 = 0, n - 1, 1 do
                    if (j3 == j0 or j3 == j1 or j3 == j2 or x[3][j3] == 0) then goto for3_ctn; end
                    k[3] = j3;
                    d = d + term(n, k, x);
                    :: for3_ctn ::;
                end
                :: for2_ctn ::;
            end
            :: for1_ctn ::;
        end
        :: for0_ctn ::;
    end
    return (d);
end


--***********************************************************************************************
--  通过对数方式计算校正结果
--***********************************************************************************************
function calc_calibrate_result_by_log(void)
    local a, b, c, d;

    --以下模拟数据 c = 2706.5566，d = -81.1261； 
    -- Sys.caliE1[1] = 4351.5;
    -- Sys.caliE2[1] = 4061.3;
    -- Sys.caliValue[1] = 0;
    -- Sys.caliE1[2] = 4345.7;
    -- Sys.caliE2[2] = 3421.3;
    -- Sys.caliValue[2] = 200;
    a = 0;
    b = 0;
    print(math.log(Sys.caliE1[1] / Sys.caliE2[1], 10));
    print(math.log(Sys.caliE1[2] / Sys.caliE2[2], 10))
    c = (Sys.caliValue[2] - Sys.caliValue[1]) / (math.log(Sys.caliE1[2] / Sys.caliE2[2], 10) - math.log(Sys.caliE1[1] / Sys.caliE2[1], 10));
    d = Sys.caliValue[2] - c * math.log(Sys.caliE1[2] / Sys.caliE2[2], 10);
    print("c=", c, ",d=", d)
    --设置计算出的a,b,c,d结果
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId, a);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId, b);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId, c);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId, d);
    WriteParaToConfigStrAndFile(3);--保存量程设置界面的参数
end

--***********************************************************************************************
--  通过差值方式计算校正结果
--***********************************************************************************************
function calc_calibrate_result_by_diff(n)
    local diff0, diff1, diff2, diff3, detV;-- = Sys.caliE1[1] - Sys.caliE2[1];
    local x, y, detVs = {}, {}, {};
    for i = 0, 3, 1 do
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
        x[0][0] = diff0 * diff0 * diff0; x[0][1] = diff0 * diff0; x[0][2] = diff0; x[0][3] = 1; y[0] = Sys.caliValue[1];
        x[1][0] = diff1 * diff1 * diff1; x[1][1] = diff1 * diff1; x[1][2] = diff1; x[1][3] = 1; y[1] = Sys.caliValue[2];
        x[2][0] = diff2 * diff2 * diff2; x[2][1] = diff2 * diff2; x[2][2] = diff2; x[2][3] = 1; y[2] = Sys.caliValue[3];
        x[3][0] = diff3 * diff3 * diff3; x[3][1] = diff3 * diff3; x[3][2] = diff3; x[3][3] = 1; y[3] = Sys.caliValue[4];
    elseif n == 3 then
        x[0][0] = diff0 * diff0; x[0][1] = diff0; x[0][2] = 1; y[0] = Sys.caliValue[1];
        x[1][0] = diff1 * diff1; x[1][1] = diff1; x[1][2] = 1; y[1] = Sys.caliValue[2];
        x[2][0] = diff2 * diff2; x[2][1] = diff2; x[2][2] = 1; y[2] = Sys.caliValue[3];
    elseif n == 2 then
        x[0][0] = diff0; x[0][1] = 1; y[0] = Sys.caliValue[1];
        x[1][0] = diff1; x[1][1] = 1; y[1] = Sys.caliValue[2];
    end
    local detV = det(n, x);
    --   print("D = "..detV);
    for j = 0, n - 1, 1 do
        for i = 0, n - 1, 1 do
            temp[i] = x[i][j];
            x[i][j] = y[i];
        end
        detVs[j] = det(n, x);
        --        print("D"..j.."="..detVs[j]);
        for i = 0, n - 1, 1 do
            x[i][j] = temp[i];
        end
    end

    local a, b, c, d
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
    print("a=" .. a .. ",b=" .. b .. ",c=" .. c .. ",d=" .. d);
    WriteParaToConfigStrAndFile(3);--保存量程设置界面的参数
end

--***********************************************************************************************
--  计算分析结果
--type：对数方式或者差值方式
--***********************************************************************************************
function calc_analysis_result(type)
    local x, a, b, c, d = 0;

    --以下模拟数据采用对数方式，结果为73.272
    -- Sys.signalE1 = 4278.91;
    -- Sys.signalE2 = 3752.21;
    if type == CalcWay[Sys.language].log then--取对数方式
        x = math.log(Sys.signalE1 / Sys.signalE2, 10);
        print("对数方式，x=", x);
    else
        x = Sys.signalE1 - Sys.signalE2;
    end

    a = tonumber(get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId));
    b = tonumber(get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId));
    c = tonumber(get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId));
    d = tonumber(get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId));
    print(string.format("a=%f,b=%f,c=%f,d=%f", a, b, c, d));
    Sys.result = a * (x ^ 3) + b * (x ^ 2) + c * x + d;
    Sys.result = GetPreciseDecimal(Sys.result, tonumber(get_text(RUN_CONTROL_SCREEN,DecimalTextId)))--保留小数点后四位
    set_text(MAIN_SCREEN, LastResultId, Sys.result);--在主界面显示结果
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
function process_valve_ctrl_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteActionTagToConfigStr(DestActionNum);
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
            control_valco(tonumber(paraTab[19]));--id为23的控件为通道号
            start_wait_time(tonumber(paraTab[20]));
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--判断是否需要对输出进行操作
        if paraTab[2] == ENABLE_STRING then--判断是否需要对输出1进行(开阀)操作
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 2];
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
function process_wait_time_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            WriteActionTagToConfigStr(DestActionNum);
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
NullButtonId = 13;--空按钮

ProcessTypeSelectItem = nil;

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_type_select_set(screen, control)
    DestScreen = screen;
    DestControl = control;
end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_type_select_control_notify(screen, control, value)
    if control >= AnalysisButtonId and control <= NullButtonId then
        ProcessTypeSelectItem = control;
    elseif control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            change_screen(DestScreen);
            if ProcessTypeSelectItem ~= nil then
                set_text(DestScreen, DestControl, ProcessItem[Sys.language][ProcessTypeSelectItem]);--DestControl对应流程选择
                if DestScreen == PROCESS_SET1_SCREEN or DestScreen == PROCESS_SET2_SCREEN then
                    set_text(DestScreen, DestControl - 100, ProcessItem[Sys.language][ProcessTypeSelectItem] .. (DestControl - 300));--DestControl-100对应流程名称
                end
            end
            WriteParaToConfigStrAndFile(1);--保存流程设置1界面中的参数
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
function process_name_select_set(screen, control)
    DestScreen = screen;
    DestControl = control;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_name_select_control_notify(screen, control, value)
    if control >= FirstButtonId and control <= LastButtonId then
        ProcessNameSelecItem = control - 100;--control-100 = 与该按钮重合的文本框id
    elseif control == SureButtonId and value == ENABLE then --确认按钮,返回之前的界面
        change_screen(DestScreen);
        if ProcessNameSelecItem ~= nil then --ProcessNameSelecItem默认为nil,如果选择了某个流程则该值不为nil
            set_text(DestScreen, DestControl, get_text(PROCESS_NAME_SELECT_SCREEN, ProcessNameSelecItem));--DestControl对应动作?≡?
            WriteParaToConfigStrAndFile(2);--2对应<RunCtrl>标签
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--当画面切换时，执行此回调函数，screen为目标画面。
function goto_ProcessNameSelect()
    --将所有按钮进行隐藏
    for i = FirstButtonId, LastButtonId, 1 do
        set_visiable(PROCESS_NAME_SELECT_SCREEN, i, 0);
    end
    --将所有与按钮重合的文本框进行隐藏
    for i = FirstButtonId - 100, LastButtonId - 100, 1 do
        set_visiable(PROCESS_NAME_SELECT_SCREEN, i, 0);
    end
    --隐藏提示信息
    set_visiable(PROCESS_NAME_SELECT_SCREEN, TipsTextId, 0);

    --遍历流程1-12,看是否有设置名称,如果设置了名称,则在流程名称选择界面中进行显示
    --如果是运行控制界面,除了需要判断是否设置了流程名称, 还需要判断该流程是否有对应的配置文件
    NumberOfProcess = 0;

    local processFile = nil;
    for i = 1, 12, 1 do
        if get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId) ~= BLANK_SPACE then--获取名称长度,当名称长度不为0时表示有效
            NumberOfProcess = NumberOfProcess + 1;--个数+1
            set_text(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId))--为该文本?蛏柚梦谋?
            set_visiable(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, 1);--显示id为NumberOfProcess的文本
            set_visiable(PROCESS_NAME_SELECT_SCREEN, 100 + NumberOfProcess, 1);--显示与该文本框对应的按钮
        end
    end
    for i = 13, 24, 1 do
        if get_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId) ~= BLANK_SPACE then--获取名称长度,当名称长度不为0时表示有效
            NumberOfProcess = NumberOfProcess + 1;--个数+1
            set_text(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId))--为该文本?蛏柚梦谋?
            set_visiable(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, 1);--显示id为NumberOfProcess的文本
            set_visiable(PROCESS_NAME_SELECT_SCREEN, 100 + NumberOfProcess, 1);--显示与该文本框对应的按钮
        end
    end
    -- 需要额外设置一个为"无"的选项
    NumberOfProcess = NumberOfProcess + 1;
    set_text(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, BLANK_SPACE)--为该文本框设置内容
    set_visiable(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, 1);--显示id为NumberOfProcess的文本
    set_visiable(PROCESS_NAME_SELECT_SCREEN, 100 + NumberOfProcess, 1);--显示与该文本框对应的按钮

    --显示提示信息
    if NumberOfProcess == 0 then
        set_visiable(PROCESS_NAME_SELECT_SCREEN, TipsTextId, 1);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    动作选择
--------------------------------------------------------------------------------------------------------------------]]
ActionStartButtonId = 1;
ActionEndButtonId = 10;
ActionSelectItem = nil;


--该函数在on_control_notify中进行调用（当需要选择流程时）
function action_select_set(screen, control, actionNumber)
    DestScreen = screen;
    DestControl = control;
    DestActionNum = actionNumber;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function action_select_control_notify(screen, control, value)
    if control >= ActionStartButtonId and control <= ActionEndButtonId then --动作类型选择按钮
        ActionSelectItem = control;
    elseif control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            change_screen(DestScreen);
            if ActionSelectItem ~= nil then
                set_text(DestScreen, DestControl, ActionItem[Sys.language][ActionSelectItem]);--动作选择
                set_text(DestScreen, DestControl - 100, ActionItem[Sys.language][ActionSelectItem]);--DestControl-100对应动作名称
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
RANGESET_TextEndId = 19;

UniteSetTextId = 19--单位设置成功后,用于显示单位文本的id
UniteSetMenuId = 26;--单位选择

RangeTab = {
    [1] = { LowId = 1, HighId = 2, aId = 3, bId = 4, cId = 5, dId = 6 },
    [2] = { LowId = 7, HighId = 8, aId = 9, bId = 10, cId = 11, dId = 12 },
    [3] = { LowId = 13, HighId = 14, aId = 15, bId = 16, cId = 17, dId = 18 },
};

--设置单位
function set_unit()
    local Unite = get_text(RANGE_SET_SCREEN, UniteSetTextId);
    --量程设置界面中,控件Id = 300 ~ 302为单位显示文本
    for i = 300, 302, 1 do
        set_text(RANGE_SET_SCREEN, i, Unite);
    end
    --首页中,控件Id= 19 为单位显示
    set_text(MAIN_SCREEN, LastResultUnitId, Unite);

    --量程选择界面中,控件Id = 15/20/25为单位显示文本
    set_text(RANGE_SELECT_SCREEN, 15, Unite);
    set_text(RANGE_SELECT_SCREEN, 20, Unite);
    set_text(RANGE_SELECT_SCREEN, 25, Unite);

    --周期设置界面,零点核查的误差单位
    set_text(RUN_CONTROL_PERIOD_SCREEN, 36, Unite);
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function range_set_control_notify(screen, control, value)
    if control == UniteSetMenuId then --设置单位
        set_unit();
    elseif control == 50 and value == ENABLE then --保存按钮
        WriteParaToConfigStrAndFile(3);
    elseif control >= 1 and control <= 18 then
        if get_text(RANGE_SET_SCREEN, control) == "" then
            set_text(RANGE_SET_SCREEN, control, 0);
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
function range_select_set(screen, control)
    DestScreen = screen;
    DestControl = control;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function range_select_control_notify(screen, control, value)

    if control >= Range1Id and control <= Range3Id then--量程选择按钮
        RangeSelectItem = control;
    elseif control == SureButtonId and value == ENABLE then --确认按钮
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            change_screen(DestScreen);
            set_text(DestScreen, DestControl, RangeSelectItem);
        end
    elseif control == CancelButtonId then--取消按钮
        change_screen(DestScreen);
    end
end


--当画面切换时，执行此回调函数，screen为目标画面。
function goto_range_select()
    set_text(RANGE_SELECT_SCREEN, 4, get_text(RANGE_SET_SCREEN, RangeTab[1].LowId));
    set_text(RANGE_SELECT_SCREEN, 5, get_text(RANGE_SET_SCREEN, RangeTab[1].HighId));
    set_text(RANGE_SELECT_SCREEN, 6, get_text(RANGE_SET_SCREEN, RangeTab[2].LowId));
    set_text(RANGE_SELECT_SCREEN, 7, get_text(RANGE_SET_SCREEN, RangeTab[2].HighId));
    set_text(RANGE_SELECT_SCREEN, 8, get_text(RANGE_SET_SCREEN, RangeTab[3].LowId));
    set_text(RANGE_SELECT_SCREEN, 9, get_text(RANGE_SET_SCREEN, RangeTab[3].HighId));
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
    if value == DISABLE and operate_permission_detect(CHK_RUN) == DISABLE then--瞬变按钮会调用两次该函数, 增加该判断使得第二次调用后可以立马退出
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
        uartSendTab.openValco[2] = tonumber(get_text(screen, HandValcoChnlId));
        on_uart_send_data(uartSendTab.openValco, NO_NEED_REPLY);
    elseif control == HandInject1SendId then--控制注射泵
        if Sys.hand_control_func == nil then
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
        set_inject1_speed(tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1SpdId)));
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then --第三步:移动注射泵到指定位置
        Sys.waitTimeFlag = SET;
        Sys.waitTime = tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1WaitTimeId));
        start_timer(2, Sys.waitTime * 1000, 1, 1); --开启定时器2，超时时间8s,1->表示只执行一次
        if sta == 0 then
            move_inject1_to(0);
        else
            move_inject1_to(tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1ScaleId)) * 10);
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
function hand_operate2_control_notify(screen, control, value)
    if value == DISABLE and operate_permission_detect(CHK_RUN) == DISABLE then--瞬变按钮会调用两次该函数, 增加该判断使得第二次调用后可以立马退出
        return;
    end
    if control == HandGetVoltageId then--获取电压
        if Sys.hand_control_func == nil then
            Sys.processStep = 1;
            UartArg.lock = UNLOCKED;
            set_enable(screen, control, DISABLE);
            Sys.hand_control_func = hand_get_voltage;
        else
        end
    elseif control == HandSetLedCurrentId then
        if Sys.hand_control_func == nil then
            Sys.processStep = 1;
            UartArg.lock = UNLOCKED;
            Sys.hand_control_func = hand_set_led_current;
        else
        end
    elseif control == HandLedCtrlBtId then--控制led灯开关按钮
        if get_text(HAND_OPERATE2_SCREEN, HandLedStatusId) == LedStatus[Sys.language].open then--打开
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
        local ledCurrentValue = tonumber(get_text(HAND_OPERATE2_SCREEN, HandLedCurrentTextId));
        ledCurrentValue = ledCurrentValue * 2048 / 50;
        ledCurrentValue = math.floor(ledCurrentValue + 0.5);--四舍五入
        uartSendTab.setLedCurrnet[4] = math.modf(ledCurrentValue / 256);
        uartSendTab.setLedCurrnet[5] = math.fmod(ledCurrentValue, 256);
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
    [1] = { BubbleChkId = 1, nameId = 9, totalId = 7, remainId = 8, alarmId = 10 },
    [2] = { BubbleChkId = 2, nameId = 13, totalId = 11, remainId = 12, alarmId = 14 },
    [3] = { BubbleChkId = 3, nameId = 17, totalId = 15, remainId = 16, alarmId = 18 },
    [4] = { BubbleChkId = 4, nameId = 21, totalId = 19, remainId = 20, alarmId = 22 },
    [5] = { BubbleChkId = 5, nameId = 25, totalId = 23, remainId = 24, alarmId = 26 },
    [6] = { BubbleChkId = 6, nameId = 29, totalId = 27, remainId = 28, alarmId = 30 },
}

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function hand_operate3_control_notify(screen, control, value)
    if control == REAGENT_SaveId and value == ENABLE then--保存按钮
        WriteParaToConfigStrAndFile(5);
    elseif control >= 7 and control <= 30 then--试剂判断
        ShowSysAlarm("");
        for i = 1, 6, 1 do
            if tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].remainId)) <= tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].alarmId)) then
                Sys.alarmContent = TipsTab[Sys.language].lack .. get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].nameId);--初始化报警内容
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
function in_out_control_notify(screen, control, value)
    if control >= IOSET_TextStartId and control <= IOSET_TextEndId then
        WriteParaToConfigStrAndFile(4);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    分析、核查、校准、报警、日志记录
--------------------------------------------------------------------------------------------------------------------]]
HistoryRecordId = 32;--历史记录控件Id号，分析、校准、报警、日志都是这个。
HistoryClear = 2;
HistoryExport = 8;
HistoryNextPage = 128;
HistoryPrevPage = 129;
HistoryCurPage = 5;
HistoryTotalPage = 6;

MAX_ANALYSIS_FILE_NUM = 20000;
MAX_CHECK_FILE_NUM = 10000;
MAX_CALIBRARE_FILE_NUM = 10000;
MAX_ALARM_FILE_NUM = 10000;
MAX_LOG_FILE_NUM = 20000;
--***********************************************************************************************
--  添加一条历史记录
-- screen:在哪一个界面的历史记录控件添加内容
--***********************************************************************************************
function add_history_record(screen)
    local date, time, filePath,signalHistoryContent,historyTab,historyOrder,maxHistoryNum;

    filePath = getFilePathByScreen(screen);
    historyTab = readFileToTab(filePath);--将文件读取到tab当中
    maxHistoryNum = getMaxNumByScreen(screen);--获取最大记录条数
    date = string.format("%d-%02d-%02d",math.fmod( Sys.startTime.year,100 ), Sys.startTime.mon, Sys.startTime.day);
    time = string.format("%02d:%02d", Sys.startTime.hour, Sys.startTime.min);
    
    if #historyTab < maxHistoryNum then
        historyOrder = #historyTab;
    else
        lastHistoryTab = split(historyTab[#historyTab] ,";");--获取最后条历史记录,并将该记录已","进行分割后
        historyOrder = lastHistoryTab[1] + 1;--将最后一条记录的序号加1
        if historyOrder > maxHistoryNum then--判断序号是否超限
            historyOrder = 1;
        end
    end

    --最新分析记录
    if screen == HISTORY_ANALYSIS_SCREEN or screen == HISTORY_CHECK_SCREEN then
        record_modify(MAIN_SCREEN, HistoryRecordId, 0, date.." "..time..","..Sys.result..","..Sys.signalE1..","..Sys.signalE2);
    end

    if screen == HISTORY_ANALYSIS_SCREEN then--分析历史
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" ..--序号,日期,时间
                    Sys.result .. ";" .. Sys.signalE1 .. ";" .. Sys.signalE2 .. ";" .. Sys.rangetypeId .. ";" .. Sys.processTag;--结果/E2/E2/量程/类型标识
    elseif screen == HISTORY_CHECK_SCREEN then--核查历史
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" ..--序号,日期,时间
                    Sys.checkValue .. ";" .. Sys.result .. ";" ..Sys.signalE1 .. ";" .. Sys.signalE2 .. ";" .. 
                    Sys.rangetypeId .. ";" .. Sys.processTag;--结果/E2/E2/量程/类型标识
    elseif screen == HISTORY_CALIBRATION_SCREEN then--校正历史
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" ..--序号,日期,时间
                    Sys.calibrationValue .. ";" .. Sys.signalE1 .. ";" .. Sys.signalE2 .. ";" .. Sys.rangetypeId;
    elseif screen == HISTORY_ALARM_SCREEN then--报警
        date = string.format("%d-%02d-%02d", math.fmod(Sys.dateTime.year,100), Sys.dateTime.mon, Sys.dateTime.day);
        time = string.format("%02d:%02d", Sys.dateTime.hour, Sys.dateTime.min);
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" .. Sys.alarmContent .. "; "--序号,日期,时间
    elseif screen == HISTORY_LOG_SCREEN then--日志
        date = string.format("%d-%02d-%02d", math.fmod(Sys.dateTime.year,100), Sys.dateTime.mon, Sys.dateTime.day);
        time = string.format("%02d:%02d", Sys.dateTime.hour, Sys.dateTime.min);
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" .. Sys.logContent .. ";" .. Sys.userName--序号,日期,时间
    end
    
    --将数据进行加密
    signalHistoryContent = encryptStr(signalHistoryContent);

    if #historyTab >= MAX_ANALYSIS_FILE_NUM then
        table.remove(historyTab, 1);--删除第一行数据
    end
    table.insert(historyTab, signalHistoryContent);--添加一条历史记录
    writeTabToFile(filePath, historyTab)--将tab中的数据写入文件当中

    --显示最近的10条历史记录
    if screen == get_current_screen() then
        showHistoryByScreenAndPage(screen, 1);
    end
end

--***********************************************************************************************
--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
--***********************************************************************************************
function history_control_notify(screen, control, value)
    if control == HistoryClear and value == ENABLE then--清除历史
        set_return_screen_control(screen, control);
        change_screen(PASSWORD_DIALOG_SCREEN);
    elseif control ==HistoryExport and value == ENABLE then--导出历史
        exportHistory(screen);
    elseif control == HistoryNextPage and value == ENABLE then--下一页
        local curPage = tonumber(get_text(screen,HistoryCurPage));
        local totalPage = tonumber(get_text(screen,HistoryTotalPage))
        if curPage < totalPage then
            curPage = curPage + 1;
            set_text(screen, HistoryCurPage, curPage);
            showHistoryByScreenAndPage(screen,curPage);
        end
    elseif control == HistoryPrevPage and value == ENABLE then--上一页
        local curPage = tonumber(get_text(screen,HistoryCurPage));
        if curPage > 1 then--当前页大于1
            curPage = curPage - 1;
            set_text(screen, HistoryCurPage, curPage);
            showHistoryByScreenAndPage(screen,curPage);
        end
    elseif control == HistoryCurPage then--跳转到指定页
        local curPage = tonumber(get_text(screen,HistoryCurPage));
        local totalPage = tonumber(get_text(screen,HistoryTotalPage))
        if curPage > totalPage then
            curPage = totalPage;
            set_text(screen, HistoryCurPage, curPage);
        end
        showHistoryByScreenAndPage(screen,curPage);
    end
end

--***********************************************************************************************
--跳转到分析历史界面时,调用该函数,显示最新的记录
--***********************************************************************************************
function getFilePathByScreen(screen)
    local filePath = "";
    if screen == HISTORY_ANALYSIS_SCREEN then--分析历史
        filePath = SdPath .. "record/Analysis";
    elseif screen == HISTORY_CHECK_SCREEN then--核查历史
        filePath = SdPath.."record/Check"
    elseif screen == HISTORY_CALIBRATION_SCREEN then--校正历史
        filePath = SdPath.."record/Calibration"
    elseif screen == HISTORY_ALARM_SCREEN then--报警
        filePath = SdPath.."record/Alarm"
    elseif screen == HISTORY_LOG_SCREEN then--日志
        filePath = SdPath.."record/log"
    end
    return filePath;
end

--***********************************************************************************************
--返回各个记录的最大可记录条数
--***********************************************************************************************
function getMaxNumByScreen(screen)
    local maxNumber = 0;
    if screen == HISTORY_ANALYSIS_SCREEN then--分析历史
        maxNumber = MAX_ANALYSIS_FILE_NUM
    elseif screen == HISTORY_CHECK_SCREEN then--核查历史
        maxNumber = MAX_CHECK_FILE_NUM
    elseif screen == HISTORY_CALIBRATION_SCREEN then--校正历史
        maxNumber = MAX_CALIBRARE_FILE_NUM
    elseif screen == HISTORY_ALARM_SCREEN then--报警
        maxNumber = MAX_ALARM_FILE_NUM
    elseif screen == HISTORY_LOG_SCREEN then--日志
        maxNumber = MAX_LOG_FILE_NUM
    end
    return maxNumber;
end

--***********************************************************************************************
--当检测到历史记录文件不存在时,创建一个空的文件
--***********************************************************************************************
function checkHistoryFile()
    local file;
    file = io.open(SdPath .. "record/Analysis");
    if file == nil then
        file = io.open(SdPath .. "Analysis", "w+");--打开并清空该文件
    end
    file:close();

    file = io.open(SdPath.."record/Check");
    if file == nil then
        file = io.open(SdPath.."Check", "w+");--打开并清空该文件
    end
    file:close();

    file = io.open(SdPath.."record/Calibration");
    if file == nil then
        file = io.open(SdPath.."Calibration", "w+");--打开并清空该文件
    end
    file:close();

    file = io.open(SdPath.."record/Alarm");
    if file == nil then
        file = io.open(SdPath.."Alarm", "w+");--打开并清空该文件
    end
    file:close();

    file = io.open(SdPath.."record/log");
    if file == nil then
        file = io.open(SdPath.."log", "w+");--打开并清空该文件
    end
    file:close();

    --所有历史记录界面都添加10条空的记录,之后通过record_modify来修改显示.
    for i=1,10,1 do
        record_add(HISTORY_ANALYSIS_SCREEN, HistoryRecordId," ");
        record_add(HISTORY_CHECK_SCREEN, HistoryRecordId," ");
        record_add(HISTORY_CALIBRATION_SCREEN, HistoryRecordId," ");
        record_add(HISTORY_ALARM_SCREEN, HistoryRecordId," ");
        record_add(HISTORY_LOG_SCREEN, HistoryRecordId," ");
    end

    --显示最新的10条历史记录,以及总历史记录页数, 总历史记录条数
    setHistoryScreen(HISTORY_ANALYSIS_SCREEN);
    setHistoryScreen(HISTORY_CHECK_SCREEN);
    setHistoryScreen(HISTORY_CALIBRATION_SCREEN);
    setHistoryScreen(HISTORY_ALARM_SCREEN);
    setHistoryScreen(HISTORY_ALARM_SCREEN);

    --在主页面显示最新的分析记录
    if record_get_count(MAIN_SCREEN, HistoryRecordId) == 0 then --表示还未记录有数据
        record_add(MAIN_SCREEN,HistoryRecordId,"0000-00-00  00:00,0.000,0,0");
    end
    local lastResultTab = split(record_read(MAIN_SCREEN, HistoryRecordId, 0), ",")--读取记录
    set_text(MAIN_SCREEN, LastAnalysisTimeId, lastResultTab[1]);--开始时间
    set_text(MAIN_SCREEN, LastResultId, lastResultTab[2]);--分析结果
    set_text(MAIN_SCREEN, LastResultE1Id, lastResultTab[3]);--E1
    set_text(MAIN_SCREEN, LastResultE2Id, lastResultTab[4]);--E2
end


--***********************************************************************************************
--设置历史记录界面相关显示
--***********************************************************************************************
function setHistoryScreen(screen)
    local historyTab = readFileToTab(getFilePathByScreen(screen));--将文件读取到tab当中
    --显示最近的10条历史记录
    local index = 0;
    for i= #historyTab, (#historyTab-9), -1 do
        if historyTab[i] ~= nil then
            local decodeContent = decodeStr(historyTab[i]);
            record_modify(screen, HistoryRecordId, index, decodeContent);
        end
        index = index + 1;
    end
    --显示总页数
    local totalPage = 0;
    local modePage = 0;
    if math.fmod(#historyTab,10) > 1 then
        modePage = 1;
    end
    totalPage = math.modf(#historyTab/10) + modePage
    set_text(screen, HistoryTotalPage, totalPage);
end

--***********************************************************************************************
--清除历史记录文件
--***********************************************************************************************
function clearHistoryFile(screen)
    local filePath = getFilePathByScreen(screen)
    local file = io.open(filePath, "w+");--打开并清空该文件
    set_text(screen, HistoryTotalPage, 1);--设置总页数为1
    file:close();
end

--***********************************************************************************************
--显示指定页的历史记录
--***********************************************************************************************
function showHistoryByScreenAndPage(screen, page)
    local historyTab = readFileToTab(getFilePathByScreen(screen));--将文件读取到tab当中
    local totalPage = tonumber(get_text(screen,HistoryTotalPage));--总页数
    local si = #historyTab - 10 * (page-1);
    local ei = #historyTab - 10 * (page-1) - 9;
    if ei < 1 then
        ei = 1;
    end

    --显示最近的10条历史记录
    local index = 0;
    for i= si, ei, -1 do
        if historyTab[i] ~= nil then
            local decodeContent = decodeStr(historyTab[i]);
            record_modify(screen, HistoryRecordId, index, decodeContent);
        end
        index = index + 1;
    end

    --如果该页显示的记录不足10条
    for i=index,9,1 do
        record_modify(screen, HistoryRecordId, i, " ");
    end

    --显示总页数
    totalPage = 0;
    local modePage = 0;
    if math.fmod(#historyTab,10) > 1 then
        modePage = 1;
    end
    totalPage = math.modf(#historyTab/10) + modePage
    set_text(screen, HistoryTotalPage, totalPage);
end

--***********************************************************************************************
--将历史记录以明文的方式导出到U盘
--***********************************************************************************************
function exportHistory(screen)
    local srcFilePath,destFilePath,fileTab
    if screen == HISTORY_ANALYSIS_SCREEN then--分析历史
        srcFilePath = SdPath .. "record/Analysis";
        destFilePath = UsbPath .. "Analysis.txt";
    elseif screen == HISTORY_CHECK_SCREEN then--核查历史
        srcFilePath = SdPath.."record/Check"
        destFilePath = UsbPath .. "Check.txt";
    elseif screen == HISTORY_CALIBRATION_SCREEN then--校正历史
        srcFilePath = SdPath.."record/Calibration"
        destFilePath = UsbPath .. "Calibration.txt";
    elseif screen == HISTORY_ALARM_SCREEN then--报警
        srcFilePath = SdPath.."record/Alarm"
        destFilePath = UsbPath .. "Alarm.txt";
    elseif screen == HISTORY_LOG_SCREEN then--日志
        srcFilePath = SdPath.."record/log"
        destFilePath = UsbPath .. "log.txt";
    end

    fileTab = readFileToTab(srcFilePath);--将文件中的数据读取到fileTab变量
    for i=1,#fileTab,1 do--解密每一行文件
        fileTab[i] = decodeStr(fileTab[i]);
    end
    writeTabToFile(destFilePath, fileTab);
    ShowSysTips(TipsTab[Sys.language].exported);--显示导出成功提示信息
end


--***********************************************************************************************
--按行读取文件, 将每一行的数据都放入tab中.
--***********************************************************************************************
function readFileToTab(filePath)
    local fileTab = {}
    local fileRead = io.open(filePath);
    if fileRead then
        local line = fileRead:read()
        while line do
            table.insert(fileTab, line);
            line = fileRead:read();
        end
        fileRead:close();
    end
    
    return fileTab;
end

--***********************************************************************************************
--将Tab中的数据,按行写入文件当中
--***********************************************************************************************
function writeTabToFile(filePath, fileTab)
    local fileWrite = io.open(filePath, "w")
    if fileWrite then
        for i, line in ipairs(fileTab) do
            fileWrite:write(line)
            fileWrite:write("\n")
        end
        fileWrite:close();
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    系统信息
--------------------------------------------------------------------------------------------------------------------]]
SetEquipmentTypeTextId = 1;
SerialNumberTextId = 2;
TouchScreenHardVerId = 3;
CtrlBoardHardVerId = 4;
CtrlBoardSoftVerId = 5;
DriverBoardHardVerId = 6;
DriverBoardSoftVerId = 7;
SensorBoardHardVerId = 8;
SensorBoardSoftVerId = 9;
CalcBoardHardVerId = 10;
CalcBoardSoftVerId = 11;
SysPwdRecordId = 13;--用于保存密码的记录控件
EquipmentTypeRecordId = 26;--用于保存仪器型号的记录控件
SerialNumberRecordId = 25;--用于保存仪器序列号的记录控件
SysLanguageRecordId = 28;

maintainerPwdSetId = 14;
administratorPwdSetId = 15;
OperatorLoginId = 16;
maintainerLoginId = 17;
administratorLoginId = 18;
SetChineseId = 19;
SetEnglishId = 20;

TouchScreenSoftVerId = 27;
SetEquipmentTypeBtId = 119;
SetSerialNumberBtId = 120;
EquipmentTypeTextId = 900;--每个界面中的仪器型号id都是900


--设置仪器型号
function set_equipment_type()
    for i = 1, #PublicTab, 1 do
        set_text(PublicTab[i], EquipmentTypeTextId, get_text(SYSTEM_INFO_SCREEN, EquipmentTypeTextId));
    end
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function system_info_control_notify(screen, control, value)
    if control == SetEquipmentTypeTextId then--设置仪器型号
        set_equipment_type();
        print(value);
        record_modify(SYSTEM_INFO_SCREEN, EquipmentTypeRecordId, 0, get_text(screen, control));--修改记录中的仪器型号
        set_enable(SYSTEM_INFO_SCREEN, control, DISABLE);
    elseif control == SerialNumberTextId then
        record_modify(SYSTEM_INFO_SCREEN, SerialNumberRecordId, 0, get_text(screen, control));--修改记录中的仪器序号
        set_enable(SYSTEM_INFO_SCREEN, control, DISABLE);
    elseif control == SetSerialNumberBtId or control == SetEquipmentTypeBtId then--设置仪器序列号或者仪器仪器型号
        set_return_screen_control(screen, control);
        change_screen(PASSWORD_DIALOG_SCREEN);
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
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            Sys.language = CHN;
            set_value(SYSTEM_INFO_SCREEN, SetChineseId, ENABLE);
            set_value(SYSTEM_INFO_SCREEN, SetEnglishId, DISABLE);
            ShowSysCurrentAction(TipsTab[Sys.language].null);
            ShowSysTips(TipsTab[Sys.language].null);
            SetSysWorkStatus(WorkStatus[Sys.language].stop);

            if Sys.userName == SysUser[ENG].maintainer then
                SetSysUser(SysUser[CHN].maintainer);
            else
                SetSysUser(SysUser[CHN].administrator);
            end
            record_modify(SYSTEM_INFO_SCREEN, SysLanguageRecordId, 0, CHN);
            changeCfgFileLanguage(CHN);--将配置文件中的翻译为中文
        end
    elseif control == SetEnglishId then--设置为英文
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            Sys.language = ENG;
            set_value(SYSTEM_INFO_SCREEN, SetChineseId, DISABLE);
            set_value(SYSTEM_INFO_SCREEN, SetEnglishId, ENABLE);
            ShowSysCurrentAction(TipsTab[Sys.language].null);
            ShowSysAlarm(TipsTab[Sys.language].null);
            SetSysWorkStatus(WorkStatus[Sys.language].stop);
            if Sys.userName == SysUser[CHN].maintainer then
                SetSysUser(SysUser[ENG].maintainer);
            else
                SetSysUser(SysUser[ENG].administrator);
            end
            record_modify(SYSTEM_INFO_SCREEN, SysLanguageRecordId, 0, ENG);
            changeCfgFileLanguage(ENG);--将配置文件翻译为英文
        end
    end
end

--***********************************************************************************************
--  设置系统用户
--***********************************************************************************************
function SetSysUser(user)

    Sys.userName = user;

    --在底部的状态用户名
    for i = 1, #PublicTab, 1 do
        set_text(PublicTab[i], SysUserNameId, user);
    end

    if Sys.userName == SysUser[Sys.language].operator then -- 操作员
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, DISABLE);
        -- set_process_edit_state(DISABLE);--禁止流程设置
    elseif Sys.userName == SysUser[Sys.language].maintainer then--运维员
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, DISABLE);
        -- set_process_edit_state(ENABLE);--允许编辑流程
    elseif Sys.userName == SysUser[Sys.language].administrator then--管理员
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, ENABLE);
        -- set_process_edit_state(ENABLE);--允许编辑流程
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
function password_set_control_notify(screen, control, value)

    local oldPwdInput = get_text(PASSWORD_SET_SCREEN, PwdId);--获取密码

    ------------------------确认按钮-----------------------------------------------------
    if control == SureButtonId then
        if oldPwdInput == record_read(SYSTEM_INFO_SCREEN, SysPwdRecordId, PwdRecordPosition) and --旧密码输入正确
        get_text(PASSWORD_SET_SCREEN, NewPwdId) == get_text(PASSWORD_SET_SCREEN, NewPwdConfirmId) and--新密码两次输入一致
        string.len(get_text(PASSWORD_SET_SCREEN, NewPwdId)) == 6 then
            password = get_text(PASSWORD_SET_SCREEN, NewPwdId);
            record_modify(SYSTEM_INFO_SCREEN, SysPwdRecordId, PwdRecordPosition, password);--修改记录
            change_screen(SYSTEM_INFO_SCREEN);
        elseif oldPwdInput ~= record_read(SYSTEM_INFO_SCREEN, SysPwdRecordId, PwdRecordPosition) then--显示"密码错误"
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
        if oldPwdInput ~= record_read(SYSTEM_INFO_SCREEN, SysPwdRecordId, PwdRecordPosition) then--密码输入不正确
            set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 1);--显示密码错误提示信息
        else
            set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 0);
        end
    elseif control == NewPwdId then --输入新密码
        if string.len(get_text(PASSWORD_SET_SCREEN, NewPwdId)) ~= 6 then
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
    if userNameSet == SysUser[Sys.language].maintainer then--运维员密码
        PwdRecordPosition = 0;
    elseif userNameSet == SysUser[Sys.language].administrator then--管理员密码
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
function login_system_control_notify(screen, control, value)
    local pwdInput = get_text(LOGIN_SYSTEM_SCREEN, PwdId);--获取密码

    if control == SureButtonId then--确认按键
        if pwdInput == record_read(SYSTEM_INFO_SCREEN, SysPwdRecordId, PwdRecordPosition) then--检测密码
            SetSysUser(userNameSet);
            change_screen(SYSTEM_INFO_SCREEN);
        else
            set_visiable(LOGIN_SYSTEM_SCREEN, PwdTipsId, 1);--显示密码错误提示信息
        end
    elseif control == CancelButtonId then--取消按键
        SetSysUser(Sys.userName);
        change_screen(SYSTEM_INFO_SCREEN);
    elseif control == PwdId then --密码输入
        if pwdInput ~= record_read(SYSTEM_INFO_SCREEN, SysPwdRecordId, PwdRecordPosition) then--密码输入不正确
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
--[操作权限检测
--para CHK_RUN=只检测是否在运行中; CHK_RUN_USER=同时检测是否在运行中与用户权限
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
function set_return_screen_control(screen, control)
    DestScreen = screen;
    DestControl = control;
end

--当点击对话框界面中的控件时,调用该函数
function dialog_screen_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --确认按钮
        if DestScreen == PROCESS_SET1_SCREEN or DestScreen == PROCESS_SET2_SCREEN then--删除流程设置1界面中的流程
            change_screen(DestScreen);
            local file = DestControl - 250;--DestControl取值251~273,减去250后,对应了1-24,此为流程序号.
            set_text(DestScreen, DestControl + 50, BLANK_SPACE);
            set_text(DestScreen, DestControl - 50, BLANK_SPACE);
            set_text(DestScreen, DestControl + 100, 1);
            WriteParaToConfigStrAndFile(1);--保存流程设置1界面中的参数
            os.remove(file);--删除配置文件
        elseif DestScreen == PROCESS_EDIT1_SCREEN or DestScreen == PROCESS_EDIT2_SCREEN or DestScreen == PROCESS_EDIT3_SCREEN or DestScreen == PROCESS_EDIT4_SCREEN then
            DeleteAction(DestControl - 600);--DestControl为流程编辑界面的删除按钮的id,其从601开始,而流程序号从1开始;
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --取消按钮
        change_screen(DestScreen);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
密码对话框
--------------------------------------------------------------------------------------------------------------------]]
function password_dialog_screen_control_notify(screen, control, value)
    if control == PwdId then
        if get_text(PASSWORD_DIALOG_SCREEN, PwdId) ~= record_read(SYSTEM_INFO_SCREEN, SysPwdRecordId, 1) then--密码输入不正确
            set_visiable(PASSWORD_DIALOG_SCREEN, PwdTipsId, 1);--显示密码错误提示信息
        else
            set_visiable(PASSWORD_DIALOG_SCREEN, PwdTipsId, 0);
        end
    elseif control == SureButtonId and value == ENABLE then
        if get_text(PASSWORD_DIALOG_SCREEN, PwdId) == record_read(SYSTEM_INFO_SCREEN, SysPwdRecordId, 1) then--检测密码
            if DestControl == HistoryClear then--清除历史记录 
                record_clear(DestScreen, HistoryRecordId);--清除记录
                clearHistoryFile(DestScreen);
                print("清除记录");
            elseif DestControl == SetEquipmentTypeBtId then
                print("可以设置仪器型号了");
                set_enable(SYSTEM_INFO_SCREEN, SetEquipmentTypeTextId, ENABLE);
            elseif DestControl == SetSerialNumberBtId then
                print("可以设置序列号了");
                set_enable(SYSTEM_INFO_SCREEN, SerialNumberTextId, ENABLE);
            end
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then
        change_screen(DestScreen);
    end
end

--切换到密码对话框
function goto_dialog_screen()
    set_visiable(PASSWORD_DIALOG_SCREEN, PwdTipsId, 0);--隐藏密码错误提示信息
    set_text(PASSWORD_DIALOG_SCREEN, PwdId, "");
end

--[[-----------------------------------------------------------------------------------------------------------------
连接wifi
--------------------------------------------------------------------------------------------------------------------]]
ScanBtId = 97;
WifiSsid = 1;
WifiPwdId = 5;
WifiStatusTextId = 9;
WifiConnectBtId = 10;
WifiIpAddrId = 42;
function wifi_connect_control_notify(screen, control, value)
    if control == ScanBtId then
        scan_ap_fill_list();
    elseif control >= 27 and control <= 40 then--选取热点
        Sys.ssid = get_text(WIFI_CONNECT_SCREEN, (control - 14)) --文本控件从13~26
        set_text(WIFI_CONNECT_SCREEN, WifiSsid, Sys.ssid)
    elseif control == WifiConnectBtId then
        if string.len(Sys.ssid) > 0 then
            Sys.ssid = get_text(WIFI_CONNECT_SCREEN, WifiSsid);
            wifiPwd = get_text(WIFI_CONNECT_SCREEN, WifiPwdId);
            set_wifi_cfg(1, 0, Sys.ssid, wifiPwd) --连接 WIFI，1 网卡模式，0 自动识别加密
            save_network_cfg();
            set_text(WIFI_CONNECT_SCREEN, WifiStatusTextId, TipsTab[Sys.language].connecting)
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

    for i = 1, ap_cnt, 1 do
        Sys.ssid, Sys.security, Sys.quality = get_ap_info(i - 1)  --获取信息
        set_text(WIFI_CONNECT_SCREEN, i + 12, Sys.ssid)  --显示id
    end

    for i = ap_cnt + 1, 14, 1 do
        set_text(WIFI_CONNECT_SCREEN, i + 12, "")  --清空后面的
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
function remote_update_control_notify(screen, control, value)
    if control == RemoteGetTsVerBtId then--获取触摸屏版本文件
        http_download(1, 'http://' .. get_text(REMOTE_UPDATE_SCREEN, RemoteFtpAddrTextId) .. '/tsVer.txt', "tsVer.txt");
    elseif control == RemoteStartUpdateTsBtId and value == ENABLE then--开始触摸屏升级
        --判断权限
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            --开始升级触摸屏程序(在on_systick中获取升级状态进行显示)
            start_upgrade('ftp://' .. get_text(REMOTE_UPDATE_SCREEN, RemoteFtpAddrTextId) .. '/DCIOT.PKG');
        end
    elseif control == RemoteGetDrvVerBtId then--获取驱动版本文件
        http_download(2, 'http://' .. get_text(REMOTE_UPDATE_SCREEN, RemoteFtpAddrTextId) .. '/drvVer.txt', "drvVer.txt");
    elseif control == RemoteStartUpdateDrvBtId and Sys.hand_control_func == nil then--获取驱动文件
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--检测权限
            --下载STM.BIN文件,在on_http_download函数中判断下载状态
            http_download(3, 'http://' .. get_text(REMOTE_UPDATE_SCREEN, RemoteFtpAddrTextId) .. '/STM.BIN', "STM.BIN");
        end
    end
end


--http_download回调函数,系统自动调用
function on_http_download(taskid, status)
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
    for i = 1, 1024, 1 do
        binCode[i + 5] = string.byte(charCode, i, i)
    end
    --计算数据长度,计算出的数据包含头部的6个数据,不包含尾部的两个CRC数据
    dataLen = #binCode + 1;
    --为binCode数据添加头部与尾部的CRC,构成一个完成的串口数据包
    binCode[0] = 208;
    binCode[1] = 16;
    binCode[2] = 48;--math.modf( Sys.binIndex/256 ) + 0x30;
    binCode[3] = math.fmod(Sys.binIndex, 256)       --0x3000开始表示的是升级数据的第0个包, ox3001表示的是升级数据的第1个包(最?笾С执???56k的数据)
    binCode[4] = math.modf((dataLen - 6) / 256)
    binCode[5] = math.fmod((dataLen - 6), 256)

    uartSendTab.updateDrv = binCode;
    uartSendTab.updateDrv.len = dataLen;
    uartSendTab.updateDrv.note[Sys.language] = TipsTab[Sys.language].updateDrvBd;
    on_uart_send_data(uartSendTab.updateDrv, NEED_REPLY);--在调试时可以使用NO_NEED_REPLY参数,这样就可以不用等待回复

    Sys.binIndex = Sys.binIndex + 1;

    --关闭文件
    drvFile:close();
end


--[[-----------------------------------------------------------------------------------------------------------------
    配置文件0相关操作函数
--------------------------------------------------------------------------------------------------------------------]]

--配置文件的文件名为"0", 在开机时读取到ConfigStr[0]数组当中, 在点击保存时则将ConfigStr[0]字符串保存到"0"文件
cfgFileTab = {
    [1] = { sTag = "<ProcessSet>", eTag = "</ProcessSet>" };--流程设置1/2界面中的参数保存在这个tag中
    [2] = { sTag = "<RunControl>", eTag = "</RunControl>" };--运行控制界面中的参数保存在这个tag中
    [3] = { sTag = "<RangeSet>", eTag = "</RangeSet>" };--量程设置界面中的参数保存在这个tag中
    [4] = { sTag = "<IOSet>", eTag = "</IOSet>" };--输入输出中的参数保存在这个tag中
    [5] = { sTag = "<ReagentSet>", eTag = "</ReagentSet>" };--试剂余量中的参数保存咋这个tag中
};


--***********************************************************************************************
--从配置文件中加载数据到ConfigStr{}缓存
--***********************************************************************************************
function ReadFileToConfigStr()
    ReadFile0();--读取"0"文件,并将文件里的参数设置到 流程设置1界面/运行控制界面/量程设置界面/手动操作3界面/输入输出界面
    for i = 1, 24, 1 do--循环读取文件"1"-"24"
        local configFile = io.open(SdPath .. "config/" ..i, "r")          --打开文本
        if configFile ~= nil then    
            configFile:seek("set")                  --把文件位置定位到开头
            ConfigStr[i] = configFile:read("a")     --从当前位置读取整个文件，并赋值到字符串
            configFile:close()                      --关闭文本
        else
            ConfigStr[i] = nil;
        end
    end
end



--***********************************************************************************************
--创建配置文件,并保存在"0"文件中
--tagNum = 1 : 修改流程设置1界面中的参数 
--tagNum = 2 : 修改运行控制界面中的参数
--tagNum = 3 : 运行控制界面中的参数
--tagNum = 4 : 输入输出中的参数
--tagNum = 5 : 试剂余量中的参数
--***********************************************************************************************
function WriteParaToConfigStrAndFile(tagNum)
    -- print("保存"..cfgFileTab[tagNum].sTag.."参数")
    ConfigStr[0] = DeleteSubString(ConfigStr[0], cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[tagNum].sTag;--添加开始标签
    if tagNum == 1 then
        --流程设置1界面中的参数
        for i = 1, 12, 1 do
            ConfigStr[0] = ConfigStr[0] ..
            get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId) .. "," .. --流程类型选择
            get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId) .. "," ..   --流程名称
            get_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId) .. ",";  --流程量程
        end
        --流程设置2界面中的参数
        for i = 13, 24, 1 do
            ConfigStr[0] = ConfigStr[0] ..
            get_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId) .. "," .. --流程类型选择
            get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId) .. "," ..   --流程名称
            get_text(PROCESS_SET2_SCREEN, ProcessTab[i].rangeId) .. ",";  --流程量程
        end
    elseif tagNum == 2 then--运行控制界面中的参数
        ConfigStr[0] = ConfigStr[0] .."<common>"
        for i = RUNCTRL_TextSid, RUNCTRL_TextEid, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(RUN_CONTROL_SCREEN, i) .. ",";
        end
        ConfigStr[0] = ConfigStr[0]..Sys.status--保存工作状态
        ConfigStr[0] = ConfigStr[0] .."</common>"

        ConfigStr[0] = ConfigStr[0] .."<period>"
        for i = RUNCTRL_PEROID_BtSid, RUNCTRL_PEROID_BtEid, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_value(RUN_CONTROL_PERIOD_SCREEN, i) .. ",";
        end
        for i = RUNCTRL_PEROID_TextSid, RUNCTRL_PEROID_TextEid, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(RUN_CONTROL_PERIOD_SCREEN, i) .. ",";
        end
        ConfigStr[0] = ConfigStr[0] .."</period>"

        ConfigStr[0] = ConfigStr[0] .."<timed>"
        for i = RUNCTRL_TIMED_TextSid, RUNCTRL_TIMED_TextEid, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(RUN_CONTROL_TIMED_SCREEN, i) .. ",";
        end
        ConfigStr[0] = ConfigStr[0] .."</timed>"

        ConfigStr[0] = ConfigStr[0] .."<hand>"
        for i = RUNCTRL_HAND_TextSid, RUNCTRL_HAND_TextEid, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(RUN_CONTROL_HAND_SCREEN, i) .. ",";
        end
        ConfigStr[0] = ConfigStr[0] .."</hand>"

    elseif tagNum == 3 then--量程设置界面中的参数
        for i = RANGESET_TextStartId, RANGESET_TextEndId, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(RANGE_SET_SCREEN, i) .. ",";
        end
    elseif tagNum == 4 then
        for i = IOSET_TextStartId, IOSET_TextEndId, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(IN_OUT_SCREEN, i) .. ",";
        end
    elseif tagNum == 5 then
        for i = REAGENT_BtStartId, REAGENT_BtEndId, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_value(HAND_OPERATE3_SCREEN, i) .. ",";
        end
        for i = REAGENT_TextStartId, REAGENT_TexEndId, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(HAND_OPERATE3_SCREEN, i) .. ",";
        end
    end
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[tagNum].eTag;--添加结束标签

    --设置参数,此处调用该函数可以检查保存的数据是否正确
    SetConfigParaToScreen(tagNum);

    local configFile = io.open(SdPath .. "config/"  .. "0", "w+");  --打开并清空该文件
    configFile:write(ConfigStr[0]);         --将处理过的原文件内容重新写入文件
    configFile:close(); --关闭文本
end

--***********************************************************************************************
--读取配置文件中的所有数据,并将数据保存到cfgFileStr[0]表当中
--***********************************************************************************************
function ReadFile0()
    local configFile = io.open(SdPath .. "config/" .. "0", "r")      --打开文本
    if configFile == nil then--如果没有该文件则返回
        print("没有找到配置文件:0,创建一个默认的配置文件");
        ConfigStr[0] = "";
        for i = 1,5,1 do
            WriteParaToConfigStrAndFile(i);
        end
        configFile = io.open(SdPath .. "config/"  .. "0", "r")      --打开文本
    end
    configFile:seek("set")    --把文件位置定位到开头
    ConfigStr[0] = configFile:read("a")       --从当前位置读取整个文件，并赋值到字符串中
    configFile:close()                            --关闭文本


    -- print(ConfigStr[0]);
    for i = 1,5, 1 do
        SetConfigParaToScreen(i);
    end

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
    -- print("设置"..cfgFileTab[tagNum].sTag.."参数")
    local tagString = GetSubString(ConfigStr[0], cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);--截取标签之间的字符串
    if tagString == BLANK_SPACE then--如果文件0中缺少哪一个标签, 则创建该标签,然后重新获取该标签的内容
        WriteParaToConfigStrAndFile(tagNum);
        tagString = GetSubString(ConfigStr[0], cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);
    end
    local tab = split(tagString, ",")--将读出的字符串按逗号分割,并以此存入tab表
    if tagNum == 1 then--流程设置界面中的参数
        for i = 1, 12, 1 do
            if tab[(i - 1) * 3 + 1] ~= nil then
                set_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId, tab[(i - 1) * 3 + 1]);  --把数据显示到文本框中
            end
            if tab[(i - 1) * 3 + 2] ~= nil then
                set_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId, tab[(i - 1) * 3 + 2]);  --把数据显示到文本框中
            end
            if tab[(i - 1) * 3 + 3] ~= nil then
                set_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId, tab[(i - 1) * 3 + 3]);  --把数据显示到文本框中
            end
        end
        for i = 13, 24, 1 do
            if tab[(i - 1) * 3 + 1] ~= nil then
                set_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId, tab[(i - 1) * 3 + 1]);  --把数据显示到文本框中
            end
            if tab[(i - 1) * 3 + 2] ~= nil then
                set_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId, tab[(i - 1) * 3 + 2]);  --把数据显示到文本框中
            end
            if tab[(i - 1) * 3 + 3] ~= nil then
                set_text(PROCESS_SET2_SCREEN, ProcessTab[i].rangeId, tab[(i - 1) * 3 + 3]);  --把数据显示到文本框中
            end
        end
    elseif tagNum == 2 then--运行控制界面中的参数
        local subTagString = GetSubString(tagString, "<common>", "</common>");--截取标签之间的字符串
        tab = split(subTagString, ",")
        for i = RUNCTRL_TextSid, RUNCTRL_TextEid, 1 do
            if tab[i] ~= nil then
                set_text(RUN_CONTROL_SCREEN, i, tab[i]);
            end
            Sys.stateBeforePwrOff = WorkStatus[Sys.language].stop;--默认: 上一次断电时的状态为停止
            if tab[RUNCTRL_TextEid + 1] ~= nil then
                Sys.stateBeforePwrOff = tab[RUNCTRL_TextEid + 1];
            end
        end

        subTagString = GetSubString(tagString, "<period>", "</period>");--截取标签之间的字符串
        tab = split(subTagString, ",")
        for i = RUNCTRL_PEROID_BtSid, RUNCTRL_PEROID_BtEid, 1 do
            if tab[i] ~= nil then
                set_value(RUN_CONTROL_PERIOD_SCREEN, i, tab[i]);
            end
        end
        for i = RUNCTRL_PEROID_TextSid, RUNCTRL_PEROID_TextEid, 1 do
            if tab[i] ~= nil then
                set_text(RUN_CONTROL_PERIOD_SCREEN, i, tab[i]);
            end
        end

        subTagString = GetSubString(tagString, "<timed>", "</timed>");--截取标签之间的字符串
        tab = split(subTagString, ",")
        for i = RUNCTRL_TIMED_TextSid, RUNCTRL_TIMED_TextEid, 1 do
            if tab[i] ~= nil then
                set_text(RUN_CONTROL_TIMED_SCREEN, i, tab[i]);
            end
        end

        subTagString = GetSubString(tagString, "<hand>", "</hand>");--截取标签之间的字符串
        tab = split(subTagString, ",")
        for i = RUNCTRL_HAND_TextSid, RUNCTRL_HAND_TextEid, 1 do
            if tab[i] ~= nil then
                set_text(RUN_CONTROL_HAND_SCREEN, i, tab[i]);
            end
        end

    elseif tagNum == 3 then--量程设置界面中的参数
        for i = RANGESET_TextStartId, RANGESET_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(RANGE_SET_SCREEN, i, tab[i]);
            end
        end
    elseif tagNum == 4 then
        for i = IOSET_TextStartId, IOSET_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(IN_OUT_SCREEN, i, tab[i]);
            end
        end
    elseif tagNum == 5 then
        for i = REAGENT_BtStartId, REAGENT_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(HAND_OPERATE3_SCREEN, i, tab[i]);
            end
        end
        for i = REAGENT_TextStartId, REAGENT_TexEndId, 1 do
            if tab[i] ~= nil then
                set_text(HAND_OPERATE3_SCREEN, i, tab[i]);
            end
        end
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    配置文件中英文转换函数
--------------------------------------------------------------------------------------------------------------------]]
--***********************************************************************************************
--配置文件由中文转换为英文,或者由英文转为中文
--***********************************************************************************************
function changeCfgFileLanguage(language)
    if language == ENG then--需要转换成英文
        srcLanguage = CHN;
        destLanguage = ENG;
    else                   --需要转换成中文
        srcLanguage = ENG;
        destLanguage = CHN;
    end
    ------------------修改配置文件0, 将其进行中英文切换------------------------------------------
    local configFile = io.open(SdPath .. "config/"  .. "0", "r")      --可读方式打开文本
    if configFile ~= nil then
        configFile:seek("set")    --把文件位置定位到开头
        ConfigStr[0] = configFile:read("a")       --从当前位置读取整个文件，并赋值到字符串中
        configFile:close()                            --关闭文本
        --------运行控制界面的运行方式需要翻译为英文-----------------------------------------
        --截取运<RunControl>标签之间的字符串
        local tagString = GetSubString(ConfigStr[0], cfgFileTab[2].sTag, cfgFileTab[2].eTag);
        local subTagString = GetSubString(tagString, "<common>", "</common>");
        local tab = split(subTagString, ",")--将读出的字符串按逗号分割,并以此存入tab表
        if tab[RunTypeID] == WorkType[srcLanguage].hand then--手动
            tab[RunTypeID] = WorkType[destLanguage].hand;
        elseif tab[RunTypeID] == WorkType[srcLanguage].period then--自动
            tab[RunTypeID] = WorkType[destLanguage].period;
        elseif tab[RunTypeID] == WorkType[srcLanguage].controlled then--反控
            tab[RunTypeID] = WorkType[destLanguage].controlled;
        elseif tab[RunTypeID] == WorkType[srcLanguage].timed then--定时
            tab[RunTypeID] = WorkType[destLanguage].timed;
        end
        --离线模式开关
        if tab[OfflineModeId] == VariableOnOff[srcLanguage].open then
            tab[OfflineModeId] = VariableOnOff[srcLanguage].open
        elseif tab[OfflineModeId] == VariableOnOff[srcLanguage].close then
            tab[OfflineModeId] = VariableOnOff[srcLanguage].close
        end
        --试剂余量检测开关
        if tab[ReagentRemainChkId] == VariableOnOff[srcLanguage].open then
            tab[ReagentRemainChkId] = VariableOnOff[srcLanguage].open
        elseif tab[ReagentRemainChkId] == VariableOnOff[srcLanguage].close then
            tab[ReagentRemainChkId] = VariableOnOff[srcLanguage].close
        end
        --量程自动切换开关
        if tab[RangeAutoSwitchId] == VariableOnOff[srcLanguage].open then
            tab[RangeAutoSwitchId] = VariableOnOff[srcLanguage].open
        elseif tab[RangeAutoSwitchId] == VariableOnOff[srcLanguage].close then
            tab[RangeAutoSwitchId] = VariableOnOff[srcLanguage].close
        end

        set_text(RUN_CONTROL_SCREEN, RunTypeID, tab[RunTypeID]);
        WriteParaToConfigStrAndFile(2)
        --------流程设置界面的流程类型需要翻译为英文-----------------------------------------
        tagString = GetSubString(ConfigStr[0], cfgFileTab[1].sTag, cfgFileTab[1].eTag);
        tab = split(tagString, ",")--将读出的字符串按逗号分割,并以此存入tab表
        for i = 1, MaxProcess*3, 3 do
            for j = 1, #ProcessItem[CHN], 1 do
                if tab[i] == ProcessItem[srcLanguage][j] then
                    tab[i] = ProcessItem[destLanguage][j]
                    break;
                end
            end
        end
        --删除<ProcessSet>标签之间的内容
        ConfigStr[0] = DeleteSubString(ConfigStr[0], cfgFileTab[1].sTag, cfgFileTab[1].eTag);
        --重新生成<ProcessSet>标签的内容
        ConfigStr[0] = ConfigStr[0] .. cfgFileTab[1].sTag;--添加开始标签
        --流程设置1界面中的参数
        for i = 1, MaxProcess*3, 1 do
            ConfigStr[0] = ConfigStr[0] .. tab[i] .. ","
        end
        ConfigStr[0] = ConfigStr[0] .. cfgFileTab[1].eTag;--添加结束标签
        SetConfigParaToScreen(1);--将配置文件显示到界面上
        --------翻译完成后,重新保存到"0"文件当中--------------------------------------------
        configFile = io.open(SdPath .. "config/" .. "0", "w+");  --打开并清空该文件
        configFile:write(ConfigStr[0]);         --将处理过的原文件内容重新写入文件
        configFile:close(); --关闭文本
    end

    ------------------修改配置文件1~24, 将其进行中英文切换------------------------------------------
    for i = 1, MaxProcess, 1 do                       --循环修改文件1-24
        configFile = io.open(SdPath .. "config/" .. i, "r")      --可读方式打开文本
        if configFile ~= nil then         --判断文件是否打开成功
            configFile:seek("set")        --把文件位置定位到开头
            ConfigStr[i] = configFile:read("a")--从当前位置读取整个文件，并赋值到字符串中
            configFile:close()                 --关闭文本
            ----------------翻译<action0>标签中的内容-----------------------------------
            local actionString = GetSubString(ConfigStr[i], "<action0>", "</action0>");
            ---------------翻译<content>标签中的动作类型-----------
            local contentString = GetSubString(actionString, "<content>", "</content>");
            local contentTab = split(contentString, ",")--将读出的字符串按逗号分割,并以此存入tab表
            for j = 1, MaxAction*2, 2 do
                for k = 1, #ActionItem[CHN], 1 do
                    if contentTab[j] == ActionItem[srcLanguage][k] then
                        contentTab[j] = ActionItem[destLanguage][k]
                        break;
                    end
                end
            end
            ---------------删除<action0>标签---------------------------------------
            ConfigStr[i] = DeleteSubString(ConfigStr[i], "<action0>", "</action0>");
            ---------------添加<action0>标签---------------------------------------
            ConfigStr[i] = ConfigStr[i] .. "<action0>";
            ConfigStr[i] = ConfigStr[i] .. "<content>";
            for j = 1, 96, 1 do
                ConfigStr[i] = ConfigStr[i] .. contentTab[j] .. ",";
            end
            ConfigStr[i] = ConfigStr[i] .. "</content>";
            ConfigStr[i] = ConfigStr[i] .. "</action0>";
            ---------------循环翻译<action1>-<action48>中的内容------------------------
            for j = 1, MaxAction, 1 do
                actionString = GetSubString(ConfigStr[i], "<action" .. j .. ">", "</action" .. j .. ">");
                if BLANK_SPACE ~= actionString then
                    typeString = GetSubString(actionString, "<type>", "</type>");--获取流程类型与流程名称
                    typeTab = split(typeString, ",")--将读出的字符串按逗号分割,并以此存入tab表
                    for k = 1, #ActionItem[CHN], 1 do--判断动作类型,将动作类型进行翻译
                        if typeTab[1] == ActionItem[srcLanguage][k] then
                            typeTab[1] = ActionItem[destLanguage][k]
                            break;
                        end
                    end
                    ----------判断为初始化或者计算,还需要翻译初始化里的<content>------------
                    contentString = GetSubString(actionString, "<content>", "</content>");
                    contentTab = split(contentString, ",")--将读出的字符串按逗号分割,并以此存入tab表
                    if typeTab[1] == ActionItem[destLanguage][1] then
                        if contentTab[INIT_AnalysisWayTextId] == AnalysisWay[srcLanguage].colorimetry then
                            contentTab[INIT_AnalysisWayTextId] = AnalysisWay[destLanguage].colorimetry
                        elseif contentTab[INIT_AnalysisWayTextId] == AnalysisWay[srcLanguage].electrode then
                            contentTab[INIT_AnalysisWayTextId] = AnalysisWay[destLanguage].electrode
                        end
                        contentString = "";
                        for k = 1, 23, 1 do
                            contentString = contentString .. contentTab[k] .. ",";
                        end
                        ----------判断为计算,还需要翻译计算里的<content>----------------
                    elseif typeTab[1] == ActionItem[destLanguage][6] then
                        if contentTab[CALCULATE_CalcWayTextId] == CalcWay[srcLanguage].log then
                            contentTab[CALCULATE_CalcWayTextId] = CalcWay[destLanguage].log
                        elseif contentTab[CALCULATE_CalcWayTextId] == CalcWay[srcLanguage].diff then
                            contentTab[CALCULATE_CalcWayTextId] = CalcWay[destLanguage].diff
                        end

                        if contentTab[CALCULATE_CalcTypeTextId] == CalcType[srcLanguage][1] then
                            contentTab[CALCULATE_CalcTypeTextId] = CalcType[destLanguage][1]
                        elseif contentTab[CALCULATE_CalcTypeTextId] == CalcType[srcLanguage][2] then
                            contentTab[CALCULATE_CalcTypeTextId] = CalcType[destLanguage][2]
                        elseif contentTab[CALCULATE_CalcTypeTextId] == CalcType[srcLanguage][3] then
                            contentTab[CALCULATE_CalcTypeTextId] = CalcType[destLanguage][3]
                        end
                        contentString = "";
                        for k = 1, 13, 1 do
                            contentString = contentString .. contentTab[k] .. ",";
                        end
                    end
                    ---------------删除<actionj>标签---------------------------------------
                    ConfigStr[i] = DeleteSubString(ConfigStr[i], "<action" .. j .. ">", "</action" .. j .. ">");
                    ---------------添加<actionj>标签---------------------------------------
                    -- print("i="..i.." j="..j.." typeString="..typeString)
                    ConfigStr[i] = ConfigStr[i] .. "<action" .. j .. ">";
                    ConfigStr[i] = ConfigStr[i] .. "<type>";
                    ConfigStr[i] = ConfigStr[i] .. typeTab[1] .. ",";
                    ConfigStr[i] = ConfigStr[i] .. typeTab[2] .. ",";
                    ConfigStr[i] = ConfigStr[i] .. "</type>";
                    ConfigStr[i] = ConfigStr[i] .. "<content>";
                    ConfigStr[i] = ConfigStr[i] .. contentString;
                    ConfigStr[i] = ConfigStr[i] .. "</content>";
                    ConfigStr[i] = ConfigStr[i] .. "</action" .. j .. ">";
                end
            end
            ---------------保存config[i]文件---------------------------------------
            configFile = io.open(SdPath .. "config/" .. i, "w+");  --打开并清空该文件
            configFile:write(ConfigStr[i]);         --将处理过的原文件内容重新写入文件
            configFile:close(); --关闭文本
        end
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    流程配置文件相关操作函数
--------------------------------------------------------------------------------------------------------------------]]



--***********************************************************************************************
--通过流程名称获取流程id
--***********************************************************************************************
function getFileNameByProcessName(processName)
    local fileName = 0;
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then--找到当前流程名对应的序号
            fileName = i;
            break;
        end
    end

    for i = 13, 24, 1 do
        if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then--找到当前流程名对应的序号
            fileName = i;
            break;
        end
    end
    return fileName;
end


--***********************************************************************************************
--将配置参数保存至文件
--***********************************************************************************************
function WriteCfgToFlash()
    print("调用 WriteCfgToFlash 函数");
    local processName = get_text(PROCESS_EDIT1_SCREEN, ProcessSelectId);--获取流程名称

    local fileName = getFileNameByProcessName(processName);
    if fileName ~= 0 then
        local configFile = io.open(SdPath .. "config/" .. fileName, "w+");  --打开并清空该文件
        configFile:write(ConfigStr[fileName]);         --将处理过的原文件内容重新写入文件
        configFile:close(); --关闭文本
    end
end

--***********************************************************************************************
--该函数检测配置文件中是否有<action?>标签, ? 范围1~12. 如果没有该标签,则创建一个默认的配置,如果有则直接返回
--actionNumber:动作标签,范围:action1~action24
--***********************************************************************************************
function WriteDefaultActionTag(actionNumber)
    print("调用 WriteDefaultActionTag 函数");
    local processName = get_text(PROCESS_EDIT1_SCREEN, ProcessSelectId);--获取流程名称
    local fileName = getFileNameByProcessName(processName);
    if fileName == 0 then
        return
    end

    WriteActionTagToBuf(fileName, 0);--修改<action0>标签中的内容, 增加或者删除一个动作

    local fileString = ConfigStr[fileName];

    --如果该配置文件已经有<action?>标签,则直接返回
    if string.find(fileString, "<action" .. actionNumber .. ">", 1) ~= nil then
        return;
    end

    --如果该配置文件已经没有<action?>标签,则继续执行,创建一个默认的标签
    WriteActionTagToBuf(fileName, actionNumber);
end

--***********************************************************************************************
--将动作写入配置文件中,该文件在WriteProcessFile中调用
--fileName:配置文件名称:范围:1-24,对应24个流程(每个流程对应一个配置文件)
--actionNumber:动作标签,范围:action0~action24
--***********************************************************************************************
function WriteActionTagToBuf(fileName, actionNumber)
    print("调用 WriteActionTagToBuf 函数");
    --将原来的<action?>-</action?>标签之间的字符串删除
    if ConfigStr[fileName] ~= nil then
        ConfigStr[fileName] = DeleteSubString(ConfigStr[fileName], "<action" .. actionNumber .. ">", "</action" .. actionNumber .. ">");
    else
        ConfigStr[fileName] = "";
    end

    local actionType=""
    local actionName="";
    if actionNumber >= 1 and actionNumber <= 12 then
        actionType = get_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].typeId);--获取当前动作类型
        actionName = get_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].nameId);--获取当前动作名称
    elseif actionNumber >= 13 and actionNumber <= 24 then
        actionType = get_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].typeId);--获取当前动作类型
        actionName = get_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].nameId);--获取当前动作名称
    elseif actionNumber >= 25 and actionNumber <= 36 then
        actionType = get_text(PROCESS_EDIT3_SCREEN, TabAction[actionNumber].typeId);--获取当前动作类型
        actionName = get_text(PROCESS_EDIT3_SCREEN, TabAction[actionNumber].nameId);--获取当前动作名称
    elseif actionNumber >= 37 and actionNumber <= 48 then
        actionType = get_text(PROCESS_EDIT4_SCREEN, TabAction[actionNumber].typeId);--获取当前动作类型
        actionName = get_text(PROCESS_EDIT4_SCREEN, TabAction[actionNumber].nameId);--获取当前动作名称
    end

    ConfigStr[fileName] = ConfigStr[fileName] .. "<action" .. actionNumber .. ">";--写入开始标签
    ConfigStr[fileName] = ConfigStr[fileName] .. "<type>" .. actionType .. "," .. actionName .. "</type>"--写入动作类型与动作名称(或流程类型与名称):初始化/注射泵/消解......
    ConfigStr[fileName] = ConfigStr[fileName] .. "<content>";
    --------------------------------写<action0>标签内容---------------------------------------------
    --<action0>标签保存的都是该流程中,对应的流程编辑1/3界面中的动作选择/动作名称
    if actionNumber == 0 then
        for i = 1, 12, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId) .. "," .. --动作类型选择
            get_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId) .. "," --动作名称
        end
        for i = 13, 24, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId) .. "," .. --动作类型选择
            get_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId) .. "," --动作名称
        end
        for i = 25, 36, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_EDIT3_SCREEN, TabAction[i].typeId) .. "," .. --动作类型选择
            get_text(PROCESS_EDIT3_SCREEN, TabAction[i].nameId) .. "," --动作名称
        end
        for i = 37, 48, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId) .. "," .. --动作类型选择
            get_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId) .. "," --动作名称
        end
        --------------------------------写开始界面参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][1] then
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_value(PROCESS_INIT_SCREEN, i) .. "," --写入按钮值
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_INIT_SCREEN, i) .. "," --写入文本值
        end
        --------------------------------写取样界面参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][2] then
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_value(PROCESS_INJECT_SCREEN, i) .. "," --写入输出1按钮值
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_INJECT_SCREEN, i) .. "," --写入文本值
        end
        --------------------------------写注射泵加液参数--------------------------------------------------
    elseif actionType == ActionItem[Sys.language][3] then
        for i = INJECT_ADD_BtStartId, INJECT_ADD_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_value(PROCESS_INJECT_ADD_SCREEN, i) .. "," --写入按钮值
        end
        for i = INJECT_ADD_TextStartId, INJECT_ADD_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_INJECT_ADD_SCREEN, i) .. "," --写入文本值
        end
        --------------------------------写-读取信号参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][4] then
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_READ_SIGNAL_SCREEN, i) .. "," --写入文本值
        end
        --------------------------------写-蠕动泵加液参数--------------------------------------------------
    elseif actionType == ActionItem[Sys.language][5] then
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_value(PROCESS_PERISTALTIC_SCREEN, i) .. "," --写入按钮值
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_PERISTALTIC_SCREEN, i) .. "," --写入文本值
        end
        --------------------------------写-计算参数--------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][6] then
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_value(PROCESS_CALCULATE_SCREEN, i) .. "," --写入按钮值
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_CALCULATE_SCREEN, i) .. "," --写入文本值
        end
        --------------------------------写-等待时间参数----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][7] then
        ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId)
        --------------------------------写-消解参数--------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][8] then
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_value(PROCESS_DISPEL_SCREEN, i) .. "," --写入按钮值
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_DISPEL_SCREEN, i) .. "," --写入文本值
        end
        --------------------------------写-阀操作参数------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][9] then
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_value(PROCESS_VALVE_CTRL_SCREEN, i) .. "," --写入按钮值
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            ConfigStr[fileName] = ConfigStr[fileName] .. get_text(PROCESS_VALVE_CTRL_SCREEN, i) .. "," --写入文本值
        end
        --------------------------------写-空操作参数------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][10] then
        ConfigStr[fileName] = ConfigStr[fileName] .. "<content> </content>"
    end
    ConfigStr[fileName] = ConfigStr[fileName] .. "</content>"
    ConfigStr[fileName] = ConfigStr[fileName] .. "</action" .. actionNumber .. ">"--写入结束标签
end

--***********************************************************************************************
--保存单个流程配置文件,每个流程都有一个对应的配置文件,文件名为该流程在表格中的序号
--actionNumber:动作标签,范围:action1~action24
--***********************************************************************************************
function WriteActionTagToConfigStr(actionNumber)
    print("调用 WriteActionTagToConfigStr 函数");
    local processName = get_text(PROCESS_EDIT1_SCREEN, ProcessSelectId);--获取流程名称
    
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then--找到当前流程名对应的序号
            WriteActionTagToBuf(i, actionNumber);--保存数据到文件中,文件名为1~24, 保存的内容为action0~action12标签
        end
    end
    for i = 13, 24, 1 do
        if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then--找到当前流程名对应的序号
            WriteActionTagToBuf(i, actionNumber);--保存数据到文件中,文件名为1~24, 保存的内容为action0~action12标签
        end
    end
end

--***********************************************************************************************
--actionNumber: 动作id , 从该动作开始,之后的动作都进行+1或者-1的操作
--flag 1=加操作, 2=减操作
--***********************************************************************************************
function ChangeActionFileTag(actionNumber, flag)
    print("调用 ChangeActionFileTag 函数");
    local processName = get_text(PROCESS_EDIT1_SCREEN, ProcessSelectId);--获取流程名称
    local fileName;
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then--找到当前流程名对应的序号
            WriteActionTagToBuf(i, 0);--调整流程编辑1/3界面的显示后,再修改<action0>标签中的内容
            fileName = i;
        end
    end
    for i = 13, 24, 1 do
        if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then--找到当前流程名对应的序号
            WriteActionTagToBuf(i, 0);--调整流程编辑1/3界面的显示后,再修改<action0>标签中的内容
            fileName = i;
        end
    end

    --字符替换;1表示需要对动作进行加操作,此时执行的是插入动作,
    if flag == 1 then
        ConfigStr[fileName] = DeleteSubString(ConfigStr[fileName], "<action36>", "</action36>");--删除指定的标签内容
        for i = 35, actionNumber, -1 do
            ConfigStr[fileName] = string.gsub(ConfigStr[fileName], "action" .. i, "action" .. (i + 1));
        end
    else--2表示需要对动作标签进行减操作,此时执行的是删除操作
        ConfigStr[fileName] = DeleteSubString(ConfigStr[fileName], "<action" .. actionNumber .. ">", "</action" .. actionNumber .. ">");--删除指定的标签内容
        for i = actionNumber + 1, 36, 1 do
            ConfigStr[fileName] = string.gsub(ConfigStr[fileName], "action" .. i, "action" .. (i - 1));
        end
    end
end

--***********************************************************************************************
--读配置文件函数,这里每次只读取一个标签里的值, 例如<action1>标签之间的值
--actionNumber: 当前动作为第几步
--***********************************************************************************************
function ReadActionTagOfFile(fileName, actionNumber)
    print("调用 ReadActionTagOfFile 函数");

    if ConfigStr[fileName] == nil then
        for i = 1, 12, 1 do--清空流程编辑界面1/2/3/4中的内容
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, BLANK_SPACE);
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId, BLANK_SPACE);
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i + 12].typeId, BLANK_SPACE);
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i + 12].nameId, BLANK_SPACE);
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i + 24].typeId, BLANK_SPACE);
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i + 24].nameId, BLANK_SPACE);
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i + 36].typeId, BLANK_SPACE);
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i + 36].nameId, BLANK_SPACE);
        end
        WriteActionTagToConfigStr(0);--添加<action0>标签中的内容
        return;
    end

    --截取fileString文件中<action?> ~ </action?>标签之间的字符串
    local actionString = GetSubString(ConfigStr[fileName], "<action" .. actionNumber .. ">", "</action" .. actionNumber .. ">");
    if actionString == nil then--如果文件中没有该标签,则返回.
        Sys.logContent = fileName .. "文件中没有找到<action" .. actionNumber .. ">"
        ShowSysTips(Sys.logContent);
        add_history_record(HISTORY_LOG_SCREEN);
        return
    end

    --截取actionString字符串中<type>标签之间的字符串,获取动作类型与动作名称
    local actionType = GetSubString(actionString, "<type>", "</type>");
    actionType = split(actionType, ",");--分割字符串

    --再截取<content>标签中的内容
    local contentTabStr = GetSubString(actionString, "<content>", "</content>");
    print("contentTabStr="..contentTabStr);
    if contentTabStr == nil then--如果没有内容,则清空流程编辑1/3界面中的动作选择与动作名称
        Sys.logContent = fileName .. "文件中没有找到<content>"
        ShowSysTips(Sys.logContent);
        add_history_record(HISTORY_LOG_SCREEN);
        return;
    end

    local tab = split(contentTabStr, ",");--分割字符串
    if actionNumber == 0 then --判定为<action0>标签
        for i = 1, 12, 1 do
            if tab[(i - 1) * 2 + 1] ~= nil then
                set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, tab[(i - 1) * 2 + 1]);  --把数据显示到文本框中
            end
            if tab[(i - 1) * 2 + 2] ~= nil then
                set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId, tab[(i - 1) * 2 + 2]); --把数据显示到文本框中
            end
        end
        for i = 13, 24, 1 do
            if tab[(i - 1) * 2 + 1] ~= nil then
                set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, tab[(i - 1) * 2 + 1]);  --把数据显示到文本框中
            end
            if tab[(i - 1) * 2 + 2] ~= nil then
                set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId, tab[(i - 1) * 2 + 2]); --把数据显示到文本框中
            end
        end
        for i = 25, 36, 1 do
            if tab[(i - 1) * 2 + 1] ~= nil then
                set_text(PROCESS_EDIT3_SCREEN, TabAction[i].typeId, tab[(i - 1) * 2 + 1]);  --把数据显示到文本框中
             end
            if tab[(i - 1) * 2 + 2] ~= nil then
                set_text(PROCESS_EDIT3_SCREEN, TabAction[i].nameId, tab[(i - 1) * 2 + 2]); --把数据显示到文本框中
            end
        end
        for i = 37, 48, 1 do
            if tab[(i - 1) * 2 + 1] ~= nil then
                set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, tab[(i - 1) * 2 + 1]);  --把数据显示到文本框中
            end
            if tab[(i - 1) * 2 + 2] ~= nil then
                set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, tab[(i - 1) * 2 + 2]); --把数据显示到文本框中
            end
        end
        --------------------------------读-初始化界面参数--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][1] then
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_INIT_SCREEN, i, tab[i]);--写入按钮值
            end
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_INIT_SCREEN, i, tab[i]);--写入文本值
            end
        end
        --------------------------------读-折射泵界面参数--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][2] then
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_INJECT_SCREEN, i, tab[i]);--tab中前17个位按钮值
            end
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_INJECT_SCREEN, i, tab[i]);--tab中前17个位按钮值
            end
        end
        --------------------------------读-注射泵加液参数-------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][3] then
        for i = INJECT_ADD_BtStartId, INJECT_ADD_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_INJECT_ADD_SCREEN, i, tab[i]);--写入按钮值
            end
        end
        for i = INJECT_ADD_TextStartId, INJECT_ADD_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_INJECT_ADD_SCREEN, i, tab[i]);--写入文本值
            end
        end
        --------------------------------读-读取信号参数--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][4] then
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_READ_SIGNAL_SCREEN, i, tab[i]);--写入文本值
            end
        end
        --------------------------------读-蠕动泵加液参数------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][5] then
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--写入按钮值
            end
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--写入文本值
            end
        end
        --------------------------------读-计算参数------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][6] then
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_CALCULATE_SCREEN, i, tab[i]);--写入按钮值
            end
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_CALCULATE_SCREEN, i, tab[i]);--写入文本值
            end
        end
        --------------------------------读-等待时间参数--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][7] then
        set_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId, tab[1]);
        --------------------------------读-消解参数------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][8] then
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_DISPEL_SCREEN, i, tab[i]);--写入按钮值
            end
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_DISPEL_SCREEN, i, tab[i]);--写入文本值
            end
        end
        --------------------------------读-阀操作参数------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][9] then
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_VALVE_CTRL_SCREEN, i, tab[i]);--写入按钮值
            end
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_VALVE_CTRL_SCREEN, i, tab[i]);--写入文本值
            end
        end
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    一些实用函数
--------------------------------------------------------------------------------------------------------------------]]

--***********************************************************************************************
--字符串分割函数,str -> 需要分割的字符串;delimiter->分隔符
--***********************************************************************************************
function split(str, delimiter)
    local dLen = string.len(delimiter)--获取字符串长度
    local newDeli = ''
    for i = 1, dLen, 1 do
        newDeli = newDeli .. "[" .. string.sub(delimiter, i, i) .. "]"
    end

    local locaStart, locaEnd = string.find(str, newDeli)
    local arr = {}
    local n = 1
    while locaStart ~= nil
    do
        if locaStart > 0 then
            arr[n] = string.sub(str, 1, locaStart - 1)
            n = n + 1
        end

        str = string.sub(str, locaEnd + 1, string.len(str))
        locaStart, locaEnd = string.find(str, newDeli)
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
function GetSubString(str, substr1, substr2)
    local s1, e1 = string.find(str, substr1)  --获取字符串1的位置
    local s2, e2 = string.find(str, substr2)  --获取字符串2的位置
    local subString
    if s1 == nil or s2 == nil then
        subString = BLANK_SPACE;
    else
        subString = string.sub(str, e1 + 1, s2 - 1);
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
    local s1, e1 = string.find(str, substr1)  --获取字符串1的位置
    local s2, e2 = string.find(str, substr2)  --获取字符串2的位置
    if s1 ~= nil and s2 ~= nil then
        str = string.sub(str, 1, s1 - 1) .. string.sub(str, e2 + 1, -1);
    end
    return str
end

--***********************************************************************************************
--复制文件操作, 用于配置文件的导入导出
--***********************************************************************************************
function ConfigFileCopy(sourcefile, destinationfile)
    sFile = io.open(sourcefile, "r");
    if sFile == nil then
        return false;
    end
    destFile = io.open(destinationfile, "w");
    destFile:write(sFile:read("*all"));
    sFile:close()
    destFile:close()
    return true;
end

--***********************************************************************************************
--将BCD转换为字符串，在获取版本信息的时候会使用到。
--***********************************************************************************************
function bcd_to_string(bcd)
    --取模获得低四位,取整获得高四位
    local str = "";
    if bcd ~= nil then
        str = tostring(math.modf(bcd / 16)) .. tostring(math.fmod(bcd, 16));
    end;
    return str;
end

--***********************************************************************************************
--将16进制转换为浮点数表示
--验证网址:https://www.h-schmidt.net/FloatConverter/IEEE754.html
--***********************************************************************************************
function hexToFloat(hexString)
    if hexString == nil then
        return 0
    end
    local t = type(hexString)
    if t == "string" then
        hexString = tonumber(hexString, 16)
    end

    local hexNums = hexString

    local sign = math.modf(hexNums / (2 ^ 31))

    local exponent = hexNums % (2 ^ 31)
    exponent = math.modf(exponent / (2 ^ 23)) - 127

    local mantissa = hexNums % (2 ^ 23)

    for i = 1, 23 do
        mantissa = mantissa / 2
    end
    mantissa = 1 + mantissa
    --	print(mantissa)
    local result = (-1) ^ sign * mantissa * 2 ^ exponent
    return result
end


--***********************************************************************************************
--将浮点数转换为16进制表示
--***********************************************************************************************
function FloatToHex(floatNum)
    local S = 0
    local E = 0
    local M = 0
    if floatNum == 0 then
        return "00000000"
    end
    local num1, num2 = math.modf(floatNum / 1)
    local InterPart = num1

    if floatNum > 0 then
        S = 0 * 2 ^ 31
    else
        S = 1 * 2 ^ 31
    end
    local intercount = 0
    repeat
        num1 = math.modf(num1 / 2)
        intercount = intercount + 1
    until (num1 == 0)

    E = intercount - 1
    local Elen = 23 - E
    InterPart = InterPart % (2 ^ E)
    InterPart = InterPart * (2 ^ Elen)

    E = E + 127
    E = E * 2 ^ 23

    for i = 1, Elen do
        num2 = num2 * 2
        num1, num2 = math.modf(num2 / 1)
        M = M + num1 * 2 ^ (Elen - i)
    end

    M = InterPart + M

    --E值为整数部分转成二进制数后左移位数：22.8125 转成二进制10110.1101，左移4位 1.01101101
    --E=4 ，再加上127 就为所需E值
    --010000011 01101101 000000000000000
    local Result = S + E + M

    Result = string.format("%08X", Result)
    return Result
end

--***********************************************************************************************
--    单个字符加密函数
--***********************************************************************************************
function encryptChar(char)
    local enChar;
    if string.byte(char) < 128 then
        enChar = string.char(string.byte(char)+128)
    else
        enChar = string.char(string.byte(char)-128)
    end
    return enChar;
end

--***********************************************************************************************
--    单个字符解密函数
--***********************************************************************************************
function decodeChar(char)
    local deChar;
    if string.byte(char) >= 128 then
        deChar = string.char(string.byte(char)-128)
    else
        deChar = string.char(string.byte(char)+128)
    end
    return deChar
end

--***********************************************************************************************
 --   字符串加密函数
--***********************************************************************************************
function encryptStr(str)
    local enStr = ""
    for i=1, #str, 1 do
        local signelChar = string.sub(str,i,i);
        enStr = enStr..encryptChar(signelChar);
    end
    return enStr;
end

--***********************************************************************************************
--    字符串解密函数
--***********************************************************************************************
function decodeStr(str)
    local deStr = ""
    for i=1, #str, 1 do
        local signelChar = string.sub(str,i,i);
        deStr = deStr..decodeChar(signelChar);
    end
    return deStr;
end

--***********************************************************************************************
--- 保留小数点后n位
--- nNum 源数字, n 小数位数
-----***********************************************************************************************
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
