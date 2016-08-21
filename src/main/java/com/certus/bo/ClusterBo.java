package com.certus.bo;

public class ClusterBo extends BaseBo {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1422952730956932432L;

	private Integer id;

	private Integer start;
	
	public String getClusterName() {
		return clusterName;
	}

	public void setClusterName(String clusterName) {
		this.clusterName = clusterName;
	}

	public Integer getEnvType() {
		return envType;
	}

	public void setEnvType(Integer envType) {
		this.envType = envType;
	}
	private String clusterName;
	
	private Integer envType;
	
	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	@Override
	public void setPage(int page) {
		super.setPage(page);
		this.start = (page-1)*this.getRows();
	}
	@Override
	public void setRows(int rows) {
		super.setRows(rows);
		this.start = (this.getPage()-1)*this.getRows();
	}
}
