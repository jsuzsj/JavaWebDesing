package cn.jsu.util;

import cn.jsu.bean.User;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class DBUtilTest {
 @Test
    void testLogin(){
     User user = new User("444", "123");
     user=DBUtil.login(user);
     System.out.println(user);
 }
 @Test
    void Testregistor(){
     System.out.println(DBUtil.register(new User("3","123" )));
    }
}