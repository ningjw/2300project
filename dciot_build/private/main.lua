--�����г��˳��õĻص�����
--���๦�����Ķ�<<������LUA�ű�API.pdf>>
--����ʹ��visual code studio ����װBookmarks��luaide-lite(����LuaCoderAssist)���,
--ͨ����ͬĿ¼�µ�2300project.code-workspace�����ռ�鿴main.lua�ļ�,���ļ�ʹ��Bookmarks��������˺ܶ��ǩ,������ת


--[[-----------------------------------------------------------------------------------------------------------------
    �궨��&ȫ�ֱ���
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
PROCESS_LINEAR_CHK_SET_SCREEN = 20
PROCESS_TYPE_SELECT_SCREEN = 21;
PROCESS_NAME_SELECT_SCREEN = 22;
ACTION_SELECT_SCREEN = 23;
RANGE_SET_SCREEN = 24;
RANGE_SELECT_SCREEN = 25;
HAND_OPERATE1_SCREEN = 26;
HAND_OPERATE2_SCREEN = 27;
HAND_OPERATE3_SCREEN = 28;
HAND_OPERATE4_SCREEN = 29;
IN_OUT_SCREEN = 30;
HISTORY_ANALYSIS_SCREEN = 31;
HISTORY_CHECK_SCREEN = 32;
HISTORY_CALIBRATION_SCREEN = 33;
HISTORY_RECOVERY_SCREEN = 34;
HISTORY_LINER_SCREEN = 35;
HISTORY_ALARM_SCREEN = 36;
HISTORY_LOG_SCREEN = 37;
SYSTEM_INFO_SCREEN = 38;
PASSWORD_SET_SCREEN = 39;
LOGIN_SYSTEM_SCREEN = 40;
CONTACT_US_SCREEN = 41;
DIALOG_SCREEN = 42;
KEYBOARD_SCREEN = 43;
WIFI_CONNECT_SCREEN = 44;
REMOTE_UPDATE_SCREEN = 45;
PASSWORD_DIALOG_SCREEN = 46;
PROCESS_COPY_SCREEN = 47;

--���ﶨ���Public table��������״̬���Ľ���, �������"����״̬""��ǰ����""�û�""����"
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
}

--ModeBus�Ĵ�������
ModeBus = {

}

AdminPwd = 1;
MaintainerPwd = 2;
EquipmentType = 3;
SerialNumber = 4;
SysLanguage = 5;


lastTime = 1;
lastResult = 2;
lastE1 = 3;
lastE2 = 4;
lastStatus = 5;--��һ�ζϵ�ʱ��ϵͳ״̬

RED = 0xF800
BLACK = 0x0000

MaxProcess = 24;--�����Ա༭24������
MaxAction = 48;--�������̿�����48������(����)

BLANK_SPACE = " ";
PERIOD_PROCESS = 0;--��������
TIMED_PROCESS = 1;--��ʱ����

ENABLE_STRING = "1.0"
DISABLE_STRING = "0.0"

ENABLE = 1
DISABLE = 0

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

CHK_RUN = 1;--���Ȩ��ʱ,ֻ����Ƿ�����
CHK_RUN_USER = 2;--���Ȩ��ʱ,������Ҫ����Ƿ���������, ����Ҫ����û��Ƿ�Ϊ����Ա������άԱ

--processIdType:
processId = 0;
autoRangeProcessId = 1;
periodProcessId = 2;
controledProcessId = 3;
linearProcessId = 4;

--stopType
stopByNormal = 0;
stopByClickButton = 1;

Direction = {
    [CHN] = { FWD = "��ת", REV = "��ת" },
    [ENG] = { FWD = "CW", REV = "CCW" },
}




--��ʾ��Ϣ
TipsTab = {
    [CHN] = {
        insertSdUsb = "�����SD��",
        insertSd    = "����SD��,·��:",
        insertUsb = "����U��,·��:",
        pullOutSd = "�γ�SD��",
        pullOutUSB = "�γ�U��",
        importing = "���ڵ��������ļ�...",
        imported    = "����ɹ�",
        exporting = "���ڵ��������ļ�...",
        exported    = "�����ɹ�",
        exportTips = "����SD������config�ļ��к�����",
        selectProcess = "��ѡ������",
        sysInit = "ϵͳ��ʼ��",
        getVerFileFail = "��ȡ�汾�ļ�ʧ��",
        saveVerFileFail = "����汾�ļ�ʧ��",
        openVerFileFail = "�򿪰汾�ļ�ʧ��",
        getFirmwareFail = "��ȡ�̼�ʧ��",
        saveFirmwareFail = "����̼�ʧ��",
        saveFirmwareOk = "���ز�����̼��ɹ�",
        openFirmwareFail = "�򿪹̼�ʧ��",
        updateFail = "����ʧ��",
        sendFirmwareOk = "�̼����ͳɹ�",
        updateDrvBd = "����������",
        reply = "�ظ�",
        connected = "������",
        unconnected = "δ����",
        NoPermission = "��ǰ�û���Ȩ��ִ�иò���",
        stopFirst = "ϵͳ������,����ִ�иò���",
        null = "��",
        uartTimeOut = "�ظ���ʱ",
        start = "��ʼ",
        stop = "����",
        highDensity = "Ũ��ƫ��",
        lowDensity = "Ũ��ƫ��",
        lack = "ȱ",
        autoRangeProcess = "�����Զ��л�,ִ�е�����idΪ",
        WillRunId = "��ǰ׼�����е�����id=",
        noSdcard = "δ��⵽SD��",
        resultSaveErr = "δ��⵽SD��,�������δ�����ļ�",
        connecting = " ������...",
        stopByHand = "�ֶ�ֹͣϵͳ",
        qualified = "���ϸ�",
        dispelErr = "�������",
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
        qualified = " Below standard",
        dispelErr = "Dispel Error",
    },
};

Alarm = {
    null = {id = 0},
    lackReagent = {id = 1},
    lackSample = {id = 2},
    lackWater = {id = 3},
    lackStandard = {id = 4},
    outrange = {id = 7},--������
    heatingAbnm = {id = 8},--�����쳣
    lowReagent = {id = 9},--���Լ�Ԥ��
    hRange = {id=10},--������
    lRange = {id = 11},--������
    autoRange = {id=15},--�����л��澯
}


Sys = {
    language = CHN, --ϵͳ����
    userName = "", --���ڱ��浱ǰ�û�
    status = 0, --ϵͳ״̬:��ӦWorkStatus�е�ֵ
    runType = 0, --���з�ʽ: ��ӦWorkType�е�ֵ
    analysisType = COLOR_METHOD, --��������
    rangetypeId = 1, --���ڼ�¼����ѡ��

    handRunTimes = 0;--��¼���ֶ����д���
    handProcessIndex = 1,--�ֶ�����id,�ֶ����̹������, �ñ���ֵ�ķ�ΧΪ1-5.
    handProcessTotal = 0,--�ܹ��ж��ٸ��ֶ�������Ҫִ��
    
    periodStartDateTime = "", --�������̿�ʼʱ��

    actionTotal = 0, --���еĶ�������,����ͨ��ͳ��<action>��ǩ���
    actionStep = 1, --ȡֵ��ΧΪ1-24,��Ӧ�����̱༭1/3�����еĹ�24������
    actionSubStep = 1, --�ñ������ڿ���"��ʼ��"ע���""����""ע��ü�Һ"�ȵ��Ӷ���.
    --actionIdTab�����˸������������,����SystemArg.actionIdTab[1] = 3, ��ʾ��һ����ִ�����Ϊ3��action, Ҳ��ζ�����Ϊ1/2��actionΪ�ո�(û������)
    actionIdTab = {},
    actionNameTab = {},

    actionFunction = nil, --����ָ����Ҫִ�еĶ�������,���� excute_init_process, excute_get_sample_process��
    actionString, --��ȡ���������ļ��е�action��ǩ��, ���ݱ��浽�ñ���
    actionType = "", --���ڱ���type��ǩ�е�����, ��ʾ�ö�����""��ʼ��""ע���""ע��ü�Һ"�ȵ�
    contentTabStr = "", --���ڱ���content��ǩ�е�����
    contentTab = {}, --���ڱ���content��ǩ�е�����,��ʱ�Ѿ�����split��contentTabStr�е����ݽ����˷ָ�

    currentProcessId = 0, --��ǰ����ִ�е�����,����Ӧ�ĵ����.
    processActionTab = {}, --����ȡ������ص������ļ���,���浽�ñ�������
    processName = "", --��������
    processType = "", --��������, ͨ���ñ����ж���У�� ���� ��У��. У��ʹ��һ���㷨, ��У��ʹ����һ���㷨
    processRange = 1, --��������
    processTag = "", --�������ͱ�ʶ, "at""sc""dz"��
    processResultTag = ":N",--���̽����ʶ,"N"-���;"T"-������;"L"-������
    processStep = 1, --ִ������ʱ,��ֲ���, �����һ����ȡaction����,������������,ȷ��ִ�еĶ�������, �ڶ����Ϳ���ִ�ж���������

    checkEndTime = "",--"�����˲�"��ʼʱ��,�ַ�����ʽ
    startTime = { year = 0, mon = 0, day = 0, hour = 0, min = 0, sec = 0 }, --��ʼʱ��
    dateTime = { year = 0, mon = 0, day = 0, hour = 0, min = 0, sec = 0 },  --ϵͳ����ʱ��,��1S��ʱ���в���ˢ��

    driverStep = 1, --���ڿ����������Ӳ�Ķ���,�����ڿ���ʱ: ��һ����Ҫͨ�����ڷ��Ϳ���ָ��, �ڶ�����Ҫ�ȴ��ظ��ɹ�, ��������Ҫ�ȴ�һ����ʱ��.��������ɸñ�������
    driverStep1Func = nil, --��step=driverStepʱ,��Ҫִ�еĺ���,������ÿ�������/�ط�����/����ע��ú���/�ȵ�
    driverSubStep = 1, --����driverSubStep���ڿ���driverStep1Funcָ��ĺ���,��������������ʱ,���е���ע��ü�Һ,
    --��ʱ:��һ����Ҫ����ע����ٶ�, �ڶ�����Ҫ����ע��÷���
    waitTimeFlag = RESET, --���ڱ�־�Ƿ����ڵȴ���ʱʱ�䵽; ȡֵ0����1; 1(SET)= ��ǰ���ڵȴ���ʱ, 0(RESET)��ʾ�ȴ���ʱ���
    waitTime = 0, --���ڱ�����Ҫ�ȴ���ʱ��
    eWaitTimeFlag = RESET, --�ڲ���E1,E2ʱ�Ķ�ʱ��

    valcoChannel = 0, --���ڱ�������������ʱ��ʮͨ��ͨ����
    valveOperate, --����ָʾ�ط����ǿ���
    --valveIdTab ����16�����Ƿ�ѡ��
    valveIdTab = {[1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 0, [12] = 0, [13] = 0, [14] = 0, [15] = 0, [16] = 0 },

    injectId = 1, --ȡֵ1����2 ��ʾע���1����ע���2
    injectSpeed = 0,
    injectScale = 0,
    injectCurrentSpd = 0,

    peristalticId = 1, --ȡֵ1/2/3
    peristalticSpeed = 0,
    peristalticVolume = 0,
    peristalticDir = "";
    peristalticCurrentSpd = 0,
    peristalticCurrentDir = 0,

    signalTab = {}, --���ڱ����������ĵ�λ�ź�
    signalCount = 0, --����ͳ�Ƶ�ǰ�źŸ���
    signalE1 = 0, --���ڱ����ź�E1��ֵ
    signalE2 = 0, --���ڱ����ź�E2��ֵ
    signalDrift = 0, --�ź�Ư��
    signalMinTime = 0, --��ȡ�ź���Сʱ��
    signalMaxTime = 0, --��ȡ�ź����ʱ��
    signalNumber = 0, --ȡ������Ĭ��Ϊ10
    slop = 0,--б��
    y_intercept = 0,--�ؾ�

    calculateWay = "", --���㷽ʽ: ȡ���� ���� ȡ��ֵ ��ʽ
    calculateType = "", --�������ͣ��з�����У��,�˲顣
    CalcStep= 1,
    CalibrationDensity = 0, --У��ֵ
    checkValue = 0, --�˲�ֵ
    caliE1 = {}, --���ڱ���У��ʱ��E1
    caliE2 = {}, --���ڱ���У��ʱ��E2
    caliValue = {}, --���ڱ���У��Ũ��ֵ
    result = 0, --����һ���������к�õ��Ľ��,�ý�������Ƿ������/У�����/...
    isCheckOk = true,--�����жϺ˲����Ƿ�ϸ�
    absorbancy = 0,--�����

    hand_control_func = nil;

    alarmCode = 0;--��������
    alarmContent = "", --���ڱ��浱ǰ������Ϣ
    logContent = "", --���ڱ��浱ǰ��־��Ϣ

    reagentStatus = RESET;
    
    ssid = 0,
    wifi_connect = 0,
    binIndex = 0, --��������������ʱ,�������ݰ�λ��

    flag_save_uart_log = ENABLE, --�ñ��������Ƿ񱣴洮��ͨ��log(��ȡ�缫��λ��ʱ��,�᲻�ϵĻ�ȡ,Ϊ�˼���log,���Ӹñ������п���)
    isAutoRangeProcess = false, --����ָʾ��ǰ�����Ƿ�Ϊ�Զ������л�����,�ñ������ڱ�ֻ֤����һ�������л�����

    ReadyToReadConfigFile = false, --���������ļ���,���ܵ�һʱ���ȡ,��Ҫ��һ��ʱ��,�ñ�������ָʾ�����ļ��Ѿ�����,������ʱ��ȡ��

    info = {},--���ڼ�¼����,һ�����к�,һ���ͺŵ�ϵͳ��Ϣ
    lastInfo = {},--���ڼ�¼�ϴν��,�ڿ�����ʱ�������ʾ
    suddenPwrOff = false,--�ñ��������ж��Ƿ���Ҫ����"���п���"�����е�"�쳣�ϵ�"����

    recoveryM1 = 0,--�ӱ���յ�һ�ν��
    recoveryM2 = 0,--�ӱ���յڶ��ν��
    recoveryVa = 0,--�ӱ���յڶ��������� ��Ҫ����ı�׼��Һ���
    recoveryRate = 0,--�ӱ������

    linearY = {},--���Ժ˲���
    linearX = {},--���Ժ˲��׼Ũ��
    linearCorrelation = 0,--�������ϵ��
    linearRatioDensity = {0, 0.2, 0.4, 0.6, 0.8},
    linearProcessStep = 1;
    linearStartStep = 1;

    controledRangeId,--����ģʽ�����õ�����
    controledProcessTypeId,--����ģʽ���õ�������ProcessItem���ж�Ӧ���±�
}

--����״̬
WorkStatus = {
    [CHN] = {
        run = "����", --��ʱϵͳ������������
        stop = "ֹͣ",
        readyRun = "����", --��ʱΪ�Զ����з�ʽ, ���ڵȴ�ʱ�䵽���Զ�������һ�����̵�״̬.
    },
    [ENG] = {
        run = "RUN", --��ʱϵͳ������������
        stop = "STOP",
        readyRun = "READY", --��ʱΪ�Զ����з�ʽ, ���ڵȴ�ʱ�䵽���Զ�������һ�����̵�״̬.
    }
};

--��������: Ҫ�����п��ƽ�������з�ʽ�˵�һһ��Ӧ
WorkType = {
    [CHN] = {
        hand = "�ֶ�", --��������ť��,ִ��һ��
        timed = "��ʱ",--��ʱ����
        period = "����", --��������ť��,���Ը���ʱ���ж��Ƿ�������������붨ʱ����
        controlled = "�ܿ�", --ͨ����λ������ָ����������.
    },
    [ENG] = {
        hand = "Manual", --��������ť��,ִ��һ��
        timed = "Timed",--��ʱ����
        period = "Period", --��������ť��,���Ը���ʱ���ж��Ƿ�������������붨ʱ����
        controlled = "Controlled", --ͨ����λ������ָ����������.
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

--�Զ������л�
VariableOnOff = {
    [CHN] = {
        open = "��",
        close = "�ر�"
    },
    [ENG] = {
        open = "ON",
        close = "OFF"
    },
}

--���㷽ʽ
CalcWay = {
    [CHN] = {
        log = "����",
        diff = "��ֵ",
    },
    [ENG] = {
        log = "Log",
        diff = "Diff",
    },
}

AnalysisWay = {
    [CHN] = { colorimetry = "��ɫ��", electrode = "�缫��" },
    [ENG] = { colorimetry = "colorimetry", electrode = "electrode" },
}

--ע��ò���
InjectPara = {
    [CHN] = {"��","�ӱ����"},
    [ENG] = {"NULL","Recovery"},
}

CalcType = {
    [CHN] = { "����", "У׼", "�˲�","�ӱ����","���Ժ˲�"},
    [ENG] = { "Analysis", "Calibration", "Check","Recovery","Linear"},
};

ProcessItem = {
    [CHN] = { "ˮ������", "У׼", "��ϴ", "��·���", "���˲�", "�����˲�", "���̺˲�", "�ӱ����", "ƽ����", "���Ժ˲�", "�հײ���", "�հ�У׼","����У׼","ʵ��ˮ���ȶ�", BLANK_SPACE },
    [ENG] = { "Analysis", "Calibration", "Washing", "Fill", "Zero Check", "Std. Check", "Range Chk.", "Std. Recovery", "Parallel Samp.", "Linear Chk.", "Blank Test", "Blank Cali.","Std. Cali.", "",BLANK_SPACE },
}


--ActionItem�����ֵһ��Ҫ�붯��ѡ����水ť�е�ֵһһ��Ӧ
ActionItem = {
    [CHN] = { "��ʼ��", "ע���", "ע��ü�Һ��", "��ȡ�ź�", "�䶯�ü�Һ", "����", "�ȴ�ʱ��", "����", "������","���Ժ˲�ϡ��", BLANK_SPACE },
    [ENG] = { "Initialize", "Injector", "Injector Add", "Read Signal", "Pump Add", "Calculation", "Wait Time", "Dispel", "Valve","Linear Dilution", BLANK_SPACE },
};

--���ڱ��������ļ��ַ���
--�����ļ�ʹ�� "0"��������,���� "0" �б��������п��ƽ���/�������������/ �ֶ�����3����/�������ý���Ĳ���
--���ϵ��, �ͽ������ļ� "0" �е����ݶ�ȡ�� ConfigStr[0]
--�ڴ���������1������ת�����̱༭1���浱��ʱ,��Ҫѡ������,��ʱ��ȡ���̶�Ӧ�������ļ� "?" ,�����ݶ�ȡ��ConfigStr[?]. (?ȡֵ1-12)
ConfigStr = {};

--������������ļ�"1"-"24"�е�ĳ�������ļ�,ÿ��Ԫ�ر�����ļ��е�һ��,ÿһ�б�ʾ����һ������
ActionStrTab = {};




--[[-----------------------------------------------------------------------------------------------------------------
    ��ں���
--------------------------------------------------------------------------------------------------------------------]]


--***********************************************************************************************
--��ʼ������,ϵͳ����LUA�ű����������ôλص�����
--***********************************************************************************************
function on_init()
    print(_VERSION);
    uart_set_timeout(2000, 500); --���ô��ڳ�ʱ, �����ܳ�ʱ2000ms, �ֽڼ����ʱ200ms
    start_timer(0, 100, 1, 0); --������ʱ�� 0����ʱʱ�� 100ms,1->ʹ�õ���ʱ��ʽ,0->��ʾ�����ظ�
    for i = 1, MaxAction, 1 do
        Sys.actionIdTab[i] = 0;
        Sys.actionNameTab[i] = 0;
    end

    Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day,
    Sys.dateTime.hour, Sys.dateTime.min, Sys.dateTime.sec = get_date_time();--��ȡ��ǰʱ��

    set_text(SYSTEM_INFO_SCREEN, TouchScreenHardVerId, "190311");--��ʾ������Ӳ���汾��
    set_text(SYSTEM_INFO_SCREEN, TouchScreenSoftVerId, "200514");--��ʾ����������汾��

    --ϵͳ��Ϣ�����µ������ͺ������к�Ĭ�ϲ�������,��Ҫ���������ſ�����
    set_enable(SYSTEM_INFO_SCREEN, SetEquipmentTypeTextId, DISABLE);
    set_enable(SYSTEM_INFO_SCREEN, SerialNumberTextId, DISABLE);

    --����Ҫѡ�����̵��ı����ʼ��ΪBLANK_SPACE---------------------------------------------
    setTextToBlankSpace();
    
    record_control_check();--�����ʷ��¼�ռ��б���Ĳ���
    
    SetSysUser(SysUser[Sys.language].maintainer);     --����֮��Ĭ��Ϊ��άԱ(����ʱʹ�õĴ���)
    --   SetSysUser(SysUser[Sys.language].operator);  --����֮��Ĭ��Ϊ����Ա

    SdPath = "";--���︴һ�����ַ���,��Ϊ���ڵ��Զ˵���ʱ����SdPathΪnil�Ĵ���
    UsbPath = "";
    on_sd_inserted(SdPath);
    -- Sys.hand_control_func = sys_init;--�������Ƚ��г�ʼ������
    -- Sys.hand_control_func = UpdataDriverBoard;--������ȡ�����ļ�(����ʱʹ�õĴ���)
end



--***********************************************************************************************
--����Ҫѡ�����̵��ı����ʼ��ΪBLANK_SPACE
--***********************************************************************************************
function setTextToBlankSpace()
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
end

--***********************************************************************************************
--��ʷ��¼�ռ���, ��Ҫ���һЩ����������.
--***********************************************************************************************
function record_control_check()
    --�ж�ϵͳ�Ƿ�Ϊ�״��ϵ�����-------------------------------------------------------------------------------
    if record_get_count(SYSTEM_INFO_SCREEN, SysInfoRecordId) == 0 then 
        Sys.info[AdminPwd] = "172172"--����Ա����
        Sys.info[MaintainerPwd] = "171717"--��άԱ����
        Sys.info[EquipmentType] = "2300"--�����ͺ�
        Sys.info[SerialNumber] = "0000000000"--�������к�
        Sys.info[SysLanguage] = CHN --ϵͳ����

        local record = "";
        for i=1, #Sys.info, 1 do
            record = record..Sys.info[i]..","
        end
        record_add(SYSTEM_INFO_SCREEN, SysInfoRecordId, record);--��ʼ��Ĭ�ϲ���
    end
    Sys.info = split(record_read(SYSTEM_INFO_SCREEN, SysInfoRecordId, 0) , ",")

    --���������ͺ�-----------------------------------------------------------------------------------------
    set_text(SYSTEM_INFO_SCREEN, SetEquipmentTypeTextId, Sys.info[EquipmentType])
    set_equipment_type()

    --�����������к�---------------------------------------------------------------------------------------
    set_text(SYSTEM_INFO_SCREEN, SerialNumberTextId, Sys.info[SerialNumber])

    --����ϵͳ����-----------------------------------------------------------------------------------------                                                                     
    Sys.language = tonumber(Sys.info[SysLanguage])
    if Sys.language == CHN then
        set_value(SYSTEM_INFO_SCREEN, SetChineseId, ENABLE);                           
        set_value(SYSTEM_INFO_SCREEN, SetEnglishId, DISABLE);                          
    else                                                                               
        set_value(SYSTEM_INFO_SCREEN, SetChineseId, DISABLE);                          
        set_value(SYSTEM_INFO_SCREEN, SetEnglishId, ENABLE);                           
    end

    --����ҳ����ʾ���µķ�����¼----------------------------------------------------------------------------
    if record_get_count(SYSTEM_INFO_SCREEN, LastInfoRecordId) == 0 then 
        Sys.lastInfo[lastTime] = "0000-00-00  00:00"--ʱ��
        Sys.lastInfo[lastResult] = "0.0"--���
        Sys.lastInfo[lastE1] = "0.0"--E1
        Sys.lastInfo[lastE2] = "0.0"--E2
        Sys.lastInfo[lastStatus] = CHN --ϵͳ״̬

        local record = "";
        for i=1, #Sys.lastInfo, 1 do
            record = record..Sys.lastInfo[i]..","
        end
        record_add(SYSTEM_INFO_SCREEN, LastInfoRecordId, record);--��ʼ��Ĭ�ϲ���
    end
    Sys.lastInfo = split(record_read(SYSTEM_INFO_SCREEN, LastInfoRecordId, 0) , ",")
    set_text(MAIN_SCREEN, LastAnalysisTimeId, Sys.lastInfo[lastTime]);--��ʾʱ��
    set_text(MAIN_SCREEN, LastResultId, Sys.lastInfo[lastResult]);--��ʾ���
    set_text(MAIN_SCREEN, LastResultE1Id, Sys.lastInfo[lastE1]);--��ʾE1
    set_text(MAIN_SCREEN, LastResultE2Id, Sys.lastInfo[lastE2]);--��ʾE2
end

--***********************************************************************************************
--��ʱ����ʱ��ִ�д˻ص�����,��ʱ����� 0~2
--��ʱ��0: 1ms��ʱ�ж�, ������غ�����Ҫ�����ڸö�ʱ������
--��ʱ��1: 3ms��ʱ�ж�, ��Ҫ�����жϴ������ݻظ��Ƿ�ʱ
--��ʱ��2: ���ڶ�ȡE1/E2�ź�ʱ�ĳ�ʱ�ж�; �������̿����еĳ�ʱ�ж�
--��ʱ��3: ����ShowSysTips��ʾ��ʾ��, ����ʾֻ��ʾ5����
--***********************************************************************************************
function on_timer(timer_id)
    if timer_id == 0 then --��ʱ��0,��ʱʱ�䵽
        if Sys.status == WorkStatus[Sys.language].run then--����
            excute_process();
        elseif Sys.hand_control_func ~= nil then
            Sys.hand_control_func();
        end
    elseif timer_id == 1 then--���ڳ�ʱ
        uart_time_out();
    elseif timer_id == 2 then--�ȴ�ʱ�����
        Sys.waitTimeFlag = RESET;
    elseif timer_id == 3 then--����ײ�tips
        ShowSysTips("");
    elseif timer_id == 4 then
        Sys.eWaitTimeFlag = RESET;
    end
end



--***********************************************************************************************
--��ʱ�ص�������ϵͳÿ��1�����Զ����á�
--***********************************************************************************************
function on_systick()
    Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day,
    Sys.dateTime.hour, Sys.dateTime.min, Sys.dateTime.sec = get_date_time();--��ȡ��ǰʱ��

    local value,yearMon,dayHour,minSec;
    yearMon = Decimal_BCD(Sys.dateTime.year%100) *256 + Decimal_BCD(Sys.dateTime.mon)
    dayHour = Decimal_BCD(Sys.dateTime.day) * 256 + Decimal_BCD(Sys.dateTime.hour)
    minSec  = Decimal_BCD(Sys.dateTime.min) * 256 + Decimal_BCD(Sys.dateTime.sec)
    ModeBus[0x1080] = yearMon--����
    ModeBus[0x1081] = dayHour--��ʱ
    ModeBus[0x1082] = minSec--����
    
    if Sys.status == WorkStatus[Sys.language].readyRun then           --��ϵͳ���ڴ���״̬ʱ,
        process_ready_run(processId);
    end

    --�ж�wifi����״̬
    if string.len(Sys.ssid) > 0 then
        Sys.wifi_connect = get_network_state() --��ȡ����״̬
        wifimode, secumode, ssid, password = get_wifi_cfg() --��ȡWIFI����
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
    local state, process = get_upgrade_state()                    --��ȡ����״̬�����      
    set_value(REMOTE_UPDATE_SCREEN, RemoteUpdateTsStaId, state)  --����״̬��ʾ
end

--***********************************************************************************************
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--***********************************************************************************************
function on_control_notify(screen, control, value)
    if screen == MAIN_SCREEN then--��ҳ
        main_control_notify(screen, control, value);
    elseif screen == RUN_CONTROL_SCREEN then --���п��ƽ���
        run_control_notify(screen, control, value);
    elseif screen == RUN_CONTROL_PERIOD_SCREEN then
        run_control_period_notify(screen, control, value);
    elseif screen == RUN_CONTROL_TIMED_SCREEN then
        run_control_timed_notify(screen, control, value);
    elseif screen == RUN_CONTROL_HAND_SCREEN then
        run_control_hand_notify(screen, control, value);
    elseif screen == PROCESS_TYPE_SELECT_SCREEN then --����ѡ�����
        process_type_select_control_notify(screen, control, value);
    elseif screen == PROCESS_NAME_SELECT_SCREEN then--��������ѡ�����
        process_name_select_control_notify(screen, control, value);
    elseif screen == PROCESS_SET1_SCREEN or screen == PROCESS_SET2_SCREEN then --��������1/2����
        process_set12_control_notify(screen, control, value);
    elseif screen == PROCESS_EDIT1_SCREEN or screen == PROCESS_EDIT2_SCREEN or screen == PROCESS_EDIT3_SCREEN or screen == PROCESS_EDIT4_SCREEN then --���̱༭1/2/3����
        process_edit_control_notify(screen, control, value);
    elseif screen == RANGE_SELECT_SCREEN then --����ѡ�����
        range_select_control_notify(screen, control, value);
    elseif screen == ACTION_SELECT_SCREEN then--����ѡ�����
        action_select_control_notify(screen, control, value);
    elseif screen == PROCESS_INIT_SCREEN then--��������-��ʼ����
        process_init_control_notify(screen, control, value);
    elseif screen == PROCESS_INJECT_SCREEN    then--��������-ȡ������
        process_inject_control_notify(screen, control, value);
    elseif screen == PROCESS_INJECT_ADD_SCREEN    then--��������-ע��ü�Һ
        process_inject_add_control_notify(screen, control, value);
    elseif screen == PROCESS_PERISTALTIC_SCREEN    then--��������-�䶯�ü�Һ
        process_peristaltic_control_notify(screen, control, value);
    elseif screen == PROCESS_DISPEL_SCREEN then--��������-����
        process_dispel_control_notify(screen, control, value);
    elseif screen == PROCESS_READ_SIGNAL_SCREEN then--��������-��ȡ�ź�
        process_read_signal_control_notify(screen, control, value);
    elseif screen == PROCESS_CALCULATE_SCREEN then--��������-����
        process_calculate_control_notify(screen, control, value);
    elseif screen == PROCESS_VALVE_CTRL_SCREEN then--��������-������
        process_valve_ctrl_control_notify(screen, control, value);
    elseif screen == PROCESS_WAIT_TIME_SCREEN then--��������-�ȴ�ʱ��
        process_wait_time_control_notify(screen, control, value);
    elseif screen == PROCESS_LINEAR_CHK_SET_SCREEN then--��������-���Ժ˲�ϡ��
        process_linear_set_control_notify(screen, control, value);
    elseif screen == RANGE_SET_SCREEN then --��������
        range_set_control_notify(screen, control, value);
    elseif screen == HAND_OPERATE1_SCREEN then --�ֶ�����1
        hand_operate1_control_notify(screen, control, value);
    elseif screen == HAND_OPERATE2_SCREEN then --�ֶ�����2
        hand_operate2_control_notify(screen, control, value);
    elseif screen == HAND_OPERATE3_SCREEN then --�ֶ�����3
        hand_operate3_control_notify(screen, control, value);
    elseif screen == IN_OUT_SCREEN then--�����������
        in_out_control_notify(screen, control, value);
    elseif screen == SYSTEM_INFO_SCREEN then --ϵͳ��Ϣ����
        system_info_control_notify(screen, control, value);
    elseif screen == LOGIN_SYSTEM_SCREEN then--��¼ϵͳ����
        login_system_control_notify(screen, control, value);
    elseif screen == DIALOG_SCREEN then--�Ի������
        dialog_screen_control_notify(screen, control, value);
    elseif screen == PASSWORD_SET_SCREEN then--�������ý���
        password_set_control_notify(screen, control, value);
    elseif screen == WIFI_CONNECT_SCREEN then--Wifi���ý���
        wifi_connect_control_notify(screen, control, value);
    elseif screen == REMOTE_UPDATE_SCREEN then
        remote_update_control_notify(screen, control, value);
    elseif  screen == HISTORY_ANALYSIS_SCREEN or screen == HISTORY_CHECK_SCREEN or screen == HISTORY_CALIBRATION_SCREEN or
           screen == HISTORY_ALARM_SCREEN or screen == HISTORY_LOG_SCREEN then
        history_control_notify(screen, control, value);
    elseif screen == PASSWORD_DIALOG_SCREEN then--����Ի������
        password_dialog_screen_control_notify(screen, control, value);
    elseif screen ==PROCESS_COPY_SCREEN then--���̸���
        process_copy_control_notify(screen, control, value);
    end

end

--***********************************************************************************************
--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
--***********************************************************************************************
function on_screen_change(screen)
    if (screen == RANGE_SELECT_SCREEN) then --��ת������ѡ��
        goto_range_select();
    elseif screen == PROCESS_NAME_SELECT_SCREEN then --��ת����������ѡ��
        goto_ProcessNameSelect();
    elseif screen == HISTORY_ANALYSIS_SCREEN or screen == HISTORY_CHECK_SCREEN or
    screen == HISTORY_CALIBRATION_SCREEN or screen == HISTORY_ALARM_SCREEN or screen == HISTORY_LOG_SCREEN then--��ת����ʷ��¼����
        setHistoryScreen(screen);
    elseif screen == LOGIN_SYSTEM_SCREEN then--��¼ϵͳ
        goto_LoginSystem();
    elseif screen == PASSWORD_SET_SCREEN then--��������
        goto_PasswordSet();
    elseif screen == WIFI_CONNECT_SCREEN then--��������
        goto_WifiConnect();
    elseif screen == PASSWORD_DIALOG_SCREEN then --����Ի���
        goto_dialog_screen();
    elseif screen == RUN_CONTROL_PERIOD_SCREEN then --��ת���������ý���
        goto_period_mode_set_screen();
    end
end

--***********************************************************************************************
--���� U �̺�ִ�д˻ص�����
--***********************************************************************************************
function on_usb_inserted(dir)
    UsbPath = dir;
    ShowSysTips(TipsTab[Sys.language].insertUsb .. UsbPath);
end

--***********************************************************************************************
--�γ� U �̺�ִ�д˻ص�����
--***********************************************************************************************
function on_usb_removed()
    ShowSysTips(TipsTab[Sys.language].pullOutUSB..UsbPath);
    UsbPath = nil;
end

--***********************************************************************************************
--[����SD���ص�����
--���� SD ����ִ�д˻ص�����
--***********************************************************************************************
function on_sd_inserted(dir)
    SdPath = dir;--����SD����·��
    changeCfgFileLanguage(Sys.language);--�������ļ����з���,Ȼ����ʾ��������
    ReadFile0ToConfigStrAndScreen();--��ȡ"0"�ļ�,�����ļ���Ĳ������õ� ��������1����/���п��ƽ���/�������ý���/�ֶ�����3����/�����������
    checkHistoryFile();--��Ⲣ�����յ���ʷ��¼�ļ�
    --����ģʽ��,���ؿ�ʼ��ť
    if get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].controlled then
        set_visiable(RUN_CONTROL_SCREEN, RunStopBtId, 0);
    end
    --���õ�λ
    set_unit();

    --���÷�����
    set_text(MAIN_SCREEN, LastAnalyteId, get_text(RUN_CONTROL_SCREEN, AnalyteSetId));

    --��ʼ��Modebus�Ĵ���
    modebus_regester_init();

    ShowSysTips(TipsTab[Sys.language].insertSd .. SdPath);
end

--***********************************************************************************************
--�γ� SD ����ִ�д˻ص�����
--***********************************************************************************************
function on_sd_removed()
    ShowSysTips(TipsTab[Sys.language].pullOutSd..SdPath);
    SdPath = nil;
end


--[[-----------------------------------------------------------------------------------------------------------------
    ϵͳ��ʼ������
--------------------------------------------------------------------------------------------------------------------]]
--***********************************************************************************************
--ϵͳ��ʼ��, һ���ڿ������߼�ͣʱ���øú���
--***********************************************************************************************
function sys_init()
    local softVer1, softVer2, hardVer1, hardVer2;

    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then
        return;
    end

    
    if Sys.processStep == 1 then --��һ��:ʹ��ע���1
        ShowSysCurrentAction(TipsTab[Sys.language].sysInit);
        enable_inject1();
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 2 then--�ڶ�������ȡ������汾��
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getDrvVer, NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then--����������ʾ�����汾�汾�� �� ��ȡ���а�����㿨Ӳ���汾��
        if UartArg.reply_sta == SEND_OK then
            softVer1 = bcd_to_string(UartArg.recv_data[10])..bcd_to_string(UartArg.recv_data[11]);
            hardVer1 = bcd_to_string(UartArg.recv_data[12])..bcd_to_string(UartArg.recv_data[13]);
            set_text(SYSTEM_INFO_SCREEN, DriverBoardSoftVerId, softVer1);--��ʾ����汾��
            set_text(SYSTEM_INFO_SCREEN, DriverBoardHardVerId, hardVer1);--��ʾӲ���汾��
        end
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getSCHardVer, NEED_REPLY);--��ȡ���а�����㿨Ӳ���汾��
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 4 then--���Ĳ�����ʾ���а�����㿨Ӳ���汾�� �� ��ȡ���а�����㿨����汾��
        if UartArg.reply_sta == SEND_OK then
            hardVer1 = bcd_to_string(UartArg.recv_data[3]) .. bcd_to_string(UartArg.recv_data[4]);
            set_text(SYSTEM_INFO_SCREEN, SensorBoardHardVerId, hardVer1);
            hardVer1 = bcd_to_string(UartArg.recv_data[5]) .. bcd_to_string(UartArg.recv_data[6]);
            hardVer2 = bcd_to_string(UartArg.recv_data[7]) .. bcd_to_string(UartArg.recv_data[8]);
            set_text(SYSTEM_INFO_SCREEN, CalcBoardHardVerId, hardVer1 .. hardVer2);
        end
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getSCSoftVer, NEED_REPLY);--��ȡ���а�����㿨����汾��
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 5 then--���岽����ʾ���а�����㿨����汾�� ����ȡ����������Ӳ���汾��������汾��
        if UartArg.reply_sta == SEND_OK then
            softVer1 = bcd_to_string(UartArg.recv_data[3]) .. bcd_to_string(UartArg.recv_data[4]);
            set_text(SYSTEM_INFO_SCREEN, SensorBoardSoftVerId, softVer1);
            softVer1 = bcd_to_string(UartArg.recv_data[5]) .. bcd_to_string(UartArg.recv_data[6]);
            softVer2 = bcd_to_string(UartArg.recv_data[7]) .. bcd_to_string(UartArg.recv_data[8]);
            set_text(SYSTEM_INFO_SCREEN, CalcBoardSoftVerId, softVer1 .. softVer2);
        end
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getIOVer, NEED_REPLY);--��ȡ
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 6 then--������:��ʾ���������İ汾��,����ȡ��������汾��
        if UartArg.reply_sta == SEND_OK then
            softVer1 = bcd_to_string(UartArg.recv_data[3])..bcd_to_string(UartArg.recv_data[4])..bcd_to_string(UartArg.recv_data[5]);
            hardVer1 = bcd_to_string(UartArg.recv_data[6])..bcd_to_string(UartArg.recv_data[7])..bcd_to_string(UartArg.recv_data[8]);
            set_text(SYSTEM_INFO_SCREEN, CtrlBoardSoftVerId, softVer1);
            set_text(SYSTEM_INFO_SCREEN, CtrlBoardHardVerId, hardVer1);
        end
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getDsHardVer, NEED_REPLY);--��ȡ�����Ӳ���汾��
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 7 then--���߲�:��ʾ�����Ӳ���汾�Ų���ȡ���������汾��
        if UartArg.reply_sta == SEND_OK then
            hardVer1 = bcd_to_string(UartArg.recv_data[3])..bcd_to_string(UartArg.recv_data[4])..
                       bcd_to_string(UartArg.recv_data[5])..bcd_to_string(UartArg.recv_data[6]);

        end
        start_wait_time(1);
        on_uart_send_data(uartSendTab.getDsHardVer, NEED_REPLY);--��ȡ���������汾��
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 8 then--�ڰ˲�:��ʾ���������汾��
        if UartArg.reply_sta == SEND_OK then
            softVer1 = bcd_to_string(UartArg.recv_data[3])..bcd_to_string(UartArg.recv_data[4])..
                       bcd_to_string(UartArg.recv_data[5])..bcd_to_string(UartArg.recv_data[6]);
        end
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 9 then --�ھŲ�:�ж��Ƿ���Ҫ�����ſ���ϴ
        set_enable(RUN_CONTROL_SCREEN, RunStopBtId, ENABLE)--��ʼ����ɣ�ʹ�ܿ�ʼ��ť
        ShowSysCurrentAction(TipsTab[Sys.language].null);
        Sys.processStep = 1;
        Sys.hand_control_func = nil;

        if Sys.lastInfo[lastStatus] == WorkStatus[Sys.language].run and --�ϴζϵ�ʱΪ����״̬
           getProcessIdByName(get_text(RUN_CONTROL_SCREEN,SuddenPwrOffProcessId)) ~= 0 then --�������쳣�ϵ�����
            Sys.suddenPwrOff = true;
            ShowSysTips("ִ���쳣�ϵ�����");
            SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--����Ϊ����״̬
        end
    end
