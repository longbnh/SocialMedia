/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longbnh.utility;

import java.io.Serializable;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author DELL
 */
public class SendMailHelper implements Serializable {
    
    private static final String SENDER = "testmailsenderjava89@gmail.com";
    private static final String PASSWORD = "testsender";
    
    public void sendMail(String code, String receiver) throws MessagingException {
        Properties props = new Properties();        
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", 587);
        
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER, PASSWORD);
            }
        });
        
        Message mes = new MimeMessage(session);
        mes.setFrom(new InternetAddress(SENDER));
        mes.addRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver));
        mes.setSubject("Verify your email");
        mes.setText("Your verify code is : " + code + "\n Your code will be deleted in 30 minutes after you receive this email"
                + "\n or be deleted when you exit verify page ");
        Transport.send(mes);
    }
}
