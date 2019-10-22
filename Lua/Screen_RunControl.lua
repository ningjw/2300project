require("Lua/Screen_ProcessSelect");
require("Lua/ScreenId");

RunTypeID = 43;--运行方式对应的文本空间ID
RunType = Nil;


--手动设置
HandProcessID = 300;--手动设置：手动流程对应的文本控件ID
HandProcessTimesID = 171; --手动设置：次数对应的文本空间ID


PeriodicTab = { Process1Id = 301, Process2Id = 302, Process3Id = 303, Process4Id = 304,
                YearId = 155, MonthId = 156, DayId = 157, HourId = 158, MinuteId = 159, FreqId = 176};

--定时设置
TimedTab = {
	Process1  = {Id = 305, StartHourId = 94,  StartMinuteId = 95},
	Process2  = {Id = 306, StartHourId = 92,  StartMinuteId = 96},
	Process3  = {Id = 307, StartHourId = 119, StartMinuteId = 120},
	Process4  = {Id = 308, StartHourId = 49,  StartMinuteId = 50},
	Process5  = {Id = 309, StartHourId = 98,  StartMinuteId = 99},
	Process6  = {Id = 310, StartHourId = 122, StartMinuteId = 123},
	Process7  = {Id = 311, StartHourId = 54,  StartMinuteId = 56},
	Process8  = {Id = 312, StartHourId = 101, StartMinuteId = 102},
	Process9  = {Id = 313, StartHourId = 125, StartMinuteId = 126},
	Process10 = {Id = 314, StartHourId = 60,  StartMinuteId = 62},
	Process11 = {Id = 315, StartHourId = 104, StartMinuteId = 105},
	Process12 = {Id = 316, StartHourId = 128, StartMinuteId = 129},
	Process13 = {Id = 317, StartHourId = 67,  StartMinuteId = 69},
	Process14 = {Id = 318, StartHourId = 107, StartMinuteId = 108},
	Process15 = {Id = 319, StartHourId = 132, StartMinuteId = 133},
	Process16 = {Id = 320, StartHourId = 73,  StartMinuteId = 76},
	Process17 = {Id = 321, StartHourId = 11,  StartMinuteId = 111},
	Process18 = {Id = 322, StartHourId = 135, StartMinuteId = 136},
	Process19 = {Id = 323, StartHourId = 80, StartMinuteId = 82},
	Process20 = {Id = 324, StartHourId = 113, StartMinuteId = 114},
	Process21 = {Id = 325, StartHourId = 138, StartMinuteId = 139},
	Process22 = {Id = 326, StartHourId = 86, StartMinuteId = 88},
	Process23 = {Id = 327, StartHourId = 116, StartMinuteId = 117},
	Process24 = {Id = 328, StartHourId = 141, StartMinuteId = 142},
};


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function run_control_notify(screen,control,value)
	--control-100表示与该按钮重合的文本框
	if (control-100) >= HandProcessID and (control-100) <= TimedTab.Process24.Id then
		process_select2_set(screen, control-100);--(control100)表示与该按钮重合的文本框
	end
end















