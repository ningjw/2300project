--�����г��˳��õĻص�����
--���๦�����Ķ�<<������LUA�ű�API.pdf>>
--����ʹ��visual code studio ����װBookmarks���,ͨ����ͬĿ¼�µ�2300project.code-workspace�����ռ�鿴���ļ�.


--����Խ���id���к궨��
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


TipsTab = {
    InsertSdUsb = "�����SD������U��",
    InsertSd    = "����SD��",
    InsertUsb   = "����U��",
    PullOutSd   = "�γ�SD��",
    PullOutUSB  = "�γ�U��",
    Importing   = "���ڵ��������ļ�...",
    Imported    = "�����ļ�����ɹ�",
    Outporting  = "���ڵ��������ļ�...",
    OutPorted   = "�����ļ������ɹ�",
};


WorkStatus = {
    run = "����",
    stop = "ֹͣ",
    idle = "����"
};

WorkType = {
    hand = "�ֶ�",
    auto = "�Զ�",
    controlled = "����"
}

User = {
    administrator = "����Ա",
    maintainer = "��άԱ",
    operator = "����Ա",
};

SystemArg = {
    status = 0,--ϵͳ״̬:��ӦWorkStatus�е�ֵ
    runType = 0,--���з�ʽ: ��ӦWorkType�е�ֵ
    totalProcess = 0,--�����̸���:��Ӧ��������1�е���������.
    handProcess = 0,--�ֶ�����:��Ӧ���п��ƽ���-�ֶ�����,���ﱣ���������id��
    handProcessTimes = 1,--�ֶ����̴���,Ĭ��Ϊ1��
}


--[[-----------------------------------------------------------------------------------------------------------------
    ��ں���
--------------------------------------------------------------------------------------------------------------------]]
--����ȫ�ֱ���uart_free_protocol��ʹ�����ɴ���Э��
uart_free_protocol = 1
--��ʼ������,ϵͳ����LUA�ű����������ôλص�����
function on_init()
    start_timer(0, 100, 1, 0) --������ʱ�� 0����ʱʱ�� 100ms,1->ʹ�õ���ʱ��ʽ,0->��ʾ�����ظ�
    uart_set_timeout(1000,200);--���ô��ڳ�ʱ
    ShowSysUser(User.operator);--����֮��Ĭ��Ϊ����Ա
    ReadConfigFile(1);--������������1�����еĲ�������
    ReadConfigFile(2);--�������п��ƽ����еĲ�������
end

--��ʱ�ص�������ϵͳÿ��1�����Զ����á�
function on_systick()
    
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
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
	elseif screen == PROCESS_START_SCREEN then--��������-��ʼ����
		process_start_control_notify(screen,control,value);
	elseif screen == PROCESS_GET_SANPLE_SCREEN	then--��������-ȡ������
		process_get_sample_control_notify(screen,control,value);
	elseif screen == PROCESS_INJECT_SCREEN	then--��������-ע��ü�Һ
		process_inject_control_notify(screen,control,value);
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
	elseif screen == SYSTEM_INFO_SCREEN then --ϵͳ��Ϣ����
		system_info_control_notify(screen,control,value);	
	elseif screen == LOGIN_SYSTEM_SCREEN then--��¼ϵͳ����
		login_system_control_notify(screen,control,value);	
	elseif screen == PASSWORD_SET_SCREEN then--�������ý���
		login_system_control_notify(screen,control,value);		
	end
end


--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
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


--��ʱ����ʱ��ִ�д˻ص�����,��ʱ����� 0~31
function on_timer(timer_id)
    if  timer_id == 0 then --��ʱ��0,��ʱʱ�䵽
        if SystemArg.status == WorkStatus.run then--ϵͳΪ����״̬
            if SystemArg.runType == WorkType.hand then --�ֶ�

            elseif SystemArg.runType == WorkType.auto then --�Զ�

            elseif SystemArg.runType == WorkType.controlled then --����

            end
        end
    end
end


--���� U �̺�ִ�д˻ص�����
function on_usb_inserted(dir)
    ShowSysTips(TipsTab.InsertUsb);
    UsbPath = dir;
end

--�γ� U �̺�ִ�д˻ص�����
function on_usb_removed()
    ShowSysTips(TipsTab.PullOutUSB);
end

--���� SD ����ִ�д˻ص�����
function on_sd_inserted(dir)
    ShowSysTips(TipsTab.InsertSd);
    SdPath = dir;
end

--�γ� SD ����ִ�д˻ص�����
function on_sd_removed()
    ShowSysTips(TipsTab.PullOutUSB);
end


--�����Զ��庯��
function on_uart_recv_data(packet)

end


--***********************************************************************************************
--  �ڵײ���״̬����ʾ��ʾ��Ϣ
--***********************************************************************************************
function SystemStop()
    SystemArg.status = WorkStatus.stop;
    ShowSysWorkStatus(WorkStatus.stop);--��״̬����ʾΪֹͣ
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

SysWorkStatusId = 901;      --����״̬
SysCurrentActionId = 902;--��ǰ����
SysUserNameId = 903      --��ʾ�û�
SysAlarmId = 904;        --��ʾ��ǰ�澯��Ϣ
SysTipsId = 905;         --����ײ�������ʾ��ʾ��Ϣ���ı�id



function main_control_notify(screen,control,value)

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
--  �ڵײ���״̬����ʾ����״̬
--***********************************************************************************************
function ShowSysWorkStatus(status)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysWorkStatusId, status);
    end
end

--***********************************************************************************************
--  �ڵײ���״̬����ʾ��ǰ����
--***********************************************************************************************
function ShowSysAlarm(alarm)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysAlarmId, alarm);
    end
end

--***********************************************************************************************
--  �ڵײ���״̬����ʾ�澯��Ϣ
--***********************************************************************************************
function ShowSysCurrentAction(action)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysCurrentActionId, action);
    end
end


--***********************************************************************************************
--  �ڵײ���״̬�û���
--***********************************************************************************************
function ShowSysUser(user)
    for i = 1,16,1 do
        set_text(PublicTab[i], SysUserNameId, user);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    ���п���                                                                                                          
