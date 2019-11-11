--�����г��˳��õĻص�����
--���๦�����Ķ�<<������LUA�ű�API.pdf>>
--����ʹ��visual code studio ����װBookmarks��vscode-lua���,ͨ����ͬĿ¼�µ�2300project.code-workspace�����ռ�鿴���ļ�.


--����Խ���id���к궨��
MAIN_SCREEN = 0;
RUN_CONTROL_SCREEN = 1;
PROCESS_SET1_SCREEN = 2;
PROCESS_SET2_SCREEN = 3;
PROCESS_SET3_SCREEN = 4;
PROCESS_INIT_SCREEN = 5;
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

BLANK_SPACE = " ";
PERIOD_PROCESS = 0;--��������
TIMED_PROCESS = 1;--��ʱ����

COLOR_METHOD = 0; --��ɫ��
ELEC_METHOD = 1;--�缫��

ENABLE = 1.0
DISABLE = 0.0

TipsTab = {
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
    pwdErr      = "���벻��ȷ",
};

WorkStatus = {
    run = "����",--��ʱϵͳ������������
    stop = "ֹͣ",
    readyRun = "����", --��ʱΪ�Զ����з�ʽ, ���ڵȴ�ʱ�䵽���Զ�������һ�����̵�״̬.
};

WorkType = {
    hand = "�ֶ�",--��������ť��,ִ��һ��
    auto = "�Զ�",--��������ť��,���Ը���ʱ���ж��Ƿ�������������붨ʱ����
    controlled = "����",--ͨ����λ������ָ����������.
}

SysUser = {
    operator = "����Ա",
    maintainer = "��άԱ",
    administrator = "����Ա",
}

Sys = {
    userName = SysUser.operator,--���ڱ��浱ǰ�û�
    status = 0,--ϵͳ״̬:��ӦWorkStatus�е�ֵ
    runType = 0,--���з�ʽ: ��ӦWorkType�е�ֵ
    analysisType = COLOR_METHOD,--��������
    
    handRunTimes = 0;--��¼���ֶ����д���

    periodStartDateTime,--�������̿�ʼʱ��

    periodicIndex = 1,--��������id, ���������ܹ����ĸ�, �ñ���ֵ�ķ�ΧΪ1-4.
    totalAction = 0,--���ж�������
    actionStep = 1,--ȡֵ��ΧΪ1-24,��Ӧ����������2/3�����еĹ�24������
    actionSubStep = 1,--�ñ������ڿ���"��ʼ��"ȡ��""����""ע��ü�Һ"�ȵ��Ӷ���.
    actionTotal = 0,--���еĶ�������,����ͨ��ͳ��<action>��ǩ���
    --actionIdTab�����˸������������,����SystemArg.actionIdTab[1] = 3, ��ʾ��һ����ִ�����Ϊ3��action, Ҳ��ζ�����Ϊ1/2��actionΪ�ո�(û������)
    actionIdTab = {[1] = 0,[2] = 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0,[7] = 0,[8] = 0, [9] = 0, [10] = 0,[11] = 0,[12] = 0,
                 [13]= 0,[14]= 0,[15]= 0,[16]= 0,[17]= 0,[18]= 0,[19]= 0,[20] = 0,[21] = 0,[22] = 0,[23] = 0,[24] = 0},

    actionNameTab = {[1] = 0,[2] = 0,[3] = 0,[4] = 0,[5] = 0,[6] = 0,[7] = 0,[8] = 0, [9] = 0, [10] = 0,[11] = 0,[12] = 0,
                 [13]= 0,[14]= 0,[15]= 0,[16]= 0,[17]= 0,[18]= 0,[19]= 0,[20] = 0,[21] = 0,[22] = 0,[23] = 0,[24] = 0},

    actionFunction,--����ָ����Ҫִ�еĶ�������,���� excute_init_process, excute_get_sample_process��
    actionString,--��ȡ���������ļ��е�action��ǩ��, ���ݱ��浽�ñ���
    actionType,--���ڱ���type��ǩ�е�����, ��ʾ�ö�����""��ʼ��""ȡ��""ע��ü�Һ"�ȵ�
    contentTabStr,--���ڱ���content��ǩ�е�����
    contentTab,  --���ڱ���content��ǩ�е�����,��ʱ�Ѿ�����split��contentTabStr�е����ݽ����˷ָ�

    currentProcessId = 0,--��ǰ����ִ�е�����,����Ӧ�ĵ����.
    processFileStr = nil,--����ȡ������ص������ļ���,���浽�ñ�������
    processName = nil ,--��������
    processStep = 1,--ִ������ʱ,��ֲ���, �����һ����ȡaction����,������������,ȷ��ִ�еĶ�������, �ڶ����Ϳ���ִ�ж���������
    isPeriodOrTimed = 0,--ʹ�øñ����ж����������̻��Ƕ�ʱ����

    startTime =  {year = 0, mon=0, day = 0, hour = 0, min = 0, sec = 0},--��ʼʱ��
    resultTime = {year = 0, mon=0, day = 0, hour = 0, min = 0, sec = 0},--���ʱ��
    dateTime =   {year = 0, mon=0, day = 0, hour = 0, min = 0, sec = 0},--ϵͳ����ʱ��,��1S��ʱ���в���ˢ��
}





