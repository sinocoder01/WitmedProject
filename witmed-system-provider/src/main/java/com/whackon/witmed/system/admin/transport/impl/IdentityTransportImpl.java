package com.whackon.witmed.system.admin.transport.impl;

import com.whackon.witmed.base.pojo.vo.PageVO;
import com.whackon.witmed.base.pojo.vo.QueryPageVO;
import com.whackon.witmed.system.admin.pojo.vo.IdentityVO;
import com.whackon.witmed.system.admin.service.IdentityService;
import com.whackon.witmed.system.admin.transport.IdentityTransport;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 人员身份传输层接口实现类</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
@RestController("identityTransport")
@RequestMapping("/system/admin/identity/trans")
public class IdentityTransportImpl implements IdentityTransport {
	@Resource(name = "identityService")
	private IdentityService identityService;

	/**
	 * <b>分页查询视图信息</b>
	 * @param queryPageVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/page")
	@Override
	public PageVO<IdentityVO> getPage(@RequestBody QueryPageVO<IdentityVO> queryPageVO) throws Exception {
		// 分别获取分页视图和查询视图
		IdentityVO queryVO = queryPageVO.getQueryVO();
		PageVO<IdentityVO> pageVO = queryPageVO.getPageVO();
		return identityService.getPage(queryVO, pageVO);
	}

	/**
	 * <b>查询视图列表</b>
	 * @param queryVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<IdentityVO> getList(@RequestBody IdentityVO queryVO) throws Exception {
		return identityService.getList(queryVO);
	}

	/**
	 * <b>根据主键查询视图</b>
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Override
	public IdentityVO getById(@RequestParam Long id) throws Exception {
		return identityService.getById(id);
	}

	/**
	 * <b>根据编码查询视图</b>
	 * @param code
	 * @return
	 * @throws Exception
	 */
	@Override
	public IdentityVO getByCode(@RequestParam String code) throws Exception {
		return identityService.getByCode(code);
	}

	/**
	 * <b>插入信息</b>
	 * @param identityVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean insert(@RequestBody IdentityVO identityVO) throws Exception {
		return identityService.insert(identityVO);
	}

	/**
	 * <b>修改信息</b>
	 * @param identityVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean update(IdentityVO identityVO) throws Exception {
		return identityService.update(identityVO);
	}
}
