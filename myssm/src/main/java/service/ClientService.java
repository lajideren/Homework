package service;

import pobject.Client;

public interface ClientService {


    /**
     * 注册一个用户
     * @param username 用户名
     * @param password 密码
     * @return true为成功，false失败
     */
    boolean register(String username,String password,String email);

    /**
     * 登录，身份验证
     * @param username 用户名
     * @param password 密码
     * @return 用户名不存在或密码错误均返回false
     */
    boolean login(String username,String password);


    /**
     * 查找用户邮箱
     * @param username
     * @return
     */
    Client findClient(String username);
}