--[[-----------------------------------------------------------------------------------------------------------------
    ��/ע���/�䶯�ÿ��ƺ���
--------------------------------------------------------------------------------------------------------------------]]

--***********************************************************************************************
--���Ƶ������ر�
--id : �����
--***********************************************************************************************
function close_single_valve(id)

end

--***********************************************************************************************
--���Ƶ�������
--id : �����
--***********************************************************************************************
function open_single_valve(id)

end

--***********************************************************************************************
--���ƶ�����ر�
--valveIdTab ��Tab����ʽ�����˶����Ҫ�رյķ�
--number ����valveIdTab�ĳ���
--***********************************************************************************************
function close_multi_valve(valveIdTab, number)
    
end

--***********************************************************************************************
--���ƶ������
--valveIdTab ��Tab����ʽ�����˶����Ҫ�رյķ�
--number ����valveTab�ĳ���
--***********************************************************************************************
function open_multi_valve(valveIdTab, number)
    
end


--***********************************************************************************************
--����ʮͨ��ת�����õ�ͨ����
--channel ʮͨ����ͨ����
--***********************************************************************************************
function control_valco(channel)
    
end

--***********************************************************************************************
--����ע���
--***********************************************************************************************
function control_inject(id, dir, speed, volume, wait)


end

--***********************************************************************************************
--�����䶯��
--***********************************************************************************************
function control_peristaltic(id, dir, speed, volume, wait)


end




--[[-----------------------------------------------------------------------------------------------------------------
    ��ں���
--------------------------------------------------------------------------------------------------------------------]]


--***********************************************************************************************
--��ʼ������,ϵͳ����LUA�ű����������ôλص�����
--***********************************************************************************************
function on_init()
    for i = 1,12,1 do
        set_text(PROCESS_SET1_SCREEN, TabProcess[i].selectId,BLANK_SPACE);
        set_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId,  BLANK_SPACE);
        set_text(PROCESS_SET2_SCREEN, TabAction[i].selectId,BLANK_SPACE);
        set_text(PROCESS_SET2_SCREEN, TabAction[i].nameId,BLANK_SPACE);
        set_text(PROCESS_SET3_SCREEN, TabAction[i+12].selectId,BLANK_SPACE);
        set_text(PROCESS_SET3_SCREEN, TabAction[i+12].nameId,BLANK_SPACE);
    end
    for i = 1,24,1 do
        set_text(RUN_CONTROL_SCREEN,TimedProcessTab[i].textId,BLANK_SPACE);
    end
    for i=1,4,1 do
        set_text(RUN_CONTROL_SCREEN,PeriodicTab[i].textId,BLANK_SPACE);
    end
    set_text(RUN_CONTROL_SCREEN,HandProcessTab[1].textId ,BLANK_SPACE);

    start_timer(0, 100, 1, 0) --������ʱ�� 0����ʱʱ�� 100ms,1->ʹ�õ���ʱ��ʽ,0->��ʾ�����ظ�
    uart_set_timeout(2000,1); --���ô��ڳ�ʱ, �����ܳ�ʱ2000ms, �ֽڼ����ʱ1ms
    SetSysUser(SysUser.operator);   --����֮��Ĭ��Ϊ����Ա

    ReadProcessFile(1);--������������1�����еĲ�������
    ReadProcessFile(2);--�������п��ƽ����еĲ�������

    if record_get_count(SYSTEM_INFO_SCREEN,6) == 0 then --��ʾ��δ���ó�ʼ����
        record_add(SYSTEM_INFO_SCREEN, pwdRecordId, "171717");--��άԱ�����Ա��Ĭ�����붼��171717
        record_add(SYSTEM_INFO_SCREEN, pwdRecordId, "171717");--��άԱ�����Ա��Ĭ�����붼��171717
    end
end

--***********************************************************************************************
--��ʱ����ʱ��ִ�д˻ص�����,��ʱ����� 0~31
--***********************************************************************************************
function on_timer(timer_id)
    if  timer_id == 0 then --��ʱ��0,��ʱʱ�䵽
        if Sys.status == WorkStatus.run then
            excute_process();
        end
    elseif timer_id == 1 then--���ڳ�ʱ
        uart_time_out();
    end
end

--***********************************************************************************************
--��ʱ�ص�������ϵͳÿ��1�����Զ����á�
--***********************************************************************************************
function on_systick()
    Sys.dateTime.year,Sys.dateTime.mon,Sys.dateTime.day,
    Sys.dateTime.hour,Sys.dateTime.min,Sys.dateTime.sec = get_date_time();--��ȡ��ǰʱ��
    
    if Sys.status == WorkStatus.readyRun then           --��ϵͳ���ڴ���״̬ʱ,
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
    ShowSysTips(TipsTab.insertUsb);
    UsbPath = dir;
end

--***********************************************************************************************
--�γ� U �̺�ִ�д˻ص�����
--***********************************************************************************************
function on_usb_removed()
    ShowSysTips(TipsTab.pullOutUSB);
