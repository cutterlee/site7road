package com.sz.site7road.service.impl;

import com.sz.site7road.dao.base.BaseDao;
import com.sz.site7road.dao.event.EventDao;
import com.sz.site7road.entity.event.EventInfo;
import com.sz.site7road.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * project: 公司官网重构---李福春
 * Created by cutter.li on 2014/9/22 17:48.
 * remark:
 */
@Service
public class EventServiceImpl extends AbstractBaseServiceImpl<EventInfo> implements EventService {

    @Autowired
    private EventDao eventDao;

    @Override
    protected BaseDao getBaseDao() {
        return eventDao;
    }
}
