package com.certus.utils;

import java.io.File;
import java.io.FileInputStream;

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.standard.PrinterName;

public class PrintUtil {
	
    public static void DateToStr(String code) throws Exception {
    	PrintUtil printUtil = new PrintUtil();
    	StringBuffer s_prt_buffer = new StringBuffer();
    	int x = 260;
    	int y = 2;
    	s_prt_buffer.append("^XA").append("^FO").append(x).append(",").append(y).
    	append("^BY1,3,45^BCN,,Y,N^FD").append(code).append("^FS").append("^XZ");
    	printUtil.print(s_prt_buffer.toString());
	} 
    
    public PrintUtil() throws Exception {
		File file = new File(this.getClass().getResource("").getPath()+"ts24.lib");
		FileInputStream fis = new FileInputStream(file);
		byte[] dotfont = new byte[fis.available()];
		fis.read(dotfont);
		fis.close();
	}
    public void print(String str) throws PrintException {

		PrintService[] services = PrintServiceLookup.lookupPrintServices(null,null);
		PrintService psZebra = null;

		if (services != null && services.length > 0) {
			String printerName = "GX420t";// something like this
			for (PrintService service : services) {
				System.out.println(service.getName());
				System.out.println(service.getAttribute(PrinterName.class).getValue());
				if (service.getAttribute(PrinterName.class).getValue().indexOf(
						printerName) != -1) {
					System.out.println("print:"+service.getName());
					psZebra = service;
					break;
				}
			}
		}
		DocPrintJob job = psZebra.createPrintJob();
		byte[] by = str.getBytes();
		DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
		Doc doc = new SimpleDoc(by, flavor, null);
		job.print(doc, null);
	}
}