end

--***********************************************************************************************
--���� SD ����ִ�д˻ص�����
--***********************************************************************************************
function on_sd_inserted(dir)
    ShowSysTips(TipsTab.insertSd);
    SdPath = dir;
end

--***********************************************************************************************
--�γ� SD ����ִ�д˻ص�����
--***********************************************************************************************
function on_sd_removed()
    ShowSysTips(TipsTab.pullOutUSB);
end


--[[-----------------------------------------------------------------------------------------------------------------
    �����շ�
--------------------------------------------------------------------------------------------------------------------]]

--����ȫ�ֱ���uart_free_protocol��ʹ�����ɴ���Э��
uart_free_protocol = 1;

uartSendTab = {
    openV11 = {[0] = 0xE0, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "����11"},--len = 6
    openV12 = {[0] = 0xE0, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, len = 6, note = "����12"},--len = 6
}

REPLY_OK = 0;
REPLY_FAIL = 1;
NO_NEED_REPLY = 0;
NEED_REPLY = 1;--��Ҫ�ظ�

UartArg = {
    lock = 0,--�ڷ��ʹ�������ʱ,����ʱ��������
    repeat_times = 0,--���ڼ�¼�ط�����
    repeat_data ,--���ڱ��汾���ط�����
    reply_data = {[0] = 0, [1] = 0},--���ڱ�����Ҫ���ܵ��Ļظ�����
    reply_flag,--����ָʾ�����Ƿ�ظ��ɹ�
};

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


--***********************************************************************************************
--���ڽ��ܺ��� 
--���ڲ�����Ϊ38400, ����1bit��Ҫ 1000000/38400 = 26us, ����һ���ֽڵ�������Ҫ10bit,����1Byte������Ҫ260us
--***********************************************************************************************
function on_uart_recv_data(packet)

    local rev_len = 0;
    for i=0,20,1 do
        rev_len = i;
        if packet[i] == nil then
            break;
        end
    end

    if packet[0] == UartArg.reply_data[0] and packet[1] == UartArg.reply_data[1] then--���ܵ����ݻظ�
        UartArg.reply_flag = REPLY_OK;
        UartArg.lock = 0;--��������
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
    if UartArg.lock == 1 then
        return;
    end
    if reply == NEED_REPLY then --��ʾ��Ҫ�ȴ��ظ�
        start_timer(1, 3000, 1, 0); --������ʱ��1����ʱʱ�� 3s, 1->ʹ�õ���ʱ��ʽ,1->��ʾִֻ��һ��
        UartArg.lock = 1;      --����������,�ݲ���ʹ�ô��ڷ�������
        UartArg.reply_flag = REPLY_FAIL;
        UartArg.repeat_data = packet;
        UartArg.reply_data[0] = packet[0];
        UartArg.reply_data[1] = packet[1];
    end
    
    packet[packet.len], packet[packet.len+1] = CalculateCRC16(packet, packet.len);
    uart_send_data(packet) --����ָ��

    local UartDateTime =  string.format("%02d-%02d %02d:%02d",Sys.dateTime.mon,Sys.dateTime.day,Sys.dateTime.hour,Sys.dateTime.min);
    local UartData = "";--����Ҫ���͵����ݱ��浽���ַ�����
    for i=0, packet.len+1, 1 do
        UartData = UartData..string.format("%02x ", packet[i]);
    end
    record_add(HAND_OPERATE4_SCREEN, UartRecordId, "TX;"..UartDateTime..";"..UartData..";"..packet.note);--���ͨ�ż�¼
end


--***********************************************************************************************
--���뵽�ú�����ʾ����һ���ظ���ʱ, ��Ϊ����ظ��ɹ�, ��on_uart_recv_data�����оͻ�ֹͣ��ʱ��1,�Ͳ�����뵽�ú���
--***********************************************************************************************
function uart_time_out()
    UartArg.repeat_times = UartArg.repeat_times + 1;
    if UartArg.repeat_times <= 3 then
        UartArg.lock = 0;
        on_uart_send_data(UartArg.repeat_data, NEED_REPLY);--�����ط�
    else  --�ط����ζ�û�лظ�,�����ط�
        UartArg.repeat_times = 0;
        UartArg.reply_flag = REPLY_FAIL;
        stop_timer(1)--ֹͣ��ʱ��ʱ��
    end
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
        if status == WorkStatus.stop or status == WorkStatus.readyRun then
            set_text(PublicTab[i], SysCurrentActionId, "��");
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
        if get_value(RUN_CONTROL_SCREEN,control) == 1.0 then      --��ť����,��ʱϵͳ״̬��Ϊ����
            SetSysWorkStatus(WorkStatus.readyRun);--����Ϊ����״̬
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
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId), get_text(RUN_CONTROL_SCREEN, control), 1) ~= nil then
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
    if Sys.status == WorkStatus.run then--��ǰ״̬Ϊ����,ֱ�ӷ���; ���Ϊֹͣ���ߴ������������ִ��.
        return Sys.currentProcessId;
    end

    --------------------------�ֶ�ģʽ ,����Ƚϼ�,ֻ��һ�����̿�����--------------------------------
    if Sys.runType == WorkType.hand then 
        processId = HandProcessTab[1].processId;
    ----------------------�Զ�ģʽ  �Զ�ģʽ�еĶ�ʱʱ�����˻�ֱ������������--------------------------
    elseif Sys.runType == WorkType.auto then 

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
    elseif Sys.runType == WorkType.controlled then 

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
        set_enable(PROCESS_SET1_SCREEN, TabProcess[i].selectId ,state);
        set_enable(PROCESS_SET1_SCREEN, TabProcess[i].nameId   ,state);
        set_enable(PROCESS_SET1_SCREEN, TabProcess[i].rangeId  ,state);
        set_enable(PROCESS_SET1_SCREEN, TabProcess[i].deleteId ,state);

        set_enable(PROCESS_SET2_SCREEN, TabAction[i].selectId, state);
        set_enable(PROCESS_SET2_SCREEN, TabAction[i].nameId,   state);

        set_enable(PROCESS_SET3_SCREEN, TabAction[i+12].selectId, state);
        set_enable(PROCESS_SET3_SCREEN, TabAction[i+12].nameId,   state);
    end

