package com.ssafy.happyhouse.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
     
    @Autowired
    static JavaMailSender javaMailSender;

    static void sendMail() {
        
        ArrayList<String> toUserList = new ArrayList<>();
        
        toUserList.add("sdi1358h@gmail.com");
        toUserList.add("sdi1358_@naver.com");
        
        int toUserSize = toUserList.size();
        
        SimpleMailMessage simpleMessage = new SimpleMailMessage();
        
        simpleMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));
        
        simpleMessage.setSubject("Subject Sample");
        simpleMessage.setText("Text Sample");
        
        javaMailSender.send(simpleMessage);
    }
    public static void main(String[] args) {
		sendMail();
	}
}