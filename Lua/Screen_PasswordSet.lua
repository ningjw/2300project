require("Lua/ScreenId")

local THIS_SCREEN = PASSWORD_SET_SCREEN;
local UserNameId = 26;
local userName;

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
    set_text(THIS_SCREEN, UserNameId, userName);
end