--------------------------------��ʼ����������޸�---------------------------------------------
    for i = INIT_BtStartId, INIT_TextEndId, 1 do
        set_enable(PROCESS_INIT_SCREEN, i, state)
    end
--------------------------------ȡ���������----------------------------------------------------
    for i = GetSample_BtStartId, GetSample_BtEndId, 1 do
        set_enable(PROCESS_GET_SANPLE_SCREEN, i, state);
    end
    set_enable(PROCESS_GET_SANPLE_SCREEN, GetSample_Out1WaitTimeId, state);
    set_enable(PROCESS_GET_SANPLE_SCREEN, GetSample_Out2WaitTimeId, state);
-------------------------------ע��ü�Һ����--------------------------------------------------
    for i = INJECT_BtStartId, INJECT_TextEndId, 1 do
        set_enable(PROCESS_INJECT_SCREEN, i, state);
    end
--------------------------------��ȡ�źŲ���----------------------------------------------------
    for i = ReadSignal_TextStartId, ReadSignal_TextEndId, 1 do
        set_enable(PROCESS_READ_SIGNAL_SCREEN, i, state)
    end
--------------------------------�䶯�ü�Һ����--------------------------------------------------
    for i = PERISTALTIC_BtStartId, PERISTALTIC_TextEndId, 1 do
        set_enable(PROCESS_PERISTALTIC_SCREEN, i, state)
    end
-------------------------------�������--------------------------------------------------------
    for i = CALCULATE_BtStartId, CALCULATE_TextEndId, 1 do
        set_enable(PROCESS_CALCULATE_SCREEN, i, state)
    end
--------------------------------�ȴ�ʱ�����----------------------------------------------------
    set_enable(PROCESS_WAIT_TIME_SCREEN, WAITTIME_TextId, state)
--------------------------------��ֹ-�������--------------------------------------------------------
    for i = DISPEL_BtStartId, DISPEL_TextEndId, 1 do
        set_enable(PROCESS_DISPEL_SCREEN, i, state)
    end
