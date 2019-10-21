require("Lua/Screen_ProcessSelect");
require("Lua/ScreenId");

RunTypeID = 43;--���з�ʽ��Ӧ���ı��ռ�ID
RunType = Nil;

HandProcessID = 300;--�ֶ����ã��ֶ����̶�Ӧ���ı��ؼ�ID
HandProcess = Nil;
HandProcessTimesID = 171; --�ֶ����ã�������Ӧ���ı��ռ�ID
HandProcessTimes = Nil;


PeriodicProcess1ID = 301;--�������ã�����1��Ӧ���ı���ID
PeriodicProcess1 = Nil;
PeriodicProcess2ID = 302;--�������ã�����1��Ӧ���ı���ID
PeriodicProcess2 = Nil;
PeriodicProcess3ID = 303;--�������ã�����1��Ӧ���ı���ID
PeriodicProcess3 = Nil;
PeriodicProcess4ID = 304;--�������ã�����1��Ӧ���ı���ID
PeriodicProcess4 = Nil;
PeriodicProcessStartYearID = 155;--�������ã���ʼʱ��-��
PeriodicProcessStartYear = Nil;
PeriodicProcessStartMonthID = 156;--�������ã���ʼʱ��-��
PeriodicProcessStartMonth = Nil;
PeriodicProcessStartDayID = 157;--�������ã���ʼʱ��-��
PeriodicProcessStartDay = Nil;
PeriodicProcessStartHourID = 158;--�������ã���ʼʱ��-ʱ
PeriodicProcessStartHour = Nil;
PeriodicProcessStartMinuteID = 159;--�������ã���ʼʱ��-��
PeriodicProcessStartMinute = Nil;
PeriodicProcessFrequencyID = 176;--�������ã�Ƶ��
PeriodicProcessFrequency = Nil;

TimedProcess1ID = 305;         --��ʱ���ã�����1
TimedProcess1 = Nil;
TimedProcess1StartHourID = 94;
TimedProcess1StartHour = Nil;
TimedProcess1StartMinuteID = 95;
TimedProcess1StartMinute = Nil;

TimedProcess2ID = 306;         --��ʱ���ã�����2
TimedProcess2 = Nil;
TimedProcess2StartHourID = 92;
TimedProcess2StartHour = Nil;
TimedProcess2StartMinuteID = 96;
TimedProcess2StartMinute = Nil;

TimedProcess3ID = 307;         --��ʱ���ã�����3
TimedProcess3 = Nil;
TimedProcess3StartHourID = 119;
TimedProcess3StartHour = Nil;
TimedProcess3StartMinuteID = 120;
TimedProcess3StartMinute = Nil;

TimedProcess4ID = 308;         --��ʱ���ã�����4
TimedProcess4 = Nil;
TimedProcess4StartHourID = 49;
TimedProcess4StartHour = Nil;
TimedProcess4StartMinuteID = 50;
TimedProcess4StartMinute = Nil;

TimedProcess5ID = 309;         --��ʱ���ã�����5
TimedProcess5 = Nil;
TimedProcess5StartHourID = 98;
TimedProcess5StartHour = Nil;
TimedProcess5StartMinuteID = 99;
TimedProcess5StartMinute = Nil;

TimedProcess6ID = 310;         --��ʱ���ã�����6
TimedProcess6 = Nil;
TimedProcess6StartHourID = 122;
TimedProcess6StartHour = Nil;
TimedProcess6StartMinuteID = 123;
TimedProcess6StartMinute = Nil;

TimedProcess7ID = 311;         --��ʱ���ã�����7
TimedProcess7 = Nil;
TimedProcess7StartHourID = 54;
TimedProcess7StartHour = Nil;
TimedProcess7StartMinuteID = 56;
TimedProcess7StartMinute = Nil;

TimedProcess8ID = 312;         --��ʱ���ã�����8
TimedProcess8 = Nil;
TimedProcess8StartHourID = 101;
TimedProcess8StartHour = Nil;
TimedProcess8StartMinuteID = 102;
TimedProcess8StartMinute = Nil;

TimedProcess9ID = 313;         --��ʱ���ã�����9
TimedProcess9 = Nil;
TimedProcess9StartHourID = 125;
TimedProcess9StartHour = Nil;
TimedProcess9StartMinuteID = 126;
TimedProcess9StartMinute = Nil;

TimedProcess10ID = 314;         --��ʱ���ã�����10
TimedProcess10 = Nil;
TimedProcess10StartHourID = 60;
TimedProcess10StartHour = Nil;
TimedProcess10StartMinuteID = 62;
TimedProcess10StartMinute = Nil;

