package com.sz.site7road.service.impl;

import com.google.common.base.Preconditions;
import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.company.CompanyDao;
import com.sz.site7road.entity.companyInfo.CompanyEntity;
import com.sz.site7road.entity.system.PageEntity;
import com.sz.site7road.service.CompanyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 16:01
 * 备注： 公司信息服务实现类
 */
@Service
public class CompanyServiceImpl extends AbstractBaseServiceImpl<CompanyEntity> implements CompanyService {

    @Resource
    private CompanyDao dao;

    @Override
    protected BaseDao getBaseDao() {
        return dao;
    }

    @Override
    public List<CompanyEntity> findByPage(PageEntity pageEntity) {
        Preconditions.checkArgument(null != pageEntity, "pageEntity为空");
        return dao.findByPage(pageEntity);
    }

    @Override
    public void remove(int id) {
        dao.removeCompany(id);
    }

    @Override
    public CompanyEntity findEntityById(int id) {
        Preconditions.checkArgument(id > 0, "id为正整数");
        return dao.findCompanyById(id);
    }

    @Override
    public boolean modify(CompanyEntity entity) {
        Preconditions.checkArgument(null != entity, "entity为空");
        if(entity.getId()>0)
        {
         return    dao.modifyCompany(entity);
        }else{
         return    dao.creatComany(entity);
        }
    }
}
