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

------------------------------------ϵͳ��ں���-----------------------------------------------
--����ȫ�ֱ���uart_free_protocol��ʹ�����ɴ���Э��
uart_free_protocol = 1
--��ʼ������,ϵͳ����LUA�ű����������ôλص�����
function on_init()
    uart_set_timeout(1000,200);
    num = 1;
    subString = DeleteSubString("123<a0>456</a0>789","<a"..num..">","</a"..num..">");
    set_text(MAIN_SCREEN, 16, subString);
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

end


--���� U �̺�ִ�д˻ص�����
function on_usb_inserted(dir)
    set_text(MAIN_SCREEN, 16, "����U��");
end

--�γ� U �̺�ִ�д˻ص�����
function on_usb_removed()
    set_text(MAIN_SCREEN, 16, "�γ�U��");
end

--���� SD ����ִ�д˻ص�����
function on_sd_inserted(dir)
    set_text(MAIN_SCREEN, 16, "����SD��");
end

--�γ� SD ����ִ�д˻ص�����
function on_sd_removed()
    set_text(MAIN_SCREEN, 16, "�γ�SD��");
end


--�����Զ��庯��
function on_uart_recv_data(packet)

end

-----------------------------------��ҳ ��������----------------------------------------------------

LastAnalysisTimeId = 20;   --����ʱ��
LastAnalyteId = 17;        --������
LastAnalysisResultId = 18; --�������
LastAnalysisUnitId = 19;   --��λ
LastAnalysisE1Id = 25;     --E1
LastAnalysisE2Id = 26;     --E2

function main_control_notify(screen,control,value)

end


-----------------------------------���п��� ��������-------------------------------------------------

RunTypeID = 43;--���з�ʽ��Ӧ���ı��ռ�ID
RunStatusId = 131;--����״̬�л���ť"��ʼ""ֹͣ"��ť
--�ֶ�����
HandProcessID = 300;--�ֶ����ã��ֶ����̶�Ӧ���ı��ؼ�ID
HandProcessTimesID = 171; --�ֶ����ã�������Ӧ���ı��ռ�ID

--��������
PeriodicTab = { Process1Id = 301, Process2Id = 302, Process3Id = 303, Process4Id = 304,
                YearId = 155, MonthId = 156, DayId = 157, HourId = 158, MinuteId = 159, FreqId = 176};

--��ʱ����
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

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function run_control_notify(screen,control,value)
	--control-100��ʾ��ð�ť�غϵ��ı���
	if (control-100) >= HandProcessID and (control-100) <= TimedTab.Process24.Id then--�������Ҫѡ�����̵��ı���ʱ
		process_select2_set(screen, control-100);--(control100)��ʾ��ð�ť�غϵ��ı���
	end
end
-----------------------------------�������� �����ļ���غ���--------------------------------------------

--���������ļ�,��������"ProcessSummary"�ļ���
function WriteProcessSummaryFile()
    os.remove("ProcessSummary");--ɾ�����е��ļ�
    local configFile = io.open("ProcessSummary", "a+"); --�Ը���д��ķ�ʽ���ı�
    assert(configFile);--�ж��ļ��Ƿ����,����������򱨴�.
    --��������ѡ��������
    for i=1,12,1 do
        configFile:write(get_text(PROCESS_SET1_SCREEN, TabProcess[i].selectId)..",".. --��������ѡ��
                        get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId)..","..   --��������
                        get_text(PROCESS_SET1_SCREEN, TabProcess[i].rangeId)..",");  --��������
    end
    configFile:close();                         --�ر��ı�
end

--��ȡ�����ļ��е�����
function ReadProcessSummaryFile()
	local configFile = io.open("ProcessSummary","a+")      --��ֻ���ķ�ʽ���ı�
    if configFile == nil then--���û�и��ļ��򷵻�    
        return;
    end
	configFile:seek("set")                        --���ļ�λ�ö�λ����ͷ
	fileInfo = configFile:read("a")               --�ӵ�ǰλ�ö�ȡ�����ļ�������ֵ���ַ�����
	configFile:close()                            --�ر��ı�
    
    t = split(fileInfo, ",")
    for i=1,12,1 do
        set_text(PROCESS_SET1_SCREEN, TabProcess[i].selectId, t[(i-1)*3+1]);  --��������ʾ���ı�����
        set_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId,  t[(i-1)*3+2]);    --��������ʾ���ı�����
        set_text(PROCESS_SET1_SCREEN, TabProcess[i].rangeId, t[(i-1)*3+3]);    --��������ʾ���ı�����
    end
end