end
--[[-----------------------------------------------------------------------------------------------------------------
    ModeBus�Ĵ�������
--------------------------------------------------------------------------------------------------------------------]]

--***********************************************************************************************
--��ʼ��ModeBus�Ĵ�������
--***********************************************************************************************
function modebus_regester_init()
    --����������
    for i = 0x1000,0x107F,1 do
        ModeBus[i] = 0
    end
    --״̬�澯��
    for i = 0x1080,0x109F,1 do
        ModeBus[i] = 0
    end
    --�ؼ�������
    for i = 0x10A0,0x10FF,1 do
        ModeBus[i] = 0
    end
    --����������
    for i = 0x1200,0x12FF,1 do
        ModeBus[i] = 0
    end

    local file;
    file = io.open(SdPath .. "record/ModeBus");
    if file == nil then
        file = io.open(SdPath .. "record/ModeBus", "w+");--�򿪲���ո��ļ�
        --��������
        local value = tonumber(get_text(RUN_CONTROL_SCREEN,CodeSetId));
        ModeBus[0x1000] = math.fmod(value, 65536);
        ModeBus[0x1001] = math.modf(value/65536);
        ModeBus[0x1002] = 2;--��λĬ��mg/L
        ModeBus[0x100A] = string.byte('a') * 256 + string.byte('t')--ˮ�����ݱ�ʶ
        ModeBus[0x1015] = string.byte('s') * 256 + string.byte('c')--�������ݱ�ʶ
        ModeBus[0x1020] = string.byte('b') * 256 + string.byte('t')--�հ����ݱ�ʶ
        ModeBus[0x102B] = string.byte('d') * 256 + string.byte('z')--���˲����ݱ�ʶ
        ModeBus[0x1036] = string.byte('l') * 256 + string.byte('c')--��Ⱥ˲����ݱ�ʶ
        ModeBus[0x1041] = string.byte('r') * 256 + string.byte('a')--�ӱ�������ݱ�ʶ
        ModeBus[0x104C] = string.byte('p') * 256 + string.byte('t')--ƽ�������ݱ�ʶ
        ModeBus[0x1089] = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN,9))--ˮ������Ƶ��
        ModeBus[0x108A] = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN,16))--���˲�Ƶ��
        ModeBus[0x108B] = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN,14))--���̺˲�Ƶ��
        ModeBus[0x108C] = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN,18))--�����˲�Ƶ��
        ModeBus[0x10A0] = tonumber(get_text(RUN_CONTROL_SCREEN,8))--С����λ��
        value  = FloatToHex(tonumber(get_text(RANGE_SET_SCREEN,1)));
        ModeBus[0x10A3] = math.fmod(value, 65536);--����1����
        ModeBus[0x10A4] = math.modf(value/65536);--����1����
        value = FloatToHex(tonumber(get_text(RANGE_SET_SCREEN,2)))
        ModeBus[0x10A5] = math.fmod(value, 65536);--����1����
        ModeBus[0x10A6] = math.modf(value/65536);--����1����
        value = FloatToHex(tonumber(get_text(RANGE_SET_SCREEN,5)))
        ModeBus[0x10A7] = math.fmod(value, 65536);--����б��
        ModeBus[0x10A8] = math.modf(value/65536);--����б��
        value = FloatToHex(tonumber(get_text(RANGE_SET_SCREEN,6)))
        ModeBus[0x10A9] = math.fmod(value, 65536);--���߽ؾ�
        ModeBus[0x10AA] = math.modf(value/65536);--���߽ؾ�
        value = get_text(SYSTEM_INFO_SCREEN,2);
        -- ModeBus[0x10D2] = --�豸���к�
        print("����Ĭ�ϵ�ModeBus�ļ�");
        --��ModeBus�Ĳ���������/״̬�澯��/�ؼ����������ֵ�ModeBus�ļ�����
        for i = 0x1000, 0x10FF, 1 do
            file:write(ModeBus[i]);
            file:write(",")
        end
    else
        print("��ȡModeBus�ļ�")
        file:seek("set")                   --���ļ�λ�ö�λ����ͷ
        local  fileStr = file:read("a")    --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
        local fileTab = split(fileStr,",");
        local j = 1
        for i = 0x1000, 0x10FF, 1 do
            ModeBus[i] = fileTab[j]
            j = j+1;
        end
    end
    file:close();
end

--***********************************************************************************************
--����ModeBus�ļ�
--***********************************************************************************************
function SaveModeBusToFile()
    local file = io.open(SdPath .. "record/ModeBus", "w+");--�򿪲���ո��ļ�
    --��ModeBus�Ĳ���������/״̬�澯��/�ؼ����������ֵ�ModeBus�ļ�����
    for i = 0x1000, 0x10FF, 1 do
        file:write(ModeBus[i]);
        file:write(",")
    end
    file:close();
end

--***********************************************************************************************
--���ò���������
--***********************************************************************************************
function SetModebusResultArea()
    local hexResult = FloatToHex(Sys.result);
    local value,yearMon,dayHour,minSec;
    yearMon = Decimal_BCD(Sys.dateTime.year%100) *256 + Decimal_BCD(Sys.dateTime.mon)
    dayHour = Decimal_BCD(Sys.dateTime.day) * 256 + Decimal_BCD(Sys.dateTime.hour)
    minSec  = Decimal_BCD(Sys.dateTime.min) * 256 + Decimal_BCD(Sys.dateTime.sec)
    --ˮ������,����Modebusˮ������ʱ��,ˮ��ʵ��ֵ
    if Sys.processType == ProcessItem[Sys.language][1] then
        ModeBus[0x1005] = yearMon--����
        ModeBus[0x1006] = dayHour--��ʱ
        ModeBus[0x1007] = minSec--����
        ModeBus[0x1008] = math.fmod(hexResult,65536);
        ModeBus[0x1009] = math.modf(hexResult/65536);
    elseif Sys.processType == ProcessItem[Sys.language][6] then--�����˲�
        ModeBus[0x1010] = yearMon--����
        ModeBus[0x1011] = dayHour--��ʱ
        ModeBus[0x1012] = minSec--����
        ModeBus[0x1013] = math.fmod(hexResult,65536);
        ModeBus[0x1014] = math.modf(hexResult/65536);
    elseif Sys.processType == ProcessItem[Sys.language][11] then--�հײ���
        ModeBus[0x101B] = yearMon--����
        ModeBus[0x101C] = dayHour--��ʱ
        ModeBus[0x101D] = minSec--����
        ModeBus[0x101E] = math.fmod(hexResult,65536);
        ModeBus[0x101F] = math.modf(hexResult/65536);
    elseif Sys.processType == ProcessItem[Sys.language][5] then--���˲�
        ModeBus[0x1026] = yearMon--����
        ModeBus[0x1027] = dayHour--��ʱ
        ModeBus[0x1028] = minSec--����
        ModeBus[0x1029] = math.fmod(hexResult,65536);
        ModeBus[0x102A] = math.modf(hexResult/65536);
    elseif Sys.processType == ProcessItem[Sys.language][7] then--��Ⱥ˲�(���̺˲�)
        ModeBus[0x1031] = yearMon--����
        ModeBus[0x1032] = dayHour--��ʱ
        ModeBus[0x1033] = minSec--����
        ModeBus[0x1034] = math.fmod(hexResult,65536);
        ModeBus[0x1035] = math.modf(hexResult/65536);
    elseif Sys.processType == ProcessItem[Sys.language][8] then--�ӱ����
        ModeBus[0x103C] = yearMon--����
        ModeBus[0x103D] = dayHour--��ʱ
        ModeBus[0x103E] = minSec--����
        ModeBus[0x103F] = math.fmod(hexResult,65536);
        ModeBus[0x1040] = math.modf(hexResult/65536);
    elseif Sys.processType == ProcessItem[Sys.language][9] then--ƽ����
        ModeBus[0x1047] = yearMon--����
        ModeBus[0x1048] = dayHour--��ʱ
        ModeBus[0x1049] = minSec--����
        ModeBus[0x104A] = math.fmod(hexResult,65536);
        ModeBus[0x104B] = math.modf(hexResult/65536);
    elseif Sys.processType == ProcessItem[Sys.language][2] then--У׼(�궨)
        ModeBus[0x10AB] = yearMon--����
        ModeBus[0x10AC] = dayHour--��ʱ
        ModeBus[0x10AD] = minSec--����
        value = FloatToHex(tonumber(get_text(RANGE_SET_SCREEN,5)))
        ModeBus[0x10A7] = math.fmod(value, 65536);--����б��
        ModeBus[0x10A8] = math.modf(value/65536);--����б��
        value = FloatToHex(tonumber(get_text(RANGE_SET_SCREEN,6)))
        ModeBus[0x10A9] = math.fmod(value, 65536);--���߽ؾ�
        ModeBus[0x10AA] = math.modf(value/65536);--���߽ؾ�
    elseif Sys.processType == ProcessItem[Sys.language][10] then--���Ժ˲�
        value = FloatToHex(Sys.linearCorrelation);
        ModeBus[0x10C2] = math.fmod(value, 65536);--�������ϵ��
        ModeBus[0x10C3] = math.modf(value/65536);--�������ϵ��
    elseif Sys.processType == ProcessItem[Sys.language][12] then--�հ�У׼
        ModeBus[0x10C8] = yearMon--����
        ModeBus[0x10C9] = dayHour--��ʱ
        ModeBus[0x10CA] = minSec--����
    elseif Sys.processType == ProcessItem[Sys.language][13] then--����У׼
        ModeBus[0x10CB] = yearMon--����
        ModeBus[0x10CC] = dayHour--��ʱ
        ModeBus[0x10CD] = minSec--����
    end

    value = Sys.absorbancy;
    ModeBus[0x10C6] = math.fmod(value, 65536);--�����
    ModeBus[0x10C7] = math.modf(value/65536);--�����
    SaveModeBusToFile()
end

--***********************************************************************************************
--����ϵͳ״̬�Ĵ���
--***********************************************************************************************
function SetModebusSysStatus()
    if Sys.processType == ProcessItem[Sys.language][1] then--ˮ������
        ModeBus[0x1083] = 1;
    elseif Sys.processType == ProcessItem[Sys.language][6] then --�����˲�
        ModeBus[0x1083] = 2;
    elseif Sys.processType == ProcessItem[Sys.language][5] then --���˲�
        ModeBus[0x1083] = 3;
    elseif Sys.processType == ProcessItem[Sys.language][10] then --��Ⱥ˲�
        ModeBus[0x1083] = 4;
    elseif Sys.processType == ProcessItem[Sys.language][11] then --�հײ���
        ModeBus[0x1083] = 5;
    elseif Sys.processType == ProcessItem[Sys.language][9] then --ƽ��������
        ModeBus[0x1083] = 6;
    elseif Sys.processType == ProcessItem[Sys.language][8] then --�ӱ����
        ModeBus[0x1083] = 7;
    elseif Sys.processType == ProcessItem[Sys.language][12] then --�հ�У׼
        ModeBus[0x1083] = 8;
    elseif Sys.processType == ProcessItem[Sys.language][13] then --����У׼
        ModeBus[0x1083] = 9;
    elseif Sys.processType == ProcessItem[Sys.language][3] then --��ϴ
        ModeBus[0x1083] = 10;
    elseif Sys.processType == ProcessItem[Sys.language][2] then --�궨(У׼)
        ModeBus[0x1083] = 19;
    end
end

--***********************************************************************************************
--���ò���ģʽ�Ĵ���
--***********************************************************************************************
function setModebusRunMode()
    if get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].hand then
        ModeBus[0x1084] = 1;
        
    elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].period then
        ModeBus[0x1084] = 2;
    elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].timed then
        ModeBus[0x1084] = 3;
    elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].controlled then
        ModeBus[0x1084] = 4;
    end
    SaveModeBusToFile()
end


--[[-----------------------------------------------------------------------------------------------------------------
    �����շ�
--------------------------------------------------------------------------------------------------------------------]]
--����ȫ�ֱ���uart_free_protocol��ʹ�����ɴ���Э��
uart_free_protocol = 1;

uartSendTab = {
    getSCSoftVer = {[0] = 238, 3, 16, 3, 0, 3, 0, 0, len = 6, note = {[CHN] = "��ȡ����汾", [ENG] = "Get Soft Ver." } },
    getSCHardVer = {[0] = 238, 3, 16, 2, 0, 3, 0, 0, len = 6, note = {[CHN] = "��ȡӲ���汾", [ENG] = "Get Hard Ver." } },
    getTemp      = {[0] = 238, 3, 16, 10, 0, 1, 0, 0, len = 6, note = {[CHN] = "�������¶�", [ENG] = "Get Temperature" } },
    getVoltage   = {[0] = 238, 3, 16, 12, 0, 1, 0, 0, len = 6, note = {[CHN] = "���ܵ�ѹ", [ENG] = "Get Voltage" } },
    setLedCurrnet= {[0] = 238, 3, 16, 13, 0, 1, 0, 0, len = 6, note = {[CHN] = "����LED����", [ENG] = "Set Led Current" } },
    openLed      = {[0] = 238, 6, 16, 14, 0, 1, 0, 0, len = 6, note = {[CHN] = "��LED", [ENG] = "Open Led" } },
    closeLed     = {[0] = 238, 6, 16, 14, 0, 0, 0, 0, len = 6, note = {[CHN] = "��LED", [ENG] = "Close Led" } },
    updateCalcSoft={[0] = 238, 6, 16, 4, 0, 0, 0, 0, len = 6, note = {[CHN] = "���¼����", [ENG] = "Update Calc. BD." } },
    
    getDrvVer    = {[0] = 224, 7, 0, 0, 0, 0, 0, 0, len = 6, note = {[CHN] = "�����汾��", [ENG] = "Get Drver BD. Ver" } },
    openValco    = {[0] = 224, 39, 0, 0, 0, 0, 0, 0, len = 6, note = {[CHN] = "��ʮͨ��", [ENG] = "Open Valco" } },
    openV11      = {[0] = 224, 8, 0, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "����11", [ENG] = "Open valve 11" } },
    closeV11     = {[0] = 224, 8, 0, 0, 0, 0, 0, 0, len = 6, note = {[CHN] = "�ط�11", [ENG] = "Close valve 11" } },
    openV12      = {[0] = 224, 9, 0, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "����12", [ENG] = "Open valve 12" } },
    closeV12     = {[0] = 224, 9, 0, 0, 0, 0, 0, 0, len = 6, note = {[CHN] = "�ط�12", [ENG] = "Close valve 12" } },
    enInject1    = {[0] = 224, 15, 0, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "ʹ��ע���", [ENG] = "Enbale injector" } },
    mvInject1To  = {[0] = 224, 13, 0, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "�ƶ�ע���", [ENG] = "Move injector" } },
    setInject1Spd= {[0] = 224, 14, 0, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "����ע����ٶ�", [ENG] = "Set injector speed" } },
    rstInject1   = {[0] = 224, 13, 1, 1, 0, 0, 0, 0, len = 6, note = {[CHN] = "��λע���", [ENG] = "Reset injector" } },
    
    setPwm       = {[0] = 226, 0, 0, 0, 0, 0, 0, 0, len = 6, note={[CHN] = "����4-20mA���",[ENG] = "Set Output "}},
    setPwm4mA    = {[0] = 226, 0, 0, 0, 0, 0, 0, 0, len = 6, note={[CHN] = "У��4mA���",[ENG] = "Set 4mA Adj. "}},
    setPwm20mA   = {[0] = 226, 0, 0, 0, 0, 0, 0, 0, len = 6, note={[CHN] = "У��20mA���",[ENG] = "Set 20mA Adj. "}},
    getIOVer     = {[0] = 226, 7, 0, 0, 0, 0, 0, 0, len = 6, note={[CHN] = "���������汾",[ENG] = "Get I/O Bd. Ver."}},

    getDsTemp    ={[0] = 0xE4, 0x03, 0, 0x06, 0, 2, 0, 0, len = 6,note={[CHN] = "��ȡ�����¶�",[ENG] = "Get Dispel Temp."}},
    getDsHardVer ={[0] = 0xE4, 0x03, 0, 0x00, 0, 2, 0, 0, len = 6,note={[CHN] = "��ȡ����汾",[ENG] = "Get Dispel Ver."}},
    getDsSoftVer ={[0] = 0xE4, 0x03, 0, 0x02, 0, 2, 0, 0, len = 6,note={[CHN] = "��ȡ����汾",[ENG] = "Get Dispel Ver."}},
    getDsStatus  ={[0] = 0xE4, 0x03, 0, 0x0A, 0, 1, 0, 0, len = 6,note={[CHN] = "��ȡ����״̬",[ENG] = "Get Dispel Status"}},
    setDsTemp    ={[0] = 0xE4, 0x10, 0, 0x0F, 0, 1, 2, 0, 0, 0, 0, len = 9,note={[CHN] = "���������¶�",[ENG] = "Set Dispel Temp."}},
    setDsTime    ={[0] = 0xE4, 0x10, 0, 0x10, 0, 2, 4, 0, 0, 0, 0, 0, 0, len = 11,note={[CHN] = "��������ʱ��",[ENG] = "Set Dispel Time"}},
    startDispel  ={[0] = 0xE4, 0x10, 0, 0x12, 0, 1, 2, 0, 0, 0, 0, len = 9,note={[CHN] = "��ʼ����",[ENG] = "Start Dispel"}},
    stopDispel   ={[0] = 0xE4, 0x10, 0, 0x12, 0, 1, 2, 0, 0, 0, 0, len = 9,note={[CHN] = "ֹͣ����",[ENG] = "Stop Dispel"}},
    
    updateDrv = {}, --�ñ�����������������
}



UartArg = {
    repeat_times = 0, --���ڼ�¼�ط�����
    repeat_data, --���ڱ��汾���ط�����
    note = "", --���ڱ��洮��ָ��˵��
    recv_data, --���ڱ�����յ�������
    reply_data = {[0] = 0, [1] = 0 }, --���ڱ�����Ҫ���ܵ��Ļظ�����
    reply_sta = SEND_OK;--����ָʾ���͵Ĵ���ָ���Ƿ�����ȷ�ظ�
    lock = UNLOCKED, --����ָʾ�����Ƿ�����, ������һ����Ҫ�ȴ��ظ��Ĵ���ָ��ʱ,��������, ���յ��ظ�ʱ,���ڽ���
};

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

    for i = 11, 16, 1 do
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
    if Sys.language == CHN then
        uartSendTab.openValco.note[Sys.language] = "��ʮͨ��" .. channel;
    else
        uartSendTab.openValco.note[Sys.language] = "Open Valco " .. channel;
    end
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
--���������¶�
--temp:�¶�
--***********************************************************************************************
function set_dispel_temp(temp)
    uartSendTab.setDsTemp[7] = math.modf(temp/256)
    uartSendTab.setDsTemp[8] = math.fmod(temp,256)
    on_uart_send_data(uartSendTab.setDstemp, NEED_REPLY);
end

--***********************************************************************************************
--��������ʱ��
--time:ʱ��
--***********************************************************************************************
function set_dispel_time(time)
    uartSendTab.setDsTime[7] = math.fmod( right_shift(time,24), 256)
    uartSendTab.setDsTime[8] = math.fmod( right_shift(time,16), 256)
    uartSendTab.setDsTime[9] = math.fmod( right_shift(time,8), 256)
    uartSendTab.setDsTime[10]= math.fmod( time, 256)
    on_uart_send_data(uartSendTab.setTime, NEED_REPLY);
end


