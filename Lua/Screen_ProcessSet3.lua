require("Lua/ScreenId");
require("Lua/Screen_ProcessSet2");

local THIS_SCREEN = PROCESS_SET3_SCREEN;
local ProcessSelectTextId = 38;


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set3_control_notify(screen,control,value)
    if control == ProcessSelectButtonId then--���������ѡ��ťʱ
        process_select2_set(THIS_SCREEN, ProcessSelectId);
    elseif (control-100) >= ActionTab[13].selectId and (control-100) <= ActionTab[24].selectId then--�����"����ѡ��"����İ�ťʱ
        action_select_set(THIS_SCREEN, control-100);
    elseif control >= ActionTab[13].EditId and control <= ActionTab[24].EditId then--�����"�༭"��ťʱ
        if string.len( get_text(THIS_SCREEN, control+100) ) ~= 0 then--��������˶�������(�༭��ť��id+100���ڶ�������id)
            set_edit_screen(get_text(THIS_SCREEN, control+200), THIS_SCREEN);--control+200��ʾ��Ӧ��"����ѡ��"id
        end
    end
end


--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_ProcessSet3()
    set_text(THIS_SCREEN, ProcessSelectTextId, get_text(PROCESS_SET2_SCREEN,ProcessSelectId));
end