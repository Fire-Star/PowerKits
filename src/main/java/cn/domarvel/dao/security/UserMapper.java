package cn.domarvel.dao.security;

import cn.domarvel.po.security.User;

/**
 * Created by Administrator on 2017/8/9.
 */
public interface UserMapper {
    public User findUserByUsername(User user);
}
