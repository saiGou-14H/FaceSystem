package com.org.config.utils;

import net.lingala.zip4j.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Map;

/**
 * date: 2019/07/26
 * writed by yangtingting
 */
public class FileUtil {

    /*
    * 将MultipartFile转未File
    * */
    public static File multipartFileToFile(MultipartFile multipartFile) throws Exception {
        // 获取文件名
        String fileName = multipartFile.getOriginalFilename();
        // 获取文件后缀
        String radom = String.valueOf(Math.random()*9999).substring(0,4);
        // 若须要防止生成的临时文件重复,能够在文件名后添加随机码
        try {
            File file = File.createTempFile(radom, fileName);    //文件名不能太长，否则后面解压会报错
            multipartFile.transferTo(file);

            /*重命名文件名*/
            File newFile = null;
            String filePath = file.getPath();
            //System.out.println("filePath:"+filePath);
            try {
                File oldFile = new File(filePath);
                filePath = file.getParent()+"/"+radom+".zip";      //获取父路径后拼接新的
                newFile = new File(filePath);
                if (newFile.exists()) {
                    boolean res = newFile.delete();
                    if (!res) {
                        System.out.println("Failed to delete file");
                    }
                }
                if (!oldFile.renameTo(newFile)) {
                    System.out.println("Failed to renameTo file");
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

            return newFile;
        } catch (Exception e) {e.printStackTrace();}
        return null;
    }

    /**
     * zip解压
     * @param //zipfile 待解压文件名
     * @param //destDirPath  解压路径
     */
    public static String ZipUncompress(File zip) throws Exception {

        String password = "password";

        File path = new File(ResourceUtils.getURL("").getPath());
        String destDirPath = path.getAbsolutePath() + "/temp/zipfiles";
        /*没有此文件夹就创建*/
        File filePath = new File(path.getAbsolutePath(), "/temp/zipfiles");
        if (!filePath.exists()) {
            filePath.mkdirs();
        }
        // 解压
        try {
            ZipFile zipFile = new ZipFile(zip);
            // 编码格式
            Charset gbk = Charset.forName("GBK");
            zipFile.setCharset(gbk);
            //zipFile.se
            if (zipFile.isEncrypted()) {
                zipFile.setPassword(password.toCharArray());
            }
            zipFile.extractAll(destDirPath);
            return destDirPath;       //返回解压后的文件夹路径
        } catch (ZipException e) {e.printStackTrace();}

        return null;
    }

    /*
    * 遍历文件夹
    * */
    public static Map<String, Object> traverseFace(File file){
        Map<String, Object> map = new HashMap<>();  //装每个人脸内容

        File flist[] = file.listFiles();
        if (flist == null || flist.length == 0) {
            return null;
        }
        for (File f : flist) {
            if (f.isDirectory()) {
                //这里将列出所有的文件夹
                //System.out.println("Dir==>" + f.getAbsolutePath());
                traverseFace(f);
            } else {
                map.put(f.getName(), f);                //键为图片名，值为图片文件
                //这里将列出所有的文件
                //System.out.println("file==>" + f.getAbsolutePath());
            }
        }
        return map;
    }

}
