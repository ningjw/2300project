require("Lua/ScreenId");

ActionItem = {"��ʼ","ȡ��","ע��ü�Һ��","��ȡ�ź�","�䶯�ü�Һ","����","�ȴ�ʱ��","����","������"," "};
ActionSelectItem = nil;

local SureButtonId = 19;--ȷ�ϰ�ť
local CancelButtonId = 18;--ȡ����ť
local StartButtonId = 1;
local NullButtonId = 10;

local DestScreen;
local DestControl;


--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function action_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function action_select_control_notify(screen,control,value)
    if control >= StartButtonId and control <= NullButtonId then
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

--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_ActionSelect()

end

