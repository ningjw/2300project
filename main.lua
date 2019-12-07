--�����г��˳��õĻص�����
--���๦�����Ķ�<<������LUA�ű�API.pdf>>
--����ʹ��visual code studio ����װBookmarks��luaide-lite(����LuaCoderAssist)���,
--ͨ����ͬĿ¼�µ�2300project.code-workspace�����ռ�鿴main.lua�ļ�,���ļ�ʹ��Bookmarks��������˺ܶ��ǩ,������ת


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

OK = 0;
ERR = 1;

FINISHED = 0;--������ִ�����

OPEN = 1;--����
CLOSE = 0;--���ر�

UNLOCKED = 0;--����δ����
LOCKED = 1;--����������

NO_NEED_REPLY = 0;--�������ݲ���Ҫ�ظ�
NEED_REPLY = 1;--����������Ҫ�ظ�

Direction = {
    [CHN] = {FWD = "��ת",REV = "��ת"},
}



TipsTab = {
    [CHN] = {
        insertSdUsb = "�����SD������U��",
        insertSd    = "����SD��",
        insertUsb   = "����U��",
        pullOutSd   = "�γ�SD��",
        pullOutUSB  = "�γ�U��",
        importing   = "���ڵ��������ļ�...",
        imported    = "�����ļ�����ɹ�",
        exporting   = "���ڵ��������ļ�...",
        exported    = "�����ļ������ɹ�",
        exportTips  = "����SD����U�̴���config�ļ��к�����",
        selectProcess = "��ѡ������",
        sysInit = "ϵͳ��ʼ��",
        null    = "��",
    },
};

WorkStatus = {
    [CHN] = {
        run = "����",--��ʱϵͳ������������
        stop = "ֹͣ",
        readyRun = "����", --��ʱΪ�Զ����з�ʽ, ���ڵȴ�ʱ�䵽���Զ�������һ�����̵�״̬.
    }
};

WorkType = {
    [CHN] = {
        hand = "�ֶ�",--��������ť��,ִ��һ��
        auto = "�Զ�",--��������ť��,���Ը���ʱ���ж��Ƿ�������������붨ʱ����
        controlled = "����",--ͨ����λ������ָ����������.
    },
}

SysUser = {
    [CHN] = {
        operator = {"����Ա"},
        maintainer = "��άԱ",
        administrator = "����Ա",
    },
}


ValveStatus = {
    [CHN] = {
        open = "��",
        close = "�ر�"
    },
}


CalcType = {
    [CHN] = {
        log = "ȡ����",
        diff = "ȡ��ֵ",
    },
}

ProcessItem = {
    [CHN] = {"����","У��","��ϴ","��·���","���˲�","�����˲�","��Ⱥ˲�",BLANK_SPACE},
    };
ActionItem = {
    [CHN] = {"��ʼ��","ע���","ע��ü�Һ��","��ȡ�ź�","�䶯�ü�Һ","����","�ȴ�ʱ��","����","������",BLANK_SPACE},
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
    signalTotal = 0,--����ͳ�Ƶ�ǰ�źŸ���
    signalE1 = 0,--���ڱ����ź�E1��ֵ
    signalE2 = 0,--���ڱ����ź�E2��ֵ
    signalDrift = 0,--�ź�Ư��
    signalMinTime = 0,--��ȡ�ź���Сʱ��
    signalMaxTime = 0,--��ȡ�ź����ʱ��

    calculateType = "",--��������: ȡ���� ���� ȡ��ֵ ��ʽ
    result = 0,--����һ���������к�õ��Ľ��,�ý�������Ƿ������/У�����/...

    hand_control_func = nil;
}



--[[-----------------------------------------------------------------------------------------------------------------
    ��ں���
--------------------------------------------------------------------------------------------------------------------]]


