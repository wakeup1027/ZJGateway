package com.solar.actions;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport {
	
	private final static String UPLOADDIR = "/upload";// 上传文件存放路径
	private File file;// 上传文件
	private String fileFileName;
	private Integer id;
	private String fileName;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}


	private String filepath;
	private Map<String,Object> map;

		/**
		 * 图片上传
		 * @return
		 */
		public String uploadFile(){
			System.out.println("进来");
			map=new HashMap<String, Object>();
			  try {
			 String fileSavePath = ServletActionContext.getServletContext().getRealPath("/upload");
		       System.out.println("保存的路径:"+fileSavePath);
		        File dirFile = new File(fileSavePath);
	
		        if (!dirFile.exists()) {
		        	dirFile.mkdir();
		        }
		        
		        InputStream is = new FileInputStream(file);
		        String rename=UUID.randomUUID().toString();
		        String fileExtension= fileFileName.substring(fileFileName.lastIndexOf(".") + 1);
		        rename=rename+"."+fileExtension;
		        OutputStream os = new FileOutputStream(new File(fileSavePath, fileFileName));
		        byte[] buffer = new byte[500];
		        int length = 0;
				while(-1 != (length = is.read(buffer, 0, buffer.length)))
					{
					    os.write(buffer);
					}

			map.put("success", true);
			map.put("msg", "/upload/"+rename);
			map.put("fileName",fileFileName);
			
		        os.close();
		        is.close();
			  } catch (Exception e) {
					e.printStackTrace();
					map.put("success", false);
					map.put("msg", e.getMessage());
				}
	 	
	 		return SUCCESS;
	 	}

		public File getFile() {
			return file;
		}

		public void setFile(File file) {
			this.file = file;
		}

		public String getFilepath() {
			return filepath;
		}

		public void setFilepath(String filepath) {
			this.filepath = filepath;
		}

		public static String getUploaddir() {
			return UPLOADDIR;
		}

		public Map<String,Object> getMap() {
			return map;
		}

		public void setMap(Map<String,Object> map) {
			this.map = map;
		}
	
}