package com.whackon.witmed.system.emr.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 病历实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("sys_emr")
public class Emr extends BaseEntity {
	private static final long serialVersionUID = 1L;
	@TableId(type = IdType.AUTO)
    private Long id;                        // 主键
	@TableField(value = "code")
	private String code;                    // 病历编号
	@TableField(value = "name")
	private String name;                    // 病历名称
	@TableField(value = "url")
	private String url;                     // 链接地址
}