--***********************************************************************************************
--��ʼ������,ϵͳ����LUA�ű����������ôλص�����
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
    
    ReadProcessFile();--������������1����/���п��ƽ���/�������ý����еĲ�������
    if record_get_count(SYSTEM_INFO_SCREEN,6) == 0 then --��ʾ��δ���ó�ʼ����
        record_add(SYSTEM_INFO_SCREEN, pwdRecordId, "171717");--��άԱ�����Ա��Ĭ�����붼��171717
        record_add(SYSTEM_INFO_SCREEN, pwdRecordId, "171717");--��άԱ�����Ա��Ĭ�����붼��171717
    end

    Sys.hand_control_func = sys_init;--�������Ƚ��г�ʼ������
    SetSysUser(SysUser[Sys.language].maintainer);   --����֮��Ĭ��Ϊ��άԱ
    -- SetSysUser(SysUser.operator);   --����֮��Ĭ��Ϊ����Ա
    uart_set_timeout(2000,1); --���ô��ڳ�ʱ, �����ܳ�ʱ2000ms, �ֽڼ����ʱ1ms
    start_timer(0, 100, 1, 0) --������ʱ�� 0����ʱʱ�� 100ms,1->ʹ�õ���ʱ��ʽ,0->��ʾ�����ظ�
end

--***********************************************************************************************
--��ʱ����ʱ��ִ�д˻ص�����,��ʱ����� 0~3
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
	elseif screen == SYSTEM_INFO_SCREEN then --ϵͳ��Ϣ����
		system_info_control_notify(screen,control,value);	
    elseif screen == LOGIN_SYSTEM_SCREEN then--��¼ϵͳ����
		login_system_control_notify(screen,control,value);	
	elseif screen == PASSWORD_SET_SCREEN then--�������ý���
		password_set_control_notify(screen,control,value);		
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
    if UartArg.lock == LOCKED then
        return;
    end

    if Sys.processStep == 1 then--��һ��: �رշ�11
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
        Sys.waitTimeFlag = SET;
        Sys.waitTime = 8;
        start_timer(2, Sys.waitTime * 1000, 1, 1); --������ʱ��2����ʱʱ��8s,1->��ʾִֻ��һ��
        reset_inject1();
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 5 then --���岽:��ʼ������
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
    getSoftVer = {[0] = 0xEE, 0x03, 0x10, 0x03, 0x00, 0x03, 0x00, 0x00, len = 6, note = "��ȡ����汾" },
    getHardVer = {[0] = 0xEE, 0x03, 0x10, 0x02, 0x00, 0x03, 0x00, 0x00, len = 6, note = "��ȡӲ���汾" },
    getTemp    = {[0] = 0xEE, 0x03, 0x10, 0x0A, 0x00, 0x01, 0x00, 0x00, len = 6, note = "�������¶�" },
    getVoltage = {[0] = 0xEE, 0x03, 0x10, 0x14, 0x00, 0x01, 0x00, 0x00, len = 6, note = "���ܵ�ѹ"},
    openLed    = {[0] = 0xEE, 0x06, 0x10, 0x0E, 0x00, 0x01, 0x00, 0x00, len = 6, note = "��LED��" },
    closeLed   = {[0] = 0xEE, 0x06, 0x10, 0x0E, 0x00, 0x00, 0x00, 0x00, len = 6, note = "��LED��" },
    getDrvVer  = {[0] = 0xE0, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "�汾��"},
    openValco  = {[0] = 0xE0, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "ʮͨ��"},--��ʮͨ��
    openV11    = {[0] = 0xE0, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "����11"},
    closeV11   = {[0] = 0xE0, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "�ط�11"},
    openV12    = {[0] = 0xE0, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "����12"},
    closeV12   = {[0] = 0xE0, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, len = 6, note = "�ط�12"},
    enInject1  = {[0] = 0xE0, 0x0F, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "ʹ��ע���"},
    mvInject1To= {[0] = 0xE0, 0x0D, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "�ƶ�ע���"},
    setInject1Spd={[0]= 0xE0, 0x0E, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "����ע����ٶ�"},
    rstInject1 = {[0] = 0xE0, 0x0D, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "��λע���"},
}



