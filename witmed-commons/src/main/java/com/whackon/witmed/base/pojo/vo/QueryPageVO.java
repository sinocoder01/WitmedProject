package com.whackon.witmed.base.pojo.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * <b>查询分页视图信息</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
@Data
public class QueryPageVO<E> implements Serializable {
	private static final long serialVersionUID = -7051580131896636576L;
	private E queryVO;
	private PageVO pageVO;

	public QueryPageVO() {}

	public QueryPageVO(E queryVO, Integer pageNum, Integer pageSize) {
		this.queryVO = queryVO;
		this.pageVO = new PageVO(pageNum, pageSize);
	}
}
