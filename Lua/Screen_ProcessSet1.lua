require("Lua/Screen_ProcessSelect");
require("Lua/Screen_RangeSelect");
require("Lua/ScreenId");


--�������ñ��и��ؼ�Id
Tab1 = {process1 = {selectId = 300, nameId = 92,  rangeId = 312, activeId = 95},
        process2 = {selectId = 301, nameId = 94,  rangeId = 313, activeId = 96},
        process3 = {selectId = 302, nameId = 113, rangeId = 314, activeId = 97},
        process4 = {selectId = 303, nameId = 115, rangeId = 315, activeId = 99},
        process5 = {selectId = 304, nameId = 117, rangeId = 316, activeId = 100},
        process6 = {selectId = 305, nameId = 119, rangeId = 317, activeId = 101},
        process7 = {selectId = 306, nameId = 121, rangeId = 318, activeId = 102},
        process8 = {selectId = 307, nameId = 123, rangeId = 319, activeId = 103},
        process9 = {selectId = 308, nameId = 125, rangeId = 320, activeId = 104},
        process10= {selectId = 309, nameId = 127, rangeId = 321, activeId = 105},
        process11= {selectId = 310, nameId = 50,  rangeId = 322, activeId = 48},
        process12= {selectId = 311, nameId = 93,  rangeId = 323, activeId = 91},
       };


AnalyteSetId = 38;--������ѡ��
CodeSetId = 107;--����
UniteSetId = 36;--��λѡ��

--���õ�λ
function set_unit()

end


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set1_control_notify(screen,control,value)
    if(control == UniteSetId) then --���õ�λ
        set_unit();
    end

    --control-100��ʾ��ð�ť�غϵ��ı���id
    if (control-100) >= Tab1.process1.selectId and (control-100) <= Tab1.process12.selectId then --����������ѡ���µĸ�����ť
        process_select_set(screen, control-100);
    elseif (control-100) >= Tab1.process1.rangeId and (control-100) <= Tab1.process12.rangeId  then --����������ѡ���µĸ�����ť
        range_select_set(screen, control-100);
    end


end


