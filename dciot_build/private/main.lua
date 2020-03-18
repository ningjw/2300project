--�����г��˳��õĻص�����
--���๦�����Ķ�<<������LUA�ű�API.pdf>>
--����ʹ��visual code studio ����װBookmarks��luaide-lite(����LuaCoderAssist)���,
--ͨ����ͬĿ¼�µ�2300project.code-workspace�����ռ�鿴main.lua�ļ�,���ļ�ʹ��Bookmarks��������˺ܶ��ǩ,������ת
--�ڴ��ַ���䣺
--0-35��������ǲ���Ա�����Ա�����룬ͨ����ϵͳ��Ϣ�������IdΪ13����ʷ��¼�ؼ��������á�
--36-199��Ԥ���ռ�
--200-4724���������У����ʷ��¼
--4724-7498��������Ǳ�����¼
--7498-13022���������������־
--13022��ʼ���������ʷ��¼��



--[[-----------------------------------------------------------------------------------------------------------------
    �궨��&ȫ�ֱ���
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
WIFI_CONNECT_SCREEN = 34;
REMOTE_UPDATE_SCREEN = 35;

--���ﶨ���Public table��������״̬���Ľ���, �������"����״̬""��ǰ����""�û�""����"
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
PERIOD_PROCESS = 0;--��������
TIMED_PROCESS = 1;--��ʱ����

COLOR_METHOD = 0; --��ɫ��
ELEC_METHOD = 1;--�缫��

ENABLE_STRING = "1.0"
DISABLE_STRING = "0.0"

ENABLE = 1.0
DISABLE = 0.0

CHN = 1;--����
ENG = 2;--Ӣ��

SET = 1;
RESET = 0;

SEND_OK = 0;
SEND_FAIL = 1;

FINISHED = 0;--������ִ�����

OPEN = 1;--����
CLOSE = 0;--���ر�

UNLOCKED = 0;--����δ����
LOCKED = 1;--����������

NO_NEED_REPLY = 0;--�������ݲ���Ҫ�ظ�
NEED_REPLY = 1;--����������Ҫ�ظ�

Direction = {
    [CHN] = {FWD = "��ת",REV = "��ת"},
    [ENG] = {FWD = "CW",REV="CCW"},
}

CalcOrder = {
    [CHN] = {first = "һ��", second = "����", Third = "����"},
    [ENG] = {first = "First",second="Second", Third = "Third"},
}

--��ʾ��Ϣ
TipsTab = {
    [CHN] = {
        insertSdUsb = "�����SD��",
        insertSd    = "����SD��",
        insertUsb   = "����U��",
        pullOutSd   = "�γ�SD��",
        pullOutUSB  = "�γ�U��",
        importing   = "���ڵ��������ļ�...",
        imported    = "�����ļ�����ɹ�",
        exporting   = "���ڵ��������ļ�...",
        exported    = "�����ļ������ɹ�",
        exportTips  = "����SD������config�ļ��к�����",
        selectProcess = "��ѡ������",
        sysInit = "ϵͳ��ʼ��",
        getVerFileFail = "��ȡ�汾�ļ�ʧ��",
        saveVerFileFail = "����汾�ļ�ʧ��",
        openVerFileFail = "�򿪰汾�ļ�ʧ��",
        getFirmwareFail = "��ȡ�̼�ʧ��",
        saveFirmwareFail = "����̼�ʧ��",
        saveFirmwareOk  = "���ز�����̼��ɹ�",
        openFirmwareFail = "�򿪹̼�ʧ��",
        updateFail = "����ʧ��",
        sendFirmwareOk   = "�̼����ͳɹ�",
        updateDrvBd = "����������",
        reply = "�ظ�",
        connected = "������",
        unconnected = "δ����",
        null  = "��",
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
        null    = "NULL",
    },
};

--ϵͳ��־��Ϣ
 SysLog = {
    [CHN] = {
        uartTimeOut = "�ظ���ʱ",
        start = "��ʼ",
        stop = "����",
    },
    [ENG] = {
        uartTimeOut = "Timeout",
        start = "Start",
        stop = "Stop",
    },
};

--����״̬
WorkStatus = {
    [CHN] = {
        run = "����",--��ʱϵͳ������������
        stop = "ֹͣ",
        readyRun = "����", --��ʱΪ�Զ����з�ʽ, ���ڵȴ�ʱ�䵽���Զ�������һ�����̵�״̬.
    },
    [ENG] = {
        run = "RUN",--��ʱϵͳ������������
        stop = "STOP",
        readyRun = "READY", --��ʱΪ�Զ����з�ʽ, ���ڵȴ�ʱ�䵽���Զ�������һ�����̵�״̬.
    }
};

--��������: Ҫ�����п��ƽ�������з�ʽ�˵�һһ��Ӧ
WorkType = {
    [CHN] = {
        hand = "�ֶ�",--��������ť��,ִ��һ��
        auto = "�Զ�",--��������ť��,���Ը���ʱ���ж��Ƿ�������������붨ʱ����
        controlled = "����",--ͨ����λ������ָ����������.
    },
    [ENG] = {
        hand = "Manual",--��������ť��,ִ��һ��
        auto = "Auto",--��������ť��,���Ը���ʱ���ж��Ƿ�������������붨ʱ����
        controlled = "Controlled",--ͨ����λ������ָ����������.
    },
}

--ϵͳ�û�
SysUser = {
    [CHN] = {
        operator = "����Ա",
        maintainer = "��άԱ",
        administrator = "����Ա",
    },
    [ENG] = {
        operator = "Operator",
        maintainer = "Maintainer",
        administrator = "Admin",
    },
}



--��״̬
ValveStatus = {
    [CHN] = {
        open = "��",
        close = "�ر�"
    },
    [ENG] = {
        open = "Open",
        close = "Close"
    },
};

--LED״̬
LedStatus = {
    [CHN] = {
        open = "��",
        close = "�ر�"
    },
    [ENG] = {
        open = "ON",
        close = "OFF"
    },
};

--���㷽ʽ
CalcWay = {
    [CHN] = {
        log = "ȡ����",
        diff = "ȡ��ֵ",
    },
    [ENG] = {
        log = "Log10",
        diff = "Diff",
    },
};

CalcType = {
    [CHN] = {"����","У��һ","У����","У����","У����"},
    [ENG] = {"Analysis","Calibration 1","Calibration 2","Calibration 3","Calibration 4"},
};

ProcessItem = {
    [CHN] = {"����","У��","��ϴ","��·���","���˲�","�����˲�","��Ⱥ˲�",BLANK_SPACE},
    [ENG] = {"Analysis","Calibration","Washing","Fill","Zero Check","STD Check","Span Check",BLANK_SPACE},
};

--ActionItem�����ֵһ��Ҫ�붯��ѡ����水ť�е�ֵһһ��Ӧ
ActionItem = {
    [CHN] = {"��ʼ��","ע���","ע��ü�Һ��","��ȡ�ź�","�䶯�ü�Һ","����","�ȴ�ʱ��","����","������",BLANK_SPACE},
    [ENG] = {"Initialize","Injector","Injector Add","Read Signal","Pump Add","Calculation","Wait Time","Dispel","Valve",BLANK_SPACE},
};


Sys = {
    language = CHN,--ϵͳ����
    userName = "",--���ڱ��浱ǰ�û�
    status = 0,--ϵͳ״̬:��ӦWorkStatus�е�ֵ
    runType = 0,--���з�ʽ: ��ӦWorkType�е�ֵ
    analysisType = COLOR_METHOD,--��������
    rangetypeId = 1,--���ڼ�¼����ѡ��

    handRunTimes = 0;--��¼���ֶ����д���

    periodStartDateTime = "",--�������̿�ʼʱ��
    periodicIndex = 1,--��������id, ���������ܹ����ĸ�, �ñ���ֵ�ķ�ΧΪ1-4.

    actionTotal = 0,--���еĶ�������,����ͨ��ͳ��<action>��ǩ���
    actionStep = 1,--ȡֵ��ΧΪ1-24,��Ӧ����������2/3�����еĹ�24������
    actionSubStep = 1,--�ñ������ڿ���"��ʼ��"ע���""����""ע��ü�Һ"�ȵ��Ӷ���.
    --actionIdTab�����˸������������,����SystemArg.actionIdTab[1] = 3, ��ʾ��һ����ִ�����Ϊ3��action, Ҳ��ζ�����Ϊ1/2��actionΪ�ո�(û������)
    actionIdTab = {[1] = 0,[2] = 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0,[7] = 0,[8] = 0, [9] = 0, [10] = 0,[11] = 0,[12] = 0,
                 [13]= 0,[14]= 0,[15]= 0,[16]= 0,[17]= 0,[18]= 0,[19]= 0,[20] = 0,[21] = 0,[22] = 0,[23] = 0,[24] = 0},

    actionNameTab = {[1] = 0,[2] = 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0,[7] = 0,[8] = 0, [9] = 0, [10] = 0,[11] = 0,[12] = 0,
                 [13]= 0,[14]= 0,[15]= 0,[16]= 0,[17]= 0,[18]= 0,[19]= 0,[20] = 0,[21] = 0,[22] = 0,[23] = 0,[24] = 0},

    actionFunction = nil,--����ָ����Ҫִ�еĶ�������,���� excute_init_process, excute_get_sample_process��
    actionString,--��ȡ���������ļ��е�action��ǩ��, ���ݱ��浽�ñ���
    actionType="",--���ڱ���type��ǩ�е�����, ��ʾ�ö�����""��ʼ��""ע���""ע��ü�Һ"�ȵ�
    contentTabStr = "",--���ڱ���content��ǩ�е�����
    contentTab = {},  --���ڱ���content��ǩ�е�����,��ʱ�Ѿ�����split��contentTabStr�е����ݽ����˷ָ�

    currentProcessId = 0,--��ǰ����ִ�е�����,����Ӧ�ĵ����.
    processFileStr = nil,--����ȡ������ص������ļ���,���浽�ñ�������
    processName = nil ,--��������
    processType = nil,--��������, ͨ���ñ����ж���У�� ���� ��У��. У��ʹ��һ���㷨, ��У��ʹ����һ���㷨
    processStep = 1,--ִ������ʱ,��ֲ���, �����һ����ȡaction����,������������,ȷ��ִ�еĶ�������, �ڶ����Ϳ���ִ�ж���������
    isPeriodOrTimed = 0,--ʹ�øñ����ж����������̻��Ƕ�ʱ����

    startTime =  {year = 0, mon=0, day = 0, hour = 0, min = 0, sec = 0},--��ʼʱ��
    resultTime = {year = 0, mon=0, day = 0, hour = 0, min = 0, sec = 0},--���ʱ��
    dateTime =   {year = 0, mon=0, day = 0, hour = 0, min = 0, sec = 0},--ϵͳ����ʱ��,��1S��ʱ���в���ˢ��

    driverStep = 1,--���ڿ����������Ӳ�Ķ���,�����ڿ���ʱ: ��һ����Ҫͨ�����ڷ��Ϳ���ָ��, �ڶ�����Ҫ�ȴ��ظ��ɹ�, ��������Ҫ�ȴ�һ����ʱ��.��������ɸñ�������
    driverStep1Func = nil,--��step=driverStepʱ,��Ҫִ�еĺ���,������ÿ�������/�ط�����/����ע��ú���/�ȵ�
    driverSubStep = 1,--����driverSubStep���ڿ���driverStep1Funcָ��ĺ���,��������������ʱ,���е���ע��ü�Һ,
                               --��ʱ:��һ����Ҫ����ע����ٶ�, �ڶ�����Ҫ����ע��÷���

    waitTimeFlag = RESET,--���ڱ�־�Ƿ����ڵȴ���ʱʱ�䵽; ȡֵ0����1; 1(SET)= ��ǰ���ڵȴ���ʱ, 0(RESET)��ʾ�ȴ���ʱ���
    waitTime = 0,--���ڱ�����Ҫ�ȴ���ʱ��

    valcoChannel = 0,--���ڱ�������������ʱ��ʮͨ��ͨ����
    valveOperate , --����ָʾ�ط����ǿ���
                                      --valveIdTab ����16�����Ƿ�ѡ��
    valveIdTab = {[1] = 0,[2] = 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0,[7] = 0,[8] = 0, [9] = 0, [10] = 0,[11] = 0,[12] = 0,[13]= 0,[14]= 0,[15]= 0,[16]= 0},

    injectId = 1,--ȡֵ1����2 ��ʾע���1����ע���2
    injectSpeed = 0,
    injectScale = 0,
    injectCurrentSpd = 0,

    peristalticId = 1,--ȡֵ1/2/3
    peristalticSpeed = 0,
    peristalticVolume = 0,
    peristalticDir = "";
    peristalticCurrentSpd = 0,
    peristalticCurrentDir = 0,

    dispelTemp,--�����¶�
    dispelTime,--����ʱ��
    dispelEmptyTemp,--�����ſ��¶�

    signalTab = {},--���ڱ����������ĵ�λ�ź�
    signalCount = 0,--����ͳ�Ƶ�ǰ�źŸ���
    signalE1 = 0,--���ڱ����ź�E1��ֵ
    signalE2 = 0,--���ڱ����ź�E2��ֵ
    signalDrift = 0,--�ź�Ư��
    signalMinTime = 0,--��ȡ�ź���Сʱ��
    signalMaxTime = 0,--��ȡ�ź����ʱ��
    signalNumber = 0,--ȡ������Ĭ��Ϊ10

    calculateWay = "",--���㷽ʽ: ȡ���� ���� ȡ��ֵ ��ʽ
    calculateType = "",--�������ͣ��з�����У��һ��У������У������У���ġ�
    calibrationValue = 0,--У��ֵ
    caliE1 = {},--���ڱ���У��ʱ��E1
    caliE2 = {},--���ڱ���У��ʱ��E2
    caliValue = {},--���ڱ���У��Ũ��ֵ
    result = 0,--����һ���������к�õ��Ľ��,�ý�������Ƿ������/У�����/...

    hand_control_func = nil;

    alarmContent = "",--���ڱ��浱ǰ������Ϣ
    logContent = "",--���ڱ��浱ǰ��־��Ϣ


    ssid = 0,
    wifi_connect = 0,
    binIndex = 0,--��������������ʱ,�������ݰ�λ��
}



--[[-----------------------------------------------------------------------------------------------------------------
    ��ں���
--------------------------------------------------------------------------------------------------------------------]]


--***********************************************************************************************
--��ʼ������,ϵͳ����LUA�ű����������ôλص�����
--***********************************************************************************************
function on_init()
    print(_VERSION);
    set_text(SYSTEM_INFO_SCREEN, TouchScreenHardVerId, "190311");--��ʾ������Ӳ���汾��
    set_text(SYSTEM_INFO_SCREEN, TouchScreenSoftVerId, "19121015");--��ʾ����������汾��

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
    
    ReadProcessFile();--������������1����/���п��ƽ���/�������ý����еĲ�������
    if record_get_count(SYSTEM_INFO_SCREEN,6) == 0 then --��ʾ��δ���ó�ʼ����
        record_add(SYSTEM_INFO_SCREEN, pwdRecordId, "171717");--��άԱ�����Ա��Ĭ�����붼��171717
        record_add(SYSTEM_INFO_SCREEN, pwdRecordId, "171717");--��άԱ�����Ա��Ĭ�����붼��171717
    end
    set_unit();--���õ�λ
    uart_set_baudrate(tonumber(get_text(IN_OUT_SCREEN, IOSET_ScreenBaudId)) );--���ñ������ڲ�����
 --   Sys.hand_control_func = sys_init;--�������Ƚ��г�ʼ������
 --   Sys.hand_control_func = UpdataDriverBoard;--������ȡ�����ļ�(����ʱʹ�õĴ���)
    SetSysUser(SysUser[Sys.language].maintainer);   --����֮��Ĭ��Ϊ��άԱ(����ʱʹ�õĴ���)
 --   SetSysUser(SysUser[Sys.language].operator);  --����֮��Ĭ��Ϊ����Ա
    uart_set_timeout(2000,1); --���ô��ڳ�ʱ, �����ܳ�ʱ2000ms, �ֽڼ����ʱ1ms
    start_timer(0, 100, 1, 0) --������ʱ�� 0����ʱʱ�� 100ms,1->ʹ�õ���ʱ��ʽ,0->��ʾ�����ظ�
end

--***********************************************************************************************
--��ʱ����ʱ��ִ�д˻ص�����,��ʱ����� 0~2
--��ʱ��0: 1ms��ʱ�ж�, ������غ�����Ҫ�����ڸö�ʱ������
--��ʱ��1: 3ms��ʱ�ж�, ��Ҫ�����жϴ������ݻظ��Ƿ�ʱ
--��ʱ��2: ���ڶ�ȡE1/E2�ź�ʱ�ĳ�ʱ�ж�; �������̿����еĳ�ʱ�ж�
--***********************************************************************************************
function on_timer(timer_id)
    if  timer_id == 0 then --��ʱ��0,��ʱʱ�䵽
        if Sys.status == WorkStatus[Sys.language].run then--����
            excute_process();
        elseif Sys.hand_control_func ~= nil then
            Sys.hand_control_func();
        end
    elseif timer_id == 1 then--���ڳ�ʱ
        uart_time_out();
    elseif timer_id == 2 then--�ȴ�ʱ�����
        Sys.waitTimeFlag = RESET ;
    end
end

 

--***********************************************************************************************
--��ʱ�ص�������ϵͳÿ��1�����Զ����á�
--***********************************************************************************************
function on_systick()
    Sys.dateTime.year,Sys.dateTime.mon,Sys.dateTime.day,
    Sys.dateTime.hour,Sys.dateTime.min,Sys.dateTime.sec = get_date_time();--��ȡ��ǰʱ��
    
    if Sys.status == WorkStatus[Sys.language].readyRun then           --��ϵͳ���ڴ���״̬ʱ,
        process_ready_run();
    end

    --�ж�wifi����״̬
    if string.len(Sys.ssid) > 0 then
        Sys.wifi_connect = get_network_state() --��ȡ����״̬
        wifimode,secumode,ssid,password = get_wifi_cfg() --��ȡWIFI����
        local dhcp, ipaddr, netmask, gateway, dns = get_network_cfg() --��ȡip��ַ
        if Sys.wifi_connect ~= 0 then
            set_text(WIFI_CONNECT_SCREEN, WifiStatusTextId, TipsTab[Sys.language].connected);
            set_text(WIFI_CONNECT_SCREEN, WifiSsid, ssid);
            set_text(WIFI_CONNECT_SCREEN, WifiIpAddrId, ipaddr);
        end
    else
        set_text(WIFI_CONNECT_SCREEN, WifiStatusTextId, TipsTab[Sys.language].unconnected);
    end

    --�жϴ��������½���
    local state,process = get_upgrade_state()                    --��ȡ����״̬�����      
    set_value(REMOTE_UPDATE_SCREEN, RemoteUpdateTsStaId, state)  --����״̬��ʾ
end

--***********************************************************************************************
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--***********************************************************************************************
function on_control_notify(screen,control,value)
    if screen == MAIN_SCREEN then--��ҳ
        main_control_notify(screen,control,value);
    elseif screen == RUN_CONTROL_SCREEN then --���п��ƽ���
		run_control_notify(screen,control,value);
	elseif screen == PROCESS_SELECT_SCREEN then --����ѡ�����
		process_select_control_notify(screen,control,value);
	elseif screen == PROCESS_SELECT2_SCREEN then--����ѡ��2����
		process_select2_control_notify(screen,control,value);	
	elseif screen == PROCESS_SET1_SCREEN then --��������1����
		process_set1_control_notify(screen,control,value);
	elseif screen == PROCESS_SET2_SCREEN then --��������2����
		process_set2_control_notify(screen,control,value);
    elseif screen == PROCESS_SET3_SCREEN then --��������3����
		process_set3_control_notify(screen,control,value);
	elseif screen == RANGE_SELECT_SCREEN then --����ѡ�����
		range_select_control_notify(screen,control,value);
	elseif screen == ACTION_SELECT_SCREEN then--����ѡ�����
		action_select_control_notify(screen,control,value);
	elseif screen == PROCESS_INIT_SCREEN then--��������-��ʼ����
		process_init_control_notify(screen,control,value);
	elseif screen == PROCESS_INJECT_SCREEN	then--��������-ȡ������
		process_inject_control_notify(screen,control,value);
	elseif screen == PROCESS_INJECT_ADD_SCREEN	then--��������-ע��ü�Һ
		process_inject_add_control_notify(screen,control,value);
	elseif screen == PROCESS_PERISTALTIC_SCREEN	then--��������-�䶯�ü�Һ
		process_peristaltic_control_notify(screen,control,value);
	elseif screen == PROCESS_DISPEL_SCREEN then--��������-����
		process_dispel_control_notify(screen,control,value);
    elseif screen == PROCESS_READ_SIGNAL_SCREEN then--��������-��ȡ�ź�
		process_read_signal_control_notify(screen,control,value);
    elseif screen == PROCESS_CALCULATE_SCREEN then--��������-����
		process_calculate_control_notify(screen,control,value);	
    elseif screen == PROCESS_VALVE_CTRL_SCREEN then--��������-������
		process_valve_ctrl_control_notify(screen,control,value);
    elseif screen == PROCESS_WAIT_TIME_SCREEN then--��������-�ȴ�ʱ��
        process_wait_time_control_notify(screen,control,value);
    elseif screen == RANGE_SET_SCREEN then --��������
        range_set_control_notify(screen,control,value);	
    elseif screen == HAND_OPERATE1_SCREEN then --�ֶ�����1
        hand_operate1_control_notify(screen,control,value);	
    elseif screen == HAND_OPERATE2_SCREEN then --�ֶ�����2
        hand_operate2_control_notify(screen,control,value);	
    elseif screen == IN_OUT_SCREEN then--�����������
        in_out_control_notify(screen,control,value);
	elseif screen == SYSTEM_INFO_SCREEN then --ϵͳ��Ϣ����
		system_info_control_notify(screen,control,value);	
    elseif screen == LOGIN_SYSTEM_SCREEN then--��¼ϵͳ����
		login_system_control_notify(screen,control,value);	
	elseif screen == PASSWORD_SET_SCREEN then--�������ý���
        password_set_control_notify(screen,control,value);	
    elseif screen == WIFI_CONNECT_SCREEN then--Wifi���ý���
        wifi_connect_control_notify(screen,control,value);		
    elseif screen == REMOTE_UPDATE_SCREEN then
        remote_update_control_notify(screen,control,value);
    end
    
    
end

--***********************************************************************************************
--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
--***********************************************************************************************
function on_screen_change(screen)
    if screen == PROCESS_SET1_SCREEN then--��������1
        goto_ProcessSet1();
    elseif screen == PROCESS_SET2_SCREEN then --��������2
        goto_ProcessSet2();
    elseif screen == PROCESS_SET3_SCREEN then --��������3
        goto_ProcessSet3();
    elseif(screen == RANGE_SELECT_SCREEN) then --��ת������ѡ��
		goto_range_select();
	elseif screen== PROCESS_SELECT2_SCREEN then --��ת������ѡ��2
		goto_ProcessSelect2();
	elseif screen== LOGIN_SYSTEM_SCREEN then--��¼ϵͳ
		goto_LoginSystem();
	elseif screen== PASSWORD_SET_SCREEN then--��������
        goto_PasswordSet();
    elseif screen== WIFI_CONNECT_SCREEN then--��������
        goto_WifiConnect();
	end
end

--***********************************************************************************************
--���� U �̺�ִ�д˻ص�����
--***********************************************************************************************
function on_usb_inserted(dir)
    ShowSysTips(TipsTab[Sys.language].insertUsb);
    UsbPath = dir;
end

--***********************************************************************************************
--�γ� U �̺�ִ�д˻ص�����
--***********************************************************************************************
function on_usb_removed()
    ShowSysTips(TipsTab[Sys.language].pullOutUSB);
end

--***********************************************************************************************
--���� SD ����ִ�д˻ص�����
--***********************************************************************************************
function on_sd_inserted(dir)
    ShowSysTips(TipsTab[Sys.language].insertSd);
    SdPath = dir;
end

--***********************************************************************************************
--�γ� SD ����ִ�д˻ص�����
--***********************************************************************************************
function on_sd_removed()
    ShowSysTips(TipsTab[Sys.language].pullOutUSB);
end


--[[-----------------------------------------------------------------------------------------------------------------
    ���̿��ƺ���
--------------------------------------------------------------------------------------------------------------------]]
--***********************************************************************************************
--ϵͳ��ʼ��, һ���ڿ������߼�ͣʱ���øú���
--***********************************************************************************************
function sys_init()
    local softVer1,softVer2,hardVer1,hardVer2;

    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then
        return;
    end

    if Sys.processStep == 1 then--��һ��: �رշ�11
        set_enable(RUN_CONTROL_SCREEN, RunStopButtonId, DISABLE)--ϵͳ��ʼ��ʱ����ֹ����ʼ��ť
        close_single_valve(11);
        Sys.processStep = Sys.processStep + 1;
        ShowSysCurrentAction(TipsTab[Sys.language].sysInit);
    elseif Sys.processStep == 2 then --�ڶ���:�رշ�12
        close_single_valve(12);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then --������:ʹ��ע���1
        enable_inject1();
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 4 then --���Ĳ�:��λע���
        start_wait_time(5);
        reset_inject1();
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 5 then--���岽����ȡ������汾��
        on_uart_send_data(uartSendTab.getDrvVer ,NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 6 then--����������ʾ�����汾�汾�� �� ��ȡ���а�����㿨Ӳ���汾��
        if UartArg.reply_sta == SEND_OK then
            softVer1 = bcd_to_string(UartArg.recv_data[10]).."."..bcd_to_string(UartArg.recv_data[11]); 
            hardVer1 = bcd_to_string(UartArg.recv_data[12]).."."..bcd_to_string(UartArg.recv_data[13]);
            set_text(SYSTEM_INFO_SCREEN, DriverBoardSoftVerId,softVer1);--��ʾ����汾��
            set_text(SYSTEM_INFO_SCREEN, DriverBoardHardVerId,hardVer1);--��ʾӲ���汾��
        end
        on_uart_send_data(uartSendTab.getSCHardVer, NEED_REPLY);--��ȡ���а�����㿨Ӳ���汾��
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 7 then--���߲�����ʾ���а�����㿨Ӳ���汾�� �� ��ȡ���а�����㿨����汾��
        if UartArg.reply_sta == SEND_OK then
            hardVer1 = bcd_to_string(UartArg.recv_data[3])..bcd_to_string(UartArg.recv_data[4]);
            set_text(SYSTEM_INFO_SCREEN, SensorBoardHardVerId, hardVer1);
            hardVer1 = bcd_to_string(UartArg.recv_data[5])..bcd_to_string(UartArg.recv_data[6]);
            hardVer2 = bcd_to_string(UartArg.recv_data[7])..bcd_to_string(UartArg.recv_data[8]);
            set_text(SYSTEM_INFO_SCREEN, CalcBoardHardVerId, hardVer1..hardVer2);
        end
        on_uart_send_data(uartSendTab.getSCSoftVer, NEED_REPLY);--��ȡ���а�����㿨����汾��
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 8 then--�ڰ˲�����ʾ�а�����㿨����汾��
        if UartArg.reply_sta == SEND_OK then
            softVer1 = bcd_to_string(UartArg.recv_data[3])..bcd_to_string(UartArg.recv_data[4]); 
            set_text(SYSTEM_INFO_SCREEN, SensorBoardSoftVerId, softVer1);
            softVer1 = bcd_to_string(UartArg.recv_data[5])..bcd_to_string(UartArg.recv_data[6]);
            softVer2 = bcd_to_string(UartArg.recv_data[7])..bcd_to_string(UartArg.recv_data[8]);
            set_text(SYSTEM_INFO_SCREEN, CalcBoardSoftVerId, softVer1..softVer2);
        end
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 9 then --�ھŲ�:��ʼ������
        set_enable(RUN_CONTROL_SCREEN, RunStopButtonId, ENABLE)--��ʼ����ɣ�ʹ�ܿ�ʼ��ť
        ShowSysCurrentAction(TipsTab[Sys.language].null);
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    �����շ�
--------------------------------------------------------------------------------------------------------------------]]

--����ȫ�ֱ���uart_free_protocol��ʹ�����ɴ���Э��
uart_free_protocol = 1;

uartSendTab = {
  getSCSoftVer = {[0] = 0xEE, 0x03, 0x10, 0x03, 0x00, 0x03, 0x00, 0x00, len = 6, note = "��ȡ����汾" },
  getSCHardVer = {[0] = 0xEE, 0x03, 0x10, 0x02, 0x00, 0x03, 0x00, 0x00, len = 6, note = "��ȡӲ���汾" },
    getTemp    = {[0] = 0xEE, 0x03, 0x10, 0x0A, 0x00, 0x01, 0x00, 0x00, len = 6, note = "�������¶�" },
    getVoltage = {[0] = 0xEE, 0x03, 0x10, 0x0C, 0x00, 0x01, 0x00, 0x00, len = 6, note = "���ܵ�ѹ"},
 setLedCurrnet = {[0] = 0xEE, 0x03, 0x10, 0x0D, 0x00, 0x01, 0x00, 0x00, len = 6, note = "����LED����"},
    openLed    = {[0] = 0xEE, 0x06, 0x10, 0x0E, 0x00, 0x01, 0x00, 0x00, len = 6, note = "��LED��" },
    closeLed   = {[0] = 0xEE, 0x06, 0x10, 0x0E, 0x00, 0x00, 0x00, 0x00, len = 6, note = "��LED��" },
updateCalcSoft = {[0] = 0xEE, 0x06, 0x10, 0x04, 0x00, 0x00, 0x00, 0x00, len = 6, note = "���¼����"},
    getDrvVer  = {[0] = 0xE0, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "�����汾��"},
    openValco  = {[0] = 0xE0, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "ʮͨ��"},--��ʮͨ��
    openV11    = {[0] = 0xE0, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "����11"},
    closeV11   = {[0] = 0xE0, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "�ط�11"},
    openV12    = {[0] = 0xE0, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "����12"},
    closeV12   = {[0] = 0xE0, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "�ط�12"},
    enInject1  = {[0] = 0xE0, 0x0F, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "ʹ��ע���"},
   mvInject1To = {[0] = 0xE0, 0x0D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "�ƶ�ע���"},
 setInject1Spd = {[0] = 0xE0, 0x0E, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "����ע����ٶ�"},
    rstInject1 = {[0] = 0xE0, 0x0D, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "��λע���"},
    updateDrv  = { },--�ñ�����������������
}



UartArg = {
    repeat_times = 0,--���ڼ�¼�ط�����
    repeat_data ,--���ڱ��汾���ط�����
    note = "",--���ڱ��洮��ָ��˵��
    recv_data,--���ڱ�����յ�������
    reply_data = {[0] = 0, [1] = 0},--���ڱ�����Ҫ���ܵ��Ļظ�����
    reply_sta = SEND_OK;--����ָʾ���͵Ĵ���ָ���Ƿ�����ȷ�ظ�
    lock = UNLOCKED,--����ָʾ�����Ƿ�����, ������һ����Ҫ�ȴ��ظ��Ĵ���ָ��ʱ,��������, ���յ��ظ�ʱ,���ڽ���
};


--***********************************************************************************************
--���ڽ��ܺ��� 
--���ڲ�����Ϊ38400, ����1bit��Ҫ 1000000/38400 = 26us, ����һ���ֽڵ�������Ҫ10bit,����1Byte������Ҫ260us
--***********************************************************************************************
function on_uart_recv_data(packet)

    local rev_len = 0;

    --��ȡ���ݳ���
    for i=0,50,1 do
        rev_len = i;
        if packet[i] == nil then
            break;
        end
    end

    --�����ܵ������ݱ��浽ȫ�ֱ���
    UartArg.recv_data = packet;

    --�ж��Ƿ�Ϊָ�����ݻظ�
    if packet[0] == UartArg.reply_data[0] and packet[1] == UartArg.reply_data[1] then
        UartArg.repeat_times = 0;--�ط�������0
        UartArg.reply_sta = SEND_OK;
        UartArg.lock = UNLOCKED;
        stop_timer(1)--ֹͣ��ʱ��ʱ��
    end
    
    --���ͨ�ż�¼
    local UartDateTime =  string.format("%02d-%02d %02d:%02d",Sys.dateTime.mon,Sys.dateTime.day,Sys.dateTime.hour,Sys.dateTime.min);
    local UartData = "";--����Ҫ���͵����ݱ��浽���ַ�����
    for i=0, rev_len-1, 1 do
        UartData = UartData..string.format("%02x ", packet[i]);
    end
    record_add(HAND_OPERATE4_SCREEN, UartRecordId, "RX;"..UartDateTime..";"..UartData..";"..TipsTab[Sys.language].reply);
end

--***********************************************************************************************
--���ʹ�������
--packet : ȡֵΪuartSendTab�еĲ���, ����uartSendTab.openV11
--reply : ��ʾ�Ƿ���Ҫ�ȴ��ظ�,ȡֵ NEED_REPLY  �� NO_NEED_REPLY
--***********************************************************************************************
function on_uart_send_data(packet, reply)
    if UartArg.lock == LOCKED then
        return;
    end

    if reply == NEED_REPLY then --��ʾ��Ҫ�ȴ��ظ�
        start_timer(1, 3000, 1, 0); --������ʱ��1����ʱʱ�� 3s, 1->ʹ�õ���ʱ��ʽ,0->��ʾ�����ظ�
        UartArg.lock = LOCKED;      --����������, �յ��ظ����Զ�����
        UartArg.repeat_data = packet;--�����ط�����
        UartArg.reply_data[0] = packet[0];--���ûظ�����,�����ж��Ƿ�ɹ����ܵ��ظ�
        UartArg.reply_data[1] = packet[1];
    end
    
    packet[packet.len], packet[packet.len+1] = CalculateCRC16(packet, packet.len);--����crc16
    UartArg.reply_sta = SEND_FAIL;
    uart_send_data(packet) --������ͨ�����ڷ��ͳ�ȥ

    UartArg.note = packet.note;--�ڱ��洮�ڻظ���ʱ����־ʱ����Ҫ�õ�UartArg.note

    --���´��빦��: ÿ����һ������,�ͽ������ݱ������ֶ�����4�Ĵ����շ���¼����,����Ӵ������鿴.
    local UartDateTime =  string.format("%02d-%02d %02d:%02d",Sys.dateTime.mon,Sys.dateTime.day,Sys.dateTime.hour,Sys.dateTime.min);
    local UartData = "";--����Ҫ���͵����ݱ��浽���ַ�����
    --�ж�Ϊ��������,ֻ����ǰ6�ֽ�������ֽڵ�CRC
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
    record_add(HAND_OPERATE4_SCREEN, UartRecordId, "TX;"..UartDateTime..";"..UartData..";"..packet.note);--���ͨ�ż�¼
    print(packet.note);--�������,������Զ˵���ʱ�鿴�����շ�����
end



--***********************************************************************************************
--���뵽�ú�����ʾ����һ���ظ���ʱ, ��Ϊ����ظ��ɹ�, ��on_uart_recv_data�����оͻ�ֹͣ��ʱ��1,�Ͳ�����뵽�ú���
--***********************************************************************************************
function uart_time_out()
    UartArg.repeat_times = UartArg.repeat_times + 1;
    if UartArg.repeat_times < 3 then
        UartArg.lock = UNLOCKED;
        on_uart_send_data(UartArg.repeat_data, NEED_REPLY);--�����ط�
    else  --�ط�2�ζ�û�лظ�,�����ط�
        print("���ڽ��ܳ�ʱ");
        --�ж�Ϊ��������������,��ʱ����ʧ��
        if UartArg.repeat_data[0] == 0xD0 and UartArg.repeat_data[1] == 0x10 and UartArg.repeat_data[2] == 0x30 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].updateFail)
            Sys.hand_control_func = nil;
        end
        UartArg.repeat_times = 0;
        --��ʱ���ϵͳ����������,����ס����,���ټ�������ִ��,�ڰ�ֹͣ����������; ������ֶ��������ʹ���ָ��,���������
        if Sys.status == WorkStatus[Sys.language].run then
            UartArg.lock = LOCKED;
        else
           UartArg.lock = UNLOCKED;
        end
        stop_timer(1)--ֹͣ��ʱ��ʱ��
        beep(1000);--���ڻظ���ʱ����������1���ӡ�
        Sys.alarmContent = UartArg.note..SysLog[Sys.language].uartTimeOut;--��ʼ���������ݣ����ڻظ���ʱ��
        add_history_record(HISTORY_ALARM_SCREEN);--��¼��������
        ShowSysAlarm(Sys.alarmContent);--�ڵײ�״̬����ʾ������Ϣ
    end
