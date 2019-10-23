--�����г��˳��õĻص�����
--���๦�����Ķ�<<������LUA�ű�API.pdf>>

require("Lua/ScreenId");
require("Lua/Screen_RunControl");
require("Lua/Screen_ProcessSelect");
require("Lua/Screen_ProcessSelect2");
require("Lua/Screen_ProcessSet1");
require("Lua/Screen_ProcessSet2");
require("Lua/Screen_ProcessSet3");
require("Lua/Screen_RangeSelect");
require("Lua/Screen_ActionSelect");
require("Lua/Screen_ProcessStart");
require("Lua/Screen_ProcessGetSample");
require("Lua/Screen_ProcessInject");
require("Lua/Screen_ProcessPeristaltic");
require("Lua/Screen_ProcessDispel");
require("Lua/Screen_ProcessReadSignal");
require("Lua/Screen_ProcessCalculate");
require("Lua/Screen_ProcessValveCtrl");
require("Lua/Screen_ProcessWaitTime");
require("Lua/Screen_RangeSet");
require("Lua/screen_SystemInfo");
require("Lua/Screen_LoginSystem");
require("Lua/Screen_PasswordSet");

--��ʼ������,ϵͳ����LUA�ű����������ôλص�����
function on_init()
	uart_set_baudrate(38400);
	set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, 0);
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
	if(screen == RANGE_SELECT_SCREEN) then --��ת������ѡ�����
		goto_range_select();
	elseif screen == PROCESS_SET2_SCREEN then --��ת����������2����
	   goto_ProcessSet2();
	elseif screen== PROCESS_SELECT2_SCREEN then --��ת������ѡ��2����
		goto_ProcessSelect2();
	elseif screen== ACTION_SELECT_SCREEN then --��ת������ѡ�����
 		goto_ActionSelect();
	elseif screen== LOGIN_SYSTEM_SCREEN then--��¼ϵͳ����	
		goto_LoginSystem();
	elseif screen== PASSWORD_SET_SCREEN then--�������ý���
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
uart_free_protocol=1
--�����Զ��庯��
function on_uart_recv_data(rev_data)

end



