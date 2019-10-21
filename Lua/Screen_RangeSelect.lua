Range1Id = 1;--量程1按钮Id
Range2Id = 2;--量程2按钮Id
Range3Id = 3;--量程3按钮Id

RangeSureId = 8;
RangeCancelId = 12;

RangeSelectItem = 1;

--该函数在on_control_notify中进行调用（当需要选择流程时）
function range_select_set(screen,control)
	RangeDestScreen = screen;
	RangeDestControl = control;
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function range_select_control_notify(screen, control, value)

    if control == Range1Id then
        RangeSelectItem = 1;
    elseif control == Range2Id then
        RangeSelectItem = 2;
    elseif control == Range3Id then
        RangeSelectItem = 3;
    elseif control == RangeSureId then --确认按钮
        change_screen(RangeDestScreen);
        set_text(RangeDestScreen, RangeDestControl, RangeSelectItem);
    elseif control == RangeCancelId then
        change_screen(RangeDestScreen);
    end
end