--------------------------------------------------------------------------------------------------------------------]]

--����������صİ�ťid��101 - 129, ����101Ϊ�������̵�һ��, id129Ϊ�ֶ�����
RUNCTRL_TextStartId = 1;
RUNCTRL_TextEndId = 85;

RunTypeID = 30;--���з�ʽ��Ӧ���ı��ռ�ID
RunTypeMenuId = 243;--���з�ʽ�˵�
RunStopButtonId = 229;--����״̬�л���ť"��ʼ""ֹͣ"��ť

--�ֶ�����
HandProcessTab = {
    --  ������ʾ�������Ƶ��ı�id, ���ı��غϵİ�ťid, �ֶ�����id, �������ƶ�Ӧ���������
    [1] = {TextId = 29, BtId = 129, TimesId = 31, processId = 0},
};

--��������
PeriodicTab = { [1] = {TextId = 1, BtId = 101, processId = 0}, 
                [2] = {TextId = 2, BtId = 102, processId = 0},
                [3] = {TextId = 3, BtId = 103, processId = 0},
                [4] = {TextId = 4, BtId = 104, processId = 0},
                [5] = {TextId = 32, value = 0},--�� ������Ҫע����ѧ��ϵ:  ��� =  TextId - 27
                [6] = {TextId = 33, value = 0},--��
                [7] = {TextId = 34, value = 0},--��
                [8] = {TextId = 35, value = 0},--ʱ
                [9] = {TextId = 36, value = 0},--��
                [10]= {TextId = 37, value = 0},--Ƶ��
};

--��ʱ����
TimedProcessTab = {
	[1 ] = {TextId = 5,  BtId = 105, StartHourId = 38, StartMinuteId = 62, processId = 0},
	[2 ] = {TextId = 6,  BtId = 106, StartHourId = 39, StartMinuteId = 63, processId = 0},
	[3 ] = {TextId = 7,  BtId = 107, StartHourId = 40, StartMinuteId = 64, processId = 0},
	[4 ] = {TextId = 8,  BtId = 108, StartHourId = 41, StartMinuteId = 65, processId = 0},
	[5 ] = {TextId = 9,  BtId = 109, StartHourId = 42, StartMinuteId = 66, processId = 0},
	[6 ] = {TextId = 10, BtId = 110, StartHourId = 43, StartMinuteId = 67, processId = 0},
	[7 ] = {TextId = 11, BtId = 111, StartHourId = 44, StartMinuteId = 68, processId = 0},
	[8 ] = {TextId = 12, BtId = 112, StartHourId = 45, StartMinuteId = 69, processId = 0},
	[9 ] = {TextId = 13, BtId = 113, StartHourId = 46, StartMinuteId = 70, processId = 0},
	[10] = {TextId = 14, BtId = 114, StartHourId = 47, StartMinuteId = 71, processId = 0},
	[11] = {TextId = 15, BtId = 115, StartHourId = 48, StartMinuteId = 72, processId = 0},
	[12] = {TextId = 16, BtId = 116, StartHourId = 49, StartMinuteId = 73, processId = 0},
	[13] = {TextId = 17, BtId = 117, StartHourId = 50, StartMinuteId = 74, processId = 0},
	[14] = {TextId = 18, BtId = 118, StartHourId = 51, StartMinuteId = 75, processId = 0},
	[15] = {TextId = 19, BtId = 119, StartHourId = 52, StartMinuteId = 76, processId = 0},
	[16] = {TextId = 20, BtId = 120, StartHourId = 53, StartMinuteId = 77, processId = 0},
	[17] = {TextId = 21, BtId = 121, StartHourId = 54, StartMinuteId = 78, processId = 0},
	[18] = {TextId = 22, BtId = 122, StartHourId = 55, StartMinuteId = 79, processId = 0},
	[19] = {TextId = 23, BtId = 123, StartHourId = 56, StartMinuteId = 80, processId = 0},
	[20] = {TextId = 24, BtId = 124, StartHourId = 57, StartMinuteId = 81, processId = 0},
	[21] = {TextId = 25, BtId = 125, StartHourId = 58, StartMinuteId = 82, processId = 0},
	[22] = {TextId = 26, BtId = 126, StartHourId = 59, StartMinuteId = 83, processId = 0},
	[23] = {TextId = 27, BtId = 127, StartHourId = 60, StartMinuteId = 84, processId = 0},
	[24] = {TextId = 28, BtId = 128, StartHourId = 61, StartMinuteId = 85, processId = 0},
};

--***********************************************************************************************
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--***********************************************************************************************
function run_control_notify(screen,control,value)
	--control-100��ʾ��ð�ť�غϵ��ı���
	if (control) >= PeriodicTab[1].BtId  and control <= HandProcessTab.BtId then--�������Ҫѡ�����̵��ı���ʱ
        process_select2_set(screen, control-100);--(control100)��ʾ��ð�ť�غϵ��ı���
    elseif control == RunStopButtonId then--�����¿�ʼ��ť��ֹͣ��ťʱ.
        if get_value(RUN_CONTROL_SCREEN,control) == 1.0 then--��ť����,��ʱϵͳ״̬��Ϊ����
            SystemArg.status = WorkStatus.run;
            ShowSysWorkStatus(WorkStatus.run);
        else--��ť�ɿ�,��ʱϵͳ״̬Ӧ��Ϊֹͣ
            SystemStop();
        end
    elseif control == RunTypeMenuId then--�������з�ʽ
        SystemArg.runType = get_text(RUN_CONTROL_SCREEN, RunTypeID);
        WriteConfigFile(2);--�����ļ���<RunCtrl>��ǩ�е�����
    elseif control == HandProcessTab.TimesId then--�����ֶ����д���
        SystemArg.handProcessTimes = tonumber(get_text(RUN_CONTROL_SCREEN,control));
        WriteConfigFile(2);--�����ļ���<RunCtrl>��ǩ�е�����
    elseif control >= TimedProcessTab[5].TextId and control <= TimedProcessTab[10].TextId then --�������ڿ�ʼʱ����Ƶ��
        TimedProcessTab[control-27].value = tonumber(get_text(RUN_CONTROL_SCREEN, control));
        WriteConfigFile(2);--�����ļ���<RunCtrl>��ǩ�е�����
	end
