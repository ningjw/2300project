require("Lua/ScreenId");
require("Lua/Screen_ProcessSet1")
require("Lua/Screen_ProcessSelect2");
require("Lua/Screen_ActionSelect")

local THIS_SCREEN = PROCESS_SET2_SCREEN;

ProcessSelectButtonId = 35;
ProcessSelectId = 38;

--����ע��۲춯��ѡ��id,��������id,�༭id֮�����ѧת����ϵ:selectId = nameId + 100; nameId = EditId + 100
ActionTab = {
    [1]  = {selectId = 300, nameId = 200, EditId = 100},
    [2]  = {selectId = 301, nameId = 201, EditId = 101},
    [3]  = {selectId = 302, nameId = 202, EditId = 102},
    [4]  = {selectId = 303, nameId = 203, EditId = 103},
    [5]  = {selectId = 304, nameId = 204, EditId = 104},
    [6]  = {selectId = 305, nameId = 205, EditId = 105},
    [7]  = {selectId = 306, nameId = 206, EditId = 106},
    [8]  = {selectId = 307, nameId = 207, EditId = 107},
    [9]  = {selectId = 308, nameId = 208, EditId = 108},
    [10] = {selectId = 309, nameId = 209, EditId = 109},
    [11] = {selectId = 310, nameId = 210, EditId = 110},
    [12] = {selectId = 311, nameId = 211, EditId = 111},
};


--���ñ༭��ť��Ӧ����ת����
function set_edit_screen(para)
    if para == ActionItem[1] then --��ʼ����
        change_screen(PROCESS_START_SCREEN);
    elseif para == ActionItem[2] then --ȡ������
        change_screen(PROCESS_GET_SANPLE_SCREEN);
    elseif para == ActionItem[3] then --ע��ü�Һ��
        change_screen(PROCESS_INJECT_SCREEN);
    elseif para == ActionItem[4] then --��ȡ�ź�
        change_screen(PROCESS_READ_SIGNAL_SCREEN);
    elseif para == ActionItem[5] then --�䶯�ü�Һ
        change_screen(PROCESS_PERISTALTIC_SCREEN);
    elseif para == ActionItem[6] then --����
        change_screen(PROCESS_CALCULATE_SCREEN);
    elseif para == ActionItem[7] then --�ȴ�ʱ��
        change_screen(PROCESS_WAIT_TIME_SCREEN);
    elseif para == ActionItem[8] then --����
        change_screen(PROCESS_DISPEL_SCREEN);
    elseif para == ActionItem[9] then --������
        change_screen(PROCESS_VALVE_CTRL_SCREEN);
    end

end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set2_control_notify(screen,control,value)
    if control == ProcessSelectButtonId then--���������ѡ��ťʱ
        process_select2_set(THIS_SCREEN, ProcessSelectId);
    elseif control == ProcessSelectId then
        --        set_text(process_set1_control_notify,);
    elseif (control-100) >= ActionTab[1].selectId and (control-100) <= ActionTab[12].selectId then--�����"����ѡ��"����İ�ťʱ
        action_select_set(THIS_SCREEN, control-100);
    elseif control >= ActionTab[1].EditId and control <= ActionTab[12].EditId then--�����"�༭"��ťʱ
        if string.len( get_text(THIS_SCREEN, control+100) ) ~= 0 then--��������˶�������(�༭��ť��id+100���ڶ�������id)
            set_edit_screen(get_text(THIS_SCREEN, control+200));--control+200��ʾ��Ӧ��"����ѡ��"id
        end
    end
end

--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_ProcessSet2()
    
end