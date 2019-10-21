require("Lua/Screen_ProcessSelect");
require("Lua/ScreenId");

RunTypeID = 43;--运行方式对应的文本空间ID
RunType = Nil;

HandProcessID = 300;--手动设置：手动流程对应的文本控件ID
HandProcess = Nil;
HandProcessTimesID = 171; --手动设置：次数对应的文本空间ID
HandProcessTimes = Nil;


PeriodicProcess1ID = 301;--周期设置：流程1对应的文本框ID
PeriodicProcess1 = Nil;
PeriodicProcess2ID = 302;--周期设置：流程1对应的文本框ID
PeriodicProcess2 = Nil;
PeriodicProcess3ID = 303;--周期设置：流程1对应的文本框ID
PeriodicProcess3 = Nil;
PeriodicProcess4ID = 304;--周期设置：流程1对应的文本框ID
PeriodicProcess4 = Nil;
PeriodicProcessStartYearID = 155;--周期设置：开始时间-年
PeriodicProcessStartYear = Nil;
PeriodicProcessStartMonthID = 156;--周期设置：开始时间-月
PeriodicProcessStartMonth = Nil;
PeriodicProcessStartDayID = 157;--周期设置：开始时间-日
PeriodicProcessStartDay = Nil;
PeriodicProcessStartHourID = 158;--周期设置：开始时间-时
PeriodicProcessStartHour = Nil;
PeriodicProcessStartMinuteID = 159;--周期设置：开始时间-分
PeriodicProcessStartMinute = Nil;
PeriodicProcessFrequencyID = 176;--周期设置：频率
PeriodicProcessFrequency = Nil;

TimedProcess1ID = 305;         --定时设置：流程1
TimedProcess1 = Nil;
TimedProcess1StartHourID = 94;
TimedProcess1StartHour = Nil;
TimedProcess1StartMinuteID = 95;
TimedProcess1StartMinute = Nil;

TimedProcess2ID = 306;         --定时设置：流程2
TimedProcess2 = Nil;
TimedProcess2StartHourID = 92;
TimedProcess2StartHour = Nil;
TimedProcess2StartMinuteID = 96;
TimedProcess2StartMinute = Nil;

TimedProcess3ID = 307;         --定时设置：流程3
TimedProcess3 = Nil;
TimedProcess3StartHourID = 119;
TimedProcess3StartHour = Nil;
TimedProcess3StartMinuteID = 120;
TimedProcess3StartMinute = Nil;

TimedProcess4ID = 308;         --定时设置：流程4
TimedProcess4 = Nil;
TimedProcess4StartHourID = 49;
TimedProcess4StartHour = Nil;
TimedProcess4StartMinuteID = 50;
TimedProcess4StartMinute = Nil;

TimedProcess5ID = 309;         --定时设置：流程5
TimedProcess5 = Nil;
TimedProcess5StartHourID = 98;
TimedProcess5StartHour = Nil;
TimedProcess5StartMinuteID = 99;
TimedProcess5StartMinute = Nil;

TimedProcess6ID = 310;         --定时设置：流程6
TimedProcess6 = Nil;
TimedProcess6StartHourID = 122;
TimedProcess6StartHour = Nil;
TimedProcess6StartMinuteID = 123;
TimedProcess6StartMinute = Nil;

TimedProcess7ID = 311;         --定时设置：流程7
TimedProcess7 = Nil;
TimedProcess7StartHourID = 54;
TimedProcess7StartHour = Nil;
TimedProcess7StartMinuteID = 56;
TimedProcess7StartMinute = Nil;

TimedProcess8ID = 312;         --定时设置：流程8
TimedProcess8 = Nil;
TimedProcess8StartHourID = 101;
TimedProcess8StartHour = Nil;
TimedProcess8StartMinuteID = 102;
TimedProcess8StartMinute = Nil;

TimedProcess9ID = 313;         --定时设置：流程9
TimedProcess9 = Nil;
TimedProcess9StartHourID = 125;
TimedProcess9StartHour = Nil;
TimedProcess9StartMinuteID = 126;
TimedProcess9StartMinute = Nil;

TimedProcess10ID = 314;         --定时设置：流程10
TimedProcess10 = Nil;
TimedProcess10StartHourID = 60;
TimedProcess10StartHour = Nil;
TimedProcess10StartMinuteID = 62;
TimedProcess10StartMinute = Nil;

