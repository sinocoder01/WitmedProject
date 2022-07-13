package com.whackon.witmed.system.admin.transport;

import com.whackon.witmed.base.pojo.vo.PageVO;
import com.whackon.witmed.base.pojo.vo.QueryPageVO;
import com.whackon.witmed.system.admin.pojo.vo.IdentityVO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 人员身份传输层接口</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
@FeignClient(name = "witmed-system-provider")
public interface IdentityTransport {
	/**
	 * <b>分页查询视图信息</b>
	 * @param queryPageVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/system/admin/identity/trans/page")
	PageVO<IdentityVO> getPage(@RequestBody QueryPageVO<IdentityVO> queryPageVO) throws Exception;

	/**
	 * <b>查询视图列表</b>
	 * @param queryVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/system/admin/identity/trans/list")
	List<IdentityVO> getList(IdentityVO queryVO) throws Exception;

	/**
	 * <b>根据主键查询视图</b>
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/system/admin/identity/trans/id")
	IdentityVO getById(@RequestParam Long id) throws Exception;

	/**
	 * <b>根据编码查询视图</b>
	 * @param code
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/system/admin/identity/trans/code")
	IdentityVO getByCode(@RequestParam String code) throws Exception;

	/**
	 * <b>插入信息</b>
	 * @param identityVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/system/admin/identity/trans/insert")
	boolean insert(@RequestBody IdentityVO identityVO) throws Exception;

	/**
	 * <b>修改信息</b>
	 * @param identityVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/system/admin/identity/trans/update")
	boolean update(@RequestBody IdentityVO identityVO) throws Exception;
}
