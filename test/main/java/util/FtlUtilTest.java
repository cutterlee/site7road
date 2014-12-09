package util;

import com.google.common.collect.Maps;
import com.sz.site7road.util.FtlUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.Map;

import static org.junit.Assert.*;

public class FtlUtilTest {

    private FtlUtil ftlUtil;

    @Before
    public void setUp() throws Exception {
        ftlUtil=FtlUtil.getInstance();
    }

    @After
    public void tearDown() throws Exception {
        ftlUtil=null;
    }

    @Test
    public void testCreateHTML() throws Exception {
        String ftlTemplate="/dm/index.ftl";
        String htmlName="/dm/index.html";
        Map map= Maps.newConcurrentMap();
        map.put("dmSystemName","大米系统");
        ftlUtil.createHTML(ftlTemplate,map,htmlName,"dm");
    }

    @Test
    public void testGetString() throws Exception {

    }

    @Test
    public void testCreateByteArray() throws Exception {

    }
}