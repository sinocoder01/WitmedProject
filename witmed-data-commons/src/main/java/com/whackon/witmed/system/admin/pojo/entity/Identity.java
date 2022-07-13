package com.whackon.witmed.system.admin.pojo.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 人员身份实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
@Data
@TableName("sys_admin_identity")
public class Identity extends BaseEntity {
	private static final long serialVersionUID = 7646673991659330003L;
	private Long id;                        // 主键
	private String code;                    // 身份编号
	private String name;                    // 身份名称
}