--***********************************************************************************************
--  ͨ�����Կ�����������ת
--***********************************************************************************************
function ComputerControl(package)
    local replayData = {note = {[CHN] = "",[ENG] = ""}}
    local crcL,crcH;

    crcL,crcH = CalculateCRC16(package, #package-1);--����crc16
    replayData[0] = package[0];--��ַ
    replayData[1] = package[1];--������
    if crcL == package[#package-1] and crcH == package[#package] then
        --�жϵ�1���ֽ�(����д)
        if package[1] == 3 then----�������Ĵ�����ַ
            local register = package[2] * 256 + package[3]--�Ĵ�����ַ
            local number   = package[4] * 256 + package[5]--�Ĵ�������
            
            replayData[2] = number * 2;
            for i = register, register+number-1, 1 do
                replayData[#replayData +1] = math.modf( ModeBus[i]/256)
                replayData[#replayData +1] = math.fmod(ModeBus[i],256)
            end
            print("register="..string.format("0x%02X",register))
        elseif package[1] == 6 then--д�����Ĵ�����ַ
            -- if package[3] == 4 then--��ʼ����
            --     SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--����Ϊ����״̬
            --     process_ready_run(processId);--��ʼ����ǰ��һЩ��ʼ������
            -- elseif package[3] == 6 then--ֹͣ����
            --     
            -- end
            --��ǰΪ����ģʽ,����д�Ĵ���ָ��
            if get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].controlled then 
            
                
            end
        elseif package[1] == 0x10 then--д����Ĵ������߿���������
            local register = package[2] * 256 + package[3]--�Ĵ�����ַ
            local number   = package[4] * 256 + package[5]--�Ĵ�������
            
            for i=0, 5, 1 do
                replayData[i] = package[i];
            end
            
            --��ǰΪ����ģʽ,����д�Ĵ���ָ��
            if get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].controlled then 
                --��������
                if register == 0x1200 then
                    if package[8] == 0x01 then--����ˮ������
                        Sys.controledProcessTypeId = 1;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x02 then--���������˲�
                        Sys.controledProcessTypeId = 6;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x03 then--�������˲�
                        Sys.controledProcessTypeId = 5;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x04 then--�������̺˲�
                        Sys.controledProcessTypeId = 7;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x05 then--�����հײ���
                        Sys.controledProcessTypeId = 11;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x06 then--����ƽ��������
                        Sys.controledProcessTypeId = 9;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x07 then--�����ӱ���ղ���
                        Sys.controledProcessTypeId = 8;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x08 then--�����հ�У׼
                        Sys.controledProcessTypeId = 12;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x09 then--��������У׼
                        Sys.controledProcessTypeId = 13;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x0A then--�����ſ���ϴ
                        Sys.controledProcessTypeId = 3;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x0B then--ֹͣ����
                        SystemStop(stopByNormal);
                    elseif package[8] == 0x0C then--��������
                        os.execute("shutdown -r -t 0");
                    elseif package[8] == 0x0D then--ʱ��У׼
                        local year = BCD_Decimal(package[9])
                        local mon = BCD_Decimal(package[10])
                        local day = BCD_Decimal(package[11])
                        local hour = BCD_Decimal(package[12])
                        local min = BCD_Decimal(package[13])
                        local sec = BCD_Decimal(package[14])
                        set_date_time(year,mon,day,hour,min,sec);
                    elseif package[8] == 0x0E then--��������ģʽ
                        ModeBus[0x1084] = package[10];
                        if package[10] == 1 then
                            set_text(RUN_CONTROL_SCREEN, RunTypeID, WorkType[Sys.language].hand)
                        elseif package[10] == 2 then
                            set_text(RUN_CONTROL_SCREEN, RunTypeID, WorkType[Sys.language].period)
                        elseif package[10] == 3 then
                            set_text(RUN_CONTROL_SCREEN, RunTypeID, WorkType[Sys.language].timed)
                        elseif package[10] == 4 then
                            set_text(RUN_CONTROL_SCREEN, RunTypeID, WorkType[Sys.language].controlled)
                        end
                        WriteParaToConfigStrAndFile();
                    elseif package[8] == 0x0F then--����ˮ������Ƶ��
                        local freq = package[9] * 256 + package[10];
                        set_text(RUN_CONTROL_PERIOD_SCREEN,9,freq)
                        ModeBus[0x1089] = freq
                        WriteParaToConfigStrAndFile();
                    elseif package[8] == 0x10 then--�������˲�Ƶ��
                        local freq = package[9] * 256 + package[10];
                        sget_text(RUN_CONTROL_PERIOD_SCREEN,16,freq)
                        ModeBus[0x108A] = freq
                        WriteParaToConfigStrAndFile();
                    elseif package[8] == 0x11 then--�������̺˲�Ƶ��
                        local freq = package[9] * 256 + package[10];
                        get_text(RUN_CONTROL_PERIOD_SCREEN,14,freq)
                        ModeBus[0x108B] = freq
                        WriteParaToConfigStrAndFile();
                    elseif package[8] == 0x12 then--���ñ����˲�Ƶ��
                        local freq = package[9] * 256 + package[10];
                        get_text(RUN_CONTROL_PERIOD_SCREEN,18,freq)
                        ModeBus[0x108C] = freq--�����˲�Ƶ��
                        WriteParaToConfigStrAndFile();
                    elseif package[8] == 0x13 then--�����궨(У׼)
                        Sys.controledProcessTypeId = 2;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                    elseif package[8] == 0x14 then--�������Ժ˲�
                        Sys.controledProcessTypeId = 10;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    elseif package[8] == 0x15 then--����ʵ��ˮ���ȶ�
                        Sys.controledProcessTypeId = 14;
                        if package[10] ~= nil then
                            Sys.controledRangeId = package[10];
                        else
                            Sys.controledRangeId = 1;
                        end
                        process_ready_run(controledProcessId);
                    end
                end
            end
        end
    else--crc����
        replayData[1] = package[1] + 0x80;--��������
    end
    replayData.note[CHN] = "�ظ���λ��"..string.format("0x%02X",package[1]).."ָ��"
    replayData.note[ENG] = "reply computer's "..string.format("0x%02X",package[1]).."cmd"
    replayData.len = #replayData+1;--��ȥ���ֽڵ�crc
    on_uart_send_data(replayData, NO_NEED_REPLY) --�ظ�
end


--***********************************************************************************************
--[���ڽ��ܺ��� 
--���ڲ�����Ϊ38400, ����1bit��Ҫ 1000000/38400 = 26us, ����һ���ֽڵ�������Ҫ10bit,����1Byte������Ҫ260us
--***********************************************************************************************
function on_uart_recv_data(packet)

    --�����ܵ������ݱ��浽ȫ�ֱ���
    UartArg.recv_data = packet;

    --���ͨ�ż�¼
    local UartDateTime = string.format("%02d-%02d %02d:%02d", Sys.dateTime.mon, Sys.dateTime.day, Sys.dateTime.hour, Sys.dateTime.min);
    local UartData = "";--����Ҫ���͵����ݱ��浽���ַ�����
    for i = 1, #packet, 1 do
        UartData = UartData .. string.format("%02X ", packet[i]);
    end
    if Sys.flag_save_uart_log == ENABLE then
        record_add(HAND_OPERATE4_SCREEN, UartRecordId, "RX;" .. UartDateTime .. ";" .. UartData .. "; ")-- .. TipsTab[Sys.language].reply);
    end

    --�жϵ�0���ֽ�(��ַ)
    print(packet[0].."?="..tonumber(get_text(IN_OUT_SCREEN, IOSET_ComputerAddr)))
    if packet[0] == tonumber(get_text(IN_OUT_SCREEN, IOSET_ComputerAddr)) then--��λ�����͵Ĵ�������
        ComputerControl(packet)
    elseif packet[0] == UartArg.reply_data[0] and packet[1] == UartArg.reply_data[1] then --������ģ�鷵�ص�����
        UartArg.repeat_times = 0;--�ط�������0
        UartArg.reply_sta = SEND_OK;
        UartArg.lock = UNLOCKED;
        stop_timer(1)--ֹͣ��ʱ��ʱ��
    end
end

--***********************************************************************************************
--[���ڷ��ͺ���
--packet : ȡֵΪuartSendTab�еĲ���, ����uartSendTab.openV11
--reply : ��ʾ�Ƿ���Ҫ�ȴ��ظ�,ȡֵ NEED_REPLY  �� NO_NEED_REPLY
--***********************************************************************************************
function on_uart_send_data(packet, reply)
    if UartArg.lock == LOCKED then
        return;
    end

    if reply == NEED_REPLY then --��ʾ��Ҫ�ȴ��ظ�
        start_timer(1, 2000, 1, 0); --������ʱ��1����ʱʱ�� 2s, 1->ʹ�õ���ʱ��ʽ,0->��ʾ�����ظ�
        UartArg.lock = LOCKED;      --����������, �յ��ظ����Զ�����
        UartArg.repeat_data = packet;--�����ط�����
        UartArg.repeat_times = 0;
        UartArg.reply_data[0] = packet[0];--���ûظ�����,�����ж��Ƿ�ɹ����ܵ��ظ�
        UartArg.reply_data[1] = packet[1];
    end

    packet[packet.len], packet[packet.len + 1] = CalculateCRC16(packet, packet.len);--����crc16
    UartArg.reply_sta = SEND_FAIL;
    uart_send_data(packet) --������ͨ�����ڷ��ͳ�ȥ
    UartArg.note = packet.note[Sys.language];--�ڱ��洮�ڻظ���ʱ����־ʱ����Ҫ�õ�UartArg.note

    --���´��빦��: ÿ����һ������,�ͽ������ݱ������ֶ�����4�Ĵ����շ���¼����,����Ӵ������鿴.
    local UartDateTime = string.format("%02d-%02d %02d:%02d", Sys.dateTime.mon, Sys.dateTime.day, Sys.dateTime.hour, Sys.dateTime.min);
    local UartData = "";--����Ҫ���͵����ݱ��浽���ַ�����
    --�ж�Ϊ��������,ֻ����ǰ6�ֽ�������ֽڵ�CRC
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
    --�ж��Ƿ�򿪴���ͨ�ż�¼����
    if Sys.flag_save_uart_log == ENABLE then
        record_add(HAND_OPERATE4_SCREEN, UartRecordId, "TX;" .. UartDateTime .. ";" .. UartData .. ";" .. packet.note[Sys.language]);--
    end

end



--***********************************************************************************************
--[���ڽ��ܳ�ʱ����
--���뵽�ú�����ʾ����һ���ظ���ʱ, ��Ϊ����ظ��ɹ�, ��on_uart_recv_data�����оͻ�ֹͣ��ʱ��1,�Ͳ�����뵽�ú���
--***********************************************************************************************
function uart_time_out()
    UartArg.repeat_times = UartArg.repeat_times + 1;
    if UartArg.repeat_times <= 5 then
        uart_send_data(UartArg.repeat_data);--�����ط�
    else  --�ط�3�ζ�û�лظ�,�����ط�
        print("���ڽ��ܳ�ʱ");
        --�ж�Ϊ��������������,��ʱ����ʧ��
        if UartArg.repeat_data[0] == 208 and UartArg.repeat_data[1] == 16 and UartArg.repeat_data[2] == 48 then
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
        Sys.alarmContent = UartArg.note .. TipsTab[Sys.language].uartTimeOut;--��ʼ���������ݣ����ڻظ���ʱ��
        add_history_record(HISTORY_ALARM_SCREEN);--��¼��������
        ShowSysAlarm(Sys.alarmContent);--�ڵײ�״̬����ʾ������Ϣ
    end
end



--[[-----------------------------------------------------------------------------------------------------------------
    ��ҳ/״̬����ʾ����
--------------------------------------------------------------------------------------------------------------------]]
LastAnalysisTimeId = 20;   --����ʱ��
LastAnalyteId = 17;        --������
LastResultId = 18; --�������
LastResultUnitId = 19;   --��λ
LastResultE1Id = 25;     --E1
LastResultE2Id = 26;     --E2
-- NextProcessTimeTextId = 2  --�´�����ʱ��
ProgressBarId = 14--����������Χ0-100
DispelTempId = 10;
SysWorkStatusId = 901;   --����״̬
SysCurrentActionId = 902;--��ǰ����
SysUserNameId = 903      --��ʾ�û�
SysAlarmId = 904;        --��ʾ��ǰ�澯��Ϣ
SysTipsId = 905;         --����ײ�������ʾ��ʾ��Ϣ���ı�id

StopSystemDialogMenuId = 3;
StartTimeId = 4;
NextStartTimeId = 6;

function main_control_notify(screen, control, value)
    if control == StopSystemDialogMenuId and value == ENABLE then
        SystemStop(stopByClickButton);
    end
end


--***********************************************************************************************
--  �ڵײ���״̬����ʾ��ʾ��Ϣ
--***********************************************************************************************
function ShowSysTips(tips)
    for i = 1, #PublicTab, 1 do
        set_text(PublicTab[i], SysTipsId, tips);
    end
    stop_timer(3);
    start_timer(3, 5000, 1, 0) --������ʱ�� 3����ʱʱ�� 5000ms,1->ʹ�õ���ʱ��ʽ,1->��ʾִֻ��һ��
end

--***********************************************************************************************
--  ���ù���״̬
--***********************************************************************************************
function SetSysWorkStatus(status)

    --״̬�иı�,����ǰ״̬���µ���¼�ؼ�
    if Sys.status ~= status then
        Sys.lastInfo[lastStatus] = status
        saveLastInfo()
    end

    Sys.status = status;--����ϵͳ״̬Ϊ����
    --�ڵײ���״̬����ʾ����״̬:ֹͣ/����/����
    for i = 1, #PublicTab, 1 do
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
    for i = 1, #PublicTab, 1 do
        set_text(PublicTab[i], SysCurrentActionId, action);
    end
end


--***********************************************************************************************
--  �ڵײ���״̬����ʾ�澯��Ϣ
--***********************************************************************************************
function ShowSysAlarm(alarm)
    for i = 1, #PublicTab, 1 do
        set_text(PublicTab[i], SysAlarmId, alarm);
        if alarm == TipsTab[Sys.language].null then
            set_fore_color(PublicTab[i], SysAlarmId, BLACK);--��ɫ
        else
            set_fore_color(PublicTab[i], SysAlarmId, RED);--��ɫ
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
RunTypeID = 1;--���з�ʽ��Ӧ���ı��ռ�ID
AnalyteSetId = 2;--������ѡ��
CodeSetId = 3;--����
OfflineModeId = 4;--����ģʽ
ReagentRemainChkId = 5;--�Լ���������
RangeAutoSwitchId = 6;--�����Զ��л�
SuddenPwrOffProcessId = 7;--�쳣�ϵ�ִ�е�����
DecimalTextId = 8;--С��λ������
SuddenPowerOff = 107;--�쳣�ϵ�����ѡ��

RunTypeMenuId = 243;--���з�ʽ�˵�
RunStopBtId = 229;--����״̬�л���ť"��ʼ��""ֹͣ"��ť
RunModeSetBtId = 25; --����ģʽ���ð�ť
RUNCTRL_TextSid = 1;
RUNCTRL_TextEid = 8;

--***********************************************************************************************
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--***********************************************************************************************
function run_control_notify(screen, control, value)
    if control == RunStopBtId then--������ֹͣ��ť
        if get_value(RUN_CONTROL_SCREEN, control) == ENABLE then --��ť����,��ʱϵͳ״̬��Ϊ��������
            if get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].period then--
                setPeriodStartTime();--����ǰʱ������Ϊ���ڿ�ʼʱ��
            end
            SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--����Ϊ����״̬
            process_ready_run(processId);--��ʼ����ǰ��һЩ��ʼ������
        else--��ť�ɿ�,��ʱϵͳ״̬Ӧ��Ϊֹͣ
            Sys.logContent = TipsTab[Sys.language].stopByHand;--"�ֶ�ֹͣϵͳ"
            add_history_record(HISTORY_LOG_SCREEN);--���һ��ֹͣ���̵���־��Ϣ
            SystemStop(stopByClickButton);
        end
    --���з�ʽ---------------------------------------------------------------------
    elseif control == RunTypeMenuId then
        setModebusRunMode();
        if get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].controlled then--�ж�Ϊ����, �������а�ť
            set_visiable(RUN_CONTROL_SCREEN, RunStopBtId, 0);
        else
            set_visiable(RUN_CONTROL_SCREEN, RunStopBtId, 1);
        end
    --���ð�ť----------------------------------------------------------------------
    elseif control == RunModeSetBtId and value == ENABLE then
        if get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].period then--�ж�Ϊ����ģʽ
            change_screen(RUN_CONTROL_PERIOD_SCREEN);
        elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].timed then--�ж�Ϊ��ʱģʽ
            change_screen(RUN_CONTROL_TIMED_SCREEN);
        elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].hand then--�ж�Ϊ�ֶ�ģʽ
            change_screen(RUN_CONTROL_HAND_SCREEN);
        elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].controlled then--�ж�Ϊ����ģʽ
        end
    --������----------------------------------------------------------------------
    elseif control == AnalyteSetId then
        set_text(MAIN_SCREEN, LastAnalyteId, get_text(RUN_CONTROL_SCREEN, AnalyteSetId));
    elseif control == CodeSetId then --���ӱ���
        local code = tonumber(value);
        ModeBus[0x1000] = right_shift(code,16);
        ModeBus[0x1001] = math.fmod(code, 65536);
    --�쳣�ϵ�����ѡ��-------------------------------------------------------------
    elseif control == SuddenPowerOff then
        process_name_select_set(screen, control-100);
    --���水ť---------------------------------------------------------------------
    elseif control == 50 and value == ENABLE then
        WriteParaToConfigStrAndFile();
    end
end


--***********************************************************************************************
--���޸���ĳ������ʱ,���øú���,һ�㰴����������ѡ������е�ȷ�ϰ�ť����øú���
--control ���п��ƽ����������ı���id
--***********************************************************************************************
function getProcessIdByName(processName)
    local processId = 0;
    if processName == BLANK_SPACE then
        return processId;
    end
    --��������1-12, �ҵ����п��ƽ��������õ���������,����������1�����ж�Ӧ���������
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then
            processId = i;
            break;
        end
    end
    if processId == 0 then
        --��������13-24, �ҵ����п��ƽ��������õ���������,����������1�����ж�Ӧ���������
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
--�ж��Ƿ�����
--����1��ʾ����, ����0��ʾƽ��
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
--���ݼ��ϵ�����,�����µĿ�ʼ����
--diffDays:��Ҫ���ϵ�����
--***********************************************************************************************
function set_period_start_date(diffDays, dateTime)
    local normalMonthDays = {[1] = 31, [2] = 28, [3] = 31, [4] = 30, [5] = 31, [6] = 30, [7] = 31, [8] = 31, [9] = 30, [10] = 31, [11] = 30, [12] = 31 };
    local year = dateTime.year
    local mon = dateTime.mon
    local day = dateTime.day
    --1.get years (days >=366 or 365)
    local daysAyear = 365;
    if isLeapYear(year) then
        daysAyear = 366;
    end
    while math.modf(diffDays / daysAyear) >= 1 do -- ����365�����366��
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

    return year,mon,day
end

--***********************************************************************************************
--����Ƶ��������һ�ο�ʼ��ʱ��, ���Զ�ģʽ��, ����һ�����̺����øú��������´����̿�ʼʱ��.
--minFreq: ����
--return : ���Ϲ̶����Ӻ��ʱ��
--***********************************************************************************************
function getNewTimeByFreq(minFreq, dateTime)
    local dayHour = 1440;--24 * 60 һ���ж��ٷ���
    local minTotal = minFreq + dateTime.hour * 60 + dateTime.min;
    local minRemain = math.fmod(minTotal, dayHour);
    local diffDays = math.modf(minTotal / dayHour)
    local year, mon, day, hour, min
    
    hour = math.modf(minRemain / 60);
    min = math.fmod(minRemain, 60);

    if diffDays ~= 0 then
        year, mon, day =  set_period_start_date(diffDays, dateTime);--�ڸú�����������/����
    else
        year = dateTime.year;
        mon = dateTime.mon;
        day = dateTime.day;
    end

    return year,mon,day,hour,min
end

--***********************************************************************************************
--����Ƶ��������һ�ο�ʼ��ʱ��, ���Զ�ģʽ��, ����һ�����̺����øú��������´����̿�ʼʱ��.
--minFreq: ����
--return : ���Ϲ̶����Ӻ��ʱ��
--***********************************************************************************************
function setNextPeriodTime(minFreq)

    PeriodicTab.sTime.year,PeriodicTab.sTime.mon,PeriodicTab.sTime.day,PeriodicTab.sTime.hour,PeriodicTab.sTime.min  = getNewTimeByFreq(minFreq, Sys.dateTime)

    --���������ý��������´����ڿ�ʼʱ��
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.yearId, PeriodicTab.sTime.year);
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.monId, PeriodicTab.sTime.mon );
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.dayId, PeriodicTab.sTime.day );
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.hourId, PeriodicTab.sTime.hour);--����Сʱ
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.minId, PeriodicTab.sTime.min);--���÷���

    --�������ý����и���, ��Ҫ���浽�����ļ�����
    WriteParaToConfigStrAndFile();

    --����ҳ��ʾ�´��Զ������������̵�ʱ��
    set_text(MAIN_SCREEN, NextStartTimeId, string.format("%d-%02d-%02d  %02d:%02d",
             PeriodicTab.sTime.year,PeriodicTab.sTime.mon,PeriodicTab.sTime.day,
             PeriodicTab.sTime.hour,PeriodicTab.sTime.min));
end

--***********************************************************************************************
--����ǰʱ������Ϊ���ڿ�ʼʱ��
--***********************************************************************************************
function setPeriodStartTime()
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.yearId, Sys.dateTime.year);
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.monId,  Sys.dateTime.mon );
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.dayId,  Sys.dateTime.day);
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.hourId, Sys.dateTime.hour);--����Сʱ
    set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.minId,  Sys.dateTime.min);--���÷���
    WriteParaToConfigStrAndFile();--�������ý����и���, ��Ҫ���浽�����ļ�����
end

--***********************************************************************************************
--ͨ���������ͳ�ʼ�����̱�ʶ
--***********************************************************************************************
function getTagByProcessType(type)
    local tag = "";
    if type == ProcessItem[Sys.language][1] then--ˮ������
        tag = "at"
    elseif type == ProcessItem[Sys.language][5] then--"���˲�"
        tag = "dz"
    elseif type == ProcessItem[Sys.language][6] then--"�����˲�"
        tag = "sc"
    elseif type == ProcessItem[Sys.language][7] then--"���̺˲�"
        tag = "ds"
    elseif type == ProcessItem[Sys.language][8] then-- "�ӱ����"
        tag = "ra"
    elseif type == ProcessItem[Sys.language][9] then--"ƽ����"
        tag = "pt"
    elseif type == ProcessItem[Sys.language][10] then--"���Ժ˲�"
        tag = "lc"
    elseif type == ProcessItem[Sys.language][11] then--"�հײ���"
        tag = "bt"
    elseif type == ProcessItem[Sys.language][12] then--"�հ�У׼"
        tag = "bs"
    elseif type == ProcessItem[Sys.language][13] then--"����У׼"
        tag = "cs"
    elseif type == ProcessItem[Sys.language][13] then--"ʵ��ˮ���ȶ�"
        tag = "ac"
    end
    return tag;
end

--***********************************************************************************************
--[����ģʽ��,��ȡ��Ҫ���е�����id
--***********************************************************************************************
function get_period_process_id()
    local processId = 0;
    --�жϱ�����Ҫ������һ������
    for i = 2,#PeriodicTab,1 do
        if PeriodicTab[i].isReadyRun == true then
            processId = getProcessIdByName(get_text(RUN_CONTROL_PERIOD_SCREEN,PeriodicTab[i].processNameId ));
            if i == 6 then--�ж�Ϊ�����˲�
                --��¼�����˲����ʱ��,��ʱ�������ж��Ƿ���6Сʱ
                local year,mon,day,hour,min = getNewTimeByFreq(6*60, Sys.dateTime);--��ǰʱ�����6Сʱ���ʱ��
                
                Sys.checkEndTime =  string.format("%d%02d%02d%02d%02d",year, mon, day, hour, min);
            end
            break;
        end
    end
    return processId;
end


--***********************************************************************************************
--����ģʽ��,�Զ������˲鲻�ϸ�ʱ��ȡ��Ҫ���е�����id
--***********************************************************************************************
function get_auto_check_process_id()
    local processId = 0;
    --��ǰΪ��������-�����˲�-------------------------------------------
    if Sys.processName == get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[6].processNameId) then
        --��ȡ"��������-У׼1"������id
        processId = getProcessIdByName(get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[2].processNameId));
    --��ǰΪ��������-У׼1----------------------------------------------
    elseif Sys.processName == get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[2].processNameId) then
        processId = getProcessIdByName(get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[3].processNameId));--�ж�У׼2�Ƿ�����������
        if processId == 0 then
            processId = getProcessIdByName(get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[6].processNameId));--û������У׼2,����������˲�
        end
    --��ǰΪ��������-У׼2----------------------------------------------
    elseif Sys.processName == get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[3].processNameId) then
        processId = getProcessIdByName(get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[6].processNameId));
    end
    return processId;
end

--***********************************************************************************************
--[��ȡ�Զ������л�ʱ��Ҫ���е�����id
--�������ʼ��ťʱ,���øú�����ȡ��Ҫִ�е�����id
--***********************************************************************************************
function get_auto_range_process_id()
    local destRangeId = 0;
    local processId = 0;

    --�ж��Ƿ�����Զ������л�
    if get_text(RUN_CONTROL_SCREEN, RangeAutoSwitchId) == VariableOnOff[Sys.language].close then
        return processId;
    end

    --Ũ��ƫ�ߵ�ǰ����Ϊ1
    if Sys.rangetypeId == 1 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN, RangeTab[1].HighId)) then
        destRangeId = 2;
        --Ũ��ƫ�ߵ�ǰ����Ϊ2
    elseif Sys.rangetypeId == 2 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN, RangeTab[2].HighId)) then
        destRangeId = 3;
        --Ũ��ƫ�͵�ǰ����Ϊ2
    elseif Sys.rangetypeId == 2 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN, RangeTab[2].LowId)) then
        destRangeId = 1;
        --Ũ��ƫ�͵�ǰ����Ϊ3
    elseif Sys.rangetypeId == 3 and Sys.result >= tonumber(get_text(RANGE_SET_SCREEN, RangeTab[3].LowId)) then
        destRangeId = 2;
    end

    if destRangeId == 0 then
        return processId;
    end

    print("�����Զ��л�,��������Ϊ" .. destRangeId .. "������");

    --��������Ϊ����������ΪdestRangeId�� ���̵�id
    for i = 1, 12, 1 do
        if get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId) == ProcessItem[Sys.language][1] and--����Ϊ����
        tonumber(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId)) == destRangeId then--����ΪĿ������
            processId = i;
            break;
        end
    end
    if processId == 0 then--����������1����δ�ҵ���������������, ������������2�����������
        for i = 13, 24, 1 do
            if get_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId) == ProcessItem[Sys.language][1] and--����Ϊ����
            tonumber(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].rangeId)) == destRangeId then--����ΪĿ������
                processId = i;
                break;
            end
        end
    end
    --����ҵ��������Զ��л�������, �򱣴�һ��log��¼
    if processId ~= 0 then
        Sys.logContent = TipsTab[Sys.language].autoRangeProcess .. processId;
        ShowSysTips(Sys.logContent);
        add_history_record(HISTORY_LOG_SCREEN);
    end
    return processId;
end

--***********************************************************************************************
--[�����»�ȡ����id
--***********************************************************************************************
function get_controled_process_id()
    local processId = 0;

    --��������Ϊ����������ΪdestRangeId�� ���̵�id
    for i = 1, 12, 1 do
        if get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId) == ProcessItem[Sys.language][Sys.controledProcessTypeId] and--����Ϊ����
        tonumber(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId)) == Sys.controledRangeId then--����ΪĿ������
            processId = i;
            break;
        end
    end
    if processId == 0 then--����������1����δ�ҵ���������������, ������������2�����������
        for i = 13, 24, 1 do
            if get_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId) == ProcessItem[Sys.language][Sys.controledProcessTypeId] and--����Ϊ����
            tonumber(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].rangeId)) == Sys.controledRangeId then--����ΪĿ������
                processId = i;
                break;
            end
        end
    end
    return processId;
end

--***********************************************************************************************
--[��ȡ����id
--�������ʼ��ťʱ,���øú�����ȡ��Ҫִ�е�����id
--***********************************************************************************************
function get_current_process_id()

    local processId = 0;
    if Sys.status == WorkStatus[Sys.language].run then--��ǰ״̬Ϊ����,ֱ�ӷ���; ���Ϊֹͣ���ߴ������������ִ��.
        return Sys.currentProcessId;
    end

    --��һ�ζϵ�Ϊ����״̬,�жϵ�����Id��Ϊ0
    if Sys.suddenPwrOff == true then
        Sys.suddenPwrOff = false;
        processId = getProcessIdByName(get_text(RUN_CONTROL_SCREEN,SuddenPwrOffProcessId))--�쳣�ϵ�����
        return processId;
    end
    --------------------------�ֶ�ģʽ ,����Ƚϼ�,ֻ��һ�����̿�����--------------------------------
    if get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].hand then
        --�ֶ�ģʽ��,������ܹ������˼�������
        Sys.handProcessTotal = 0;
        for i = 1, #HandProcessTab, 1 do
            if get_text(RUN_CONTROL_HAND_SCREEN,i) ~= BLANK_SPACE then
                Sys.handProcessTotal = Sys.handProcessTotal + 1;
            end
        end
        
        local real_i = 0;
        --��Ϊ����������5��(#HandProcessTabֵΪ5),������Ҫѭ������6��,�γ�һ���ջ�
        for i = Sys.handProcessIndex, Sys.handProcessIndex + #HandProcessTab, 1 do 
            if i > #HandProcessTab then
                real_i = i - #HandProcessTab;
            else
                real_i = i;
            end
           
            --������Ų�Ϊ0 ,��ʾ������������,����ѭ��
            processId = getProcessIdByName(get_text(RUN_CONTROL_HAND_SCREEN, HandProcessTab[real_i].textId))
            if processId  ~= 0 then
                Sys.handProcessIndex = real_i;
                break;
            end
        end
        ----------------------����ģʽ  -----------------------------------------------------
    elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].period then
        local currentDateTime = string.format("%d%02d%02d%02d%02d",
        Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day,Sys.dateTime.hour, Sys.dateTime.min);--����ǰʱ��ת��Ϊ�ַ���

        Sys.periodStartDateTime = string.format("%d%02d%02d%02d%02d",
                                    tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.yearId)), 
                                    tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.monId )), 
                                    tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.dayId )), 
                                    tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.hourId)), 
                                    tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab.sTime.minId )));

        if get_value(RUN_CONTROL_PERIOD_SCREEN,PeriodicTab[1].enableId) == ENABLE and
           get_text (RUN_CONTROL_PERIOD_SCREEN,PeriodicTab[1].processNameId) ~= BLANK_SPACE then
            local processName = get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[1].processNameId);
            if Sys.periodStartDateTime <= currentDateTime and processName ~= BLANK_SPACE then
                --���õ����ڿ�ʼʱ�䵽��,��ˮ���������̲�Ϊ��
                processId = getProcessIdByName(processName);
                
                --�����´����ڿ�ʼʱ��
                setNextPeriodTime(tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN,PeriodicTab[1].freqId)));
            end
        else
            for i = 2,#PeriodicTab,1 do 
                 if get_value(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[i].enableId) == ENABLE and
                    get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[i].processNameId) ~= BLANK_SPACE then
                    PeriodicTab[i].isReadyRun = true;--�ñ�־λ��ֵtrue,��ʾ�ﵽ���������е�������.
                end
            end
            processId = get_period_process_id();
        end
    ----------------------��ʱģʽ ��ָ����ʱ�������ָ��������--------------------------
    elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].timed then
        local index = Sys.dateTime.hour+1;
        local processName = get_text(RUN_CONTROL_TIMED_SCREEN, index);
        if   processName ~= BLANK_SPACE and TimedProcessTab[index].isFinished == false then --�Ƿ�����������
            processId = getProcessIdByName(processName);
            TimedProcessTab[index].isFinished = true;
        end

        TimedProcessTab[index+1].isFinished = false;--���¸�Сʱ��Ҫ���е����̱�־�����,��֤ʱ�䵽��֮���ܹ�����
    -------------------------------------------------����-----------------------------------------------
    elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].controlled then

    end

    return processId;
end