--------------------------------����������------------------------------------------------------
    for i = VALVE_BtStartId, VALVE_TextEndId, 1 do
        set_enable(PROCESS_VALVE_CTRL_SCREEN, i, state)
    end
    ----------------------------���ϸ������е�""ȷ��"��ť-----------------------------------------
    set_enable(PROCESS_INIT_SCREEN, SureButtonId, state)
    set_enable(PROCESS_GET_SANPLE_SCREEN, SureButtonId, state)
    set_enable(PROCESS_INJECT_SCREEN, SureButtonId, state)
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
        SetSysWorkStatus(WorkStatus.run);                 --���ù���״̬Ϊ����
        set_process_edit_state(DISABLE);                  --��ֹ����������صĲ���
        ReadProcessFile(1);                               --��ȡ�������ý�������еĲ���
        ReadProcessFile(2);                               --��ȡ���п��ƽ�������еĲ���
        ReadActionFile(Sys.currentProcessId);       --��ȡ���������ļ�,��Ҫ���������������2/3 �Լ���ʼ/ȡ��/ע��ü�Һ/�䶯�ü�Һ/����/�������Ƚ���Ĳ���
        if Sys.isPeriodOrTimed == PERIOD_PROCESS then
            set_process_start_date_time(Sys.dateTime.year, Sys.dateTime.mon, Sys.dateTime.day, Sys.dateTime.hour, Sys.dateTime.min);--���ñ������̿�ʼʱ��
        end
        Sys.actionStep = 1;                         --���в��趼�Ǵ�1��ʼ
        Sys.actionSubStep = 1;
        Sys.handRunTimes = 0;
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
        Sys.actionType    = GetSubString(Sys.actionString, "<type>","</type>");--��������
        Sys.contentTabStr = GetSubString(Sys.actionString,"<content>","</content>");--�ٽ�ȡ<content>��ǩ�е�����
        Sys.contentTab    = split(Sys.contentTabStr, ",");--�ָ��ַ���,�����ַ�������tab����
        --Sys.startTime.year,Sys.startTime.mon,Sys.startTime.day,Sys.startTime.hour,Sys.startTime.min--��ȡ��ǰʱ��
        Sys.startTime = Sys.dateTime;
        ShowSysCurrentAction( Sys.processName..":"..Sys.actionNameTab[Sys.actionStep]);--��ʾ��������-��������
        if Sys.actionType == ActionItem[1] then 
            Sys.actionFunction = excute_init_process;--ִ�� ��ʼ����
        elseif Sys.actionType == ActionItem[2] then 
            Sys.actionFunction = excute_get_sample_process;--ִ�� ȡ������
        elseif Sys.actionType == ActionItem[3] then
            Sys.actionFunction = excute_inject_process;--ִ�� ע��ü�Һ����
        elseif Sys.actionType == ActionItem[4] then 
            Sys.actionFunction = excute_read_signal_process;--ִ��-��ȡ�ź�����
        elseif Sys.actionType == ActionItem[5] then 
            Sys.actionFunction = excute_peristaltic_process--ִ��-�䶯�ü�Һ����
        elseif Sys.actionType == ActionItem[6] then 
            Sys.actionFunction = excute_calculate_process;--ִ��-��������
        elseif Sys.actionType == ActionItem[7] then 
            Sys.actionFunction = excute_wait_time_process;--ִ��-�ȴ�ʱ������
        elseif Sys.actionType == ActionItem[8] then 
            Sys.actionFunction = excute_dispel_process;--ִ��-��������
        elseif Sys.actionType == ActionItem[9] then 
            Sys.actionFunction = excute_valve_ctrl_process;--ִ��-����������
        end
        Sys.actionSubStep = 1;--�����̴ӵ�һ����ʼִ��
        Sys.processStep = Sys.processStep + 1;
    --------------------------------------------------------------------------------------------------
    --�ڶ���: ִ�������̺���
    elseif Sys.processStep == 2 then
        if Sys.actionFunction(Sys.contentTab) == 0 then
            Sys.processStep = Sys.processStep + 1;
        end
    ---------------------------------------------------------------------------------------------------
    --������:�ж϶����Ƿ�ִ�����
    elseif Sys.processStep == 3 then
        ----------------���ж���ִ�����-------------------------------------------
        if Sys.actionStep >= Sys.actionTotal then
            ----------------�ֶ�ģʽ--------------------
            if Sys.runType == WorkType.hand then                    
                Sys.handRunTimes = Sys.handRunTimes + 1;      --��������+1
                if  Sys.handRunTimes >= HandProcessTab[1].times then--�Ѵﵽָ�������д���,ϵͳֹͣ
                    SystemStop();
                else                                                --��ǰ�����еĴ���С�����õĴ���,��ʱ���ؼ���������һ������
                    Sys.actionStep = 1;                       --ָ���һ������
                    Sys.processStep = 1;                      --���ص�һ��ִ�ж���
                end
            ----------------�Զ�ģʽ--------------------
            elseif Sys.runType == WorkType.auto then
                if Sys.isPeriodOrTimed == PERIOD_PROCESS then--�����ǰ����Ϊ��������, ����Ҫ�����´��������̵�ʱ��.
                    Sys.periodicIndex = Sys.periodicIndex + 1;--ָ����һ������
                    if Sys.periodicIndex > 4 then
                        Sys.periodicIndex = 1;
                    end
                    set_period_start_date_time(PeriodicTab[10].value);--������һ���������е�ʱ��
                end
                WriteProcessFile(2);
                SetSysWorkStatus(WorkStatus.readyRun);--����Ϊ����״̬,��ʱ����ϵͳ��ʱ���в��ϵ��ж��Ƿ���Խ�����һ��������
            ----------------����ģʽ--------------------
            elseif Sys.runType == WorkType.controlled then
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
    SetSysWorkStatus(WorkStatus.stop);--��״̬����ʾΪֹͣ
    ShowSysCurrentAction("��");
    set_value(RUN_CONTROL_SCREEN, RunStopButtonId, 0.0);--����ʼ/ֹͣ��ť����
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
        WriteProcessFile(1);
    elseif control == InportBtId then --���밴ť
        if SdPath  ~= nil then
            ShowSysTips(TipsTab.importing);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                ConfigFileCopy( SdPath.."config/"..i, i);--��Sd���е������ļ����붼ϵͳ
            end
            ShowSysTips(TipsTab.imported);
            ReadProcessFile(1);--������������1�����еĲ�������
            ReadProcessFile(2);--�������п��ƽ����еĲ�������
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab.importing);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                ConfigFileCopy( UsbPath.."config/"..i, i);--��Sd���е������ļ����붼ϵͳ
            end
            ShowSysTips(TipsTab.imported);
            ReadProcessFile(1);--������������1�����еĲ�������
            ReadProcessFile(2);--�������п��ƽ����еĲ�������
        else
            ShowSysTips(TipsTab.insertSdUsb);
        end;
    elseif control == ExportBtId then --������ť(���������õ�����SD����)
        if SdPath  ~= nil then
            ShowSysTips(TipsTab.exporting);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                ConfigFileCopy(i, SdPath.."config/"..i);--���ļ�������config�ļ���,�����ļ���Ϊ0~12
            end
            ShowSysTips(TipsTab.exported);
        elseif UsbPath ~= nil then
            ShowSysTips(TipsTab.exporting);
            for i = 0,12,1 do--���ε����ļ�"0"~"12"
                ConfigFileCopy(i, UsbPath.."config/"..i);--���ļ�������config�ļ���,�����ļ���Ϊ0~12
            end
            ShowSysTips(TipsTab.exported);
        else
            ShowSysTips(TipsTab.insertSdUsb);
        end;
    elseif control == AnalyteSetId then
        set_text(MAIN_SCREEN, LastAnalyteId, get_text(PROCESS_SET1_SCREEN, AnalyteSetId));--���÷�����
    elseif (control-100) >= TabProcess[1].selectId and (control-100) <= TabProcess[12].selectId then --����������ѡ���µĸ�����ť
        process_select_set(screen, control-100);
    elseif (control-100) >= TabProcess[1].rangeId and (control-100) <= TabProcess[12].rangeId  then --����������ѡ���µĸ�����ť
        range_select_set(screen, control-100);
    elseif control >= TabProcess[1].deleteId and control <= TabProcess[12].deleteId then--ɾ����ť
        if get_text(PROCESS_SET1_SCREEN, control+120) ~= BLANK_SPACE then --���Ʋ�Ϊ�ո�
            set_text(PROCESS_SET1_SCREEN, control+220,BLANK_SPACE);
			set_text(PROCESS_SET1_SCREEN, control+120,BLANK_SPACE);
			set_text(PROCESS_SET1_SCREEN, control+232,BLANK_SPACE);
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

