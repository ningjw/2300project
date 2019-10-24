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

-----------------------------��ҳ �ؼ�ID----------------------------------------------------
LastAnalysisTimeId = 20;   --����ʱ��
LastAnalyteId = 17;        --������
LastAnalysisResultId = 18; --�������
LastAnalysisUnitId = 19;   --��λ
LastAnalysisE1Id = 25;     --E1
LastAnalysisE2Id = 26;     --E2



-------------------------���п��� �ؼ�ID-----------------------------------------------------
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


-------------------------��������1 �ؼ�ID------------------------------------------------------------------

--�������ñ��и��ؼ�Id,ע��selecId��nameId����ѧ��ϵ:selectId = nameId + 100, selectId = deleteId + 220 �ȵ�
TabProcess = {[1] = {selectId = 300, nameId = 200, rangeId = 312, activeId = 95, deleteId = 80},
              [2] = {selectId = 301, nameId = 201, rangeId = 313, activeId = 96, deleteId = 81},
              [3] = {selectId = 302, nameId = 202, rangeId = 314, activeId = 97, deleteId = 82},
              [4] = {selectId = 303, nameId = 203, rangeId = 315, activeId = 99, deleteId = 83},
              [5] = {selectId = 304, nameId = 204, rangeId = 316, activeId = 100,deleteId = 84},
              [6] = {selectId = 305, nameId = 205, rangeId = 317, activeId = 101,deleteId = 85},
              [7] = {selectId = 306, nameId = 206, rangeId = 318, activeId = 102,deleteId = 85},
              [8] = {selectId = 307, nameId = 207, rangeId = 319, activeId = 103,deleteId = 87},
              [9] = {selectId = 308, nameId = 208, rangeId = 320, activeId = 104,deleteId = 88},
              [10]= {selectId = 309, nameId = 209, rangeId = 321, activeId = 105,deleteId = 89},
              [11]= {selectId = 310, nameId = 210, rangeId = 322, activeId = 48, deleteId = 90},
              [12]= {selectId = 311, nameId = 211, rangeId = 323, activeId = 92, deleteId = 91},
       };


AnalyteSetId = 38;--������ѡ��
CodeSetId = 107;--����
UniteSetId = 36;--��λѡ��
UniteSetTextId = 111--��λ���óɹ���,������ʾ��λ�ı���id



--------------------------------------��������2/3 �ؼ�ID------------------------------------------------------

ProcessSelectButtonId = 35;--λ����������2
ProcessSelectId = 38;      --λ����������2
ProcessSelectShowId = 38;  --λ����������3