--***********************************************************************************************
--��ֹ����������صĲ���
--state : ȡֵ ENABLE / DISABLE
--***********************************************************************************************
function set_process_edit_state(state)
    --------------------------------��������1/2/3����Ĳ���------------------------------
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

    ----------------------------���ϸ������е�""ȷ��"��ť-----------------------------------------
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
--[��ȡ��������������
--actionNumber:��ǰ����Ϊ�ڼ���
--***********************************************************************************************
function LoadActionStr(index)
    Sys.processActionTab = readFileToTab(SdPath .. "config/" .. index)
    if #Sys.processActionTab == 0 then    
        ShowSysTips("δ�ҵ������ļ�");
        return;
    end
    
    --��������id��ȡ������������������-----------------------------------------------
    local tagString = GetSubString(ConfigStr[0], cfgFileTab[1].sTag, cfgFileTab[1].eTag);--��ȡ<ProcessSet>��ǩ֮����ַ���
    local tab = split(tagString, ",")--���������ַ��������ŷָ�,���Դ˴���tab��
    Sys.processType = tab[index * 3 - 2];
    Sys.processName = tab[index * 3 - 1];
    Sys.processRange = tab[index * 3 - 0];
    Sys.processTag = getTagByProcessType(Sys.processType);
    -- print("����Id="..index.."����="..Sys.processType.." ����="..Sys.processName.. " ����="..Sys.processRange);
    if index <= 12 then
        Sys.rangetypeId = tonumber(get_text(PROCESS_SET1_SCREEN, ProcessTab[index].rangeId));
    elseif index <= 24 then
        Sys.rangetypeId = tonumber(get_text(PROCESS_SET2_SCREEN, ProcessTab[index].rangeId));
    end

    --ͳ��action����,��Sys.actionTotal����,�Լ�SystemArg.actionTab��ֵ ----------------------
    --Sys.actionTab���鳤��Ϊ36,��ʾ���ɼ�¼36��action, ��ֵ������ǵ�ǰ�����Ӧ��action���
    --����SystemArg.actionIdTab[1] = 3, ��ʾ��һ����ִ�����Ϊ3��action, Ҳ��ζ�����Ϊ1/2��actionΪ�ո�(û������)
    Sys.actionTotal = 0;
    --�����̱༭1�����еĶ���id �� �������Ʊ��浽 tab������
    for i = 1, MaxAction, 1 do -- tab��[1][2]�ֱ𱣴���һ������������������,ռ����2��, ����������ͳ��action����,�������ﲽ����Ҫ����Ϊ2
        local contentTabStr = GetSubString(Sys.processActionTab[i], "<type>", "</type>");--�ٽ�ȡ<content>��ǩ�е�����
        local tab = split(contentTabStr, ",");--�ָ��ַ���,�����ַ�������tab����
        if tab[1] ~= BLANK_SPACE then--�ж϶������Ͳ�Ϊ��
            Sys.actionTotal = Sys.actionTotal + 1;--action����+1
            Sys.actionIdTab[Sys.actionTotal] = Sys.processActionTab[i];
            Sys.actionNameTab[Sys.actionTotal] = tab[2];--��������
        end
    end

    ------------------------�Լ������ж�----------------------------------------------------------
    --ͳ�����������,��Ҫ���ĵĸ��Լ�������
    Sys.reagentStatus = RESET;
    local reagentUse = {[1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0 };
    local reagentPreRemain = {};
    for i = 1, 6, 1 do
        reagentPreRemain[i] = tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].remainId));
    end
    for i = 1, Sys.actionTotal, 1 do
        local actionStr = Sys.processActionTab[i]--��ȡһ�������ַ�������
        local typeStr = GetSubString(actionStr, "<type>", "</type>");--��������������
        local typeTab = split(typeStr, ",");--���������������Ʒ���tab����
        local contentTabStr = GetSubString(actionStr, "<content>", "</content>");--�ٽ�ȡ<content>��ǩ�е�����
        local contentTab    = split(contentTabStr, ",");--�ָ��ַ���,�����ַ�������tab����
        --�ж��Ƿ�Ϊע��ü�Һ
        if typeTab[1] == ActionItem[Sys.language][3] then
            if contentTab[9] == ENABLE_STRING then--ע��ü�Һ������Լ�һ����ѡ��
                local index = tonumber(contentTab[62])--�Լ����
                reagentUse[index] = tonumber(contentTab[61])--�Լ�����
                print("�������̽������Լ�" .. index .. ":" .. reagentUse[index] .. "mL");
                if reagentPreRemain[index] > reagentUse[index] then
                    reagentPreRemain[index] = reagentPreRemain[index] - reagentUse[index];
                else
                    reagentPreRemain[index] = 0;
                end
                print("�Լ�" .. index .. "����ʣ��" .. reagentPreRemain[index] .. "mL");
            end
        end
    end
    --������������̺�,�Լ�������, �����������뱨��ֵ���бȽ�
    for i = 1, 6, 1 do
        --1.����Ƿ������Լ�������� ;�Լ��������ڱ���ֵ
        if get_text(RUN_CONTROL_SCREEN, ReagentRemainChkId) == VariableOnOff[srcLanguage].open and
           reagentPreRemain[i] <= tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].alarmId)) then

            Sys.alarmContent = TipsTab[Sys.language].lack .. get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].nameId);--��ʼ���������ݣ����ڻظ���ʱ��
            add_history_record(HISTORY_ALARM_SCREEN);--��¼��������
            ShowSysAlarm(Sys.alarmContent);--�ڵײ�״̬����ʾ������Ϣ
            Sys.reagentStatus = SET;
        end
    end
end


--***********************************************************************************************
--[����ִ����ں���  
--processIdType: ����Ϊ processId,����get_current_process_id������ȡid
--               ����Ϊ autoRangeProcessId,����get_auto_range_process_id������ȡid,�ò���һ����ִ���Զ������л���ʱ��ʹ��
--***********************************************************************************************
function process_ready_run(processIdType)
    if processIdType == autoRangeProcessId then--�Զ������л���ȡ����id
        Sys.currentProcessId = get_auto_range_process_id();
    elseif processIdType == periodProcessId then--�������л�ȡ����id
        Sys.currentProcessId = get_period_process_id();
    elseif processIdType == autoStdCheck then--�Զ������˲��߼���ȡ����id
        Sys.currentProcessId = get_auto_check_process_id();
    elseif processIdType == controledProcessId then--����ģʽ�»�ȡ����id
        Sys.currentProcessId = get_controled_process_id();
    elseif processIdType == linearProcessId then
        Sys.currentProcessId = Sys.currentProcessId;
    else
        Sys.currentProcessId = get_current_process_id();--��ȡ��ǰ��Ҫ���е�����id
    end
    if Sys.currentProcessId ~= 0 then--������0,��ʾ���������������̴�ִ��,
        -- set_process_edit_state(DISABLE);           --��ֹ����������صĲ���
        LoadActionStr(Sys.currentProcessId);       --��ȡ��������
        print("LoadActionStr���");
        if Sys.reagentStatus == SET then           --��ǰȱҺ,��ִ������
            SystemStop(stopByNormal);
            ShowSysAlarm(Sys.alarmContent);        --�ڵײ�״̬����ʾȱҺ������Ϣ, ��ΪSystemStop����ձ�����Ϣ
            return;
        end
        if SdPath == nil then --δ��⵽SD��
            SystemStop(stopByNormal);
            Sys.alarmContent = TipsTab[Sys.language].noSdcard;
            ShowSysAlarm(Sys.alarmContent);
            return;
        end
        Sys.startTime = Sys.dateTime;
        Sys.driverSubStep = 1; --���в��趼�Ǵ�1��ʼ
        Sys.actionStep = 1;
        Sys.actionSubStep = 1;
        Sys.driverStep = 1;
        Sys.driverSubStep = 1;
        Sys.flag_save_uart_log = ENABLE;--�򿪴���ͨ����־��¼����
        set_value(MAIN_SCREEN, ProgressBarId, 0);--���ý�������ֵΪ0
        Sys.logContent = WorkStatus[Sys.language].run .. "\"" .. Sys.processName .. "\"";--�����С�+��������
        add_history_record(HISTORY_LOG_SCREEN);--���һ����־��Ϣ
        ShowSysAlarm(TipsTab[Sys.language].null);--��ձ���
        set_text(MAIN_SCREEN, LastResultE1Id, 0);--E1��ʾ��0
        set_text(MAIN_SCREEN, LastResultE2Id, 0);--E2��ʾ��0
        set_text(MAIN_SCREEN, StartTimeId, string.format("%d-%02d-%02d  %02d:%02d",--��ʾ�����������̵�ʱ��
                 Sys.startTime.year, Sys.startTime.mon, Sys.startTime.day,Sys.startTime.hour, Sys.startTime.min));
        SetSysWorkStatus(WorkStatus[Sys.language].run);--���ù���״̬Ϊ����,��ʱ���ж��м�⵽����״̬��,����ת��excute_process??��ִ����??
        SetModebusSysStatus();--����Modebus
    end
end

--***********************************************************************************************
--[������ִ�к���
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
        local typeString = GetSubString(Sys.actionIdTab[Sys.actionStep], "<type>", "</type>");--��������������
        local tab = split(typeString, ",");--���������������Ʒ���tab����
        Sys.actionType    = tab[1];--��ȡ��������
        Sys.contentTabStr = GetSubString(Sys.actionIdTab[Sys.actionStep], "<content>", "</content>");--�ٽ�ȡ<content>��ǩ�е�����
        Sys.contentTab    = split(Sys.contentTabStr, ",");--�ָ��ַ���,�����ַ�������tab����
        ShowSysCurrentAction(Sys.processName .. ":" .. Sys.actionNameTab[Sys.actionStep]);--��ʾ��������-��������
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
        elseif Sys.actionType == ActionItem[Sys.language][10] then--ִ��-���Ժ˲��Һϡ��
            Sys.actionFunction = excute_linear_set_process;
        end
        Sys.driverStep = 1;--�����̴ӵ�һ����ʼ
        Sys.actionSubStep = 1;--�����̴ӵ�һ����ʼִ��
        Sys.processStep = Sys.processStep + 1;--��ת����һ��ִ��������
        --------------------------------------------------------------------------------------------------
        --�ڶ���: ִ�������̺���
    elseif Sys.processStep == 2 then
        if Sys.actionFunction(Sys.contentTab) == FINISHED then
            Sys.processStep = Sys.processStep + 1;
            -- print("����actionִ�����");
        end
        ---------------------------------------------------------------------------------------------------
        --������:�ж϶����Ƿ�ִ�����
    elseif Sys.processStep == 3 then
        -- print("�ж��Ƿ���actionδִ��?��Action=" .. Sys.actionTotal .. "��ǰAction=" .. Sys.actionStep);
        set_value(MAIN_SCREEN, ProgressBarId, math.floor(Sys.actionStep / Sys.actionTotal * 100));--���½�����
        ----------------���ж���ִ�����(���̽���)-------------------------------------------
        if Sys.actionStep >= Sys.actionTotal then
            Sys.actionStep = 1;                       --����ָ���һ������
            Sys.processStep = 1;                      --���¼���ָ���һ�������ĵ�һ��
            Sys.logContent = WorkStatus[Sys.language].stop .. "\"" .. Sys.processName .. "\"";--��ֹͣ��+��������
            add_history_record(HISTORY_LOG_SCREEN);--���һ��ֹͣ���̵���־��Ϣ
            set_text(MAIN_SCREEN, StartTimeId, "0000-00-00  00:00");--�������������̵Ŀ�ʼʱ����0
            ------����Ϊˮ�������������Զ������л�����----------
            if Sys.processType == ProcessItem[Sys.language][1] and get_auto_range_process_id() ~= 0 then
                process_ready_run(autoRangeProcessId);--�����Զ������л�����
            ------����Ϊ���Ժ˲��һ�δִ����5������----------
            elseif Sys.processType ==  ProcessItem[Sys.language][10] and Sys.linearProcessStep < 5 then
                Sys.linearProcessStep = Sys.linearProcessStep + 1;
                process_ready_run(linearProcessId);
            ----------------�ֶ�ģʽ--------------------
            elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].hand then     
                Sys.handProcessIndex = Sys.handProcessIndex + 1;--ָ����һ������
                Sys.handRunTimes = Sys.handRunTimes + 1;
                if tonumber(get_text(RUN_CONTROL_HAND_SCREEN,HandProcessTimesId)) == 0 or
                   Sys.handRunTimes < tonumber(get_text(RUN_CONTROL_HAND_SCREEN, HandProcessTimesId)) * Sys.handProcessTotal then

                    SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--����Ϊ����״̬
                else
                    SystemStop(stopByNormal);
                end
            ----------------����ģʽ--------------------
            elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].period then
                --1.�����˲鲻�ϸ�  2.������У׼����
                if Sys.isCheckOk == false and getProcessIdByName(get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[2].processNameId)) then
                    print("�����˲����̽���,���ϸ�")
                    --����ǰʱ��ת��Ϊ�ַ���
                    local currentDateTime = string.format("%d%02d%02d%02d%02d",
                          Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day,Sys.dateTime.hour, Sys.dateTime.min);

                    --�Ե�һ���Զ������˲鿪ʼ,�Ѿ�6Сʱ��
                    if currentDateTime >= Sys.checkEndTime then
                        SystemStop(stopByNormal);--��������ģʽ
                    else
                        print("�����˲鲻�ϸ�,��ȡУ׼id");
                        process_ready_run(autoStdCheck);--�����Զ������˲�����ȡ����id
                    end
                    
                    return
                end

                if Sys.processName == get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[1].processNameId) then--ˮ������
                    --ÿ����һ�η�������, �������̵�Ƶ����Ҫ + 1;
                    for i = 2,#PeriodicTab,1 do 
                        PeriodicTab[i].freq = PeriodicTab[i].freq + 1;

                        local freqOfSet = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN,PeriodicTab[i].freqId));--��ȡ���õ�Ƶ��
                        --1.�ж�Ƶ��(����)�Ƿ�ﵽҪ��; 2.�жϸ�����ǰ���ĸ�ѡ���Ƿ��; 3.�ж��Ƿ�����������(��Ϊ�ո�)
                         if PeriodicTab[i].freq >= freqOfSet and 
                            get_value(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[i].enableId) == ENABLE and
                            get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[i].processNameId) ~= BLANK_SPACE then

                            PeriodicTab[i].isReadyRun = true;--�ñ�־λ��ֵtrue,��ʾ�ﵽ���������е�������.
                        end
                    end
                else
                    for i = 2,#PeriodicTab,1 do
                        if Sys.processName == get_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[i].processNameId) then--�жϱ������̵���������
                            PeriodicTab[i].isReadyRun = false;
                            PeriodicTab[i].freq = 0;
                            break;
                        end
                    end
                end
                
                --�жϱ�����Ҫ������һ������
                for i = 2,#PeriodicTab,1 do
                    if PeriodicTab[i].isReadyRun == true then
                        process_ready_run(periodProcessId);
                        return;
                    end
                end

                SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--����Ϊ����״̬,��ʱ����ϵͳ��ʱ���в��ϵ��ж��Ƿ���Խ�����һ�η���
            ----------------------��ʱģʽ------------------
            elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].timed then
                SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--����Ϊ����״̬
            ----------------����ģʽ--------------------
            elseif get_text(RUN_CONTROL_SCREEN, RunTypeID) == WorkType[Sys.language].controlled then
                SystemStop(stopByNormal);
            end
        ----------------����δִ����,������һ������-------------------------------------------
        else
            Sys.actionStep = Sys.actionStep + 1;--ָ����һ������
            Sys.processStep = 1;                --���ص�һ��ִ����һ������
        end
    end
end

--***********************************************************************************************
--[����ֹͣ����
--  �ڵײ���״̬����ʾ��ʾ��Ϣ
--stopType : SystemStop(stopByNormal)-����һ�����̺�����ֹͣ ;SystemStop(stopByClickButton)-ͨ���ֶ����ֹͣ��ťǿ��ֹͣ����
--***********************************************************************************************
function SystemStop(stopType)
    SetSysWorkStatus(WorkStatus[Sys.language].stop);--��״̬����ʾΪֹͣ
    ShowSysCurrentAction(TipsTab[Sys.language].null);--����ǰ������ʾΪ"��"
    ShowSysAlarm(TipsTab[Sys.language].null);--��ձ���
    ShowSysTips("");
    set_value(RUN_CONTROL_SCREEN, RunStopBtId, 0);--����ʼ/ֹͣ��ť����
    Sys.processStep = 1;
    Sys.handProcessIndex = 1;
    Sys.handRunTimes = 0;
    Sys.linearProcessStep = 1;
    Sys.linearStartStep = 1;
    Sys.flag_save_uart_log = ENABLE;--�򿪴���ͨ����־��¼����
    UartArg.lock = UNLOCKED;--��������
    UartArg.repeat_times = 0;--�ط�������0
    Sys.isCheckOk = true;--�˲���Ĭ�Ϻϸ�
    UartArg.reply_sta = SEND_OK;
    UartArg.lock = UNLOCKED;
    stop_timer(1)--ֹͣ��ʱ��ʱ��
    set_text(MAIN_SCREEN, StartTimeId, "0000-00-00  00:00");--�������������̵Ŀ�ʼʱ����0
    set_text(MAIN_SCREEN, NextStartTimeId, "0000-00-00  00:00");--���´��������̵Ŀ�ʼʱ����0
    for i = 1, #TimedProcessTab, 1 do--��ʱģʽ��, Ҫ���ñ�־λ�ó�false
        TimedProcessTab[i].isFinished = false;
    end
    for i = 2, #PeriodicTab, 1 do--����ģʽ��,Ƶ�ʼ�������0
        PeriodicTab[i].freq = 0;
        PeriodicTab[i].isReadyRun = false;
    end
    if Sys.actionFunction == excute_dispel_process then--ֹͣʱ��������,��Ҫ����ֹͣ����ָ��
        on_uart_send_data(uartSendTab.stopDispel, NEED_REPLY);
    end

    ModeBus[0x1083] = 0;--���ù���״̬Ϊ����
    -- --�ֶ�ֹͣ,ִ���ſ���ϴ����
    -- if stopType == stopByClickButton and getProcessIdByName(get_text(RUN_CONTROL_SCREEN,SuddenPwrOffProcessId)) ~= 0 then
    --     Sys.suddenPwrOff = true;
    --     SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--����Ϊ����״̬
    -- end
end



--[[-----------------------------------------------------------------------------------------------------------------
    ���п���-��������
--------------------------------------------------------------------------------------------------------------------]]
RUNCTRL_PEROID_BtSid = 1;
RUNCTRL_PEROID_BtEid = 7;
RUNCTRL_PEROID_TextSid = 8;
RUNCTRL_PEROID_TextEid = 22;
PeriodicTab = {
    [1] = {enableId = 1, processNameId = 8,  freqId = 9 , },--����
    [2] = {enableId = 2, processNameId = 10, freqId = 12, freq = 0, isReadyRun = false, },--У��1
    [3] = {enableId = 2, processNameId = 11, freqId = 12, freq = 0, isReadyRun = false, },--У��2
    [4] = {enableId = 3, processNameId = 13, freqId = 14, freq = 0, isReadyRun = false, },--����У��
    [5] = {enableId = 4, processNameId = 15, freqId = 16, freq = 0, isReadyRun = false, },--���˲�
    [6] = {enableId = 5, processNameId = 17, freqId = 18, freq = 0, isReadyRun = false, },--�����˲�
    [7] = {enableId = 6, processNameId = 19, freqId = 20, freq = 0, isReadyRun = false, },--�հײ���
    [8] = {enableId = 7, processNameId = 21, freqId = 22, freq = 0, isReadyRun = false},--��ϴ
    sTime =  { yearId = 31, monId = 32, dayId = 33, hourId = 34, minId = 35, 
               year = 0, mon = 0, day = 0, hour = 0, min = 0 },--���̿�ʼ��ʱ��
};

--***********************************************************************************************
--  
--***********************************************************************************************
function run_control_period_notify(screen, control, value)
    if control == SureButtonId then
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteParaToConfigStrAndFile();--�����ݴ����ļ�
            change_screen(RUN_CONTROL_SCREEN);
        end
    elseif control == CancelButtonId then
        change_screen(RUN_CONTROL_SCREEN);
    elseif control >= RUNCTRL_PEROID_TextSid+100 and control <= RUNCTRL_PEROID_TextEid+100 then
        process_name_select_set(screen, control-100);
    elseif control == 9 then
        ModeBus[0x1085] = tonumber(get_text(RUN_CONTROL_PERIOD_SCREEN,9))
    end
end

--***********************************************************************************************
--  ��ת������ģʽ��, ����øú���
--***********************************************************************************************
function goto_period_mode_set_screen()

    --�����������ý�����,��֤У׼������,�����õ�һ������,�����õڶ�������
    if get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[2].processNameId) == BLANK_SPACE and
        get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[3].processNameId) ~= BLANK_SPACE then

        set_text(RUN_CONTROL_PERIOD_SCREEN, PeriodicTab[2].processNameId, get_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[3].processNameId));
        set_text(RUN_CONTROL_PERIOD_SCREEN ,PeriodicTab[3].processNameId, BLANK_SPACE);
        WriteParaToConfigStrAndFile();--�������ý����и���, ��Ҫ���浽�����ļ�����
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    ���п���-��ʱ����
--------------------------------------------------------------------------------------------------------------------]]
RUNCTRL_TIMED_TextSid = 1;
RUNCTRL_TIMED_TextEid = 24;
TimedProcessClear = 410;--һ��������еĶ�ʱ����
--��ʱ����  ����ע��StartHourId - 37 = ���; startMinuteId - 61 = ���
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
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteParaToConfigStrAndFile();--�����ݴ����ļ�
            change_screen(RUN_CONTROL_SCREEN);
        end
    elseif control == CancelButtonId and value == ENABLE then
        change_screen(RUN_CONTROL_SCREEN);
    elseif control >= TimedProcessTab[1].buttonId and control <= TimedProcessTab[#TimedProcessTab].buttonId then
        process_name_select_set(screen, control-100);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ���п���-�ֶ�����
--------------------------------------------------------------------------------------------------------------------]]
HandProcessTimesId = 6;
RUNCTRL_HAND_TextSid = 1;
RUNCTRL_HAND_TextEid = 6
--�ֶ�����
HandProcessTab = {
    --  ������ʾ�������Ƶ��ı�id, ���ı��غϵİ�ťid, �ֶ���������id, �ֶ���������, �������ƶ�Ӧ���������
    [1] = { textId = 1,  buttonId = 101,  processId = 0 },
    [2] = { textId = 2,  buttonId = 102,  processId = 0 },
    [3] = { textId = 3,  buttonId = 103,  processId = 0 },
    [4] = { textId = 4,  buttonId = 104,  processId = 0 },
    [5] = { textId = 5,  buttonId = 105,  processId = 0 },
    times = 0,
};


function run_control_hand_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteParaToConfigStrAndFile();--�����ݴ����ļ�
            change_screen(RUN_CONTROL_SCREEN);
        end
    elseif control == CancelButtonId and value == ENABLE then
        change_screen(RUN_CONTROL_SCREEN);
    elseif control >= HandProcessTab[1].buttonId and control <= HandProcessTab[5].buttonId then--ѡ������
        process_name_select_set(screen, control - 100);--(control100)��ʾ��ð�ť�غϵ��ı���
    elseif control == HandProcessTimesId then
        HandProcessTab.times = tonumber(get_text(screen,control));
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������1/2
--------------------------------------------------------------------------------------------------------------------]]
--�������ñ��и��ؼ�Id,ע��selecId��nameId����ѧ��ϵ:typeId = nameId + 100, typeId = deleteId + 50 �ȵ�
ProcessTab = {
[1] = { typeId = 301, nameId = 201, rangeId = 351, deleteId = 251, editId = 51 },
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


ProcessSaveBtId = 19;--���水ť,��������1/2/3�ı��水ť�������id
ExportBtId = 41;--������ť
InportBtId = 42;--���밴ť
NextSetScreen = 128;--��һ���������ý���
ProcessCopyBtId = 3;--��������1�����еĸ��ư�ť
--***********************************************************************************************
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--***********************************************************************************************
function process_set12_control_notify(screen, control, value)

    if control == ProcessSaveBtId then -- ����
        WriteParaToConfigStrAndFile();
        --���밴ť----------------------------------------------------------------------
    elseif control == InportBtId then --
        if UsbPath ~= nil and SdPath ~= nil then
            ShowSysTips(TipsTab[Sys.language].importing);
            for i = 0, 24, 1 do--���ε����ļ�"0"~"24"
                ConfigFileCopy(UsbPath .. "config/" .. i, SdPath .. "config/"..i);--��Sd���е������ļ����붼ϵͳ
            end
            on_init();
            Sys.hand_control_func = nil;
            SystemStop(stopByNormal);
            ShowSysTips(TipsTab[Sys.language].imported);
        else
            ShowSysTips(TipsTab[Sys.language].insertSdUsb);
        end
        --������ť----------------------------------------------------------------------
    elseif control == ExportBtId then --(���������õ�����SD����)
        if UsbPath ~= nil and SdPath ~= nil then
            ShowSysTips(TipsTab[Sys.language].exporting);
            for i = 0, 24, 1 do--���ε����ļ�"0"~"24"
                ConfigFileCopy(SdPath .. "config/" .. i, UsbPath .. "config/"..i);--���ļ�������config�ļ���,�����ļ���Ϊ0~24
            end
            ShowSysTips(TipsTab[Sys.language].exported);
        else
            ShowSysTips(TipsTab[Sys.language].insertSdUsb);
        end;
    --������������--------------------------------------------------------------------
    elseif control >= ProcessTab[1].nameId and control <= ProcessTab[24].nameId then

    --������������--------------------------------------------------------------------
    elseif control >= ProcessTab[1].typeId and control <= ProcessTab[24].typeId then

    ------------------------------------------------------------------------
    elseif (control - 100) >= ProcessTab[1].typeId and (control - 100) <= ProcessTab[24].typeId then --���������������µĸ�����ť
        process_type_select_set(screen, control - 100);
        --����ѡ��----------------------------------------------------------------------
    elseif (control - 100) >= ProcessTab[1].rangeId and (control - 100) <= ProcessTab[24].rangeId then
        range_select_set(screen, control - 100);
        --ɾ����ť----------------------------------------------------------------------
    elseif control >= ProcessTab[1].deleteId and control <= ProcessTab[24].deleteId and value == ENABLE then
        if get_text(screen, control - 50) ~= BLANK_SPACE then --���Ʋ�Ϊ�ո�
            if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
                set_return_screen_control(screen, control);
            end
            change_screen(DIALOG_SCREEN);
        end
        --�鿴��ť----------------------------------------------------------------------
    elseif control >= ProcessTab[1].editId and control <= ProcessTab[24].editId and get_text(screen, control + 250) ~= BLANK_SPACE and value == ENABLE then
        
        local processName = get_text(screen, control + 150);
        set_text(PROCESS_EDIT1_SCREEN, ProcessSelectId, processName);--�������̱༭1/2/3/4�������������
        set_text(PROCESS_EDIT2_SCREEN, ProcessSelectId, processName);
        set_text(PROCESS_EDIT3_SCREEN, ProcessSelectId, processName);
        set_text(PROCESS_EDIT4_SCREEN, ProcessSelectId, processName);

        ReadActionToTabAndScreen(SdPath.."config/"..(control-50));--�������ļ���ȡ��ActionStrTab���������

        change_screen(PROCESS_EDIT1_SCREEN);--��ת�����̱༭1����
        if control <= ProcessTab[12].editId then--���õ�������̱༭1�����е���ǰ��ťʱ,��Ҫ������һ������
            DestProcessSetScreen = PROCESS_SET1_SCREEN;
        else
            DestProcessSetScreen = PROCESS_SET2_SCREEN;
        end
    --���ư�ť----------------------------------------------------------------------------
    elseif control == ProcessCopyBtId and value == ENABLE then
        if operate_permission_detect(CHK_USER) == ENABLE then--���Ȩ��
            change_screen(PROCESS_COPY_SCREEN);
            set_visiable(PROCESS_COPY_SCREEN, 5, 0)
            set_visiable(PROCESS_COPY_SCREEN, 6, 0)
        end
    end
end

--***********************************************************************************************
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--***********************************************************************************************
function process_copy_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then
        local srcFile = get_text(PROCESS_COPY_SCREEN,2);
        local destFile = get_text(PROCESS_COPY_SCREEN,4);
        local configFile = io.open(SdPath .. "config/" ..srcFile, "r")          --���ı�
        if configFile ~= nil then
            ConfigFileCopy(SdPath .. "config/" .. srcFile, SdPath .. "config/" .. destFile);--���ļ�������config�ļ���,�����ļ���Ϊ0~24
            local configFile = io.open(SdPath .. "config/" .. destFile)          --���ı�
            if configFile ~= nil then    
                configFile:seek("set")                  --���ļ�λ�ö�λ����ͷ
                ConfigStr[tonumber(destFile)] = configFile:read("a")     --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ���
                configFile:close()                      --�ر��ı�
                set_visiable(PROCESS_COPY_SCREEN, 5, 1);
            end
        else
            set_visiable(PROCESS_COPY_SCREEN, 6, 1);
        end
    elseif control == CancelButtonId then
        change_screen(PROCESS_SET1_SCREEN);
    end
end




--[[-----------------------------------------------------------------------------------------------------------------
    ���̱༭1/2/3/4
--------------------------------------------------------------------------------------------------------------------]]
ReturnProcessSetScreenId = 93;
ProcessSelectId = 38;      --λ�����̱༭1/3�������id
ProcessSelectTipsTextId = 21;--������ʾ��ʾ��Ϣ���ı���,���̱༭1/3�����ж������id
ProcessSaveId = 19;
--����ע��۲춯��ѡ��id,��������id,�༭id֮�����ѧת����ϵ:typeId = nameId + 100; nameId = editId + 100
--����[1]-[12]�а�����id�ؼ������̱༭1������,[13]-[24]�а�����id�ؼ������̱༭2������
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

--���ñ༭��ť��Ӧ����ת����
--para:��ȡ��Ӧ�Ķ�����������
--screen: ��ǰ��Ļ��id, �ӽ��水"ȷ��" ,"����" ��ť����Ҫ���صĽ���
--control:"�༭"��ť��id��
function set_edit_screen(para, screen, control)
    print("��������="..para);
    local fileName = getFileNameByProcessName(get_text(PROCESS_EDIT1_SCREEN,ProcessSelectId));

    --�����̱༭����, ���༭��ťʱ,���ö�Ӧ����Ĳ���
    if fileName ~= 0 then
        SetActionToScreen(control - 100);
    end
    set_screen_actionNumber(screen, control - 100);

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
    elseif para == ActionItem[Sys.language][10] then --���Ժ˲�ϡ��
        change_screen(PROCESS_LINEAR_CHK_SET_SCREEN);
    end
end


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_edit_control_notify(screen, control, value)
    if control == ProcessSaveBtId and value == ENABLE then -- ����
        WriteActionStrTabToFile();
    elseif control == ReturnProcessSetScreenId and screen == PROCESS_EDIT1_SCREEN and value == ENABLE then--���˰�ť
        if DestProcessSetScreen == nil then
            DestProcessSetScreen = PROCESS_SET1_SCREEN;
        end
        change_screen(DestProcessSetScreen);
    elseif (control - 100) >= TabAction[1].typeId and (control - 100) <= TabAction[#TabAction].typeId then--�����"��������"����İ�ťʱ
        if BLANK_SPACE == get_text(screen, control - 100) then
            action_select_set(screen, control - 100, control - 400);
        end
    elseif control >= TabAction[1].editId and control <= TabAction[#TabAction].editId and value == ENABLE then--�����"�༭"��ťʱ
        if get_text(screen, control + 200) ~= BLANK_SPACE then--��������˶�������,(�༭��ť��id+200���ڶ�������id)
            set_edit_screen(get_text(screen, control + 200), screen, control);--control+200��ʾ��Ӧ��"��������"id
        end
    elseif control >= TabAction[1].insertId and control <= TabAction[#TabAction].insertId and value == ENABLE then--��������밴ťʱ
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            InsertAction(control - 500);
        end
    elseif control >= TabAction[1].deleteId and control <= TabAction[#TabAction].deleteId and value == ENABLE then--�����ɾ����ťʱ
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            set_return_screen_control(screen, control)
            change_screen(DIALOG_SCREEN);--ת����ɾ��ȷ�Ͻ���
        end
    end
end



--***********************************************************************************************
--�������̱༭1/3�����ϵ��"����"��ťʱ, �Ҵ�ʱ��ǰ�е�"��������"��Ϊ��ʱ,����øú���
--�ú���ʵ�ֱ���"����"����, ʵ���Ͼ����޸������ļ�,Ȼ���ٶ�ȡ
--***********************************************************************************************
function InsertAction(actionNumber)
    -- --����ǰ�в����������Ϊ�ո���ʾ
    --------�����̱༭1�������һ��---------------------------------------------------------------
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
        set_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--����ǰ����ʾΪ�ո�
        set_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
        --------�����̱༭2�������һ��---------------------------------------------------------------
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
        set_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--����ǰ����ʾΪ�ո�
        set_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    --------�����̱༭3�������һ��---------------------------------------------------------------
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
        set_text(PROCESS_EDIT3_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--��ǰ����ʾΪ�ո�
        set_text(PROCESS_EDIT3_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    --------�����̱༭4�������һ��---------------------------------------------------------------
    else
        for i = 48, actionNumber + 1, -1 do--
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i - 1].typeId));
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i - 1].nameId));
        end
        set_text(PROCESS_EDIT4_SCREEN, TabAction[actionNumber].typeId, BLANK_SPACE);--��ǰ����ʾΪ�ո�
        set_text(PROCESS_EDIT4_SCREEN, TabAction[actionNumber].nameId, BLANK_SPACE);
    end
    MoveActionStrTabElement(actionNumber, 1);
end

--***********************************************************************************************
--�������̱༭1/3�����ϵ��"ɾ��"��ťʱ, �Ҵ�ʱ��ǰ�е�"��������"��Ϊ��ʱ,����øú���
--�ú���ʵ�ֱ���"ɾ��"����, ʵ���Ͼ����޸������ļ�,Ȼ���ٶ�ȡ
--***********************************************************************************************
function DeleteAction(actionNumber)
    --------�����̱༭1����ɾ��һ��---------------------------------------------------------------
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
        --------�����̱༭2����ɾ��һ��---------------------------------------------------------------
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
    --------�����̱༭3����ɾ��һ��---------------------------------------------------------------
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
    --------�����̱༭4����ɾ��һ��---------------------------------------------------------------
    else
        for i = actionNumber, 47, 1 do
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i + 1].typeId));
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, get_text(PROCESS_EDIT4_SCREEN, TabAction[i + 1].nameId));
        end
        set_text(PROCESS_EDIT4_SCREEN, TabAction[48].typeId, BLANK_SPACE);
        set_text(PROCESS_EDIT4_SCREEN, TabAction[48].nameId, BLANK_SPACE);
    end
    MoveActionStrTabElement(actionNumber, 2);
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
INIT_AnalysisWayTextId = 22;
--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function set_screen_actionNumber(screen, actionNumber)
    DestScreen = screen;
    DestActionNum = actionNumber;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_init_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteTypeAndContentToActionStrTab(DestActionNum);
            change_screen(DestScreen);
        end
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
            control_valco(tonumber(paraTab[23]));--idΪ23�Ŀؼ�Ϊͨ����
            start_wait_time(1);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        --------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�Է����и�λ(��ȡ����)
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 5];--����״̬���浽valveIdTab��,���ֵΪ1.0��ʾ��Ҫ��λ,���ֵΪ0.0����Ҫ
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
        if paraTab[3] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ע���1���и�λ,����ʹ��ע���
            enable_inject1();
            Sys.actionSubStep = Sys.actionSubStep + 1;
        else
            Sys.actionSubStep = Sys.actionSubStep + 2;
        end
    elseif Sys.actionSubStep == 5 then
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
function process_inject_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteTypeAndContentToActionStrTab(DestActionNum);
            change_screen(DestScreen);
        end
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

    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--���������������ڵȴ���ʱ.
        return;
    end

    -----------------------------------------------------------------
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ʮͨ������
            control_valco(tonumber(paraTab[20]));--ͨ����
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����,�ڴ����ò���
            for i = 11, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i-3];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = 2;--�ȴ�ʱ��
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 3 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����,�ڴ�ִ�п�������
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then--�ж϶�ע��õĲ���(ע���1��ע���2ֻ��ѡ��һ��)
        if paraTab[3] == ENABLE_STRING then
            Sys.injectId = tonumber(paraTab[21])
            Sys.injectSpeed = tonumber(paraTab[22]);
            if paraTab[23] == InjectPara[Sys.language][2] then--�ӱ���� 
                Sys.injectScale = Sys.recoveryVa * 10;
            else
                Sys.injectScale = tonumber(paraTab[24]) * 10;
            end
            Sys.waitTime = 10;
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 5 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(�ط�)����
            for i = 11, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i-3];
            end
            Sys.valveOperate = ValveStatus[Sys.language].close;
            Sys.waitTime = 0
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(�ط�)����
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 7 then
        if paraTab[4] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ʮͨ������
            control_valco(tonumber(paraTab[25]));
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 8 then
        if paraTab[5] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����2����(����)����,�ڴ����ò���
            for i = 11, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i+3];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = 2
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 9 then
        if paraTab[5] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����2����(����)����,�ڴ�ִ�п�������
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 10 then--�ж϶�ע��õĲ���(ע���1��ע���2ֻ��ѡ��һ��)
        if paraTab[6] == ENABLE_STRING then
            Sys.injectId = tonumber(paraTab[26]);
            Sys.injectSpeed = tonumber(paraTab[27]);
            if paraTab[28] == InjectPara[Sys.language][2] then--�ӱ���� 
                Sys.injectScale = Sys.recoveryVa * 10;
            else
                Sys.injectScale = tonumber(paraTab[29]) * 10;
            end
            Sys.waitTime = 10;
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 11 then
        if paraTab[5] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����2����(�ط�)����
            for i = 11, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i+3];
            end
            Sys.valveOperate = ValveStatus[Sys.language].close;
            Sys.waitTime = 0;
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 12 then
        if paraTab[5] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����2����(�ط�)����
            Sys.driverStep1Func = control_multi_valve;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 13 then--�жϸò������˶����Լ�
        if paraTab[7] == ENABLE_STRING then
            local index = tonumber(paraTab[30])
            local reagentRemain = tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[index].remainId));--��ȡ�Լ���ǰ����
            reagentRemain = reagentRemain - tonumber(paraTab[31]);--��������µ��Լ�����
            if reagentRemain < 0 then
                reagentRemain = 0;
            end
            print("�����Լ�" .. index .. ":" .. reagentRemain .. "mL");
            set_text(HAND_OPERATE3_SCREEN, ReagentTab[index].remainId, reagentRemain);--���½����ϵ��Լ�������ʾ
            WriteParaToConfigStrAndFile();--�����������ݵ������ļ�
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 14 then--����
        Sys.actionSubStep = FINISHED;
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    ��������-ע��ü�Һ
--------------------------------------------------------------------------------------------------------------------]]
INJECT_ADD_BtStartId = 1;
INJECT_ADD_BtEndId = 41;
INJECT_ADD_TextStartId = 42;
INJECT_ADD_TextEndId = 65;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_inject_add_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteTypeAndContentToActionStrTab(DestActionNum);
            change_screen(DestScreen);
        end
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
            control_valco(tonumber(paraTab[42]));--ͨ����
            start_wait_time(tonumber(paraTab[43]));
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 9];
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
            if paraTab[51] == InjectPara[Sys.language][2] then--�ӱ���� 
                Sys.injectScale = Sys.recoveryVa * 10;
            else
                Sys.injectScale = tonumber(paraTab[46]) * 10;
            end
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
            control_valco(tonumber(paraTab[52]));--idΪ63�Ŀؼ�Ϊͨ����
            start_wait_time(tonumber(paraTab[53]));
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(�ط�)����
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 9];
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
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 25];
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
            if paraTab[64] == InjectPara[Sys.language][2] then--�ӱ���� 
                Sys.injectScale = Sys.recoveryVa * 10;
            else
                Sys.injectScale = tonumber(paraTab[56]) * 10;
            end
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
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 25];
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
    elseif Sys.actionSubStep == 13 then--�жϸò������˶����Լ�
        if paraTab[9] == ENABLE_STRING then
            local index = tonumber(paraTab[62])
            local reagentRemain = tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[index].remainId));--��ȡ�Լ���ǰ����
            reagentRemain = reagentRemain - tonumber(paraTab[61]);--��������µ��Լ�����
            if reagentRemain < 0 then
                reagentRemain = 0;
            end
            print("�����Լ�" .. index .. ":" .. reagentRemain .. "mL");
            set_text(HAND_OPERATE3_SCREEN, ReagentTab[index].remainId, reagentRemain);--���½����ϵ��Լ�������ʾ
            WriteParaToConfigStrAndFile();--�����������ݵ������ļ�
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 14 then--����
        Sys.actionSubStep = FINISHED;
    end

    return Sys.actionSubStep;
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