end

--***********************************************************************************************
--����һλ�Ĳ���,�ڼ���У������ʹ��
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
--������,�ڼ���У������ʹ��
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
--����У����: ModeBusCRC16
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
    ��ҳ
--------------------------------------------------------------------------------------------------------------------]]

LastResultTimeId = 20;   --����ʱ��
LastAnalyteId = 17;        --������
LastResultId = 18; --�������
LastResultUnitId = 19;   --��λ
LastResultE1Id = 25;     --E1
LastResultE2Id = 26;     --E2
NextProcessTimeTextId = 2  --�´�����ʱ��

ProgressBarId = 14--����������Χ0-100

SysWorkStatusId = 901;   --����״̬
SysCurrentActionId = 902;--��ǰ����
SysUserNameId = 903      --��ʾ�û�
SysAlarmId = 904;        --��ʾ��ǰ�澯��Ϣ
SysTipsId = 905;         --����ײ�������ʾ��ʾ��Ϣ���ı�id


function main_control_notify(screen,control,value)

end


--***********************************************************************************************
--���ڵ�����ʾ,��tips״̬��
--name : ��������
--***********************************************************************************************
function printf(text)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysTipsId, text);
    end
end

--***********************************************************************************************
--  �ڵײ���״̬����ʾ��ʾ��Ϣ
--***********************************************************************************************
function ShowSysTips(tips)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysTipsId, tips);
    end
end

--***********************************************************************************************
--  ���ù���״̬
--***********************************************************************************************
function SetSysWorkStatus(status)
    Sys.status = status;--����ϵͳ״̬Ϊ����
    --�ڵײ���״̬����ʾ����״̬:ֹͣ/����/����
    for i = 1,16,1 do
        set_text(PublicTab[i], SysWorkStatusId, status);
        if status == WorkStatus[Sys.language].stop or status == WorkStatus[Sys.language].readyRun then
            set_text(PublicTab[i], SysCurrentActionId, TipsTab[Sys.language].null);
        end
    end
end

--***********************************************************************************************
--  �ڵײ���״̬����ʾ��ǰ����
--***********************************************************************************************
function ShowSysCurrentAction(action)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysCurrentActionId, action);
    end
end


--***********************************************************************************************
--  �ڵײ���״̬����ʾ�澯��Ϣ
--***********************************************************************************************
function ShowSysAlarm(alarm)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysAlarmId, alarm);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��/ע���/�䶯�ÿ���
--------------------------------------------------------------------------------------------------------------------]]


--***********************************************************************************************
--���Ƶ������ر�
--valveId ��id
--***********************************************************************************************
function close_single_valve(valveId)
    if valveId == 11 then
        on_uart_send_data(uartSendTab.closeV11, NEED_REPLY);
    elseif valveId == 12 then
        on_uart_send_data(uartSendTab.closeV12, NEED_REPLY);
    end
end

--***********************************************************************************************
--���Ƶ�������
--***********************************************************************************************
function open_single_valve(valveId)
    if valveId == 11 then
        on_uart_send_data(uartSendTab.openV11, NEED_REPLY);
    elseif valveId == 12 then
        on_uart_send_data(uartSendTab.openV12, NEED_REPLY);
    end
end


