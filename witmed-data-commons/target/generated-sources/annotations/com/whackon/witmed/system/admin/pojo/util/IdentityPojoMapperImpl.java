package com.whackon.witmed.system.admin.pojo.util;

import com.whackon.witmed.system.admin.pojo.entity.Identity;
import com.whackon.witmed.system.admin.pojo.vo.IdentityVO;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Generated;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2022-07-14T16:14:10+0800",
    comments = "version: 1.5.2.Final, compiler: javac, environment: Java 1.8.0_333 (Oracle Corporation)"
)
public class IdentityPojoMapperImpl implements IdentityPojoMapper {

    @Override
    public Identity parseToEntity(IdentityVO vo) {
        if ( vo == null ) {
            return null;
        }

        Identity identity = new Identity();

        identity.setStatus( vo.getStatus() );
        identity.setCreatedBy( vo.getCreatedBy() );
        identity.setCreateTime( vo.getCreateTime() );
        identity.setModifiedBy( vo.getModifiedBy() );
        identity.setModifiedTime( vo.getModifiedTime() );
        identity.setId( vo.getId() );
        identity.setCode( vo.getCode() );
        identity.setName( vo.getName() );

        return identity;
    }

    @Override
    public IdentityVO parseToVO(Identity entity) {
        if ( entity == null ) {
            return null;
        }

        IdentityVO identityVO = new IdentityVO();

        identityVO.setStatus( entity.getStatus() );
        identityVO.setCreatedBy( entity.getCreatedBy() );
        identityVO.setCreateTime( entity.getCreateTime() );
        identityVO.setModifiedBy( entity.getModifiedBy() );
        identityVO.setModifiedTime( entity.getModifiedTime() );
        identityVO.setId( entity.getId() );
        identityVO.setCode( entity.getCode() );
        identityVO.setName( entity.getName() );

        return identityVO;
    }

    @Override
    public List<Identity> parseToEntityList(List<IdentityVO> voList) {
        if ( voList == null ) {
            return null;
        }

        List<Identity> list = new ArrayList<Identity>( voList.size() );
        for ( IdentityVO identityVO : voList ) {
            list.add( parseToEntity( identityVO ) );
        }

        return list;
    }

    @Override
    public List<IdentityVO> parseToVOList(List<Identity> entityList) {
        if ( entityList == null ) {
            return null;
        }

        List<IdentityVO> list = new ArrayList<IdentityVO>( entityList.size() );
        for ( Identity identity : entityList ) {
            list.add( parseToVO( identity ) );
        }

        return list;
    }
}
