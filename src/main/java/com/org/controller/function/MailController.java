package com.org.controller.function;

import com.org.config.utils.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("mail")
public class MailController {

    @Autowired
    MailUtil mailUtil;

    @GetMapping("simplemail")
    public String simplemail(){
        mailUtil.sendSimpleEmail("2105584602@qq.com");
        return "200";
    }

//    @GetMapping("fileemail")
//    public String filelemail() throws MessagingException {
//        mailUtil.sendEmailwithFile();
//        return "200";
//    }
//
//    @GetMapping("richemail")
//    public String richemail() throws MessagingException {
//        mailUtil.sendRichMail();
//        return "200";
//    }
}