--***********************************************************************************************
--���ƶ�����򿪻��߹ر�, �ں�������������ʱ����,������˷���������ע��ü�Һʱ,���ܻ���øú���(��������������,����ͬʱ���������)
--Sys.valveIdTab �б����16��������Ҫ���йرջ��Ǵ򿪲���
--Sys.valveOperate ��¼����Ҫ�򿪻��ǹر�
--***********************************************************************************************
function control_multi_valve()
    if UartArg.lock == LOCKED then
        return;
    end

    for i = 1, 16, 1 do
        if Sys.valveIdTab[i] == ENABLE_STRING then--��Ҫ���в���
            Sys.valveIdTab[i] = DISABLE_STRING;
            if Sys.valveOperate == ValveStatus[Sys.language].open then
                open_single_valve(i);--�������˳�����
            else
                close_single_valve(i);--�ط����˳�����
            end
            break;--����forѭ��
        end
        if i == 16 then--���в��������
            Sys.driverSubStep = FINISHED;
        end
    end
end

--***********************************************************************************************
--����ʮͨ��
--channel:ͨ���ţ�ȡֵ0-9
--***********************************************************************************************
function control_valco(channel)
    uartSendTab.openValco[2] = channel;
    uartSendTab.openValco.note = "��ʮͨ��"..channel;
    on_uart_send_data(uartSendTab.openValco, NEED_REPLY);
end

--***********************************************************************************************
--ʹ��ע���
--***********************************************************************************************
function enable_inject1(void)
    on_uart_send_data(uartSendTab.enInject1, NEED_REPLY);
end

--***********************************************************************************************
--��λע���
--***********************************************************************************************
function reset_inject1(void)
    on_uart_send_data(uartSendTab.rstInject1, NEED_REPLY);
end

--***********************************************************************************************
--����ע����ٶ�
--speed:ע����ٶ�,ȡֵ0-27
--***********************************************************************************************
function set_inject1_speed(speed)
    uartSendTab.setInject1Spd[2] = speed;
    on_uart_send_data(uartSendTab.setInject1Spd, NEED_REPLY);
end

--***********************************************************************************************
--�ƶ�ע��õ�ָ��λ��
--scale��ע����ƶ����Ŀ̶ȣ����ֵ45
--***********************************************************************************************
function move_inject1_to(scale)
    uartSendTab.mvInject1To[4] = scale;
    on_uart_send_data(uartSendTab.mvInject1To, NEED_REPLY);
end

--***********************************************************************************************
--����ע���
--Sys.driverSubStep ���ڿ���ִ����һ�δ����
--Sys.injectId ������������Ҫ������ע���
--Sys.injectSpeed ������������Ҫ�����ٶ�
--Sys.injectScale ������������Ҫ��ע����ƶ���ʲô�̶�
--***********************************************************************************************
function control_inject1()
    -----------------����ע����ٶ�------------------------------
    if Sys.driverSubStep == 1 then
        if Sys.injectCurrentSpd == Sys.injectSpeed then --���õ��ٶ��뵱ǰ�ٶ����, ����Ҫ�ظ�����
            Sys.driverSubStep = 3;
        else
            set_inject1_speed(Sys.injectSpeed);--���������ٶȵĴ���ָ��
            Sys.driverSubStep = Sys.driverSubStep + 1;
        end
    elseif Sys.driverSubStep == 2 then--�ȴ����ڻظ�
        if UartArg.lock == UNLOCKED then
            Sys.injectCurrentSpd = Sys.injectSpeed;
            Sys.driverSubStep = Sys.driverSubStep + 1;
        end
    -----------------��ע����ƶ���ָ��λ��------------------------
    elseif Sys.driverSubStep == 3 then
            move_inject1_to(Sys.injectScale)--��ע����ƶ���ָ����λ��
            Sys.driverSubStep = Sys.driverSubStep + 1;
    elseif Sys.driverSubStep == 4 then--�ȴ����ڻظ�
        if UartArg.lock == UNLOCKED then
            Sys.driverSubStep = FINISHED;
        end
    end
end


--***********************************************************************************************
--�����䶯��(ĿǰӲ����δ���䶯��)   ##������##
--Sys.peristalticSpeed  ��������Ҫ���õ��ٶ�
--Sys.peristalticDir    ��������Ҫ���õķ���
--Sys.peristalticVolume ��������Ҫ��ȡ�����
--***********************************************************************************************
function control_peristaltic()
    -----------------�����䶯���ٶ�------------------------------
    if Sys.driverSubStep == 1 then
        if Sys.peristalticCurrentSpd == Sys.peristalticSpeed then --���õ��ٶ��뵱ǰ�ٶ����, ����Ҫ�ظ�����
            Sys.driverSubStep = Sys.driverSubStep + 2;
        else
            --���������ٶȵĴ���ָ��
            Sys.driverSubStep = Sys.driverSubStep + 1;
        end
    elseif Sys.driverSubStep == 2 then--�ȴ����ڻظ�
        if UartArg.lock == UNLOCKED then
            Sys.peristalticCurrentSpd = Sys.peristalticSpeed;
            Sys.driverSubStep = Sys.driverSubStep + 1;
        end
    -----------------�����䶯�÷���------------------------
    elseif Sys.driverSubStep == 3 then
            if Sys.peristalticCurrentDir == Sys.peristalticDir then--���õķ����뵱ǰ������ͬ, ����Ҫ�ظ�����
                Sys.driverSubStep = Sys.driverSubStep + 2;
            else
                
                Sys.driverSubStep = Sys.driverSubStep + 1;
            end
    elseif Sys.driverSubStep == 4 then--�ȴ����ڻظ�
        if UartArg.lock == UNLOCKED then
            Sys.peristalticCurrentDir = Sys.peristalticDir;
            Sys.driverSubStep = Sys.driverSubStep + 1;
        end
    -----------------�����䶯�ó�ȡָ�������Һ��------------
    elseif Sys.driverSubStep == 5 then
        Sys.driverSubStep = Sys.driverSubStep + 1;
    elseif Sys.driverSubStep == 6 then--�ȴ����ڻظ�
        if UartArg.lock == UNLOCKED then
            Sys.driverSubStep = FINISHED;
        end
    end
end


--***********************************************************************************************
--��ʼ�ȴ�ʱ��
--time_s
--***********************************************************************************************
function start_wait_time(time_s)
    if time_s == 0 then
        return;
    end
    Sys.waitTimeFlag = SET;
    start_timer(2, time_s * 1000, 1, 1); --������ʱ��2����ʱʱ�� wait_time, 1->ʹ�õ���ʱ��ʽ,1->��ʾִֻ��һ��
end


--***********************************************************************************************
--��tableʵ���˷��ʹ���ָ��->�ȴ��ظ�->��ת����һ��   �����̿��
--***********************************************************************************************
driver = {
    [1] = function()
        if UartArg.lock == UNLOCKED then--���ʹ���ָ��
            Sys.driverStep1Func();
            if Sys.driverSubStep == FINISHED then
                Sys.driverSubStep = 1;
                Sys.driverStep = Sys.driverStep + 1;
            end
        end
    end,
    [2] = function()
        if UartArg.lock == UNLOCKED then--�ȴ����ڻظ��ɹ�
            Sys.driverStep = Sys.driverStep + 1;
        end
    end,
    [3] = function()                     --������ʱ��
        if Sys.waitTime ~= 0 then
            start_wait_time(Sys.waitTime);
            Sys.driverStep = Sys.driverStep + 1;
        else
            Sys.driverStep = 5;--��� (����ȴ�)
        end
    end,
    [4] = function()
        if Sys.waitTimeFlag == RESET then--�ȴ���ʱ���
            Sys.driverStep = 5;--���
        end
    end,
    [5] = function()
        Sys.driverStep = 1;
        Sys.actionSubStep = Sys.actionSubStep + 1;--���δ���ָ��ִ�����,����ִ����һ������
    end,
}


--[[-----------------------------------------------------------------------------------------------------------------
    ���п���
--------------------------------------------------------------------------------------------------------------------]]


--����������صİ�ťid��101 - 129, ����101Ϊ�������̵�һ��, id129Ϊ�ֶ�����
RUNCTRL_TextStartId = 1;
RUNCTRL_TextEndId = 85;

RunTypeID = 30;--���з�ʽ��Ӧ���ı��ռ�ID
RunTypeMenuId = 243;--���з�ʽ�˵�
RunStopButtonId = 229;--����״̬�л���ť"��ʼ��""ֹͣ"��ť

TimedProcessClear = 410;--һ��������еĶ�ʱ����


--�ֶ�����
HandProcessTab = {
    --  ������ʾ�������Ƶ��ı�id, ���ı��غϵİ�ťid, �ֶ���������id, �ֶ���������, �������ƶ�Ӧ���������
    [1] = {textId = 29, buttonId = 129, TimesId = 31, times = 0, processId = 0},
};

--��������
PeriodicTab = { [1] = {textId = 1, buttonId = 101, processId = 0}, 
                [2] = {textId = 2, buttonId = 102, processId = 0},
                [3] = {textId = 3, buttonId = 103, processId = 0},
                [4] = {textId = 4, buttonId = 104, processId = 0},
                [5] = {textId = 32, value = 0},--�� ������Ҫע����ѧ��ϵ:   textId - 27 = ���
                [6] = {textId = 33, value = 0},--��
                [7] = {textId = 34, value = 0},--��
                [8] = {textId = 35, value = 0},--ʱ
                [9] = {textId = 36, value = 0},--��
                [10]= {textId = 37, value = 0},--Ƶ��
                nextStartTime = {year=0, mon=0, day=0, hour=0, min=0};
};

--��ʱ����  ����ע��StartHourId - 37 = ���; startMinuteId - 61 = ���
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
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--***********************************************************************************************
function run_control_notify(screen,control,value)
	--control-100��ʾ��ð�ť�غϵ��ı���
	if (control) >= PeriodicTab[1].buttonId  and control <= HandProcessTab[1].buttonId then--�������Ҫѡ�����̵��ı���ʱ
        process_select2_set(screen, control-100);--(control100)��ʾ��ð�ť�غϵ��ı���

    --�����¿�ʼʱ, ��������ϵͳ״̬Ϊ����״̬,��Ϊֻ���ڸ�״̬����get_current_process_id����ֵ������Ҫִ�е��������
    --�õ�������ź�, �Ϳ��Զ�ȡ�Ѹ���������������ļ�,�������ļ������˸����̵����ж���.
    elseif control == RunStopButtonId then
        if get_value(RUN_CONTROL_SCREEN,control) == ENABLE then --��ť����,��ʱϵͳ״̬��Ϊ��������
            SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--����Ϊ����״̬
            process_ready_run();--��ʼ����ǰ��һЩ��ʼ������
        else--��ť�ɿ�,��ʱϵͳ״̬Ӧ��Ϊֹͣ
            SystemStop();
        end
    elseif control == RunTypeMenuId then--�������з�ʽ
        Sys.runType = get_text(RUN_CONTROL_SCREEN, RunTypeID);
        WriteProcessFile(2);
    elseif control == HandProcessTab[1].TimesId then--�����ֶ����д���
        HandProcessTab[1].times = tonumber(get_text(RUN_CONTROL_SCREEN, control));
        WriteProcessFile(2);
    elseif control >= PeriodicTab[5].textId and control <= PeriodicTab[10].textId then --�������ڿ�ʼʱ����Ƶ��
        PeriodicTab[control-27].value = tonumber(get_text(RUN_CONTROL_SCREEN, control));--control-27��,��Ӧ���������̿�ʼʱ����?��?
        WriteProcessFile(2);
    elseif control >= TimedProcessTab[1].startHourId and control <= TimedProcessTab[24].startHourId then--���Ķ�ʱ����ʱ���е�Сʱ
        TimedProcessTab[control-37].startHour = tonumber(get_text(RUN_CONTROL_SCREEN,control));--control-37��,��Ӧ�˶�ʱ���̵����
        WriteProcessFile(2);
    elseif control >= TimedProcessTab[1].startMinuteId and control <= TimedProcessTab[24].startMinuteId then--���Ķ�ʱ����ʱ���еķ���
        TimedProcessTab[control-61].startMinute = tonumber(get_text(RUN_CONTROL_SCREEN,control));--control-61��,��Ӧ�˶�ʱ���̵����
        WriteProcessFile(2);
    elseif control == TimedProcessClear then--һ��������ж�ʱ����
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
--���޸���ĳ������ʱ,���øú���,һ�㰴������ѡ��2�����е�ȷ�ϰ�ť����øú���
--control ���п��ƽ����������ı���id
--***********************************************************************************************
function process_change(control)
    local processId = 0;

    --��������1-12, �ҵ����п��ƽ��������õ���������,����������1�����ж�Ӧ���������
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), get_text(RUN_CONTROL_SCREEN, control), 1) ~= nil then
            --�ҵ���ǰ�����õĵڼ�����������, ���������Ʋ���һ���ո�(������ѡ��2������,�ṩһ��������,����ɾ������)
            if get_text(PROCESS_SELECT2_SCREEN, control) == BLANK_SPACE then
                processId = 0;
            else
                processId = i;
            end
            break;
        end
    end

    --��������id��
    if control == HandProcessTab[1].textId then--�ֶ���������
        HandProcessTab[1].processId = processId;
    elseif control >= PeriodicTab[1].textId and control <= PeriodicTab[4].textId then--��������
        for i=1,4,1 do
            if control == PeriodicTab[i].textId  then
                PeriodicTab[i].processId = processId;
            end
        end
    elseif control >= TimedProcessTab[1].textId and control <= TimedProcessTab[24].textId then--��ʱ����
        for i=1,24,1 do
            if control == TimedProcessTab[i].textId  then --�ҵ���ǰ���õ��Ƕ�ʱ�����е��ĸ�
                TimedProcessTab[i].processId = processId;
            end
        end
    end
end



--***********************************************************************************************
--�ж��Ƿ�����
--����1��ʾ����, ����0��ʾƽ��
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
--���ݼ��ϵ�����,�����µĿ�ʼ����
--diffDays:��Ҫ���ϵ�����
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
    while math.modf(diffDays/daysAyear) >= 1 do -- ����365�����366��
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
--����Ƶ��������һ�ο�ʼ��ʱ��, ���Զ�ģʽ��, ����һ�����̺����øú��������´����̿�ʼʱ��.
--minFreq: ����
--***********************************************************************************************
function set_period_start_date_time(minFreq)
    local dayHour = 1440;--24 * 60 һ���ж��ٷ���
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
    
    --��ʾ�´��Զ������������̵�ʱ��
    set_text(MAIN_SCREEN,NextProcessTimeTextId,string.format("%d-%02d-%02d  %02d:%02d",
             PeriodicTab.nextStartTime.year,PeriodicTab.nextStartTime.mon,PeriodicTab.nextStartTime.day,
             PeriodicTab.nextStartTime.hour,PeriodicTab.nextStartTime.min));
    WriteProcessFile(2);
end

--***********************************************************************************************
--����ǰʱ������Ϊ�������̿�ʼʱ��
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
--�������ʼ��ťʱ,���øú���ִ��??��
--***********************************************************************************************
function get_current_process_id()
    local processId = 0;
    if Sys.status == WorkStatus[Sys.language].run then--��ǰ״̬Ϊ����,ֱ�ӷ���; ���Ϊֹͣ���ߴ������������ִ��.
        return Sys.currentProcessId;
    end

    --------------------------�ֶ�ģʽ ,����Ƚϼ�,ֻ��һ�����̿�����--------------------------------
    if Sys.runType == WorkType[Sys.language].hand then 
        processId = HandProcessTab[1].processId;
    ----------------------�Զ�ģʽ  �Զ�ģʽ�еĶ�ʱʱ�����˻�ֱ������������--------------------------
    elseif Sys.runType == WorkType[Sys.language].auto then 

        local currentDateTime =  string.format("%d%02d%02d%02d%02d",
                                          Sys.dateTime.year, Sys.dateTime.mon,Sys.dateTime.day,
                                          Sys.dateTime.hour, Sys.dateTime.min);

        Sys.periodStartDateTime = string.format("%d%02d%02d%02d%02d",
                                                       PeriodicTab[5].value,PeriodicTab[6].value,PeriodicTab[7].value,
                                                       PeriodicTab[8].value,PeriodicTab[9].value);


        if Sys.periodStartDateTime <= currentDateTime then--���õ����ڿ�ʼʱ�䵽��,�����Ƿ�����������������
            local temp_i = 0;
            for i = Sys.periodicIndex, Sys.periodicIndex + 3, 1 do --��Ϊ����������4��,������Ҫѭ�������Ĵ�
                if i > 4 then
                    temp_i = i - 4;
                else 
                    temp_i = i;
                end
                if PeriodicTab[temp_i].processId ~= 0 then--������Ų�Ϊ0 ,��ʾ������������,����ѭ��, i-diff ��ʾ4���������̵ĵڼ�������
                    processId = PeriodicTab[temp_i].processId;--��ȡ���̶�Ӧ�����
                    Sys.periodicIndex = temp_i;
                    Sys.isPeriodOrTimed = PERIOD_PROCESS;
                    break;
                end
            end
        end

        if  processId == 0 then   --���е�����,��ʾû��������������������, ��ʼѭ�����Ҷ�ʱ������,�Ƿ�����������������
            for i=1,24,1 do
                if TimedProcessTab[i].startHour == Sys.dateTime.hour and 
                   TimedProcessTab[i].startMinute == Sys.dateTime.min and
                   TimedProcessTab[i].processId ~= 0 --��Ų�Ϊ0, ��ʾ������������
                then
                   processId = TimedProcessTab[i].processId;
                   Sys.isPeriodOrTimed = TIMED_PROCESS;
                end
            end
        end

    -------------------------------------------------����-----------------------------------------------
    elseif Sys.runType == WorkType[Sys.language].controlled then 

    end
    return processId;
end


--***********************************************************************************************
--��ֹ����������صĲ���
--state : ȡֵ ENABLE / DISABLE
--***********************************************************************************************
function set_process_edit_state(state)
    --------------------------------��������1/2/3����Ĳ���------------------------------
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

    ----------------------------���ϸ������е�""ȷ��"��ť-----------------------------------------
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
--�ڿ�ʼִ������ǰ,��ҪһЩ׼������
--***********************************************************************************************
function process_ready_run()
    Sys.currentProcessId = get_current_process_id();--��ȡ��ǰ��Ҫ���е�����id
    if Sys.currentProcessId ~= 0  and io.open(Sys.currentProcessId, "r") ~= nil then--������0,��ʾ���������������̴�ִ��,
        set_process_edit_state(DISABLE);            --��ֹ����������صĲ���
        ReadProcessFile();                          --������������1����/���п��ƽ���/�������ý����еĲ�������
        ReadActionFile(Sys.currentProcessId);       --��ȡ���������ļ�,��Ҫ���������������2/3 �Լ���ʼ/ע���/ע��ü�Һ/�䶯�ü�Һ/����/�������Ƚ���Ĳ���
        if Sys.isPeriodOrTimed == PERIOD_PROCESS then
            set_process_start_date_time(Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day, Sys.dateTime.hour, Sys.dateTime.min);--���ñ������̿�ʼʱ��
        end
        Sys.driverSubStep = 1; --���в��趼�Ǵ�1��ʼ
        Sys.actionStep = 1;
        Sys.actionSubStep = 1;
        Sys.driverStep = 1;
        Sys.driverSubStep = 1;
        Sys.handRunTimes = 0;
        set_value(MAIN_SCREEN, ProgressBarId, 0);--���ý�������ֵΪ0
        Sys.logContent = WorkStatus[Sys.language].run.."\""..Sys.processName.."\"";--�����С�+��������
        add_history_record(HISTORY_LOG_SCREEN);--���һ����־��Ϣ
        SetSysWorkStatus(WorkStatus[Sys.language].run);--���ù���״̬Ϊ����,��ת��excute_process����ִ������
    end
end

