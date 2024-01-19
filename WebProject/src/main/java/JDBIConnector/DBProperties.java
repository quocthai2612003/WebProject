package JDBIConnector;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DBProperties {
    public static String host;
    public static String port;
    public static String name;
    public static String username;
    public static String password;

    static {
        try (InputStream input = DBProperties.class.getClassLoader().getResourceAsStream("db.properties.properties")) {
            Properties properties = new Properties();
            properties.load(input);

            host = properties.getProperty("db.host");
            port = properties.getProperty("db.port");
            name = properties.getProperty("db.name");
            username = properties.getProperty("db.username");
            password = properties.getProperty("db.password");

        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
