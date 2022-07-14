package com.whackon.witmed.system.hospital.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 医院实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("sys_hospital")
public class Hospital extends BaseEntity {
	private static final long serialVersionUID = -7418587273850317256L;
	@TableId(type = IdType.AUTO)
	private Long id;                        // 主键
	@TableField(value = "name")
	private String name;                    // 医院名称
	@TableField(value = "orgCode")
	private String orgCode;                 // 组织机构编码
	@TableField(value = "charge")
	private String charge;                  // 负责人
	@TableField(value = "province")
	private String province;                // 所在省份
	@TableField(value = "city")
	private String city;                    // 所在城市
	@TableField(value = "district")
	private String district;                // 所在区县
	@TableField(value = "address")
	private String address;                 // 详细地址
	@TableField(value = "telephone")
	private String telephone;               // 联系电话
}