--������д�������ļ���,���ļ���WriteProcessFile�е���--------------------------------------------------------------------------------
--fileName:�����ļ�����:��Χ:1-12,��Ӧ12������(ÿ�����̶�Ӧһ�������ļ�)
--actionNumber:������ǩ,��Χ:action1~action24
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
    else
        actionType = get_text(PROCESS_SET2_SCREEN, TabAction[actionNumber].selectId);--��ȡ��ǰ��������
    end

    processFile:write("<action"..actionNumber..">");--д�뿪ʼ��ǩ
    processFile:write("<type>"..actionType.."</type>");--д�붯������:��ʼ/ȡ��/����......

    --------------------------------д<action0>��ǩ����---------------------------------------------
    --<action0>��ǩ����Ķ��Ǹ�������,��Ӧ����������2/3�����еĶ���ѡ��/��������
    if actionNumber == 0 then
        processFile:write("<content>");
        for i=1,12,1 do
            processFile:write(get_text(PROCESS_SET2_SCREEN, TabAction[i].selectId)..",".. --��������ѡ��
                              get_text(PROCESS_SET2_SCREEN, TabAction[i].nameId  )..","); --��������
        end
        for i=13,24,1 do
            processFile:write(get_text(PROCESS_SET3_SCREEN, TabAction[i].selectId)..",".. --��������ѡ��
                              get_text(PROCESS_SET3_SCREEN, TabAction[i].nameId  )..","); --��������
        end
        processFile:write("</content>");
    --------------------------------д��ʼ�������----------------------------------------------------
    elseif actionType == ActionItem[1] then 
        processFile:write("<content>"..
                          get_text(PROCESS_START_SCREEN, AnalysisTypeTextId)..","..--��������
                          get_value(PROCESS_START_SCREEN,ResetSystemButtonId)..","..--�Ƿ�Ӳ����λ
                          "</content>");
    --------------------------------дȡ���������----------------------------------------------------
    elseif actionType == ActionItem[2] then 
        processFile:write("<content>");
        for i = GS_OUT1_EnableId, GS_OUT1_Valve16Id, 1 do
            processFile:write(get_value(PROCESS_GET_SANPLE_SCREEN, i)..",");--д�����1��ťֵ
        end
        processFile:write(get_text(PROCESS_GET_SANPLE_SCREEN, GS_OUT1_WaitTimeId)..",");--д�����1�ȴ�ʱ��
        for i = GS_OUT2_EnableId, GS_OUT2_Valve16Id, 1 do
            processFile:write(get_value(PROCESS_GET_SANPLE_SCREEN, i)..",");--д�����2��ťֵ
        end
        processFile:write(get_text(PROCESS_GET_SANPLE_SCREEN, GS_OUT2_WaitTimeId));--д�����2�ȴ�ʱ��
        processFile:write("</content>");
    --------------------------------дע��ü�Һ����----------------------------------------------------
    elseif actionType == ActionItem[3] then --ע��ü�Һ��������
        processFile:write("<content>");

        processFile:write("</content>");
    elseif actionType == ActionItem[4] then --��ȡ�ź�
    elseif actionType == ActionItem[5] then --�䶯�ü�Һ
    elseif actionType == ActionItem[6] then --����
    elseif actionType == ActionItem[7] then --�ȴ�ʱ��
    elseif actionType == ActionItem[8] then --����
    elseif actionType == ActionItem[9] then --������
    elseif actionType == ActionItem[10] then --��
        processFile:write("<content> </content>");
    end

    processFile:write("</action"..actionNumber..">");--д�������ǩ
    processFile:close(); --�ر��ı�
end

--���浥�����������ļ�,ÿ�����̶���һ����Ӧ�������ļ�,�ļ���Ϊ�������ڱ���е����
--actionNumber:������ǩ,��Χ:action1~action24
function WriteProcessFile(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcessSelectId);--��ȡ��������
    for i=1,12,1 do
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId),processName ,1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            WriteActionTag(i, actionNumber);--�������ݵ��ļ���,�ļ���Ϊ1~12, ���������Ϊaction0~action12��ǩ
        end
    end
end


