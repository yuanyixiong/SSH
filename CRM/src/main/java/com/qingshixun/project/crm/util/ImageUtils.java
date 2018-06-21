/*****************************************************************************
 * Copyright (c) 2015, www.qingshixun.com
 * 
 * All rights reserved
 * 
 *****************************************************************************/
package com.qingshixun.project.crm.util;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.awt.image.WritableRaster;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * 图片操作工具类
 * @author QingShiXun
 * @version 1.0
 */
public class ImageUtils {

    private static Logger logger = LoggerFactory.getLogger(ImageUtils.class);

    public static final String DEFAULT_IMAGE_PATH = "/upload/";

    private static String DEFAULT_SMALL_IMAGE_PATH = "/upload/small/";

    /**
     * @Description 缩放图片
     * @param 参数列表 source 源图片,targetW 缩放后的宽度,targetH 缩放后的长度;
     * @return BufferedImage 缩放后的图片
     */
    private static BufferedImage getResizedImage(BufferedImage source, int targetW, int targetH) {
        int type = source.getType();
        BufferedImage target = null;
        // targetW，targetH分别表示目标长和宽
        double sx = (double) targetW / source.getWidth();
        double sy = (double) targetH / source.getHeight();
        // 这里想实现在targetW，targetH范围内实现等比缩放。如果不需要等比缩放
        // 则将下面的if else语句注释即可
        if (sx > sy) {
            sx = sy;
            targetW = (int) (sx * source.getWidth());
        } else {
            sy = sx;
            targetH = (int) (sy * source.getHeight());
        }
        if (type == BufferedImage.TYPE_CUSTOM) {
            ColorModel cm = source.getColorModel();
            WritableRaster raster = cm.createCompatibleWritableRaster(targetW, targetH);
            boolean alphaPremultiplied = cm.isAlphaPremultiplied();
            target = new BufferedImage(cm, raster, alphaPremultiplied, null);
        } else {
            target = new BufferedImage(targetW, targetH, type);
        }
        Graphics2D g = target.createGraphics();
        // smoother than exlax:
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g.drawRenderedImage(source, AffineTransform.getScaleInstance(sx, sy));
        g.dispose();
        return target;
    }

    /**
     * @Description 等比缩放图片
     * @param 参数列表 file 源图片,targetW 缩放后的宽度,targetH 缩放后的长度;
     * @return BufferedImage 缩放后的图片
     */
    public static BufferedImage resize(File file, int width, int height) {
        try {
            BufferedImage srcImage = ImageIO.read(file);
            if (width > 0 || height > 0) {
                srcImage = getResizedImage(srcImage, width, height);
            }
            return srcImage;
        } catch (IOException e) {
            logger.error(e.getMessage());
        }
        return null;
    }

    /**
     * 图片上传 并保存缩略图(上传的文件保存在项目同级的目录下) imageWidth 原图宽度， imageHeight 原图高度 ，imageURL 原图路径， smallImagePath 缩略图路径
     * 
     * @param request
     * @param imageFile
     * @param needSmallImage
     * @return
     * @throws Exception
     */
    public static Map<String, Object> saveImage(String rootPath, MultipartFile imageFile, boolean needSmallImage) throws Exception {
        Random rand = new Random();
        Map<String, Object> pathMap = new HashMap<String, Object>();
        if (null != imageFile && imageFile.getOriginalFilename().toLowerCase().trim().length() != 0) {
            String originalFileName = imageFile.getOriginalFilename().toLowerCase();
            String filetype = originalFileName.substring(originalFileName.indexOf("."));
            String timeMillis = String.valueOf(System.currentTimeMillis());
            String fileName = timeMillis + "_" + rand.nextInt(1000000) + filetype;
            String imageFileName = DEFAULT_IMAGE_PATH + fileName;
            // 获取项目在磁盘上面的物理路径
            File image = new File(rootPath + imageFileName);
            File dir = image.getParentFile();
            if (!dir.exists()) {
                dir.mkdirs();
            }
            FileCopyUtils.copy(imageFile.getBytes(), image);

            // 获取图片属性
            BufferedImage imgBufferedImage = ImageIO.read(image);
            // 原图宽度
            pathMap.put("imageWidth", imgBufferedImage.getWidth());
            // 原图高度
            pathMap.put("imageHeight", imgBufferedImage.getHeight());
            // 原图URL
            pathMap.put("imageURL", PathUtils.getRemoteProJectPath() + imageFileName);
            pathMap.put("imageName", fileName);
            if (needSmallImage) {
                String smallImagePath = DEFAULT_SMALL_IMAGE_PATH + timeMillis + "_" + rand.nextInt(1000000) + filetype;
                try {
                    FileCopyUtils.copy(imageFile.getBytes(), image);
                    BufferedImage bi = ImageUtils.resize(image, 200, 200);// 根据上传的图片文件生成对应的缩略图
                    File smallfile = new File(new File(rootPath) + "/" + smallImagePath);
                    if (!smallfile.getParentFile().exists()) {// 如果文件夹不存在
                        smallfile.getParentFile().mkdirs();// 创建上传文件夹
                    }
                    ImageIO.write(bi, "jpg", smallfile);// 将缩略图写入服务器端的制定文件夹中
                } catch (IOException e) {
                    logger.error(e.getMessage());
                }
                // 缩略图路径
                pathMap.put("smallImagePath", rootPath + "/" + smallImagePath);
            } else {
                // 缩略图路径
                pathMap.put("smallImagePath", "");
            }
        }
        return pathMap;
    }

    /**
     * @Description 传入原图名称,获得一个以时间格式的新名称
     * @param 参数列表 fileName 原图名称;
     * @return String 时间格式名称
     */
    public static String generateFileName(String fileName) {
        DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String formatDate = format.format(new Date());
        int random = new Random().nextInt(10000);
        int position = fileName.lastIndexOf(".");
        String extension = fileName.substring(position);
        return formatDate + random + extension;
    }

}
