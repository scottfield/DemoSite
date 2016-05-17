package com.cdfamedy.core.util;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.awt.image.MemoryImageSource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;


public final class NewImageUtils {
    /**
     * @param file 源文件
     * @return Image
     * @Title: getFileImage
     * @Description: 读取源文件 转换为java.awt.Image类型的数据
     */
    private static Image getFileImage(File file) {
        Image image = null;
        if (Common.getFileExtension(file.getName()).equals("bmp")) {
            FileInputStream in = null;
            try {
                in = new FileInputStream(file);
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            image = BMPLoader.read(in);
        } else {
            try {
                image = ImageIO.read(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return image;
    }

    /**
     * @param file  需要被叠加的图片文件
     * @param scale 缩放等级 等于1 不进行缩放
     * @return BufferedImage
     * @Title: getMyBufferedImage
     * @Description: 构建一个预定义图像类型的BufferedImage
     */
    private static BufferedImage getMyBufferedImage(File file, float scale) {

        Image image = getFileImage(file);// 得到Image对象
        BufferedImage buffImg = null;
        try {
            buffImg = ImageIO.read(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        //宽跟高
        int width = (int) (image.getWidth(null));
        int height = (int) (image.getHeight(null));
        // 构建一个预定义图像类型的BufferedImage
        buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        // 创建Graphics2D对象，用在BufferedImage对象上绘图
        Graphics2D g2d = buffImg.createGraphics();
        // 设置图形上下文的当前颜色为透明色
        Color transparent = new Color(0, 0, 0, 0);
        g2d.setColor(transparent);
        // 填充指定的矩形区域
        g2d.fillRect(0, 0, width, height);

        g2d.drawImage(image, 0, 0, width, height, null);
        if (scale != 1.0f) {
            //缩放图片
            BufferedImage filteredBufImage = new BufferedImage((int) (width * scale), (int) (height * scale), BufferedImage.TYPE_INT_RGB); //过滤后的图像
            AffineTransform transform = new AffineTransform(); //仿射变换对象
            transform.setToScale(scale, scale); //设置仿射变换的比例因子
            AffineTransformOp imageOp = new AffineTransformOp(transform, null);//创建仿射变换操作对象
            imageOp.filter(buffImg, filteredBufImage);//过滤图像，目标图像在filteredBufImage
            buffImg = filteredBufImage;
        }
        return buffImg;
    }

    /**
     * 算法选择
     *
     * @return RenderingHints的一个对象
     */
    private static RenderingHints getMyRenderingHints() {
        RenderingHints rh = new RenderingHints(RenderingHints.KEY_ANTIALIASING,// 抗锯齿提示键。
                RenderingHints.VALUE_ANTIALIAS_ON);// 抗锯齿提示值——使用抗锯齿模式完成呈现。
        rh.put(RenderingHints.KEY_TEXT_ANTIALIASING,// 文本抗锯齿提示键。
                RenderingHints.VALUE_TEXT_ANTIALIAS_LCD_VRGB);//要求针对 LCD 显示器优化文本显示
        rh.put(RenderingHints.KEY_ALPHA_INTERPOLATION,// Alpha 插值提示值
                RenderingHints.VALUE_ALPHA_INTERPOLATION_QUALITY);// Alpha 插值提示值——选择偏重于精确度和视觉质量的 alpha 混合算法
        rh.put(RenderingHints.KEY_RENDERING,// 呈现提示键。
                RenderingHints.VALUE_RENDER_QUALITY);// 呈现提示值——选择偏重输出质量的呈现算法
        rh.put(RenderingHints.KEY_STROKE_CONTROL,//笔划规范化控制提示键。
                RenderingHints.VALUE_STROKE_NORMALIZE);//几何形状应当规范化，以提高均匀性或直线间隔和整体美观。
        rh.put(RenderingHints.KEY_COLOR_RENDERING,//颜色呈现提示键。
                RenderingHints.VALUE_COLOR_RENDER_QUALITY);// 用最高的精确度和视觉质量执行颜色转换计算。
        return rh;
    }

    /**
     * @param g2d    由源文件生成的Graphics
     * @param img    需要叠加的水印Image
     * @param x      以右下角为原点 水印放置的X坐标
     * @param y      以右下角为原点 水印放置的Y坐标
     * @param width  水印图片的宽度
     * @param height 水印图片的高度
     * @param alpha  水印的透明度 选择值从0.0~1.0: 完全透明~完全不透明
     * @return void
     * @Title: printWatemark
     * @Description: 添加水印
     */
    private static void printWatemark(Graphics2D g2d, Image img, int x, int y, int width, int height, float alpha) {
        //在图形和图像中实现混合和透明效果
        g2d.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP,
                alpha));
        g2d.drawImage(img, x, y, width, height, null);
    }


    /**
     * @param file      源文件(图片)
     * @param waterFile 水印文件(图片)
     * @param x         距离右下角的X偏移量
     * @param y         距离右下角的Y偏移量
     * @param alpha     透明度, 选择值从0.0~1.0: 完全透明~完全不透明
     * @return BufferedImage
     * @Title: watermark
     * @Description: 生成水印并返回java.awt.image.BufferedImage
     */
    public static BufferedImage watermark(File file, File waterFile, int x, int y, float alpha) throws IOException {
        BufferedImage buffImg = getMyBufferedImage(file, 1.0f);
        BufferedImage waterImg = ImageIO.read(waterFile);
        // 创建Graphics2D对象，用在BufferedImage对象上绘图
        Graphics2D g2d = buffImg.createGraphics();
        g2d.setRenderingHints(getMyRenderingHints());

        int sourceImgWidth = buffImg.getWidth();
        int sourceImgHeight = buffImg.getHeight();

        int waterImgWidth = waterImg.getWidth();
        int waterImgHeight = waterImg.getHeight();


        printWatemark(g2d, waterImg, sourceImgWidth - waterImgWidth - x, sourceImgHeight - waterImgHeight - y, waterImgWidth, waterImgHeight, alpha);
        g2d.dispose();// 释放图形上下文使用的系统资源
        return buffImg;
    }

    /**
     * 输出水印图片
     *
     * @param buffImg  图像加水印之后的BufferedImage对象
     * @param savePath 图像加水印之后的保存路径
     */
    public void generateWaterFile(BufferedImage buffImg, String savePath) {
        int temp = savePath.lastIndexOf(".") + 1;
        try {
            ImageIO.write(buffImg, savePath.substring(temp), new File(savePath));
        } catch (IOException e1) {
            e1.printStackTrace();
        }
    }

    public static void main(String[] args) throws IOException {
        String sourceFilePath = "D:\\fivecard.png";
        String waterFilePath = "D:\\7400050012190.png";
        String saveFilePath = "D:\\new.png";
        NewImageUtils newImageUtils = new NewImageUtils();
        // 对图像加水印
        BufferedImage buffImg = NewImageUtils.watermark(new File(sourceFilePath), new File(waterFilePath), 70, 270, 1f);
        // 输出水印图片
        newImageUtils.generateWaterFile(buffImg, saveFilePath);
    }

    /**
     * 处理bmp后缀的图片
     *
     * @author 代码来自网上
     */
    public static class BMPLoader

    {

        // build an int from a byte array - convert little to big endian
        public static int constructInt(byte[] in, int offset) {

            int ret = ((int) in[offset + 3] & 0xff);

            ret = (ret << 8) | ((int) in[offset + 2] & 0xff);

            ret = (ret << 8) | ((int) in[offset + 1] & 0xff);

            ret = (ret << 8) | ((int) in[offset + 0] & 0xff);

            return (ret);

        }

        // build an int from a byte array - convert little to big endian
        // set high order bytes to 0xfff
        public static int constructInt3(byte[] in, int offset) {

            int ret = 0xff;

            ret = (ret << 8) | ((int) in[offset + 2] & 0xff);

            ret = (ret << 8) | ((int) in[offset + 1] & 0xff);

            ret = (ret << 8) | ((int) in[offset + 0] & 0xff);

            return (ret);

        }

        // build an int from a byte array - convert little to big endian
        public static long constructLong(byte[] in, int offset) {

            long ret = ((long) in[offset + 7] & 0xff);

            ret |= (ret << 8) | ((long) in[offset + 6] & 0xff);

            ret |= (ret << 8) | ((long) in[offset + 5] & 0xff);

            ret |= (ret << 8) | ((long) in[offset + 4] & 0xff);

            ret |= (ret << 8) | ((long) in[offset + 3] & 0xff);

            ret |= (ret << 8) | ((long) in[offset + 2] & 0xff);

            ret |= (ret << 8) | ((long) in[offset + 1] & 0xff);

            ret |= (ret << 8) | ((long) in[offset + 0] & 0xff);

            return (ret);

        }

        // build an double from a byte array - convert little to big endian
        public static double constructDouble(byte[] in, int offset) {

            long ret = constructLong(in, offset);

            return (Double.longBitsToDouble(ret));

        }

        // build an short from a byte array - convert little to big endian
        public static short constructShort(byte[] in, int offset) {

            short ret = (short) ((short) in[offset + 1] & 0xff);

            ret = (short) ((ret << 8) | (short) ((short) in[offset + 0] & 0xff));

            return (ret);

        }

        // internal class representing a bitmap header structure
        // with code to read it from a file
        static class BitmapHeader {

            public int nsize;

            public int nbisize;

            public int nwidth;

            public int nheight;

            public int nplanes;

            public int nbitcount;

            public int ncompression;

            public int nsizeimage;

            public int nxpm;

            public int nypm;

            public int nclrused;

            public int nclrimp;

            // read in the bitmap header
            public void read(FileInputStream fs) throws IOException

            {

                final int bflen = 14; // 14 byte BITMAPFILEHEADER

                byte bf[] = new byte[bflen];

                fs.read(bf, 0, bflen);

                final int bilen = 40; // 40-byte BITMAPINFOHEADER

                byte bi[] = new byte[bilen];

                fs.read(bi, 0, bilen);

                // Interperet data.
                nsize = constructInt(bf, 2);

                // System.out.println("File type is :"+(char)bf[0]+(char)bf[1]);
                // System.out.println("Size of file is :"+nsize);

                nbisize = constructInt(bi, 2);

                // System.out.println("Size of bitmapinfoheader is :"+nbisize);

                nwidth = constructInt(bi, 4);

                // System.out.println("Width is :"+nwidth);

                nheight = constructInt(bi, 8);

                // System.out.println("Height is :"+nheight);

                nplanes = constructShort(bi, 12); // (((int)bi[13]&0xff)<<8) |
                // (int)bi[12]&0xff;

                // System.out.println("Planes is :"+nplanes);

                nbitcount = constructShort(bi, 14); // (((int)bi[15]&0xff)<<8) |
                // (int)bi[14]&0xff;

                // System.out.println("BitCount is :"+nbitcount);

                // Look for non-zero values to indicate compression
                ncompression = constructInt(bi, 16);

                // System.out.println("Compression is :"+ncompression);

                nsizeimage = constructInt(bi, 20);

                // System.out.println("SizeImage is :"+nsizeimage);

                nxpm = constructInt(bi, 24);

                // System.out.println("X-Pixels per meter is :"+nxpm);

                nypm = constructInt(bi, 28);

                // System.out.println("Y-Pixels per meter is :"+nypm);

                nclrused = constructInt(bi, 32);

                // System.out.println("Colors used are :"+nclrused);

                nclrimp = constructInt(bi, 36);

                // System.out.println("Colors important are :"+nclrimp);

            }

        }

        public static Image read(FileInputStream fs)

        {

            try {

                BitmapHeader bh = new BitmapHeader();

                bh.read(fs);

                if (bh.nbitcount == 24)

                    return (readMap24(fs, bh));

                if (bh.nbitcount == 32)

                    return (readMap32(fs, bh));

                if (bh.nbitcount == 8)

                    return (readMap8(fs, bh));

                fs.close();

            } catch (IOException e) {

                // System.out.println("Caught exception in loadbitmap!");
            }

            return (null);

        }

        /**
         * readMap24 internal routine to read the bytes in a 24 bit bitmap
         * <p>
         * <p>
         * <p>
         * Arguments:
         * <p>
         * fs - file stream
         * <p>
         * bh - header struct
         * <p>
         * Returns:
         * <p>
         * Image Object, be sure to check for (Image)null !!!!
         */
        protected static Image readMap32(FileInputStream fs, BitmapHeader bh)
                throws IOException

        {

            Image image;

            // No Palatte data for 24-bit format but scan lines are

            // padded out to even 4-byte boundaries.

            int xwidth = bh.nsizeimage / bh.nheight;

            int ndata[] = new int[bh.nheight * bh.nwidth];

            byte brgb[] = new byte[bh.nwidth * 4 * bh.nheight];

            fs.read(brgb, 0, bh.nwidth * 4 * bh.nheight);

            int nindex = 0;

            for (int j = 0; j < bh.nheight; j++)

            {

                for (int i = 0; i < bh.nwidth; i++)

                {

                    ndata[bh.nwidth * (bh.nheight - j - 1) + i] = constructInt3(
                            brgb, nindex);

                    nindex += 4;

                }

            }

            image = Toolkit.getDefaultToolkit().createImage

                    (new MemoryImageSource(bh.nwidth, bh.nheight,

                            ndata, 0, bh.nwidth));

            fs.close();

            return (image);

        }

        /**
         * readMap24 internal routine to read the bytes in a 24 bit bitmap
         * <p>
         * <p>
         * <p>
         * Arguments:
         * <p>
         * fs - file stream
         * <p>
         * bh - header struct
         * <p>
         * Returns:
         * <p>
         * Image Object, be sure to check for (Image)null !!!!
         */
        protected static Image readMap24(FileInputStream fs, BitmapHeader bh)
                throws IOException

        {

            Image image;

            // No Palatte data for 24-bit format but scan lines are

            // padded out to even 4-byte boundaries.

            int npad = (bh.nsizeimage / bh.nheight) - bh.nwidth * 3;

            int ndata[] = new int[bh.nheight * bh.nwidth];

            byte brgb[] = new byte[(bh.nwidth + npad) * 3 * bh.nheight];

            fs.read(brgb, 0, (bh.nwidth + npad) * 3 * bh.nheight);

            int nindex = 0;

            for (int j = 0; j < bh.nheight; j++)

            {

                for (int i = 0; i < bh.nwidth; i++)

                {

                    ndata[bh.nwidth * (bh.nheight - j - 1) + i] = constructInt3(
                            brgb, nindex);

                    nindex += 3;

                }

                nindex += npad;

            }

            image = Toolkit.getDefaultToolkit().createImage

                    (new MemoryImageSource(bh.nwidth, bh.nheight,

                            ndata, 0, bh.nwidth));

            fs.close();

            return (image);

        }

        /**
         * readMap8 internal routine to read the bytes in a 8 bit bitmap
         * <p>
         * <p>
         * <p>
         * Arguments:
         * <p>
         * fs - file stream
         * <p>
         * bh - header struct
         * <p>
         * Returns:
         * <p>
         * Image Object, be sure to check for (Image)null !!!!
         */
        protected static Image readMap8(FileInputStream fs, BitmapHeader bh)
                throws IOException

        {

            Image image;

            // Have to determine the number of colors, the clrsused

            // parameter is dominant if it is greater than zero. If

            // zero, calculate colors based on bitsperpixel.

            int nNumColors = 0;

            if (bh.nclrused > 0)

            {

                nNumColors = bh.nclrused;

            } else

            {

                nNumColors = (1 & 0xff) << bh.nbitcount;

            }

            // System.out.println("The number of Colors is"+nNumColors);

            // Some bitmaps do not have the sizeimage field calculated

            // Ferret out these cases and fix 'em.

            if (bh.nsizeimage == 0)

            {

                bh.nsizeimage = ((((bh.nwidth * bh.nbitcount) + 31) & ~31) >> 3);

                bh.nsizeimage *= bh.nheight;

                // System.out.println("nsizeimage (backup) is"+nsizeimage);

            }

            // Read the palatte colors.

            int npalette[] = new int[nNumColors];

            byte bpalette[] = new byte[nNumColors * 4];

            fs.read(bpalette, 0, nNumColors * 4);

            int nindex8 = 0;

            for (int n = 0; n < nNumColors; n++)

            {

                npalette[n] = constructInt3(bpalette, nindex8);

                nindex8 += 4;

            }

            // Read the image data (actually indices into the palette)

            // Scan lines are still padded out to even 4-byte

            // boundaries.

            int npad8 = (bh.nsizeimage / bh.nheight) - bh.nwidth;

            // System.out.println("nPad is:"+npad8);

            int ndata8[] = new int[bh.nwidth * bh.nheight];

            byte bdata[] = new byte[(bh.nwidth + npad8) * bh.nheight];

            fs.read(bdata, 0, (bh.nwidth + npad8) * bh.nheight);

            nindex8 = 0;

            for (int j8 = 0; j8 < bh.nheight; j8++)

            {

                for (int i8 = 0; i8 < bh.nwidth; i8++)

                {

                    ndata8[bh.nwidth * (bh.nheight - j8 - 1) + i8] =

                            npalette[((int) bdata[nindex8] & 0xff)];

                    nindex8++;

                }

                nindex8 += npad8;

            }

            image = Toolkit.getDefaultToolkit().createImage

                    (new MemoryImageSource(bh.nwidth, bh.nheight,

                            ndata8, 0, bh.nwidth));

            return (image);

        }

        /**
         * load method - see read for details
         * <p>
         * <p>
         * <p>
         * Arguments:
         * <p>
         * sdir and sfile are the result of the FileDialog()
         * <p>
         * getDirectory() and getFile() methods.
         * <p>
         * <p>
         * <p>
         * Returns:
         * <p>
         * Image Object, be sure to check for (Image)null !!!!
         */
        public static Image load(String sdir, String sfile) {

            return (load(sdir + sfile));

        }

        /**
         * load method - see read for details
         * <p>
         * <p>
         * <p>
         * Arguments:
         * <p>
         * sdir - full path name
         * <p>
         * <p>
         * <p>
         * Returns:
         * <p>
         * Image Object, be sure to check for (Image)null !!!!
         */
        public static Image load(String sdir)

        {

            try

            {

                FileInputStream fs = new FileInputStream(sdir);

                return (read(fs));

            } catch (IOException ex) {

                return (null);

            }

        }
    }

    /**
     * 公共的方法
     *
     * @author CSDN's Cannel_2020
     */
    public static class Common {
        /**
         * 设置窗口居中
         *
         * @param window 所要居中的Window对象
         */
        public static void setCentered(Window window) {
            Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
            window.setLocation(new Point((screenSize.width - window.getWidth()) / 2,
                    (screenSize.height - window.getHeight()) / 2));
        }

        /**
         * 获得系统中所有的可用字体
         *
         * @return 系统中所有的可用字体
         */
        public static String[] getAvailableFontFamilyNames() {
            // 获取系统中的所有可用字体
            GraphicsEnvironment e = GraphicsEnvironment
                    .getLocalGraphicsEnvironment();
            String[] temps = e.getAvailableFontFamilyNames();
            String[] fontFamily = new String[temps.length];
            int i = temps.length - 1;
            for (String temp : temps) {
                fontFamily[i--] = temp;
            }
            return fontFamily;
        }

        /**
         * 设置面板中各个组件的字体
         *
         * @param panel JPanel的一个实例
         */
        public static void setComponentsFont(JPanel panel, Font font) {
            Component[] components = panel.getComponents();
            for (Component cp : components) {
                cp.setFont(font);
            }
        }

        /**
         * @param filename 文件的名字
         * @return 文件的后缀名
         */
        public static String getFileExtension(String filename) {
            return filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
        }

        /**
         * @param filename
         * @return 图片文件("bmp", "gif", "jpg", "jpeg", "png")返回：true
         */
        public static boolean isImageFile(String filename) {
            String imageExtendsion[] = {"bmp", "gif", "jpg", "jpeg", "png"};
            String fileExtendsion = getFileExtension(filename);
            for (int i = 0; i < imageExtendsion.length; ++i) {
                if (imageExtendsion[i].equals(fileExtendsion)) {
                    return true;
                }
            }
            return false;
        }

        /**
         * 获得一个文件夹下的所有图片文件
         *
         * @param filepath 文件夹的路径
         * @return 文件夹下的所有图片文件的绝对路径
         */
        public static ArrayList<String> getImageFiles(String filepath) {
            ArrayList<String> imgFileList = new ArrayList<String>();
            File file = new File(filepath);
            File[] files = file.listFiles();
            for (int i = 0; i < files.length; i++) {
                if (!files[i].isDirectory()) {
                    String filename = files[i].getName();
                    if (Common.isImageFile(filename)) {
                        imgFileList.add(filepath + "\\" + filename);
                    }
                }
            }
            return imgFileList;
        }

        /**
         * @return 加水印后的文件名或文件夹名字
         */
        public static String getNewFileorDirName(String filepath) {
            String new_Filename = "\\New_"
                    + filepath.substring(filepath.lastIndexOf("\\") + 1);
            return new_Filename;
        }

    }
}
