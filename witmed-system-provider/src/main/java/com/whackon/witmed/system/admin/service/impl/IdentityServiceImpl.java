package com.whackon.witmed.system.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whackon.witmed.base.pojo.vo.PageVO;
import com.whackon.witmed.system.admin.dao.IdentityDao;
import com.whackon.witmed.system.admin.pojo.entity.Identity;
import com.whackon.witmed.system.admin.pojo.util.IdentityPojoMapper;
import com.whackon.witmed.system.admin.pojo.vo.IdentityVO;
import com.whackon.witmed.system.admin.service.IdentityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 人员身份业务层接口实现类</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
@Service("identityService")
@Transactional
public class IdentityServiceImpl implements IdentityService {
	@Autowired
	private IdentityDao identityDao;

	/**
	 * <b>分页查询视图信息</b>
	 * @param queryVO
	 * @param pageVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public PageVO<IdentityVO> getPage(IdentityVO queryVO, PageVO<IdentityVO> pageVO) throws Exception {
		// 将查询视图转换为查询实体
		Identity query = IdentityPojoMapper.INSTANCE.parseToEntity(queryVO);
		// 创建 MyBatisPlus 查询对象
		QueryWrapper<Identity> queryWrapper = new QueryWrapper<Identity>(query);

		// 开启 PageHelper 分页查询过滤器
		PageHelper.startPage(pageVO.getPageNum(), pageVO.getPageSize());
		// 进行列表查询
		List<Identity> entityList = identityDao.selectList(queryWrapper);

		// 根据分页列表创建 PageInfo 对象
		PageInfo<Identity> pageInfo = new PageInfo<Identity>(entityList);

		// 提取数据
		pageVO.setList(IdentityPojoMapper.INSTANCE.parseToVOList(pageInfo.getList()));
		pageVO.setTotalCount(pageInfo.getTotal());
		pageVO.setTotalPage(pageInfo.getPages());

		return pageVO;
	}

	/**
	 * <b>查询视图列表</b>
	 * @param queryVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public List<IdentityVO> getList(IdentityVO queryVO) throws Exception {
		// 将查询视图转换为查询实体
		Identity query = IdentityPojoMapper.INSTANCE.parseToEntity(queryVO);
		// 创建 MyBatisPlus 查询对象
		QueryWrapper<Identity> queryWrapper = new QueryWrapper<Identity>(query);
		// 查询实体列表
		List<Identity> entityList = identityDao.selectList(queryWrapper);
		return IdentityPojoMapper.INSTANCE.parseToVOList(entityList);
	}

	/**
	 * <b>根据主键查询视图</b>
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@Override
	public IdentityVO getById(Long id) throws Exception {
		// 使用主键查询实体
		Identity entity = identityDao.selectById(id);
		// 将实体转换为视图，进行返回
		return IdentityPojoMapper.INSTANCE.parseToVO(entity);
	}

	/**
	 * <b>根据编码查询视图</b>
	 * @param code
	 * @return
	 * @throws Exception
	 */
	@Override
	public IdentityVO getByCode(String code) throws Exception {
		// 创建 QueryWrapper 对象，设置查询条件，进行查询
		Identity entity = identityDao.selectOne(new QueryWrapper<Identity>().eq("code", code));
		return IdentityPojoMapper.INSTANCE.parseToVO(entity);
	}

	/**
	 * <b>插入信息</b>
	 * @param identityVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean insert(IdentityVO identityVO) throws Exception {
		if (identityDao.insert(IdentityPojoMapper.INSTANCE.parseToEntity(identityVO)) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * <b>修改信息</b>
	 * @param identityVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean update(IdentityVO identityVO) throws Exception {
		if (identityDao.updateById(IdentityPojoMapper.INSTANCE.parseToEntity(identityVO)) > 0) {
			return true;
		}
		return false;
	}
}