--[[-----------------------------------------------------------------------------------------------------------------
    ��������-�䶯�ü�Һ
--------------------------------------------------------------------------------------------------------------------]]
PERISTALTIC_BtStartId = 1;
PERISTALTIC_BtEndId = 22;
PERISTALTIC_TextStartId = 23;
PERISTALTIC_TextEndId = 39;


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_peristaltic_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteTypeAndContentToActionStrTab(DestActionNum);
            change_screen(DestScreen);
        end
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
            Sys.valcoChannel = tonumber(paraTab[20]);--ͨ����
            Sys.waitTime = 2;--�ȴ�ʱ��
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
        ----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
            for i = 11, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i-3];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = 2;
            
        else
            Sys.actionSubStep = Sys.actionSubStep + 2;
        end
    elseif Sys.actionSubStep == 3 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
        -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        end
        Sys.actionSubStep = Sys.actionSubStep + 2;
        ----------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        if paraTab[3] == ENABLE_STRING then--�ж϶��䶯�õĲ���
            Sys.periodicSpeed = tonumber(paraTab[22]);
            Sys.periodicVolume = tonumber(paraTab[24]);
            Sys.periodicDir = paraTab[23];
            Sys.waitTime = Sys.periodicVolume * 10;
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
        ----------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(�ط�)����
            for i = 11, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i-3];
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



--[[-----------------------------------------------------------------------------------------------------------------
    ��������-����
--------------------------------------------------------------------------------------------------------------------]]
DISPEL_BtStartId = 1;
DISPEL_BtEndId = 1;
DISPEL_TextStartId = 2;
DISPEL_TextEndId = 5;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_dispel_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteTypeAndContentToActionStrTab(DestActionNum);
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end



--***********************************************************************************************
--  ִ����������(ĿǰӲ���ϻ�û������) ##������##
--***********************************************************************************************
function excute_dispel_process(paraTab)
    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--���������������ڵȴ���ʱ.
        return;
    end

    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--�ж��Ƿ���Ҫ����
            --���������¶�
            set_dispel_temp(tonumber(paraTab[2]));
            start_wait_time(1);
            Sys.actionSubStep = Sys.actionSubStep + 1;
        else
            Sys.actionSubStep = FINISHED;--����
        end
    elseif Sys.actionSubStep == 2 then--��������ʱ��
        set_dispel_time(tonumber(paraTab[3]))
        start_wait_time(1);
        Sys.actionSubStep = Sys.actionSubStep + 1;
    elseif Sys.actionSubStep == 3 then--��ʼ����
        on_uart_send_data(uartSendTab.startDispel, NEED_REPLY);
        Sys.actionSubStep = Sys.actionSubStep + 1;
    elseif Sys.actionSubStep == 4 then--��ȡ�����¶�
        on_uart_send_data(uartSendTab.getDsTemp, NEED_REPLY);
        start_wait_time(2);--2���ӻ�ȡһ���¶�
        Sys.actionSubStep = Sys.actionSubStep + 1;
    elseif Sys.actionSubStep == 5 then--��ʾ�����¶�,����ȡ����״̬
        if UartArg.reply_sta == SEND_OK then
            local Temp = (UartArg.recv_data[5] * 256 + UartArg.recv_data[6]) / 10
            if UartArg.recv_data[4] == 0x01 then--�¶�Ϊ����
                Temp = Temp * (-1);
            end
            set_text(MAIN_SCREEN, DispelTempId, Temp)--����ҳ��ʾ�¶�
        end
        on_uart_send_data(uartSendTab.getDsStatus, NEED_REPLY);--��ȡ����״̬
        Sys.actionSubStep = Sys.actionSubStep + 1;
    elseif Sys.actionSubStep == 6 then--�ж�����״̬
        if UartArg.reply_sta == SEND_OK and UartArg.recv_data[4] == 0x04 then--����״̬Ϊ������
            Sys.actionSubStep = Sys.actionSubStep + 1;
        elseif UartArg.reply_sta == SEND_OK and UartArg.recv_data[4] == 0x03 then--����״̬Ϊ�����¶�������
            Sys.actionSubStep = 4;--���ص�4��������ȡ�¶�
        elseif UartArg.reply_sta == SEND_OK and UartArg.recv_data[4] == 0x00 then--����״̬Ϊ����
            Sys.actionSubStep = 3;--���ص�3����������
        else
            Sys.alarmContent = TipsTab[Sys.language].dispelErr;
            add_history_record(HISTORY_ALARM_SCREEN);
            UartArg.lock = LOCKED;--��������,���̻��ڴ˴�ֹͣ����ִ��.
        end
    elseif Sys.actionSubStep == 7 then
        on_uart_send_data(uartSendTab.getDsTemp, NEED_REPLY);
        start_wait_time(2);--2���ӻ�ȡһ���¶�
        Sys.actionSubStep = Sys.actionSubStep + 1;
    elseif Sys.actionSubStep == 8 then
        if UartArg.reply_sta == SEND_OK then
            local Temp = (UartArg.recv_data[5] * 256 + UartArg.recv_data[6]) / 10
            if UartArg.recv_data[4] == 0x01 then--�¶�Ϊ����
                Temp = Temp * (-1);
            end
            set_text(MAIN_SCREEN, DispelTempId, Temp)--����ҳ��ʾ�¶�
            if Temp <= tonumber(paraTab[4]) then
                Sys.actionSubStep = Sys.actionSubStep + 1;
            else
                Sys.actionSubStep = 7;--���ص�7��������ȡ�¶�
            end
        else
            Sys.actionSubStep = 7;--���ص�7��������ȡ�¶�
        end
    elseif Sys.actionSubStep == 9 then
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
function process_read_signal_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteTypeAndContentToActionStrTab(DestActionNum);
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--�ڲ���E1, E2ʱ,���ڶ�ʱ��Сʱ�������ʱ��
--time_s
--***********************************************************************************************
function start_e_wait_time(time_s)
    if time_s == 0 then
        return;
    end
    Sys.eWaitTimeFlag = SET;
    start_timer(4, time_s * 1000, 1, 1); --������ʱ��4����ʱʱ�� wait_time, 1->ʹ�õ���ʱ��ʽ,1->��ʾִֻ��һ��
end

--***********************************************************************************************
--  ִ�ж�ȡ�ź�����
--***********************************************************************************************
function excute_read_signal_process(paraTab)
    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--����������ֱ�ӷ���
        return;
    end
    start_wait_time(1);
    -----------------------------------------------------------
    if Sys.actionSubStep == 1 then
        -- Sys.flag_save_uart_log = DISABLE;--�رմ���ͨ����־��¼����(��ȡ��λʱ���������ϵĻ�ȡ)
        Sys.signalDrift = tonumber(paraTab[2]);--�ź�Ư��
        Sys.signalMinTime = tonumber(paraTab[3]);--��Сʱ��
        Sys.signalMaxTime = tonumber(paraTab[4]);--���ʱ��
        Sys.signalNumber = tonumber(paraTab[5]);--ȡ������
        start_e_wait_time(Sys.signalMinTime);--�ȴ���С�Ķ�ʱ��ʱ��
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        on_uart_send_data(uartSendTab.getVoltage, NEED_REPLY);--ͨ�����ڶ�ȡ�ź�
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------
    elseif Sys.actionSubStep == 3 then--���������ź�
        if Sys.eWaitTimeFlag == RESET then  --��С��ʱʱ�䵽,��ת��һ����ȡ�ź�
            if Sys.signalMaxTime < Sys.signalMinTime then
                Sys.signalMaxTime = Sys.signalMinTime;
            end
            start_e_wait_time(Sys.signalMaxTime - Sys.signalMinTime) --������ʱ��,���ڶ�ʱ���ʱʱ��
            Sys.signalCount = 0;
            Sys.actionSubStep = Sys.actionSubStep + 1;
            print("��Сʱ�䵽");
        else
            if UartArg.reply_sta ~= SEND_OK or UartArg.recv_data[2] ~= 2 then
                Sys.actionSubStep = Sys.actionSubStep - 1;--����������,ִ����һ��,������ȡ��ѹ�ź�
                return;
            end
            local signalE = (UartArg.recv_data[3] * 256 + UartArg.recv_data[4]) / 10;--��ȡ���ź�ֵ��Ҫ����10����ʵ��ֵ
            --����ȡ�ĵ�ѹʵʱ��ʾ����ҳ����
            if paraTab[1] == "E1" then
                set_text(MAIN_SCREEN, LastResultE1Id, signalE);
            else
                set_text(MAIN_SCREEN, LastResultE2Id, signalE);
            end
            Sys.actionSubStep = Sys.actionSubStep - 1;--��ת�ڶ���������ȡ�ź�
        end
        -----------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        on_uart_send_data(uartSendTab.getVoltage, NEED_REPLY);--ͨ�����ڶ�ȡ�ź�
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------
    elseif Sys.actionSubStep == 5 then--������������, ���ж��Ƿ������ź�Ư��Ҫ��
        if UartArg.reply_sta ~= SEND_OK or UartArg.recv_data[2] ~= 2 then
            Sys.actionSubStep = Sys.actionSubStep - 1;--����������,ִ����һ��,������ȡ��ѹ�ź�
            return;
        end
        print("��ȡ��һ���Ϸ��ĵ�λ����");
        local signalE = (UartArg.recv_data[3] * 256 + UartArg.recv_data[4]) / 10;--��ȡ���ź�ֵ��Ҫ����10����ʵ��ֵ
        --����ȡ�ĵ�ѹʵʱ��ʾ����ҳ����
        if paraTab[1] == "E1" then
            set_text(MAIN_SCREEN, LastResultE1Id, signalE);
        else
            set_text(MAIN_SCREEN, LastResultE2Id, signalE);
        end

        Sys.signalTab[math.fmod(Sys.signalCount, Sys.signalNumber)] = signalE;--����ѹ�źű��浽������
        Sys.signalCount = Sys.signalCount + 1;

        if Sys.signalCount >= Sys.signalNumber then--�Ѿ���ȡ���㹻���źţ�ȡ������
            local tempMax, tempMin, maxSignal, minSignal;
            tempMax = Sys.signalTab[0];
            tempMin = Sys.signalTab[0];
            for i = 1, (Sys.signalNumber - 1), 1 do
                tempMax = math.max(tempMax, Sys.signalTab[i]);
                tempMin = math.min(tempMin, Sys.signalTab[i]);
            end
            maxSignal = tempMax;--��ȡ���ֵ
            minSignal = tempMin;--��ȡ��Сֵ

            --�����ź�Ư������ ���� ���ʱʱ�䵽
            if (maxSignal - minSignal <= Sys.signalDrift) or Sys.eWaitTimeFlag == RESET then
                print("�����ź�Ư�ƻ������ʱ�䵽");
                local signalSum = 0;
                for i = 0, Sys.signalNumber - 1, 1 do
                    signalSum = signalSum + Sys.signalTab[i];
                end
                signalE = (signalSum - maxSignal - minSignal) / (Sys.signalNumber - 2);--��ȥSys.signalTab�е����ֵ����Сֵ��ȡƽ��ֵ

                if paraTab[1] == "E1" then
                    Sys.signalE1 = signalE;
                    Sys.signalE1 = GetPreciseDecimal(Sys.signalE1, 1);--����С�����1λ
                    set_text(MAIN_SCREEN, LastResultE1Id, signalE);
                    print("E1=", signalE);
                else
                    Sys.signalE2 = signalE;
                    Sys.signalE2 = GetPreciseDecimal(Sys.signalE2, 1);--����С�����1λ
                    set_text(MAIN_SCREEN, LastResultE2Id, signalE);
                    print("E2=", signalE);
                end
                Sys.eWaitTimeFlag = RESET;
                stop_timer(4); --�رն�ʱ��4
                Sys.actionSubStep = Sys.actionSubStep + 1;--��������,��ת��һ�������ɼ�
            else
                Sys.actionSubStep = Sys.actionSubStep - 1;--����������,ִ����һ��,������ȡ��ѹ�ź�
            end
        else
            Sys.actionSubStep = Sys.actionSubStep - 1;--����������,ִ����һ��,������ȡ��ѹ�ź�
        end
        -----------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        -- Sys.flag_save_uart_log = ENABLE;--�򿪴���ͨ����־��¼����
        Sys.actionSubStep = FINISHED;--����
    end
    return Sys.actionSubStep;
end


--[[-----------------------------------------------------------------------------------------------------------------
    ��������-����
--------------------------------------------------------------------------------------------------------------------]]
CALCULATE_BtStartId = 1;
CALCULATE_BtEndId = 3;
CALCULATE_TextStartId = 4;
CALCULATE_TextEndId = 18;
CALCULATE_CalcWayTextId = 10;
CALCULATE_CalcTypeTextId = 12;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_calculate_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteTypeAndContentToActionStrTab(DestActionNum);
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  ִ�м�������
--***********************************************************************************************
function excute_calculate_process(paraTab)
    Sys.calculateWay = paraTab[10];--���㷽ʽ:�������ǲ�ֵ
    Sys.CalibrationDensity = tonumber(paraTab[13]);--У׼Ũ��
    Sys.CalcStep = tonumber(paraTab[15])--����
    Sys.checkValue = tonumber(paraTab[16]);--�˲�Ũ��
    set_fore_color(MAIN_SCREEN, LastResultId, BLACK);--��ɫ

    --------��ǰ����ΪУ׼-------------------------------------------------------
    if  Sys.processType ==  ProcessItem[Sys.language][2] then

        if Sys.CalcStep == 1 then
            Sys.slop = " ";
            Sys.y_intercept = " ";
            Sys.caliE1[1] = Sys.signalE1;
            Sys.caliE2[1] = Sys.signalE2;
            Sys.caliValue[1] = Sys.CalibrationDensity;
            print("У��1��E1=", Sys.caliE1[1], ",E2=", Sys.caliE2[1]);
        elseif Sys.CalcStep == 2 then--��ǰ����ΪУ��2
            Sys.caliE1[2] = Sys.signalE1;
            Sys.caliE2[2] = Sys.signalE2;
            Sys.caliValue[2] = Sys.CalibrationDensity;
            print("У��2��E1=", Sys.caliE1[2], ",E2=", Sys.caliE2[2]);
            if Sys.calculateWay == CalcWay[Sys.language].log then--�����ȡ������ʽ������У��2ʱ�ͼ�����
                calc_calibrate_result_by_log();
            elseif Sys.calculateWay == CalcWay[Sys.language].diff and tonumber(paraTab[11]) == 1 then-----�ж�Ϊ1�׷��� y = cx +d
                calc_calibrate_result_by_diff(2);--ͨ������ʽ�����ķ�����Զ����c,d��ֵ
            end
        elseif Sys.CalcStep == 3 then--��ǰ����ΪУ��3
            Sys.caliE1[3] = Sys.signalE1;
            Sys.caliE2[3] = Sys.signalE2;
            Sys.caliValue[3] = Sys.CalibrationDensity;
            if Sys.calculateWay == CalcWay[Sys.language].diff and tonumber(paraTab[11]) == 2 then-----�ж�Ϊ2�׷��� y = bxx+cx+d 
                calc_calibrate_result_by_diff(3);--ͨ������ʽ�����ķ�����Զ����b,c,d��ֵ
            end
            print("У��3��E1=", Sys.caliE1[3], ",E2=", Sys.caliE2[3]);
        elseif Sys.CalcStep == 4 then--��ǰ����ΪУ��4
            Sys.caliE1[4] = Sys.signalE1;
            Sys.caliE2[4] = Sys.signalE2;
            Sys.caliValue[4] = Sys.CalibrationDensity;
            calc_calibrate_result_by_diff(4);--ͨ������ʽ�����ķ�����Զ����a,b,c,d��ֵ
            print("У��4��E1=", Sys.caliE1[4], ",E2=", Sys.caliE2[4]);
        end
        if paraTab[3] == ENABLE_STRING then--�Ƿ���Ҫ������ʷ��¼
            add_history_record(HISTORY_CALIBRATION_SCREEN)
        end
    ------��ǰ����Ϊˮ������/�˲�/�ӱ����/���Ժ˲����Ҫ������Ũ�ȵ�����---------------------------------------------------------
    else
        --���ݹ�ʽ������
        calc_analysis_result(Sys.calculateWay);

        --������Բ���
        if paraTab[1] == ENABLE_STRING then
            Sys.result = tonumber(paraTab[4]) * Sys.result + tonumber(paraTab[5]);
        end
        --���ݽ�����4-20mA����
        setPwmOutput(1, Sys.result)
        print("������� =", Sys.result);

         --��ǰ����Ϊˮ������/ƽ����/�հײ���/�հ�У׼/����У׼/ʵ��ˮ���ȶ�------------------------------------------------------
         if Sys.processType ==  ProcessItem[Sys.language][1] or Sys.processType ==  ProcessItem[Sys.language][9] or
         Sys.processType ==  ProcessItem[Sys.language][11] or Sys.processType ==  ProcessItem[Sys.language][12] or 
         Sys.processType ==  ProcessItem[Sys.language][13] or Sys.processType ==  ProcessItem[Sys.language][14] then
            --�Ƿ���Ҫ���б���
            if paraTab[2] == ENABLE_STRING then
                if Sys.result > tonumber(paraTab[9]) then--������ڱ���ֵ
                    Sys.alarmContent = TipsTab[Sys.language].highDensity;
                    add_history_record(HISTORY_ALARM_SCREEN);
                    set_fore_color(MAIN_SCREEN, LastResultId, RED);--��ɫ
                    beep(2000);
                elseif Sys.result < tonumber(paraTab[8]) then--������ڱ���ֵ
                    Sys.alarmContent = TipsTab[Sys.language].lowDensity;
                    add_history_record(HISTORY_ALARM_SCREEN);
                    set_fore_color(MAIN_SCREEN, LastResultId, RED);--��ɫ
                    beep(2000);
                else
                    set_fore_color(MAIN_SCREEN, LastResultId, BLACK);--��ɫ
                end
            end

            --��ʶ��Ҫ��ӽ����ʶ
            if Sys.result > tonumber(paraTab[9]) then
                Sys.processResultTag = ":T"
            elseif Sys.result then
                Sys.processResultTag = ":L"
            else
                Sys.processResultTag = ":N"
            end
            if paraTab[3] == ENABLE_STRING then--�Ƿ���Ҫ������ʷ��¼
                add_history_record(HISTORY_ANALYSIS_SCREEN)
            end
        --��ǰ����Ϊ���˲�/�����˲�/���̺˲�,����Ҫ�жϺ˲���------------------------------------------------------
        elseif Sys.processType ==  ProcessItem[Sys.language][5] or Sys.processType ==  ProcessItem[Sys.language][6] or 
               Sys.processType ==  ProcessItem[Sys.language][7] then
            local needCheck = false;
            Sys.isCheckOk = true;--Ĭ�Ϻ˲����ϸ�
            local DNL_Value = tonumber(paraTab[14])--�˲����
            if Sys.processType == ProcessItem[Sys.language][5] then--"���˲�":��λΪmg/L
                DNL_Value = DNL_Value;
                needCheck = true;
            elseif Sys.processType == ProcessItem[Sys.language][6] or --"�����˲�"
                    Sys.processType == ProcessItem[Sys.language][7] or --"���̺˲�"
                    Sys.processType == ProcessItem[Sys.language][11] then --"�հײ���"����λΪ�ٷֱ�
                DNL_Value = Sys.checkValue * DNL_Value / 100;
                needCheck = true;
            end
            --1.�ж��Ƿ���Ҫ�˲�; 2.�˲����Ƿ�ϸ�
            if needCheck == true and math.abs(Sys.result - Sys.checkValue) > DNL_Value then
                Sys.isCheckOk = false;--�˲������ϸ�
                Sys.alarmContent = Sys.processType..TipsTab[Sys.language].qualified--"�����˲鲻�ϸ�"
                add_history_record(HISTORY_ALARM_SCREEN);
                set_fore_color(MAIN_SCREEN, LastResultId, RED);--��ɫ
                beep(2000);
            end
            
            if paraTab[3] == ENABLE_STRING then--�Ƿ���Ҫ������ʷ��¼
                add_history_record(HISTORY_CHECK_SCREEN)
            end
        --��ǰ����Ϊ�ӱ����,------------------------------------------------------
        elseif Sys.processType ==  ProcessItem[Sys.language][8] then
            local Vs = tonumber(paraTab[17])--�ӱ������Ʒ����趨ֵ,���ڼ���ӱ������
            local stdDensity = tonumber(paraTab[18])--��׼��ҺŨ��
            if Sys.CalcStep == 1 then--�ӱ���յ�һ������,��Ҫ�������Լ�
                Sys.recoveryM1 = Sys.result;
                local rangeUpperLimit = tonumber(get_text(RANGE_SET_SCREEN,RangeTab[Sys.rangetypeId].HighId))--��ȡ��ǰ���̵���������
                local k = 1.0;
                --С�ڼ�����޵�50%, k=1.0
                if Sys.recoveryM1 < rangeUpperLimit*0.5 then
                    k = 1.0;
                --����������޵�50 %��M1��������޵�65 %�����ڼ���ӱ����VAʱ��k = 0.5��
                elseif Sys.recoveryM1 >= rangeUpperLimit*0.5 and Sys.recoveryM1 < rangeUpperLimit*0.65 then
                    k = 0.5;
                else--����������޵�65 %��M1�����������β���ֵ����ϡ�͵ķ�ʽ���½��мӱ���ղ��ԡ�����ˮ��ϡ��һ�����в��ԣ�
                    --�����ֵ��Ϊ��һ�β���ֵ��Ȼ����Ž���ϡ��ˮ���ļӱ�������ڼ���ӱ����VAʱ��k = 0.5��
                    k = 0.5
                end
                --������ӱ����,���ڵڶ��β���ʱ�ı�׼��Һ�����
                Sys.recoveryVa = (k * Sys.recoveryM1 * Vs) / stdDensity
                Sys.recoveryVa = GetPreciseDecimal(Sys.recoveryRate, 2)--����С�����2λ
            elseif Sys.CalcStep == 2 then--�ӱ���յڶ�������
                Sys.recoveryM2 = Sys.result;
                --����ӱ������
                Sys.recoveryRate = ((Sys.recoveryM2 - Sys.recoveryM1) * Vs * 100) / (stdDensity * Sys.recoveryVa )
                Sys.recoveryRate = GetPreciseDecimal(Sys.recoveryRate, 1)--����С�����1λ
            end
            if paraTab[3] == ENABLE_STRING then--�Ƿ���Ҫ������ʷ��¼
                add_history_record(HISTORY_RECOVERY_SCREEN);
            end
        --��ǰ����Ϊ���Ժ˲�------------------------------------------------------
        elseif Sys.processType ==  ProcessItem[Sys.language][10] then
            print("��ʼ���Ժ˲����")
            for i = 1,Sys.linearProcessStep,1 do
                Sys.linearX[i] = tonumber(paraTab[16]) * Sys.linearRatioDensity[i]--������ǵ�ǰ��ҺŨ��
            end

            if Sys.linearProcessStep == 1 then--���Ժ˲�1
                Sys.linearY[1] = Sys.result
                Sys.linearCorrelation = 1.0000 --�������ϵ��
            elseif Sys.linearProcessStep == 2 then--���Ժ˲�2
                Sys.linearY[2] = Sys.result
                Sys.linearCorrelation = 1.0000 --�������ϵ��
            elseif Sys.linearProcessStep == 3 then--���Ժ˲�3
                Sys.linearY[3] = Sys.result
                Sys.linearCorrelation = CalcLinearCorrelation();
            elseif Sys.linearProcessStep == 4 then--���Ժ˲�4
                Sys.linearY[4] = Sys.result
                Sys.linearCorrelation = CalcLinearCorrelation();
            elseif Sys.linearProcessStep == 5 then--���Ժ˲�5
                Sys.linearY[5] = Sys.result
                Sys.linearCorrelation = CalcLinearCorrelation();
            end
            if paraTab[3] == ENABLE_STRING then--�Ƿ���Ҫ������ʷ��¼ then
                add_history_record(HISTORY_LINER_SCREEN);
            end
        end
    end


    --����Modebus����������
    SetModebusResultArea();

    --�������������ʾ�����ʱ��
    if Sys.calculateType == CalcType[Sys.language][1] or Sys.calculateType == CalcType[Sys.language][3] then--��ǰ����Ϊ�������ߺ˲�
        set_text(MAIN_SCREEN, LastResultId, Sys.result);
    else
        set_text(MAIN_SCREEN, LastResultId, Sys.CalibrationDensity);
    end
    local sTime = string.format("%d-%02d-%02d %02d:%02d", Sys.startTime.year, Sys.startTime.mon, Sys.startTime.day,
    Sys.startTime.hour, Sys.startTime.min);
    set_text(MAIN_SCREEN, LastAnalysisTimeId, sTime);
    print("ִ����ɼ�������");

    return FINISHED;