end


--***********************************************************************************************
--���޸���ĳ������ʱ,���øú���,һ�㰴������ѡ��2�����е�ȷ�ϰ�ť����øú���
--***********************************************************************************************
function process_change(control)
    local processId = 0;

    --��������1-12
    for i = 1, 12, 1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId),name, 1) ~= nil then
            processId = i;
            break;
        end
    end

    --��������id��
    if control == HandProcessTab[1].TextId then--�ֶ���������
        SystemArg.handProcess = processId;
    elseif control >= PeriodicTab[1].TextId and control <= PeriodicTab[4].TextId then--��������
        for i=1,4,1 do
            if control == PeriodicTab[i].TextId then
                PeriodicTab[i].processId = processId;
            end
        end
    elseif control >= TimedProcessTab[1].TextId and control <= TimedProcessTab[24].TextId then--��ʱ����
        for i=1,24,1 do
            if control == TimedProcessTab[i].TextId then
                TimedProcessTab[i].processId = processId;
            end
        end
    end
end



--[[-----------------------------------------------------------------------------------------------------------------
    ��������1
--------------------------------------------------------------------------------------------------------------------]]

--�������ñ��и��ؼ�Id,ע��selecId��nameId����ѧ��ϵ:selectId = nameId + 100, selectId = deleteId + 220 �ȵ�
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


AnalyteSetId = 38;--������ѡ��
CodeSetId = 107;--����
ProcessSaveBtId = 19;--���水ť,��������1/2/3�ı��水ť�������id
ExportBtId = 41;--������ť
InportBtId = 42;--���밴ť

--***********************************************************************************************
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
--***********************************************************************************************
function process_set1_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- ����
        WriteConfigFile(1);
    elseif control == InportBtId then --���밴ť
        if SdPath  ~= nil then
            ShowSysTips(TipsTab.Importing);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                ConfigFileCopy( SdPath.."config/"..i, i);--��Sd���е������ļ����붼ϵͳ
            end
            ShowSysTips(TipsTab.Imported);
            ReadConfigFile(1);--������������1�����еĲ�������
            ReadConfigFile(2);--�������п��ƽ����еĲ�������
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab.Importing);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                ConfigFileCopy( UsbPath.."config/"..i, i);--��Sd���е������ļ����붼ϵͳ
            end
            ShowSysTips(TipsTab.Imported);
            ReadConfigFile(1);--������������1�����еĲ�������
            ReadConfigFile(2);--�������п��ƽ����еĲ�������
        else
            ShowSysTips(TipsTab.InsertSdUsb);
        end;
    elseif control == ExportBtId then --������ť(���������õ�����SD����)
        if SdPath  ~= nil then
            ShowSysTips(TipsTab.Outporting);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                    ConfigFileCopy(i, SdPath.."config/"..i);--���ļ�������config�ļ���,�����ļ���Ϊ0~12
            end
            ShowSysTips(TipsTab.OutPorted);
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab.Outporting);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                    ConfigFileCopy(i, UsbPath.."config/"..i);--���ļ�������config�ļ���,�����ļ���Ϊ0~12
            end
            ShowSysTips(TipsTab.OutPorted);
        else
            ShowSysTips(TipsTab.InsertSdUsb);
        end;
    elseif control == AnalyteSetId then
        set_text(MAIN_SCREEN, LastAnalyteId, get_text(PROCESS_SET1_SCREEN, AnalyteSetId));--���÷�����
    elseif (control-100) >= TabProcess[1].selectId and (control-100) <= TabProcess[12].selectId then --����������ѡ���µĸ�����ť
        process_select_set(screen, control-100);
    elseif (control-100) >= TabProcess[1].rangeId and (control-100) <= TabProcess[12].rangeId  then --����������ѡ���µĸ�����ť
        range_select_set(screen, control-100);
    elseif control >= TabProcess[1].deleteId and control <= TabProcess[12].deleteId then--ɾ����ť
        if string.len(get_text(PROCESS_SET1_SCREEN, control+120)) ~= 1 and  --���ƿ���Ϊһ���ո�,��ʱ��������û������
           string.len(get_text(PROCESS_SET1_SCREEN, control+120)) ~= 0 then --���Ƶĳ���Ϊ0,��ʾ����û������
            set_text(PROCESS_SET1_SCREEN, control+220," ");--����Ӧ����ѡ����ı���ʾΪ�ո�
			set_text(PROCESS_SET1_SCREEN, control+120," ");--����Ӧ�������Ƶ��ı���ʾΪ�ո�
			set_text(PROCESS_SET1_SCREEN, control+232," ");--����Ӧ���̵���������Ϊ�ո���ʾ
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
ProcessSelectId = 38;      --λ����������2/3�������id
ProcessSelectTipsTextId = 21;--������ʾ��ʾ��Ϣ���ı���,��������2/3�����ж������id

