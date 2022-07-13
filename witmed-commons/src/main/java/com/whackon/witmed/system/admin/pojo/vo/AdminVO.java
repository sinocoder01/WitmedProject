package com.whackon.witmed.system.admin.pojo.vo;

import com.whackon.witmed.base.pojo.vo.BaseVO;
import lombok.Data;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 系统用户视图信息</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
@Data
public class AdminVO extends BaseVO {
	private static final long serialVersionUID = 811957010974699686L;
	private String id;                      // 主键
	private String no;                      // 工号
	private String name;                    // 姓名
	private String cellphone;               // 手机号码
	private String password;                // 登录密码，MD5 加密
	private String identity;                // 身份
	private String position;                // 职位
	private String department;              // 所属科室部门
	private String eduBackground;           // 学历
	private String techTitle;               // 专业技术职务
}
