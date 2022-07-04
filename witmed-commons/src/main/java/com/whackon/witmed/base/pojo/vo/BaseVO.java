package com.whackon.witmed.base.pojo.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * <b>基础视图信息</b>
 *
 * @author Arthur
 * @date 2022/7/2
 */
@Data
public class BaseVO implements Serializable {
	private static final long serialVersionUID = 5307507834353921384L;
	private String status;                      // 系统状态：Y-启用，N-禁用
	private String createdBy;                   // 创建人
	private Date createTime;                    // 创建时间
	private String modifiedBy;                  // 修改人
	private Date modifiedTime;                  // 修改时间
}
