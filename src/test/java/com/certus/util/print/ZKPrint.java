package com.certus.util.print;


import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;

import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.standard.PrinterName;

public class ZKPrint {
	String s_prt = "^XA", s_prt_buffer = "";

	public static void main(String[] args) {

		try {
			ZKPrint a = new ZKPrint();
			String barcode = "1234567887654321abcdefgh";
			a.setCommand(barcode);
			String str = a.getCommand();
			System.out.println(str);
			a.print(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ZKPrint() throws Exception {
		File file = new File(this.getClass().getResource("").getPath()+"ts24.lib");
		FileInputStream fis = new FileInputStream(file);
		byte[] dotfont = new byte[fis.available()];
		fis.read(dotfont);
		fis.close();
	}

	protected void setCommand(String barcode) {
		printBarcode(barcode, 260, 2, 80);
	}

	protected String getCommand() {
		return s_prt + s_prt_buffer + "^XZ";
	}

	public void print(String str) throws PrintException {

		PrintService[] services = PrintServiceLookup.lookupPrintServices(null,
				null);
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

	protected void printBarcode(String barcode, int x, int y, int h) {
		s_prt_buffer += "^FO" + x + "," + y + "^BY1,3,45^BCN,,Y,N^FD" + barcode+"^FS";
	}

}