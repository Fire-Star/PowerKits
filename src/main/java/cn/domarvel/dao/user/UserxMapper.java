package cn.domarvel.dao.user;


import cn.domarvel.pocustom.user.UserCustomx;

/**
 * Created by Administrator on 2017/8/10.
 */
public interface UserxMapper {
    public void insert(UserCustomx userCustom) throws Exception;

    public Integer findUserCountByUserName(String username) throws Exception;

    public String findUserInitSaltByUserName(String username) throws Exception;

    public UserCustomx findUserByUsername(String username) throws Exception;
}
