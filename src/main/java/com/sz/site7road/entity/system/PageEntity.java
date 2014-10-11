package com.sz.site7road.entity.system;

/**
 * User： cutter.li
 * Date： 2014/7/28
 * Time： 15:40
 * 备注： 分页所需参数
 */
public class PageEntity {

    private int pageIndex = 1;

    private int pageSize = 20;

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getStartPosition() {

        if (pageIndex <= 1) {
            return 0;
        } else {
            return pageSize * (pageIndex - 1);
        }
    }
}
