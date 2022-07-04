package com.whackon.witmed.base.util;

import com.fasterxml.jackson.databind.json.JsonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * <b>Redis 操作工具类</b>
 *
 * @author Arthur
 * @date 2022/7/2
 */
@Component("redisUtil")
public class RedisUtil {
	@Autowired
	private StringRedisTemplate redisTemplate;

	/**
	 * <b>根据所给定的 key，将对应的 value 保存到 Redis 中</b>
	 * @param key
	 * @param value
	 * @param expireSec
	 * @return
	 */
	public boolean saveToRedis(String key, Object value, Integer expireSec) throws Exception {
		// 将所保存的 value 变为 JSON
		// 创建 JsonMapper 对象
		JsonMapper jsonMapper = new JsonMapper();
		// 将对应的 Object 类型的 value 变成 String 类型的 JSON
		String jsonValue = jsonMapper.writeValueAsString(value);
		// 将对应的信息存入到 Redis 中
		redisTemplate.opsForValue().set(key, jsonValue);
		// 判断是否有存储时长
		if (expireSec != null && expireSec > -1) {
			// 设置存储时长
			redisTemplate.expire(key, expireSec, TimeUnit.SECONDS);
		}
		return true;
	}

	/**
	 * <b>根据 key 获取存储在 Redis 中的对象</b>
	 * @param key
	 * @param typeClass
	 * @return
	 * @throws Exception
	 */
	public Object getFromRedis(String key, Class typeClass) throws Exception {
		// 根据 key 从 Redis 中获得对应的数据
		String jsonValue = redisTemplate.opsForValue().get(key);
		// 判断该 value 是否存在
		if (jsonValue != null) {
			// 根据所给定的类型，将 String 变为对应对象
			// 创建 JsonMapper 对象
			JsonMapper jsonMapper = new JsonMapper();
			// 进行变换类型
			return jsonMapper.readValue(jsonValue, typeClass);
		}
		return null;
	}

	/**
	 * <b>根据 key 将信息从 Redis 中移除</b>
	 * @param key
	 * @return
	 * @throws Exception
	 */
	public boolean deleteFromRedis(String key) throws Exception {
		return redisTemplate.delete(key);
	}
}
