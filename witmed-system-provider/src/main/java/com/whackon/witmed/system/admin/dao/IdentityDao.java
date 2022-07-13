package com.whackon.witmed.system.admin.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.whackon.witmed.system.admin.pojo.entity.Identity;
import org.springframework.stereotype.Repository;

/**
 * <b>智慧医疗信息平台 - 系统功能 - 人员身份数据持久层接口</b>
 *
 * @author Arthur
 * @date 2022/7/13
 */
@Repository
public interface IdentityDao extends BaseMapper<Identity> {
}