end


--***********************************************************************************************
--  ��[(x-/x)(y-/y)]
--***********************************************************************************************
function averageSum(x, y)
    local averagex=0
    local averagey=0
    local sum=0;
    for i = 1, Sys.linearProcessStep, 1 do
        averagex = averagex + x[i];
    end
    averagex = averagex / Sys.linearProcessStep;--��xƽ��ֵ

    for i = 1, Sys.linearProcessStep, 1 do
        averagey = averagey + x[i];
    end
    averagey = averagey / Sys.linearProcessStep;--��yƽ��ֵ

    for i=0, i<Sys.linearProcessStep, 1 do
       sum = sum + (x[i]-averagex) * (y[i]-averagey)
    end
    return sum;
end

--***********************************************************************************************
--  
--***********************************************************************************************
function squareAverage(x)
    local sum = 0
    local average = 0;
    for i=1,Sys.linearProcessStep,i do
        average = average + x[i]
    end
    average = average/Sys.linearProcessStep;--ȡƽ��ֵ

    for i=0,i<Sys.linearProcessStep,1 do
        sum = sum + (x[i]-average) * (x[i]-average);--ȡƽ����������
    end
    return math.sqrt(sum)
end


--***********************************************************************************************
--  �����������ϵ��
--***********************************************************************************************
function CalcLinearCorrelation()
    local avgSumXY,squaAvgX,squaAvgY, R
    
    avgSumXY = averageSum(Sys.linearX,Sys.linearY);
    squaAvgX = squareAverage(Sys.linearX);
    squaAvgY = squareAverage(Sys.linearY);
    R = avgSumXY / (squaAvgX * squaAvgY);
    return R;
end

--***********************************************************************************************
--  ����ķ�������a,b,c,d��ֵʱ,���õ��ú���
--  n��ʾΪ��Ԫһ�η���(��a,b,c,d),������Ԫһ�η���(��b,c,d,a����0)
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
--  ����ķ�������a,b,c,d��ֵʱ,���õ��ú���
--  n��ʾΪ��Ԫһ�η���(��a,b,c,d),������Ԫһ�η���(��b,c,d,a����0)
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
--  ͨ��������ʽ����У�����
--***********************************************************************************************
function calc_calibrate_result_by_log(void)
    local a, b, c, d;

    a = 0;
    b = 0;
    print(math.log(Sys.caliE1[1] / Sys.caliE2[1], 10));
    print(math.log(Sys.caliE1[2] / Sys.caliE2[2], 10))
    c = (Sys.caliValue[2] - Sys.caliValue[1]) / (math.log(Sys.caliE1[2] / Sys.caliE2[2], 10) - math.log(Sys.caliE1[1] / Sys.caliE2[1], 10));
    d = Sys.caliValue[2] - c * math.log(Sys.caliE1[2] / Sys.caliE2[2], 10);
    print("c=", c, ",d=", d)
    Sys.slop = c;--б��
    Sys.y_intercept = d;--�ؾ�
    Sys.slop = GetPreciseDecimal(Sys.slop, 4)--����С�����4λ
    Sys.y_intercept = GetPreciseDecimal(Sys.y_intercept, 4);--����С�����4λ
    --���ü������a,b,c,d���
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId, a);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId, b);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId, c);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId, d);
    WriteParaToConfigStrAndFile();--�����������ý���Ĳ���
end

--***********************************************************************************************
--  ͨ����ֵ��ʽ����У�����
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
    Sys.slop = c;--б��
    Sys.y_intercept = d;--�ؾ�
    Sys.slop = GetPreciseDecimal(Sys.slop, 4)--����С�����4λ
    Sys.y_intercept = GetPreciseDecimal(Sys.y_intercept, 4);--����С�����4λ
    --���ü������a,b,c,d���
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId, a);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId, b);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId, c);
    set_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId, d);
    print("a=" .. a .. ",b=" .. b .. ",c=" .. c .. ",d=" .. d);
    WriteParaToConfigStrAndFile();--�����������ý���Ĳ���
end

--***********************************************************************************************
--  ����������
--type��������ʽ���߲�ֵ��ʽ
--***********************************************************************************************
function calc_analysis_result(type)
    local x, a, b, c, d = 0;

    -- Sys.signalE1 = 4278.91;
    -- Sys.signalE2 = 3752.21;
    if type == CalcWay[Sys.language].log then--ȡ������ʽ
        if Sys.signalE2 == 0 then
            x = 0;
        else
            x = math.log(Sys.signalE1 / Sys.signalE2, 10);
        end
    else
        x = Sys.signalE1 - Sys.signalE2;
    end
    Sys.absorbancy = x;
    a = tonumber(get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].aId));
    b = tonumber(get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].bId));
    c = tonumber(get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].cId));
    d = tonumber(get_text(RANGE_SET_SCREEN, RangeTab[Sys.rangetypeId].dId));
    print(string.format("a=%f,b=%f,c=%f,d=%f,x=%f", a, b, c, d, x));
    -- Sys.result = a *math.pow(x, 3) + b * math.pow(x, 2) + c * x + d;
    Sys.result = GetPreciseDecimal(Sys.result, tonumber(get_text(RUN_CONTROL_SCREEN,DecimalTextId)))--����С�������λ
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
function process_valve_ctrl_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteTypeAndContentToActionStrTab(DestActionNum);
            change_screen(DestScreen);
        end
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
            control_valco(tonumber(paraTab[19]));--idΪ23�Ŀؼ�Ϊͨ����
            start_wait_time(tonumber(paraTab[20]));
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--�ж��Ƿ���Ҫ��������в���
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
            for i = 1, 16, 1 do
                Sys.valveIdTab[i] = paraTab[i + 2];
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
function process_wait_time_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteTypeAndContentToActionStrTab(DestActionNum);
            change_screen(DestScreen);
        end
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
    ��������-���Ժ˲�ϡ��
--------------------------------------------------------------------------------------------------------------------]]
LINEAR_BtStartId = 1
LINEAR_BtEndId = 10
LINEAR_TextStartId = 11
LINEAR_TextEndId = 60

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_linear_set_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            WriteTypeAndContentToActionStrTab(DestActionNum);
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  ���Ժ˲�ϡ�ͱ�Һ
--***********************************************************************************************
function excute_linear_set_process(paraTab)
    if UartArg.lock == LOCKED or Sys.waitTimeFlag == SET then--���������������ڵȴ���ʱ.
        return;
    end

    local valNum = 10;
    -----------------------------------------------------------------
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--�ж��Ƿ���Ҫ�Է�����
            valNum = tonumber(paraTab[Sys.linearProcessStep*10+1])
            if valNum < 10 then--����ʮͨ��
                control_valco(valNum)--ͨ����
            elseif valNum >= 11 and valNum <= 16 then--������ŷ�
                open_single_valve(valNum);
            end
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--
        if paraTab[2] == ENABLE_STRING then
            Sys.injectScale = tonumber(paraTab[Sys.linearProcessStep*10+2]) * 10;
            Sys.waitTime = 10;
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 3 then--
        if paraTab[1] == ENABLE_STRING and valNum >= 11 and valNum <= 16 then--������ŷ�
            close_single_valve(valNum);
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        if paraTab[3] == ENABLE_STRING then--�ж��Ƿ���Ҫ�Է�����
            valNum = tonumber(paraTab[Sys.linearProcessStep*10+3])
            if valNum < 10 then--����ʮͨ��
                control_valco(valNum)--ͨ����
            elseif valNum >= 11 and valNum <= 16 then--������ŷ�
                open_single_valve(valNum);
            end
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 5 then--
        if paraTab[4] == ENABLE_STRING then
            Sys.injectScale = tonumber(paraTab[Sys.linearProcessStep*10+4]) * 10;
            Sys.waitTime = 10;
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 6 then--
        if paraTab[3] == ENABLE_STRING and valNum >= 11 and valNum <= 16 then--������ŷ�
            close_single_valve(valNum);
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 7 then
        if paraTab[5] == ENABLE_STRING then--�ж��Ƿ���Ҫ�Է�����
            valNum = tonumber(paraTab[Sys.linearProcessStep*10+5])
            if valNum < 10 then--����ʮͨ��
                control_valco(valNum)--ͨ����
            elseif valNum >= 11 and valNum <= 16 then--������ŷ�
                open_single_valve(valNum);
            end
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 8 then--
        if paraTab[6] == ENABLE_STRING then
            Sys.injectScale = tonumber(paraTab[Sys.linearProcessStep*10+6]) * 10;
            Sys.waitTime = 10;
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 9 then--
        if paraTab[5] == ENABLE_STRING and valNum >= 11 and valNum <= 16 then--������ŷ�
            close_single_valve(valNum);
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 10 then
        if paraTab[7] == ENABLE_STRING then--�ж��Ƿ���Ҫ�Է�����
            valNum = tonumber(paraTab[Sys.linearProcessStep*10+7])
            if valNum < 10 then--����ʮͨ��
                control_valco(valNum)--ͨ����
            elseif valNum >= 11 and valNum <= 16 then--������ŷ�
                open_single_valve(valNum);
            end
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 11 then--
        if paraTab[8] == ENABLE_STRING then
            Sys.injectScale = tonumber(paraTab[Sys.linearProcessStep*10+8]) * 10;
            Sys.waitTime = 10;
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 12 then--
        if paraTab[7] == ENABLE_STRING and valNum >= 11 and valNum <= 16 then--������ŷ�
            close_single_valve(valNum);
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
        -----------------------------------------------------------------
    elseif Sys.actionSubStep == 13 then
        if paraTab[9] == ENABLE_STRING then--�ж��Ƿ���Ҫ�Է�����
            valNum = tonumber(paraTab[Sys.linearProcessStep*10+9])
            if valNum < 10 then--����ʮͨ��
                control_valco(valNum)--ͨ����
            elseif valNum >= 11 and valNum <= 16 then--������ŷ�
                open_single_valve(valNum);
            end
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 14 then--
        if paraTab[10] == ENABLE_STRING then
            Sys.injectScale = tonumber(paraTab[Sys.linearProcessStep*10+10]) * 10;
            Sys.waitTime = 10;
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 15 then--
        if paraTab[9] == ENABLE_STRING and valNum >= 11 and valNum <= 16 then--������ŷ�
            close_single_valve(valNum);
            start_wait_time(2);
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 16 then--����
        Sys.actionSubStep = FINISHED;
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������ѡ��
--------------------------------------------------------------------------------------------------------------------]]
AnalysisButtonId = 1;--������ť
NullButtonId = 13;--�հ�ť

ProcessTypeSelectItem = nil;

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_type_select_set(screen, control)
    DestScreen = screen;
    DestControl = control;
end


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_type_select_control_notify(screen, control, value)
    if control >= AnalysisButtonId and control <= NullButtonId then
        ProcessTypeSelectItem = control;
    elseif control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            change_screen(DestScreen);
            if ProcessTypeSelectItem ~= nil then
                set_text(DestScreen, DestControl, ProcessItem[Sys.language][ProcessTypeSelectItem]);--DestControl��Ӧ����ѡ��
                if DestScreen == PROCESS_SET1_SCREEN or DestScreen == PROCESS_SET2_SCREEN then
                    set_text(DestScreen, DestControl - 100, ProcessItem[Sys.language][ProcessTypeSelectItem] .. (DestControl - 300));--DestControl-100��Ӧ��������
                end
            end
            WriteParaToConfigStrAndFile();--��������еĲ���
        end
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������ѡ��
--------------------------------------------------------------------------------------------------------------------]]
FirstButtonId = 101;--��һ����ť
LastButtonId = 125;--���һ����ť
TipsTextId = 79;--��ʾ�ı���

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_name_select_set(screen, control)
    DestScreen = screen;
    DestControl = control;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_name_select_control_notify(screen, control, value)
    if control >= FirstButtonId and control <= LastButtonId then
        ProcessNameSelecItem = control - 100;--control-100 = ��ð�ť�غϵ��ı���id
    elseif control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť,����֮ǰ�Ľ���
        if ProcessNameSelecItem ~= nil then --ProcessNameSelecItemĬ��Ϊnil,���ѡ����ĳ���������ֵ��Ϊnil
            set_text(DestScreen, DestControl, get_text(PROCESS_NAME_SELECT_SCREEN, ProcessNameSelecItem));--DestControl��Ӧ����?��?
            WriteParaToConfigStrAndFile();
        end
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end


--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_ProcessNameSelect()
    --�����а�ť��������
    for i = FirstButtonId, LastButtonId, 1 do
        set_visiable(PROCESS_NAME_SELECT_SCREEN, i, 0);
    end
    --�������밴ť�غϵ��ı����������
    for i = FirstButtonId - 100, LastButtonId - 100, 1 do
        set_visiable(PROCESS_NAME_SELECT_SCREEN, i, 0);
    end
    --������ʾ��Ϣ
    set_visiable(PROCESS_NAME_SELECT_SCREEN, TipsTextId, 0);

    --��������1-12,���Ƿ�����������,�������������,������������ѡ������н�����ʾ
    --��������п��ƽ���,������Ҫ�ж��Ƿ���������������, ����Ҫ�жϸ������Ƿ��ж�Ӧ�������ļ�
    NumberOfProcess = 0;

    local processFile = nil;
    for i = 1, 12, 1 do
        if get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId) ~= BLANK_SPACE then--��ȡ���Ƴ���,�����Ƴ��Ȳ�Ϊ0ʱ��ʾ��Ч
            NumberOfProcess = NumberOfProcess + 1;--����+1
            set_text(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId))--Ϊ���ı�?������ı?
            set_visiable(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, 1);--��ʾidΪNumberOfProcess���ı�
            set_visiable(PROCESS_NAME_SELECT_SCREEN, 100 + NumberOfProcess, 1);--��ʾ����ı����Ӧ�İ�ť
        end
    end
    for i = 13, 24, 1 do
        if get_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId) ~= BLANK_SPACE then--��ȡ���Ƴ���,�����Ƴ��Ȳ�Ϊ0ʱ��ʾ��Ч
            NumberOfProcess = NumberOfProcess + 1;--����+1
            set_text(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId))--Ϊ���ı�?������ı?
            set_visiable(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, 1);--��ʾidΪNumberOfProcess���ı�
            set_visiable(PROCESS_NAME_SELECT_SCREEN, 100 + NumberOfProcess, 1);--��ʾ����ı����Ӧ�İ�ť
        end
    end
    -- ��Ҫ��������һ��Ϊ"��"��ѡ��
    NumberOfProcess = NumberOfProcess + 1;
    set_text(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, BLANK_SPACE)--Ϊ���ı�����������
    set_visiable(PROCESS_NAME_SELECT_SCREEN, NumberOfProcess, 1);--��ʾidΪNumberOfProcess���ı�
    set_visiable(PROCESS_NAME_SELECT_SCREEN, 100 + NumberOfProcess, 1);--��ʾ����ı����Ӧ�İ�ť

    --��ʾ��ʾ��Ϣ
    if NumberOfProcess == 0 then
        set_visiable(PROCESS_NAME_SELECT_SCREEN, TipsTextId, 1);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    ����ѡ��
--------------------------------------------------------------------------------------------------------------------]]
ActionStartButtonId = 1;
ActionEndButtonId = 10;
ActionSelectItem = nil;


--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function action_select_set(screen, control, actionNumber)
    DestScreen = screen;
    DestControl = control;
    DestActionNum = actionNumber;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function action_select_control_notify(screen, control, value)
    if control >= ActionStartButtonId and control <= ActionEndButtonId then --��������ѡ��ť
        ActionSelectItem = control;
    elseif control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            if ActionSelectItem ~= nil then
                set_text(DestScreen, DestControl, ActionItem[Sys.language][ActionSelectItem]);--����ѡ��
                set_text(DestScreen, DestControl - 100, ActionItem[Sys.language][ActionSelectItem]);--DestControl-100��Ӧ��������
            end
            WriteTypeAndContentToActionStrTab(DestActionNum)
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������
--------------------------------------------------------------------------------------------------------------------]]
--����������/����ѡ�������,����1/2/3�ı���id����һ����
RANGESET_TextStartId = 1;
RANGESET_TextEndId = 19;

UniteSetTextId = 19--��λ���óɹ���,������ʾ��λ�ı���id
UniteSetMenuId = 26;--��λѡ��

RangeTab = {
    [1] = { LowId = 1, HighId = 2, aId = 3, bId = 4, cId = 5, dId = 6 },
    [2] = { LowId = 7, HighId = 8, aId = 9, bId = 10, cId = 11, dId = 12 },
    [3] = { LowId = 13, HighId = 14, aId = 15, bId = 16, cId = 17, dId = 18 },
};

--���õ�λ
function set_unit()
    local Unite = get_text(RANGE_SET_SCREEN, UniteSetTextId);

    if Unite == "mg/L" then
        ModeBus[0x1002] = 1
    elseif Unite == "ug/L" then
        ModeBus[0x1002] = 0
    elseif Unite == "PPM" then
        ModeBus[0x1002] = 2
    elseif Unite == "PPB" then
        ModeBus[0x1002] = 5
    end
    --�������ý�����,�ؼ�Id = 300 ~ 302Ϊ��λ��ʾ�ı�
    for i = 300, 302, 1 do
        set_text(RANGE_SET_SCREEN, i, Unite);
    end
    --��ҳ��,�ؼ�Id= 19 Ϊ��λ��ʾ
    set_text(MAIN_SCREEN, LastResultUnitId, Unite);

    --����ѡ�������,�ؼ�Id = 15/20/25Ϊ��λ��ʾ�ı�
    set_text(RANGE_SELECT_SCREEN, 15, Unite);
    set_text(RANGE_SELECT_SCREEN, 20, Unite);
    set_text(RANGE_SELECT_SCREEN, 25, Unite);

    --�������ý���,���˲����λ
    set_text(RUN_CONTROL_PERIOD_SCREEN, 36, Unite);
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function range_set_control_notify(screen, control, value)
    if control == UniteSetMenuId then --���õ�λ
        set_unit();
    elseif control == 50 and value == ENABLE then --���水ť
        WriteParaToConfigStrAndFile();
    elseif control >= 1 and control <= 18 then
        if get_text(RANGE_SET_SCREEN, control) == "" then
            set_text(RANGE_SET_SCREEN, control, 0);
        end
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
function range_select_set(screen, control)
    DestScreen = screen;
    DestControl = control;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function range_select_control_notify(screen, control, value)

    if control >= Range1Id and control <= Range3Id then--����ѡ��ť
        RangeSelectItem = control;
    elseif control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            change_screen(DestScreen);
            set_text(DestScreen, DestControl, RangeSelectItem);
        end
    elseif control == CancelButtonId then--ȡ����ť
        change_screen(DestScreen);
    end
end


--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_range_select()
    set_text(RANGE_SELECT_SCREEN, 4, get_text(RANGE_SET_SCREEN, RangeTab[1].LowId));
    set_text(RANGE_SELECT_SCREEN, 5, get_text(RANGE_SET_SCREEN, RangeTab[1].HighId));
    set_text(RANGE_SELECT_SCREEN, 6, get_text(RANGE_SET_SCREEN, RangeTab[2].LowId));
    set_text(RANGE_SELECT_SCREEN, 7, get_text(RANGE_SET_SCREEN, RangeTab[2].HighId));
    set_text(RANGE_SELECT_SCREEN, 8, get_text(RANGE_SET_SCREEN, RangeTab[3].LowId));
    set_text(RANGE_SELECT_SCREEN, 9, get_text(RANGE_SET_SCREEN, RangeTab[3].HighId));
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
    if value == DISABLE and operate_permission_detect(CHK_RUN) == DISABLE then--˲�䰴ť��������θú���, ���Ӹ��ж�ʹ�õڶ��ε��ú���������˳�
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
        uartSendTab.openValco[2] = tonumber(get_text(screen, HandValcoChnlId));
        on_uart_send_data(uartSendTab.openValco, NO_NEED_REPLY);
    elseif control == HandInject1SendId then--����ע���
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
        set_inject1_speed(tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1SpdId)));
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then --������:�ƶ�ע��õ�ָ��λ��
        Sys.waitTimeFlag = SET;
        Sys.waitTime = tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1WaitTimeId));
        start_timer(2, Sys.waitTime * 1000, 1, 1); --������ʱ��2����ʱʱ��8s,1->��ʾִֻ��һ��
        if sta == 0 then
            move_inject1_to(0);
        else
            move_inject1_to(tonumber(get_text(HAND_OPERATE1_SCREEN, HandInject1ScaleId)) * 10);
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
HandGetTempBtId = 55;
HandTempTextId = 53;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function hand_operate2_control_notify(screen, control, value)

    if value == DISABLE and operate_permission_detect(CHK_RUN) == DISABLE then
        return;
    end

    if control == HandGetVoltageId then--��ȡ��ѹ
        if Sys.hand_control_func == nil then
            Sys.processStep = 1;
            UartArg.lock = UNLOCKED;
            set_enable(screen, control, DISABLE);
            Sys.hand_control_func = hand_get_voltage;
        end
    elseif control == HandGetTempBtId then
        if Sys.hand_control_func == nil then
            Sys.processStep = 1;
            UartArg.lock = UNLOCKED;
            set_enable(screen, control, DISABLE);
            Sys.hand_control_func = hand_get_temperature;
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
        local ledCurrentValue = tonumber(get_text(HAND_OPERATE2_SCREEN, HandLedCurrentTextId));
        ledCurrentValue = ledCurrentValue * 2048 / 50;
        ledCurrentValue = math.floor(ledCurrentValue + 0.5);--��������
        uartSendTab.setLedCurrnet[4] = math.modf(ledCurrentValue / 256);
        uartSendTab.setLedCurrnet[5] = math.fmod(ledCurrentValue, 256);
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

--***********************************************************************************************
--�ֶ�����-�ֶ���ȡ�¶�
--***********************************************************************************************
function hand_get_temperature()
    if UartArg.lock == LOCKED then
        return;
    end

    if Sys.processStep == 1 then--��һ��: ���ʹ���ָ���ȡ��ѹ
        ShowSysCurrentAction("�ֶ�����-��ȡ�¶�");
        on_uart_send_data(uartSendTab.getDsTemp, NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 2 then--�ڶ���: ������ѹֵ��������ʾ
        local Temp = "time out";
        if UartArg.reply_sta == SEND_OK then
            Temp = (UartArg.recv_data[5] * 256 + UartArg.recv_data[6]) / 10
            if UartArg.recv_data[4] == 0x01 then--�¶�Ϊ����
                Temp = Temp * (-1);
            end
            Temp = (UartArg.recv_data[3] * 256 + UartArg.recv_data[4]) / 10;
        end
        set_enable(HAND_OPERATE2_SCREEN, HandGetTempBtId, ENABLE);
        set_value(HAND_OPERATE2_SCREEN, HandGetTempBtId, DISABLE);
        set_text(HAND_OPERATE2_SCREEN, HandTempTextId, Temp);
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

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function hand_operate3_control_notify(screen, control, value)
    if control == REAGENT_SaveId and value == ENABLE then--���水ť
        WriteParaToConfigStrAndFile();
    elseif control >= 7 and control <= 30 then--�Լ��ж�
        ShowSysAlarm("");
        for i = 1, 6, 1 do
            if tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].remainId)) <= tonumber(get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].alarmId)) then
                Sys.alarmContent = TipsTab[Sys.language].lack .. get_text(HAND_OPERATE3_SCREEN, ReagentTab[i].nameId);--��ʼ����������
                ShowSysAlarm(Sys.alarmContent);--�ڵײ�״̬����ʾ������Ϣ
            end
        end
    end
end




--[[-----------------------------------------------------------------------------------------------------------------
    �ֶ�����4
--------------------------------------------------------------------------------------------------------------------]]
--��Ȼ����Ϊ�ֶ�����4, ��ʵ��ͨѶ��¼����
UartRecordId = 1--����ͨѶ��¼�ռ�id

--[[-----------------------------------------------------------------------------------------------------------------
    �������
--------------------------------------------------------------------------------------------------------------------]]
IOSET_TextStartId = 1;
IOSET_TextEndId = 12;
IOSET_BaudSelectMenuId = 18;
IOSET_BaudTextId = 2;
IOSET_ComputerAddr = 1;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function in_out_control_notify(screen, control, value)
    if control == IOSET_BaudSelectMenuId  then
        uart_set_baudrate(tonumber(get_text(IN_OUT_SCREEN,IOSET_BaudTextId)))
    elseif control == 3 or control == 4 or control == 5  then--�޸����1����
        local v4 = tonumber(get_text(IN_OUT_SCREEN,4))--4mA��Ӧֵ
        local v20 = tonumber(get_text(IN_OUT_SCREEN,5))--20mA��Ӧֵ
        local a = 16/(v20-v4);
        local b = 4 - (a *v4);
        local result = tonumber( get_text(MAIN_SCREEN,LastResultId) );
        local out = result * a + b;
        if out < 4 then
            out = 4;
        elseif out > 20 then
            out = 20
        end
        set_text(IN_OUT_SCREEN,3, out);
    elseif control == 6 or control == 7 or control == 8 then--�޸����2����
        local v4 = tonumber(get_text(IN_OUT_SCREEN,7))--4mA��Ӧֵ
        local v20 = tonumber(get_text(IN_OUT_SCREEN,8))--20mA��Ӧֵ
        local a = 16/(v20-v4);
        local b = 4 - a *v4;
        local result = tonumber( get_text(MAIN_SCREEN,LastResultId) );
        local out = result * a + b;
        if out < 4 then
            out = 4;
        elseif out > 20 then
            out = 20
        end
        set_text(IN_OUT_SCREEN,6, out);
    elseif control == 25 and value == ENABLE then--���1���԰�ť
        setPwmOutput(1, tonumber(get_text(IN_OUT_SCREEN,3)))
    elseif control == 14 and value == ENABLE then--���2���԰�ť
        setPwmOutput(2, tonumber(get_text(IN_OUT_SCREEN,6)))
    elseif control == 24 and value == ENABLE then--���1 4mAУ��ֵ
        -- print(tonumber(get_text(IN_OUT_SCREEN,9)));
        setPwmAdjust(3, tonumber(get_text(IN_OUT_SCREEN,9)))
    elseif control == 26 and value == ENABLE then--���1 20mAУ��ֵ
        -- print(tonumber(get_text(IN_OUT_SCREEN,10)));
        setPwmAdjust(5, tonumber(get_text(IN_OUT_SCREEN,10)))
    elseif control == 27 and value == ENABLE then--���2 4mAУ��ֵ
        -- print(tonumber(get_text(IN_OUT_SCREEN,11)));
        setPwmAdjust(4, tonumber(get_text(IN_OUT_SCREEN,11)))
    elseif control == 28 and value == ENABLE then--���2 20mAУ��ֵ
        -- print(tonumber(get_text(IN_OUT_SCREEN,12)))
        setPwmAdjust(6, tonumber(get_text(IN_OUT_SCREEN,12)))
    end

    if control >= IOSET_TextStartId and control <= IOSET_TextEndId then
        WriteParaToConfigStrAndFile();
    end
end


--***********************************************************************************************
--����pwm���
--***********************************************************************************************
function setPwmOutput(flag, floatValue)
    if floatValue < 4 then
        floatValue = 4;
    elseif floatValue > 20 then
        floatValue = 20;
    end
    local value = FloatToHex(floatValue);
    -- print(string.format("%08X", value));
    uartSendTab.setPwm[2] = math.fmod( value, 256)
    uartSendTab.setPwm[3] = math.fmod( right_shift(value,8), 256)
    uartSendTab.setPwm[4] = math.fmod( right_shift(value,16), 256)
    uartSendTab.setPwm[5] = math.fmod( right_shift(value,24), 256)

    uartSendTab.setPwm[1] = flag;
    on_uart_send_data(uartSendTab.setPwm, NO_NEED_REPLY);
end

--***********************************************************************************************
--����pwm��4mA��20mAУ��ֵ
--***********************************************************************************************
function setPwmAdjust(flag, value)

    uartSendTab.setPwm[2] = math.fmod( value, 256)
    uartSendTab.setPwm[3] = math.fmod( right_shift(value,8), 256)
    uartSendTab.setPwm[4] = math.fmod( right_shift(value,16), 256)
    uartSendTab.setPwm[5] = math.fmod( right_shift(value,24), 256)

    uartSendTab.setPwm[1] = flag;
    on_uart_send_data(uartSendTab.setPwm, NO_NEED_REPLY);
end

--[[-----------------------------------------------------------------------------------------------------------------
    �������˲顢У׼����������־��¼
--------------------------------------------------------------------------------------------------------------------]]
HistoryRecordId = 32;--��ʷ��¼�ؼ�Id�ţ�������У׼����������־���������
HistoryClear = 2;
HistoryExport = 8;
HistoryNextPage = 128;
HistoryPrevPage = 129;
HistoryCurPage = 5;
HistoryTotalPage = 6;