--����ע��۲춯��ѡ��id,��������id,�༭id֮�����ѧת����ϵ:selectId = nameId + 100; nameId = EditId + 100
--����[1]-[12]�а�����id�ؼ�����������2������,[13]-[24]�а�����id�ؼ�����������3������
TabAction = {
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

--���ñ༭��ť��Ӧ����ת����
--para:��ȡ��Ӧ�Ķ�����������
--screen: ��ǰ��Ļ��id, �ӽ��水"ȷ��" ,"����" ��ť����Ҫ���صĽ���
--control:"�༭"��ť��id��
function set_edit_screen(para, screen, control)
    if screen == PROCESS_SET2_SCREEN then
        ReadProcessFile(control-99);--����������2����, ���༭��ťid��Ϊ100ʱ, ��ǰ�������Ϊ1, ��������
        set_screen_actionNumber(screen, control-99);
    elseif screen == PROCESS_SET3_SCREEN then
        ReadProcessFile(control-99+12);
        set_screen_actionNumber(screen, control-99+12);
    end

    if para == ActionItem[1] then --��ʼ����
        change_screen(PROCESS_START_SCREEN);
    elseif para == ActionItem[2] then --ȡ������
        change_screen(PROCESS_GET_SANPLE_SCREEN);
    elseif para == ActionItem[3] then --ע��ü�Һ��
        change_screen(PROCESS_INJECT_SCREEN);
    elseif para == ActionItem[4] then --��ȡ�ź�
        change_screen(PROCESS_READ_SIGNAL_SCREEN);
    elseif para == ActionItem[5] then --�䶯�ü�Һ
        change_screen(PROCESS_PERISTALTIC_SCREEN);
    elseif para == ActionItem[6] then --����
        change_screen(PROCESS_CALCULATE_SCREEN);
    elseif para == ActionItem[7] then --�ȴ�ʱ��
        change_screen(PROCESS_WAIT_TIME_SCREEN);
    elseif para == ActionItem[8] then --����
        change_screen(PROCESS_DISPEL_SCREEN);
    elseif para == ActionItem[9] then --������
        change_screen(PROCESS_VALVE_CTRL_SCREEN);
    end
end


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set2_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- ����
        if string.len(get_text(PROCESS_SET2_SCREEN, ProcessSelectId)) == 0 then
            set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 1);--��ʾ��ʾ��Ϣ
        else
            set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 0);--������ʾ��Ϣ
            --�ֶ����浱ǰ���ڱ༭������
            WriteProcessFile(0);
        end
    elseif control == ProcessSelectButtonId then--���������ѡ��ťʱ,
        process_select2_set(PROCESS_SET2_SCREEN, ProcessSelectId);--��������ѡ��2�����а�ȷ��/���ذ�ť��,������������2����
        --�Զ����浱ǰ���ڱ༭������
        if string.len(get_text(PROCESS_SET2_SCREEN, ProcessSelectId)) ~= 0 then
            WriteProcessFile(0);
        end
    elseif control == ProcessSelectId then

    elseif (control-100) >= TabAction[1].selectId and (control-100) <= TabAction[12].selectId then--�����"����ѡ��"����İ�ťʱ
        action_select_set(PROCESS_SET2_SCREEN, control-100);
    elseif control >= TabAction[1].EditId and control <= TabAction[12].EditId then--�����"�༭"��ťʱ
        if string.len( get_text(PROCESS_SET2_SCREEN, control+100) ) ~= 0 then--��������˶�������(�༭��ť��id+100���ڶ�������id)
            set_edit_screen(get_text(PROCESS_SET2_SCREEN, control+200), PROCESS_SET2_SCREEN, control);--control+200��ʾ��Ӧ��"����ѡ��"id
        end
    end
end


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set3_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- ����
        if string.len(get_text(PROCESS_SET3_SCREEN, ProcessSelectId)) == 0 then
            set_visiable(PROCESS_SET3_SCREEN, ProcessSelectTipsTextId, 1);--��ʾ��ʾ��Ϣ
        else
            set_visiable(PROCESS_SET3_SCREEN, ProcessSelectTipsTextId, 0);--������ʾ��Ϣ
            --�ֶ����浱ǰ���ڱ༭������
            WriteProcessFile(0);
        end
    elseif (control-100) >= TabAction[13].selectId and (control-100) <= TabAction[24].selectId then--�����"����ѡ��"����İ�ťʱ
        action_select_set(PROCESS_SET3_SCREEN, control-100);
    elseif control >= TabAction[13].EditId and control <= TabAction[24].EditId then--�����"�༭"��ťʱ
        if string.len( get_text(PROCESS_SET3_SCREEN, control+100) ) ~= 0 then--��������˶�������(�༭��ť��id+100���ڶ�������id)
            set_edit_screen(get_text(PROCESS_SET3_SCREEN, control+200), PROCESS_SET3_SCREEN, control);--control+200��ʾ��Ӧ��"����ѡ��"id
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
    set_text(PROCESS_SET3_SCREEN, ProcessSelectId, get_text(PROCESS_SET2_SCREEN,ProcessSelectId));
end




--[[-----------------------------------------------------------------------------------------------------------------
    ��������-��ʼ
--------------------------------------------------------------------------------------------------------------------]]
--�������ӽ�����("��ʼ/ȡ��/����/......"),ȷ�ϰ�ť��id����99,ȡ����ť��id����98.
SureButtonId = 99;--ȷ�ϰ�ť
CancelButtonId = 98;--ȡ����ť
DestScreen = nil;
DestControl = nil;
DestActionNum = 0;--ָ��ǰ�������

AnalysisTypeMenuId = 4;
AnalysisTypeTextId = 7;
ResetSystemButtonId = 5;--�Ƿ�Ӳ����λ


--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function set_screen_actionNumber(screen,actionNumber)
    DestScreen = screen;
    DestActionNum = actionNumber;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_start_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end



--[[-----------------------------------------------------------------------------------------------------------------
    ��������-ȡ��
--------------------------------------------------------------------------------------------------------------------]]


GetSample_BtStartId = 1;--ȡ�������а�ť��ʼid
GetSample_BtEndId = 34; --ȡ�������а�ť����id
GetSample_Out1EnableId = 1;--ȡ�����������1ʹ�ܰ�ťid (GS->GetSample)
GS_OUT1_Valve1Id = 2;--���1�з�1��id
GS_OUT1_Valve16Id= 17;--���1�з�16��id

GS_OUT2_EnableId = 18;--ȡ�����������1ʹ�ܰ�ťid (GS->GetSample)
GS_OUT2_Valve1Id = 19;--���1�з�1��id
GS_OUT2_Valve16Id= 34;--���1�з�16��id

GetSample_Out1WaitTimeId = 35;--���1�ȴ�ʱ��
GetSample_Out2WaitTimeId = 36;--���1�ȴ�ʱ��

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_get_sample_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end



--[[-----------------------------------------------------------------------------------------------------------------
    ��������-ע��ü�Һ
--------------------------------------------------------------------------------------------------------------------]]

