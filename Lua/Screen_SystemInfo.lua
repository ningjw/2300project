
require("Lua/ScreenId");
require("Lua/Screen_PasswordSet");
require("Lua/Screen_LoginSystem");

local THIS_SCREEN = SYSTEM_INFO_SCREEN;

maintainerPwdSetId = 50;
administratorPwdSetId = 51;
PwdSetTab = {
    [maintainerPwdSetId] = {userName = "运维员"},
    [administratorPwdSetId] = {userName = "管理员"}
};

OperatorLoginId = 72;
maintainerLoginId = 47;
administratorLoginId = 48;
LoginTab = {
    [OperatorLoginId] = {userName = "操作员"},
    [maintainerLoginId] = {userName = "运维员"},
    [administratorLoginId] = {userName = "管理员"}
};

EquipmentTypeSetId = 60;
EquipmentTypeTextId = 11;--每个界面中的仪器型号id都是11




--设置仪器型号
function set_equipment_type()
    for i = 1,16,1 do
        set_text(PublicTab[i], EquipmentTypeTextId, get_text(THIS_SCREEN,EquipmentTypeSetId));
    end
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function system_info_control_notify(screen,control,value)
    if control == EquipmentTypeSetId then
        set_equipment_type();
    elseif control == maintainerPwdSetId or control == administratorPwdSetId then--运维员与管理员密码设置按钮
        password_set_set(PwdSetTab[control].userName);
    elseif control == OperatorLoginId or control == maintainerLoginId or control == administratorLoginId then--操作员/运维员/管理员密码设置按钮
        login_system_set(LoginTab[control].userName);
        change_screen(LOGIN_SYSTEM_SCREEN);

    end
end