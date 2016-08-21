package com.certus.action;

import java.io.IOException;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.json.annotations.JSON;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import com.alibaba.fastjson.serializer.SerializerFeature;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("default")
public class BaseAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {

	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger(BaseAction.class);

	protected static final String DATE_FORMAT_DEFAULT = "yyyy-MM-dd";
	protected static final String DATE_FORMAT_WITH_SECONDS = "yyyy-MM-dd HH:mm:ss";
	protected HttpServletRequest request;
	protected HttpServletResponse response;

	protected int page;
	protected int rows;
	protected String sidx;
	protected String sord;
	protected String fileStoreName;

	public String getFileStoreName() {
		return fileStoreName;
	}

	public void setFileStoreName(String fileStoreName) {
		this.fileStoreName = fileStoreName;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	
	@JSON
	protected int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	@JSON
	protected int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	@JSON
	protected String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	@JSON
	protected String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

	protected void write(Object info) {
		write(info, DATE_FORMAT_DEFAULT);
	}

	protected void writePlain(String text) {
		response.setContentType("text/plain;chartset=UTF-8");
		try {
			response.getWriter().write(text);
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e);
		}

	}

	protected void write(Object info, String pattern) {
		response.setContentType("text/json;chartset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String json = "";

		try {
			/*
			 * if (info instanceof String) { json = info.toString(); } else {
			 */
			json = com.alibaba.fastjson.JSON.toJSONStringWithDateFormat(info, pattern, SerializerFeature.WriteMapNullValue);
			// }
			response.getWriter().write(json);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			throw new RuntimeException(e);
		}
	}

	@Action(value = "/index", results = { @Result(name = "index", type = "dispatcher", location = "/WEB-INF/index.jsp") })
	public String index() {
		return "index";
	}

	@Action(value = "/detail", results = { @Result(name = "detail", type = "dispatcher", location = "/WEB-INF/detail.jsp") })
	public String detail() {
		return "detail";
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object generateVo(Class clazz) throws JsonGenerationException, JsonMappingException, IOException {
		Map<String, String[]> parameterMap = request.getParameterMap();
		Map<String, Object> paraObjMaps = new HashMap<String, Object>();
		for (Entry<String, String[]> entry : parameterMap.entrySet()) {
			try {
				String name = entry.getKey();
				String[] names = name.split("\\.");
				Class clazzCurrent = clazz;
				Map<String, Object> map = paraObjMaps;
				for (int i = 0; i < names.length; i++) {
					String each = names[i];
					Field fieldCurrent = clazzCurrent.getDeclaredField(each);
					clazzCurrent = fieldCurrent.getType();
					if (i == names.length - 1) {
						if (List.class == fieldCurrent.getType()) {
							map.put(each, entry.getValue());
						} else {
							map.put(each, entry.getValue()[0]);
						}
					} else {
						if (!(map.containsKey(each))) {
							Map<String, Object> mapTemp = new HashMap<String, Object>();
							map.put(each, mapTemp);
						}
						map = (Map<String, Object>) map.get(each);
					}
				}
			} catch (SecurityException e) {
				logger.debug("", e);
			} catch (NoSuchFieldException e) {
				logger.debug("", e);
			}

		}
		ObjectMapper objectMapper = new ObjectMapper();
		String parameterStr = objectMapper.writeValueAsString(paraObjMaps);
		objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		return objectMapper.readValue(parameterStr, clazz);
	}
	
	/**
     * 
     * <p>把对象转换成json数据并写入到response对象<p>
     *
     * @param obj
     * @throws JsonGenerationException
     * @throws JsonMappingException
     * @throws IOException
     * @throws 
     * @since v1.0
     */
    @SuppressWarnings("deprecation")
    public void writeObject(Object obj) {
        try {
            ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
            ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
            ObjectMapper mapper = new ObjectMapper();
            mapper.getSerializationConfig().setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
            mapper.writeValue(ServletActionContext.getResponse().getWriter(), obj);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
    }

    /**
     * 
     * <p>把JSON字符串吸入到response对象中<p>
     *
     * @param json
     * @throws 
     * @since v1.0
     */
    public void writeJSONString(String json) {
        try {
            ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
            ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
//            logger.info(json);
            ServletActionContext.getResponse().getWriter().write(json);
            ServletActionContext.getResponse().getWriter().flush();
            ServletActionContext.getResponse().getWriter().close();
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
    }

    /**
     * 将对象转换成JSON字符串，并响应回前台
     * 
     * @param object
     * @throws IOException
     */
    public void writeJson(Object object) {
        try {
            String json = com.alibaba.fastjson.JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss", SerializerFeature.DisableCircularReferenceDetect);
            // String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss", SerializerFeature.PrettyFormat);
            ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
            ServletActionContext.getResponse().getWriter().write(json);
            logger.debug("---------------\r\n"+json+"\r\n---------------------------");
            ServletActionContext.getResponse().getWriter().flush();
            ServletActionContext.getResponse().getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
	public boolean checkPageAndRows(int page,int rows){
		if(page<=0 || rows <=0){
			logger.error("无效的分页和行数值:"+page+" "+rows);
			return false;
		}
		return true;
	}
}