--����ע��۲춯��ѡ��id,��������id,�༭id֮�����ѧת����ϵ:selectId = nameId + 100; nameId = EditId + 100
--����[1]-[12]�а�����id�ؼ�����������2������,[13]-[24]�а�����id�ؼ�����������3������
ActionTab = {
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

-----------------------------------��������-��ʼ �ؼ�ID--------------------------------------------
--�������ӽ�����("��ʼ/ȡ��/����/......"),ȷ�ϰ�ť��id����99,ȡ����ť��id����98.
SureButtonId = 99;--ȷ�ϰ�ť
CancelButtonId = 98;--ȡ����ť
DestScreen = nil;
DestControl = nil;

AnalysisTypeMenuId = 4;
AnalysisTypeTextId = 7;
ResetSystemButtonId = 5;

-----------------------------------��������-ȡ�� �ؼ�ID--------------------------------------------




-----------------------------------��������-ע���ȡ�� �ؼ�ID--------------------------------------------




-----------------------------------��������-�䶯��ȡ�� �ؼ�ID--------------------------------------------



-----------------------------------��������-���� �ؼ�ID--------------------------------------------



-----------------------------------��������-��ȡ�ź� �ؼ�ID-----------------------------------



-----------------------------------��������-���� �ؼ�ID--------------------------------------



-----------------------------------��������-������ �ؼ�ID------------------------------------




-----------------------------------��������-�ȴ�ʱ�� �ؼ�ID------------------------------------



-----------------------------------����ѡ�� �ؼ�ID--------------------------------------------
AnalysisButtonId = 1;--������ť
NullButtonId = 8;--�հ�ť


-----------------------------------����ѡ��2 �ؼ�ID--------------------------------------------
FirstButtonId = 101;--��һ����ť
LastButtonId = 112;--���һ����ť
TipsTextId = 13;--��ʾ�ı���

-----------------------------------����ѡ�� �ؼ�ID--------------------------------------------
ActionStartButtonId = 1;
ActionEndButtonId = 10;


-----------------------------------�������� �ؼ�ID--------------------------------------------
--����������/����ѡ�������,����1/2/3�ı���id����һ����
Range1LowId = 64;--����1�ı�id
Range1HighId = 65;--����1�ı�id
Range2LowId = 77;--����2�ı�id
Range2HighId = 78;--����2�ı�id
Range3LowId = 115;--����3�ı�id
Range3HighId = 116;--����3�ı�id

RangeTab = {
    [1] = {LowId = 64, HighId = 65, densityCalLowId = 81, densityCalHighId = 84, aId = 48, bId = 49, cId = 50, dId = 51},
    [2] = {LowId = 77, HighId = 78, densityCalLowId = 67, densityCalHighId = 70, aId = 52, bId = 53, cId = 54, dId = 55 },
    [3] = {LowId = 115,HighId= 116, densityCalLowId = 105,densityCalHighId = 108,aId = 92, bId = 93, cId = 94, dId = 95},
};


-----------------------------------����ѡ�� �ؼ�ID--------------------------------------------
Range1Id = 1;--����1��ťId
Range2Id = 2;--����2��ťId
Range3Id = 3;--����3��ťId


-----------------------------------�ֶ�����1 �ؼ�ID--------------------------------------------




-----------------------------------�ֶ�����2 �ؼ�ID--------------------------------------------





-----------------------------------�ֶ�����3 �ؼ�ID--------------------------------------------




-----------------------------------�ֶ�����4 �ؼ�ID--------------------------------------------





-----------------------------------������� �ؼ�ID--------------------------------------------





-----------------------------------������¼ �ؼ�ID--------------------------------------------





-----------------------------------У׼��¼ �ؼ�ID--------------------------------------------




-----------------------------------������¼ �ؼ�ID--------------------------------------------




-----------------------------------������־ �ؼ�ID--------------------------------------------




-----------------------------------ϵͳ��Ϣ �ؼ�ID--------------------------------------------



-----------------------------------�������� �ؼ�ID--------------------------------------------



-----------------------------------��¼ϵͳ �ؼ�ID--------------------------------------------




-----------------------------------�ֽ���,�����Ǹ��ֿռ��id����,�����Ǻ�������---------------------


------------------------------------ϵͳ��ں���--------------------------------------------------
--��ʼ������,ϵͳ����LUA�ű����������ôλص�����
function on_init()
	
	uart_set_baudrate(38400);
end

--��ʱ�ص�������ϵͳÿ��1�����Զ����á�
function on_systick()

end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function on_control_notify(screen,control,value)
	if screen == RUN_CONTROL_SCREEN then --���п��ƽ���
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
	elseif screen == SYSTEM_INFO_SCREEN then --ϵͳ��Ϣ����
		system_info_control_notify(screen,control,value);	
	elseif screen== LOGIN_SYSTEM_SCREEN then--��¼ϵͳ����
		login_system_control_notify(screen,control,value);	
	elseif screen== PASSWORD_SET_SCREEN then--�������ý���
		login_system_control_notify(screen,control,value);		
	end
end



--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function on_screen_change(screen)
	if(screen == RANGE_SELECT_SCREEN) then --��ת������ѡ��
		goto_range_select();
	elseif screen== PROCESS_SELECT2_SCREEN then --��ת������ѡ��3
		goto_ProcessSelect2();
	elseif screen== PROCESS_SELECT3_SCREEN then --��ת������ѡ��3
		goto_ProcessSelect3();
	elseif screen== ACTION_SELECT_SCREEN then --��ת������ѡ��
		goto_ActionSelect();
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

end

--�γ� U �̺�ִ�д˻ص�����
function on_usb_removed()

end

--���� SD ����ִ�д˻ص�����
function on_sd_inserted(dir)

end

--�γ� SD ����ִ�д˻ص�����
function on_sd_removed()

end

--����ȫ�ֱ���uart_free_protocol��ʹ�����ɴ���Э��
uart_free_protocol = 1
--�����Զ��庯��
function on_uart_recv_data(rev_data)

end


-----------------------------------��ҳ ��������----------------------------------------------------


-----------------------------------���п��� ��������-------------------------------------------------
--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function run_control_notify(screen,control,value)
	--control-100��ʾ��ð�ť�غϵ��ı���
	if (control-100) >= HandProcessID and (control-100) <= TimedTab.Process24.Id then--�������Ҫѡ�����̵��ı���ʱ
		process_select2_set(screen, control-100);--(control100)��ʾ��ð�ť�غϵ��ı���
	end
end


-----------------------------------��������1 ��������------------------------------------------------
--���õ�λ
function set_unit()
    local Unite = get_text(PROCESS_SET1_SCREEN, UniteSetTextId);
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
function process_set1_control_notify(screen,control,value)
    if(control == UniteSetId) then --���õ�λ
        set_unit();
    elseif control == AnalyteSetId then
        set_text(MAIN_SCREEN, LastAnalyteId, get_text(PROCESS_SET1_SCREEN, AnalyteSetId));--���÷�����
    --control-100��ʾ��ð�ť�غϵ��ı���id
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


-----------------------------------��������2/3 ��������------------------------------------------------
--���ñ༭��ť��Ӧ����ת����
function set_edit_screen(para,screen)
    if para == ActionItem[1] then --��ʼ����
        change_screen(PROCESS_START_SCREEN);
        process_start_set(screen)
    elseif para == ActionItem[2] then --ȡ������
        change_screen(PROCESS_GET_SANPLE_SCREEN);
        process_get_sample_set(screen);
    elseif para == ActionItem[3] then --ע��ü�Һ��
        change_screen(PROCESS_INJECT_SCREEN);
        process_inject_set(screen);
    elseif para == ActionItem[4] then --��ȡ�ź�
        change_screen(PROCESS_READ_SIGNAL_SCREEN);
        process_read_signal_set(screen);
    elseif para == ActionItem[5] then --�䶯�ü�Һ
        change_screen(PROCESS_PERISTALTIC_SCREEN);
        process_peristaltic_set(screen);
    elseif para == ActionItem[6] then --����
        change_screen(PROCESS_CALCULATE_SCREEN);
        process_calculate_set(screen);
    elseif para == ActionItem[7] then --�ȴ�ʱ��
        change_screen(PROCESS_WAIT_TIME_SCREEN);
        process_wait_time_set(screen);
    elseif para == ActionItem[8] then --����
        change_screen(PROCESS_DISPEL_SCREEN);
        process_dispel_set(screen);
    elseif para == ActionItem[9] then --������
        change_screen(PROCESS_VALVE_CTRL_SCREEN);
        process_valve_ctrl_set(screen);
    end
end


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set2_control_notify(screen,control,value)
    if control == ProcessSelectButtonId then--���������ѡ��ťʱ
        process_select2_set(PROCESS_SET2_SCREEN, ProcessSelectId);
    elseif control == ProcessSelectId then
        --        set_text(process_set1_control_notify,);
    elseif (control-100) >= ActionTab[1].selectId and (control-100) <= ActionTab[12].selectId then--�����"����ѡ��"����İ�ťʱ
        action_select_set(PROCESS_SET2_SCREEN, control-100);
    elseif control >= ActionTab[1].EditId and control <= ActionTab[12].EditId then--�����"�༭"��ťʱ
        if string.len( get_text(PROCESS_SET2_SCREEN, control+100) ) ~= 0 then--��������˶�������(�༭��ť��id+100���ڶ�������id)
            set_edit_screen(get_text(PROCESS_SET2_SCREEN, control+200), PROCESS_SET2_SCREEN);--control+200��ʾ��Ӧ��"����ѡ��"id
        end
    end
end



--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set3_control_notify(screen,control,value)
    if control == ProcessSelectButtonId then--���������ѡ��ťʱ
        process_select2_set(PROCESS_SET3_SCREEN, ProcessSelectId);
    elseif (control-100) >= ActionTab[13].selectId and (control-100) <= ActionTab[24].selectId then--�����"����ѡ��"����İ�ťʱ
        action_select_set(PROCESS_SET3_SCREEN, control-100);
    elseif control >= ActionTab[13].EditId and control <= ActionTab[24].EditId then--�����"�༭"��ťʱ
        if string.len( get_text(PROCESS_SET3_SCREEN, control+100) ) ~= 0 then--��������˶�������(�༭��ť��id+100���ڶ�������id)
            set_edit_screen(get_text(PROCESS_SET3_SCREEN, control+200), PROCESS_SET3_SCREEN);--control+200��ʾ��Ӧ��"����ѡ��"id
        end
    end
end


--�������л�����������3ʱ��ִ�д˻ص�����
function goto_ProcessSet3()
    set_text(PROCESS_SET3_SCREEN, ProcessSelectShowId, get_text(PROCESS_SET2_SCREEN,ProcessSelectId));
end


-----------------------------------��������-��ʼ ��������--------------------------------------------
--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_start_set(screen)
	DestScreen = screen;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_start_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end


-----------------------------------��������-ȡ�� ��������--------------------------------------------
--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_get_sample_set(screen)
	DestScreen = screen;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_get_sample_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end



-----------------------------------��������-ע��ü�Һ ��������--------------------------------------------
--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_inject_set(screen)
	DestScreen = screen;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_inject_control_notify(screen,control,value)
    if control == SureButtonId then --ȷ�ϰ�ť
        change_screen(DestScreen);
    elseif control == CancelButtonId then --ȡ����ť
        change_screen(DestScreen);
    end
end



-----------------------------------��������-�䶯�ü�Һ ��������--------------------------------------------
--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_peristaltic_set(screen)
	DestScreen = screen;
end

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
--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_dispel_set(screen)
	DestScreen = screen;
end

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

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_read_signal_set(screen)
	DestScreen = screen;
end

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

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_calculate_set(screen)
	DestScreen = screen;
end

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

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_valve_ctrl_set(screen)
	DestScreen = screen;
end

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

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function process_wait_time_set(screen)
	DestScreen = screen;
end

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


-----------------------------------����ѡ��2 ��������--------------------------------------------

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



-----------------------------------����ѡ�� ��������--------------------------------------------
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