--***********************************************************************************************
--�ú����ڶ�ʱ���е���,������״̬ʱ���øú���
--ϵͳΪ����״̬,��ʱSystemArg.currentProcessId�����˵�ǰ��Ҫ���е��������, �����Ը����Ϊ�������������ļ������˸����̵����ж�??ͨ���������ļ�����֪������ʲô����.
--Sys.actionNumberͳ����action������
--Sys.actionTab���鳤��Ϊ24,��ʾ���ɼ�¼24��action, ��ֵ������ǵ�ǰ�����Ӧ��action���
--Sys.actionTab�б����˸������������,����SystemArg.actionIdTab[1] = 3, ��ʾ��һ����ִ�����Ϊ3��action, Ҳ��ζ�����Ϊ1/2��actionΪ�ո�(û������)
--Sys.processFileStr���Ѿ���ȡ�������ļ��е���������.(��δ�����κδ���)
--Sys.actionStep���ڿ��Ƶ�ǰִ�еĶ������.
--***********************************************************************************************
function excute_process()
    --------------------------------------------------------------------------
    --��һ��:����action����type��ǩ��ö�������,ͨ���������Ϳ���֪����ִ��ʲô��������, ����content�е�����,��������Ϊ���������Ĳ���
    if Sys.processStep == 1 then
        local actionId = Sys.actionIdTab[Sys.actionStep];
        Sys.actionString  = GetSubString(Sys.processFileStr, "<action"..actionId..">", "</action"..actionId..">");--��ȡ�ļ���<action?>��ǩ֮����ַ���
        local typeString  = GetSubString(Sys.actionString, "<type>","</type>");--��������������
        local tab = split(typeString, ",");--���������������Ʒ���tab����
        Sys.actionType    = tab[1];--��ȡ��������
        Sys.contentTabStr = GetSubString(Sys.actionString,"<content>","</content>");--�ٽ�ȡ<content>��ǩ�е�����
        Sys.contentTab    = split(Sys.contentTabStr, ",");--�ָ��ַ���,�����ַ�������tab����
        Sys.startTime = Sys.dateTime;
        ShowSysCurrentAction( Sys.processName..":"..Sys.actionNameTab[Sys.actionStep]);--��ʾ��������-��������
        if Sys.actionType == ActionItem[Sys.language][1] then 
            Sys.actionFunction = excute_init_process;--ִ�� ��ʼ������
        elseif Sys.actionType == ActionItem[Sys.language][2] then 
            Sys.actionFunction = excute_inject_process;--ִ�� ע�������
        elseif Sys.actionType == ActionItem[Sys.language][3] then
            Sys.actionFunction = excute_inject_add_process;--ִ�� ע��ü�Һ����
        elseif Sys.actionType == ActionItem[Sys.language][4] then 
            Sys.actionFunction = excute_read_signal_process;--ִ��-��ȡ�ź�����
        elseif Sys.actionType == ActionItem[Sys.language][5] then 
            Sys.actionFunction = excute_peristaltic_process--ִ��-�䶯�ü�Һ����
        elseif Sys.actionType == ActionItem[Sys.language][6] then 
            Sys.actionFunction = excute_calculate_process;--ִ��-��������
        elseif Sys.actionType == ActionItem[Sys.language][7] then 
            Sys.actionFunction = excute_wait_time_process;--ִ��-�ȴ�ʱ������
        elseif Sys.actionType == ActionItem[Sys.language][8] then 
            Sys.actionFunction = excute_dispel_process;--ִ��-��������
        elseif Sys.actionType == ActionItem[Sys.language][9] then 
            Sys.actionFunction = excute_valve_ctrl_process;--ִ��-����������
        end
        Sys.driverStep = 1;--�����̴ӵ�һ����ʼ
        Sys.actionSubStep = 1;--�����̴ӵ�һ����ʼִ��
        Sys.processStep = Sys.processStep + 1;--��ת����һ��ִ��������
    --------------------------------------------------------------------------------------------------
    --�ڶ���: ִ�������̺���
    elseif Sys.processStep == 2 then
        if Sys.actionFunction(Sys.contentTab) == FINISHED then
            Sys.processStep = Sys.processStep + 1;
        end
    ---------------------------------------------------------------------------------------------------
    --������:�ж϶����Ƿ�ִ�����
    elseif Sys.processStep == 3 then
        set_value(MAIN_SCREEN, ProgressBarId, math.floor(Sys.actionStep/Sys.actionTotal*100));--���½�����
        ----------------���ж���ִ�����-------------------------------------------
        if Sys.actionStep >= Sys.actionTotal then
            Sys.actionStep = 1;                       --ָ���һ������
            Sys.processStep = 1;                      --���ص�һ��ִ�ж���
            ----------------�ֶ�ģʽ--------------------
            if Sys.runType == WorkType[Sys.language].hand then                    
                Sys.handRunTimes = Sys.handRunTimes + 1;  --��������+1
                if  Sys.handRunTimes >= HandProcessTab[1].times then--�Ѵﵽָ�������д���,ϵͳֹͣ
                    SystemStop();
                end
            ----------------�Զ�ģʽ--------------------
            elseif Sys.runType == WorkType[Sys.language].auto then
                if Sys.isPeriodOrTimed == PERIOD_PROCESS then--�����ǰ����Ϊ��������, ����Ҫ�����´��������̵�ʱ��.
                    Sys.periodicIndex = Sys.periodicIndex + 1;--ָ����һ������
                    if Sys.periodicIndex > 4 then
                        Sys.periodicIndex = 1;
                    end
                    set_period_start_date_time(PeriodicTab[10].value);--������һ���������е�ʱ��
                end
                WriteProcessFile(2);
                SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--����Ϊ����״̬,��ʱ����ϵͳ��ʱ���в��ϵ��ж��Ƿ���Խ���?�һ�������?
            ----------------����ģʽ--------------------
            elseif Sys.runType == WorkType[Sys.language].controlled then
                SystemStop();
            end
        ----------------����δִ����,������һ������-------------------------------------------
        else
            Sys.actionStep = Sys.actionStep + 1;--ָ����һ������
            Sys.processStep = 1;                      --���ص�һ��ִ����һ������
        end
    end
end

--***********************************************************************************************
--  �ڵײ���״̬����ʾ��ʾ��Ϣ
--***********************************************************************************************
function SystemStop()
    SetSysWorkStatus(WorkStatus[Sys.language].stop);--��״̬����ʾΪֹͣ
    ShowSysCurrentAction(TipsTab[Sys.language].null);--����ǰ������ʾΪ"��"
    set_value(RUN_CONTROL_SCREEN, RunStopButtonId, 0.0);--����ʼ/ֹͣ��ť����
    if Sys.userName == SysUser[Sys.language].maintainer or  Sys.userName == SysUser[Sys.language].administrator then--��άԱ/��?��?
        set_process_edit_state(ENABLE);--����༭����
    end
    UartArg.lock = UNLOCKED;--��������
    Sys.waitTimeFlag = RESET;
    Sys.logContent = WorkStatus[Sys.language].stop.."\""..Sys.processName.."\"";--��ֹͣ��+��������
    add_history_record(HISTORY_LOG_SCREEN);--���һ��ֹͣ���̵���־��Ϣ
end


--[[-----------------------------------------------------------------------------------------------------------------
    ��������1
--------------------------------------------------------------------------------------------------------------------]]

--�������ñ��и��ؼ�Id,ע��selecId��nameId����ѧ��ϵ:typeId = nameId + 100, typeId = deleteId + 220 �ȵ�
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


AnalyteSetId = 38;--������ѡ��
CodeSetId = 107;--����
ProcessSaveBtId = 19;--���水ť,��������1/2/3�ı��水ť�������id
ExportBtId = 41;--������ť
InportBtId = 42;--���밴ť
NextSetScreen = 128;--��һ���������ý���

--***********************************************************************************************
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--***********************************************************************************************
function process_set1_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- ����
        WriteProcessFile(1);
    ------------------------------------------------------------------------
    elseif control == InportBtId then --���밴ť
        if SdPath  ~= nil then
            ShowSysTips(TipsTab[Sys.language].importing);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                ConfigFileCopy( SdPath.."config/"..i, i);--��Sd���е������ļ����붼ϵͳ
            end
            ShowSysTips(TipsTab[Sys.language].imported);
            ReadProcessFile();--������������1����/���п��ƽ���/�������ý����еĲ�������
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab[Sys.language].importing);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                ConfigFileCopy( UsbPath.."config/"..i, i);--��Sd���е������ļ����붼ϵͳ
            end
            ShowSysTips(TipsTab[Sys.language].imported);
            ReadProcessFile();--������������1����/���п��ƽ���/�������ý����еĲ�������
        else
            ShowSysTips(TipsTab[Sys.language].insertSdUsb);
        end;
    ------------------------------------------------------------------------
    elseif control == ExportBtId then --������ť(���������õ�����SD����)
        if SdPath  ~= nil then
            ShowSysTips(TipsTab[Sys.language].exporting);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                ConfigFileCopy(i, SdPath.."config/"..i);--���ļ�������config�ļ���,�����ļ���Ϊ0~12
            end
            ShowSysTips(TipsTab[Sys.language].exported);
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab[Sys.language].exporting);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                ConfigFileCopy(i, UsbPath.."config/"..i);--���ļ�������config�ļ���,�����ļ���Ϊ0~12
            end
            ShowSysTips(TipsTab[Sys.language].exported);
        else
            ShowSysTips(TipsTab[Sys.language].insertSdUsb);
        end;
    ------------------------------------------------------------------------
    elseif control == NextSetScreen then--��ת����������2���水ť
        if get_text(PROCESS_SET2_SCREEN, ProcesstypeId) == BLANK_SPACE then
            process_select2_set(PROCESS_SET2_SCREEN, ProcesstypeId);
            change_screen(PROCESS_SELECT2_SCREEN);
        end
    ------------------------------------------------------------------------
    elseif control == AnalyteSetId then--
        set_text(MAIN_SCREEN, LastAnalyteId, get_text(PROCESS_SET1_SCREEN, AnalyteSetId));--���÷�����
    ------------------------------------------------------------------------
    elseif (control-100) >= ProcessTab[1].typeId and (control-100) <= ProcessTab[12].typeId then --���������������µĸ�����ť
        process_select_set(screen, control-100);
    ------------------------------------------------------------------------
    elseif (control-100) >= ProcessTab[1].rangeId and (control-100) <= ProcessTab[12].rangeId  then --����������ѡ���µĸ�����ť
        range_select_set(screen, control-100);
    ------------------------------------------------------------------------
    elseif control >= ProcessTab[1].deleteId and control <= ProcessTab[12].deleteId then--ɾ����ť
        if get_text(PROCESS_SET1_SCREEN, control+120) ~= BLANK_SPACE then --���Ʋ�Ϊ�ո�
            local file = control - 79;--controlȡֵ80-91,��ȥ79��,��Ӧ��1-12,��Ϊ���.
            set_text(PROCESS_SET1_SCREEN, control+220,BLANK_SPACE);
			set_text(PROCESS_SET1_SCREEN, control+120,BLANK_SPACE);
            set_text(PROCESS_SET1_SCREEN, control+232,BLANK_SPACE);
            WriteProcessFile(1);--������������1�����еĲ���
            os.remove(file);--ɾ�������ļ�
        end
    end
end



--***********************************************************************************************
--�������л�����������1ʱ��ִ�д˻ص�����
--***********************************************************************************************
function goto_ProcessSet1()
    
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������2/3
--------------------------------------------------------------------------------------------------------------------]]

ProcessSelectButtonId = 35;--λ����������2
ProcesstypeId = 38;      --λ����������2/3�������id
ProcessSelectTipsTextId = 21;--������ʾ��ʾ��Ϣ���ı���,��������2/3�����ж������id

--����ע��۲춯��ѡ��id,��������id,�༭id֮�����ѧת����ϵ:typeId = nameId + 100; nameId = editId + 100
--����[1]-[12]�а�����id�ؼ�����������2������,[13]-[24]�а�����id�ؼ�����������3������
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

--���ñ༭��ť��Ӧ����ת����
--para:��ȡ��Ӧ�Ķ�����������
--screen: ��ǰ��Ļ��id, �ӽ��水"ȷ��" ,"����" ��ť����Ҫ���صĽ���
--control:"�༭"��ť��id��
function set_edit_screen(para, screen, control)
    -- if screen == PROCESS_SET2_SCREEN then
        ReadActionTag(control-100);--����������2����, ���༭��ťid��Ϊ101ʱ, ��ǰ�������Ϊ1, ��������
        set_screen_actionNumber(screen, control-100);
    -- elseif screen == PROCESS_SET3_SCREEN then
    --     ReadActionTag(control-100);
    --     set_screen_actionNumber(screen, control-100+12);
    -- end

    if para == ActionItem[Sys.language][1] then --��ʼ����
        change_screen(PROCESS_INIT_SCREEN);
    elseif para == ActionItem[Sys.language][2] then --ȡ������
        change_screen(PROCESS_INJECT_SCREEN);
    elseif para == ActionItem[Sys.language][3] then --ע��ü�Һ��
        change_screen(PROCESS_INJECT_ADD_SCREEN);
    elseif para == ActionItem[Sys.language][4] then --��ȡ�ź�
        change_screen(PROCESS_READ_SIGNAL_SCREEN);
    elseif para == ActionItem[Sys.language][5] then --�䶯�ü�Һ
        change_screen(PROCESS_PERISTALTIC_SCREEN);
    elseif para == ActionItem[Sys.language][6] then --����
        change_screen(PROCESS_CALCULATE_SCREEN);
    elseif para == ActionItem[Sys.language][7] then --�ȴ�ʱ��
        change_screen(PROCESS_WAIT_TIME_SCREEN);
    elseif para == ActionItem[Sys.language][8] then --����
        change_screen(PROCESS_DISPEL_SCREEN);
    elseif para == ActionItem[Sys.language][9] then --������
        change_screen(PROCESS_VALVE_CTRL_SCREEN);
    end
end


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set2_control_notify(screen,control,value)
    if control == ProcessSaveBtId then -- ����
        if string.len(get_text(PROCESS_SET2_SCREEN, ProcesstypeId)) == 0  then
            set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 1);--��ʾ��ʾ��Ϣ
        else
            set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 0);--������ʾ��Ϣ
            --�ֶ����浱ǰ���ڱ༭������
            WriteActionFile(0);
        end
    elseif control == ProcessSelectButtonId then--���������ѡ��ťʱ,
        if get_text(PROCESS_SET2_SCREEN, ProcesstypeId) ~= BLANK_SPACE then
            process_select2_set(PROCESS_SET2_SCREEN, ProcesstypeId);--��������ѡ��2�����а�ȷ��/���ذ�ť��,������������2����
        else

        end
    elseif control == ProcesstypeId then

    elseif (control-100) >= TabAction[1].typeId and (control-100) <= TabAction[12].typeId then--�����"��������"����İ�ťʱ
        action_select_set(PROCESS_SET2_SCREEN, control-100, control-400);
    elseif control >= TabAction[1].editId and control <= TabAction[12].editId then--�����"�༭"��ťʱ
        if get_text(PROCESS_SET2_SCREEN, control+200) ~= BLANK_SPACE and get_value(screen,control) == ENABLE then--��������˶�?����?�༭��ť��id+200���ڶ�������id)
            set_edit_screen(get_text(PROCESS_SET2_SCREEN, control+200), PROCESS_SET2_SCREEN, control);--control+200��ʾ��Ӧ��"��������"id
        end
    elseif control >= TabAction[1].insertId and control <= TabAction[12].insertId then--��������밴ťʱ
        if get_value(screen,control) == ENABLE then
            InsertAction(control - 500);
        end
    elseif control >= TabAction[1].deleteId and control <= TabAction[12].deleteId then--�����ɾ����ťʱ
        if get_value(screen,control) == ENABLE then
            DeleteAction(control - 600);
        end
    end
end


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set3_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- ����
        if string.len(get_text(PROCESS_SET3_SCREEN, ProcesstypeId)) == 0 then
            set_visiable(PROCESS_SET3_SCREEN, ProcessSelectTipsTextId, 1);--��ʾ��ʾ��Ϣ
        else
            set_visiable(PROCESS_SET3_SCREEN, ProcessSelectTipsTextId, 0);--������ʾ��Ϣ
            --�ֶ����浱ǰ���ڱ༭������
            WriteActionFile(0);
        end
    elseif (control-100) >= TabAction[13].typeId and (control-100) <= TabAction[24].typeId then--�����"��������"����İ�ťʱ
        action_select_set(PROCESS_SET3_SCREEN, control-100, control-400);
    elseif control >= TabAction[13].editId and control <= TabAction[24].editId then--�����"�༭"��ťʱ
        if get_text(PROCESS_SET3_SCREEN, control+100) ~= BLANK_SPACE and get_value(screen,control) == ENABLE then--��������˶�?��???�༭��ť��id+100���ڶ�������id)
            set_edit_screen(get_text(PROCESS_SET3_SCREEN, control+200), PROCESS_SET3_SCREEN, control);--control+200��ʾ��Ӧ��"��������"id
        end
    elseif control >= TabAction[13].insertId and control <= TabAction[24].insertId then--��������밴ťʱ
        if get_value(screen,control) == ENABLE then
            InsertAction(control - 500);
        end
    elseif control >= TabAction[13].deleteId and control <= TabAction[24].deleteId then--�����ɾ����ťʱ
        if get_value(screen,control) == ENABLE then
            DeleteAction(control - 600);
        end
    end
end

--�������л�����������2ʱ��ִ�д˻ص�����
function goto_ProcessSet2()
    set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 0);--������ʾ��Ϣ
end

--�������л�����������3ʱ��ִ�д˻ص�����
function goto_ProcessSet3()
    set_visiable(PROCESS_SET3_SCREEN, ProcessSelectTipsTextId, 0);--������ʾ��Ϣ
    set_text(PROCESS_SET3_SCREEN, ProcesstypeId, get_text(PROCESS_SET2_SCREEN,ProcesstypeId));
end

--***********************************************************************************************
--������������2/3�����ϵ��"����"��ťʱ, �Ҵ�ʱ��ǰ�е�"��������"��Ϊ��ʱ,����øú���
--�ú���ʵ�ֱ���"����"����, ʵ���Ͼ����޸������ļ�,Ȼ���ٶ�ȡ
--***********************************************************************************************
function InsertAction(actionNumber)
    --����ǰ�в����������Ϊ�ո���ʾ
    if actionNumber >= 1 and actionNumber <= 12 then
        for i = 24, 14, -1 do--
            set_text(PROCESS_SET3_SCREEN, TabAction[i].typeId, get_text(PROCESS_SET3_SCREEN, TabAction[i-1].typeId));
            set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId, get_text(PROCESS_SET3_SCREEN, TabAction[i-1].nameId));
        end
        set_text(PROCESS_SET3_SCREEN, TabAction[13].typeId, get_text(PROCESS_SET2_SCREEN, TabAction[12].typeId));
        set_text(PROCESS_SET3_SCREEN, TabAction[13].nameId, get_text(PROCESS_SET2_SCREEN, TabAction[12].nameId));
        for i = 12, actionNumber+1, -1 do--
            set_text(PROCESS_SET2_SCREEN, TabAction[i].typeId, get_text(PROCESS_SET2_SCREEN, TabAction[i-1].typeId));
            set_text(PROCESS_SET2_SCREEN, TabAction[i].nameId, get_text(PROCESS_SET2_SCREEN, TabAction[i-1].nameId));
        end
        set_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--����ǰ����ʾΪ�ո�
        set_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    else
        for i = 24, actionNumber+1, -1 do--
            set_text(PROCESS_SET3_SCREEN, TabAction[i].typeId, get_text(PROCESS_SET3_SCREEN, TabAction[i-1].typeId));
            set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId, get_text(PROCESS_SET3_SCREEN, TabAction[i-1].nameId));
        end
        set_text(PROCESS_SET3_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--��ǰ����ʾΪ�ո�
        set_text(PROCESS_SET3_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    end

    ChangeActionFileTag(actionNumber, 1);
end

--***********************************************************************************************
--������������2/3�����ϵ��"ɾ��"��ťʱ, �Ҵ�ʱ��ǰ�е�"��������"��Ϊ��ʱ,����øú���
--�ú���ʵ�ֱ���"ɾ��"����, ʵ���Ͼ����޸������ļ�,Ȼ���ٶ�ȡ
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
    ��������-��ʼ��
--------------------------------------------------------------------------------------------------------------------]]
--�������ӽ�����("��ʼ��/ע���/����/......"),ȷ�ϰ�ť��id����99,ȡ����ť��id����98.
SureButtonId = 99;--ȷ�ϰ�ť
CancelButtonId = 98;--ȡ����ť
DestScreen = nil;
DestControl = nil;
DestActionNum = 0;--ָ��ǰ�������

AnalysisTypeMenuId = 108;
AnalysisTypeTextId = 22;

INIT_BtStartId = 1;
INIT_BtEndId = 21;
INIT_TextStartId = 22;
INIT_TextEndId = 23;

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function set_screen_actionNumber(screen, actionNumber)
    DestScreen = screen;
    DestActionNum = actionNumber;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_init_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
            WriteActionFile(DestActionNum);
            change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  ִ�г�ʼ������
--  paraTab:��������Ӧ�����еĲ�������, �ñ��е�i��Ԫ��,��ʾ��ʼ�������б��Ϊi�Ŀؼ���Ԫ�ص�ֵ,
--          ������Щ���ֻ�����������ʹ��,���ԾͲ��ٶ��ⶨ�����
--***********************************************************************************************
function excute_init_process(paraTab)
    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--���������������ڵȴ���ʱ.
        return;
    end

    --------------------------------------------------------------
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ʮͨ����λ
            control_valco( tonumber(paraTab[23]) );--idΪ23�Ŀؼ�Ϊͨ����
            start_wait_time(1);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�Է����и�λ(��ȡ����)
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+5];--����״̬���浽valveIdTab��,���ֵΪ1.0��ʾ��Ҫ��λ,���ֵΪ0.0����Ҫ
            end
            Sys.valveOperate = ValveStatus[Sys.language].close;--���ر�
            Sys.waitTime = 8;
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 3 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�Է����и�λ(ִ�з���λ����)
            Sys.driverStep1Func = control_multi_valve;--���ƶ�����Ĵ򿪻��߹ر�
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        if paraTab[3] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ע���1���и�λ
            start_wait_time(8);
            reset_inject1();
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 5 then
        if paraTab[4] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ע���2���и�λ
            Sys.actionSubStep = Sys.actionSubStep + 1;
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        if paraTab[4] == ENABLE_STRING then--�ж��Ƿ���Ҫ��������и�λ
            Sys.actionSubStep = Sys.actionSubStep + 1;
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 7 then--����
        Sys.actionSubStep = FINISHED;
    end
    
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    ��������-ע���
--------------------------------------------------------------------------------------------------------------------]]

INJECT_BtStartId = 1;--ע��ý����а�ť��ʼid
INJECT_BtEndId = 3; --ע��ý����а�ť����id

INJECT_TextStartId = 4;--ȡ���������ı���ʼid
INJECT_TextEndId = 11; --ȡ���������ı�����id

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_inject_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  ִ��ע�������
--  paraTab:��������Ӧ�����еĲ�������, �ñ��е�i��Ԫ��,��ʾ��ʼ�������б��Ϊi�Ŀؼ���Ԫ�ص�ֵ,
--          ������Щ���ֻ�����������ʹ��,���ԾͲ��ٶ��ⶨ�����
--***********************************************************************************************
function excute_inject_process(paraTab)

    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ע���1���в���
            Sys.injectSpeed = tonumber(paraTab[4]);
            Sys.injectScale = tonumber(paraTab[5]) * 10;
            Sys.waitTime = tonumber(paraTab[6]);
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 2 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ע���2���в���
            Sys.injectSpeed = tonumber(paraTab[7]);
            Sys.injectScale = tonumber(paraTab[8]) * 10;
            Sys.waitTime = tonumber(paraTab[9]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 3 then--����
        Sys.actionSubStep = FINISHED;
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    ��������-ע��ü�Һ
--------------------------------------------------------------------------------------------------------------------]]

INJECT_ADD_BtStartId = 1;
INJECT_ADD_BtEndId = 41;
INJECT_ADD_TextStartId = 42;
INJECT_ADD_TextEndId = 62;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_inject_add_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  ִ��ע��ü�Һ������
--  paraTab:��������Ӧ�����еĲ�������, �ñ��е�i��Ԫ��,��ʾ��ʼ�������б��Ϊi�Ŀؼ���Ԫ�ص�ֵ,
--          ������Щ���ֻ�����������ʹ��,���ԾͲ��ٶ��ⶨ�����
--***********************************************************************************************
function excute_inject_add_process(paraTab)

    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--���������������ڵȴ���ʱ.
        return;
    end

    -----------------------------------------------------------------
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ʮͨ������
            control_valco( tonumber(paraTab[42]) );--ͨ����
            start_wait_time( tonumber(paraTab[43]) );
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+9];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = tonumber(paraTab[44]);--�ȴ�ʱ��
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 3 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then--�ж϶�ע��õĲ���(ע���1��ע���2ֻ��ѡ��һ��)
        if paraTab[3] == ENABLE_STRING then
            Sys.injectSpeed = tonumber(paraTab[45]);
            Sys.injectScale = tonumber(paraTab[46]) * 10;
            Sys.waitTime = tonumber(paraTab[47]);
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
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
        if paraTab[5] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ʮͨ������
            control_valco( tonumber(paraTab[52]) );--idΪ63�Ŀؼ�Ϊͨ����
            start_wait_time( tonumber(paraTab[53]) );
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(�ط�)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+9];
            end
            Sys.valveOperate = ValveStatus[Sys.language].close;
            Sys.waitTime = 0
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 7 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(�ط�)����
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 8 then
        if paraTab[6] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����2����(����)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+25];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = tonumber(paraTab[54]);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 9 then
        if paraTab[6] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����2����(����)����
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 10 then--�ж϶�ע��õĲ���(ע���1��ע���2ֻ��ѡ��һ��)
        if paraTab[7] == ENABLE_STRING then
            Sys.injectId = 1;
            Sys.injectSpeed = tonumber(paraTab[55]);
            Sys.injectScale = tonumber(paraTab[56]) * 10;
            Sys.waitTime = tonumber(paraTab[57]);
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        elseif paraTab[7] == ENABLE_STRING then
            Sys.injectId = 2;
            Sys.injectSpeed = tonumber(paraTab[58]);
            Sys.injectScale = tonumber(paraTab[59]) * 10;
            Sys.waitTime = tonumber(paraTab[60]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 11 then
        if paraTab[6] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����2����(�ط�)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+25];
            end
            Sys.valveOperate = ValveStatus[Sys.language].close;
            Sys.waitTime = 0;
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 12 then
        if paraTab[6] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����2����(�ط�)����
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 13 then--����
        Sys.actionSubStep = FINISHED;
    end
    
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    ��������-�䶯�ü�Һ
--------------------------------------------------------------------------------------------------------------------]]


PERISTALTIC_BtStartId = 1;
PERISTALTIC_BtEndId = 22;
PERISTALTIC_TextStartId = 23;
PERISTALTIC_TextEndId = 39;


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_peristaltic_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  ִ���䶯�ü�Һ������
--  paraTab:��������Ӧ�����еĲ�������, �ñ��е�i��Ԫ��,��ʾ��ʼ�������б��Ϊi�Ŀؼ���Ԫ�ص�ֵ,
--          ������Щ���ֻ�����������ʹ��,���ԾͲ��ٶ��ⶨ�����
--***********************************************************************************************
function excute_peristaltic_process(paraTab)
    ----------------------------------------------------------------
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ʮͨ������
            Sys.valcoChannel = tonumber(paraTab[22]);--ͨ����
            Sys.waitTime = tonumber(paraTab[23]);--�ȴ�ʱ��
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    ----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+6];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = tonumber(paraTab[24]);
        -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    ----------------------------------------------------------------
    elseif Sys.actionSubStep == 3 then
        if paraTab[3] == ENABLE_STRING then--�ж϶��䶯�õĲ���
            Sys.periodicIndex = 1;
            Sys.periodicSpeed = tonumber(paraTab[25]);
            Sys.periodicVolume = tonumber(paraTab[26]);
            Sys.periodicDir = paraTab[27];
            Sys.waitTime = tonumber(paraTab[28]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        elseif paraTab[4] == ENABLE_STRING then
            Sys.periodicIndex = 2;
            Sys.periodicSpeed = tonumber(paraTab[29]);
            Sys.periodicVolume = tonumber(paraTab[30]);
            Sys.periodicDir = paraTab[31];
            Sys.waitTime = tonumber(paraTab[32]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        elseif paraTab[5] == ENABLE_STRING then
            Sys.periodicIndex = 3;
            Sys.periodicSpeed = tonumber(paraTab[33]);
            Sys.periodicVolume = tonumber(paraTab[34]);
            Sys.periodicDir = paraTab[35];
            Sys.waitTime = tonumber(paraTab[36]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    ----------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(�ط�)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+6];
            end
            Sys.valveOperate = ValveStatus[Sys.language].close;
            Sys.waitTime = 0;
        -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    ----------------------------------------------------------------
    elseif Sys.actionSubStep == 5 then--����
        Sys.actionSubStep = FINISHED;
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    ��������-����
--------------------------------------------------------------------------------------------------------------------]]

DISPEL_BtStartId = 1;
DISPEL_BtEndId = 1;
DISPEL_TextStartId = 2;
DISPEL_TextEndId = 5;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_dispel_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end



--***********************************************************************************************
--  ִ����������(ĿǰӲ���ϻ�û������) ##������##
--***********************************************************************************************
function excute_dispel_process(paraTab)
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--�ж��Ƿ���Ҫ����
            Sys.dispelTemp = tonumber(paraTab[24]);
            Sys.dispelTime = tonumber(paraTab[25]);
            Sys.dispelEmptyTemp = tonumber(paraTab[26]);
            Sys.waitTime = tonumber(paraTab[27]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 2 then
        Sys.actionSubStep = FINISHED;--����
    end
    return Sys.actionSubStep;
end



--[[-----------------------------------------------------------------------------------------------------------------
    ��������-��ȡ�ź�
--------------------------------------------------------------------------------------------------------------------]]

ReadSignal_TextStartId = 1;
ReadSignal_TextEndId = 5;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_read_signal_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end



--***********************************************************************************************
--  ִ�ж�ȡ�ź�����
--***********************************************************************************************
function excute_read_signal_process(paraTab)
    if UartArg.lock == LOCKED then--����������ֱ�ӷ���
        return;
    end
    -----------------------------------------------------------
    if Sys.actionSubStep == 1 then
        Sys.signalDrift = tonumber(paraTab[2]);--�ź�Ư��
        Sys.signalMinTime = tonumber(paraTab[3]);--��Сʱ��
        Sys.signalMaxTime = tonumber(paraTab[4]);--���ʱ��
        Sys.signalNumber = tonumber(paraTab[5]);--ȡ������
        start_wait_time(Sys.signalMinTime);
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if Sys.waitTimeFlag == RESET then  --��С��ʱʱ�䵽,��ת��һ����ȡ�ź�
            if Sys.signalMaxTime < Sys.signalMinTime then
                Sys.signalMaxTime = Sys.signalMinTime;
            end
            start_wait_time(Sys.signalMaxTime - Sys.signalMinTime) --������ʱ��,���ڶ�ʱ���ʱʱ��
            Sys.signalCount = 0;
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 3 then--ͨ�����ڶ�ȡ�ź�
        on_uart_send_data(uartSendTab.getVoltage, NEED_REPLY);
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 4 then--������������, ���ж��Ƿ������ź�Ư��Ҫ��
        local signalE = (UartArg.recv_data[3] * 256 + UartArg.recv_data[4]) / 10;--��ȡ���ź�ֵ��Ҫ����10����ʵ��ֵ
        --����ȡ�ĵ�ѹʵʱ��ʾ����ҳ����
        if paraTab[1] == "E1" then
            set_text(MAIN_SCREEN, LastResultE1Id, signalE);
        else
            set_text(MAIN_SCREEN, LastResultE2Id, signalE);
        end
        
        Sys.signalTab[ math.fmod(Sys.signalCount, Sys.signalNumber) ] = signalE;--����ѹ�źű��浽������
        Sys.signalCount = Sys.signalCount + 1;
        
        if Sys.signalCount >= Sys.signalNumber then--�Ѿ���ȡ���㹻���źţ�ȡ������
            local tempMax,tempMin,maxSignal,minSignal;
            tempMax = Sys.signalTab[0];
            tempMin = Sys.signalTab[0];
            for i = 1, (Sys.signalNumber-1) ,1 do
                tempMax = math.max(tempMax, Sys.signalTab[i]);
                tempMin = math.min(tempMin, Sys.signalTab[i]);
            end
            maxSignal = tempMax;--��ȡ���ֵ
            minSignal = tempMin;--��ȡ��Сֵ
            
            --�����ź�Ư������ ���� ���ʱʱ�䵽
            if (maxSignal - minSignal <= Sys.signalDrift) or Sys.waitTimeFlag == RESET  then
                local signalSum = 0;
                for i = 0, Sys.signalNumber-1, 1 do
                    signalSum = signalSum + Sys.signalTab[i];
                end
                signalE = (signalSum - maxSignal - minSignal) / (Sys.signalNumber - 2);--��ȥSys.signalTab�е����ֵ����Сֵ��ȡƽ��ֵ
                
                if paraTab[1] == "E1" then
                    Sys.signalE1 = signalE;
                    set_text(MAIN_SCREEN, LastResultE1Id, signalE);
                    print("E1=",signalE);
                else
                    Sys.signalE2 = signalE;
                    set_text(MAIN_SCREEN, LastResultE2Id, signalE);
                    print("E2=",signalE);
                end
                Sys.actionSubStep = Sys.actionSubStep + 1;--��������,��ת��һ�������ɼ�
            else
                Sys.actionSubStep = Sys.actionSubStep - 1;--����������,ִ����һ��,������ȡ��ѹ�ź�
            end
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 5 then
        Sys.actionSubStep = FINISHED;--����
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    ��������-����
--------------------------------------------------------------------------------------------------------------------]]

CALCULATE_BtStartId = 1;
CALCULATE_BtEndId = 4;
CALCULATE_TextStartId = 5;
CALCULATE_TextEndId = 14;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_calculate_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  ִ�м�������
--***********************************************************************************************
function excute_calculate_process(paraTab)
    Sys.calculateWay = paraTab[10];
    Sys.calculateType = paraTab[12];
    Sys.calibrationValue = tonumber(paraTab[13]);
    Sys.resultTime = Sys.dateTime;--��ȡ��ǰʱ��
    if Sys.calculateType == CalcType[Sys.language][1] then--��ǰ����Ϊ����
        calc_analysis_result(Sys.calculateWay);
        if paraTab[1] == ENABLE_STRING then--������Բ���
            Sys.result = tonumber(paraTab[4]) * Sys.result + tonumber(paraTab[5]);
        end
        print("������� =",Sys.result);
    elseif Sys.calculateType == CalcType[Sys.language][2] then--��ǰ����ΪУ��1
        Sys.caliE1[1] = Sys.signalE1;
        Sys.caliE2[1] = Sys.signalE2;
        Sys.caliValue[1] = Sys.calibrationValue;
        print("У��1��E1=",Sys.caliE1[1],",E2=",Sys.caliE2[1]);
    elseif Sys.calculateType == CalcType[Sys.language][3] then--��ǰ����ΪУ��2
        Sys.caliE1[2] = Sys.signalE1;
        Sys.caliE2[2] = Sys.signalE2;
        Sys.caliValue[2] = Sys.calibrationValue;
        print("У��2��E1=",Sys.caliE1[2],",E2=",Sys.caliE2[2]);
        if Sys.calculateWay == CalcWay[Sys.language].log then--�����ȡ������ʽ������У��2ʱ�ͼ�����
            calc_calibrate_result_by_log();
        elseif Sys.calculateWay == CalcWay[Sys.language].diff and paraTab[11] == CalcOrder[Sys.language].First then
            calc_calibrate_result_by_diff(2);--ͨ������ʽ�����ķ�����Զ����c,d��ֵ
        end
    elseif Sys.calculateType == CalcType[Sys.language][4] then--��ǰ����ΪУ��3
        Sys.caliE1[3] = Sys.signalE1;
        Sys.caliE2[3] = Sys.signalE2;
        Sys.caliValue[3] = Sys.calibrationValue;
        if Sys.calculateWay == CalcWay[Sys.language].diff and paraTab[11] == CalcOrder[Sys.language].Second then
            calc_calibrate_result_by_diff(3);--ͨ������ʽ�����ķ�����Զ����b,c,d��ֵ
        end
        print("У��3��E1=",Sys.caliE1[3],",E2=",Sys.caliE2[3]);
    elseif Sys.calculateType == CalcType[Sys.language][5] then--��ǰ����ΪУ��4
        Sys.caliE1[4] = Sys.signalE1;
        Sys.caliE2[4] = Sys.signalE2;
        Sys.caliValue[4] = Sys.calibrationValue;
        calc_calibrate_result_by_diff(4);--ͨ������ʽ�����ķ�����Զ����a,b,c,d��ֵ
        print("У��4��E1=",Sys.caliE1[4],",E2=",Sys.caliE2[4]);
    end


    if paraTab[2] == ENABLE_STRING then--�Ƿ���Ҫ���б���
        
    end

    if paraTab[3] == ENABLE_STRING then--�Ƿ���Ҫ������ʷ��¼
        if Sys.calculateType == CalcType[Sys.language][1] then--��ǰ����Ϊ����
            add_history_record(HISTORY_ANALYSIS_SCREEN);
        else
            add_history_record(HISTORY_CALIBRATION_SCREEN);--��ǰ����ΪУ׼
        end
    end

    --�������������ʾ�������ʱ��
    if Sys.calculateType == CalcType[Sys.language][1] then--��ǰ����Ϊ����
        set_text(MAIN_SCREEN, LastResultId, Sys.result);
    else
        set_text(MAIN_SCREEN, LastResultId, Sys.calibrationValue);
    end
    set_text(MAIN_SCREEN, LastResultTimeId, Sys.resultTime.year.."-"..Sys.resultTime.mon.."-"..Sys.resultTime.day..
                                              "  "..Sys.resultTime.hour..":"..Sys.resultTime.min);
    return FINISHED;
end

--***********************************************************************************************
--  ����ķ�������a,b,c,d��ֵʱ,���õ��ú���
--  n��ʾΪ��Ԫһ�η���(��a,b,c,d),������Ԫһ�η���(��b,c,d,a����0)
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
--  ����ķ�������a,b,c,d��ֵʱ,���õ��ú���
--  n��ʾΪ��Ԫһ�η���(��a,b,c,d),������Ԫһ�η���(��b,c,d,a����0)
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
--  ͨ��������ʽ����У�����
--***********************************************************************************************
function calc_calibrate_result_by_log(void)
    local a,b,c,d;

    --����ģ������ c = 2706.5566��d = -81.1261�� 
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
    --���ü������a,b,c,d���
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId, a);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId, b);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId, c);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId, d);
    WriteProcessFile(3);--�����������ý���Ĳ���
end

--***********************************************************************************************
--  ͨ����ֵ��ʽ����У�����
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

    --����ע��Ϊģ������,�ó��Ľ��Ӧ��Ϊa = 0.8333 b=0 c=-0.83333 d = 10.0
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
    
    --���ü������a,b,c,d���
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId, a);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId, b);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId, c);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId, d);
    print("a="..a..",b="..b..",c="..c..",d="..d);
    WriteProcessFile(3);--�����������ý���Ĳ���
end

--***********************************************************************************************
--  ����������
--type��������ʽ���߲�ֵ��ʽ
--***********************************************************************************************
function calc_analysis_result(type)
    local x,a,b,c,d = 0;

    --����ģ�����ݲ��ö�����ʽ�����Ϊ73.272
    -- Sys.signalE1 = 4278.91;
    -- Sys.signalE2 = 3752.21;

    if type == CalcWay[Sys.language].log then--ȡ������ʽ
        x = math.log(Sys.signalE1/Sys.signalE2,10);
        print("������ʽ��x=",x);
    else
        x = Sys.signalE1 - Sys.signalE2;
    end

    a = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId));
    b = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId));
    c = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId));
    d = tonumber( get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId));

    Sys.result = a*(x^3) + b*(x^2) + c*x + d;
    set_text(MAIN_SCREEN, LastResultId, Sys.result);--����������ʾ���
