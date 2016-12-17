package com.certus.util;

public class ZplPrinterTest {  
    public static void main(String[] args) {  
        ZplPrinter p = new ZplPrinter("ZDesigner GK420t");  
//      ZplPrinter p = new ZplPrinter("\\\\10.10.13.224\\ZDesigner GT800 (ZPL)");  
          
//      printBarcode(p);  
//      p.resetZpl();//清除  
//      printPicking300DPI(p);  
//      p.resetZpl();//清除  
//      printPicking203DPI(p);  
//      p.resetZpl();//清除  
        printRestoking(p);  
    }  
    private static boolean printBarcode(ZplPrinter p){  
        //1.打印单个条码  
        String bar0 = "131ZA010101";//条码内容  
//      String bar0Zpl = "^FO110,110^BY6,3.0,280^BCN,,Y,N,N^FD${data}^FS";//条码样式模板  
        String bar0Zpl = "^FO100,50^AAN,100,110^BY6,3.0,280^BCN,,N,N,N^FD${data}^FS";//条码样式模板  
        p.setBarcode(bar0, bar0Zpl);  
        p.setChar(bar0,200,380,140,110);  
        p.setText("上", 880, 380, 60, 60, 30, 4, 4, 24);  
        String zpl = p.getZpl();  
        System.out.println(zpl);  
        boolean result = p.print(zpl);//打印  
        return result;  
    }  
    private static boolean printPicking300DPI(ZplPrinter p){  
        //左边的条码  
        String bar1 = "07";  
        p.setChar(bar1, 190, 130, 60, 60);  
        String bar1Zpl = "^FO100,200^BY8,3.0,240^BCR,,N,N,N^FD${data}^FS";//条码样式模板  
        p.setBarcode(bar1,bar1Zpl);  
        //下边的条码  
        String bar2 = "123459999900188ABCDE";//20位  
        String bar2Paper = "^FO380,600^BY3,3.0,100^BCN,,Y,N,N^FD${data}^FS";//条码样式模板  
        p.setBarcode(bar2,bar2Paper);  
          
        p.setText("国药控股湖南有限公司", 380, 40, 60, 60, 30, 2, 2, 24);  
        p.setChar("CSS0BPKPPR", 380, 100, 60, 60);  
          
        p.setText("09件",940, 80, 60, 60, 30, 2, 2, 24);  
        p.setText("补", 1100, 80, 60, 60, 30, 2, 2, 24);  
          
        p.setText("公司自配送 公路", 380, 180, 80, 80, 30, 3, 3, 24);  
        p.setChar("03231151",940, 187, 40, 40);  
        p.setChar("2015-10-10",940, 227, 30, 30);  
          
        p.setText("湖南六谷大药房连锁有限公司", 380, 260, 60, 60, 30, 2, 2, 24);  
          
        p.setText("：长沙市：开福区：捞刀河镇中岭村258号：", 380, 320, 60, 60, 30, 2, 2, 22);  
          
        p.setText("多SKU", 800, 485, 60, 60, 30, 2, 2, 24);  
          
        p.setText("库位:49", 380, 420, 56, 56, 30, 2, 2, 24);  
        p.setText("品类:感冒胶囊", 380, 485, 56, 56, 30, 2, 2, 24);  
          
        p.setText("批号:", 380, 550, 56, 56, 30, 2, 2, 24);  
        p.setChar("78787878788", 500, 560, 40, 40);  
          
        String zpl = p.getZpl();  
        System.out.println(zpl);  
        boolean result = p.print(zpl);  
        return result;  
    }  
    private static boolean printPicking203DPI(ZplPrinter p){  
        //左边的条码  
        String bar1 = "07";  
        p.setChar(bar1, 126, 86, 40, 40);  
        String bar1Zpl = "^FO66,133^BY5,3.0,160^BCR,,N,N,N^FD${data}^FS";//条码样式模板  
        p.setBarcode(bar1,bar1Zpl);  
        //下边的条码  
        String bar2 = "00000999990018822969";//20位  
        String bar2Paper = "^FO253,400^BY2,3.0,66^BCN,,Y,N,N^FD${data}^FS";//条码样式模板  
        p.setBarcode(bar2,bar2Paper);  
          
        p.setText("国药控股湖南有限公司", 253, 26, 40, 40, 20, 1, 1, 24);  
        p.setChar("CSS0BPKPPR", 253, 66, 20, 20);  
          
        p.setText("09件",626, 53, 40, 40, 20, 1, 1, 24);  
        p.setText("补", 733, 53, 40, 40, 20, 1, 1, 24);  
          
        p.setText("公司自配送 公路", 253, 120, 53, 53, 20, 1, 1, 24);  
        p.setChar("03231151",626, 124, 26, 26);  
        p.setChar("2015-10-10",626, 151, 20, 20);  
          
        p.setText("湖南六谷大药房连锁有限公司", 253, 173, 40, 40, 20, 1, 1, 24);  
          
        p.setText("长沙市开福区捞刀河镇中岭村258号", 253, 213, 30, 30, 20, 1, 1, 22);  
          
        p.setText("多SKU", 533, 323, 40, 40, 20, 1, 1, 24);  
          
        p.setText("库位:49", 253, 280, 37, 37, 20, 1, 1, 24);  
        p.setText("品类:感冒胶囊", 253, 323, 37, 37, 20, 1, 1, 24);  
          
        p.setText("批号:", 253, 366, 37, 37, 20, 1, 1, 24);  
        p.setChar("78787878788", 333, 373, 26, 26);  
          
        String zpl = p.getZpl();  
        System.out.println(zpl);  
        boolean result = p.print(zpl);  
        return result;  
    }  
    private static boolean printRestoking(ZplPrinter p){  
        //上方的条码  
        String bar1 = "1434455567773344abcd";  
        String bar1Zpl = "^FO85,70^BY4,3.0,140^BCN,,Y,N,N^FD${data}^FS";//条码样式模板  
        p.setBarcode(bar1,bar1Zpl);  
        //源货位  
        p.setText("来源:131ZA010101", 100, 320, 60, 60, 30, 2, 2, 24);  
        //目标货位  
        p.setText("目的:131ZA010102",640, 320, 60, 60, 30, 2, 2, 24);  
        //货品编号  
        p.setText("货品编号:YF10001", 100, 440, 60, 60, 30, 2, 2, 24);  
        //件装数  
        p.setText("补货数量:200", 640, 440, 60, 60, 30, 2, 2, 24);  
        //品名  
        p.setText("复方一支黄花：", 100, 580, 60, 60, 30, 2, 2, 24);  
          
        String zpl = p.getZpl();  
        System.out.println(zpl);  
        boolean result = p.print(zpl);  
        return result;  
    }  
}  
