package dao;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;

public class ConnectJDBI {
    private static Jdbi JDBI;
    private ConnectJDBI() {
    }

    private static void connect() {
        MysqlDataSource mysqlDataSource = new MysqlDataSource();
        mysqlDataSource.setURL("jdbc:mysql://" + DBProperties.host + ":" + DBProperties.port+ "/" + DBProperties.name);
        mysqlDataSource.setUser(DBProperties.username);
        mysqlDataSource.setPassword(DBProperties.password);
        try {
            mysqlDataSource.setAutoReconnect(true);
            mysqlDataSource.setUseCompression(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        JDBI = Jdbi.create(mysqlDataSource);
    }

    public static Jdbi connector() {
        if (JDBI == null) connect();
        return JDBI;
    }

}
