require("Lua/ScreenId");

local THIS_SCREEN =  PROCESS_GET_SANPLE_SCREEN
local SureButtonId = 99;--ȷ�ϰ�ť
local CancelButtonId = 98;--ȡ����ť

local DestScreen;

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