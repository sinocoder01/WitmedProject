package com.whackon.witmed.system.admin.pojo.vo;

import com.whackon.witmed.base.pojo.vo.BaseVO;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 人员身份视图信息</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
@Data
public class IdentityVO extends BaseVO {
	private static final long serialVersionUID = 379439724696937522L;
	private Long id;                        // 主键
	@NotBlank
	private String code;                    // 身份编号
	@NotBlank
	private String name;                    // 身份名称
}