TimedProcess11ID = 315;         --定时设置：流程11
TimedProcess11 = Nil;
TimedProcess11StartHourID = 104;
TimedProcess11StartHour = Nil;
TimedProcess11StartMinuteID = 105;
TimedProcess11StartMinute = Nil;

TimedProcess12ID = 316;         --定时设置：流程12
TimedProcess12 = Nil;
TimedProcess12StartHourID = 128;
TimedProcess12StartHour = Nil;
TimedProcess12StartMinuteID = 129;
TimedProcess12StartMinute = Nil;

TimedProcess13ID = 317;         --定时设置：流程13
TimedProcess13 = Nil;
TimedProcess13StartHourID = 67;
TimedProcess13StartHour = Nil;
TimedProcess13StartMinuteID = 69;
TimedProcess13StartMinute = Nil;

TimedProcess14ID = 318;         --定时设置：流程14
TimedProcess14 = Nil;
TimedProcess14StartHourID = 107;
TimedProcess14StartHour = Nil;
TimedProcess14StartMinuteID = 108;
TimedProcess14StartMinute = Nil;

TimedProcess15ID = 319;         --定时设置：流程15
TimedProcess15 = Nil;
TimedProcess15StartHourID = 132;
TimedProcess15StartHour = Nil;
TimedProcess15StartMinuteID = 133;
TimedProcess15StartMinute = Nil;

TimedProcess16ID = 320;         --定时设置：流程16
TimedProcess16 = Nil;
TimedProcess16StartHourID = 73;
TimedProcess16StartHour = Nil;
TimedProcess16StartMinuteID = 76;
TimedProcess16StartMinute = Nil;

TimedProcess17ID = 321;         --定时设置：流程17
TimedProcess17 = Nil;
TimedProcess17StartHourID = 110;
TimedProcess17StartHour = Nil;
TimedProcess17StartMinuteID = 111;
TimedProcess17StartMinute = Nil;

TimedProcess18ID = 322;         --定时设置：流程18
TimedProcess18 = Nil;
TimedProcess18StartHourID = 135;
TimedProcess18StartHour = Nil;
TimedProcess18StartMinuteID = 136;
TimedProcess18StartMinute = Nil;

TimedProcess19ID = 323;         --定时设置：流程19
TimedProcess19 = Nil;
TimedProcess19StartHourID = 80;
TimedProcess19StartHour = Nil;
TimedProcess19StartMinuteID = 82;
TimedProcess19StartMinute = Nil;

TimedProcess20ID = 324;         --定时设置：流程20
TimedProcess20 = Nil;
TimedProcess20StartHourID = 113;
TimedProcess20StartHour = Nil;
TimedProcess20StartMinuteID = 114;
TimedProcess20StartMinute = Nil;

TimedProcess21ID = 325;         --定时设置：流程21
TimedProcess21 = Nil;
TimedProcess21StartHourID = 138;
TimedProcess21StartHour = Nil;
TimedProcess21StartMinuteID = 139;
TimedProcess21StartMinute = Nil;

TimedProcess22ID = 326;         --定时设置：流程22
TimedProcess22 = Nil;
TimedProcess22StartHourID = 86;
TimedProcess22StartHour = Nil;
TimedProcess22StartMinuteID = 88;
TimedProcess22StartMinute = Nil;

TimedProcess23ID = 327;         --定时设置：流程23
TimedProcess23 = Nil;
TimedProcess23StartHourID = 116;
TimedProcess23StartHour = Nil;
TimedProcess23StartMinuteID = 117;
TimedProcess23StartMinute = Nil;

TimedProcess24ID = 328;         --定时设置：流程24
TimedProcess24 = Nil;
TimedProcess24StartHourID = 141;
TimedProcess24StartHour = Nil;
TimedProcess24StartMinuteID = 142;
TimedProcess24StartMinute = Nil;


--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function run_control_notify(screen,control,value)
	--control-100表示与该按钮重合的文本框
	if (control-100) >= HandProcessID and (control-100) <= TimedProcess24ID then
		process_select_set(screen, control-100);--(control100)表示与该按钮重合的文本框
	end
end















