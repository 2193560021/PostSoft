package com.anyue1517.sporty.controller;


import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;
import com.anyue1517.sporty.common.Result;
import com.baidu.aip.util.Base64Util;
import com.anyue1517.sporty.utils.FileUtil;
import com.anyue1517.sporty.utils.HttpUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

@RestController
@RequestMapping("/petai")
@Slf4j
public class Pet {


    @Value("${sporty.path}")
    private String basePath;

    private static final String ip = "http://localhost";

    private static String ImgfilePath = "";
    private static String ImgP = "";

    /**
     * 文件上传方法
     *
     * @param file
     * @return
     * @throws IOException
     */
    @PostMapping("/upload")
    public Result<?> upload(MultipartFile file) throws IOException {

        String originalFilename = file.getOriginalFilename();   //获取源文件名称
        String flag = IdUtil.fastSimpleUUID();

        String rootFilePath = System.getProperty("user.dir") + "/src/main/resources/cars/" + originalFilename;  // + flag + "$&$&"
        File rootFile = new File(rootFilePath);
        if (!rootFile.getParentFile().exists()) {
            rootFile.getParentFile().mkdirs();
        }
        cn.hutool.core.io.FileUtil.writeBytes(file.getBytes(),rootFilePath);      
        ImgfilePath = rootFilePath;
        ImgP =  originalFilename;
        return Result.success("http://localhost:8080/cars/" + originalFilename); 
    }

    /**
     * 文件下载方法
     *
     * @param response
     * @return
     */
    @GetMapping("{flag}")
    public void downLoad(@PathVariable String flag, HttpServletResponse response) {
//
//        try {
//            //输入流，通过输入流来读取文件内容
//            FileInputStream fileInputStream = new FileInputStream(new File(basePath + name));
//            //输出流，通过输出流将文件写回浏览器，在浏览器展示图片
//            ServletOutputStream outputStream = response.getOutputStream();  //通过输出流返回文件
//
//            response.setContentType("image/jpeg");
//
//            int len = 0;
//            byte[] bytes = new byte[1024];
//            while ((len = fileInputStream.read(bytes)) != -1) {
//                outputStream.write(bytes, 0, len);
//                outputStream.flush();
//            }
//
//            //关闭资源
//            outputStream.close();
//            fileInputStream.close();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        OutputStream os;  // 新建一个输出流对象
        String basePath = System.getProperty("user.dir") + "/src/main/resources/cars/";  // 定于文件上传的根路径
        List<String> fileNames = cn.hutool.core.io.FileUtil.listFileNames(basePath);  // 获取所有的文件名称
        String fileName = fileNames.stream().filter(name -> name.contains(flag)).findAny().orElse("");  // 找到跟参数一致的文件
        try {
            if (StrUtil.isNotEmpty(fileName)) {
                response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
                response.setContentType("application/octet-stream");
                byte[] bytes = cn.hutool.core.io.FileUtil.readBytes(basePath + fileName);  // 通过文件的路径读取文件字节流
                os = response.getOutputStream();   // 通过输出流返回文件
                os.write(bytes);
                os.flush();
                os.close();
            }
        } catch (Exception e) {
            System.out.println("文件下载失败");
        }

    }



    @PostMapping
    public Result<?> pet() {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/image-classify/v1/animal";
        try {
            String filePath = ImgfilePath;
            byte[] imgData = FileUtil.readFileByBytes(filePath);
            String imgStr = Base64Util.encode(imgData);
            String imgParam = URLEncoder.encode(imgStr, "UTF-8");
            String param = "image=" + imgParam + "&top_num=" + 5 + "&baike_num=" + 1;
            String accessToken = "24.2a211e899ea9b0d26be56643a6f751ce.2592000.1685183849.282335-30134283";
            String result = HttpUtil.post(url, accessToken, param);
            System.out.println(result);
            return Result.success(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
//        Car.car();
    }
}
