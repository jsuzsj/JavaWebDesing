package cn.jsu.junit;


import cn.jsu.databace.DatabaceConnection;
import org.junit.jupiter.api.Test;

public class DatabaceConnectTest {
    @Test
    void databasetest(){
        DatabaceConnection databaceConnection ;

        for (int i=1 ;i<=11;i++)
        {
            databaceConnection = new DatabaceConnection();
            databaceConnection.getConection();
        }

    }
}
