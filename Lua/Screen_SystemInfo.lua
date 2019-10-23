
require("Lua/ScreenId");
require("Lua/Screen_PasswordSet");
require("Lua/Screen_LoginSystem");

local THIS_SCREEN = SYSTEM_INFO_SCREEN;

maintainerPwdSetId = 50;
administratorPwdSetId = 51;
PwdSetTab = {
    [maintainerPwdSetId] = {userName = "��άԱ"},
    [administratorPwdSetId] = {userName = "����Ա"}
};

OperatorLoginId = 72;
maintainerLoginId = 47;
administratorLoginId = 48;
LoginTab = {
    [OperatorLoginId] = {userName = "����Ա"},
    [maintainerLoginId] = {userName = "��άԱ"},
    [administratorLoginId] = {userName = "����Ա"}
};

EquipmentTypeSetId = 60;
EquipmentTypeTextId = 11;--ÿ�������е������ͺ�id����11




--���������ͺ�
function set_equipment_type()
    for i = 1,16,1 do
        set_text(PublicTab[i], EquipmentTypeTextId, get_text(THIS_SCREEN,EquipmentTypeSetId));
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