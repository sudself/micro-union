package com.certus.helper;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * 获取配置信息
 * @author zhoudr
 *
 */
public class ConfigUtil {
	private static final Logger logger = Logger.getLogger(ConfigUtil.class);
	public static Properties properties = new Properties();

	public static void load(String configFile) {
		try {
			properties.load(ConfigUtil.class.getResourceAsStream(configFile));
		} catch (FileNotFoundException e) {
			logger.error(e);
		} catch (IOException e) {
			logger.error(e);
		}
	}

	public static String getString(String key) {
		String result = String.valueOf(properties.get(key));
		if (Util.isNull(result)) {
			return "";
		}
		return result;
	}

}
