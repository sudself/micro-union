package com.certus.util;

import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

public class Test {

	public static void test1(){
		HashSet<InternetTX> set = new HashSet<InternetTX>();
		InternetTX itx1 = new InternetTX();
		itx1.vmName="certus";
		InternetTX itx2 = new InternetTX();
		itx2.vmName="vm_1ken2cmh";		
		set.add(itx2);
		set.add(itx1);
		System.out.println(set.size());	
	}
	public static void test2(){
		Set<InternetTX> set = new TreeSet<InternetTX>();
		InternetTX itx1 = new InternetTX();
		itx1.vmName="certus";
		itx1.InternetTX=0;
		
		InternetTX itx2 = new InternetTX();
		itx2.vmName="vm_1ken2cmh";		
		itx2.InternetTX=0;
		set.add(itx1);
		set.add(itx2);
		System.out.println(set.size());	
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		test2();
	}

}
