
ProcessItem = {"����","У��","��ϴ","��·���","���˲�","�����˲�","��Ⱥ˲�"," "};

local AnalysisButtonId = 1;--������ť
local NullButtonId = 8;--�հ�ť

local SureButtonId = 12;--ȷ�ϰ�ť
local CancelButtonId = 11;--ȡ����ť


ProcessSelectItem = 8;

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
		set_text(DestScreen, DestControl, ProcessItem[ProcessSelectItem]);--DestControl��Ӧ����ѡ��
		if DestScreen == PROCESS_SET1_SCREEN then
			set_text(DestScreen, DestControl-100, ProcessItem[ProcessSelectItem]);--DestControl-100��Ӧ��������
		end

	elseif control == CancelButtonId then --ȡ����ť
		change_screen(DestScreen);
	end

end