--����ע��۲춯��ѡ��id,��������id,�༭id֮�����ѧת����ϵ:selectId = nameId + 100; nameId = editId + 100
--����[1]-[12]�а�����id�ؼ�����������2������,[13]-[24]�а�����id�ؼ�����������3������
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

--���ñ༭��ť��Ӧ����ת����
--para:��ȡ��Ӧ�Ķ�����������
--screen: ��ǰ��Ļ��id, �ӽ��水"ȷ��" ,"����" ��ť����Ҫ���صĽ���
--control:"�༭"��ť��id��
function set_edit_screen(para, screen, control)
    if screen == PROCESS_SET2_SCREEN then
        ReadActionTag(control-99);--����������2����, ���༭��ťid��Ϊ100ʱ, ��ǰ�������Ϊ1, ��������
        set_screen_actionNumber(screen, control-99);
    elseif screen == PROCESS_SET3_SCREEN then
        ReadActionTag(control-99+12);
        set_screen_actionNumber(screen, control-99+12);
    end

    if para == ActionItem[1] then --��ʼ����
        change_screen(PROCESS_INIT_SCREEN);
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
        if string.len(get_text(PROCESS_SET2_SCREEN, ProcessSelectId)) == 0  then
            set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 1);--��ʾ��ʾ��Ϣ
        else
            set_visiable(PROCESS_SET2_SCREEN, ProcessSelectTipsTextId, 0);--������ʾ��Ϣ
            --�ֶ����浱ǰ���ڱ༭������
            WriteActionFile(0);
        end
    elseif control == ProcessSelectButtonId then--���������ѡ��ťʱ,
        process_select2_set(PROCESS_SET2_SCREEN, ProcessSelectId);--��������ѡ��2�����а�ȷ��/���ذ�ť��,������������2����
    elseif control == ProcessSelectId then

    elseif (control-100) >= TabAction[1].selectId and (control-100) <= TabAction[12].selectId then--�����"����ѡ��"����İ�ťʱ
        action_select_set(PROCESS_SET2_SCREEN, control-100, control-399);
    elseif control >= TabAction[1].editId and control <= TabAction[12].editId then--�����"�༭"��ťʱ
        if get_text(PROCESS_SET2_SCREEN, control+100) ~= BLANK_SPACE then--��������˶�������(�༭��ť��id+100���ڶ�������id)
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
            WriteActionFile(0);
        end
    elseif (control-100) >= TabAction[13].selectId and (control-100) <= TabAction[24].selectId then--�����"����ѡ��"����İ�ťʱ
        action_select_set(PROCESS_SET3_SCREEN, control-100, control-399);
    elseif control >= TabAction[13].editId and control <= TabAction[24].editId then--�����"�༭"��ťʱ
        if get_text(PROCESS_SET3_SCREEN, control+100) ~= BLANK_SPACE then--��������˶�������(�༭��ť��id+100���ڶ�������id)
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
    ��������-��ʼ��
--------------------------------------------------------------------------------------------------------------------]]
--�������ӽ�����("��ʼ��/ȡ��/����/......"),ȷ�ϰ�ť��id����99,ȡ����ť��id����98.
SureButtonId = 99;--ȷ�ϰ�ť
CancelButtonId = 98;--ȡ����ť
DestScreen = nil;
DestControl = nil;
DestActionNum = 0;--ָ��ǰ�������

