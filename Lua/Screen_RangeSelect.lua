Range1Id = 1;--����1��ťId
Range2Id = 2;--����2��ťId
Range3Id = 3;--����3��ťId

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