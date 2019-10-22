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
	elseif screen== ACTION_SELECT_SCREEN then--����ѡ�����
		action_select_control_notify(screen,control,value);
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



