package com.org.config.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class MailUtil {

//    @Autowired
//    private JavaMailSender mailSender;

    private static JavaMailSender mailSender;               //需要这样才能自动注入
    @Autowired
    public void runJavaMailSender(JavaMailSender mailSender)
    {MailUtil.mailSender=mailSender;}

    double radom;

//    @Value("${status.success}")
//    private String success;

    public String radomNum() {                  //生成四位数内的验证码
        String radom = String.valueOf(Math.random()*9999).substring(0,4);
        return radom;
    }

    /*发送纯文本验证码*/
    public String sendSimpleEmail(String toMail) {
        SimpleMailMessage message = new SimpleMailMessage(); //消息构造器
        String verify = radomNum();

        message.setFrom("2105584602@qq.com");           //发件人
        message.setTo(toMail);               //收件人
        message.setSubject("基于人脸识别的会议签到系统");  //主题
        message.setText("您好，您的验证码为："+verify);//正文
        mailSender.send(message);                       //发送
        System.out.println("邮件发送完毕！验证码为："+verify);

        return verify;
    }

//    /*可发送附件*/
//    public String sendEmailwithFile() throws MessagingException{
//        MimeMessage message = mailSender.createMimeMessage();
//        String verify = radomNum();
//
//        /*构造消息helper，第二个参数表明这个消息是multipart类型的*/
//        MimeMessageHelper helper = new MimeMessageHelper(message, true);
//        String src = "C:\\Users\\user\\Desktop\\FileController.java";
//        helper.setFrom("2105584602@qq.com");           //发件人
//        helper.setTo("2105584602@qq.com");               //收件人
//        helper.setSubject("基于人脸识别的会议签到系统");  //主题
//        helper.setText("您好，这是一个带有附件的消息，您的验证码为："+verify);//正文
//        /*使用Spring的FileSystemResource来加载文件*/
//        FileSystemResource file = new FileSystemResource(src);
//        System.out.println("文件是否存在？"+file.exists());
//        helper.addAttachment(src, file);    //添加附件，附件名和附件
//        mailSender.send(message);           //发送
//
//        System.out.println(src+"邮件发送完毕！验证码为："+radomNum());
//
//        return verify;
//    }
//
//    /*发送富文本*/
//    public String sendRichMail() throws MessagingException{
//        MimeMessage message = mailSender.createMimeMessage();
//        String verify = radomNum();
//
//        MimeMessageHelper helper = new MimeMessageHelper(message, true);
//        helper.setFrom("2105584602@qq.com");           //发件人
//        helper.setTo("2105584602@qq.com");               //收件人
//        helper.setSubject("基于人脸识别的会议签到系统");  //主题
//        helper.setText("<html><body><h1>欢迎</h1><a href='http://www.baidu.com'>百度一下</a></body></html>",true);            //第二个参数表明这是一个html
//        mailSender.send(message);
//
//        return verify;
//    }

}
