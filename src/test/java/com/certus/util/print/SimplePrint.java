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

public class SimplePrint {
	byte[] dotfont;
	String s_prt = "^XA", s_prt_buffer = "";

	public static void main(String[] args) {

		try {
			SimplePrint a = new SimplePrint();
			a.setCommand();
			String str = a.getCommand();
			System.out.println(str);
			a.print(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public SimplePrint() throws Exception {
		File file = new File(this.getClass().getResource("").getPath()+"ts24.lib");
		FileInputStream fis = new FileInputStream(file);
		dotfont = new byte[fis.available()];
		fis.read(dotfont);
		fis.close();

	}

	protected void setCommand() {
		String barcode = "123456788765432112345678";
		// printCN("���ֲ���ABCD", 10, 30,30,34, 60);
		// printCN("�л����񹲺͹�", 10, 60,30,34, 60);
		// printChar(barcode,30,30,30,50);
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
//			String printerName = "HP Deskjet 2510 series";// something like this

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
		if (psZebra == null) {
			// do what you want
		}

		/*
		 * PrintService psZebra =
		 * PrintServiceLookup.lookupDefaultPrintService(); if (psZebra == null)
		 * { System.out.println("û�з��������ӡ��."); return; }
		 */
		DocPrintJob job = psZebra.createPrintJob();
		byte[] by = str.getBytes();
		DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
		Doc doc = new SimpleDoc(by, flavor, null);
		job.print(doc, null);
	}

	/**
	 * ��ӡ������
	 * 
	 * @param barcode
	 *            �ַ�
	 * @param xx
	 *            x���
	 * @param yy
	 *            y���
	 * @param height
	 *            �߶�
	 */
	protected void printBarcode(String barcode, int x, int y, int h) {
		System.out.println(barcode);
		// s_prt_buffer += "^BY3^FS^FO"+x+","+y+"^BCN,"+h+"^FD" + barcode +
		// "\n";
		s_prt_buffer += "^FO" + x + "," + y + "^BY1,3,45^BCN,,Y,N^FD" + barcode+"^FS";
		// s_prt_buffer += "^FO300, 10^ADN,36,20^FD123456^FS";
		// s_prt_buffer += "^PMN^FO400,50^CFG^FDMIRROR^FS^F0500,160^FDIMAGE^FS";
		// s_prt_buffer += "^FO380,40^A0,60,60^FDt^FS^FO410,40^A0,60,60^FDe^FS^FO440,40^A0,60,60^FDs^FS^FO470,40^A0,60,60^FDt^FS";
	}

	/**
	 * ��ӡӢ���ַ�����
	 * 
	 * @param str
	 * @param x
	 * @param y
	 */
	protected void printChar(String str, int x, int y, int h, int w) {
		System.out.println(str);
		s_prt_buffer += "^FO" + x + "," + y + "^A0," + h + "," + w + "^FD"
				+ str + "^FS";
	}

	protected void printCharR(String str, int x, int y, int h, int w) {
		System.out.println(str);
		s_prt_buffer += "^FO" + x + "," + y + "^A0R," + h + "," + w + "^FD"
				+ str + "^FS";
	}

	/**
	 * ��ӡ�����ַ�
	 * 
	 * @param strCN
	 * @param x
	 * @param y
	 */
	protected void printCN(String strCN, int x, int y, int h, int w, int b) {
		System.out.println(strCN);
		byte[] ch = str2bytes(strCN);
		for (int off = 0; off < ch.length;) {
			if (((int) ch[off] & 0x00ff) >= 0xA0) {
				int qcode = ch[off] & 0xff;
				int wcode = ch[off + 1] & 0xff;
				s_prt_buffer = s_prt_buffer
						+ String.format("^FO%d,%d^XG0000%01X%01X,%d,%d^FS\n",
								x, y, qcode, wcode, b, b);
				s_prt += String.format("~DG0000%02X%02X,00072,003,\n", qcode,
						wcode);
				qcode = (qcode + 128 - 32) & 0x00ff;
				wcode = (wcode + 128 - 32) & 0x00ff;
				int offset = ((int) qcode - 16) * 94 * 72 + ((int) wcode - 1)
						* 72;
				for (int j = 0; j < 72; j += 3) {
					qcode = (int) dotfont[j + offset] & 0x00ff;
					wcode = (int) dotfont[j + offset + 1] & 0x00ff;
					int qcode1 = (int) dotfont[j + offset + 2] & 0x00ff;
					s_prt += String.format("%02X%02X%02X\n", qcode, wcode,
							qcode1);
				}
				x = x + 25 * b;
				off = off + 2;
			} else if (((int) ch[off] & 0x00FF) < 0xA0) {
				;
				printChar(String.format("%c", ch[off]), x, y, h, w);
				// s_prt_buffer +=
				// String.format("^FO"+x+","+y+"^A0,"+h+","+w+"^FD%c^FS\n",ch[off]);
				// s_prt_buffer +=
				// "^FO"+x+","+y+"^A0,"+h+",20^FD"+ch[off]+"^FS\n";
				x = x + 15;
				off++;
			}
		}
	}

	byte[] str2bytes(String s) {
		if (null == s || "".equals(s)) {
			return null;
		}
		byte[] abytes = null;
		try {
			abytes = s.getBytes("gb2312");
		} catch (UnsupportedEncodingException ex) {
		}
		return abytes;
	}
}