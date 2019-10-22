require("Lua/Screen_ProcessSelect");
require("Lua/Screen_RangeSelect");
require("Lua/ScreenId");
require("Lua/Screen_Main");

--�������ñ��и��ؼ�Id
TabProcess = {[1] = {selectId = 300, nameId = 200, rangeId = 312, activeId = 95},
              [2] = {selectId = 301, nameId = 201, rangeId = 313, activeId = 96},
              [3] = {selectId = 302, nameId = 202, rangeId = 314, activeId = 97},
              [4] = {selectId = 303, nameId = 203, rangeId = 315, activeId = 99},
              [5] = {selectId = 304, nameId = 204, rangeId = 316, activeId = 100},
              [6] = {selectId = 305, nameId = 205, rangeId = 317, activeId = 101},
              [7] = {selectId = 306, nameId = 206, rangeId = 318, activeId = 102},
              [8] = {selectId = 307, nameId = 207, rangeId = 319, activeId = 103},
              [9] = {selectId = 308, nameId = 208, rangeId = 320, activeId = 104},
              [10]= {selectId = 309, nameId = 209, rangeId = 321, activeId = 105},
              [11]= {selectId = 310, nameId = 210, rangeId = 322, activeId = 48},
              [12]= {selectId = 311, nameId = 211, rangeId = 323, activeId = 92},
       };


AnalyteSetId = 38;--������ѡ��
CodeSetId = 107;--����
UniteSetId = 36;--��λѡ��

--���õ�λ
function set_unit()
    
end


--���÷�����
function set_analyte()
    set_text(MAIN_SCREEN, LastAnalyteId, get_text(PROCESS_SET1_SCREEN, AnalyteSetId));
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set1_control_notify(screen,control,value)
    if(control == UniteSetId) then --���õ�λ
        set_unit();
    elseif control == AnalyteSetId then
        set_analyte();
    end
    
    --control-100��ʾ��ð�ť�غϵ��ı���id
    if (control-100) >= TabProcess[1].selectId and (control-100) <= TabProcess[12].selectId then --����������ѡ���µĸ�����ť
        process_select_set(screen, control-100);
    elseif (control-100) >= TabProcess[1].rangeId and (control-100) <= TabProcess[12].rangeId  then --����������ѡ���µĸ�����ť
        range_select_set(screen, control-100);
    end


end


