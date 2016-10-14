package com.myGag.model;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class RegisterEmail extends Thread {
	
	private String to;
	private String msg;
	
	public RegisterEmail(String to, String msg) {
		this.to = to;
		this.msg = msg;
	}

	public void sendMail(String to, String msg){
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("Our9Gag","our9gagemail");
				}
			});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("Our9Gag@gmail.com"));
			message.addRecipient(Message.RecipientType.TO,
					new InternetAddress(to));
			message.setSubject("Registration");
			//message.setContent(msg, "text/html" );
			message.setText("You registered successfully. Your password is:" + msg);

			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public void run() {
		sendMail(this.to, this.msg);
	}
	
}