--���ض�������,����������2/3�������༭��ťʱ,����øú���,��ȡ��ǰ����---------------------------------------------------------------
--actionNumber:��ǰ����Ϊ�ڼ���
function ReadProcessFile(actionNumber)
    local processName = get_text(PROCESS_SET2_SCREEN, ProcessSelectId);--��ȡ��������
    local fileName = 0;
    for i=1,12,1 do--ѭ�����ҵ�ǰ�������ƶ�Ӧ�����.
        if string.find(get_text(PROCESS_SET1_SCREEN, TabProcess[i].nameId),processName ,1) ~= nil then--�ҵ���ǰ��������Ӧ�����
            fileName = i;
            break;
        end
    end

    local processFile = io.open(fileName,"r");      --���ı�
    if processFile == nil then--��û�и��ļ�,�򴴽�һ���µ������ļ�,������
        WriteProcessFile(0);--
        --����������2/3�������
        for i = TabAction[1].selectId,TabAction[12].selectId,1 do
            set_text(PROCESS_SET2_SCREEN, i," ");    --����Ӧ����ѡ����ı���ʾΪ�ո�
            set_text(PROCESS_SET2_SCREEN, i-100," ");--����Ӧ�������Ƶ��ı���ʾΪ�ո�
            set_text(PROCESS_SET3_SCREEN, i," ");    --����Ӧ����ѡ����ı���ʾΪ�ո�
            set_text(PROCESS_SET3_SCREEN, i-100," ");--����Ӧ�������Ƶ��ı���ʾΪ�ո�
        end
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
    if actionNumber == 0 then --�ж�λ<action0>��ǩ
        content = GetSubString(actionString,"<content>","</content>");--�ٽ�ȡ<content>��ǩ�е�����
        if content == nil then--���û������,�������������2/3�����еĶ���ѡ���붯������
            return;
        end
        tab = split(content, ",");
        for i=1,12,1 do
            set_text(PROCESS_SET2_SCREEN, TabAction[i].selectId, tab[(i-1)*2+1]);  --��������ʾ���ı�����
            set_text(PROCESS_SET2_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]);   --��������ʾ���ı�����
        end
        for i=13,24,1 do
           set_text(PROCESS_SET3_SCREEN, TabAction[i].selectId, tab[(i-1)*2+1]);  --��������ʾ���ı�����
           set_text(PROCESS_SET3_SCREEN, TabAction[i].nameId,   tab[(i-1)*2+2]);  --��������ʾ���ı�����
        end
    elseif actionType == ActionItem[1] then --��ʼ�������
        actionTab = GetSubString(actionString,"<content>","</content>");--��ȡ����
        tab = split(actionTab,",");--�ָ��ַ���
        set_text(PROCESS_START_SCREEN, AnalysisTypeTextId, tab[1]);
        set_value(PROCESS_START_SCREEN, ResetSystemButtonId, tab[2] );
    
    elseif actionType == ActionItem[2] then --ȡ���������
        actionTab = GetSubString(actionString,"<content>","</content>");--��ȡ����
        tab = split(actionTab,",");--�ָ��ַ���
        set_text(PROCESS_SET2_SCREEN,30, tab[1])
        for i = 1,17,1 do 
            set_value(PROCESS_GET_SANPLE_SCREEN, i, tab[i]);--tab��ǰ17��λ��ťֵ
        end
        set_text(PROCESS_GET_SANPLE_SCREEN, GS_OUT1_WaitTimeId, tab[18]);--��18��Ϊ���1�ȴ�ʱ��ֵ
        for i = 19,35,1 do
           set_value(PROCESS_GET_SANPLE_SCREEN, i, tab[i]);--��19-35��λ��ťֵ
        end
        set_text(PROCESS_GET_SANPLE_SCREEN, GS_OUT2_WaitTimeId, tab[36]);--��36��Ϊ���2�ȴ�ʱ��ֵ
    elseif actionType == ActionItem[3] then --ע��ü�Һ��������
    elseif actionType == ActionItem[4] then --��ȡ�ź�
    elseif actionType == ActionItem[5] then --�䶯�ü�Һ
    elseif actionType == ActionItem[6] then --����
    elseif actionType == ActionItem[7] then --�ȴ�ʱ��
    elseif actionType == ActionItem[8] then --����
    elseif actionType == ActionItem[9] then --������
    end
end


--�ַ����ָ��,str -> ��Ҫ�ָ���ַ���;delimiter->�ָ���
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

---�������ַ�������ȡ�ַ���1���ַ���2֮����ַ���
-- @param str  ����ȡ�ַ�����  
--        substr1 ָ���ַ���1��  
--        substr2 ָ���ַ���2; 
-- @return ��ȡ����ַ���
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


---�������ַ�����ɾ���ַ���1���ַ���2֮����ַ���,�������ַ���
-- @param str  ����ȡ�ַ�����  
--        substr1 ָ���ַ���1��  
--        substr2 ָ���ַ���2; 
-- @return ��ȡ����ַ���
function DeleteSubString(str, substr1, substr2)
    local s1,e1 = string.find(str, substr1)  --��ȡ�ַ���1��λ��
    local s2,e2 = string.find(str, substr2)  --��ȡ�ַ���2��λ��
    if s1 ~= nil and s2 ~= nil then
        str = string.sub(str,1,s1-1)..string.sub(str,e2+1, -1);
    end
    return str
