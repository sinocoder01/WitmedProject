package com.whackon.witmed.system.education.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 学历信息实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/14
 */
@Data
@TableName("sys_edu_background")
public class EduBackground extends BaseEntity {
	private static final long serialVersionUID = 7550816068344657101L;
	@TableId(type = IdType.AUTO)
    private Long id;                        // 主键
	@TableField(value = "code")
	private String code;                    // 学历编码
	@TableField(value = "name")
	private String name;                    // 学历名称
}