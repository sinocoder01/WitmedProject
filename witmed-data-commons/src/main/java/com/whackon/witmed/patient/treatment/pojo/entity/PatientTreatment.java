package com.whackon.witmed.patient.treatment.pojo.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 病人功能 - 病人就诊实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/14
 */
@Data
@TableName("pa_patient_treatment")
public class PatientTreatment extends BaseEntity {
	private static final long serialVersionUID = 5304198089349393060L;
	@TableId
    private String id;                      // 主键，使用雪花算法生成唯一主键
	@TableField(value = "patient")
	private String patient;                 // 病人信息
	@TableField(value = "emrNo")
	private String emrNo;                   // 病历号
	@TableField(value = "txNo")
	private String txNo;                    // 就诊号
}