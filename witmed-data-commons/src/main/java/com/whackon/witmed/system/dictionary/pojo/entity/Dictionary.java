package com.whackon.witmed.system.dictionary.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 系统字典实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("sys_dictionary")
public class Dictionary extends BaseEntity {
	private static final long serialVersionUID = 7172482097907332555L;
	@TableId(type = IdType.AUTO)
	private Long id;                        // 主键
	@TableField(value = "parent")
	private String parent;                  // 上级字典
	@TableField(value = "code")
	private String code;                    // 字典编码
	@TableField(value = "text")
	private String text;                    // 字典文本
}
