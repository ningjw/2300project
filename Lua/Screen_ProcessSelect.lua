
ProcessItem = {"分析","校正","清洗","管路填充","零点核查","标样核查","跨度核查"," "};

local AnalysisButtonId = 1;--分析按钮
local NullButtonId = 8;--空按钮

local SureButtonId = 12;--确认按钮
local CancelButtonId = 11;--取消按钮


ProcessSelectItem = 8;

--该函数在on_control_notify中进行调用（当需要选择流程时）
function process_select_set(screen,control)
	DestScreen = screen;
	DestControl = control;
end


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function process_select_control_notify(screen, control, value)

	if control >= AnalysisButtonId and control <= NullButtonId then
		ProcessSelectItem = control;
	elseif control == SureButtonId then --确认按钮
		change_screen(DestScreen);
		set_text(DestScreen, DestControl, ProcessItem[ProcessSelectItem]);--DestControl对应流程选择
		if DestScreen == PROCESS_SET1_SCREEN then
			set_text(DestScreen, DestControl-100, ProcessItem[ProcessSelectItem]);--DestControl-100对应流程名称
		end

	elseif control == CancelButtonId then --取消按钮
		change_screen(DestScreen);
	end

end



