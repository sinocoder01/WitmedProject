package com.whackon.witmed.system.admin.pojo.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 人员职位实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("sys_admin_position")
public class Position extends BaseEntity {
	private static final long serialVersionUID = -4422273010965431667L;
	@TableId
	private Long id;                        // 主键
	@TableField(value = "department")
	private String department;                        // 所属科室
	@TableField(value = "code")
	private String code;                        // 职位编码
	@TableField(value = "name")
	private String name;                        // 职位名称
}