end




--[[-----------------------------------------------------------------------------------------------------------------
    ��������-������
--------------------------------------------------------------------------------------------------------------------]]

VALVE_BtStartId = 1;
VALVE_BtEndId = 18;
VALVE_TextStartId = 19;
VALVE_TextEndId = 22;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_valve_ctrl_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  ִ�з���������
--***********************************************************************************************
function excute_valve_ctrl_process(paraTab)

    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--���������������ڵȴ���ʱ.
        return;
    end
    -----------------------------------------------------------
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ʮͨ������
            control_valco( tonumber(paraTab[19]) );--idΪ23�Ŀؼ�Ϊͨ����
            start_wait_time( tonumber(paraTab[20]) );
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--�ж��Ƿ���Ҫ��������в���
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+2];
            end
            Sys.valveOperate = paraTab[22];
            Sys.waitTime = tonumber(paraTab[21]);--�ȴ�ʱ��
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 3 then--�ж��Ƿ���Ҫ��������в���
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 4 then--����
        Sys.actionSubStep = FINISHED;
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    ��������-�ȴ�ʱ��
--------------------------------------------------------------------------------------------------------------------]]

WAITTIME_TextId = 1;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_wait_time_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end


--***********************************************************************************************
--  ִ�еȴ�ʱ������
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
    ����ѡ��
--------------------------------------------------------------------------------------------------------------------]]

AnalysisButtonId = 1;--������ť
NullButtonId = 8;--�հ�ť

ProcessSelectItem = nil;

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_select_control_notify(screen, control, value)
	if control >= AnalysisButtonId and control <= NullButtonId then
		ProcessSelectItem = control;
	elseif control == SureButtonId then --ȷ�ϰ�ť
		change_screen(DestScreen);
		if ProcessSelectItem ~= nil then
			set_text(DestScreen, DestControl, ProcessItem[Sys.language][ProcessSelectItem]);--DestControl��Ӧ����ѡ��
			if DestScreen == PROCESS_SET1_SCREEN  then
                set_text(DestScreen, DestControl-100, ProcessItem[Sys.language][ProcessSelectItem]..(DestControl-299));--DestControl-100��Ӧ��������
            end
        end
        WriteProcessFile(1);--������������1�����еĲ���
	elseif control == CancelButtonId then --ȡ����ť
		change_screen(DestScreen);
	end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ����ѡ��2
--------------------------------------------------------------------------------------------------------------------]]

FirstButtonId = 101;--��һ����ť
LastButtonId = 112;--���һ����ť
TipsTextId = 13;--��ʾ�ı���

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_select2_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_select2_control_notify(screen,control,value)
    if control >= FirstButtonId and control <= LastButtonId then
        ProcessSelec2tItem = control-100;--control-100 = ��ð�ť�غϵ��ı���id

    elseif control == SureButtonId then --ȷ�ϰ�ť,����֮ǰ�Ľ���
        change_screen(DestScreen);

        if ProcessSelec2tItem ~= nil then --ProcessSelec2tItemĬ��Ϊnil,���ѡ����ĳ���������ֵ��Ϊnil
            set_text(DestScreen, DestControl, get_text(PROCESS_SELECT2_SCREEN, ProcessSelec2tItem));--DestControl��Ӧ����ѡ��
            set_text(DestScreen, DestControl-100, get_text(PROCESS_SELECT2_SCREEN, ProcessSelec2tItem));--DestControl-100��Ӧ��?��???
            if DestScreen == PROCESS_SET2_SCREEN then --����ǻص���������2����,����ظ����̶�Ӧ�������ļ�
                ReadActionTag(0);
            elseif DestScreen == RUN_CONTROL_SCREEN then --����ǻص����п��ƽ���,�򱣴��ļ���Ϊ0"�������ļ�
                process_change(DestControl);--���̸ı��,ͨ�����øú����޸����̶�Ӧ��id��
                WriteProcessFile(2);--2��Ӧ<RunCtrl>��ǩ
            end
        end

    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end




--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_ProcessSelect2()
    --�����а�ť��������
    for i = FirstButtonId, LastButtonId,1 do
        set_visiable(PROCESS_SELECT2_SCREEN, i, 0);
    end
    --�������밴ť�غϵ��ı����������
    for i = FirstButtonId-100, LastButtonId-100,1 do
        set_visiable(PROCESS_SELECT2_SCREEN, i, 0);
    end
    --������ʾ��Ϣ
    set_visiable(PROCESS_SELECT2_SCREEN,TipsTextId,0);

    --��������1-12,���Ƿ�����������,�������������,��������ѡ��2�����н�����ʾ
    --��������п��ƽ���,������Ҫ�ж��Ƿ���������������, ����Ҫ�жϸ������Ƿ��ж�Ӧ�������ļ�
    NumberOfProcess = 0;

    local processFile = nil;
    for i = 1, 12, 1 do
        if DestScreen == RUN_CONTROL_SCREEN then--��Ϊ���п��ƽ���ʱ,��Ҫ�ж��Ƿ��ж�Ӧ�����������ļ�
            processFile = io.open(i, "r");
        else
            processFile = 1;
        end
        if get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId) ~= BLANK_SPACE--��ȡ���Ƴ���,�����Ƴ��Ȳ�Ϊ0ʱ��ʾ��Ч
           and  processFile ~= nil then--�����̺��������ļ�
            if DestScreen == RUN_CONTROL_SCREEN then
                processFile:close();
            end
            NumberOfProcess = NumberOfProcess + 1;--����+1
            set_visiable(PROCESS_SELECT2_SCREEN, NumberOfProcess,  1);--��ʾidΪNumberOfProcess���ı�
            set_text(PROCESS_SELECT2_SCREEN, NumberOfProcess, get_text(PROCESS_SET1_SCREEN,ProcessTab[i].nameId))--Ϊ���ı�����?����?
            set_visiable(PROCESS_SELECT2_SCREEN,100+NumberOfProcess,1);--��ʾ����ı����Ӧ�İ�ť
        end
    end

    if NumberOfProcess ~= 0 and DestScreen == RUN_CONTROL_SCREEN then
        -- ����һ��Ϊ"��"��ѡ��
        NumberOfProcess = NumberOfProcess + 1;
        set_visiable(PROCESS_SELECT2_SCREEN, NumberOfProcess,  1);--��ʾidΪNumberOfProcess���ı�
        set_text(PROCESS_SELECT2_SCREEN, NumberOfProcess, BLANK_SPACE)--Ϊ���ı�����������
        set_visiable(PROCESS_SELECT2_SCREEN,100 + NumberOfProcess,1);--��ʾ����ı����Ӧ�İ�ť
    end

    --��ʾ��ʾ��Ϣ
    if NumberOfProcess == 0 then
        set_visiable(PROCESS_SELECT2_SCREEN,TipsTextId, 1);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    ����ѡ��
--------------------------------------------------------------------------------------------------------------------]]

ActionStartButtonId = 1;
ActionEndButtonId = 10;
ActionSelectItem = nil;


--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function action_select_set(screen,control,actionNumber)
	DestScreen = screen;
    DestControl = control;
    DestActionNum = actionNumber;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function action_select_control_notify(screen,control,value)
    if control >= ActionStartButtonId and control <= ActionEndButtonId then --��������ѡ��ť
        ActionSelectItem = control;
    elseif control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
        if ActionSelectItem ~= nil then
            set_text(DestScreen, DestControl, ActionItem[Sys.language][ActionSelectItem]);--����ѡ��
            set_text(DestScreen, DestControl-100, ActionItem[Sys.language][ActionSelectItem]);--DestControl-100��Ӧ��������
        end
        WriteDefaultActionTag(DestActionNum);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������
--------------------------------------------------------------------------------------------------------------------]]

--����������/����ѡ�������,����1/2/3�ı���id����һ����

RANGESET_TextStartId = 1;
RANGESET_TextEndId = 18;

UniteSetTextId = 25--��λ���óɹ���,������ʾ��λ�ı���id
UniteSetMenuId = 26;--��λѡ��

RangeTab = {
    [1] = {LowId = 1, HighId = 2,  densityCalLowId = 3,  densityCalHighId = 4,  aId = 5,  bId = 6,  cId = 7,  dId = 8},
    [2] = {LowId = 9, HighId = 10, densityCalLowId = 11, densityCalHighId = 12, aId = 13, bId = 14, cId = 15, dId = 16},
    [3] = {LowId = 17,HighId= 18,  densityCalLowId = 19, densityCalHighId = 20, aId = 21, bId = 22, cId = 23, dId = 24},
};

--���õ�λ
function set_unit()
    local Unite = get_text(RANGE_SET_SCREEN, UniteSetTextId);
    --�������ý�����,�ؼ�Id = 300 ~ 302Ϊ��λ��ʾ�ı�
    for i = 300,302,1 do 
        set_text(RANGE_SET_SCREEN, i, Unite);
    end
    --��ҳ��,�ռ�Id= 19 Ϊ��λ��ʾ
    set_text(MAIN_SCREEN,LastResultUnitId, Unite);

    --����ѡ�������,�ؼ�Id = 15/20/25Ϊ��λ��ʾ�ı�
    set_text(RANGE_SELECT_SCREEN,15 , Unite);
    set_text(RANGE_SELECT_SCREEN,20 , Unite);
    set_text(RANGE_SELECT_SCREEN,25 , Unite);
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function range_set_control_notify(screen,control,value)
    if(control == UniteSetMenuId) then --���õ�λ
        set_unit();
    elseif control == 50 then --���水ť
        WriteProcessFile(3);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ����ѡ��
--------------------------------------------------------------------------------------------------------------------]]

Range1Id = 1;--����1��ťId
Range2Id = 2;--����2��ťId
Range3Id = 3;--����3��ťId
RangeSelectItem = 1;

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function range_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function range_select_control_notify(screen, control, value)

    if control >= Range1Id and control <= Range3Id then--����ѡ��ť
        RangeSelectItem = control;
    elseif control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
        set_text(DestScreen, DestControl, RangeSelectItem);
    elseif control == CancelButtonId then--ȡ����ť
        change_screen(DestScreen);
    end
end


--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_range_select ()
    set_text(RANGE_SELECT_SCREEN, 4,  get_text(RANGE_SET_SCREEN,RangeTab[1].LowId));
    set_text(RANGE_SELECT_SCREEN, 5, get_text(RANGE_SET_SCREEN,RangeTab[1].HighId));
    set_text(RANGE_SELECT_SCREEN, 6,  get_text(RANGE_SET_SCREEN,RangeTab[2].LowId));
    set_text(RANGE_SELECT_SCREEN, 7, get_text(RANGE_SET_SCREEN,RangeTab[2].HighId));
    set_text(RANGE_SELECT_SCREEN, 8,  get_text(RANGE_SET_SCREEN,RangeTab[3].LowId));
    set_text(RANGE_SELECT_SCREEN, 9, get_text(RANGE_SET_SCREEN,RangeTab[3].HighId));
end


--[[-----------------------------------------------------------------------------------------------------------------
    �ֶ�����1
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
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function hand_operate1_control_notify(screen, control, value)
    if get_value(screen,control) == DISABLE then--˲�䰴ť��������θú���, ���Ӹ��ж�ʹ�õڶ��ε��ú���������˳�
        return;
    end
    if control == HandOpenValve11BtId then--���Ʒ�11
            on_uart_send_data(uartSendTab.openV11, NO_NEED_REPLY);
    elseif control == HandCloseValve11BtId then
        on_uart_send_data(uartSendTab.closeV11, NO_NEED_REPLY);
    elseif control == HandOpenValve12BtId then--���Ʒ�12
        on_uart_send_data(uartSendTab.openV12, NO_NEED_REPLY);
    elseif control == HandCloseValve12BtId then--���Ʒ�12
        on_uart_send_data(uartSendTab.closeV12, NO_NEED_REPLY);
    elseif control == HandValcoCtrlId then--����ʮͨ��
        uartSendTab.openValco[2] = tonumber( get_text(screen, HandValcoChnlId) );
        on_uart_send_data(uartSendTab.openValco, NO_NEED_REPLY);
    elseif control == HandInject1SendId  then--����ע���
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
--�ֶ�����-����ע���1
--sta: 0-��λ; 1-�ƶ���ָ��λ��
--***********************************************************************************************
function hand_control_inject1(sta)
    if UartArg.lock == LOCKED then
        return;
    end

    if UartArg.reply_sta == SEND_FAIL and Sys.processStep >= 2 then
        Sys.processStep = 4;
        Sys.waitTimeFlag = RESET;
    end

    if Sys.processStep == 1 then--��һ��: ʹ��ע���
        enable_inject1();
        ShowSysCurrentAction("�ֶ�����-�ƶ�ע���");
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 2 then --�ڶ���:����ע����ٶ�
        set_inject1_speed( tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1SpdId)) );
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then --������:�ƶ�ע��õ�ָ��λ��
        Sys.waitTimeFlag = SET;
        Sys.waitTime = tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1WaitTimeId));
        start_timer(2, Sys.waitTime * 1000, 1, 1); --������ʱ��2����ʱʱ��8s,1->��ʾִֻ��һ��
        if sta == 0 then
            move_inject1_to( 0 );
        else
            move_inject1_to( tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1ScaleId)) * 10 );
        end
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 4 and Sys.waitTimeFlag == RESET then --���Ĳ�:���̽���
        ShowSysCurrentAction(TipsTab[Sys.language].null);
        set_value(HAND_OPERATE1_SCREEN, HandInject1SendId, DISABLE);
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    �ֶ�����2
--------------------------------------------------------------------------------------------------------------------]]
HandGetVoltageId = 74;
HandLedCurrentTextId = 43;
HandSetLedCurrentId = 72;
HandShowVoltageId = 42;
HandLedStatusId = 6;
HandLedCtrlBtId = 3;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function hand_operate2_control_notify(screen,control,value)
    if get_value(screen,control) == DISABLE then--˲�䰴ť��������θú���, ���Ӹ��ж�ʹ�õڶ��ε��ú���������˳�
        return;
    end
    if control == HandGetVoltageId then--��ȡ��ѹ
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
    elseif control == HandLedCtrlBtId then--����led�ƿ��ذ�ť
        if get_text(HAND_OPERATE2_SCREEN, HandLedStatusId) == LedStatus[ Sys.language ].open then--��
            on_uart_send_data(uartSendTab.openLed, NO_NEED_REPLY);
        else
            on_uart_send_data(uartSendTab.closeLed, NO_NEED_REPLY);
        end
    end
end
--***********************************************************************************************
--�ֶ�����-�ֶ����õ���
--sta: 0-��λ; 1-�ƶ���ָ��λ��
--***********************************************************************************************
function hand_set_led_current()
    if UartArg.lock == LOCKED then
        return;
    end
    
    if Sys.processStep == 1 then--��һ��: ���ʹ���ָ������LED����
        ShowSysCurrentAction("�ֶ�����-����LED����");
        local ledCurrentValue = tonumber( get_text(HAND_OPERATE2_SCREEN, HandLedCurrentTextId) );
        ledCurrentValue = ledCurrentValue * 2048 / 50;
        ledCurrentValue = math.floor(ledCurrentValue + 0.5);--��������
        uartSendTab.setLedCurrnet[4] = math.modf( ledCurrentValue / 256 );
        uartSendTab.setLedCurrnet[5] = math.fmod( ledCurrentValue , 256 );
        on_uart_send_data(uartSendTab.setLedCurrnet, NO_NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 2 then--�ڶ���: ������ѹֵ��������ʾ
        set_value(HAND_OPERATE2_SCREEN, HandSetLedCurrentId, DISABLE);
        set_enable(HAND_OPERATE2_SCREEN, HandSetLedCurrentId, ENABLE);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then--������:����
        ShowSysCurrentAction(TipsTab[Sys.language].null);
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end
end
--***********************************************************************************************
--�ֶ�����-�ֶ���ȡƫ�õ�ѹ
--sta: 0-��λ; 1-�ƶ���ָ��λ��
--***********************************************************************************************
function hand_get_voltage()
    if UartArg.lock == LOCKED then
        return;
    end
    
    if Sys.processStep == 1 then--��һ��: ���ʹ���ָ���ȡ��ѹ
        ShowSysCurrentAction("�ֶ�����-��ȡ��ѹ");
        on_uart_send_data(uartSendTab.getVoltage, NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 2 then--�ڶ���: ������ѹֵ��������ʾ
        local vol = "time out";
        if UartArg.reply_sta == SEND_OK then
            vol = (UartArg.recv_data[3] * 256 + UartArg.recv_data[4]) / 10;
        end
        set_enable(HAND_OPERATE2_SCREEN, HandGetVoltageId, ENABLE);
        set_value(HAND_OPERATE2_SCREEN, HandGetVoltageId, DISABLE);
        set_text(HAND_OPERATE2_SCREEN, HandShowVoltageId, vol);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then--������:����
        ShowSysCurrentAction(TipsTab[Sys.language].null);
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    �ֶ�����3
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    �ֶ�����4
--------------------------------------------------------------------------------------------------------------------]]
--��Ȼ����Ϊ�ֶ�����4, ��ʵ��ͨѶ��¼����

UartRecordId = 1--����ͨѶ��¼�ռ�id




--[[-----------------------------------------------------------------------------------------------------------------
    �������
--------------------------------------------------------------------------------------------------------------------]]
IOSET_TextStartId = 1;
IOSET_TextEndId = 13;
IOSET_ComputerSetId = 25;
IOSET_TouchScreenSetId = 26;
IOSET_Output1SetId = 27;
IOSET_Output2SetId = 30;
IOSET_ScreenBaudId = 7;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function in_out_control_notify(screen,control,value)
    if control == IOSET_ComputerSetId then

    elseif control == IOSET_TouchScreenSetId then
        uart_set_baudrate(tonumber(get_text(IN_OUT_SCREEN, IOSET_ScreenBaudId)) );
    elseif control == IOSET_Output1SetId then

    elseif control == IOSET_Output2SetId then
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    ������У׼����������־��¼
--------------------------------------------------------------------------------------------------------------------]]
HistoryRecordId = 32;--��ʷ��¼�ؼ�Id�ţ�������У׼����������־���������

--***********************************************************************************************
--  ���һ����ʷ��¼
-- screen:����һ���������ʷ��¼�ؼ��������
--***********************************************************************************************
function add_history_record(screen)
    local record_count;
    if screen == HISTORY_ANALYSIS_SCREEN then--��ӷ�����¼
        record_count =  record_get_count(screen, HistoryRecordId);
        record_count = record_count + 1;
        record_add(screen, HistoryRecordId, record_count..";"..--���
            Sys.resultTime.year..Sys.resultTime.mon..Sys.resultTime.day..";"..--����
            Sys.resultTime.hour..Sys.resultTime.min..";"..--ʱ��
            Sys.result..";"..Sys.signalE1..";"..Sys.signalE2..";".."1");
    elseif screen == HISTORY_CALIBRATION_SCREEN then--���У׼��¼
        record_count =  record_get_count(screen, HistoryRecordId);
        record_count = record_count + 1;
        record_add(screen, HistoryRecordId, record_count..";"..
            Sys.resultTime.year..Sys.resultTime.mon..Sys.resultTime.day..";"..--����
            Sys.resultTime.hour..Sys.resultTime.min..";"..--ʱ��
            Sys.result..";"..Sys.signalE1..";"..Sys.signalE2..";".."1");
    elseif screen == HISTORY_ALARM_SCREEN then--��ӱ�����¼
        record_count =  record_get_count(screen, HistoryRecordId);
        record_count = record_count + 1;
        record_add(screen, HistoryRecordId, record_count..";"..
            Sys.dateTime.year..Sys.dateTime.mon..Sys.dateTime.day..";"..--����
            Sys.dateTime.hour..Sys.dateTime.min..";"..--ʱ��
            Sys.alarmContent.."; ");
    elseif screen == HISTORY_LOG_SCREEN then --�����־��¼
        record_count =  record_get_count(screen, HistoryRecordId);
        record_count = record_count + 1;
        record_add(screen, HistoryRecordId, record_count..";"..
            Sys.dateTime.year..Sys.dateTime.mon..Sys.dateTime.day..";"..--����
            Sys.dateTime.hour..Sys.dateTime.min..";"..--ʱ��
            Sys.logContent..";"..Sys.userName);
    end
