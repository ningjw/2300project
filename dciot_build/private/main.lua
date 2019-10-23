--下面列出了常用的回调函数
--更多功能请阅读<<物联型LUA脚本API.pdf>>

require("Lua/ScreenId");
require("Lua/Screen_RunControl");
require("Lua/Screen_ProcessSelect");
require("Lua/Screen_ProcessSelect2");
require("Lua/Screen_ProcessSet1");
require("Lua/Screen_ProcessSet2");
require("Lua/Screen_ProcessSet3");
require("Lua/Screen_RangeSelect");
require("Lua/Screen_ActionSelect");
require("Lua/Screen_ProcessStart");
require("Lua/Screen_ProcessGetSample");
require("Lua/Screen_ProcessInject");
require("Lua/Screen_ProcessPeristaltic");
require("Lua/Screen_ProcessDispel");
require("Lua/Screen_ProcessReadSignal");
require("Lua/Screen_ProcessCalculate");
require("Lua/Screen_ProcessValveCtrl");
require("Lua/Screen_ProcessWaitTime");
require("Lua/Screen_RangeSet");
require("Lua/screen_SystemInfo");
require("Lua/Screen_LoginSystem");
require("Lua/Screen_PasswordSet");

--初始化函数,系统加载LUA脚本后，立即调用次回调函数
function on_init()
	uart_set_baudrate(38400);
	set_value(SYSTEM_INFO_SCREEN, OperatorLoginId, 0);
end

--定时回调函数，系统每隔1秒钟自动调用。
function on_systick()
end

--用户通过触摸修改控件后，执行此回调函数。
--点击按钮控件，修改文本控件、修改滑动条都会触发此事件。
function on_control_notify(screen,control,value)
	if screen == RUN_CONTROL_SCREEN then --运行控制界面
		run_control_notify(screen,control,value);
	elseif screen == PROCESS_SELECT_SCREEN then --流程选择界面
		process_select_control_notify(screen,control,value);
	elseif screen == PROCESS_SELECT2_SCREEN then--流程选择2界面
		process_select2_control_notify(screen,control,value);	
 	elseif screen == PROCESS_SET1_SCREEN then --流程设置1界面
		process_set1_control_notify(screen,control,value);
	elseif screen == PROCESS_SET2_SCREEN then --流程设置2界面
		process_set2_control_notify(screen,control,value);
    elseif screen == PROCESS_SET3_SCREEN then --流程设置3界面
		process_set3_control_notify(screen,control,value);
	elseif screen == RANGE_SELECT_SCREEN then --量程选择界面
		range_select_control_notify(screen,control,value);
	elseif screen == ACTION_SELECT_SCREEN then--动作选择界面
		action_select_control_notify(screen,control,value);
	elseif screen == PROCESS_START_SCREEN then--流程设置-开始界面
		process_start_control_notify(screen,control,value);
 	elseif screen == PROCESS_GET_SANPLE_SCREEN	then--流程设置-取样界面
		process_get_sample_control_notify(screen,control,value);
 	elseif screen == PROCESS_INJECT_SCREEN	then--流程设置-注射泵加液
		process_inject_control_notify(screen,control,value);
 	elseif screen == PROCESS_PERISTALTIC_SCREEN	then--流程设置-蠕动泵加液
		process_peristaltic_control_notify(screen,control,value);
	elseif screen == PROCESS_DISPEL_SCREEN then--流程设置-消解
		process_dispel_control_notify(screen,control,value);
    elseif screen == PROCESS_READ_SIGNAL_SCREEN then--流程设置-读取信号
		process_read_signal_control_notify(screen,control,value);
    elseif screen == PROCESS_CALCULATE_SCREEN then--流程设置-计算
		process_calculate_control_notify(screen,control,value);	
    elseif screen == PROCESS_VALVE_CTRL_SCREEN then--流程设置-阀操作
		process_valve_ctrl_control_notify(screen,control,value);
    elseif screen == PROCESS_WAIT_TIME_SCREEN then--流程设置-等待时间
		process_wait_time_control_notify(screen,control,value);	
 	elseif screen == SYSTEM_INFO_SCREEN then --系统信息界面
		system_info_control_notify(screen,control,value);	
	elseif screen== LOGIN_SYSTEM_SCREEN then--登录系统界面
		login_system_control_notify(screen,control,value);	
 	elseif screen== PASSWORD_SET_SCREEN then--密码设置界面
		login_system_control_notify(screen,control,value);		
	end
end

--当画面切换时，执行此回调函数，screen为目标画面。
function on_screen_change(screen)
	if(screen == RANGE_SELECT_SCREEN) then --跳转到量程选择界面
		goto_range_select();
	elseif screen == PROCESS_SET2_SCREEN then --跳转到流程设置2界面
	   goto_ProcessSet2();
	elseif screen== PROCESS_SELECT2_SCREEN then --跳转到流程选择2界面
		goto_ProcessSelect2();
	elseif screen== ACTION_SELECT_SCREEN then --跳转到动作选择界面
 		goto_ActionSelect();
	elseif screen== LOGIN_SYSTEM_SCREEN then--登录系统界面	
		goto_LoginSystem();
	elseif screen== PASSWORD_SET_SCREEN then--密码设置界面
		goto_PasswordSet();
	end
end


--定时器超时，执行此回调函数,定时器编号 0~31
function on_timer(timer_id)

end


--插入 U 盘后，执行此回调函数
function on_usb_inserted(dir)

end

--拔出 U 盘后，执行此回调函数
function on_usb_removed()

end

--插入 SD 卡后，执行此回调函数
function on_sd_inserted(dir)

end

--拔出 SD 卡后，执行此回调函数
function on_sd_removed()

end

--设置全局变量uart_free_protocol，使用自由串口协议
uart_free_protocol=1
--串口自定义函数
function on_uart_recv_data(rev_data)

end



