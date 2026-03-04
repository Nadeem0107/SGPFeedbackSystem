package in.co.customer.feedback.sys.util;

import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Utility class for sending emails using JavaMail API.
 * Reads SMTP configuration from system.properties.
 */
public class EmailUtility {

    private static Logger log = Logger.getLogger(EmailUtility.class.getName());

    /**
     * Sends an email using SMTP configuration from system.properties
     * 
     * @param toEmail Recipient email address
     * @param subject Email subject
     * @param body    Email body (HTML supported)
     * @throws Exception if email sending fails
     */
    public static void sendEmail(String toEmail, String subject, String body) throws Exception {
        log.info("EmailUtility sendEmail Started");

        String smtpHost = PropertyReader.getValue("smtp.host");
        String smtpPort = PropertyReader.getValue("smtp.port");
        String smtpUser = PropertyReader.getValue("smtp.username");
        String smtpPass = PropertyReader.getValue("smtp.password");
        String smtpAuth = PropertyReader.getValue("smtp.auth");
        String smtpStartTls = PropertyReader.getValue("smtp.starttls");
        String fromEmail = PropertyReader.getValue("smtp.from.email");
        String fromName = PropertyReader.getValue("smtp.from.name");

        Properties props = new Properties();
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.port", smtpPort);
        props.put("mail.smtp.auth", smtpAuth);
        props.put("mail.smtp.starttls.enable", smtpStartTls);

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(smtpUser, smtpPass);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromEmail, fromName));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject(subject);
        message.setContent(body, "text/html; charset=utf-8");

        try {
            Transport.send(message);
        } catch (Exception e) {
            System.err.println("Email Sending Exception: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }

        log.info("EmailUtility sendEmail End - Email sent to: " + toEmail);
    }
}
