package com.whackon.witmed.system.division.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 行政区划实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("sys_division")
public class Division extends BaseEntity {
	private static final long serialVersionUID = 3945728722993461962L;
	@TableId(type = IdType.AUTO)
	private Long id;                        // 主键
	@TableField(value = "parent")
	private String parent;                  // 上级行政区划
	@TableField(value = "code")
	private String code;                    // 行政区划编码
	@TableField(value = "name")
	private String name;                    // 行政区划名称
}
