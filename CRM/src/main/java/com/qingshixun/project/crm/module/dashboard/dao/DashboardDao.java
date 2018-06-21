/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/

package com.qingshixun.project.crm.module.dashboard.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.qingshixun.project.crm.core.BaseHibernateDao;

/**
 * 首页处理 Dao 类
 * 
 * @author QingShiXun
 * 
 * @version 1.0
 */
@Repository
public class DashboardDao extends BaseHibernateDao<Object, Long> {

    /**
     * 查询折线图和柱状图数据
     * 
     * @param
     * @return
     */
    public List<Object[]> getLineDatas() {
        String sql = "select sum(o.totalAmount) amount,sum(o.totalQuantity) quantity,month(o.createTime) month  from qsx_sales_order o where YEAR(o.createTime) = YEAR( now( ) ) group by month(o.createTime)";
        List<Object[]> lis = queryBySql(sql);
        return lis;
    }

    /**
     * 查询饼图数据
     * 
     * @param
     * @return
     */
    public List<Object[]> getPieDatas() {
        String sql = "select count(c.id) customerNum,c.region_id from qsx_customer c left join qsx_region r on c.region_id = r.id group by r.id";
        List<Object[]> lis = queryBySql(sql);
        return lis;
    }

    /**
     * 查询地图数据
     * 
     * @param
     * @return
     */
    public List<Object[]> getChinaMapData() {
        String sql = "select count(c.id) customerNum,p.`key` from qsx_customer c left join qsx_province p on p.code = c.province_code group by c.province_code";
        List<Object[]> lis = queryBySql(sql);
        return lis;
    }

    /**
     * 查询本月销售数据
     * 
     * @param
     * @return
     */
    public List<Object[]> getOrderDatas() {
        String sql = "select sum(o.totalAmount) amount,sum(o.totalQuantity) quantity  from qsx_sales_order o where date_format(o.createTime,'%Y-%m')=date_format(now(),'%Y-%m') ";
        List<Object[]> lis = queryBySql(sql);
        return lis;
    }

    /**
     * 查询当天新增客户数量
     * 
     * @param
     * @return
     */
    public List<Object[]> getCustomersOfDay() {
        String sql = "select count(c.id) customerNum,c.id from qsx_customer c where date_format(c.createTime,'%Y-%m-%d')=date_format(now(),'%Y-%m-%d') ";
        List<Object[]> lis = queryBySql(sql);
        return lis;
    }

    /**
     * 查询本月新增客户数量
     * 
     * @param
     * @return
     */
    public List<Object[]> getCustomersOfMonth() {
        String sql = "select count(c.id) customerNum,c.id from qsx_customer c where date_format(c.createTime,'%Y-%m')=date_format(now(),'%Y-%m') ";
        List<Object[]> lis = queryBySql(sql);
        return lis;
    }
}
