package com.whackon.witmed.base.pojo.vo;

import com.whackon.witmed.base.pojo.enums.ResponseEnum;
import lombok.Data;

import java.io.Serializable;

/**
 * <b>响应视图信息</b>
 *
 * @author Arthur
 * @date 2022/7/2
 */
@Data
public class ResponseVO<E> implements Serializable {
	private static final long serialVersionUID = -1243700449847575050L;
	private Integer code;                       // 系统响应编码
	private String message;                     // 系统响应信息
	private E data;                             // 系统响应数据

	public ResponseVO(ResponseEnum responseEnum, String message, E data) {
		this.code = responseEnum.getCode();
		this.message = message;
		this.data = data;
	}

	/**
	 * <b>获得系统业务处理完毕响应成功视图信息</b>
	 * @param message
	 * @return
	 */
	public static ResponseVO successResponseVO(String message) {
		return new ResponseVO(ResponseEnum.RESPONSE_CODE_SUCCESS, message, "");
	}

	/**
	 * <b>获得系统业务处理完毕响应成功视图信息</b>
	 * @param message
	 * @param data
	 * @return
	 */
	public static ResponseVO successResponseVO(String message, Object data) {
		return new ResponseVO(ResponseEnum.RESPONSE_CODE_SUCCESS, message, data);
	}

	/**
	 * <b>获得用户未进行系统认证视图信息</b>
	 * @return
	 */
	public static ResponseVO unAuthResponseVO() {
		return new ResponseVO(ResponseEnum.RESPONSE_CODE_UNAUTH, ResponseEnum.RESPONSE_CODE_UNAUTH.getRemark(), "");
	}

	/**
	 * <b>获得系统业务处理错误视图信息</b>
	 * @param errorMessage
	 * @return
	 */
	public static ResponseVO failureResponseVO(String errorMessage) {
		return new ResponseVO(ResponseEnum.RESPONSE_CODE_FAILURE, errorMessage, "");
	}

	/**
	 * <b>获得系统业务响应异常视图信息</b>
	 * @param e
	 * @return
	 */
	public static ResponseVO exceptionResponseVO(Exception e) {
		return new ResponseVO(ResponseEnum.RESPONSE_CODE_EXCEPTION, e.getMessage(), e);
	}
}
