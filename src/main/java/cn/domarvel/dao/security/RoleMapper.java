package cn.domarvel.dao.security;

import cn.domarvel.po.security.Role;

import java.util.List;

/**
 * Created by Administrator on 2017/8/9.
 */
public interface RoleMapper {
    public List<Role> findAllRoles();
}
