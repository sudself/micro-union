package com.certus.helper;

/**
 * 常量类
 * 
 * @author zhoudr
 * 
 */
public class Constants {

	/** 回收标志位:正常 */
	public static final short RECYCLE_SIGN_NORMAL = 0;
	/** 回收标志位:删除 */
	public static final short RECYCLE_SIGN_DELETE = 1;

	public static String SESSIONINFONAME = "sessionInfoName";

	public static int TOPOX = -100000;

	public static final String authToken = "token";
	public static final String USERID = "user_id";

	public static final String EXCEPTIONMSG = "系统服务异常";

	public class TopoSize {
		public static final int NSD_HEIGHT = 390;
		public static final int VNFD_HEIGHT = 220;
		public static final int VDU_HEIGHT = 128;
		public static final int VNFC_HEIGHT = 66;
	}

	/**
	 * 
	 * @version
	 * @ClassName: POWER_STATUS
	 * @Description: 电源状态
	 * @author lingsh
	 * @date 2015年2月6日 下午6:36:23
	 */
	public enum POWER_STATUS {
		OFF(2), // 关机
		ON(1); // 开机
		private final int number;

		POWER_STATUS(int number) {
			this.number = number;
		}

		public int number() {
			return number;
		}

		@Override
		public String toString() {
			return String.valueOf(number);
		}
	}

	/**
	 * 
	 * @version
	 * @ClassName: ALRM_LEVEL
	 * @Description: 告警等级
	 * @author lingsh
	 * @date 2015年2月7日 上午10:56:58
	 */
	public enum ALRM_LEVEL {
		WARNING(4), // 低
		MINOR(3), // 中
		MAJOR(2), // 高
		CRITICAL(1); // 严重
		private final int number;

		ALRM_LEVEL(int number) {
			this.number = number;
		}

		public int number() {
			return number;
		}

		@Override
		public String toString() {
			return String.valueOf(number);
		}
	}

	/**
	 * 
	 * @version
	 * @ClassName: RESULT_FLAG
	 * @Description: 请求结果
	 * @author lingsh
	 * @date 2015年2月7日 下午12:22:59
	 */
	public enum RESULT_FLAG {
		FAIL(2), // 失败
		SUCCESS(1); // 成功
		private final int number;

		RESULT_FLAG(int number) {
			this.number = number;
		}

		public int number() {
			return number;
		}

		@Override
		public String toString() {
			return String.valueOf(number);
		}
	}

	/**
	 * 
	 * @version
	 * @ClassName: ALRM_LEVEL
	 * @Description: 告警等级
	 * @author lingsh
	 * @date 2015年2月7日 上午10:56:58
	 */
	public enum ALRM_DESC {
		TOTAL("TOTAL"), // 全部
		WARNING("WARNING"), // 低
		MINOR("MINOR"), // 中
		MAJOR("MAJOR"), // 高
		CRITICAL("CRITICAL"); // 严重
		private final String number;

		ALRM_DESC(String number) {
			this.number = number;
		}

		@Override
		public String toString() {
			return String.valueOf(number);
		}
	}

	public class OverView {
		public static final String VMS = "vms"; //
		public static final String USED_VMS = "used_vms";

		public static final String CPUS = "cpus";
		public static final String USED_CPUS = "used_cpus";

		public static final String MEMS = "mems";
		public static final String USED_MEM = "used_mem";

		public static final String SECURITY_GROUP = "security_group";
		public static final String USED_SECURITY_GROUP = "used_security_group";
	}

	// 测试用的 API调用地址
	public static String SUPPLYER = "certusNet";

	public static String NSD_VERSION = "1.0";

	public enum EMS_CONFIGTYPE {
		IFCONFIG(6), VITUALLINK(5), REDISTRIBUTE(4), NETWORK(3), NODE(2), AREA(1);
		private final int number;

		EMS_CONFIGTYPE(int number) {
			this.number = number;
		}

		@Override
		public String toString() {
			return String.valueOf(number);
		}
	}
}
