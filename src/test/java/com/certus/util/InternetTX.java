package com.certus.util;

import java.io.Serializable;

public class InternetTX  implements Serializable,Comparable<InternetTX>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2731030602679125271L;

	public int clusterId;
	public String clusterName;
	public String groupName;
	public int vmId;
	public String vmName;
	public int InternetTX = 0;

	@Override
	public int hashCode(){
		return this.vmName.hashCode();
	}
	@Override
	public boolean equals(Object o){
		if(o == null || !(o instanceof InternetTX))
			return true;
		return this.hashCode() == ((InternetTX)o).hashCode();
	}
	
	@Override
	public int compareTo(InternetTX o) {
		// TODO Auto-generated method stub
		if(o == null || !(o instanceof InternetTX))
			return -1;
	
	return this.InternetTX-o.InternetTX >0 ? -1:1;//(this.InternetTX-o.InternetTX == 0 ? 0:1);
	}

}