end

-----------------------------------��������1 ��������------------------------------------------------

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

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set1_control_notify(screen,control,value)

    if control == ProcessSaveBtId then -- ����
        WriteProcessSummaryFile();
    elseif control == InportBtId then --���밴ť
        
    elseif control == ExportBtId then --������ť

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

--�������л�����������1ʱ��ִ�д˻ص�����
function goto_ProcessSet1()
    ReadProcessSummaryFile();
end
-----------------------------------��������2/3 ��������------------------------------------------------

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
    if control == ProcessSelectButtonId then--���������ѡ��ťʱ
        process_select2_set(PROCESS_SET3_SCREEN, ProcessSelectId);
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



-----------------------------------��������-��ʼ ��������--------------------------------------------

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

-----------------------------------��������-ȡ�� ��������--------------------------------------------

GS_OUT1_EnableId = 1;--ȡ�����������1ʹ�ܰ�ťid (GS->GetSample)
GS_OUT1_Valve1Id = 2;--���1�з�1��id
GS_OUT1_Valve16Id= 17;--���1�з�16��id
GS_OUT1_WaitTimeId = 18;--���1�ȴ�ʱ��

GS_OUT2_EnableId = 19;--ȡ�����������1ʹ�ܰ�ťid (GS->GetSample)
GS_OUT2_Valve1Id = 20;--���1�з�1��id
GS_OUT2_Valve16Id= 35;--���1�з�16��id
GS_OUT2_WaitTimeId = 36;--���1�ȴ�ʱ��

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



-----------------------------------��������-ע��ü�Һ ��������--------------------------------------------


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



-----------------------------------��������-�䶯�ü�Һ ��������--------------------------------------------

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_peristaltic_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end




-----------------------------------��������-���� ��������--------------------------------------------

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_dispel_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end


-----------------------------------��������-��ȡ�ź� ��������--------------------------------------------

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_read_signal_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

-----------------------------------��������-���� ��������--------------------------------------------

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_calculate_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

-----------------------------------��������-������ ��������--------------------------------------------

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_valve_ctrl_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end


-----------------------------------��������-�ȴ�ʱ�� ��������--------------------------------------------

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_wait_time_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end

-----------------------------------����ѡ�� ��������--------------------------------------------
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
            ReadProcessFile(0);--��ѡ��һ������ʱ,���ظ����������ļ�
		end
	elseif control == CancelButtonId then --ȡ����ť
		change_screen(DestScreen);
	end
end


-----------------------------------����ѡ��2 ��������--------------------------------------------
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
    elseif control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);

        if ProcessSelec2tItem ~= nil then --ProcessSelec2tItemĬ��Ϊnil,���ѡ����ĳ���������ֵ��Ϊnil
            set_text(DestScreen, DestControl, get_text(PROCESS_SELECT2_SCREEN, ProcessSelec2tItem));--DestControl��Ӧ����ѡ��
            set_text(DestScreen, DestControl-100, get_text(PROCESS_SELECT2_SCREEN, ProcessSelec2tItem));--DestControl-100��Ӧ��������
            if DestScreen == PROCESS_SET2_SCREEN then --����ǻص���������2����,����ظ����̶�Ӧ�������ļ�
                ReadProcessFile(0);
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

-----------------------------------����ѡ�� ��������--------------------------------------------
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


-----------------------------------�������� ��������--------------------------------------------
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


-----------------------------------����ѡ�� ��������--------------------------------------------
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


-----------------------------------�ֶ�����1 ��������--------------------------------------------
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


-----------------------------------�ֶ�����2 ��������--------------------------------------------





-----------------------------------�ֶ�����3 ��������--------------------------------------------




-----------------------------------�ֶ�����4 ��������--------------------------------------------





-----------------------------------������� ��������--------------------------------------------





-----------------------------------������¼ ��������--------------------------------------------





-----------------------------------У׼��¼ ��������--------------------------------------------




-----------------------------------������¼ ��������--------------------------------------------




-----------------------------------������־ ��������--------------------------------------------




-----------------------------------ϵͳ��Ϣ ��������--------------------------------------------
maintainerPwdSetId = 50;
administratorPwdSetId = 51;
EquipmentTypeSetId = 60;
EquipmentTypeTextId = 11;--ÿ�������е������ͺ�id����11
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

-----------------------------------�������� ��������--------------------------------------------
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

-----------------------------------��¼ϵͳ ��������--------------------------------------------

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