TimedProcess11ID = 315;         --��ʱ���ã�����11
TimedProcess11 = Nil;
TimedProcess11StartHourID = 104;
TimedProcess11StartHour = Nil;
TimedProcess11StartMinuteID = 105;
TimedProcess11StartMinute = Nil;

TimedProcess12ID = 316;         --��ʱ���ã�����12
TimedProcess12 = Nil;
TimedProcess12StartHourID = 128;
TimedProcess12StartHour = Nil;
TimedProcess12StartMinuteID = 129;
TimedProcess12StartMinute = Nil;

TimedProcess13ID = 317;         --��ʱ���ã�����13
TimedProcess13 = Nil;
TimedProcess13StartHourID = 67;
TimedProcess13StartHour = Nil;
TimedProcess13StartMinuteID = 69;
TimedProcess13StartMinute = Nil;

TimedProcess14ID = 318;         --��ʱ���ã�����14
TimedProcess14 = Nil;
TimedProcess14StartHourID = 107;
TimedProcess14StartHour = Nil;
TimedProcess14StartMinuteID = 108;
TimedProcess14StartMinute = Nil;

TimedProcess15ID = 319;         --��ʱ���ã�����15
TimedProcess15 = Nil;
TimedProcess15StartHourID = 132;
TimedProcess15StartHour = Nil;
TimedProcess15StartMinuteID = 133;
TimedProcess15StartMinute = Nil;

TimedProcess16ID = 320;         --��ʱ���ã�����16
TimedProcess16 = Nil;
TimedProcess16StartHourID = 73;
TimedProcess16StartHour = Nil;
TimedProcess16StartMinuteID = 76;
TimedProcess16StartMinute = Nil;

TimedProcess17ID = 321;         --��ʱ���ã�����17
TimedProcess17 = Nil;
TimedProcess17StartHourID = 110;
TimedProcess17StartHour = Nil;
TimedProcess17StartMinuteID = 111;
TimedProcess17StartMinute = Nil;

TimedProcess18ID = 322;         --��ʱ���ã�����18
TimedProcess18 = Nil;
TimedProcess18StartHourID = 135;
TimedProcess18StartHour = Nil;
TimedProcess18StartMinuteID = 136;
TimedProcess18StartMinute = Nil;

TimedProcess19ID = 323;         --��ʱ���ã�����19
TimedProcess19 = Nil;
TimedProcess19StartHourID = 80;
TimedProcess19StartHour = Nil;
TimedProcess19StartMinuteID = 82;
TimedProcess19StartMinute = Nil;

TimedProcess20ID = 324;         --��ʱ���ã�����20
TimedProcess20 = Nil;
TimedProcess20StartHourID = 113;
TimedProcess20StartHour = Nil;
TimedProcess20StartMinuteID = 114;
TimedProcess20StartMinute = Nil;

TimedProcess21ID = 325;         --��ʱ���ã�����21
TimedProcess21 = Nil;
TimedProcess21StartHourID = 138;
TimedProcess21StartHour = Nil;
TimedProcess21StartMinuteID = 139;
TimedProcess21StartMinute = Nil;

TimedProcess22ID = 326;         --��ʱ���ã�����22
TimedProcess22 = Nil;
TimedProcess22StartHourID = 86;
TimedProcess22StartHour = Nil;
TimedProcess22StartMinuteID = 88;
TimedProcess22StartMinute = Nil;

TimedProcess23ID = 327;         --��ʱ���ã�����23
TimedProcess23 = Nil;
TimedProcess23StartHourID = 116;
TimedProcess23StartHour = Nil;
TimedProcess23StartMinuteID = 117;
TimedProcess23StartMinute = Nil;

TimedProcess24ID = 328;         --��ʱ���ã�����24
TimedProcess24 = Nil;
TimedProcess24StartHourID = 141;
TimedProcess24StartHour = Nil;
TimedProcess24StartMinuteID = 142;
TimedProcess24StartMinute = Nil;


--�û�ͨ�������޸Ŀؼ���ִ�д˻ص�������
--�����ť�ؼ����޸��ı��ؼ����޸Ļ��������ᴥ�����¼���
function run_control_notify(screen,control,value)
	--control-100��ʾ��ð�ť�غϵ��ı���
	if (control-100) >= HandProcessID and (control-100) <= TimedProcess24ID then
		process_select_set(screen, control-100);--(control100)��ʾ��ð�ť�غϵ��ı���
	end
end