end




--[[-----------------------------------------------------------------------------------------------------------------
    ϵͳ��Ϣ
--------------------------------------------------------------------------------------------------------------------]]
maintainerPwdSetId = 14;
administratorPwdSetId = 15;
EquipmentTypeSetId = 1;
EquipmentTypeTextId = 900;--ÿ�������е������ͺ�id����900
OperatorLoginId = 16;
maintainerLoginId = 17;
administratorLoginId = 18;
pwdRecordId = 13;--���ڱ�������ļ�¼�ؼ�


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

--���������ͺ�
function set_equipment_type()
    for i = 1,16,1 do
        set_text(PublicTab[i], EquipmentTypeTextId, get_text(SYSTEM_INFO_SCREEN,EquipmentTypeSetId));
    end
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function system_info_control_notify(screen,control,value)
    if control == EquipmentTypeSetId then--���������ͺ�
        set_equipment_type();
    elseif control == maintainerPwdSetId then--��άԱ��������
        set_user_name(SysUser[Sys.language].maintainer);--���������޸Ľ�����û���
    elseif control == administratorPwdSetId then--����Ա��������
        set_user_name(SysUser[Sys.language].administrator);--���������޸Ľ�����û���
    elseif control == OperatorLoginId then --����Ա��¼
        SetSysUser(SysUser[Sys.language].operator);
    elseif control == maintainerLoginId then--��άԱ��¼
        set_user_name(SysUser[Sys.language].maintainer);--���õ�¼������û���
        change_screen(LOGIN_SYSTEM_SCREEN);
    elseif control == administratorLoginId then--����Ա��¼
        set_user_name(SysUser[Sys.language].administrator);--���õ�¼������û���
        change_screen(LOGIN_SYSTEM_SCREEN);
    elseif control == SetChineseId then--����Ϊ����
        Sys.language = CHN;
        set_value(SYSTEM_INFO_SCREEN, SetChineseId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, SetEnglishId, DISABLE);
    elseif control == SetEnglishId then--����ΪӢ��
        Sys.language = ENG;
        set_value(SYSTEM_INFO_SCREEN, SetChineseId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, SetEnglishId, ENABLE );
    end
end

--***********************************************************************************************
--  ����ϵͳ�û�
--***********************************************************************************************
function SetSysUser(user)
    
    Sys.userName = user;
    
    --�ڵײ���״̬�û���
    for i = 1,16,1 do
        set_text(PublicTab[i], SysUserNameId, user);
    end

    if Sys.userName == SysUser[Sys.language].operator then -- ����Ա
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, DISABLE);
        set_process_edit_state(DISABLE);--��ֹ��������
    elseif Sys.userName == SysUser[Sys.language].maintainer then--��άԱ
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, DISABLE);
        set_process_edit_state(ENABLE);--����༭����
    elseif Sys.userName == SysUser[Sys.language].administrator then--����Ա
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, ENABLE);
        set_process_edit_state(ENABLE);--����༭����
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������
--------------------------------------------------------------------------------------------------------------------]]

UserNameId = 1; --������������ϵͳ��¼���涼�Ǹ�id
OldPwdId = 2;
NewPwdId = 3;
NewPwdConfirmId = 4;
OldPwdTipsId = 5;
NewPwdConfirmTipsId = 6;
NewPwdLenTipsId = 7;
PwdRecordPosition = 0;--�ñ���ȡֵ0����1; 0��ʾ��ά��������ʷ�����е�λ��,1��ʾ����Ա�����ڼ�¼�ռ��е�λ��
--***********************************************************************************************
--��ϵͳ��Ϣ����,���Ȩ�޵�¼������������ʱ������øú���(Ȩ�޵�¼->����Ա����)
--***********************************************************************************************
function set_user_name(user)
    userNameSet = user; --userNameSet: �ڽ����л���ϵͳ��¼��������������ý���ʱ,�ñ�����������Ҫ�������û���.
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function password_set_control_notify(screen,control,value)

    local oldPwdInput = get_text(PASSWORD_SET_SCREEN, PwdId);--��ȡ����

    ------------------------ȷ�ϰ�ť-----------------------------------------------------
    if control == SureButtonId then
        if oldPwdInput == record_read(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition) and --������������ȷ
           get_text(PASSWORD_SET_SCREEN, NewPwdId) == get_text(PASSWORD_SET_SCREEN, NewPwdConfirmId) and--��������������һ��
           string.len(get_text(PASSWORD_SET_SCREEN, NewPwdId)) == 6 then
            password = get_text(PASSWORD_SET_SCREEN, NewPwdId);
            record_modify(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition, password);--�޸ļ�¼
            change_screen(SYSTEM_INFO_SCREEN);
        elseif oldPwdInput ~= record_read(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition) then--��ʾ"�������"
            set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 1);
        elseif string.len(get_text(PASSWORD_SET_SCREEN, NewPwdId)) ~= 6 then--��ʾ"������Ϊ6λ����"
            set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 1);
            set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 0);
        elseif get_text(PASSWORD_SET_SCREEN, NewPwdId) ~= get_text(PASSWORD_SET_SCREEN, NewPwdConfirmId) then--��ʾ"������������벻һ��"
            set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 1);
            set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 0);
        end
    ------------------------ȡ����ť-----------------------------------------------------
    elseif control == CancelButtonId then
        change_screen(SYSTEM_INFO_SCREEN);
    ------------------------�������������-------------------------------------------------
    elseif control == OldPwdId then
        if oldPwdInput ~= record_read(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition) then--�������벻��ȷ
            set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 1);--��ʾ���������ʾ��Ϣ
        else
            set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 0);
        end
    elseif control == NewPwdId then --����������
        if string.len(get_text(PASSWORD_SET_SCREEN,NewPwdId)) ~= 6 then
            set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 1);--��ʾ"������Ϊ6λ����"
            set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 0);
        else
            set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 0);
        end
    elseif control == NewPwdConfirmId then--ȷ��������
        if get_text(PASSWORD_SET_SCREEN, NewPwdId) ~= get_text(PASSWORD_SET_SCREEN, NewPwdConfirmId) then
            set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 1);--��ʾ"������������벻һ��"
            set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 0);
        else
            set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 0);
        end
    end
end


--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_PasswordSet()
    set_text(PASSWORD_SET_SCREEN, UserNameId, userNameSet);
    set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 0);--����"�������"
    set_visiable(PASSWORD_SET_SCREEN, NewPwdConfirmTipsId, 0);--����"������������벻һ��"
    set_visiable(PASSWORD_SET_SCREEN, NewPwdLenTipsId, 0);--����"������Ϊ6λ����"
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
��¼ϵͳ
--------------------------------------------------------------------------------------------------------------------]]
PwdId = 2;
PwdTipsId = 3;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function login_system_control_notify(screen,control,value)
    local pwdInput = get_text(LOGIN_SYSTEM_SCREEN, PwdId);--��ȡ����

    if control == SureButtonId then--ȷ�ϰ���
        if pwdInput == record_read(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition) then--��άԱ����������ȷ
            SetSysUser(userNameSet);
            change_screen(SYSTEM_INFO_SCREEN);
        else
            set_visiable(LOGIN_SYSTEM_SCREEN, PwdTipsId, 1);--��ʾ���������ʾ��Ϣ
        end
    elseif control == CancelButtonId then--ȡ������
        SetSysUser(Sys.userName);
        change_screen(SYSTEM_INFO_SCREEN);
    elseif control == PwdId then --��������
        if pwdInput ~= record_read(SYSTEM_INFO_SCREEN, pwdRecordId, PwdRecordPosition) then--�������벻��ȷ
            set_visiable(LOGIN_SYSTEM_SCREEN, PwdTipsId, 1);--��ʾ���������ʾ��Ϣ
        else
            set_visiable(LOGIN_SYSTEM_SCREEN, PwdTipsId, 0);
        end
    end
end

--�������л�Ϊ��¼ϵͳ����ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_LoginSystem()
    set_text(LOGIN_SYSTEM_SCREEN, UserNameId, userNameSet);
    set_visiable(LOGIN_SYSTEM_SCREEN, PwdTipsId, 0);--�������������ʾ��Ϣ
    set_text(LOGIN_SYSTEM_SCREEN, PwdId, "");

    if userNameSet == SysUser[Sys.language].maintainer then
        PwdRecordPosition = 0;
    elseif userNameSet == SysUser[Sys.language].administrator then
        PwdRecordPosition = 1;
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
����wifi
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
    elseif control >= 27 and control <= 40 then--ѡȡ�ȵ�
        Sys.ssid = get_text(WIFI_CONNECT_SCREEN, (control-14)) --�ı��ؼ���13~26
        set_text(WIFI_CONNECT_SCREEN, WifiSsid, Sys.ssid)
    elseif control == WifiConnectBtId then
        if string.len(Sys.ssid) > 0 then
            Sys.ssid = get_text(WIFI_CONNECT_SCREEN, WifiSsid);
            wifiPwd = get_text(WIFI_CONNECT_SCREEN, WifiPwdId);
            set_wifi_cfg(1, 0, Sys.ssid, wifiPwd) --���� WIFI��1 ����ģʽ��0 �Զ�ʶ�����
            save_network_cfg();
            set_text(WIFI_CONNECT_SCREEN, WifiStatusTextId,' ������...')
        end
    end
end

--�л���wifi���ӽ���
function goto_WifiConnect()
    scan_ap_fill_list();
end


--ɨ��wifi����ʾ
function scan_ap_fill_list()
    ap_cnt = scan_ap()  --ɨ������ȵ�

	for i=1,ap_cnt,1 do
	  Sys.ssid, Sys.security, Sys.quality = get_ap_info(i-1)  --��ȡ��Ϣ
	  set_text(WIFI_CONNECT_SCREEN, i+12, Sys.ssid)  --��ʾid
	end
	
	for i=ap_cnt+1, 14, 1 do
	   set_text(WIFI_CONNECT_SCREEN, i+12, "")  --��պ����
	end
end

--[[-----------------------------------------------------------------------------------------------------------------
Զ������
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

--��Զ���������棬�����ؼ����øú���
function remote_update_control_notify(screen,control,value)
    if control == RemoteGetTsVerBtId then--��ȡ�������汾�ļ�
        http_download(1, 'http://'..get_text(REMOTE_UPDATE_SCREEN,RemoteFtpAddrTextId)..'/tsVer.txt', "tsVer.txt");
    elseif control == RemoteStartUpdateTsBtId then--��ʼ����������
        --�ж�Ȩ��
        if Sys.userName == SysUser[Sys.language].operator then
            set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, TipsTab[Sys.language].NoPermission)
            return
        end
        --�ж�ϵͳ�Ƿ�Ϊֹͣ״̬
        if Sys.status ~= WorkStatus[Sys.language].stop then 
            set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, TipsTab[Sys.language].stopFirst)
            return
        end
        --��ʼ��������������(��on_systick�л�ȡ����״̬������ʾ)
        start_upgrade('ftp://'..get_text(REMOTE_UPDATE_SCREEN,RemoteFtpAddrTextId)..'/DCIOT.PKG');
    elseif control == RemoteGetDrvVerBtId then--��ȡ�����汾�ļ�
        http_download(2, 'http://'..get_text(REMOTE_UPDATE_SCREEN,RemoteFtpAddrTextId)..'/drvVer.txt', "drvVer.txt");
    elseif control == RemoteStartUpdateDrvBtId and Sys.hand_control_func == nil then--��ȡ�����ļ�
        --�ж�Ȩ��
        if Sys.userName == SysUser[Sys.language].operator then
            set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, TipsTab[Sys.language].NoPermission)
            return
        end
        --�ж�ϵͳ�Ƿ�Ϊֹͣ״̬
        if Sys.status ~= TipsTab[Sys.language][Sys.language].stop then 
            set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, TipsTab[Sys.language].stopFirst)
            return
        end
        --����STM.BIN�ļ�,��on_http_download�������ж�����״̬
        http_download(3, 'http://'..get_text(REMOTE_UPDATE_SCREEN,RemoteFtpAddrTextId)..'/STM.BIN', "STM.BIN");
    end
end


--http_download�ص�����,ϵͳ�Զ�����
function on_http_download (taskid, status)
    if taskid == 1 then --���ش������汾�ļ��ص�����
		if status == 0 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, TipsTab[Sys.language].getVerFileFail)
        elseif status == 1 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, TipsTab[Sys.language].saveVerFileFail)
		elseif status == 2 then
			local verFile = io.open("tsVer.txt", "r");        --��ֻ����ʽ���ļ�.
            if verFile == nil then
                set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, TipsTab[Sys.language].openVerFileFail)
                return 
            end
            local ts_version = verFile:read("a");      --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
            verFile:close();                           --�ر��ļ�
            set_text(REMOTE_UPDATE_SCREEN, RemoteTsVerTextId, ts_version);
        end
    elseif taskid == 2 then--���������汾�ļ��ص�����
        if status == 0 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, TipsTab[Sys.language].getVerFileFail)
        elseif status == 1 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, TipsTab[Sys.language].saveVerFileFail)
        elseif status == 2 then
            local verFile = io.open("drvVer.txt", "r");        --��ֻ����ʽ���ļ�.
            if verFile == nil then
                set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, TipsTab[Sys.language].openVerFileFail)
                return
            end
            local ts_version = verFile:read("a");      --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
            verFile:close();                           --�ر��ļ�
            set_text(REMOTE_UPDATE_SCREEN, RemoteDrvTextId, ts_version);
        end
    elseif taskid == 3 then--�������������ļ��ص�����
        if status == 0 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].getFirmwareFail)
        elseif status == 1 then
            set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].saveFirmwareFail)
        elseif status == 2 then
            --STM.BIN�ļ����سɹ�, ׼�������ļ��ְ��·���������
            set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].saveFirmwareOk)
            --ִ����������������
            Sys.binIndex = 0;
            Sys.hand_control_func = UpdataDriverBoard;
        end
    end
end

--***********************************************************************************************
--  ����������
--***********************************************************************************************
function UpdataDriverBoard()
    if UartArg.lock == LOCKED then
        return;
    end

    --�ж�sd���Ƿ���STM.BIN�ļ�
    drvFile = io.open("STM.BIN", "rb");
    if drvFile == nil then
        set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].openFirmwareFail)
        return 
    end
    --��ȡ�ļ�����(����ʱʹ��)
    local fileLen = drvFile:seek("end");

    local dataLen = 0;
    local offset = Sys.binIndex * 1024;

    --�ж��ļ��Ƿ������
    if offset > fileLen then
        drvFile:close()
        set_text(REMOTE_UPDATE_SCREEN, RemoteUpdateDrvStaId, TipsTab[Sys.language].sendFirmwareOk)
        print("�������ݷ������")
        Sys.hand_control_func = nil;
        return;
    end
    --�����ļ�����λ��
    drvFile:seek("set", offset)
    binCode = {};
    --�ӵ�ǰλ�ö�ȡ1k����
    charCode = drvFile:read(1024);
    --����ȡ����1k���ݽ��и�ʽת��
    for i=1,1024,1 do
        binCode[i+5] = string.byte(charCode,i,i)
    end
    --�������ݳ���,����������ݰ���ͷ����6������,������β��������CRC����
    dataLen = #binCode + 1;
    --ΪbinCode�������ͷ����β����CRC,����һ����ɵĴ������ݰ�
    binCode[0] = 0xD0;
    binCode[1] = 0x10;
    binCode[2] = 0x30;--math.modf( Sys.binIndex/256 ) + 0x30;
    binCode[3] = math.fmod( Sys.binIndex, 256 )       --0x3000��ʼ��ʾ�����������ݵĵ�0����, ox3001��ʾ�����������ݵĵ�1����(���֧�ִ���256k������)
    binCode[4] = math.modf( (dataLen-6)/256 )
    binCode[5] = math.fmod( (dataLen-6),256 )

    uartSendTab.updateDrv = binCode;
    uartSendTab.updateDrv.len = dataLen;
    uartSendTab.updateDrv.note = TipsTab[Sys.language].updateDrvBd;
    on_uart_send_data(uartSendTab.updateDrv, NEED_REPLY);--�ڵ���ʱ����ʹ��NO_NEED_REPLY����,�����Ϳ��Բ��õȴ��ظ�

    Sys.binIndex = Sys.binIndex + 1;

    --�ر��ļ�
    drvFile:close();
end


--[[-----------------------------------------------------------------------------------------------------------------
    �����ļ�������غ���
--------------------------------------------------------------------------------------------------------------------]]

cfgFileTab = {
    [1] = {sTag = "<ProcessSet>",eTag = "</ProcessSet>"};--��������1�����еĲ������������tag��
    [2] = {sTag = "<RunControl>",eTag = "</RunControl>"};--���п��ƽ����еĲ������������tag��
    [3] = {sTag = "<RangeSet>",eTag = "</RangeSet>"};--�������ý����еĲ������������tag��
    [4] = {sTag = "<IOSet>",eTag="</IOSet>"};--�������еĲ������������tag��
};
--***********************************************************************************************
--���������ļ�,��������"0"�ļ���
--tagNum = 1 : �޸���������1�����еĲ��� 
--tagNum = 2 : �޸����п��ƽ����еĲ���
--tagNum = 2 : ���п��ƽ����еĲ���
--***********************************************************************************************
function WriteProcessFile(tagNum)

    local configFile = io.open("0", "a+");        --�Կɶ���д��ʽ���ı�,���ļ��������򴴽��ļ�.
    configFile:seek("set");                       --���ļ�λ�ö�λ����ͷ
    local fileString = configFile:read("a");      --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
    configFile:close();                           --�ر��ļ�

    configFile = io.open("0", "w+");              --�򿪲���ո��ļ�
    fileString = DeleteSubString(fileString, cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);--ɾ��ָ���ı�ǩ����
    configFile:write(fileString);                 --���������ԭ�ļ���������д���ļ�
    configFile:write(cfgFileTab[tagNum].sTag);

    if tagNum == 1 then--��������1�����еĲ���
        for i=1,12,1 do
            configFile:write(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId)..",".. --��������ѡ��
                             get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId)..","..   --��������
                             get_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId)..",");  --��������
        end
    elseif tagNum == 2 then--���п��ƽ����еĲ���
        for i = RUNCTRL_TextStartId, RUNCTRL_TextEndId,1 do
            configFile:write(get_text(RUN_CONTROL_SCREEN,i)..",");
        end
    elseif tagNum == 3 then--�������ý����еĲ���
        for i = RANGESET_TextStartId, RANGESET_TextEndId, 1 do
            configFile:write(get_text(RANGE_SET_SCREEN, i)..",");
        end
    elseif tagNum == 4 then
        for i = IOSET_TextStartId,IOSET_TextEndId,1 do
            configFile:write(get_text(IN_OUT_SCREEN, i)..",");
        end
    end
    configFile:write(cfgFileTab[tagNum].eTag);
    configFile:close(); --�ر��ı�
end

--***********************************************************************************************
--��ȡ�����ļ��е���������
--***********************************************************************************************
function ReadProcessFile()
    ReadProcessTag(1);
    ReadProcessTag(2);
    ReadProcessTag(3);
end

