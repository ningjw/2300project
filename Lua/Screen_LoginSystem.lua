require("Lua/ScreenId")

local THIS_SCREEN = LOGIN_SYSTEM_SCREEN;
local UserNameId = 26;
local userName;

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
    set_text(THIS_SCREEN, UserNameId, userName);
end
