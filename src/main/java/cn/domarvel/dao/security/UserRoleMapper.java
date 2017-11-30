package cn.domarvel.dao.security;

import cn.domarvel.po.security.Role;
import cn.domarvel.pocustom.security.UserCustom;

import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public interface UserRoleMapper {
    public List<Role> findRolesByUsername(UserCustom userCustom);
}
