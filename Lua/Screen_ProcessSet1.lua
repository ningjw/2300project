require("Lua/Screen_ProcessSelect");
require("Lua/Screen_RangeSelect");
require("Lua/ScreenId");
require("Lua/Screen_Main");

local THIS_SCREEN = PROCESS_SET1_SCREEN

--�������ñ��и��ؼ�Id,ע��selecId��nameId����ѧ��ϵ:selectId = nameId + 100, selectId = deleteId + 220 �ȵ�
TabProcess = {[1] = {selectId = 300, nameId = 200, rangeId = 312, activeId = 95, deleteId = 80},
              [2] = {selectId = 301, nameId = 201, rangeId = 313, activeId = 96, deleteId = 81},
              [3] = {selectId = 302, nameId = 202, rangeId = 314, activeId = 97, deleteId = 82},
              [4] = {selectId = 303, nameId = 203, rangeId = 315, activeId = 99, deleteId = 83},
              [5] = {selectId = 304, nameId = 204, rangeId = 316, activeId = 100,deleteId = 84},
              [6] = {selectId = 305, nameId = 205, rangeId = 317, activeId = 101,deleteId = 85},
              [7] = {selectId = 306, nameId = 206, rangeId = 318, activeId = 102,deleteId = 85},
              [8] = {selectId = 307, nameId = 207, rangeId = 319, activeId = 103,deleteId = 87},
              [9] = {selectId = 308, nameId = 208, rangeId = 320, activeId = 104,deleteId = 88},
              [10]= {selectId = 309, nameId = 209, rangeId = 321, activeId = 105,deleteId = 89},
              [11]= {selectId = 310, nameId = 210, rangeId = 322, activeId = 48, deleteId = 90},
              [12]= {selectId = 311, nameId = 211, rangeId = 323, activeId = 92, deleteId = 91},
       };


AnalyteSetId = 38;--������ѡ��
CodeSetId = 107;--����
UniteSetId = 36;--��λѡ��
UniteSetTextId = 111--��λ���óɹ���,������ʾ��λ�ı���id


--���õ�λ
function set_unit()
    local Unite = get_text(THIS_SCREEN, UniteSetTextId);
    --�������ý�����,�ؼ�Id = 200 ~ 208Ϊ��λ��ʾ�ı�
    for i = 200,208,1 do 
        set_text(RANGE_SET_SCREEN, i, Unite);
    end
    --��ҳ��,�ռ�Id= 19 Ϊ��λ��ʾ
    set_text(MAIN_SCREEN,LastAnalysisUnitId, Unite);
    --����ѡ�������,�ؼ�Id = 15/20/25Ϊ��λ��ʾ�ı�
    set_text(RANGE_SELECT_SCREEN,15 , Unite);
    set_text(RANGE_SELECT_SCREEN,20 , Unite);
    set_text(RANGE_SELECT_SCREEN,25 , Unite);
end


--���÷�����
function set_analyte()
    set_text(MAIN_SCREEN, LastAnalyteId, get_text(THIS_SCREEN, AnalyteSetId));
end


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function process_set1_control_notify(screen,control,value)
    if(control == UniteSetId) then --���õ�λ
        set_unit();
    elseif control == AnalyteSetId then
        set_analyte();
    --control-100��ʾ��ð�ť�غϵ��ı���id
    elseif (control-100) >= TabProcess[1].selectId and (control-100) <= TabProcess[12].selectId then --����������ѡ���µĸ�����ť
        process_select_set(screen, control-100);
    elseif (control-100) >= TabProcess[1].rangeId and (control-100) <= TabProcess[12].rangeId  then --����������ѡ���µĸ�����ť
        range_select_set(screen, control-100);
    elseif control >= TabProcess[1].deleteId and control <= TabProcess[12].deleteId then--ɾ����ť
        if string.len(get_text(THIS_SCREEN, control+120)) ~= 1 and  --���ƿ���Ϊһ���ո�,��ʱ��������û������
           string.len(get_text(THIS_SCREEN, control+120)) ~= 0 then --���Ƶĳ���Ϊ0,��ʾ����û������
            set_text(THIS_SCREEN, control+220," ");--����Ӧ����ѡ����ı���ʾΪ�ո�
            set_text(THIS_SCREEN, control+120," ");--����Ӧ�������Ƶ��ı���ʾΪ�ո�
        end
    end   


end


