package com.whackon.witmed.patient.patient.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * <b>智慧医疗信息平台 - 病人功能 - 病人联系人详情实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("pa_patient_liaison")
public class Liaison extends BaseEntity {
	private static final long serialVersionUID = -3543903153476678024L;
	@TableId(type = IdType.INPUT)
	private String id;                      // 主键，使用雪花算法生成唯一主键
	@TableField(value = "patient")
	private String patient;                 // 病人信息
	@TableField(value = "idType")
	private String idType;                  // 证件类别
	@TableField(value = "idNo")
	private String idNo;                    // 证件
	@TableField(value = "idEffDate")
	private Date idEffDate;                 // 证件生效日期
	@TableField(value = "idExpDate")
	private Date idExpDate;                 // 证件失效日期
	@TableField(value = "idOrg")
	private String idOrg;                   // 证件提供机构
	@TableField(value = "liaisonType")
	private String liaisonType;             // 联系人类型
	@TableField(value = "name")
	private String name;                    // 姓名
}
