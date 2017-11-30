package cn.domarvel.dao.security;

import cn.domarvel.po.security.Res;
import cn.domarvel.po.security.Role;

import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
public interface ResRoleMapper {
    public List<Role> findAllRolesByRes(Res res);
}
