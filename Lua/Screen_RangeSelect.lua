Range1Id = 1;--量程1按钮Id
Range2Id = 2;--量程2按钮Id
Range3Id = 3;--量程3按钮Id

Range1LowId = 64;--量程1文本id
Range1HighId = 65;--量程1文本id
Range2LowId = 16;--量程2文本id
Range2HighId = 17;--量程2文本id
Range3LowId = 21;--量程3文本id
Range3HighId = 22;--量程3文本id

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


--当画面切换时，执行此回调函数，screen为目标画面。
function goto_range_select ()
    set_text(RANGE_SELECT_SCREEN, Range1LowId,  get_text(RANGE_SET_SCREEN,64));
    set_text(RANGE_SELECT_SCREEN, Range1HighId, get_text(RANGE_SET_SCREEN,65));
    set_text(RANGE_SELECT_SCREEN, Range2LowId,  get_text(RANGE_SET_SCREEN,77));
    set_text(RANGE_SELECT_SCREEN, Range2HighId, get_text(RANGE_SET_SCREEN,78));
    set_text(RANGE_SELECT_SCREEN, Range3LowId,  get_text(RANGE_SET_SCREEN,115));
    set_text(RANGE_SELECT_SCREEN, Range3HighId, get_text(RANGE_SET_SCREEN,116));
end