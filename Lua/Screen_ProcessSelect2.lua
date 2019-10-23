require("Lua/ScreenId");
require("Lua/Screen_ProcessSet1");

local FirstButtonId = 101;--��һ����ť
local LastButtonId = 112;--���һ����ť

local SureButtonId = 19;--ȷ�ϰ�ť
local CancelButtonId = 18;--ȡ����ť

local TipsTextId = 13;

local DestScreen;--���"ȷ��""ȡ��"��ť���л�����һ��Ŀ�껭��
local DestControl;--���"ȷ��""ȡ��"��ť��,����һ��Ŀ��ؼ����в���

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