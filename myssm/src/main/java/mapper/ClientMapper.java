package mapper;

import org.apache.ibatis.annotations.Param;
import pobject.Client;

import java.util.List;

public interface ClientMapper {


    int register(@Param("username") String username,@Param("password") String password,@Param("email") String email);

    Client findClient(@Param("username")String username);

}
