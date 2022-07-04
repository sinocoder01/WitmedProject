package com.whackon.witmed.base.util;

import cn.hutool.core.util.StrUtil;
import cn.hutool.jwt.JWT;
import cn.hutool.jwt.JWTUtil;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <b>Token 工具类</b>
 *
 * @author Arthur
 * @date 2022/7/2
 */
public class TokenUtil {
	private static final String PAYLOAD_KEY = "payload";

	/**
	 * <b>根据所给定的信息生成 Token</b>
	 * @param value
	 * @param expireSec
	 * @return
	 */
	public static String createToken(Object value, Integer expireSec) {
		// 创建有效载荷对应 Map 集合
		Map<String, Object> payloadMap = new HashMap<String, Object>();
		// 设置所给定的对象为有效载荷信息
		payloadMap.put(PAYLOAD_KEY, value);
		// 设置生成 Token 的有效时长
		// 根据所存储的时长，获得对应过期的 Date 类型
		// 获得当前的时间毫秒，加上有效期的毫秒时长
		Long expireMillis = System.currentTimeMillis() + expireSec * 1000;
		// 根据最终的毫秒数获得 Date 类型
		Date expireDate = new Date(expireMillis);
		payloadMap.put(JWT.EXPIRES_AT, expireDate);

		// 生成对应的 Token
		return JWTUtil.createToken(payloadMap, BaseConstants.BASE_TOKEN_KEY.getBytes());
	}

	/**
	 * <b>校验 Token 并获得对应有效载荷信息</b>
	 * @param token
	 * @return
	 */
	public static Object validateToken(String token) {
		if (StrUtil.isNotBlank(token) && JWTUtil.verify(token, BaseConstants.BASE_TOKEN_KEY.getBytes())) {
			// 此时 Token 存在，并且校验有效，解析 Token 获得对应的信息
			return JWTUtil.parseToken(token).getPayload(PAYLOAD_KEY);
		}
		return null;
	}
}
