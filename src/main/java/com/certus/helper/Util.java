package com.certus.helper;

/**
 * 工具类
 * 
 * @author zhoudr
 * 
 */
public class Util {

	/**
	 * 对象是否为Null
	 * 
	 * @param string
	 * @return
	 */
	public static boolean isNull(Object object) {
		return object == null ? true : false;
	}

	/**
	 * 字符串是否为空串
	 * @param string
	 * @return
	 */
	public static boolean isEmpty(String string) {
		if (!isNull(string)) {
			return string.trim().equals("") ? true : false;
		}
		return false;
	}

	/**
	 * 字符串是Null或者Empty
	 * @param string
	 * @return
	 */
	public static boolean isNullOrEmpty(String string) {
		return isNull(string) ? true : (isEmpty(string) ? true : false);
	}

	/**
	 * @Title 函数名称： getStartRowNo
	 * @Description 功能描述： 根据分页信息获取前台表格的第一个序列
	 * @param 参
	 *            数：
	 * @return 返 回 值： int
	 * @throws
	 */
	public static int getStartRowNo(int page, int rows) {
		int startRowNo = 0;
		startRowNo = (page - 1) * rows + 1;
		return startRowNo;
	}
}
