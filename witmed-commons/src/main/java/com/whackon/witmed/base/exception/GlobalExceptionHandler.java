package com.whackon.witmed.base.exception;

import com.whackon.witmed.base.pojo.vo.ResponseVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Date;

/**
 * <b>系统异常处理</b>
 *
 * @author Arthur
 * @date 2022/7/4
 */
@RestControllerAdvice
public class GlobalExceptionHandler {
	// 所有通过控制层所抛出的异常，都会最终交给该类处理，那么对于所产生的异常需要记录在日志中，
	// 创建 Logback 日志对象
	private Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	/**
	 * <b>处理控制层所抛出的异常信息</b>
	 * @param e
	 * @return
	 */
	@ExceptionHandler
	public ResponseVO globalExceptionHandle(Exception e) {
		// 记录日志信息
		logger.error(e.getMessage() + ":" + new Date(), e);
		// 返回系统业务响应异常视图信息
		return ResponseVO.exceptionResponseVO(e);
	}
}
