package com.whackon.witmed.system.admin.service;

import com.whackon.witmed.base.pojo.vo.PageVO;
import com.whackon.witmed.system.admin.pojo.vo.IdentityVO;

import java.util.List;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 人员身份业务层接口</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
public interface IdentityService {
	/**
	 * <b>分页查询视图信息</b>
	 * @param queryVO
	 * @param pageVO
	 * @return
	 * @throws Exception
	 */
	PageVO<IdentityVO> getPage(IdentityVO queryVO, PageVO<IdentityVO> pageVO) throws Exception;

	/**
	 * <b>查询视图列表</b>
	 * @param queryVO
	 * @return
	 * @throws Exception
	 */
	List<IdentityVO> getList(IdentityVO queryVO) throws Exception;

	/**
	 * <b>根据主键查询视图</b>
	 * @param id
	 * @return
	 * @throws Exception
	 */
	IdentityVO getById(Long id) throws Exception;

	/**
	 * <b>根据编码查询视图</b>
	 * @param code
	 * @return
	 * @throws Exception
	 */
	IdentityVO getByCode(String code) throws Exception;

	/**
	 * <b>插入信息</b>
	 * @param identityVO
	 * @return
	 * @throws Exception
	 */
	boolean insert(IdentityVO identityVO) throws Exception;

	/**
	 * <b>修改信息</b>
	 * @param identityVO
	 * @return
	 * @throws Exception
	 */
	boolean update(IdentityVO identityVO) throws Exception;
}