INJECT_VALCO_EnableId = 1;--ʮͨ��ʹ��
INJECT_VALCO_ChannelId = 40;--ʮͨ��ͨ����
INJECT_VALCO_WaitTimeId = 41;--ʮͨ���ȴ�ʱ��
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
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_inject_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
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
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end



--[[-----------------------------------------------------------------------------------------------------------------
    ��������-����
--------------------------------------------------------------------------------------------------------------------]]

DISPEL_BtStartId = 1;
DISPEL_BtEndId = 23;
DISPEL_TextStartId = 24;
DISPEL_TextEndId = 46;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_dispel_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
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
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������-����
--------------------------------------------------------------------------------------------------------------------]]

CALCULATE_BtStartId = 1;
CALCULATE_BtEndId = 3;
CALCULATE_TextStartId = 4;
CALCULATE_TextEndId = 9;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_calculate_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    ��������-������
--------------------------------------------------------------------------------------------------------------------]]

VALVE_BtStartId = 1;
VALVE_BtEndId = 18;
VALVE_TextStartId = 19;
VALVE_TextEndId = 23;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_valve_ctrl_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������-�ȴ�ʱ��
--------------------------------------------------------------------------------------------------------------------]]

WAITTIME_TextId = 1;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_wait_time_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        WriteProcessFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end


--[[-----------------------------------------------------------------------------------------------------------------
    ����ѡ��
--------------------------------------------------------------------------------------------------------------------]]

AnalysisButtonId = 1;--������ť
NullButtonId = 8;--�հ�ť

ProcessItem = {"����","У��","��ϴ","��·���","���˲�","�����˲�","��Ⱥ˲�"," "};
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
			set_text(DestScreen, DestControl, ProcessItem[ProcessSelectItem]);--DestControl��Ӧ����ѡ��
			if DestScreen == PROCESS_SET1_SCREEN  then
				set_text(DestScreen, DestControl-100, ProcessItem[ProcessSelectItem]);--DestControl-100��Ӧ��������
            end
		end
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
                ReadProcessFile(0);
            elseif DestScreen == RUN_CONTROL_SCREEN then --����ǻص����п��ƽ���,�򱣴��ļ���Ϊ0"�������ļ�
                process_change(DestControl);--���̸ı��,ͨ�����øú����޸����̶�Ӧ��id��
                WriteConfigFile(2);--2��Ӧ<RunCtrl>��ǩ
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
    NumberOfProcess = 0;
    for i = 1, 12, 1 do
        if string.len(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId)) ~= 1 and 
           string.len(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId)) ~= 0 then--��ȡ���Ƴ���,�����Ƴ��Ȳ�Ϊ0ʱ��ʾ��Ч
            NumberOfProcess = NumberOfProcess + 1;--����+1
            set_visiable(PROCESS_SELECT2_SCREEN, NumberOfProcess,  1);--��ʾidΪNumberOfProcess���ı�
            set_text(PROCESS_SELECT2_SCREEN, NumberOfProcess, get_text(PROCESS_SET1_SCREEN,TabProcess[i].nameId))--Ϊ���ı�����������
            set_visiable(PROCESS_SELECT2_SCREEN,100+NumberOfProcess,1);--��ʾ����ı����Ӧ�İ�ť
        end
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
ActionItem = {"��ʼ","ȡ��","ע��ü�Һ��","��ȡ�ź�","�䶯�ü�Һ","����","�ȴ�ʱ��","����","������"," "};
ActionSelectItem = nil;


--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function action_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function action_select_control_notify(screen,control,value)
    if control >= ActionStartButtonId and control <= ActionEndButtonId then --��������ѡ��ť
        ActionSelectItem = control;
    elseif control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
        if ActionSelectItem ~= nil then
            set_text(DestScreen, DestControl, ActionItem[ActionSelectItem]);--����ѡ��
            set_text(DestScreen, DestControl-100, ActionItem[ActionSelectItem]);--DestControl-100��Ӧ��������
        end
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������
--------------------------------------------------------------------------------------------------------------------]]

--����������/����ѡ�������,����1/2/3�ı���id����һ����
Range1LowId = 64;--����1�ı�id
Range1HighId = 65;--����1�ı�id
Range2LowId = 77;--����2�ı�id
Range2HighId = 78;--����2�ı�id
Range3LowId = 115;--����3�ı�id
Range3HighId = 116;--����3�ı�id

UniteSetMenuId = 17;--��λѡ��
UniteSetTextId = 15--��λ���óɹ���,������ʾ��λ�ı���id

RangeTab = {
    [1] = {LowId = 64, HighId = 65, densityCalLowId = 81, densityCalHighId = 84, aId = 48, bId = 49, cId = 50, dId = 51},
    [2] = {LowId = 77, HighId = 78, densityCalLowId = 67, densityCalHighId = 70, aId = 52, bId = 53, cId = 54, dId = 55 },
    [3] = {LowId = 115,HighId= 116, densityCalLowId = 105,densityCalHighId = 108,aId = 92, bId = 93, cId = 94, dId = 95},
};

--���õ�λ
function set_unit()
    local Unite = get_text(RANGE_SET_SCREEN, UniteSetTextId);
    --�������ý�����,�ؼ�Id = 200 ~ 208Ϊ��λ��ʾ�ı�
    for i = 200,208,1 do 
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
    set_text(RANGE_SELECT_SCREEN, Range1LowId,  get_text(RANGE_SET_SCREEN,64));
    set_text(RANGE_SELECT_SCREEN, Range1HighId, get_text(RANGE_SET_SCREEN,65));
    set_text(RANGE_SELECT_SCREEN, Range2LowId,  get_text(RANGE_SET_SCREEN,77));
    set_text(RANGE_SELECT_SCREEN, Range2HighId, get_text(RANGE_SET_SCREEN,78));
    set_text(RANGE_SELECT_SCREEN, Range3LowId,  get_text(RANGE_SET_SCREEN,115));
    set_text(RANGE_SELECT_SCREEN, Range3HighId, get_text(RANGE_SET_SCREEN,116));
end


--[[-----------------------------------------------------------------------------------------------------------------
    �ֶ�����1
--------------------------------------------------------------------------------------------------------------------]]

