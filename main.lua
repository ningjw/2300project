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
--初始化函数,系统加载LUA脚本后，立即调用次回调函数
function on_init()
	uart_set_baudrate(38400);
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
	elseif screen== ACTION_SELECT_SCREEN then--动作选择界面
		action_select_control_notify(screen,control,value);
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



