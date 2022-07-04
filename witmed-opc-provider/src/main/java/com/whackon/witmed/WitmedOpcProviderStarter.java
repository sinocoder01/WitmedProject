package com.whackon.witmed;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

/**
 * <b>智慧医疗信息平台 - 门诊功能 Provider 启动类</b>
 *
 * @author Arthur
 * @date 2022/7/4
 */
@MapperScan("com.whackon.witmed.*.*.dao")
@EnableEurekaClient
@SpringBootApplication
public class WitmedOpcProviderStarter {
	public static void main(String[] args) {
		SpringApplication.run(WitmedOpcProviderStarter.class, args);
	}
}
