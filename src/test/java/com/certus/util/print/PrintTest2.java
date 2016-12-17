package com.certus.util.print;
import java.io.*;  
import java.util.Locale;  
  
import javax.print.*;  
import javax.print.attribute.*;  
import javax.print.attribute.standard.*;  
  
public class PrintTest2 {  
  
    public static void main(String args[]) {  
  
        FileInputStream psStream = null;  
        try {  
            psStream = new FileInputStream("D:\\u60.png");  
        } catch (FileNotFoundException ffne) {  
            ffne.printStackTrace();  
        }  
        if (psStream == null) {  
            return;  
        }  
        //设置打印数据的格式，此处为图片gif格式  
        //DocFlavor psInFormat = DocFlavor.BYTE_ARRAY.AUTOSENSE;  
        DocFlavor psInFormat = DocFlavor.INPUT_STREAM.PNG;  

        //创建打印数据  
//      DocAttributeSet docAttr = new HashDocAttributeSet();//设置文档属性  
  //    Doc myDoc = new SimpleDoc(psStream, psInFormat, docAttr);  
      Doc myDoc = new SimpleDoc(psStream, psInFormat, null);  
      //Doc myDoc = new SimpleDoc("test".getBytes(), psInFormat, null);  
        //设置打印属性  
        PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();  
        aset.add(new Copies(1));//打印份数，3份  
          
        //查找所有打印服务  
        //PrintService[] services = PrintServiceLookup.lookupPrintServices(psInFormat, aset);  
        PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null);  

  
        // this step is necessary because I have several printers configured  
        //将所有查找出来的打印机与自己想要的打印机进行匹配，找出自己想要的打印机  
        PrintService myPrinter = null;  
        for (int i = 0; i < services.length; i++) {  
            System.out.println("service found: " + services[i]);  
            String svcName = services[i].toString();  
            if (svcName.contains("HP Deskjet 2510 series")) {  
                myPrinter = services[i];  
                System.out.println("my printer found: " + svcName);  
                System.out.println("my printer found: " + myPrinter);  
                break;  
            }  
        }  
  
        //可以输出打印机的各项属性  
        AttributeSet att = myPrinter.getAttributes();  
  
        for (Attribute a : att.toArray()) {  
  
            String attributeName;  
            String attributeValue;  
  
            attributeName = a.getName();  
            attributeValue = att.get(a.getClass()).toString();  
  
            System.out.println(attributeName + " : " + attributeValue);  
        }  
  
        if (myPrinter != null) {  
            DocPrintJob job = myPrinter.createPrintJob();//创建文档打印作业  
            try {  
                job.print(myDoc, null);//打印文档  
  
            } catch (Exception pe) {  
                pe.printStackTrace();  
            }  
        } else {  
            System.out.println("no printer services found");  
        }  
    }  
}  