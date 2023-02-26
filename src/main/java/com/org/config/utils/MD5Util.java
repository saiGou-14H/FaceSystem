package com.org.config.utils;

import org.testng.annotations.Test;
import org.springframework.stereotype.Component;

import java.nio.charset.StandardCharsets;

@Component
public class MD5Util {
    public static String getMD5(String password) {

        byte[] source = password.getBytes(StandardCharsets.UTF_8);  //将字符串转换为字节数组
        String s = null;

        char hexDigits[] = {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd',  'e', 'f'};
        try
        {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance( "MD5" );
            md.update(source);
            byte tmp[] = md.digest();

            char str[] = new char[16 * 2];

            int k = 0;
            for (int i = 0; i < 16; i++) {

                byte byte0 = tmp[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];

                str[k++] = hexDigits[byte0 & 0xf];
            }
            s = new String(str);

        }catch( Exception e )
        {
            e.printStackTrace();
        }
        return s;
    }

    @Test
    public void success() {
        String str = "710710000000000";
        System.out.println(MD5Util.getMD5(str));
    }

}
