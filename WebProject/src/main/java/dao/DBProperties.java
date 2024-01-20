package dao;

import java.io.IOException;
import java.util.Properties;

public class DBProperties {
    private static Properties properties = new Properties();
    static {
        try {
            properties.load(ConnectJDBI.class.getClassLoader().getResourceAsStream("db.properties"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String host = properties.getProperty("db.host");
    public static String port = properties.getProperty("db.port");
    public static String username = properties.getProperty("db.username");
    public static String password = properties.getProperty("db.password");
    public static String name = properties.getProperty("db.name");
}
