package com.solar.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.solar.po.Files;
import com.solar.service.FileService;

@SuppressWarnings("serial")
public class FileAction extends ActionSupport{

	private Files files;
	private File file;
	private String fileFileName;
	private String fileContentType;
	private String username;
	private String sharedState;
	private final static String UPLOADDIR = "/upload"; 
	private FileService fileService;
	private String fileName;
	private Integer id;
	private Integer page = 1;
	private Integer rows = 20;
	private String  idLots;
	
	//分页查询
	public String execute()
	{
		//获取当前用户信息
		/*HttpServletRequest request = (HttpServletRequest)ServletActionContext.getRequest();
		UserInfo user = (UserInfo)request.getSession().getAttribute("onUser");*/
		
		Integer totalNum = fileService.listAll(fileName,"","");
		Integer totalPage =  totalNum/rows+1;
		if(totalNum%rows==0)
		{
			totalPage =totalPage-1; 
		}
		if(page<1)
		{
			page=1;
		}
		else if(page>totalPage)
		{
			page=totalPage;
		}
		List<Map<String, Object>> list = fileService.list(page,rows,fileName,"","","");
		ActionContext.getContext().put("totalNum",totalNum);
		ActionContext.getContext().put("totalPage", totalPage);
		ActionContext.getContext().put("files",list);
		return "list";
	}
	
	//删除文件
	public String delete()
	{
		/*删除文件*/
		File file = new File(fileService.findFileURL(id));
		if(file.exists()&&file.isFile())
		{
			file.delete();
		}
		fileService.deleteFile(id);
		return "tolist";
	}
	
	//文件上传
	public String uploadFile() throws IOException
	{
		String dir = ServletActionContext.getServletContext().getRealPath(UPLOADDIR);
		File fileLocation = new File(dir);
		 if(!fileLocation.exists()){  
            boolean isCreated  = fileLocation.mkdir();  
            if(!isCreated) {  
                //目标上传目录创建失败,可做其他处理,一般应该不会出现这种情况。  
                return null;  
            }  
        }
		files =new Files();
		InputStream inputStream = new FileInputStream(file);
		Integer size = inputStream.available();
		File uploadFile = new File(dir,fileFileName);
        OutputStream out = new FileOutputStream(uploadFile);   
        byte[] buffer = new byte[1024 * 1024];   
        int length;   
        while ((length = inputStream.read(buffer)) > 0) {   
            out.write(buffer, 0, length);   
        }   
        inputStream.close();   
        out.close(); 
        String path ="file:///"+dir+"/"+fileFileName;
		files.setRsUrl(path);
		files.setFileName(fileFileName);
		files.setRealName("管理员");
		files.setFileSize((size/1024)+1);
		files.setDownTime(0);
		files.setCreateTime(new Timestamp(System.currentTimeMillis()));
		files.setCurrentUser("管理员");
		files.setSharedState("否");
		fileService.saveFile(files);
		return "tolist";
	}
		
	/*批量修改状态"是"*/
	public String batchUpdate(){
		String fileid[]=idLots.split(",");
		String id="";
		for (String string : fileid) {
			id=string.replace(" ", "");
			//fileService.batchUpdate(Integer.parseInt(id));
			
			files = fileService.findNameById1(Integer.parseInt(id));
			System.out.println(JSONArray.fromObject(files));
			files.setReleaseTime(new Timestamp(System.currentTimeMillis()));
			files.setReleasePerson("管理员");
			files.setSharedState("是");
			fileService.update(files);
		}
		 //在此处响应出数据
		HttpServletResponse response = ServletActionContext.getResponse();  
		response.setCharacterEncoding("UTF-8");
        PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}  
        writer.print("success");
        writer.flush();
		return null;
		
	}
	/*批量修改状态"否"*/
	public String batchUpdateTwo(){
		String fileid[]=idLots.split(",");
		String id="";
		for (String string : fileid) {
			id=string.replace(" ", "");
			//fileService.batchUpdateTwo(Integer.parseInt(id));
			
			files = fileService.findNameById1(Integer.parseInt(id));
			files.setReleaseTime(null);
			files.setReleasePerson("");
			files.setSharedState("否");
			fileService.update(files);
		}
		 //在此处响应出数据
		HttpServletResponse response = ServletActionContext.getResponse();  
		response.setCharacterEncoding("UTF-8");
        PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}  
        writer.print("success");
        writer.flush();
		return null;
		
	}
	public Files getFiles() {
		return files;
	}
	public void setFiles(Files files) {
		this.files = files;
	}
	public FileService getFileService() {
		return fileService;
	}
	@Autowired
	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

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

	public static String getUploaddir() {
		return UPLOADDIR;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getSharedState() {
		return sharedState;
	}

	public void setSharedState(String sharedState) {
		this.sharedState = sharedState;
	}

	public String getIdLots() {
		return idLots;
	}

	public void setIdLots(String idLots) {
		this.idLots = idLots;
	}

	
	
}