UartArg = {
    repeat_times = 0,--���ڼ�¼�ط�����
    repeat_data ,--���ڱ��汾���ط�����
    recv_data,--���ڱ�����յ�������
    reply_data = {[0] = 0, [1] = 0},--���ڱ�����Ҫ���ܵ��Ļظ�����
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

    if packet[0] == UartArg.reply_data[0] and packet[1] == UartArg.reply_data[1] then--���ܵ����ݻظ�
        UartArg.lock = UNLOCKED;
        stop_timer(1)--ֹͣ��ʱ��ʱ��
        local UartDateTime =  string.format("%02d-%02d %02d:%02d",Sys.dateTime.mon,Sys.dateTime.day,Sys.dateTime.hour,Sys.dateTime.min);
        local UartData = "";--����Ҫ���͵����ݱ��浽���ַ�����
        for i=0, rev_len-1, 1 do
            UartData = UartData..string.format("%02x ", packet[i]);
        end
        record_add(HAND_OPERATE4_SCREEN, UartRecordId, "RX;"..UartDateTime..";"..UartData..";".."�ظ�");--���ͨ�ż�¼
    end
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
    uart_send_data(packet) --������ͨ�����ڷ��ͳ�ȥ

    --���´��빦��: ÿ����һ������,�ͽ������ݱ������ֶ�����4�Ĵ����շ���¼����,����Ӵ������鿴.
    local UartDateTime =  string.format("%02d-%02d %02d:%02d",Sys.dateTime.mon,Sys.dateTime.day,Sys.dateTime.hour,Sys.dateTime.min);
    local UartData = "";--����Ҫ���͵����ݱ��浽���ַ�����
    for i=0, packet.len+1, 1 do
        UartData = UartData..string.format("%02x ", packet[i]);
    end
    print(packet.note);--�������
    record_add(HAND_OPERATE4_SCREEN, UartRecordId, "TX;"..UartDateTime..";"..UartData..";"..packet.note);--���ͨ�ż�¼
end


--***********************************************************************************************
--���뵽�ú�����ʾ����һ���ظ���ʱ, ��Ϊ����ظ��ɹ�, ��on_uart_recv_data�����оͻ�ֹͣ��ʱ��1,�Ͳ�����뵽�ú���
--***********************************************************************************************
function uart_time_out()
    UartArg.repeat_times = UartArg.repeat_times + 1;
    if UartArg.repeat_times <= 3 then
        UartArg.lock = UNLOCKED;
        on_uart_send_data(UartArg.repeat_data, NEED_REPLY);--�����ط�
    else  --�ط����ζ�û�лظ�,�����ط�
        UartArg.repeat_times = 0;
        --��ʱ���ϵͳ����������,����ס����,���ټ�������ִ��,�ڰ�ֹͣ����������; ������ֶ��������ʹ���ָ��,���������
        if Sys.status == WorkStatus[Sys.language].run then
            UartArg.lock = LOCKED;
        else
            UartArg.lock = UNLOCKED;
        end
        stop_timer(1)--ֹͣ��ʱ��ʱ��
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

LastAnalysisTimeId = 20;   --����ʱ��
LastAnalyteId = 17;        --������
LastAnalysisResultId = 18; --�������
LastAnalysisUnitId = 19;   --��λ
LastAnalysisE1Id = 25;     --E1
LastAnalysisE2Id = 26;     --E2
NextProcessTimeTextId = 2  --�´�����ʱ��

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
            Sys.waitTimeFlag = SET;
            start_timer(2, Sys.waitTime * 1000, 1, 1); --������ʱ��2����ʱʱ�� wait_time, 1->ʹ�õ���ʱ��ʽ,1->��ʾִֻ��һ��
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

--***********************************************************************************************
--��tableʵ����
--***********************************************************************************************
function start_wait_time()
end

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
        if get_value(RUN_CONTROL_SCREEN,control) == ENABLE then      --��ť����,��ʱϵͳ״̬��Ϊ����
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
        PeriodicTab[control-27].value = tonumber(get_text(RUN_CONTROL_SCREEN, control));--control-27��,��Ӧ���������̿�ʼʱ����Ƶ��
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
--�������ʼ��ťʱ,���øú���ִ������
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
        SetSysWorkStatus(WorkStatus[Sys.language].run);--���ù���״̬Ϊ����
    end
end

--***********************************************************************************************
--�ú����ڶ�ʱ���е���,������״̬ʱ���øú���
--ϵͳΪ����״̬,��ʱSystemArg.currentProcessId�����˵�ǰ��Ҫ���е��������, �����Ը����Ϊ�������������ļ������˸����̵����ж���,ͨ���������ļ�����֪������ʲô����.
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
        --Sys.startTime.year,Sys.startTime.mon,Sys.startTime.day,Sys.startTime.hour,Sys.startTime.min--��ȡ��ǰʱ��
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
                SetSysWorkStatus(WorkStatus[Sys.language].readyRun);--����Ϊ����״̬,��ʱ����ϵͳ��ʱ���в��ϵ��ж��Ƿ���Խ�����һ��������
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
    if Sys.userName == SysUser[Sys.language].maintainer or  Sys.userName == SysUser[Sys.language].administrator then--��άԱ/����Ա
        set_process_edit_state(ENABLE);--����༭����
    end
    UartArg.lock = UNLOCKED;--��������
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

--���ñ༭��ť��Ӧ����ת����
--para:��ȡ��Ӧ�Ķ�����������
--screen: ��ǰ��Ļ��id, �ӽ��水"ȷ��" ,"����" ��ť����Ҫ���صĽ���
--control:"�༭"��ť��id��
function set_edit_screen(para, screen, control)
    if screen == PROCESS_SET2_SCREEN then
        ReadActionTag(control-100);--����������2����, ���༭��ťid��Ϊ101ʱ, ��ǰ�������Ϊ1, ��������
        set_screen_actionNumber(screen, control-100);
    elseif screen == PROCESS_SET3_SCREEN then
        ReadActionTag(control-100);
        set_screen_actionNumber(screen, control-100+12);
    end

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
        if get_text(PROCESS_SET2_SCREEN, control+200) ~= BLANK_SPACE then--��������˶�������(�༭��ť��id+200���ڶ�������id)
            set_edit_screen(get_text(PROCESS_SET2_SCREEN, control+200), PROCESS_SET2_SCREEN, control);--control+200��ʾ��Ӧ��"��������"id
        end
    elseif control >= TabAction[1].insertId and control <= TabAction[12].insertId then--��������밴ťʱ
        local insertActionId = control - 500;
        if get_text(PROCESS_SET2_SCREEN,control-200) ~= BLANK_SPACE then--control-200��Ӧ�˲��밴ťǰ��Ķ�������
            InsertAction(insertActionId);
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
        if get_text(PROCESS_SET3_SCREEN, control+100) ~= BLANK_SPACE then--��������˶�������(�༭��ť��id+100���ڶ�������id)
            set_edit_screen(get_text(PROCESS_SET3_SCREEN, control+200), PROCESS_SET3_SCREEN, control);--control+200��ʾ��Ӧ��"��������"id
        end
    elseif control >= TabAction[13].insertId and control <= TabAction[24].insertId then--��������밴ťʱ
        local insertActionId = control - 500;
        if get_text(PROCESS_SET3_SCREEN,control-200) ~= BLANK_SPACE then--control-200��Ӧ�˲��밴ťǰ��Ķ�������
            InsertAction(insertActionId);
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
INJECT_BtEndId = 2; --ע��ý����а�ť����id

INJECT_TextStartId = 3;--ȡ���������ı���ʼid
INJECT_TextEndId = 10; --ȡ���������ı�����id

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
            Sys.injectSpeed = tonumber(paraTab[3]);
            Sys.injectScale = tonumber(paraTab[4]) * 10;
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
            Sys.waitTime = tonumber(paraTab[10]);
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
INJECT_ADD_BtEndId = 40;
INJECT_ADD_TextStartId = 41;
INJECT_ADD_TextEndId = 64;
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
            control_valco( tonumber(paraTab[62]) );--idΪ23�Ŀؼ�Ϊͨ����
            start_wait_time( tonumber(paraTab[41]) );
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then--
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+8];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = tonumber(paraTab[42]);--�ȴ�ʱ��
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
            Sys.injectSpeed = tonumber(paraTab[44]);
            Sys.injectScale = tonumber(paraTab[45]) * 10;
            Sys.waitTime = tonumber(paraTab[47]);
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
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
        if paraTab[5] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ʮͨ������
            control_valco( tonumber(paraTab[63]) );--idΪ63�Ŀؼ�Ϊͨ����
            start_wait_time( tonumber(paraTab[64]) );
        end
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(�ط�)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+8];
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
                Sys.valveIdTab[i] = paraTab[i+24];
            end
            Sys.valveOperate = ValveStatus[Sys.language].open;
            Sys.waitTime = tonumber(paraTab[52]);
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
            Sys.injectSpeed = tonumber(paraTab[54]);
            Sys.injectScale = tonumber(paraTab[55]) * 10;
            Sys.waitTime = tonumber(paraTab[57]);
            Sys.driverStep1Func = control_inject1;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        elseif paraTab[7] == ENABLE_STRING then
            Sys.injectId = 2;
            Sys.injectSpeed = tonumber(paraTab[58]);
            Sys.injectScale = tonumber(paraTab[59]) * 10;
            Sys.waitTime = tonumber(paraTab[61]);
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------------
    elseif Sys.actionSubStep == 11 then
        if paraTab[6] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����2����(�ط�)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+24];
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
PERISTALTIC_BtEndId = 21;
PERISTALTIC_TextStartId = 22;
PERISTALTIC_TextEndId = 36;


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
                Sys.valveIdTab[i] = paraTab[i+5];
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
                Sys.valveIdTab[i] = paraTab[i+5];
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
ReadSignal_TextEndId = 4;

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
    -----------------------------------------------------------
    if Sys.actionSubStep == 1 then
        Sys.signalDrift = tonumber(paraTab[2]);
        Sys.signalMinTime = tonumber(paraTab[3]);
        Sys.signalMaxTime = tonumber(paraTab[4]);

        start_timer(2, Sys.signalMinTime * 1000, 1, 1); --������ʱ��2����ʱʱ��(��Сʱ��), 1->ʹ�õ���ʱ��ʽ,1->��ʾִֻ��һ��
        getValidSignalData = RESET;
        Sys.actionSubStep = Sys.actionSubStep + 1;
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if Sys.waitTimeFlag == RESET then  --��С��ʱʱ�䵽,��ת��һ����ȡ�ź�
            start_timer(2, (Sys.signalMaxTime - Sys.signalMinTime) * 1000, 1, 1); --������ʱ��2����ʱʱ��(���ʱ��-��Сʱ��)
            Sys.actionSubStep = Sys.actionSubStep + 1;
            Sys.signalTotal = 0;
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 3 then
        if UartArg.lock == UNLOCKED then--ͨ�����ڶ�ȡ�ź�
            --���ʹ���ָ��
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    -----------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        if UartArg.lock == UNLOCKED then--������������, ���ж��Ƿ������ź�Ư��Ҫ��
            local signalE = 0;
            local maxSignal = 0;
            local minSignal = 0;
            
            Sys.signalTab[math.fmod(Sys.signalTotal, 10)] = signalE;--����ѹ�źű��浽������
            Sys.signalTotal = Sys.signalTotal + 1;
            if Sys.signalTotal >= 10 then--�Ѿ���ȡ���㹻���ź�(10��)
                maxSignal = math.max(Sys.signalTab[0],Sys.signalTab[1],Sys.signalTab[2],Sys.signalTab[3],Sys.signalTab[4],
                                     Sys.signalTab[5],Sys.signalTab[6],Sys.signalTab[7],Sys.signalTab[8],Sys.signalTab[9]);
                minSignal = math.min(Sys.signalTab[0],Sys.signalTab[1],Sys.signalTab[2],Sys.signalTab[3],Sys.signalTab[4],
                                     Sys.signalTab[5],Sys.signalTab[6],Sys.signalTab[7],Sys.signalTab[8],Sys.signalTab[9]);
                if (maxSignal - minSignal <= Sys.signalDriftthen) or --�����ź�Ư������
                   (Sys.waitTimeFlag == RESET and getValidSignalData == SET) then--���ʱʱ�䵽
                    local signalSum = 0;
                    for i = 0, 9, 1 do
                        signalSum = signalSum + Sys.signalTab[i];
                    end
                    signalE = (signalSum - maxSignal - minSignal) / 8;--��ȥSys.signalTab�е����ֵ����Сֵ��ȡƽ��ֵ
                    
                    if paraTab[1] == "E1" then
                        Sys.signalE1 = signalE;
                    else
                        Sys.signalE2 = signalE;
                    end
                    Sys.actionSubStep = Sys.actionSubStep + 1;
                else
                    Sys.actionSubStep = Sys.actionSubStep - 1;--ִ����һ��,����ͨ�����ڶ�ȡ��ѹ�ź�
                end
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
CALCULATE_BtEndId = 3;
CALCULATE_TextStartId = 4;
CALCULATE_TextEndId = 10;

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
--  ����У�����
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
--  ����������
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
--  ִ�м�������
--***********************************************************************************************
function excute_calculate_process(paraTab)
    Sys.calculateType = paraTab[10];
    if Sys.processType == ProcessItem[Sys.language][2] then--��ǰ��������ΪУ��
        calc_calibrate_result(Sys.calculateType);
    else
        calc_analysis_result(Sys.calculateType);
        if paraTab[1] == ENABLE_STRING then--�������
            Sys.result = tonumber(paraTab[4]) * Sys.result + tonumber(paraTab[5]);
        end
    end

    Sys.resultTime = Sys.dateTime;--��ȡ��ǰʱ��

    return FINISHED;
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
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE_STRING then--�ж��Ƿ���Ҫ��ʮͨ������
            Sys.valcoChannel = tonumber(paraTab[19]);--ͨ����
            Sys.waitTime = tonumber(paraTab[20]);--�ȴ�ʱ��
            -- Sys.driverStep1Func = ;
            driver[Sys.driverStep]();--�ú���ִ����ɺ�Sys.actionSubStep���1
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    elseif Sys.actionSubStep == 2 then--�ж��Ƿ���Ҫ��������в���
        if paraTab[2] == ENABLE_STRING then--�ж��Ƿ���Ҫ�����1����(����)����
            for i=1,16,1 do
                Sys.valveIdTab[i] = paraTab[i+2];
            end
            Sys.valveOperate = paraTab[22];
            Sys.waitTime = tonumber(paraTab[21]);--�ȴ�ʱ��
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
        Sys.waitTimeFlag = SET;
        start_timer(2, tonumber(paraTab[1]) * 1000, 1, 1); --������ʱ��1����ʱʱ��, 1->ʹ�õ���ʱ��ʽ,1->��ʾִֻ��һ��
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
                set_text(DestScreen, DestControl-100, ProcessItem[Sys.language][ProcessSelectItem]);--DestControl-100��Ӧ��������
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
            set_text(DestScreen, DestControl-100, get_text(PROCESS_SELECT2_SCREEN, ProcessSelec2tItem));--DestControl-100��Ӧ��������
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
            set_text(PROCESS_SELECT2_SCREEN, NumberOfProcess, get_text(PROCESS_SET1_SCREEN,ProcessTab[i].nameId))--Ϊ���ı�����������
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
RANGESET_TextEndId = 25;

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
    --�������ý�����,�ؼ�Id = 300 ~ 308Ϊ��λ��ʾ�ı�
    for i = 300,308,1 do 
        set_text(RANGE_SET_SCREEN, i, Unite);
    end
    --��ҳ��,�ռ�Id= 19 Ϊ��λ��ʾ
    set_text(MAIN_SCREEN,LastAnalysisUnitId, Unite);
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
HandValve11BtId = 43;
HandValve12BtId = 44;
HandCloseAllValveId = 47;
HandValcoChnlId = 130;
HandValcoCtrlId = 131;
HandInject1ScaleId = 99;
HandInject1SpdId = 103;
HandInject1SendId = 101;
HandInject1WaitTimeId = 3;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function hand_operate1_control_notify(screen, control, value)
    if control == HandValve11BtId then--���Ʒ�11
        if get_value(HAND_OPERATE1_SCREEN, control) == ENABLE then
            open_single_valve(11);
        else
            close_single_valve(11);
        end
    elseif control == HandValve12BtId then--���Ʒ�12
        if get_value(HAND_OPERATE1_SCREEN, control) == ENABLE then
            open_single_valve(12);
        else
            close_single_valve(12);
        end
    elseif control == HandCloseAllValveId then--�ر����з�

    elseif control == HandValcoCtrlId then--����ʮͨ��
        control_valco( tonumber( get_text(screen, HandValcoChnlId) ) );
    elseif control == HandInject1SendId then--����ע���
        Sys.hand_control_func = hand_control_inject1;
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
    
    if Sys.processStep == 1 then--��һ��: ʹ��ע���
        enable_inject1();
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
    elseif Sys.processStep == 4 and Sys.waitTimeFlag == RESET then --���Ĳ�:��ʼ������
        Sys.processStep = 1;
        Sys.hand_control_func = nil;
    end

