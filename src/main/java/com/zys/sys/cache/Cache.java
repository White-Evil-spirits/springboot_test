package com.zys.sys.cache;

import com.zys.sys.domain.Dept;
import com.zys.sys.vo.DeptVo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.BeanUtils;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Aspect
@EnableAspectJAutoProxy
@Component
public class Cache {

    private static Map<String, Object> CACHE_CONTAINER = CachePool.CACHE_CONTAINER;

    public static Map<String, Object> getCACHE_CONTAINER() {
        return CACHE_CONTAINER;
    }


    /**
     * 日志出处
     */
    private Log log = LogFactory.getLog(Cache.class);

    // 声明切面表达式
    private static final String POINTCUT_DEPT_ADD = "execution(* com.zys.sys.service.impl.DeptServiceImpl.save(..))";
    private static final String POINTCUT_DEPT_UPDATE = "execution(* com.zys.sys.service.impl.DeptServiceImpl.updateById(..))";
    private static final String POINTCUT_DEPT_GET = "execution(* com.zys.sys.service.impl.DeptServiceImpl.getById(..))";
    private static final String POINTCUT_DEPT_DELETE = "execution(* com.zys.sys.service.impl.DeptServiceImpl.removeById(..))";

    private static final String CACHE_DEPT_PROFIX = "dept:";


    /**
     * 查询切入
     *
     * @throws Throwable
     */
    @Around(value = POINTCUT_DEPT_GET)
    public Object cacheDeptGet(ProceedingJoinPoint joinPoint) throws Throwable {
        // 取出第一个参数
        Integer id = (Integer) joinPoint.getArgs()[0];
        System.out.println(id+"aop参数");
        // 从缓存里面取
        Object res1 = CACHE_CONTAINER.get(CACHE_DEPT_PROFIX + id);
        System.out.println(res1+"不知道什么");
        if (res1 != null) {
            log.info("已从缓存里面找到部门对象" + CACHE_DEPT_PROFIX + id);
            return res1;
        } else {
            Dept res2 = (Dept) joinPoint.proceed();
            CACHE_CONTAINER.put(CACHE_DEPT_PROFIX + res2.getId(), res2);
            log.info("未从缓存里面找到部门对象，去数据库查询并放到缓存"+CACHE_DEPT_PROFIX+res2.getId());
            return res2;
        }
    }

    /*
    * 更新缓存
    *  POINTCUT_DEPT_UPDATE
    * */
    @Around(value = POINTCUT_DEPT_UPDATE)
    public Object cacheDeptUpdate(ProceedingJoinPoint joinPoint) throws Throwable {
        DeptVo deptVo = (DeptVo) joinPoint.getArgs()[0];
        Boolean isSussrss = (Boolean) joinPoint.proceed();
        if(isSussrss){
            Dept dept = (Dept) CACHE_CONTAINER.get(CACHE_DEPT_PROFIX + deptVo.getId());
            if (null == dept) {
                dept = new Dept();
            }
            BeanUtils.copyProperties(deptVo, dept);
            log.info("部门对象缓存已更新" + CACHE_DEPT_PROFIX + deptVo.getId());
            CACHE_CONTAINER.put(CACHE_DEPT_PROFIX + dept.getId(), dept);
        }
        return isSussrss;
    }

    /*
    * 删除的缓存
    *  POINTCUT_DEPT_DELETE
    * */
    @Around(value = POINTCUT_DEPT_DELETE)
    public Object cacheDeptDelete(ProceedingJoinPoint joinPoint) throws Throwable {
        Integer id = (Integer) joinPoint.getArgs()[0];
        Boolean isSussess = (Boolean) joinPoint.proceed();
        if(isSussess){
            CACHE_CONTAINER.remove(CACHE_DEPT_PROFIX + id);
            log.info("部门对象缓存已删除" + CACHE_DEPT_PROFIX + id);
        }
        return isSussess;
    }


}