MAX_ANALYSIS_FILE_NUM = 20000;
MAX_CHECK_FILE_NUM = 10000;
MAX_CALIBRARE_FILE_NUM = 10000;
MAX_RECOVERY_FILE_NUM = 10000;
MAX_LINER_FILE_NUM = 10000;
MAX_ALARM_FILE_NUM = 10000;
MAX_LOG_FILE_NUM = 20000;
--***********************************************************************************************
--  ���һ����ʷ��¼
-- screen:����һ���������ʷ��¼�ؼ��������
--***********************************************************************************************
function add_history_record(screen)
    local date, time, filePath,signalHistoryContent,historyTab,historyOrder,maxHistoryNum;

    filePath = getFilePathByScreen(screen);
    historyTab = readFileToTab(filePath);--���ļ���ȡ��tab����
    maxHistoryNum = getMaxNumByScreen(screen);--��ȡ����¼����
    date = string.format("%d-%02d-%02d",math.fmod( Sys.startTime.year,100 ), Sys.startTime.mon, Sys.startTime.day);
    time = string.format("%02d:%02d", Sys.startTime.hour, Sys.startTime.min);
    
    if #historyTab < maxHistoryNum then
        historyOrder = #historyTab;
    else
        lastHistoryTab = split(historyTab[#historyTab] ,";");--��ȡ�������ʷ��¼,�����ü�¼��","���зָ��
        historyOrder = lastHistoryTab[1] + 1;--�����һ����¼����ż�1
        if historyOrder > maxHistoryNum then--�ж�����Ƿ���
            historyOrder = 1;
        end
    end

    --��ҳ�ļ�¼���浽��¼�ռ䵱��,�ϵ���������ȡ�ü�¼���е�����
    if screen == HISTORY_ANALYSIS_SCREEN or screen == HISTORY_CHECK_SCREEN then
        Sys.lastInfo[lastTime] = date.." "..time
        Sys.lastInfo[lastResult] = Sys.result
        Sys.lastInfo[lastE1] = Sys.signalE1
        Sys.lastInfo[lastE2] = Sys.signalE2
        saveLastInfo()
    end
    
    if screen == HISTORY_ANALYSIS_SCREEN then--������ʷ
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" ..--���,����,ʱ��
                    Sys.result .. ";" .. Sys.signalE1 .. ";" .. Sys.signalE2 .. ";" .. Sys.rangetypeId .. ";" .. Sys.processTag..Sys.processResultTag;--���/E2/E2/����/���ͱ�ʶ
    elseif screen == HISTORY_CHECK_SCREEN then--�˲���ʷ
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" ..--���,����,ʱ��
                    Sys.checkValue .. ";" .. Sys.result .. ";" ..Sys.signalE1 .. ";" .. Sys.signalE2 .. ";" .. --���/E2/E2/
                    Sys.rangetypeId .. ";" .. Sys.processTag;--����/���ͱ�ʶ
    elseif screen == HISTORY_CALIBRATION_SCREEN then--У����ʷ
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" ..--���,����,ʱ��
                    Sys.CalibrationDensity .. ";" .. Sys.signalE1 .. ";" .. Sys.signalE2 .. ";" .. 
                    Sys.slop..";"..Sys.y_intercept..";"..Sys.rangetypeId;
                    print("���У����ʷ:"..signalHistoryContent);
    elseif screen == HISTORY_RECOVERY_SCREEN then--�ӱ����
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" ..--���,����,ʱ��
                   Sys.recoveryVa.. ";" ..Sys.result.. ";" ..Sys.signalE1 .. ";" .. Sys.signalE2 .. ";" ..--�ӱ����,Ũ�Ƚ��,E1,E2
                   Sys.recoveryRate.. ";" ..Sys.rangetypeId--�ӱ������,����
    elseif screen == HISTORY_LINER_SCREEN then--���Ժ˲�
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" ..--���,����,ʱ��
                   Sys.result.. ";" ..Sys.signalE1 .. ";" .. Sys.signalE2 .. ";" ..--���,E1,E2
                   Sys.linearCorrelation.. ";" ..Sys.linearProcessStep..";"..Sys.rangetypeId--���ϵ��,��,����
    elseif screen == HISTORY_ALARM_SCREEN then--����
        date = string.format("%d-%02d-%02d", math.fmod(Sys.dateTime.year,100), Sys.dateTime.mon, Sys.dateTime.day);
        time = string.format("%02d:%02d", Sys.dateTime.hour, Sys.dateTime.min);
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" .. Sys.alarmContent .. "; "--���,����,ʱ��
    elseif screen == HISTORY_LOG_SCREEN then--��־
        date = string.format("%d-%02d-%02d", math.fmod(Sys.dateTime.year,100), Sys.dateTime.mon, Sys.dateTime.day);
        time = string.format("%02d:%02d", Sys.dateTime.hour, Sys.dateTime.min);
        signalHistoryContent = (historyOrder + 1) .. ";" .. date .. ";" .. time .. ";" .. Sys.logContent .. ";" .. Sys.userName--���,����,ʱ��
    end
    
    --�����ݽ��м���
    signalHistoryContent = encryptStr(signalHistoryContent);

    if #historyTab >= MAX_ANALYSIS_FILE_NUM then
        table.remove(historyTab, 1);--ɾ����һ������
    end
    table.insert(historyTab, signalHistoryContent);--���һ����ʷ��¼
    writeTabToFile(filePath, historyTab)--��tab�е�����д���ļ�����

    --��ʾ�����10����ʷ��¼
    if screen == get_current_screen() then
        showHistoryByScreenAndPage(screen, 1);
    end

    --����Ǳ���,����Ҫ���ñ������浽��־����
    if screen == HISTORY_ALARM_SCREEN then
        Sys.logContent = Sys.alarmContent
        add_history_record(HISTORY_LOG_SCREEN);
    end

end

--***********************************************************************************************
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--***********************************************************************************************
function history_control_notify(screen, control, value)
    if control == HistoryClear and value == ENABLE then--�����ʷ
        set_return_screen_control(screen, control);
        change_screen(PASSWORD_DIALOG_SCREEN);
    elseif control ==HistoryExport and value == ENABLE then--������ʷ
        exportHistory(screen);
    elseif control == HistoryNextPage and value == ENABLE then--��һҳ
        local curPage = tonumber(get_text(screen,HistoryCurPage));
        local totalPage = tonumber(get_text(screen,HistoryTotalPage))
        if curPage < totalPage then
            curPage = curPage + 1;
            set_text(screen, HistoryCurPage, curPage);
            showHistoryByScreenAndPage(screen,curPage);
        end
    elseif control == HistoryPrevPage and value == ENABLE then--��һҳ
        local curPage = tonumber(get_text(screen,HistoryCurPage));
        if curPage > 1 then--��ǰҳ����1
            curPage = curPage - 1;
            set_text(screen, HistoryCurPage, curPage);
            showHistoryByScreenAndPage(screen,curPage);
        end
    elseif control == HistoryCurPage then--��ת��ָ��ҳ
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
--���ظ�����¼�����ɼ�¼����
--***********************************************************************************************
function getMaxNumByScreen(screen)
    local maxNumber = 0;
    if screen == HISTORY_ANALYSIS_SCREEN then--������ʷ
        maxNumber = MAX_ANALYSIS_FILE_NUM
    elseif screen == HISTORY_CHECK_SCREEN then--�˲���ʷ
        maxNumber = MAX_CHECK_FILE_NUM
    elseif screen == HISTORY_CALIBRATION_SCREEN then--У����ʷ
        maxNumber = MAX_CALIBRARE_FILE_NUM
    elseif screen ==HISTORY_RECOVERY_SCREEN then--�ӱ����
        maxNumber = MAX_RECOVERY_FILE_NUM
    elseif screen == HISTORY_LINER_SCREEN then--���Ժ˲�
        maxNumber = MAX_LINER_FILE_NUM
    elseif screen == HISTORY_ALARM_SCREEN then--����
        maxNumber = MAX_ALARM_FILE_NUM
    elseif screen == HISTORY_LOG_SCREEN then--��־
        maxNumber = MAX_LOG_FILE_NUM
    end
    return maxNumber;
end

--***********************************************************************************************
--��ת��������ʷ����ʱ,���øú���,��ʾ���µļ�¼
--***********************************************************************************************
function getFilePathByScreen(screen)
    local filePath = "";
    if screen == HISTORY_ANALYSIS_SCREEN then--������ʷ
        filePath = SdPath .. "record/Analysis";
    elseif screen == HISTORY_CHECK_SCREEN then--�˲���ʷ
        filePath = SdPath.."record/Check"
    elseif screen == HISTORY_CALIBRATION_SCREEN then--У����ʷ
        filePath = SdPath.."record/Calibration"
    elseif screen == HISTORY_RECOVERY_SCREEN then--�ӱ����
        filePath = SdPath.."record/Recovery"
    elseif screen == HISTORY_LINER_SCREEN then--���Ժ˲�
        filePath = SdPath.."record/Linear"
    elseif screen == HISTORY_ALARM_SCREEN then--����
        filePath = SdPath.."record/Alarm"
    elseif screen == HISTORY_LOG_SCREEN then--��־
        filePath = SdPath.."record/log"
    end
    return filePath;
end


--***********************************************************************************************
--����⵽��ʷ��¼�ļ�������ʱ,����һ���յ��ļ�
--***********************************************************************************************
function checkHistoryFile()
    local file;
    file = io.open(SdPath .. "record/Analysis");
    if file == nil then
        file = io.open(SdPath .. "record/Analysis", "w+");--�򿪲���ո��ļ�
    end
    file:close();

    file = io.open(SdPath.."record/Check");
    if file == nil then
        file = io.open(SdPath.."record/Check", "w+");--�򿪲���ո��ļ�
    end
    file:close();

    file = io.open(SdPath.."record/Calibration");
    if file == nil then
        file = io.open(SdPath.."record/Calibration", "w+");--�򿪲���ո��ļ�
    end
    file:close();

    file = io.open(SdPath.."record/Recovery");
    if file == nil then
        file = io.open(SdPath.."record/Recovery", "w+");--�򿪲���ո��ļ�
    end
    file:close();

    file = io.open(SdPath.."record/Linear");
    if file == nil then
        file = io.open(SdPath.."record/Linear", "w+");--�򿪲���ո��ļ�
    end
    file:close();

    file = io.open(SdPath.."record/Alarm");
    if file == nil then
        file = io.open(SdPath.."record/Alarm", "w+");--�򿪲���ո��ļ�
    end
    file:close();

    file = io.open(SdPath.."record/log");
    if file == nil then
        file = io.open(SdPath.."record/log", "w+");--�򿪲���ո��ļ�
    end
    file:close();

    --������ʷ��¼���涼���10���յļ�¼,֮��ͨ��record_modify���޸���ʾ.
    for i=1,10,1 do
        record_add(HISTORY_ANALYSIS_SCREEN, HistoryRecordId," ");
        record_add(HISTORY_CHECK_SCREEN, HistoryRecordId," ");
        record_add(HISTORY_CALIBRATION_SCREEN, HistoryRecordId," ");
        record_add(HISTORY_ALARM_SCREEN, HistoryRecordId," ");
        record_add(HISTORY_LOG_SCREEN, HistoryRecordId," ");
    end

    --��ʾ���µ�10����ʷ��¼,�Լ�����ʷ��¼ҳ��, ����ʷ��¼����
    setHistoryScreen(HISTORY_ANALYSIS_SCREEN);
    setHistoryScreen(HISTORY_CHECK_SCREEN);
    setHistoryScreen(HISTORY_CALIBRATION_SCREEN);
    setHistoryScreen(HISTORY_ALARM_SCREEN);
    setHistoryScreen(HISTORY_ALARM_SCREEN);


end


--***********************************************************************************************
--������ʷ��¼���������ʾ
--***********************************************************************************************
function setHistoryScreen(screen)
    local historyTab = readFileToTab(getFilePathByScreen(screen));--���ļ���ȡ��tab����
    --��ʾ�����10����ʷ��¼
    local index = 0;
    for i= #historyTab, (#historyTab-9), -1 do
        if historyTab[i] ~= nil then
            local decodeContent = decodeStr(historyTab[i]);
            record_modify(screen, HistoryRecordId, index, decodeContent);
        end
        index = index + 1;
    end
    --��ʾ��ҳ��
    local totalPage = 0;
    local modePage = 0;
    if math.fmod(#historyTab,10) > 1 then
        modePage = 1;
    end
    totalPage = math.modf(#historyTab/10) + modePage
    set_text(screen, HistoryTotalPage, totalPage);
end

--***********************************************************************************************
--�����ʷ��¼�ļ�
--***********************************************************************************************
function clearHistoryFile(screen)
    local filePath = getFilePathByScreen(screen)
    local file = io.open(filePath, "w+");--�򿪲���ո��ļ�
    set_text(screen, HistoryTotalPage, 1);--������ҳ��Ϊ1
    file:close();
end

--***********************************************************************************************
--��ʾָ��ҳ����ʷ��¼
--***********************************************************************************************
function showHistoryByScreenAndPage(screen, page)
    local historyTab = readFileToTab(getFilePathByScreen(screen));--���ļ���ȡ��tab����
    local totalPage = tonumber(get_text(screen,HistoryTotalPage));--��ҳ��
    local si = #historyTab - 10 * (page-1);
    local ei = #historyTab - 10 * (page-1) - 9;
    if ei < 1 then
        ei = 1;
    end

    --��ʾ�����10����ʷ��¼
    local index = 0;
    for i= si, ei, -1 do
        if historyTab[i] ~= nil then
            local decodeContent = decodeStr(historyTab[i]);
            record_modify(screen, HistoryRecordId, index, decodeContent);
        end
        index = index + 1;
    end

    --�����ҳ��ʾ�ļ�¼����10��
    for i=index,9,1 do
        record_modify(screen, HistoryRecordId, i, " ");
    end

    --��ʾ��ҳ��
    totalPage = 0;
    local modePage = 0;
    if math.fmod(#historyTab,10) > 1 then
        modePage = 1;
    end
    totalPage = math.modf(#historyTab/10) + modePage
    set_text(screen, HistoryTotalPage, totalPage);
end

--***********************************************************************************************
--����ʷ��¼�����ĵķ�ʽ������U��
--***********************************************************************************************
function exportHistory(screen)
    local srcFilePath,destFilePath,fileTab

    if UsbPath == nil then
        ShowSysTips(TipsTab[Sys.language].pleaseInsertUsb);
        return 
    end

    if screen == HISTORY_ANALYSIS_SCREEN then--������ʷ
        srcFilePath = SdPath .. "record/Analysis";
        destFilePath = UsbPath .. "Analysis.txt";
    elseif screen == HISTORY_CHECK_SCREEN then--�˲���ʷ
        srcFilePath = SdPath.."record/Check"
        destFilePath = UsbPath .. "Check.txt";
    elseif screen == HISTORY_CALIBRATION_SCREEN then--У����ʷ
        srcFilePath = SdPath.."record/Calibration"
        destFilePath = UsbPath .. "Calibration.txt";
    elseif screen == HISTORY_RECOVERY_SCREEN then--�ӱ����
        srcFilePath = SdPath.."record/Recovery"
        destFilePath = UsbPath .. "Recovery.txt";
    elseif screen == HISTORY_LINER_SCREEN then--���Ժ˲�
        srcFilePath = SdPath.."record/Linear"
        destFilePath = UsbPath .. "Linear.txt";
    elseif screen == HISTORY_ALARM_SCREEN then--����
        srcFilePath = SdPath.."record/Alarm"
        destFilePath = UsbPath .. "Alarm.txt";
    elseif screen == HISTORY_LOG_SCREEN then--��־
        srcFilePath = SdPath.."record/log"
        destFilePath = UsbPath .. "log.txt";
    end

    fileTab = readFileToTab(srcFilePath);--���ļ��е����ݶ�ȡ��fileTab����
    for i=1,#fileTab,1 do--����ÿһ���ļ�
        fileTab[i] = decodeStr(fileTab[i]);
    end
    writeTabToFile(destFilePath, fileTab);
    ShowSysTips(TipsTab[Sys.language].exported);--��ʾ�����ɹ���ʾ��Ϣ
end


--***********************************************************************************************
--���ж�ȡ�ļ�, ��ÿһ�е����ݶ�����tab��.
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
--��Tab�е�����,����д���ļ�����
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
    ϵͳ��Ϣ
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

maintainerPwdSetId = 14;
administratorPwdSetId = 15;
OperatorLoginId = 16;
maintainerLoginId = 17;
administratorLoginId = 18;
SetChineseId = 19;
SetEnglishId = 20;

SysInfoRecordId = 25;
LastInfoRecordId = 26;

TouchScreenSoftVerId = 27;
SetEquipmentTypeBtId = 119;
SetSerialNumberBtId = 120;
EquipmentTypeTextId = 900;--ÿ�������е������ͺ�id����900


--���������ͺ�
function set_equipment_type()
    for i = 1, #PublicTab, 1 do
        set_text(PublicTab[i], EquipmentTypeTextId, get_text(SYSTEM_INFO_SCREEN, SetEquipmentTypeTextId));
    end
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function system_info_control_notify(screen, control, value)
    if control == SetEquipmentTypeTextId then--���������ͺ�
        set_equipment_type();
        Sys.info[EquipmentType] = get_text(screen, control)--�޸ļ�¼�е������ͺ�
        saveSysInfo()
        set_enable(SYSTEM_INFO_SCREEN, control, DISABLE);
    elseif control == SerialNumberTextId then
        Sys.info[SerialNumber] = get_text(screen, control)--�޸ļ�¼�е������ͺ�
        saveSysInfo()
        set_enable(SYSTEM_INFO_SCREEN, control, DISABLE);
    elseif control == SetSerialNumberBtId or control == SetEquipmentTypeBtId then--�����������кŻ������������ͺ�
        set_return_screen_control(screen, control);
        change_screen(PASSWORD_DIALOG_SCREEN);
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
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
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
            Sys.info[SysLanguage] = CHN
            saveSysInfo()
            changeCfgFileLanguage(CHN);--�������ļ��еķ���Ϊ����
        end
    elseif control == SetEnglishId then--����ΪӢ��
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
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
            Sys.info[SysLanguage] = ENG
            saveSysInfo()
            changeCfgFileLanguage(ENG);--�������ļ�����ΪӢ��
        end
    end
end

--***********************************************************************************************
--  ����ϵͳ�û�
--***********************************************************************************************
function SetSysUser(user)

    Sys.userName = user;

    --�ڵײ���״̬�û���
    for i = 1, #PublicTab, 1 do
        set_text(PublicTab[i], SysUserNameId, user);
    end

    if Sys.userName == SysUser[Sys.language].operator then -- ����Ա
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, DISABLE);
    elseif Sys.userName == SysUser[Sys.language].maintainer then--��άԱ
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, DISABLE);
    elseif Sys.userName == SysUser[Sys.language].administrator then--����Ա
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, ENABLE);
    end
end

--***********************************************************************************************
--  ����ϵͳ��Ϣ����¼�ռ�
--***********************************************************************************************
function saveSysInfo()
    local record = "";
    for i=1, #Sys.info, 1 do
        record = record..Sys.info[i]..","
    end
    record_modify(SYSTEM_INFO_SCREEN, SysInfoRecordId, 0, record);
end

--***********************************************************************************************
--  �����ϴιػ�ʱ����Ϣ����¼�ռ�
--***********************************************************************************************
function saveLastInfo()
    local record = "";
    for i=1, #Sys.lastInfo, 1 do
        record = record..Sys.lastInfo[i]..","
    end
    record_modify(SYSTEM_INFO_SCREEN, LastInfoRecordId, 0, record);
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
PwdRecordPosition = 0;--�ñ���ȡֵ1����2; 1��ʾ����Ա����,2��ʾ��άԱ����
--***********************************************************************************************
--��ϵͳ��Ϣ����,���Ȩ�޵�¼������������ʱ������øú���(Ȩ�޵�¼->����Ա����)
--***********************************************************************************************
function set_user_name(user)
    userNameSet = user; --userNameSet: �ڽ����л���ϵͳ��¼��������������ý���ʱ,�ñ�����������Ҫ�������û���.
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function password_set_control_notify(screen, control, value)

    local oldPwdInput = get_text(PASSWORD_SET_SCREEN, PwdId);--��ȡ����

    ------------------------ȷ�ϰ�ť-----------------------------------------------------
    if control == SureButtonId then
        if oldPwdInput == Sys.info[PwdRecordPosition] and --������������ȷ
        get_text(PASSWORD_SET_SCREEN, NewPwdId) == get_text(PASSWORD_SET_SCREEN, NewPwdConfirmId) and--��������������һ��
        string.len(get_text(PASSWORD_SET_SCREEN, NewPwdId)) == 6 then
            password = get_text(PASSWORD_SET_SCREEN, NewPwdId);
            Sys.info[PwdRecordPosition] = password;--�޸ļ�¼
            change_screen(SYSTEM_INFO_SCREEN);
        elseif oldPwdInput ~= Sys.info[PwdRecordPosition] then--��ʾ"�������"
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
        if oldPwdInput ~= Sys.info[PwdRecordPosition] then--�������벻��ȷ
            set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 1);--��ʾ���������ʾ��Ϣ
        else
            set_visiable(PASSWORD_SET_SCREEN, OldPwdTipsId, 0);
        end
    elseif control == NewPwdId then --����������
        if string.len(get_text(PASSWORD_SET_SCREEN, NewPwdId)) ~= 6 then
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
    if userNameSet == SysUser[Sys.language].maintainer then--��άԱ����
        PwdRecordPosition = MaintainerPwd;
    elseif userNameSet == SysUser[Sys.language].administrator then--����Ա����
        PwdRecordPosition = AdminPwd;
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
��¼ϵͳ
--------------------------------------------------------------------------------------------------------------------]]
PwdId = 2;
PwdTipsId = 3;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function login_system_control_notify(screen, control, value)
    local pwdInput = get_text(LOGIN_SYSTEM_SCREEN, PwdId);--��ȡ����

    if control == SureButtonId then--ȷ�ϰ���
        if pwdInput == Sys.info[PwdRecordPosition] then--�������
            SetSysUser(userNameSet);
            change_screen(SYSTEM_INFO_SCREEN);
        else
            set_visiable(LOGIN_SYSTEM_SCREEN, PwdTipsId, 1);--��ʾ���������ʾ��Ϣ
        end
    elseif control == CancelButtonId then--ȡ������
        SetSysUser(Sys.userName);
        change_screen(SYSTEM_INFO_SCREEN);
    elseif control == PwdId then --��������
        if pwdInput ~= Sys.info[PwdRecordPosition] then--�������벻��ȷ
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
        PwdRecordPosition = MaintainerPwd;
    elseif userNameSet == SysUser[Sys.language].administrator then
        PwdRecordPosition = AdminPwd;
    end
end

--***********************************************************************************************
--[����Ȩ�޼��
--para CHK_RUN=ֻ����Ƿ���������; CHK_RUN_USER=ͬʱ����Ƿ������������û�Ȩ��
--***********************************************************************************************
function operate_permission_detect(para)
    if Sys.status == WorkStatus[Sys.language].run then --ϵͳ������,����ִ�иò���
        ShowSysTips(TipsTab[Sys.language].stopFirst);
        return DISABLE;
    end

    --ֻ����Ƿ���������
    if para == 1 then
        return ENABLE
    end

    --����û�Ȩ��
    if Sys.userName == SysUser[Sys.language].operator then
        ShowSysTips(TipsTab[Sys.language].NoPermission);--��Ȩ��
        return DISABLE;
    end

    return ENABLE;
end

--[[-----------------------------------------------------------------------------------------------------------------
�Ի���
--------------------------------------------------------------------------------------------------------------------]]
--������������1/2/3�����е��ɾ����ťʱ����
function set_return_screen_control(screen, control)
    DestScreen = screen;
    DestControl = control;
end

--������Ի�������еĿؼ�ʱ,���øú���
function dialog_screen_control_notify(screen, control, value)
    if control == SureButtonId and value == ENABLE then --ȷ�ϰ�ť
        if DestScreen == PROCESS_SET1_SCREEN or DestScreen == PROCESS_SET2_SCREEN then--ɾ����������1�����е�����
            change_screen(DestScreen);
            local file = DestControl - 250;--DestControlȡֵ251~273,��ȥ250��,��Ӧ��1-24,��Ϊ�������.
            set_text(DestScreen, DestControl + 50, BLANK_SPACE);
            set_text(DestScreen, DestControl - 50, BLANK_SPACE);
            set_text(DestScreen, DestControl + 100, 1);
            WriteParaToConfigStrAndFile();--��������еĲ���
            os.remove(SdPath.."config/"..file);--ɾ�������ļ�
        elseif DestScreen == PROCESS_EDIT1_SCREEN or DestScreen == PROCESS_EDIT2_SCREEN or DestScreen == PROCESS_EDIT3_SCREEN or DestScreen == PROCESS_EDIT4_SCREEN then
            DeleteAction(DestControl - 600);--DestControlΪ���̱༭�����ɾ����ť��id,���601��ʼ,��������Ŵ�1��ʼ;
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
����Ի���
--------------------------------------------------------------------------------------------------------------------]]
function password_dialog_screen_control_notify(screen, control, value)
    if control == PwdId then
        if get_text(PASSWORD_DIALOG_SCREEN, PwdId) ~= Sys.info[AdminPwd] then--�������벻��ȷ
            set_visiable(PASSWORD_DIALOG_SCREEN, PwdTipsId, 1);--��ʾ���������ʾ��Ϣ
        else
            set_visiable(PASSWORD_DIALOG_SCREEN, PwdTipsId, 0);
        end
    elseif control == SureButtonId and value == ENABLE then
        if get_text(PASSWORD_DIALOG_SCREEN, PwdId) == Sys.info[AdminPwd] then--������Ա��������
            if DestControl == HistoryClear then--�����ʷ��¼ 
                record_clear(DestScreen, HistoryRecordId);--�����¼
                clearHistoryFile(DestScreen);
                print("�����¼");
            elseif DestControl == SetEquipmentTypeBtId then
                print("�������������ͺ���");
                set_enable(SYSTEM_INFO_SCREEN, SetEquipmentTypeTextId, ENABLE);
            elseif DestControl == SetSerialNumberBtId then
                print("�����������к���");
                set_enable(SYSTEM_INFO_SCREEN, SerialNumberTextId, ENABLE);
            end
            change_screen(DestScreen);
        end
    elseif control == CancelButtonId then
        change_screen(DestScreen);
    end
end

--�л�������Ի���
function goto_dialog_screen()
    set_visiable(PASSWORD_DIALOG_SCREEN, PwdTipsId, 0);--�������������ʾ��Ϣ
    set_text(PASSWORD_DIALOG_SCREEN, PwdId, "");
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
function wifi_connect_control_notify(screen, control, value)
    if control == ScanBtId then
        scan_ap_fill_list();
    elseif control >= 27 and control <= 40 then--ѡȡ�ȵ�
        Sys.ssid = get_text(WIFI_CONNECT_SCREEN, (control - 14)) --�ı��ؼ���13~26
        set_text(WIFI_CONNECT_SCREEN, WifiSsid, Sys.ssid)
    elseif control == WifiConnectBtId then
        if string.len(Sys.ssid) > 0 then
            Sys.ssid = get_text(WIFI_CONNECT_SCREEN, WifiSsid);
            wifiPwd = get_text(WIFI_CONNECT_SCREEN, WifiPwdId);
            set_wifi_cfg(1, 0, Sys.ssid, wifiPwd) --���� WIFI��1 ����ģʽ��0 �Զ�ʶ�����
            save_network_cfg();
            set_text(WIFI_CONNECT_SCREEN, WifiStatusTextId, TipsTab[Sys.language].connecting)
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

    for i = 1, ap_cnt, 1 do
        Sys.ssid, Sys.security, Sys.quality = get_ap_info(i - 1)  --��ȡ��Ϣ
        set_text(WIFI_CONNECT_SCREEN, i + 12, Sys.ssid)  --��ʾid
    end

    for i = ap_cnt + 1, 14, 1 do
        set_text(WIFI_CONNECT_SCREEN, i + 12, "")  --��պ����
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
function remote_update_control_notify(screen, control, value)
    if control == RemoteGetTsVerBtId then--��ȡ�������汾�ļ�
        http_download(1, 'http://' .. get_text(REMOTE_UPDATE_SCREEN, RemoteFtpAddrTextId) .. '/tsVer.txt', "tsVer.txt");
    elseif control == RemoteStartUpdateTsBtId and value == ENABLE then--��ʼ����������
        --�ж�Ȩ��
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            --��ʼ��������������(��on_systick�л�ȡ����״̬������ʾ)
            start_upgrade('ftp://' .. get_text(REMOTE_UPDATE_SCREEN, RemoteFtpAddrTextId) .. '/DCIOT.PKG');
        end
    elseif control == RemoteGetDrvVerBtId then--��ȡ�����汾�ļ�
        http_download(2, 'http://' .. get_text(REMOTE_UPDATE_SCREEN, RemoteFtpAddrTextId) .. '/drvVer.txt', "drvVer.txt");
    elseif control == RemoteStartUpdateDrvBtId and Sys.hand_control_func == nil then--��ȡ�����ļ�
        if operate_permission_detect(CHK_RUN_USER) == ENABLE then--���Ȩ��
            --����STM.BIN�ļ�,��on_http_download�������ж�����״̬
            http_download(3, 'http://' .. get_text(REMOTE_UPDATE_SCREEN, RemoteFtpAddrTextId) .. '/STM.BIN', "STM.BIN");
        end
    end
end


--http_download�ص�����,ϵͳ�Զ�����
function on_http_download(taskid, status)
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
    for i = 1, 1024, 1 do
        binCode[i + 5] = string.byte(charCode, i, i)
    end
    --�������ݳ���,����������ݰ���ͷ����6������,������β��������CRC����
    dataLen = #binCode + 1;
    --ΪbinCode�������ͷ����β����CRC,����һ����ɵĴ������ݰ�
    binCode[0] = 208;
    binCode[1] = 16;
    binCode[2] = 48;--math.modf( Sys.binIndex/256 ) + 0x30;
    binCode[3] = math.fmod(Sys.binIndex, 256)       --0x3000��ʼ��ʾ�����������ݵĵ�0����, ox3001��ʾ�����������ݵĵ�1����(��?�֧�ִ???56k������)
    binCode[4] = math.modf((dataLen - 6) / 256)
    binCode[5] = math.fmod((dataLen - 6), 256)

    uartSendTab.updateDrv = binCode;
    uartSendTab.updateDrv.len = dataLen;
    uartSendTab.updateDrv.note[Sys.language] = TipsTab[Sys.language].updateDrvBd;
    on_uart_send_data(uartSendTab.updateDrv, NEED_REPLY);--�ڵ���ʱ����ʹ��NO_NEED_REPLY����,�����Ϳ��Բ��õȴ��ظ�

    Sys.binIndex = Sys.binIndex + 1;

    --�ر��ļ�
    drvFile:close();
end


--[[-----------------------------------------------------------------------------------------------------------------
    �����ļ�0��ز�������
--------------------------------------------------------------------------------------------------------------------]]

--�����ļ����ļ���Ϊ"0", �ڿ���ʱ��ȡ��ConfigStr[0]���鵱��, �ڵ������ʱ��ConfigStr[0]�ַ������浽"0"�ļ�
cfgFileTab = {
    [1] = { sTag = "<ProcessSet>", eTag = "</ProcessSet>" };--��������1/2�����еĲ������������tag��
    [2] = { sTag = "<RunControl>", eTag = "</RunControl>" };--���п��ƽ����еĲ������������tag��
    [3] = { sTag = "<RangeSet>", eTag = "</RangeSet>" };--�������ý����еĲ������������tag��
    [4] = { sTag = "<IOSet>", eTag = "</IOSet>" };--��������еĲ������������tag��
    [5] = { sTag = "<ReagentSet>", eTag = "</ReagentSet>" };--�Լ������еĲ�������զ���tag��
};




--***********************************************************************************************
--��ȡ�����ļ��е���������,�������ݱ��浽cfgFileStr[0]����
--***********************************************************************************************
function ReadFile0ToConfigStrAndScreen()
    local configFile = io.open(SdPath .. "config/" .. "0", "r")      --���ı�
    if configFile == nil then--���û�и��ļ��򷵻�
        print("û���ҵ������ļ�:0,����һ��Ĭ�ϵ������ļ�");
        ConfigStr[0] = "";
        WriteParaToConfigStrAndFile();
        configFile = io.open(SdPath .. "config/"  .. "0", "r")      --���ı�
    end
    configFile:seek("set")    --���ļ�λ�ö�λ����ͷ
    ConfigStr[0] = configFile:read("a")       --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
    configFile:close()                            --�ر��ı�
    print(ConfigStr[0]);
    for i = 1,5, 1 do
        SetConfigStrToScreen(i);
    end
end

--***********************************************************************************************
--���������ļ�,��������"0"�ļ���
--***********************************************************************************************
function WriteParaToConfigStrAndFile()
    print("���� WriteParaToConfigStrAndFile ����");
    ConfigStr[0] = "";  
   --�������ý����еĲ���-------------------------------------------------------------------
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[1].sTag;--��ӿ�ʼ��ǩ
        for i = 1, 12, 1 do
            ConfigStr[0] = ConfigStr[0] ..
            get_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId) .. "," .. --��������ѡ��
            get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId) .. "," ..   --��������
            get_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId) .. ",";  --��������
        end
        --��������2�����еĲ���
        for i = 13, 24, 1 do
            ConfigStr[0] = ConfigStr[0] ..
            get_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId) .. "," .. --��������ѡ��
            get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId) .. "," ..   --��������
            get_text(PROCESS_SET2_SCREEN, ProcessTab[i].rangeId) .. ",";  --��������
        end
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[1].eTag;--��ӽ�����ǩ

    --���п��ƽ����еĲ���--------------------------------------------------------------------
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[2].sTag;--��ӿ�ʼ��ǩ
        ConfigStr[0] = ConfigStr[0] .."<common>"
        for i = RUNCTRL_TextSid, RUNCTRL_TextEid, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(RUN_CONTROL_SCREEN, i) .. ",";
        end
        ConfigStr[0] = ConfigStr[0]..Sys.status--���湤��״̬
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
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[2].eTag--��ӽ�����ǩ

    --�������ý����еĲ���------------------------------------------------------------------------
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[3].sTag;--��ӿ�ʼ��ǩ
        for i = RANGESET_TextStartId, RANGESET_TextEndId, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(RANGE_SET_SCREEN, i) .. ",";
        end
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[3].eTag--��ӽ�����ǩ

    --������������еĲ���------------------------------------------------------------------------
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[4].sTag;--��ӿ�ʼ��ǩ
        for i = IOSET_TextStartId, IOSET_TextEndId, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(IN_OUT_SCREEN, i) .. ",";
        end
        ConfigStr[0] = ConfigStr[0] .. cfgFileTab[4].eTag--��ӽ�����ǩ

    --�Լ����������еĲ���------------------------------------------------------------------------
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[5].sTag;--��ӿ�ʼ��ǩ
        for i = REAGENT_BtStartId, REAGENT_BtEndId, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_value(HAND_OPERATE3_SCREEN, i) .. ",";
        end
        for i = REAGENT_TextStartId, REAGENT_TexEndId, 1 do
            ConfigStr[0] = ConfigStr[0] .. get_text(HAND_OPERATE3_SCREEN, i) .. ",";
        end
    ConfigStr[0] = ConfigStr[0] .. cfgFileTab[5].eTag;--��ӽ�����ǩ

    local configFile = io.open(SdPath .. "config/"  .. "0", "w+");  --�򿪲���ո��ļ�
    configFile:write(ConfigStr[0]);         --���������ԭ�ļ���������д���ļ�
    configFile:close(); --�ر��ı�
end

--***********************************************************************************************
--���������õ����浱��
--tagNum = 1 : �޸���������1�����еĲ��� 
--tagNum = 2 : �޸����п��ƽ����еĲ���
--tagNum = 3 : ���п��ƽ����еĲ���
--tagNum = 4 : ��������еĲ���
--tagNum = 5 : �Լ������еĲ���
--***********************************************************************************************
function SetConfigStrToScreen(tagNum)
    -- print("����"..cfgFileTab[tagNum].sTag.."����")
    local tagString = GetSubString(ConfigStr[0], cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);--��ȡ��ǩ֮����ַ���

    local tab = split(tagString, ",")--���������ַ��������ŷָ�,���Դ˴���tab��
    if tagNum == 1 then--�������ý����еĲ���
        for i = 1, 12, 1 do
            if tab[(i - 1) * 3 + 1] ~= nil then
                set_text(PROCESS_SET1_SCREEN, ProcessTab[i].typeId, tab[(i - 1) * 3 + 1]);  --��������ʾ���ı�����
            end
            if tab[(i - 1) * 3 + 2] ~= nil then
                set_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId, tab[(i - 1) * 3 + 2]);  --��������ʾ���ı�����
            end
            if tab[(i - 1) * 3 + 3] ~= nil then
                set_text(PROCESS_SET1_SCREEN, ProcessTab[i].rangeId, tab[(i - 1) * 3 + 3]);  --��������ʾ���ı�����
            end
        end
        for i = 13, 24, 1 do
            if tab[(i - 1) * 3 + 1] ~= nil then
                set_text(PROCESS_SET2_SCREEN, ProcessTab[i].typeId, tab[(i - 1) * 3 + 1]);  --��������ʾ���ı�����
            end
            if tab[(i - 1) * 3 + 2] ~= nil then
                set_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId, tab[(i - 1) * 3 + 2]);  --��������ʾ���ı�����
            end
            if tab[(i - 1) * 3 + 3] ~= nil then
                set_text(PROCESS_SET2_SCREEN, ProcessTab[i].rangeId, tab[(i - 1) * 3 + 3]);  --��������ʾ���ı�����
            end
        end
    elseif tagNum == 2 then--���п��ƽ����еĲ���
        local subTagString = GetSubString(tagString, "<common>", "</common>");--��ȡ��ǩ֮����ַ���
        tab = split(subTagString, ",")
        for i = RUNCTRL_TextSid, RUNCTRL_TextEid, 1 do
            if tab[i] ~= nil then
                set_text(RUN_CONTROL_SCREEN, i, tab[i]);
            end
        end

        subTagString = GetSubString(tagString, "<period>", "</period>");--��ȡ��ǩ֮����ַ���
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

        subTagString = GetSubString(tagString, "<timed>", "</timed>");--��ȡ��ǩ֮����ַ���
        tab = split(subTagString, ",")
        for i = RUNCTRL_TIMED_TextSid, RUNCTRL_TIMED_TextEid, 1 do
            if tab[i] ~= nil then
                set_text(RUN_CONTROL_TIMED_SCREEN, i, tab[i]);
            end
        end

        subTagString = GetSubString(tagString, "<hand>", "</hand>");--��ȡ��ǩ֮����ַ���
        tab = split(subTagString, ",")
        for i = RUNCTRL_HAND_TextSid, RUNCTRL_HAND_TextEid, 1 do
            if tab[i] ~= nil then
                set_text(RUN_CONTROL_HAND_SCREEN, i, tab[i]);
            end
        end

    elseif tagNum == 3 then--�������ý����еĲ���
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
    �����ļ���Ӣ��ת������
--------------------------------------------------------------------------------------------------------------------]]
--***********************************************************************************************
--�����ļ�������ת��ΪӢ��,������Ӣ��תΪ����
--***********************************************************************************************
function changeCfgFileLanguage(language)
    if language == ENG then--��Ҫת����Ӣ��
        srcLanguage = CHN;
        destLanguage = ENG;
    else                   --��Ҫת��������
        srcLanguage = ENG;
        destLanguage = CHN;
    end
    ------------------�޸������ļ�0, ���������Ӣ���л�------------------------------------------
    local configFile = io.open(SdPath .. "config/"  .. "0", "r")      --�ɶ���ʽ���ı�
    if configFile ~= nil then
        configFile:seek("set")    --���ļ�λ�ö�λ����ͷ
        ConfigStr[0] = configFile:read("a")       --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
        configFile:close()                        --�ر��ı�
        --------���п��ƽ�������з�ʽ��Ҫ����ΪӢ��-----------------------------------------
        --��ȡ��<RunControl>��ǩ֮����ַ���
        local tagString = GetSubString(ConfigStr[0], cfgFileTab[2].sTag, cfgFileTab[2].eTag);
        local subTagString = GetSubString(tagString, "<common>", "</common>");
        local tab = split(subTagString, ",")--���������ַ��������ŷָ�,���Դ˴���tab��
        if tab[RunTypeID] == WorkType[srcLanguage].hand then--�ֶ�
            tab[RunTypeID] = WorkType[destLanguage].hand;
        elseif tab[RunTypeID] == WorkType[srcLanguage].period then--�Զ�
            tab[RunTypeID] = WorkType[destLanguage].period;
        elseif tab[RunTypeID] == WorkType[srcLanguage].controlled then--����
            tab[RunTypeID] = WorkType[destLanguage].controlled;
        elseif tab[RunTypeID] == WorkType[srcLanguage].timed then--��ʱ
            tab[RunTypeID] = WorkType[destLanguage].timed;
        end
        --����ģʽ����
        if tab[OfflineModeId] == VariableOnOff[srcLanguage].open then
            tab[OfflineModeId] = VariableOnOff[srcLanguage].open
        elseif tab[OfflineModeId] == VariableOnOff[srcLanguage].close then
            tab[OfflineModeId] = VariableOnOff[srcLanguage].close
        end
        --�Լ�������⿪��
        if tab[ReagentRemainChkId] == VariableOnOff[srcLanguage].open then
            tab[ReagentRemainChkId] = VariableOnOff[srcLanguage].open
        elseif tab[ReagentRemainChkId] == VariableOnOff[srcLanguage].close then
            tab[ReagentRemainChkId] = VariableOnOff[srcLanguage].close
        end
        --�����Զ��л�����
        if tab[RangeAutoSwitchId] == VariableOnOff[srcLanguage].open then
            tab[RangeAutoSwitchId] = VariableOnOff[srcLanguage].open
        elseif tab[RangeAutoSwitchId] == VariableOnOff[srcLanguage].close then
            tab[RangeAutoSwitchId] = VariableOnOff[srcLanguage].close
        end
        
        --------�������ý��������������Ҫ����ΪӢ��-----------------------------------------
        tagString = GetSubString(ConfigStr[0], cfgFileTab[1].sTag, cfgFileTab[1].eTag);
        tab = split(tagString, ",")--���������ַ��������ŷָ�,���Դ˴���tab��
        for i = 1, MaxProcess*3, 3 do
            for j = 1, #ProcessItem[CHN], 1 do
                if tab[i] == ProcessItem[srcLanguage][j] then
                    tab[i] = ProcessItem[destLanguage][j]
                    break;
                end
            end
        end
        --ɾ��<ProcessSet>��ǩ֮�������
        ConfigStr[0] = DeleteSubString(ConfigStr[0], cfgFileTab[1].sTag, cfgFileTab[1].eTag);
        --��������<ProcessSet>��ǩ������
        ConfigStr[0] = ConfigStr[0] .. cfgFileTab[1].sTag;--��ӿ�ʼ��ǩ
        --��������1�����еĲ���
        for i = 1, MaxProcess*3, 1 do
            ConfigStr[0] = ConfigStr[0] .. tab[i] .. ","
        end
        ConfigStr[0] = ConfigStr[0] .. cfgFileTab[1].eTag;--��ӽ�����ǩ
        
        --------������ɺ�,���±��浽"0"�ļ����в�ˢ�½�����ʾ--------------------------------------------
        SetConfigStrToScreen(1);--�������ļ���ʾ���������ý�����
        SetConfigStrToScreen(2);--�������ļ���ʾ�����п��ƽ�����

        configFile = io.open(SdPath .. "config/" .. "0", "w+");  --�򿪲���ո��ļ�
        configFile:write(ConfigStr[0]);         --���������ԭ�ļ���������д���ļ�
        configFile:close(); --�ر��ı�
    end

    ------------------�޸������ļ�1~24, ���������Ӣ���л�------------------------------------------
    for i = 1, MaxProcess, 1 do                       --ѭ���޸��ļ�1-24
        ActionStrTab = readFileToTab(SdPath .. "config/" .. i)
        if #ActionStrTab ~= 0 then         --�ж��ļ��Ƿ�򿪳ɹ�
            ---------------ѭ������ActionStrTab�е�1-48Ԫ���е�����------------------------
            for j = 1, MaxAction, 1 do
                local typeString = GetSubString(ActionStrTab[j], "<type>", "</type>");--��ȡ������������������
                local typeTab = split(typeString, ",")--���������ַ��������ŷָ�,���Դ˴���tab��
                for k = 1, #ActionItem[CHN], 1 do--�ж϶�������,���������ͽ��з���
                    if typeTab[1] == ActionItem[srcLanguage][k] then
                        typeTab[1] = ActionItem[destLanguage][k]
                        break;
                    end
                end
                
                local contentString = GetSubString(ActionStrTab[j], "<content>", "</content>");
                local contentTab = split(contentString, ",")--���������ַ��������ŷָ�,���Դ˴���tab��
                ----------�ж�Ϊ��ʼ��,����Ҫ�����ʼ�����<content>------------
                if typeTab[1] == ActionItem[destLanguage][1] then
                    if contentTab[INIT_AnalysisWayTextId] == AnalysisWay[srcLanguage].colorimetry then
                        contentTab[INIT_AnalysisWayTextId] = AnalysisWay[destLanguage].colorimetry
                    elseif contentTab[INIT_AnalysisWayTextId] == AnalysisWay[srcLanguage].electrode then
                        contentTab[INIT_AnalysisWayTextId] = AnalysisWay[destLanguage].electrode
                    end
                    contentString = "";
                    for k = 1, INIT_TextEndId, 1 do
                        contentString = contentString .. contentTab[k] .. ",";
                    end
                    ----------�ж�Ϊ����,����Ҫ����������<content>----------------
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
                    for k = 1, CALCULATE_TextEndId, 1 do
                        contentString = contentString .. contentTab[k] .. ",";
                    end
                end

                ---------------�޸�ActionStrTab[j]�е�����---------------------------------------
                ActionStrTab[j] = "<type>".. typeTab[1] .. ",".. typeTab[2] .. "</type><content>"..contentString.."</content>";
            end
            ---------------����ActionStrTab���ļ�---------------------------------------
            writeTabToFile(SdPath .. "config/" .. i, ActionStrTab);
        end
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    ���������ļ���ز�������
--------------------------------------------------------------------------------------------------------------------]]



--***********************************************************************************************
--ͨ���������ƻ�ȡ����id
--***********************************************************************************************
function getFileNameByProcessName(processName)
    local fileName = 0;
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            fileName = i;
            break;
        end
    end

    for i = 13, 24, 1 do
        if string.find(get_text(PROCESS_SET2_SCREEN, ProcessTab[i].nameId), processName, 1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            fileName = i;
            break;
        end
    end
    return fileName;
end

--***********************************************************************************************
--������̶����ļ��Ƿ����,����������򴴽�һ��Ĭ�ϵ��ļ�, ������Ĭ���ļ�����ȡ��ActionStrTab����
--***********************************************************************************************
function ReadActionToTabAndScreen(filePath)
    print("ReadActionToTabAndScreen ");
    ActionStrTab = readFileToTab(filePath);--�����������ļ���ȡ��ActionStrTab��

    if #ActionStrTab == 0 then --Ŀǰ��û�и������ļ�
        for i = 1, 12, 1 do            --������̱༭����1/2/3/4�е�����
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, BLANK_SPACE);
            set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId, BLANK_SPACE);
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i + 12].typeId, BLANK_SPACE);
            set_text(PROCESS_EDIT2_SCREEN, TabAction[i + 12].nameId, BLANK_SPACE);
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i + 24].typeId, BLANK_SPACE);
            set_text(PROCESS_EDIT3_SCREEN, TabAction[i + 24].nameId, BLANK_SPACE);
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i + 36].typeId, BLANK_SPACE);
            set_text(PROCESS_EDIT4_SCREEN, TabAction[i + 36].nameId, BLANK_SPACE);
            ActionStrTab[i] = "<type> , </type><content> </content>";
            ActionStrTab[i+12] = "<type> , </type><content> </content>";
            ActionStrTab[i+24] = "<type> , </type><content> </content>";
            ActionStrTab[i+36] = "<type> , </type><content> </content>";
        end
    else --����ȡ���Ĳ������õ����̱༭1/2/3/4����
        local contentStr = "";
        local tab = {};
        for i = 1, 12, 1 do
            contentStr = GetSubString( ActionStrTab[i], "<type>", "</type>")
            tab = split(contentStr, ",");
            if tab[1] ~= nil then
                set_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId, tab[1]);  --�Ѷ���������ʾ���ı�����
            end
            if tab[2] ~= nil then
                set_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId, tab[2]); --�Ѷ���������ʾ���ı�����
            end
        end
        for i = 13, 24, 1 do
            contentStr = GetSubString( ActionStrTab[i], "<type>", "</type>")
            tab = split(contentStr, ",");
            if tab[1] ~= nil then
                set_text(PROCESS_EDIT2_SCREEN, TabAction[i].typeId, tab[1]);  --�Ѷ���������ʾ���ı�����
            end
            if tab[2] ~= nil then
                set_text(PROCESS_EDIT2_SCREEN, TabAction[i].nameId, tab[2]); --�Ѷ���������ʾ���ı�����
            end
        end
        for i = 25, 36, 1 do
            contentStr = GetSubString( ActionStrTab[i], "<type>", "</type>")
            tab = split(contentStr, ",");
            if tab[1] ~= nil then
                set_text(PROCESS_EDIT3_SCREEN, TabAction[i].typeId, tab[1]);  --�Ѷ���������ʾ���ı�����
            end
            if tab[2] ~= nil then
                set_text(PROCESS_EDIT3_SCREEN, TabAction[i].nameId, tab[2]); --�Ѷ���������ʾ���ı�����
            end
        end
        for i = 37, 48, 1 do
            contentStr = GetSubString( ActionStrTab[i], "<type>", "</type>")
            tab = split(contentStr, ",");
            if tab[1] ~= nil then
                set_text(PROCESS_EDIT4_SCREEN, TabAction[i].typeId, tab[1]);  --�Ѷ���������ʾ���ı�����
            end
            if tab[2] ~= nil then
                set_text(PROCESS_EDIT4_SCREEN, TabAction[i].nameId, tab[2]); --�Ѷ���������ʾ���ı�����
            end
        end
    end
end

--***********************************************************************************************
--�����̲����������ļ�
--***********************************************************************************************
function WriteActionStrTabToFile()
    local fileName = getProcessIdByName(get_text(PROCESS_EDIT1_SCREEN, ProcessSelectId));
    if fileName ~= 0 then
        local contentStr = ""
        local typeStr = ""
        local actionType,actionName
        --��������������������д�뵽 ActionStrTab ����
        for i = 1, 12, 1 do
            contentStr =  GetSubString( ActionStrTab[i], "<content>", "</content>")
            actionType = get_text(PROCESS_EDIT1_SCREEN, TabAction[i].typeId);  --�Ѷ���������ʾ���ı�����
            actionName = get_text(PROCESS_EDIT1_SCREEN, TabAction[i].nameId); --�Ѷ���������ʾ���ı�����
            ActionStrTab[i] = "<type>"..actionType..","..actionName.."</type><content>"..contentStr.."</content>"

            contentStr =  GetSubString( ActionStrTab[i+12], "<content>", "</content>")
            actionType = get_text(PROCESS_EDIT2_SCREEN, TabAction[i+12].typeId);  --�Ѷ���������ʾ���ı�����
            actionName = get_text(PROCESS_EDIT2_SCREEN, TabAction[i+12].nameId); --�Ѷ���������ʾ���ı�����
            ActionStrTab[i+12] = "<type>"..actionType..","..actionName.."</type><content>"..contentStr.."</content>"

            contentStr =  GetSubString( ActionStrTab[i+24], "<content>", "</content>")
            actionType = get_text(PROCESS_EDIT3_SCREEN, TabAction[i+24].typeId);  --�Ѷ���������ʾ���ı�����
            actionName = get_text(PROCESS_EDIT3_SCREEN, TabAction[i+24].nameId); --�Ѷ���������ʾ���ı�����
            ActionStrTab[i+24] = "<type>"..actionType..","..actionName.."</type><content>"..contentStr.."</content>"

            contentStr =  GetSubString( ActionStrTab[i+36], "<content>", "</content>")
            actionType = get_text(PROCESS_EDIT4_SCREEN, TabAction[i+36].typeId);  --�Ѷ���������ʾ���ı�����
            actionName = get_text(PROCESS_EDIT4_SCREEN, TabAction[i+36].nameId); --�Ѷ���������ʾ���ı�����
            ActionStrTab[i+36] = "<type>"..actionType..","..actionName.."</type><content>"..contentStr.."</content>"
        end

        --��ActionStrTabд���ļ�����
        local filePath = SdPath .. "config/" .. fileName
        writeTabToFile(filePath, ActionStrTab);
    end
end


--***********************************************************************************************
--����ǰ����Ĳ���д�� ActionStrTab ����
--fileName:�����ļ�����:��Χ:1-24,��Ӧ24������(ÿ�����̶�Ӧһ�������ļ�)
--actionNumber:������ǩ,��Χ:action0~action24
--***********************************************************************************************
function WriteTypeAndContentToActionStrTab(actionNumber)
    print("���� WriteTypeAndContentToActionStrTab ����");

    local actionType=""
    local actionName="";
    if actionNumber >= 1 and actionNumber <= 12 then
        actionType = get_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].typeId);--��ȡ��ǰ��������
        actionName = get_text(PROCESS_EDIT1_SCREEN, TabAction[actionNumber].nameId);--��ȡ��ǰ��������
    elseif actionNumber >= 13 and actionNumber <= 24 then
        actionType = get_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].typeId);--��ȡ��ǰ��������
        actionName = get_text(PROCESS_EDIT2_SCREEN, TabAction[actionNumber].nameId);--��ȡ��ǰ��������
    elseif actionNumber >= 25 and actionNumber <= 36 then
        actionType = get_text(PROCESS_EDIT3_SCREEN, TabAction[actionNumber].typeId);--��ȡ��ǰ��������
        actionName = get_text(PROCESS_EDIT3_SCREEN, TabAction[actionNumber].nameId);--��ȡ��ǰ��������
    elseif actionNumber >= 37 and actionNumber <= 48 then
        actionType = get_text(PROCESS_EDIT4_SCREEN, TabAction[actionNumber].typeId);--��ȡ��ǰ��������
        actionName = get_text(PROCESS_EDIT4_SCREEN, TabAction[actionNumber].nameId);--��ȡ��ǰ��������
    end
    --д�붯�������붯������(����������������):��ʼ��/ע���/����......
    ActionStrTab[actionNumber] = "<type>" .. actionType .. "," .. actionName .. "</type>".."<content>"

    --------------------------------д��ʼ�������----------------------------------------------------
    if actionType == ActionItem[Sys.language][1] then
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_value(PROCESS_INIT_SCREEN, i) .. "," --д�밴ťֵ
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_text(PROCESS_INIT_SCREEN, i) .. "," --д���ı�ֵ
        end
        --------------------------------дȡ���������----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][2] then
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_value(PROCESS_INJECT_SCREEN, i) .. "," --д�����1��ťֵ
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_text(PROCESS_INJECT_SCREEN, i) .. "," --д���ı�ֵ
        end
        --------------------------------дע��ü�Һ����--------------------------------------------------
    elseif actionType == ActionItem[Sys.language][3] then
        for i = INJECT_ADD_BtStartId, INJECT_ADD_BtEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_value(PROCESS_INJECT_ADD_SCREEN, i) .. "," --д�밴ťֵ
        end
        for i = INJECT_ADD_TextStartId, INJECT_ADD_TextEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_text(PROCESS_INJECT_ADD_SCREEN, i) .. "," --д���ı�ֵ
        end
        --------------------------------д-��ȡ�źŲ���----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][4] then
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_text(PROCESS_READ_SIGNAL_SCREEN, i) .. "," --д���ı�ֵ
        end
        --------------------------------д-�䶯�ü�Һ����--------------------------------------------------
    elseif actionType == ActionItem[Sys.language][5] then
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_value(PROCESS_PERISTALTIC_SCREEN, i) .. "," --д�밴ťֵ
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_text(PROCESS_PERISTALTIC_SCREEN, i) .. "," --д���ı�ֵ
        end
        --------------------------------д-�������--------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][6] then
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_value(PROCESS_CALCULATE_SCREEN, i) .. "," --д�밴ťֵ
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_text(PROCESS_CALCULATE_SCREEN, i) .. "," --д���ı�ֵ
        end
        --------------------------------д-�ȴ�ʱ�����----------------------------------------------------
    elseif actionType == ActionItem[Sys.language][7] then
        ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId)
        --------------------------------д-�������--------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][8] then
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_value(PROCESS_DISPEL_SCREEN, i) .. "," --д�밴ťֵ
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_text(PROCESS_DISPEL_SCREEN, i) .. "," --д���ı�ֵ
        end
        --------------------------------д-����������------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][9] then
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_value(PROCESS_VALVE_CTRL_SCREEN, i) .. "," --д�밴ťֵ
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_text(PROCESS_VALVE_CTRL_SCREEN, i) .. "," --д���ı�ֵ
        end
        --------------------------------д-���Ժ˲�ϡ�Ͳ���------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][10] then
        for i = LINEAR_BtStartId, LINEAR_BtEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_value(PROCESS_LINEAR_CHK_SET_SCREEN, i) .. "," --д�밴ťֵ
        end
        for i = LINEAR_TextStartId, LINEAR_TextEndId, 1 do
            ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. get_text(PROCESS_LINEAR_CHK_SET_SCREEN, i) .. "," --д���ı�ֵ
        end
        --------------------------------д-�ղ�������------------------------------------------------------
    elseif actionType == ActionItem[Sys.language][11] then
        ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. "<content> </content>"
    end
    ActionStrTab[actionNumber] = ActionStrTab[actionNumber] .. "</content>"
end


--***********************************************************************************************
--actionNumber: ����id , �Ӹö�����ʼ,֮��Ķ���������+1����-1�Ĳ���
--flag 1=�Ӳ���, 2=������
--***********************************************************************************************
function MoveActionStrTabElement(actionNumber, flag)
    --�ַ��滻;1��ʾ��ʱִ�е��ǲ��붯��,
    if flag == 1 then
        for i = MaxAction, actionNumber+1, -1 do
            ActionStrTab[i] = ActionStrTab[i-1]
        end
        ActionStrTab[actionNumber] = "<type> , <type>"
    else--2��ʾ��ʱִ�е���ɾ������
        for i = actionNumber, MaxAction-1, 1 do
            ActionStrTab[i] = ActionStrTab[i+1]
        end
        ActionStrTab[MaxAction] = "<type> , <type>"
    end
end



--***********************************************************************************************
--�������ļ�����,��ActionTabStr�е��������õ����浱��
--actionNumber: ��ǰ����Ϊ�ڼ���
--***********************************************************************************************
function SetActionToScreen(actionNumber)
    print("SetActionToScreen "..actionNumber);
    local actionString = ActionStrTab[actionNumber];

    --��ȡactionString�ַ�����<type>��ǩ֮����ַ���,��ȡ���������붯������
    local actionType = GetSubString(actionString, "<type>", "</type>");
    actionType = split(actionType, ",");--�ָ��ַ���

    --�ٽ�ȡ<content>��ǩ�е�����
    local contentTabStr = GetSubString(actionString, "<content>", "</content>");
    if contentTabStr == nil then--���û������,��������̱༭1/3�����еĶ���ѡ���붯������
        return;
    end
    local tab = split(contentTabStr, ",");--�ָ��ַ���

    --------------------------------��-��ʼ���������--------------------------------------------------
    if actionType[1] == ActionItem[Sys.language][1] then
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_INIT_SCREEN, i, tab[i]);--д�밴ťֵ
            end
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_INIT_SCREEN, i, tab[i]);--д���ı�ֵ
            end
        end
        --------------------------------��-����ý������--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][2] then
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_INJECT_SCREEN, i, tab[i]);--tab��ǰ17��λ��ťֵ
            end
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_INJECT_SCREEN, i, tab[i]);--tab��ǰ17��λ��ťֵ
            end
        end
        --------------------------------��-ע��ü�Һ����-------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][3] then
        for i = INJECT_ADD_BtStartId, INJECT_ADD_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_INJECT_ADD_SCREEN, i, tab[i]);--д�밴ťֵ
            end
        end
        for i = INJECT_ADD_TextStartId, INJECT_ADD_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_INJECT_ADD_SCREEN, i, tab[i]);--д���ı�ֵ
            end
        end
        --------------------------------��-��ȡ�źŲ���--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][4] then
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_READ_SIGNAL_SCREEN, i, tab[i]);--д���ı�ֵ
            end
        end
        --------------------------------��-�䶯�ü�Һ����------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][5] then
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--д�밴ťֵ
            end
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--д���ı�ֵ
            end
        end
        --------------------------------��-�������------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][6] then
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_CALCULATE_SCREEN, i, tab[i]);--д�밴ťֵ
            end
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_CALCULATE_SCREEN, i, tab[i]);--д���ı�ֵ
            end
        end
        --------------------------------��-�ȴ�ʱ�����--------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][7] then
        set_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId, tab[1]);
        --------------------------------��-�������------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][8] then
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_DISPEL_SCREEN, i, tab[i]);--д�밴ťֵ
            end
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_DISPEL_SCREEN, i, tab[i]);--д���ı�ֵ
            end
        end
        --------------------------------��-����������------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][9] then
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_VALVE_CTRL_SCREEN, i, tab[i]);--д�밴ťֵ
            end
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_VALVE_CTRL_SCREEN, i, tab[i]);--д���ı�ֵ
            end
        end
        --------------------------------��-���Ժ˲�ϡ�Ͳ���------------------------------------------------------
    elseif actionType[1] == ActionItem[Sys.language][10] then
        for i = LINEAR_BtStartId, LINEAR_BtEndId, 1 do
            if tab[i] ~= nil then
                set_value(PROCESS_LINEAR_CHK_SET_SCREEN, i, tab[i]);--д�밴ťֵ
            end
        end
        for i = LINEAR_TextStartId, LINEAR_TextEndId, 1 do
            if tab[i] ~= nil then
                set_text(PROCESS_LINEAR_CHK_SET_SCREEN, i, tab[i]);--д���ı�ֵ
            end
        end
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    һЩʵ�ú���
--------------------------------------------------------------------------------------------------------------------]]

--***********************************************************************************************
--ʮ����תBCD��
--***********************************************************************************************
function Decimal_BCD(decimal)
    local bcd,h,l
    h = math.modf(decimal/10);
    l = math.fmod(decimal,10)
    bcd = h * 16 + l;
    return bcd
end


--***********************************************************************************************
--ʮ����תBCD��
--***********************************************************************************************
function BCD_Decimal(bcd)
    local decimal,h,l
    h = math.modf(bcd/16);
    l = math.fmod(bcd,16);
    decimal = h * 10 + l;
    return decimal;
end

--***********************************************************************************************
--�ַ����ָ��,str -> ��Ҫ�ָ���ַ���;delimiter->�ָ���
--***********************************************************************************************
function split(str, delimiter)
    local dLen = string.len(delimiter)--��ȡ�ַ�������
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
---�������ַ�������ȡ�ַ���1���ַ���2֮����ַ���
-- @param str  ����ȡ�ַ�����  
--        substr1 ָ���ַ���1��  
--        substr2 ָ���ַ���2; 
-- @return ��ȡ����ַ���
--***********************************************************************************************
function GetSubString(str, substr1, substr2)
    local s1, e1 = string.find(str, substr1)  --��ȡ�ַ���1��λ��
    local s2, e2 = string.find(str, substr2)  --��ȡ�ַ���2��λ��
    local subString
    if s1 == nil or s2 == nil then
        subString = BLANK_SPACE;
    else
        subString = string.sub(str, e1 + 1, s2 - 1);
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
    local s1, e1 = string.find(str, substr1)  --��ȡ�ַ���1��λ��
    local s2, e2 = string.find(str, substr2)  --��ȡ�ַ���2��λ��
    if s1 ~= nil and s2 ~= nil then
        str = string.sub(str, 1, s1 - 1) .. string.sub(str, e2 + 1, -1);
    end
    return str
end

--***********************************************************************************************
--�����ļ�����, ���������ļ��ĵ��뵼��
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
--��BCDת��Ϊ�ַ������ڻ�ȡ�汾��Ϣ��ʱ���ʹ�õ���
--***********************************************************************************************
function bcd_to_string(bcd)
    --ȡģ��õ���λ,ȡ����ø���λ
    local str = "";
    if bcd ~= nil then
        str = tostring(math.modf(bcd / 16)) .. tostring(math.fmod(bcd, 16));
    end;
    return str;
end

--***********************************************************************************************
--��16����ת��Ϊ��������ʾ
--��֤��ַ:https://www.h-schmidt.net/FloatConverter/IEEE754.html
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
--��������ת��Ϊ16���Ʊ�ʾ
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

    --EֵΪ��������ת�ɶ�������������λ����22.8125 ת�ɶ�����10110.1101������4λ 1.01101101
    --E=4 ���ټ���127 ��Ϊ����Eֵ
    --010000011 01101101 000000000000000
    local Result = S + E + M

    -- Result = string.format("%08X", Result)
    return Result
end

--***********************************************************************************************
--    �����ַ����ܺ���
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
--    �����ַ����ܺ���
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
 --   �ַ������ܺ���
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
--    �ַ������ܺ���
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
--- ����С�����nλ
--- nNum Դ����, n С��λ��
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

--***********************************************************************************************
--����һλ�Ĳ���,�ڼ���У������ʹ��
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
--����nλ�Ĳ���
--***********************************************************************************************
function right_shift(data,n)
    local new_data = data;
    for i=1,n,1 do
        new_data = right_shift_one(new_data);
    end
    return new_data;
end


--***********************************************************************************************
--������,�ڼ���У������ʹ��
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
--����У����: ModeBusCRC16
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

