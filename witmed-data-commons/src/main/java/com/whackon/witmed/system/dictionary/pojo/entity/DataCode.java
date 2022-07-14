package com.whackon.witmed.system.dictionary.pojo.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 数据元值域实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("sys_data_code")
public class DataCode extends BaseEntity {
	private static final long serialVersionUID = -5016038598091781606L;
	@TableId
	private Long id;                        // 主键
	@TableField(value = "parent")
	private String parent;                  // 所属数据元
	@TableField(value = "code")
	private String code;                    // 数据元值域
	@TableField(value = "remark")
	private String remark;                  // 数据元值域说明
}
