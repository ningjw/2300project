require("Lua/ScreenId");
require("Lua/Screen_ProcessSet1")
require("Lua/Screen_ProcessSelect2");

ProcessSelectButtonId = 35;
ProcessSelectId = 38;



--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set2_control_notify(screen,control,value)
    if control == ProcessSelectButtonId then
        process_select2_set(PROCESS_SET2_SCREEN,ProcessSelectId);
    end
end

--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_ProcessSet2()
    
end