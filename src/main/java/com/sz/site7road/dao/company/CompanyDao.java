package com.sz.site7road.dao.company;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.entity.companyInfo.CompanyEntity;
import com.sz.site7road.entity.system.PageEntity;

import java.util.List;

/**
 * User： cutter.li
 * Date： 2014/7/28
 * Time： 15:34
 * 备注： 对公司信息管理的dao接口
 */
public interface CompanyDao extends BaseDao<CompanyEntity> {

    /**
     * 创建公司信息
     *
     * @param entity 公司信息实体
     * @return 创建结果
     */
    boolean creatComany(CompanyEntity entity);

    /**
     * 删除公司信息
     *
     * @param id 公司信息的id
     * @return 删除结果
     */
    boolean removeCompany(long id);

    /**
     * 修改公司信息
     *
     * @param entity 公司信息
     * @return 修改的结果
     */
    boolean modifyCompany(CompanyEntity entity);

    /**
     * 查询公司信息
     *
     * @param id 公司信息id
     * @return 公司信息
     */
    CompanyEntity findCompanyById(long id);

    /**
     * 简单的分页，查询公司信息列表
     *
     * @param pageEntity
     * @return
     */
    List<CompanyEntity> findByPage(PageEntity pageEntity);

    /**
     * 根据条件查询公司信息的总条数
     *
     * @param where 查询条件
     * @return 符合条件的条数
     */
    int countComany(String where);


}
