package controller;

import java.io.IOException;
import java.util.Properties;

public class MailProperties {
    private static Properties prop = new Properties();
    static {
        try {
            prop.load(MailProperties.class.getClassLoader().getResourceAsStream("mail.properties"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static String host = prop.getProperty("mail.smtp.host");
    public static String port = prop.getProperty("mail.smtp.port");
    public static boolean auth = prop.getProperty("mail.smtp.auth").equals("true");
    public static boolean ssl = prop.getProperty("mail.smtp.starttls.enable").equals("true");

    public static String user = prop.getProperty("mail.user");
    public static String pass = prop.getProperty("mail.pass");
}
