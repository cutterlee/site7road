package com.sz.site7road.framework.auth;

import com.google.common.base.Strings;
import com.sz.site7road.entity.user.UserInfoEntity;
import com.sz.site7road.service.RoleInfoService;
import com.sz.site7road.service.UsrService;
import org.apache.log4j.Logger;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Set;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 10:31
 * 备注： 提供一个供shiro使用的认证和授权接口实现类
 */
@Component
public class MyReal extends AuthorizingRealm {
    private static final Logger log = Logger.getLogger(MyReal.class);

    @Resource
    private UsrService userInfoService;

    @Resource
    private RoleInfoService roleInfoService;

    /**
     * Retrieves the AuthorizationInfo for the given principals from the underlying data store.  When returning
     * an instance from this method, you might want to consider using an instance of
     * {@link org.apache.shiro.authz.SimpleAuthorizationInfo SimpleAuthorizationInfo}, as it is suitable in most cases.
     *
     * @param principals the primary identifying principals of the AuthorizationInfo that should be retrieved.
     * @return the AuthorizationInfo associated with this principals.
     * @see org.apache.shiro.authz.SimpleAuthorizationInfo
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        if (null == principals) {
            throw new AuthorizationException("principals为空");
        }

        String username = (String) principals.getPrimaryPrincipal();

        //查找到用户的角色集合
        Set<String> roles = userInfoService.findRoleSetStr(username);
        //查找到用户的资源操作集合
        Set<String> stringPermissions = roleInfoService.findPermissionSetStr(roles);
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo(roles);
        authorizationInfo.setStringPermissions(stringPermissions);
        return authorizationInfo;
    }

    /**
     * Retrieves authentication data from an implementation-specific datasource (RDBMS, LDAP, etc) for the given
     * authentication token.
     * <p/>
     * For most datasources, this means just 'pulling' authentication data for an associated subject/user and nothing
     * more and letting Shiro do the rest.  But in some systems, this method could actually perform EIS specific
     * log-in logic in addition to just retrieving data - it is up to the Realm implementation.
     * <p/>
     * A {@code null} return value means that no account could be associated with the specified token.
     *
     * @param token the authentication token containing the user's principal and credentials.
     * @return an {@link org.apache.shiro.authc.AuthenticationInfo} object containing account data resulting from the
     * authentication ONLY if the lookup is successful (i.e. account exists and is valid, etc.)
     * @throws org.apache.shiro.authc.AuthenticationException if there is an error acquiring data or performing
     *                                                        realm-specific authentication logic for the specified <tt>token</tt>
     *                                                        认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

        UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;
        String username = usernamePasswordToken.getUsername();

        if (Strings.isNullOrEmpty(username)) {
            throw new AccountException("空用户名");
        }
        //check username
        UserInfoEntity userInfoEntity = userInfoService.findUserInfoByUserName(username);

        if (null == userInfoEntity || Strings.isNullOrEmpty(userInfoEntity.getPassword())) {
            throw new AccountException("不存在的用户");
        }

        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(username, userInfoEntity.getPassword(), getName());
//        authenticationInfo.setCredentialsSalt(ByteSource.Util.bytes(userInfoEntity.getPasssalt()));
        return authenticationInfo;
    }
}
