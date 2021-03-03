package com.terran.boilerplate.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage; 
  
  
public class SendEmail  
{ 
  
   public static void sendmail(String sender, String recipient, String subject, String body)  
   {     
  
	  //connect to SMTP host: 193.180.251.71, port: 25;
      String host = "smtp.host";
  
      // Getting system properties 
      Properties properties = System.getProperties(); 
  
      // Setting up mail server 
      properties.setProperty("mail.smtp.host", host); 
  
      // creating session object to get properties 
      Session session = Session.getDefaultInstance(properties); 
  
      try 
      { 
         // MimeMessage object. 
         MimeMessage message = new MimeMessage(session); 
  
         // Set From Field: adding senders email to from field. 
         message.setFrom(new InternetAddress(sender)); 
  
         // Set To Field: adding recipient's email to from field. 
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); 
  
         // Set Subject: subject of the email 
         message.setSubject(subject); 
  
         // set body of the email. 
         message.setText(body); 
  
         // Send email. 
         Transport.send(message); 
         
      } 
      catch (MessagingException mex)  
      { 
         mex.printStackTrace(); 
      } 
   } 
} 
