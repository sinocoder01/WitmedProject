package com.whackon.witmed.system.admin.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.whackon.witmed.base.pojo.entity.BaseEntity;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 系统用户实体信息</b>
 *
 * @author Arthur
 * @date 2022/7/12
 */
@Data
@TableName("sys_admin")
public class Admin extends BaseEntity {
	private static final long serialVersionUID = 6133440870357639746L;
	@TableId(type = IdType.INPUT)
	private String id;                      // 主键，使用雪花算法生成唯一主键
	@TableField(value = "no")
	private String no;                      // 工号
	@TableField(value = "name")
	private String name;                    // 姓名
	@TableField(value = "cellphone")
	private String cellphone;               // 手机号码
	@TableField(value = "password")
	private String password;                // 登录密码，MD5 加密
	@TableField(value = "identity")
	private String identity;                // 人员身份
	@TableField(value = "position")
	private String position;                // 人员职位
	@TableField(value = "department")
	private String department;              // 所属科室
	@TableField(value = "eduBackground")
	private String eduBackground;           // 学历
	@TableField(value = "techTitle")
	private String techTitle;               // 专业技术职务
}
