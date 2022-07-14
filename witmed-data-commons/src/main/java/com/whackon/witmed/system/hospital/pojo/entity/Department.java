package com.whackon.witmed.system.hospital.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 科室部门实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("sys_department")
public class Department extends BaseEntity {
	private static final long serialVersionUID = -5793475151487271519L;
	@TableId(type = IdType.AUTO)
	private Long id;                        // 主键
	@TableField(value = "hospital")
	private String hospital;                // 所属医院
	@TableField(value = "parent")
	private String parent;                  // 上级科室
	@TableField(value = "code")
	private String code;                    // 科室编码
	@TableField(value = "name")
	private String name;                    // 科室名称
	@TableField(value = "sort")
	private Long sort;                      // 顺序
}