--***********************************************************************************************
--��ȡ�����ļ��е�����
--tagNum = 1 : ��ȡ��������1�����еĲ��� 
--tagNum = 2 : ��ȡ���п��ƽ����еĲ���
--tagNum = 3 : ��ȡ�������ý����еĲ���
--***********************************************************************************************
function ReadProcessTag(tagNum)
	local configFile = io.open("0", "r")      --���ı�
    if configFile == nil then--���û�и��ļ��򷵻�
        --����һ��Ĭ�������ļ�
        WriteProcessFile(1);
        WriteProcessFile(2);
        WriteProcessFile(3);
        return;
    end
	configFile:seek("set")                        --���ļ�λ�ö�λ����ͷ
	local fileString = configFile:read("a")       --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
	configFile:close()                            --�ر��ı�
    
    tagString = GetSubString(fileString, cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);--��ȡ��ǩ֮����ַ���
    if tagString == nil then--����ļ���û�иñ�ǩ,�򷵻�.
        return 
    end
    local tab = split(tagString, ",")--���������ַ��������ŷָ�,���Դ˴���tab��
    if tagNum == 1 then--�������ý����еĲ���
        for i=1,12,1 do
            set_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId, tab[(i-1)*3+1]);  --��������ʾ���ı�����
            set_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId,   tab[(i-1)*3+2]);  --��������ʾ���ı�����
            set_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId,  tab[(i-1)*3+3]);  --��������ʾ���ı�����
        end

    elseif tagNum == 2 then--���п��ƽ����еĲ���
        
        --���ļ��еĲ����ڽ����Ͻ��н���
        for i = RUNCTRL_TextStartId, RUNCTRL_TextEndId,1 do
            set_text(RUN_CONTROL_SCREEN, i, tab[i]);
        end
        --���ļ��еĲ�����ֵ����Ӧ�ı���
        Sys.runType = tab[RunTypeID];
        HandProcessTab[1].processId = get_process_Id(tab[HandProcessTab[1].textId]);
        HandProcessTab[1].times = tonumber(tab[HandProcessTab[1].TimesId]);
        for i = 1,4,1 do
            PeriodicTab[i].processId = get_process_Id(tab[i]);
        end
        for i = 5,10,1 do
            PeriodicTab[i].value = tonumber(tab[i+27]);--�������̵�ʱ���Ǵ�32��ʼ,������Ҫ i+27
        end
        for i = 1,24,1 do
            TimedProcessTab[i].processId = get_process_Id(tab[i+4]);--��ʱ���̵��ı�id��5��ʼ,����Ҫ i+4
            TimedProcessTab[i].startHour = tonumber(get_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].startHourId));
            TimedProcessTab[i].startMinute = tonumber(get_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].startMinuteId));
        end
    elseif tagNum == 3 then--�������ý����еĲ���
        for i = RANGESET_TextStartId, RANGESET_TextEndId, 1 do
            set_text(RANGE_SET_SCREEN, i, tab[i]);
        end
    elseif tagNum == 4 then
        for i = IOSET_TextStartId, IO_TextEndId, 1 do
            set_text(IN_OUT_SCREEN, i, tab[i]);
        end
    end
end

--***********************************************************************************************
--�ú�����������ļ����Ƿ���<action?>��ǩ, ? ��Χ1~12. ���û�иñ�ǩ,�򴴽�һ��Ĭ�ϵ�����,�������ֱ�ӷ���
--actionNumber:������ǩ,��Χ:action1~action24
--***********************************************************************************************
function WriteDefaultActionTag(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcesstypeId);--��ȡ��������
    local fileName = 0;

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            fileName = i;
            break;
        end
    end
    WriteActionTag(fileName, 0);--�޸�<action0>��ǩ�е�����, ���ӻ���ɾ��һ������
    
    local processFile = io.open(fileName, "a+");   --�Կɶ���д�ķ�ʽ���ı�,���û�и��ļ��򴴽�
    processFile:seek("set");                       --���ļ�λ�ö�λ����ͷ
    local fileString = processFile:read("a");      --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
    processFile:close();                           --�ر��ļ�

    --����������ļ��Ѿ���<action?>��ǩ,��ֱ�ӷ���
    if string.find( fileString, "<action"..actionNumber..">", 1) ~= nil then
        return;
    end

    --����������ļ��Ѿ�û��<action?>��ǩ,�����ִ��,����һ��Ĭ�ϵı�ǩ
    WriteActionTag(fileName, actionNumber);
end

--***********************************************************************************************
--������д�������ļ���,���ļ���WriteProcessFile�е���
--fileName:�����ļ�����:��Χ:1-12,��Ӧ12������(ÿ�����̶�Ӧһ�������ļ�)
--actionNumber:������ǩ,��Χ:action0~action24
--***********************************************************************************************
function WriteActionTag(fileName, actionNumber)
    local actionFile = io.open(fileName, "a+");   --�Կɶ���д�ķ�ʽ���ı�,���û�и��ļ��򴴽�
    actionFile:seek("set");                       --���ļ�λ�ö�λ����ͷ
    local fileString = actionFile:read("a");      --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
    actionFile:close();                           --�ر��ļ�

    actionFile = io.open(fileName, "w+");         --�򿪲���ո��ļ�
    fileString = DeleteSubString(fileString, "<action"..actionNumber..">", "</action"..actionNumber..">");--��ԭ����<action?>-</action?>��ǩ֮����ַ���ɾ��
    actionFile:write(fileString);                 --���������ԭ�ļ�������дд���ļ�

    local actionType, actionName
    if actionNumber == 0 then
        actionType = get_text(PROCESS_SET1_SCREEN, ProcessTab[fileName].typeId);--��ǰ��������
        actionName = get_text(PROCESS_SET1_SCREEN, ProcessTab[fileName].nameId);--��ǰ��������
    elseif actionNumber >= 1 and actionNumber <= 12 then
        actionType = get_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].typeId);--��ȡ��ǰ��������
        actionName = get_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].nameId);--��ȡ��ǰ��������
    elseif actionNumber >= 13 and actionNumber <= 24 then 
        actionType = get_text(PROCESS_SET3_SCREEN, TabAction[actionNumber].typeId);--��ȡ��ǰ��������
        actionName = get_text(PROCESS_SET3_SCREEN, TabAction[actionNumber].nameId);--��ȡ��ǰ��������
    end

    actionFile:write("<action"..actionNumber..">");--д�뿪ʼ��ǩ
    actionFile:write("<type>"..actionType..","..actionName.."</type>");--д�붯�������붯������(����������������):��ʼ��/ע���/����......
    actionFile:write("<content>");
    --------------------------------д<action0>��ǩ����---------------------------------------------
    --<action0>��ǩ����Ķ��Ǹ�������,��Ӧ����������2/3�����еĶ���ѡ��/��������
    if actionNumber == 0 then
        for i=1,12,1 do
            actionFile:write(get_text(PROCESS_SET2_SCREEN, TabAction[i].typeId)..",".. --��������ѡ��
                              get_text(PROCESS_SET2_SCREEN, TabAction[i].nameId  )..","); --��������
        end
        for i=13,24,1 do
            actionFile:write(get_text(PROCESS_SET3_SCREEN, TabAction[i].typeId)..",".. --��������ѡ��
                              get_text(PROCESS_SET3_SCREEN, TabAction[i].nameId  )..","); --��������
        end
    --------------------------------д��ʼ�������----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][1] then 
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_INIT_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_INIT_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------дȡ���������----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][2] then 
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_INJECT_SCREEN, i)..",");--д�����1��ťֵ
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_INJECT_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------дע��ü�Һ����--------------------------------------------------
    elseif actionType == ActionItem[Sys.language][3] then
        for i = INJECT_ADD_BtStartId, INJECT_ADD_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_INJECT_ADD_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = INJECT_ADD_TextStartId, INJECT_ADD_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_INJECT_ADD_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-��ȡ�źŲ���----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][4] then 
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_READ_SIGNAL_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-�䶯�ü�Һ����--------------------------------------------------
    elseif actionType == ActionItem[Sys.language][5] then 
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_PERISTALTIC_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_PERISTALTIC_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-�������--------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][6] then 
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_CALCULATE_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_CALCULATE_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-�ȴ�ʱ�����----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][7] then 
        actionFile:write(get_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId));
    --------------------------------д-�������--------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][8] then 
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_DISPEL_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_DISPEL_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-����������------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][9] then 
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            actionFile:write(get_value(PROCESS_VALVE_CTRL_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            actionFile:write(get_text(PROCESS_VALVE_CTRL_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-�ղ�������------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][10] then 
        actionFile:write("<content> </content>");
    end
    actionFile:write("</content>");
    actionFile:write("</action"..actionNumber..">");--д�������ǩ
    actionFile:close(); --�ر��ı�
end

--***********************************************************************************************
--���浥�����������ļ�,ÿ�����̶���һ����Ӧ�������ļ�,�ļ���Ϊ�������ڱ���е����
--actionNumber:������ǩ,��Χ:action1~action24
--***********************************************************************************************
function WriteActionFile(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcesstypeId);--��ȡ��������

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            WriteActionTag(i, 0);--�޸�<action0>��ǩ�е�����
            WriteActionTag(i, actionNumber);--�������ݵ��ļ���,�ļ���Ϊ1~12, ���������Ϊaction0~action12��ǩ
        end
    end
end

--***********************************************************************************************
--actionNumber: ����id , �Ӹö�����ʼ,֮��Ķ���������+1����-1�Ĳ���
--flag 1=�Ӳ���, 2=������
--***********************************************************************************************
function ChangeActionFileTag(actionNumber, flag)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcesstypeId);--��ȡ��������
    local fileName;
    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            WriteActionTag(i, 0);--������������2/3�������ʾ��,���޸�<action0>��ǩ�е�����
            fileName = i;
        end
    end

    local actionFile = io.open(fileName, "a+");   --�Կɶ���д�ķ�ʽ���ı�,���û�и��ļ��򴴽�
    actionFile:seek("set");                       --���ļ�λ�ö�λ����ͷ
    local fileString = actionFile:read("a");      --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
    actionFile:close();                           --�ر��ļ�

    --�ַ��滻;1��ʾ��Ҫ�Զ������мӲ���,��ʱִ�е��ǲ��붯��,
    if flag == 1 then
        fileString = DeleteSubString(fileString, "<action24>", "</action24>");--ɾ��ָ���ı�ǩ����
        for i = 23, actionNumber, -1 do
            fileString = string.gsub(fileString, "action"..i, "action"..(i+1));
        end
    else--2��ʾ��Ҫ�Զ�����ǩ���м�����,��ʱִ�е���ɾ������
        fileString = DeleteSubString(fileString, "<action"..actionNumber..">", "</action"..actionNumber..">");--ɾ��ָ���ı�ǩ����
        for i = actionNumber+1, 24, 1 do
            fileString = string.gsub(fileString, "action"..i, "action"..(i-1));
        end
    end

    actionFile = io.open(fileName, "w+");         --�򿪲���ո��ļ�
    actionFile:write(fileString);                 --���������ԭ�ļ�������дд���ļ�
    actionFile:close();                           --�ر��ļ�
end

--***********************************************************************************************
--�������ļ�����,����ÿ��ֻ��ȡһ����ǩ���ֵ, ����<action1>��ǩ֮���ֵ
--actionNumber:��ǰ����Ϊ�ڼ���
--***********************************************************************************************
function ReadActionTag(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcesstypeId);--��ȡ��������
    local fileName = 0;
    for i=1,12,1 do--ѭ�����ҵ�ǰ�������ƶ�Ӧ�����.
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId),processName ,1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            fileName = i;
            break;
        end
    end
    
    local processFile = io.open(fileName, "r");      --���ı�
    if processFile == nil then--��û�и��ļ�,�򴴽�һ���µ������ļ�,������
        --����������2/3�������
        for i = TabAction[1].typeId,TabAction[12].typeId,1 do
            set_text(PROCESS_SET2_SCREEN, i,BLANK_SPACE);    --����Ӧ����ѡ����ı����
            set_text(PROCESS_SET2_SCREEN, i-100,BLANK_SPACE);--����Ӧ�������Ƶ��ı����
            set_text(PROCESS_SET3_SCREEN, i,BLANK_SPACE);    --����Ӧ����ѡ����ı����
            set_text(PROCESS_SET3_SCREEN, i-100,BLANK_SPACE);--����Ӧ�������Ƶ��ı����
        end
        WriteActionFile(0);
        return
    end

	processFile:seek("set");                        --���ļ�λ�ö�λ����ͷ
	fileString = processFile:read("a");             --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
    processFile:close();                            --�ر��ı�

    actionString = GetSubString(fileString, "<action"..actionNumber..">", "</action"..actionNumber..">");--��ȡfileString�ļ���<action?> ~ </action?>��ǩ֮����ַ���
    if actionString == nil then--����ļ���û�иñ�ǩ,�򷵻�.
        return 
    end
    
    local actionType = GetSubString(actionString, "<type>","</type>");--��ȡactionString�ַ�����<type>��ǩ֮����ַ���,��ȡ����?�����?����??
    actionType = split(actionType, ",");--�ָ��ַ���
    local contentTabStr = GetSubString(actionString,"<content>","</content>");--�ٽ�ȡ<content>��ǩ�е�����
    if contentTabStr == nil then--���û������,�������������2/3�����еĶ���ѡ���붯������
        return;
    end
    local tab = split(contentTabStr, ",");--�ָ��ַ���
    if actionNumber == 0 then --�ж�Ϊ<action0>��ǩ
        for i=1,12,1 do
            set_text(PROCESS_SET2_SCREEN, TabAction[i].typeId, tab[(i-1)*2+1]);  --��������ʾ���ı�����
            set_text(PROCESS_SET2_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]); --��������ʾ���ı�����
        end
        for i=13,24,1 do
           set_text(PROCESS_SET3_SCREEN, TabAction[i].typeId, tab[(i-1)*2+1]);  --��������ʾ���ı�����
           set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]); --��������ʾ���ı�����
        end
    --------------------------------��-��ʼ���������--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][1] then
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            set_value(PROCESS_INIT_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            set_text(PROCESS_INIT_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-����ý������--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][2] then 
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do 
            set_value(PROCESS_INJECT_SCREEN, i, tab[i]);--tab��ǰ17��λ��ťֵ
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do 
            set_text(PROCESS_INJECT_SCREEN, i, tab[i]);--tab��ǰ17��λ��ťֵ
        end
    --------------------------------��-ע��ü�Һ����-------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][3] then
        for i = INJECT_ADD_BtStartId, INJECT_ADD_BtEndId, 1 do
            set_value(PROCESS_INJECT_ADD_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = INJECT_ADD_TextStartId, INJECT_ADD_TextEndId, 1 do
            set_text(PROCESS_INJECT_ADD_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-��ȡ�źŲ���--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][4] then
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            set_text(PROCESS_READ_SIGNAL_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-�䶯�ü�Һ����------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][5] then 
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            set_value(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            set_text(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-�������------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][6] then 
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            set_value(PROCESS_CALCULATE_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            set_text(PROCESS_CALCULATE_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-�ȴ�ʱ�����--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][7] then 
        set_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId, tab[1]);
    --------------------------------��-�������------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][8] then 
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            set_value(PROCESS_DISPEL_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            set_text(PROCESS_DISPEL_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-����������------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][9] then 
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            set_value(PROCESS_VALVE_CTRL_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            set_text(PROCESS_VALVE_CTRL_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    end
end


--***********************************************************************************************
--��ȡ�������������ļ��е�ֵ,��ͳ���ж��ٸ�����
--actionNumber:��ǰ����Ϊ�ڼ���
--***********************************************************************************************
function ReadActionFile(fileName)
    local processFile = io.open(fileName, "r");      --���ı�

    processFile:seek("set");                         --���ļ�λ�ö�λ����ͷ
	Sys.processFileStr = processFile:read("a");--�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
    processFile:close();                             --�ر��ı�

    --ͳ��action����,��SystemArg.actionNumber����,�Լ�SystemArg.actionTab��ֵ ----------------------
    --Sys.actionTab���鳤��Ϊ24,��ʾ���ɼ�¼24��action, ��ֵ������ǵ�ǰ�����Ӧ��action���
    --����SystemArg.actionIdTab[1] = 3, ��ʾ��һ����ִ�����Ϊ3��action, Ҳ��ζ�����Ϊ1/2��actionΪ�ո�(û������)
    local actionString = GetSubString(Sys.processFileStr, "<action0>", "</action0>");--��ȡ�ļ���<action0>��ǩ֮����ַ���
    local typeString = GetSubString(actionString, "<type>","</type>");--��ȡ������������������
    local tab = split(typeString, ",");
    Sys.processType = tab[1];
    Sys.processName = tab[2];
    Sys.rangetypeId = tonumber(get_text(PROCESS_SET1_SCREEN, ProcessTab[fileName].rangeId));
    local contentTabStr = GetSubString(actionString,"<content>","</content>");--�ٽ�ȡ<content>��ǩ�е�����
    tab = split(contentTabStr, ",");--�ָ��ַ���,�����ַ�������tab����
    Sys.actionTotal = 0; 
    for i = 1,24,2 do -- tab��[1][2]�ֱ𱣴���һ������������������,ռ����2��, ����������ͳ��action����,�������ﲽ����Ҫ����Ϊ2
        if tab[i] ~= BLANK_SPACE then--�ж϶������Ͳ�Ϊnil
            Sys.actionTotal = Sys.actionTotal + 1;--action����+1
            Sys.actionIdTab[Sys.actionTotal] = math.modf((i+1)/2);--�������forѭ���Ǵ�1��ʼ,�Ҳ�����2,������Ҫȡ i+1/2 (1,3,5...)
            Sys.actionNameTab[Sys.actionTotal] = tab[i+1];--i+1��Ӧ��(2,4,6...)
        end
    end

    for i = 25,48,2 do
        if tab[i] ~= BLANK_SPACE then
            Sys.actionTotal = Sys.actionTotal + 1;
            Sys.actionIdTab[Sys.actionTotal] = math.modf((i+1)/2);--�������forѭ���Ǵ�1��ʼ,�Ҳ�����2,������Ҫȡ i+1/2
            Sys.actionNameTab[Sys.actionTotal] = tab[i+1];--i+1��Ӧ��(2,4,6...)
        end
    end
end



--***********************************************************************************************
--�ַ����ָ��,str -> ��Ҫ�ָ���ַ���;delimiter->�ָ���
--***********************************************************************************************
function split(str, delimiter)
    local dLen = string.len(delimiter)--��ȡ�ַ�������
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
---�������ַ�������ȡ�ַ���1���ַ���2֮����ַ���
-- @param str  ����ȡ�ַ�����  
--        substr1 ָ���ַ���1��  
--        substr2 ָ���ַ���2; 
-- @return ��ȡ����ַ���
--***********************************************************************************************
function GetSubString( str, substr1, substr2)  
    local s1,e1 = string.find(str, substr1)  --��ȡ�ַ���1��λ��
    local s2,e2 = string.find(str, substr2)  --��ȡ�ַ���2��λ��
    local subString
    if s1 == nil or s2 == nil then
         subString = BLANK_SPACE;
    else
        subString = string.sub(str, e1+1, s2-1);
    end
    return subString  
end

--***********************************************************************************************
---�������ַ�����ɾ���ַ���1���ַ���2֮����ַ���,�������ַ���
-- @param str  ����ȡ�ַ���;
--        substr1 ָ���ַ���1��  
--        substr2 ָ���ַ���2; 
-- @return ��ȡ����ַ���
--***********************************************************************************************
function DeleteSubString(str, substr1, substr2)
    local s1,e1 = string.find(str, substr1)  --��ȡ�ַ���1��λ��
    local s2,e2 = string.find(str, substr2)  --��ȡ�ַ���2��λ��
    if s1 ~= nil and s2 ~= nil then
        str = string.sub(str,1,s1-1)..string.sub(str, e2+1, -1);
    end
    return str
end


--***********************************************************************************************
--�����ļ�����, ���������ļ��ĵ��뵼��
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
--������������,��ȡ��Ӧ�����
--name : ��������
--***********************************************************************************************
function get_process_Id(name)
    local processId = 0;

    if name == BLANK_SPACE then--�ո�ֱ�ӷ���0
        return 0;
    end
    
    --��������1-12, �ҵ����п��ƽ��������õ���������,����������1�����ж�Ӧ���������
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), name, 1) ~= nil then
                processId = i;
            break;
        end
    end
    return processId;
end 


--***********************************************************************************************
--��BCDת��Ϊ�ַ������ڻ�ȡ�汾��Ϣ��ʱ���ʹ�õ���
--***********************************************************************************************
function bcd_to_string(bcd)
    --ȡģ��õ���λ,ȡ����ø���λ
    local str = tostring(math.modf(bcd/16))..tostring(math.fmod(bcd, 16));
   return str;
end


