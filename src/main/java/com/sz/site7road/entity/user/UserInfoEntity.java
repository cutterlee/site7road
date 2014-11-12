package com.sz.site7road.entity.user;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * User： cutter.li
 * Date： 2014/7/30
 * Time： 10:50
 * 备注： 用户信息实体
 */
@Entity
@Table(name = "t_user")
public class UserInfoEntity implements Serializable {
    /**
     * 主键id
     */
    private int id;
    /**
     * 用户名
     */
    @NotBlank
    @Length(min = 6,max = 16)
    private String username;
    /**
     * 密码
     */
    @NotBlank
    @Length(min = 8,max = 15)
    private String password;
    /**
     * 密码盐
     */
    private String passsalt;
    /**
     * 昵称
     */
    @NotBlank
    @Length(min = 2,max = 8)
    private String nickName;
    /**
     * 用户邮箱
     */
    @NotBlank
    @Email
    private String userEmail;
    /**
     * 创建时间
     */
    private Date createTime=new Date();
    /**
     * 最后登录时间
     */
    private Date lastLoginTime=new Date();
    /**
     * 最后登录ip
     */
    private String lastLoginIp;
    /**
     * 登录次数
     */
    private int loginTimes;
    /**
     * 用户状态
     */
    @NotBlank
    private int userStatus;
    /**
     * 角色id
     */
    private int roleId;

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(strategy = "increment", name = "increment")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "user_name")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(name = "pass_word")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Column(name = "pass_salt")
    public String getPasssalt() {
        return passsalt;
    }

    public void setPasssalt(String passsalt) {
        this.passsalt = passsalt;
    }

    @Column(name = "nick_name")
    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    @Column(name = "user_email")
    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    @Column(name = "create_time")
    @Temporal(TemporalType.DATE)
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Column(name = "last_login_time")
    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    @Column(name = "last_login_ip")
    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }

    @Column(name = "login_times")
    public int getLoginTimes() {
        return loginTimes;
    }

    public void setLoginTimes(int loginTimes) {
        this.loginTimes = loginTimes;
    }

    @Column(name = "user_status")
    public int getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }
    @Column(name = "role_id")
//    @OneToOne(targetEntity = RoleInfoEntity.class,mappedBy ="role_id" )
    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
