package com.whackon.witmed.system.techtitle.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 专业技术职务实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("sys_tech_title")
public class TechTtile extends BaseEntity {
	private static final long serialVersionUID = 3945500339013956514L;
	@TableId(type = IdType.AUTO)
	private Long id;                        // 主键
	@TableField(value = "techCat")
	private String techCat;                 // 所属类别
	@TableField(value = "techRank")
	private String techRank;                // 所属等级
	@TableField(value = "code")
	private String code;                    // 等级编码
	@TableField(value = "name")
	private String name;                    // 等级名称
}
