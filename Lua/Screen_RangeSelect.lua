Range1Id = 1;--����1��ťId
Range2Id = 2;--����2��ťId
Range3Id = 3;--����3��ťId

Range1LowId = 64;--����1�ı�id
Range1HighId = 65;--����1�ı�id
Range2LowId = 16;--����2�ı�id
Range2HighId = 17;--����2�ı�id
Range3LowId = 21;--����3�ı�id
Range3HighId = 22;--����3�ı�id

RangeSureId = 8;
RangeCancelId = 12;

RangeSelectItem = 1;

--�ú�����on_control_notify�н��е��ã�����Ҫѡ������ʱ��
function range_select_set(screen,control)
	RangeDestScreen = screen;
	RangeDestControl = control;
end

--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function range_select_control_notify(screen, control, value)

    if control == Range1Id then
        RangeSelectItem = 1;
    elseif control == Range2Id then
        RangeSelectItem = 2;
    elseif control == Range3Id then
        RangeSelectItem = 3;
    elseif control == RangeSureId then --ȷ�ϰ�ť
        change_screen(RangeDestScreen);
        set_text(RangeDestScreen, RangeDestControl, RangeSelectItem);
    elseif control == RangeCancelId then
        change_screen(RangeDestScreen);
    end
end


--�������л�ʱ��ִ�д˻ص�������screenΪĿ�껭�档
function goto_range_select ()
    set_text(RANGE_SELECT_SCREEN, Range1LowId,  get_text(RANGE_SET_SCREEN,64));
    set_text(RANGE_SELECT_SCREEN, Range1HighId, get_text(RANGE_SET_SCREEN,65));
    set_text(RANGE_SELECT_SCREEN, Range2LowId,  get_text(RANGE_SET_SCREEN,77));
    set_text(RANGE_SELECT_SCREEN, Range2HighId, get_text(RANGE_SET_SCREEN,78));
    set_text(RANGE_SELECT_SCREEN, Range3LowId,  get_text(RANGE_SET_SCREEN,115));
    set_text(RANGE_SELECT_SCREEN, Range3HighId, get_text(RANGE_SET_SCREEN,116));
end