Valve16BtId = 67;
Valve16Close = {53,0,0,0,0,154,127};
Valve16Open  = {53,0,1,0,0,155,239};
Valve16Close[0] = 224;
Valve16Open[0] = 224;
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
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
    �ֶ�����2
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    �ֶ�����3
--------------------------------------------------------------------------------------------------------------------]]




--[[-----------------------------------------------------------------------------------------------------------------
    �ֶ�����4
--------------------------------------------------------------------------------------------------------------------]]





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
maintainerPwdSetId = 50;
administratorPwdSetId = 51;
EquipmentTypeSetId = 60;
EquipmentTypeTextId = 900;--ÿ�������е������ͺ�id����11
OperatorLoginId = 72;
maintainerLoginId = 47;
administratorLoginId = 48;

PwdSetTab = {
    [maintainerPwdSetId] = {userName = "��άԱ"},
    [administratorPwdSetId] = {userName = "����Ա"}
};

LoginTab = {
    [OperatorLoginId] = {userName = "����Ա"},
    [maintainerLoginId] = {userName = "��άԱ"},
    [administratorLoginId] = {userName = "����Ա"}
};


--���������ͺ�
function set_equipment_type()
    for i = 1,16,1 do
        set_text(PublicTab[i], EquipmentTypeTextId, get_text(SYSTEM_INFO_SCREEN,EquipmentTypeSetId));
    end
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function system_info_control_notify(screen,control,value)
    if control == EquipmentTypeSetId then
        set_equipment_type();
    elseif control == maintainerPwdSetId or control == administratorPwdSetId then--��άԱ�����Ա�������ð�ť
        password_set_set(PwdSetTab[control].userName);
    elseif control == OperatorLoginId or control == maintainerLoginId or control == administratorLoginId then--����Ա/��άԱ/����Ա�������ð�ť
        login_system_set(LoginTab[control].userName);
        change_screen(LOGIN_SYSTEM_SCREEN);

    end
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��������
--------------------------------------------------------------------------------------------------------------------]]

UserNameId = 26;

--�ú�����on_control_notify�н��е���,�����ϵͳ��Ϣ�е�����������ذ�ťʱ���øú���
function password_set_set(user)
    userName = user;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function password_set_control_notify(screen,control,value)

end


--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_PasswordSet()
    set_text(PASSWORD_SET_SCREEN, UserNameId, userName);
end

--[[-----------------------------------------------------------------------------------------------------------------
    ��¼ϵͳ
--------------------------------------------------------------------------------------------------------------------]]


--�ú�����on_control_notify�н��е���,�����ϵͳ��Ϣ�е�����������ذ�ťʱ���øú���
function login_system_set(user)
    userName = user;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function login_system_control_notify(screen,control,value)
    
end

--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_LoginSystem()
    set_text(LOGIN_SYSTEM_SCREEN, UserNameId, userName);
end



--[[-----------------------------------------------------------------------------------------------------------------
    �����ļ�������غ���
--------------------------------------------------------------------------------------------------------------------]]

cfgFileTab = {
    [1] = {sTag = "<ProcessSet>",eTag = "</ProcessSet>"};--��������1�����еĲ������������tag��
    [2] = {sTag = "<RunControl>",eTag = "</RunControl>"};--���п��ƽ����еĲ������������tag��
};
--***********************************************************************************************
--���������ļ�,��������"0"�ļ���
--tagNum = 1 : �޸��������ý����еĲ���
--tagNum = 2 : �޸����п��ƽ����еĲ���
--***********************************************************************************************
function WriteConfigFile(tagNum)
    local configFile = io.open("0", "a+");        --�Ը���д��ķ�ʽ���ı�
    configFile:seek("set");                       --���ļ�λ�ö�λ����ͷ
    local fileString = configFile:read("a");      --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
    configFile:close();                           --�ر��ļ�

    configFile = io.open("0", "w+");         --�򿪲���ո��ļ�
    fileString = DeleteSubString(fileString, cfgFileTab[tagNum].sTag, cfgFileTab[tagNum].eTag);--ɾ��ָ���ı�ǩ����
    configFile:write(fileString);                 --���������ԭ�ļ���������д���ļ�
    configFile:write(cfgFileTab[tagNum].sTag);
    if tagNum == 1 then--��������1�����еĲ���
        for i=1,12,1 do
            configFile:write(get_text(PROCESS_SET1_SCREEN, TabProcess[i].selectId)..",".. --��������ѡ��
                             get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId)..","..   --��������
                             get_text(PROCESS_SET1_SCREEN, TabProcess[i].rangeId)..",");  --��������
        end
    elseif tagNum == 2 then--���п��ƽ����еĲ���
        for i = RUNCTRL_TextStartId, RUNCTRL_TextEndId,1 do
            configFile:write(get_text(RUN_CONTROL_SCREEN,i)..",");
        end
    end
    configFile:write(cfgFileTab[tagNum].eTag);
    configFile:close(); --�ر��ı�
end


--***********************************************************************************************
--��ȡ�����ļ��е�����
--***********************************************************************************************
function ReadConfigFile(tagNum)
	local configFile = io.open("0", "r")      --���ı�
    if configFile == nil then--���û�и��ļ��򷵻�
        --����һ��Ĭ�������ļ�
        WriteConfigFile(1);
        WriteConfigFile(2);
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
    if tagNum == 1 then--��������1�����еĲ���
        for i=1,12,1 do
            set_text(PROCESS_SET1_SCREEN, TabProcess[i].selectId, tab[(i-1)*3+1]);  --��������ʾ���ı�����
            set_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId,   tab[(i-1)*3+2]);  --��������ʾ���ı�����
            set_text(PROCESS_SET1_SCREEN, TabProcess[i].rangeId,  tab[(i-1)*3+3]);  --��������ʾ���ı�����
        end
    elseif tagNum == 2 then
        for i = RUNCTRL_TextStartId, RUNCTRL_TextEndId,1 do
            set_text(RUN_CONTROL_SCREEN, i, tab[i])
        end
    end
end

