package com.whackon.witmed.system.admin.pojo.util;

import com.whackon.witmed.system.admin.pojo.entity.Identity;
import com.whackon.witmed.system.admin.pojo.vo.IdentityVO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 人员身份 POJO 转换工具</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
@Mapper
public interface IdentityPojoMapper {
	IdentityPojoMapper INSTANCE = Mappers.getMapper(IdentityPojoMapper.class);

	/**
	 * <b>将视图转换为实体</b>
	 * @param vo
	 * @return
	 */
	public Identity parseToEntity(IdentityVO vo);

	/**
	 * <b>将实体转为视图</b>
	 * @param entity
	 * @return
	 */
	public IdentityVO parseToVO(Identity entity);

	/**
	 * <b>将视图列表转换为实体列表</b>
	 * @param voList
	 * @return
	 */
	public List<Identity> parseToEntityList(List<IdentityVO> voList);

	/**
	 * <b>将实体列表转换为视图列表</b>
	 * @param entityList
	 * @return
	 */
	public List<IdentityVO> parseToVOList(List<Identity> entityList);
}
