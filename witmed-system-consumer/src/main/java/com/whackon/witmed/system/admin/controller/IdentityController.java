package com.whackon.witmed.system.admin.controller;

import com.whackon.witmed.base.controller.BaseController;
import com.whackon.witmed.base.pojo.vo.PageVO;
import com.whackon.witmed.base.pojo.vo.QueryPageVO;
import com.whackon.witmed.base.pojo.vo.ResponseVO;
import com.whackon.witmed.base.util.BaseConstants;
import com.whackon.witmed.base.util.TokenUtil;
import com.whackon.witmed.system.admin.pojo.vo.AdminVO;
import com.whackon.witmed.system.admin.pojo.vo.IdentityVO;
import com.whackon.witmed.system.admin.transport.IdentityTransport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 人员身份控制层类</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
@RestController("identityController")
@RequestMapping("/system/admin/identity")
public class IdentityController extends BaseController {
	@Autowired
	private IdentityTransport identityTransport;

	/**
	 * <b>分页查询</b>
	 * @param pageNum
	 * @param pageSize
	 * @param queryVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/page/{pageNum}/{pageSize}")
	public ResponseVO queryPage(@PathVariable("pageNum") Integer pageNum, @PathVariable("pageSize") Integer pageSize,
	                              @RequestBody IdentityVO queryVO) throws Exception {
		// 判断是否进行登录
		AdminVO adminVO = (AdminVO) TokenUtil.validateToken(request.getHeader(BaseConstants.BASE_TOKEN_HEADER));
		if (adminVO != null) {
			// 创建查询分页视图
			QueryPageVO<IdentityVO> queryPageVO = new QueryPageVO<>(queryVO, pageNum, pageSize);
			// 进行分页查询，获得 PageVO 对象
			PageVO<IdentityVO> pageVO = identityTransport.getPage(queryPageVO);
			// 返回结果
			return ResponseVO.successResponseVO("查询成功", pageVO);
		} else {
			return ResponseVO.unAuthResponseVO();
		}
	}

	/**
	 * <b>查询视图列表</b>
	 * @param queryVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/list")
	public ResponseVO queryList(@RequestBody IdentityVO queryVO) throws Exception {
		// 判断是否进行登录
		AdminVO adminVO = (AdminVO) TokenUtil.validateToken(request.getHeader(BaseConstants.BASE_TOKEN_HEADER));
		if (adminVO != null) {
			// 进行列表查询
			List<IdentityVO> voList = identityTransport.getList(queryVO);
			// 返回结果
			return ResponseVO.successResponseVO("查询成功", voList);
		} else {
			return ResponseVO.unAuthResponseVO();
		}
	}

	/**
	 * <b>根据主键查询</b>
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/id/{id}")
	public ResponseVO queryById(@PathVariable("id") Long id) throws Exception {
		// 判断是否进行登录
		AdminVO adminVO = (AdminVO) TokenUtil.validateToken(request.getHeader(BaseConstants.BASE_TOKEN_HEADER));
		if (adminVO != null) {
			// 根据主键查询视图
			IdentityVO vo = identityTransport.getById(id);
			// 返回结果
			return ResponseVO.successResponseVO("查询成功", vo);
		} else {
			return ResponseVO.unAuthResponseVO();
		}
	}

	/**
	 * <b>根据编码查询视图</b>
	 * @param code
	 * @return
	 * @throws Exception
	 */
	@GetMapping("/code/{code}")
	public ResponseVO queryByCode(@PathVariable("code") String code) throws Exception {
		// 判断是否进行登录
		AdminVO adminVO = (AdminVO) TokenUtil.validateToken(request.getHeader(BaseConstants.BASE_TOKEN_HEADER));
		if (adminVO != null) {
			// 根据主键查询视图
			IdentityVO vo = identityTransport.getByCode(code);
			// 返回结果
			return ResponseVO.successResponseVO("查询成功", vo);
		} else {
			return ResponseVO.unAuthResponseVO();
		}
	}

	/**
	 * <b>添加信息</b>
	 * @param identityVO
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/insert")
	public ResponseVO insert(@Validated @RequestBody IdentityVO identityVO, BindingResult bindingResult)
			throws Exception {
		// 判断是否进行登录
		AdminVO adminVO = (AdminVO) TokenUtil.validateToken(request.getHeader(BaseConstants.BASE_TOKEN_HEADER));
		if (adminVO != null) {
			// 判断是否存在错误信息
			if (!bindingResult.hasErrors()) {
				// 没有错误信息，校验编码是否重复
				if (identityTransport.getByCode(identityVO.getCode()) == null) {
					// 编码没有被占用，进行保存
					if (identityTransport.insert(identityVO)) {
						return ResponseVO.successResponseVO("保存成功");
					} else {
						return ResponseVO.failureResponseVO("保存失败");
					}
				} else {
					return ResponseVO.failureResponseVO("编码已被占用");
				}
			} else {
				// 保存时产生错误信息
				return ResponseVO.failureResponseVO("保存信息错误");
			}
		} else {
			return ResponseVO.unAuthResponseVO();
		}
	}

	/**
	 * <b>修改信息</b>
	 * @param id
	 * @param identityVO
	 * @param bindingResult
	 * @return
	 * @throws Exception
	 */
	@PutMapping("/{id}")
	public ResponseVO update(@PathVariable("id") Long id, @Validated @RequestBody IdentityVO identityVO, BindingResult bindingResult)
			throws Exception {
		// 判断是否进行登录
		AdminVO adminVO = (AdminVO) TokenUtil.validateToken(request.getHeader(BaseConstants.BASE_TOKEN_HEADER));
		if (adminVO != null) {
			// 判断是否存在错误信息
			if (!bindingResult.hasErrors()) {
				// 没有错误信息，校验编码是否重复
				IdentityVO checkVO = identityTransport.getByCode(identityVO.getCode());
				if (checkVO == null || (checkVO.getId().equals(id))) {
					identityVO.setId(id);
					// 编码没有被占用，进行保存
					if (identityTransport.update(identityVO)) {
						return ResponseVO.successResponseVO("保存成功");
					} else {
						return ResponseVO.failureResponseVO("保存失败");
					}
				} else {
					return ResponseVO.failureResponseVO("编码已被占用");
				}
			} else {
				// 保存时产生错误信息
				return ResponseVO.failureResponseVO("保存信息错误");
			}
		} else {
			return ResponseVO.unAuthResponseVO();
		}
	}
}