AnalysisTypeMenuId = 200;
AnalysisTypeTextId = 38;

INIT_BtStartId = 1;
INIT_BtEndId = 37;
INIT_TextStartId = 38;
INIT_TextEndId = 52;

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function set_screen_actionNumber(screen,actionNumber)
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
--  ִ�п�ʼ����
--  paraTab:�����˿�ʼ�����еĲ�������
--***********************************************************************************************
function excute_init_process(paraTab)
    if Sys.actionSubStep == 1 then
        if paraTab[1] == ENABLE then--�ж��Ƿ���Ҫ��ʮͨ�����в���
            for i = 6,21,1 do--6Ϊ���1��һ����ť, ��ʾ��1
                if tab[1] == ENABLE then
                end
            end
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 2 then
        if paraTab[2] == ENABLE then--�ж��Ƿ���Ҫ�����1���в���
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 3 then
        if paraTab[3] == ENABLE then--�ж��Ƿ���Ҫ�����2���в���
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 4 then
        if paraTab[4] == ENABLE then--�ж��Ƿ���Ҫ��ע���1���в���
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 5 then
        if paraTab[5] == ENABLE then--�ж��Ƿ���Ҫ��ע���2���в���
        else
            Sys.actionSubStep = Sys.actionSubStep + 1;
        end
    --------------------------------------------------------------
    elseif Sys.actionSubStep == 6 then
        Sys.actionSubStep = 0;
    end
    
    return Sys.actionSubStep;
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
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  ִ��ȡ������
--***********************************************************************************************
function excute_get_sample_process(paraTab)
    return 0;
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
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

--***********************************************************************************************
--  ִ��ע��ü�Һ������
--***********************************************************************************************
function excute_inject_process(paraTab)
    return 0;
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
--***********************************************************************************************
function excute_peristaltic_process(paraTab)
    return 0;
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
        WriteActionFile(DestActionNum);
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end



--***********************************************************************************************
--  ִ����������
--***********************************************************************************************
function excute_dispel_process(paraTab)
    return 0;
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
    return 0;
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
    Sys.resultTime = Sys.dateTime;--��ȡ��ǰʱ��
    return 0;
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
    return 0;
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
    return 0;
end


--[[-----------------------------------------------------------------------------------------------------------------
    ����ѡ��
--------------------------------------------------------------------------------------------------------------------]]

AnalysisButtonId = 1;--������ť
NullButtonId = 8;--�հ�ť

ProcessItem = {"����","У��","��ϴ","��·���","���˲�","�����˲�","��Ⱥ˲�",BLANK_SPACE};
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
        if get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId) ~= BLANK_SPACE--��ȡ���Ƴ���,�����Ƴ��Ȳ�Ϊ0ʱ��ʾ��Ч
           and  processFile ~= nil then--�����̺��������ļ�
            if DestScreen == RUN_CONTROL_SCREEN then
                processFile:close();
            end
            NumberOfProcess = NumberOfProcess + 1;--����+1
            set_visiable(PROCESS_SELECT2_SCREEN, NumberOfProcess,  1);--��ʾidΪNumberOfProcess���ı�
            set_text(PROCESS_SELECT2_SCREEN, NumberOfProcess, get_text(PROCESS_SET1_SCREEN,TabProcess[i].nameId))--Ϊ���ı�����������
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
ActionItem = {"��ʼ��","ȡ��","ע��ü�Һ��","��ȡ�ź�","�䶯�ü�Һ","����","�ȴ�ʱ��","����","������",BLANK_SPACE};
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
            set_text(DestScreen, DestControl, ActionItem[ActionSelectItem]);--����ѡ��
            set_text(DestScreen, DestControl-100, ActionItem[ActionSelectItem]);--DestControl-100��Ӧ��������
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
Valve1BtId = 35
Valve2BtId = 2
Valve11BtId = 43;

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function hand_operate1_control_notify(screen, control, value)
    if control == Valve11BtId then
        if get_value(HAND_OPERATE1_SCREEN, Valve11BtId) == ENABLE then
            on_uart_send_data(uartSendTab.openV11, NEED_REPLY);
        else
            
        end
    elseif control == Valve1BtId then

    elseif control == Valve2BtId then

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
maintainerPwdSetId = 50;
administratorPwdSetId = 51;
EquipmentTypeSetId = 60;
EquipmentTypeTextId = 900;--ÿ�������е������ͺ�id����11
OperatorLoginId = 72;
maintainerLoginId = 47;
administratorLoginId = 48;
pwdRecordId = 6;--���ڱ�������ļ�¼�ؼ�

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
        set_user_name(SysUser.maintainer);
    elseif control == administratorPwdSetId then--����Ա��������
        set_user_name(SysUser.administrator);
    elseif control == OperatorLoginId then --����Ա��¼
        set_user_name(SysUser.operator);
    elseif control == maintainerLoginId then--��άԱ��¼
        set_user_name(SysUser.maintainer);
        change_screen(LOGIN_SYSTEM_SCREEN);
    elseif control == administratorLoginId then--����Ա��¼
        set_user_name(SysUser.administrator);
        change_screen(LOGIN_SYSTEM_SCREEN);
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

    if user == SysUser.operator then -- ����Ա
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, DISABLE);
        set_process_edit_state(DISABLE);--��ֹ��������
    elseif user == SysUser.maintainer then--��άԱ
        set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, DISABLE);
        set_value(SYSTEM_INFO_SCREEN, maintainerLoginId, ENABLE);
        set_value(SYSTEM_INFO_SCREEN, administratorLoginId, DISABLE);
        set_process_edit_state(ENABLE);--����༭����
    elseif user == SysUser.administrator then--����Ա
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
    if userNameSet == SysUser.maintainer then
        PwdRecordPosition = 0;
    elseif userNameSet == SysUser.administrator then
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

    if userNameSet == SysUser.maintainer then
        PwdRecordPosition = 0;
    elseif userNameSet == SysUser.administrator then
        PwdRecordPosition = 1;
    end
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
--tagNum = 1 : �޸���������1�����еĲ��� 
--tagNum = 2 : �޸����п��ƽ����еĲ���
--***********************************************************************************************
function WriteProcessFile(tagNum)
    if tagNum ~= 1 and tagNum ~= 2 then
        return;
    end

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
--tagNum = 1 : �޸���������1�����еĲ��� 
--tagNum = 2 : �޸����п��ƽ����еĲ���
--***********************************************************************************************
function ReadProcessFile(tagNum)
	local configFile = io.open("0", "r")      --���ı�
    if configFile == nil then--���û�и��ļ��򷵻�
        --����һ��Ĭ�������ļ�
        WriteProcessFile(1);
        WriteProcessFile(2);
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
            set_text(PROCESS_SET1_SCREEN, TabProcess[i].selectId, tab[(i-1)*3+1]);  --��������ʾ���ı�����
            set_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId,   tab[(i-1)*3+2]);  --��������ʾ���ı�����
            set_text(PROCESS_SET1_SCREEN, TabProcess[i].rangeId,  tab[(i-1)*3+3]);  --��������ʾ���ı�����
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
    end
