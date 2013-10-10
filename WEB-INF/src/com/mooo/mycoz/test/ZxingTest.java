package com.mooo.mycoz.test;


import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.imageio.ImageIO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.EncodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class ZxingTest {

	private static Log log = LogFactory.getLog(ZxingTest.class);

	/**
	 * 编码
	 * 
	 * @param contents
	 * @param width
	 * @param height
	 * @param imgPath
	 */
	public void codingQRCode(String contents, int width, int height, String imgPath) {
        try {
            Hashtable<EncodeHintType, Object> hintMap = new Hashtable<EncodeHintType, Object>();
            //指定纠错等级
            hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
            //指定编码格式
            //hintMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");
            //hintMap.put(EncodeHintType.CHARACTER_SET, "GB18030");
            
            QRCodeWriter qrCodeWriter = new QRCodeWriter();
            
            String buf = new String(contents.getBytes("UTF-8"),"ISO-8859-1");
            BitMatrix byteMatrix = qrCodeWriter.encode(buf,BarcodeFormat.QR_CODE, width, height, hintMap);
            
            int CrunchifyWidth = byteMatrix.getWidth();
            BufferedImage image = new BufferedImage(CrunchifyWidth, CrunchifyWidth,BufferedImage.TYPE_INT_RGB);
            //image.createGraphics();
 
            Graphics2D graphics = (Graphics2D) image.getGraphics();
            graphics.setColor(Color.WHITE);
            graphics.fillRect(0, 0, CrunchifyWidth, CrunchifyWidth);
            graphics.setColor(Color.BLACK);
 
            for (int i = 0; i < CrunchifyWidth; i++) {
                for (int j = 0; j < CrunchifyWidth; j++) {
                    if (byteMatrix.get(i, j)) {
                        graphics.fillRect(i, j, 1, 1);
                    }
                }
            }
            ImageIO.write(image, "png", new File(imgPath));
        } catch (WriterException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}

	/**
	 * 解码
	 * 
	 * @param imgPath
	 */
    public String decodeQRCode(String imgPath) {  
        BufferedImage image = null;  
        Result result = null;  
        try {  
            image = ImageIO.read(new File(imgPath));  
            if (image == null) {  
                System.out.println("the decode image may be not exit.");  
            }  
            LuminanceSource source = new BufferedImageLuminanceSource(image);  
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));  
  
            Map<Object, Object> hints = new HashMap<Object, Object>();  
            hints.put(DecodeHintType.CHARACTER_SET, "UTF-8");  
  
            result = new MultiFormatReader().decode(bitmap);  
            return result.getText();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
   
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String imgPath = "michael_zxing.png";
		String contents = "Hello Michael(大大),welcome to Zxing!"
				+ "\nMichael’s blog [ http://sjsky.iteye.com ]"
				+ "\nEMail [ sjsky007@gmail.com ]" + "\nTwitter [ @suncto ]";
		int width = 200, height = 200;
		
		ZxingTest handler = new ZxingTest();
		handler.codingQRCode(contents, width, height, imgPath);
		System.out.println("Michael ,you have finished zxing encode.");
		
		contents="宝贝生日快乐!";
			String buf;
			try {
				buf = new String(contents.getBytes("UTF-8"),"ISO-8859-1");
				handler.codingQRCode(buf, width, height, "/home/zlei/hday1.png");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        String decodeContent = handler.decodeQRCode(imgPath);
        System.out.println("解码内容如下：");
        System.out.println(decodeContent);
        System.out.println("Michael ,you have finished zxing decode."); 
        if (log.isDebugEnabled()) log.debug("Michael ,you have finished zxing decode.");  
	}
}