end


--[[-----------------------------------------------------------------------------------------------------------------
    �ֶ�����2
--------------------------------------------------------------------------------------------------------------------]]
HandGetVoltageId = 73;
HandShowVoltageId = 35;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function hand_operate2_control_notify(screen,control,value)
    if control == HandGetVoltageId then
        Sys.hand_control_func = hand_get_voltage;
    end
end

--***********************************************************************************************
--�ֶ�����-��ȡƫ�õ�ѹ
--sta: 0-��λ; 1-�ƶ���ָ��λ��
--***********************************************************************************************
function hand_get_voltage()
    if UartArg.lock == LOCKED then
        return;
    end
    
    if Sys.processStep == 1 then--��һ��: ���ʹ���ָ���ȡ��ѹ
        on_uart_send_data(uartSendTab.getVoltage, NEED_REPLY);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 2 then--�ڶ���: ������ѹֵ��������ʾ
        local vol = (UartArg.recv_data[3] * 256 + UartArg.recv_data[4]) / 10;
        set_text(HAND_OPERATE2_SCREEN, HandShowVoltageId, vol);
        Sys.processStep = Sys.processStep + 1;
    elseif Sys.processStep == 3 then--������:����
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





--[[-----------------------------------------------------------------------------------------------------------------
    ������¼
--------------------------------------------------------------------------------------------------------------------]]