--***********************************************************************************************
--������д�������ļ���,���ļ���WriteProcessFile�е���
--fileName:�����ļ�����:��Χ:1-12,��Ӧ12������(ÿ�����̶�Ӧһ�������ļ�)
--actionNumber:������ǩ,��Χ:action1~action24
--***********************************************************************************************
function WriteActionTag(fileName, actionNumber)
    local processFile = io.open(fileName, "a+");   --�Կɶ���д�ķ�ʽ���ı�,���û�и��ļ��򴴽�
    processFile:seek("set");                       --���ļ�λ�ö�λ����ͷ
    local fileString = processFile:read("a");      --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
    processFile:close();                           --�ر��ļ�

    processFile = io.open(fileName, "w+");         --�򿪲���ո��ļ�
    fileString = DeleteSubString(fileString, "<action"..actionNumber..">", "</action"..actionNumber..">");--��ԭ����<action?>-</action?>��ǩ֮����ַ���ɾ��
    processFile:write(fileString);                 --���������ԭ�ļ�������дд���ļ�

    local actionType
    if actionNumber == 0 then
        actionType = get_text(PROCESS_SET2_SCREEN, ProcessSelectId);--��ǰ��������
    elseif actionNumber >= 1 and actionNumber <= 12 then
        actionType = get_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].selectId);--��ȡ��ǰ��������
    elseif actionNumber >= 13 and actionNumber <= 24 then 
        actionType = get_text(PROCESS_SET3_SCREEN, TabAction[actionNumber].selectId);--��ȡ��ǰ��������
    end

    processFile:write("<action"..actionNumber..">");--д�뿪ʼ��ǩ
    processFile:write("<type>"..actionType.."</type>");--д�붯������:��ʼ/ȡ��/����......
    processFile:write("<content>");
    --------------------------------д<action0>��ǩ����---------------------------------------------
    --<action0>��ǩ����Ķ��Ǹ�������,��Ӧ����������2/3�����еĶ���ѡ��/��������
    if actionNumber == 0 then
        for i=1,12,1 do
            processFile:write(get_text(PROCESS_SET2_SCREEN, TabAction[i].selectId)..",".. --��������ѡ��
                              get_text(PROCESS_SET2_SCREEN, TabAction[i].nameId  )..","); --��������
        end
        for i=13,24,1 do
            processFile:write(get_text(PROCESS_SET3_SCREEN, TabAction[i].selectId)..",".. --��������ѡ��
                              get_text(PROCESS_SET3_SCREEN, TabAction[i].nameId  )..","); --��������
        end
    --------------------------------д��ʼ�������----------------------------------------------------
    elseif actionType == ActionItem[1] then 
        processFile:write(get_text(PROCESS_START_SCREEN, AnalysisTypeTextId)..","..--��������
                          get_value(PROCESS_START_SCREEN,ResetSystemButtonId)..",");--�Ƿ�Ӳ����λ
    --------------------------------дȡ���������----------------------------------------------------
    elseif actionType == ActionItem[2] then 
        for i = GetSample_BtStartId, GetSample_BtEndId, 1 do
            processFile:write(get_value(PROCESS_GET_SANPLE_SCREEN, i)..",");--д�����1��ťֵ
        end
        processFile:write(get_text(PROCESS_GET_SANPLE_SCREEN, GetSample_Out1WaitTimeId)..",");--д�����1�ȴ�ʱ��
        processFile:write(get_text(PROCESS_GET_SANPLE_SCREEN, GetSample_Out2WaitTimeId));--д�����2�ȴ�ʱ��
    --------------------------------дע��ü�Һ����--------------------------------------------------
    elseif actionType == ActionItem[3] then
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            processFile:write(get_value(PROCESS_INJECT_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            processFile:write(get_text(PROCESS_INJECT_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-��ȡ�źŲ���----------------------------------------------------
    elseif actionType == ActionItem[4] then 
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            processFile:write(get_text(PROCESS_READ_SIGNAL_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-�䶯�ü�Һ����--------------------------------------------------
    elseif actionType == ActionItem[5] then 
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            processFile:write(get_value(PROCESS_PERISTALTIC_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            processFile:write(get_text(PROCESS_PERISTALTIC_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-�������--------------------------------------------------------
    elseif actionType == ActionItem[6] then 
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            processFile:write(get_value(PROCESS_CALCULATE_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            processFile:write(get_text(PROCESS_CALCULATE_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-�ȴ�ʱ�����----------------------------------------------------
    elseif actionType == ActionItem[7] then 
        processFile:write(get_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId));
    --------------------------------д-�������--------------------------------------------------------
    elseif actionType == ActionItem[8] then 
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            processFile:write(get_value(PROCESS_DISPEL_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            processFile:write(get_text(PROCESS_DISPEL_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-����������------------------------------------------------------
    elseif actionType == ActionItem[9] then 
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            processFile:write(get_value(PROCESS_VALVE_CTRL_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            processFile:write(get_text(PROCESS_VALVE_CTRL_SCREEN, i)..",");--д���ı�ֵ
        end
    --------------------------------д-�ղ�������------------------------------------------------------
    elseif actionType == ActionItem[10] then 
        processFile:write("<content> </content>");
    end
    processFile:write("</content>");
    processFile:write("</action"..actionNumber..">");--д�������ǩ
    processFile:close(); --�ر��ı�
end

--***********************************************************************************************
--���浥�����������ļ�,ÿ�����̶���һ����Ӧ�������ļ�,�ļ���Ϊ�������ڱ���е����
--actionNumber:������ǩ,��Χ:action1~action24
--***********************************************************************************************
function WriteProcessFile(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcessSelectId);--��ȡ��������

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId),processName ,1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            WriteActionTag(i, 0);--�޸�<action0>��ǩ�е�����
            WriteActionTag(i, actionNumber);--�������ݵ��ļ���,�ļ���Ϊ1~12, ���������Ϊaction0~action12��ǩ
        end
    end
end

--***********************************************************************************************
--���ض�������,����������2/3�������༭��ťʱ,����øú���,��ȡ��ǰ����
--actionNumber:��ǰ����Ϊ�ڼ���
--***********************************************************************************************
function ReadProcessFile(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcessSelectId);--��ȡ��������
    local fileName = 0;
    for i=1,12,1 do--ѭ�����ҵ�ǰ�������ƶ�Ӧ�����.
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId),processName ,1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            fileName = i;
            break;
        end
    end

    local processFile = io.open(fileName, "r");      --���ı�
    if processFile == nil then--��û�и��ļ�,�򴴽�һ���µ������ļ�,������
        --����������2/3�������
        for i = TabAction[1].selectId,TabAction[12].selectId,1 do
            set_text(PROCESS_SET2_SCREEN, i," ");    --����Ӧ����ѡ����ı���ʾΪ�ո�
            set_text(PROCESS_SET2_SCREEN, i-100," ");--����Ӧ�������Ƶ��ı���ʾΪ�ո�
            set_text(PROCESS_SET3_SCREEN, i," ");    --����Ӧ����ѡ����ı���ʾΪ�ո�
            set_text(PROCESS_SET3_SCREEN, i-100," ");--����Ӧ�������Ƶ��ı���ʾΪ�ո�
        end
        WriteProcessFile(0);
        return
    end

	processFile:seek("set");                        --���ļ�λ�ö�λ����ͷ
	fileString = processFile:read("a");             --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
    processFile:close();                            --�ر��ı�

    actionString = GetSubString(fileString, "<action"..actionNumber..">", "</action"..actionNumber..">");--��ȡfileInfo�ļ���<action?> ~ </action?>��ǩ֮����ַ���
    if actionString == nil then--����ļ���û�иñ�ǩ,�򷵻�.
        return 
    end
    
    actionType = GetSubString(actionString, "<type>","</type>");--��ȡactionString�ַ�����<type>��ǩ֮����ַ���,��ȡ��������
    actionTab = GetSubString(actionString,"<content>","</content>");--�ٽ�ȡ<content>��ǩ�е�����
    if actionTab == nil then--���û������,�������������2/3�����еĶ���ѡ���붯������
        return;
    end
    tab = split(actionTab, ",");--�ָ��ַ���
    if actionNumber == 0 then --�ж�λ<action0>��ǩ
        for i=1,12,1 do
            set_text(PROCESS_SET2_SCREEN, TabAction[i].selectId, tab[(i-1)*2+1]);  --��������ʾ���ı�����
            set_text(PROCESS_SET2_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]);   --��������ʾ���ı�����
        end
        for i=13,24,1 do
           set_text(PROCESS_SET3_SCREEN, TabAction[i].selectId, tab[(i-1)*2+1]);  --��������ʾ���ı�����
           set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]);  --��������ʾ���ı�����
        end
    --------------------------------��-��ʼ�������--------------------------------------------------
    elseif actionType == ActionItem[1] then
        set_text(PROCESS_START_SCREEN, AnalysisTypeTextId, tab[1]);
        set_value(PROCESS_START_SCREEN, ResetSystemButtonId, tab[2] );
    --------------------------------��-ȡ���������--------------------------------------------------
    elseif actionType == ActionItem[2] then 
        set_text(PROCESS_SET2_SCREEN,30, tab[1])
        for i = GetSample_BtStartId, GetSample_BtEndId, 1 do 
            set_value(PROCESS_GET_SANPLE_SCREEN, i, tab[i]);--tab��ǰ17��λ��ťֵ
        end
        set_text(PROCESS_GET_SANPLE_SCREEN, GetSample_Out1WaitTimeId, tab[35]);--��18��Ϊ���1�ȴ�ʱ��ֵ
        set_text(PROCESS_GET_SANPLE_SCREEN, GetSample_Out2WaitTimeId, tab[36]);--��36��Ϊ���2�ȴ�ʱ��ֵ
    --------------------------------��-ע��ü�Һ����-------------------------------------------------
    elseif actionType == ActionItem[3] then
        for i = INJECT_BtStartId, INJECT_BtEndId, 1 do
            set_value(PROCESS_INJECT_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = INJECT_TextStartId, INJECT_TextEndId, 1 do
            set_text(PROCESS_INJECT_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-��ȡ�źŲ���--------------------------------------------------
    elseif actionType == ActionItem[4] then
        for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
            set_text(PROCESS_READ_SIGNAL_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-�䶯�ü�Һ����------------------------------------------------
    elseif actionType == ActionItem[5] then 
        for i = PERISTALTIC_BtStartId, PERISTALTIC_BtEndId, 1 do
            set_value(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = PERISTALTIC_TextStartId, PERISTALTIC_TextEndId, 1 do
            set_text(PROCESS_PERISTALTIC_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-�������------------------------------------------------------
    elseif actionType == ActionItem[6] then 
        for i = CALCULATE_BtStartId, CALCULATE_BtEndId, 1 do
            set_value(PROCESS_CALCULATE_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = CALCULATE_TextStartId, CALCULATE_TextEndId, 1 do
            set_text(PROCESS_CALCULATE_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-�ȴ�ʱ�����--------------------------------------------------
    elseif actionType == ActionItem[7] then 
        set_text(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId, tab[1]);
    --------------------------------��-�������------------------------------------------------------
    elseif actionType == ActionItem[8] then 
        for i = DISPEL_BtStartId, DISPEL_BtEndId, 1 do
            set_value(PROCESS_DISPEL_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = DISPEL_TextStartId, DISPEL_TextEndId, 1 do
            set_text(PROCESS_DISPEL_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-����������------------------------------------------------------
    elseif actionType == ActionItem[9] then 
        for i = VALVE_BtStartId, VALVE_BtEndId, 1 do
            set_value(PROCESS_VALVE_CTRL_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = VALVE_TextStartId, VALVE_TextEndId, 1 do
            set_text(PROCESS_VALVE_CTRL_SCREEN, i, tab[i]);--д���ı�ֵ
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
         subString = " ";
    else
        subString = string.sub(str, e1+1, s2-1);
    end
    return subString  
end

--***********************************************************************************************
---�������ַ�����ɾ���ַ���1���ַ���2֮����ַ���,�������ַ���
-- @param str  ����ȡ�ַ�����  
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


