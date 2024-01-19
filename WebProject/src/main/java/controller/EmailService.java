package controller;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.Random;

public class EmailService {

    static EmailService emailService = getInstance();
    static Properties prop = new Properties();

    static {
        prop.put("mail.smtp.auth", MailProperties.auth);
        prop.put("mail.smtp.starttls.enable", MailProperties.ssl);
        prop.put("mail.smtp.host", MailProperties.host);
        prop.put("mail.smtp.port", MailProperties.port);
    }
    public static EmailService getInstance() {
        if (emailService == null) emailService = new EmailService();
        return emailService;
    }

    public static boolean send(String to, String subject, String mess) {
        try {
            Session session = Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(MailProperties.user, MailProperties.pass);
            }
        });
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(MailProperties.user, "WEB ban that lung"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(mess);
            Transport.send(message);
            return true;
        } catch (MessagingException | UnsupportedEncodingException e) {
            return false;
        }
    }

    public static String createCode() {
        String str = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        Random random = new Random();
        StringBuilder re = new StringBuilder();
        for (int i = 0; i < 10; i++) {
            int n = random.nextInt(str.length());
            re.append(str.charAt(n));
        }

        return re.toString();
    }

}
