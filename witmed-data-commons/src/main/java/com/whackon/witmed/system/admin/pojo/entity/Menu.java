package com.whackon.witmed.system.admin.pojo.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 系统功能菜单实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("sys_menu")
public class Menu extends BaseEntity {
	private static final long serialVersionUID = 6494472229034048736L;
	@TableId
	private Long id;                        // 主键
	@TableField(value = "parent")
	private String parent;                        // 所属功能
	@TableField(value = "code")
	private String code;                        // 功能编码
	@TableField(value = "text")
	private String text;                        // 功能文本
	@TableField(value = "url")
	private String url;                        // 链接地址
	@TableField(value = "icon")
	private String icon;                        // 功能图标
	@TableField(value = "sort")
	private Long sort;                        // 顺序
}
