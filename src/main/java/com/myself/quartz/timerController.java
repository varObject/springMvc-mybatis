package com.myself.quartz;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class timerController {
	// 日志记录工具
	private final static Log LOG = LogFactory.getLog(timerController.class);
	
	public void work(){
		LOG.info("调用定时器。。。。。");
	}
}