end

--***********************************************************************************************
--�ú�����������ļ����Ƿ���<action?>��ǩ, ? ��Χ1~12. ���û�иñ�ǩ,�򴴽�һ��Ĭ�ϵ�����,�������ֱ�ӷ���
--actionNumber:������ǩ,��Χ:action1~action24
--***********************************************************************************************
function WriteDefaultActionTag(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcessSelectId);--��ȡ��������
    local fileName = 0;

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId),processName ,1) ~= nil then--�ҵ���ǰ��������Ӧ�����
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
    processFile:write("<type>"..actionType.."</type>");--д�붯������:��ʼ��/ȡ��/����......
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
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            processFile:write(get_value(PROCESS_INIT_SCREEN, i)..",");--д�밴ťֵ
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            processFile:write(get_text(PROCESS_INIT_SCREEN, i)..",");--д���ı�ֵ
        end
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
function WriteActionFile(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcessSelectId);--��ȡ��������

    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId),processName ,1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            WriteActionTag(i, 0);--�޸�<action0>��ǩ�е�����
            WriteActionTag(i, actionNumber);--�������ݵ��ļ���,�ļ���Ϊ1~12, ���������Ϊaction0~action12��ǩ
        end
    end
end

--***********************************************************************************************
--�������ļ�����,����ÿ��ֻ��ȡһ����ǩ���ֵ, ����<action1>��ǩ֮���ֵ
--actionNumber:��ǰ����Ϊ�ڼ���
--***********************************************************************************************
function ReadActionTag(actionNumber)
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
    
    local actionType = GetSubString(actionString, "<type>","</type>");--��ȡactionString�ַ�����<type>��ǩ֮����ַ���,��ȡ��������
    local contentTabStr = GetSubString(actionString,"<content>","</content>");--�ٽ�ȡ<content>��ǩ�е�����
    if contentTabStr == nil then--���û������,�������������2/3�����еĶ���ѡ���붯������
        return;
    end
    local tab = split(contentTabStr, ",");--�ָ��ַ���
    if actionNumber == 0 then --�ж�Ϊ<action0>��ǩ
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
        for i = INIT_BtStartId, INIT_BtEndId, 1 do
            set_value(PROCESS_INIT_SCREEN, i, tab[i]);--д�밴ťֵ
        end
        for i = INIT_TextStartId, INIT_TextEndId, 1 do
            set_text(PROCESS_INIT_SCREEN, i, tab[i]);--д���ı�ֵ
        end
    --------------------------------��-ȡ���������--------------------------------------------------
    elseif actionType == ActionItem[2] then 
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
    Sys.processName = GetSubString(actionString, "<type>","</type>");--��ȡ��������
    local contentTabStr = GetSubString(actionString,"<content>","</content>");--�ٽ�ȡ<content>��ǩ�е�����
    local tab = split(contentTabStr, ",");--�ָ��ַ���,�����ַ�������tab����
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
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId), name, 1) ~= nil then
                processId = i;
            break;
        end
    end
    return processId;
end 