--[[-----------------------------------------------------------------------------------------------------------------
    У׼��¼
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    ������¼
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    ������־
--------------------------------------------------------------------------------------------------------------------]]




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

ftpAddr1Id = 22;
ftpAddr2Id = 23;
ftpAddr3Id = 24;
ftpAddr4Id = 25;
ftpStartBtId = 26;
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
        set_user_name(SysUser[Sys.language].maintainer);
    elseif control == administratorPwdSetId then--����Ա��������
        set_user_name(SysUser[Sys.language].administrator);
    elseif control == OperatorLoginId then --����Ա��¼
        set_user_name(SysUser[Sys.language].operator);
    elseif control == maintainerLoginId then--��άԱ��¼
        set_user_name(SysUser[Sys.language].maintainer);
        change_screen(LOGIN_SYSTEM_SCREEN);
    elseif control == administratorLoginId then--����Ա��¼
        set_user_name(SysUser[Sys.language].administrator);
        change_screen(LOGIN_SYSTEM_SCREEN);
    elseif control == ftpStartBtId then--ftpԶ������
    end
end

--***********************************************************************************************
--  ����ϵͳ�û�
--***********************************************************************************************
function SetSysUser(user)
    
    Sys.userName = user;

    --�ڵײ���״̬�û���
    for i = 1,16,1 do
        set_text(PublicTab[i], SysUserNameId, Sys.userName);
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

--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
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
    �����ļ�������غ���
--------------------------------------------------------------------------------------------------------------------]]

cfgFileTab = {
    [1] = {sTag = "<ProcessSet>",eTag = "</ProcessSet>"};--��������1�����еĲ������������tag��
    [2] = {sTag = "<RunControl>",eTag = "</RunControl>"};--���п��ƽ����еĲ������������tag��
    [3] = {sTag = "<RangeSet>",eTag = "</RangeSet>"};--�������ý����еĲ������������tag��
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

    --�ַ��滻
    if flag == 1 then
        for i = 23, actionNumber, -1 do
            fileString = string.gsub(fileString, "action"..i, "action"..(i+1));
        end
    else
        for i = actionNumber+1, 24, 1 do
            fileString = string.gsub(fileString, "action"..i, "action"..(i+1));
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
    
    local actionType = GetSubString(actionString, "<type>","</type>");--��ȡactionString�ַ�����<type>��ǩ֮����ַ���,��ȡ���������붯������
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


