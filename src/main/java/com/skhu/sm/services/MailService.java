package com.skhu.sm.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import javax.mail.internet.MimeMessage;
import java.io.File;

/**
 * Created by ds on 2017-11-19.
 */

@Component
public class MailService {

    @Autowired
    JavaMailSender mailSender;

    public void sendMail1(String from, String to, String title, String contents, File file) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            System.out.println(from);
            messageHelper.setFrom(from);
            messageHelper.setTo(to);
            messageHelper.setSubject(title);
            messageHelper.setText(contents);
            messageHelper.addAttachment(file.getName(), file);
            mailSender.send(message);
        } catch(Exception e){
            System.out.println(e);
        }
    }

    public void sendMail2(String from, String to, String title, String contents) {
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            System.out.println(from);
            messageHelper.setFrom(from);
            messageHelper.setTo(to);
            messageHelper.setSubject(title);
            messageHelper.setText(contents);
            mailSender.send(message);
        } catch(Exception e){
            System.out.println(e);
        }
    }

}
