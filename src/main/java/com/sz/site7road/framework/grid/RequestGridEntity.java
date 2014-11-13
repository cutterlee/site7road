package com.sz.site7road.framework.grid;

import com.google.common.collect.Lists;
import org.codehaus.jackson.map.ObjectMapper;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/11 12:08.
 * remark: dataGrid的查询参数对象
 */
public class RequestGridEntity {

    /***
     * 第几页
     */
    private int page=1;

    /**
     * 一页多少条数据
     */
    private int rows=20;

    /**
     * 排序字段
     */
    private String sort;

    /**
     *排序的命令,升序还是降序
     */
    private String order="asc";

    private GridQueryCondition condition_1;
    private GridQueryCondition condition_2;
    private GridQueryCondition condition_3;
    private GridQueryCondition condition_4;
    private GridQueryCondition condition_5;
    private GridQueryCondition condition_6;
    private GridQueryCondition condition_7;
    private GridQueryCondition condition_8;
    private GridQueryCondition condition_9;
    private GridQueryCondition condition_10;
    private GridQueryCondition condition_11;
    private GridQueryCondition condition_12;
    private GridQueryCondition condition_13;
    private GridQueryCondition condition_14;
    private GridQueryCondition condition_15;
    private GridQueryCondition condition_16;
    private GridQueryCondition condition_17;
    private GridQueryCondition condition_18;
    private GridQueryCondition condition_19;
    private GridQueryCondition condition_20;

    public int getPage() {
        return page;
    }

    /**
     * 得到sql分页数据的起始序号
     * @return
     */
    public int getStart() {
        if(page>0)
        {
            return  (page-1)*rows;
        }else{
            return 0;
        }
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public String getOrder() {
        return order;
    }

    public void setOrder(String order) {
        this.order = order;
    }

    public List<GridQueryCondition> getQueryConditionList() {

        List<GridQueryCondition> gridQueryConditionList= Lists.newLinkedList();

        Method[] methods= this.getClass().getMethods();
        if(methods!=null&&methods.length>0)
        for(Method method:methods)
        {
           String methodName=method.getName();
            if(methodName.contains("getCondition_"))
            {
                try {
                  Object object=  method.invoke(this,new Object[]{});
                    if(object!=null)
                    {
                        gridQueryConditionList.add((GridQueryCondition) object);
                    }
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                };
            }
        }

        return gridQueryConditionList;
    }


    public GridQueryCondition getCondition_1() {
        return condition_1;
    }

    public void setCondition_1(GridQueryCondition condition_1) {
        this.condition_1 = condition_1;
    }

    public GridQueryCondition getCondition_2() {
        return condition_2;
    }

    public void setCondition_2(GridQueryCondition condition_2) {
        this.condition_2 = condition_2;
    }

    public GridQueryCondition getCondition_3() {
        return condition_3;
    }

    public void setCondition_3(GridQueryCondition condition_3) {
        this.condition_3 = condition_3;
    }

    public GridQueryCondition getCondition_4() {
        return condition_4;
    }

    public void setCondition_4(GridQueryCondition condition_4) {
        this.condition_4 = condition_4;
    }

    public GridQueryCondition getCondition_5() {
        return condition_5;
    }

    public void setCondition_5(GridQueryCondition condition_5) {
        this.condition_5 = condition_5;
    }

    public GridQueryCondition getCondition_6() {
        return condition_6;
    }

    public void setCondition_6(GridQueryCondition condition_6) {
        this.condition_6 = condition_6;
    }

    public GridQueryCondition getCondition_7() {
        return condition_7;
    }

    public void setCondition_7(GridQueryCondition condition_7) {
        this.condition_7 = condition_7;
    }

    public GridQueryCondition getCondition_8() {
        return condition_8;
    }

    public void setCondition_8(GridQueryCondition condition_8) {
        this.condition_8 = condition_8;
    }

    public GridQueryCondition getCondition_9() {
        return condition_9;
    }

    public void setCondition_9(GridQueryCondition condition_9) {
        this.condition_9 = condition_9;
    }

    public GridQueryCondition getCondition_10() {
        return condition_10;
    }

    public void setCondition_10(GridQueryCondition condition_10) {
        this.condition_10 = condition_10;
    }

    public GridQueryCondition getCondition_11() {
        return condition_11;
    }

    public void setCondition_11(GridQueryCondition condition_11) {
        this.condition_11 = condition_11;
    }

    public GridQueryCondition getCondition_12() {
        return condition_12;
    }

    public void setCondition_12(GridQueryCondition condition_12) {
        this.condition_12 = condition_12;
    }

    public GridQueryCondition getCondition_13() {
        return condition_13;
    }

    public void setCondition_13(GridQueryCondition condition_13) {
        this.condition_13 = condition_13;
    }

    public GridQueryCondition getCondition_14() {
        return condition_14;
    }

    public void setCondition_14(GridQueryCondition condition_14) {
        this.condition_14 = condition_14;
    }

    public GridQueryCondition getCondition_15() {
        return condition_15;
    }

    public void setCondition_15(GridQueryCondition condition_15) {
        this.condition_15 = condition_15;
    }

    public GridQueryCondition getCondition_16() {
        return condition_16;
    }

    public void setCondition_16(GridQueryCondition condition_16) {
        this.condition_16 = condition_16;
    }

    public GridQueryCondition getCondition_17() {
        return condition_17;
    }

    public void setCondition_17(GridQueryCondition condition_17) {
        this.condition_17 = condition_17;
    }

    public GridQueryCondition getCondition_18() {
        return condition_18;
    }

    public void setCondition_18(GridQueryCondition condition_18) {
        this.condition_18 = condition_18;
    }

    public GridQueryCondition getCondition_19() {
        return condition_19;
    }

    public void setCondition_19(GridQueryCondition condition_19) {
        this.condition_19 = condition_19;
    }

    public GridQueryCondition getCondition_20() {
        return condition_20;
    }

    public void setCondition_20(GridQueryCondition condition_20) {
        this.condition_20 = condition_20;
    }

    public static void main(String[] args){
//        RequestGridEntity entity=new RequestGridEntity();
//        entity.setCondition_1(new GridQueryCondition("username","like","li"));
//        entity.setCondition_2(new GridQueryCondition("nickName", "like", "fuck"));
//
//      List<GridQueryCondition> gridQueryConditionList=  entity.getQueryConditionList();
//        gridQueryConditionList.size();

        int[] idArray=new int[]{1,2,3,6,12};
        ObjectMapper objectMapper=new ObjectMapper();
        try {
           String idArrayStr= objectMapper.writeValueAsString(idArray);
            System.out.println(idArrayStr);
        } catch (IOException e) {
            e.printStackTrace();
        }


    }
}
