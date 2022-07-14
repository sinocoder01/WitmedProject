package com.whackon.witmed.patient.patient.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 病人功能 - 病人通信详情实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("pa_patient_communication")
public class Communication extends BaseEntity {
	private static final long serialVersionUID = 3697081790256246545L;
	@TableId(type = IdType.INPUT)
	private String id;                      // 主键，使用雪花算法生成唯一主键
	@TableField(value = "patient")
	private String patient;                 // 病人信息
	@TableField(value = "phoneCat")
	private String phoneCat;                // 联系电话-类别
	@TableField(value = "phoneNo")
	private String phoneNo;                 // 联系电话-号码
	@TableField(value = "email")
	private String email;                   // 电子邮件地址
}
