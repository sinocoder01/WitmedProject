package com.whackon.witmed;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * <b>智慧医疗信息平台 - 系统功能 Consumer 启动类</b>
 *
 * @author Arthur
 * @date 2022/7/4
 */
@EnableFeignClients
@EnableEurekaClient
@SpringBootApplication
public class WitmedSystemConsumerStarter {
}
