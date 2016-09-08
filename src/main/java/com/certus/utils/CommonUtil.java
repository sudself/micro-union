package com.certus.utils;

import java.util.List;
import java.util.Random;

public class CommonUtil {
	/**
	 * 
	 * <p>
	 * 设置分页相关数据到model对象
	 * <p>
	 * 
	 * @param page
	 *            页数
	 * @param rows
	 *            每页展示行数
	 * @param count
	 *            总行数
	 * @param model
	 *            数据模型对象
	 * @throws
	 * @since v1.0
	 */
	public static void setPageModel(int page, int rows, int count,
			PaginationModel model) {
		if (rows == 0 || count == 0 || page == 0) {
			return;
		}
		int totalPage = count % rows;
		model.setPage(page);
		model.setTotal(totalPage == 0 ? count / rows : count / rows + 1);
		model.setRecords(count);
	}

	public static PaginationModel buildPageModel(int page, int rows, int count,
			List<?> datas) {
		PaginationModel model = new PaginationModel();
		model.setRows(datas.toArray());
		setPageModel(page, rows, count, model);
		return model;
	}

	public static String setVirtualName() {
		int length = 8;
		String base = "abcdefghijklmnopqrstuvwxyz0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		sb.append("vm_");
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}


	public static void main(String args[]) {
		for (int i = 0; i < 10; i++) {
			System.out.println(setVirtualName());
		}
	}
}
