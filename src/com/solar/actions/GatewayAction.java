package com.solar.actions;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;


import com.opensymphony.xwork2.ActionContext;
import com.solar.po.Files;
import com.solar.po.Gateway;
import com.solar.po.InformationInput;
import com.solar.po.Mailbox;
import com.solar.service.FileService;
import com.solar.service.GatewayServier;
import com.solar.service.InformationInputService;
import com.solar.service.MailboxService;
import com.solar.service.PictureService;
import com.sun.org.apache.bcel.internal.generic.RETURN;


public class GatewayAction {
	private GatewayServier gatewayServier;
	private InformationInputService informationInputService;
	private PictureService pictureService;
	private InformationInput informationInput;
	private FileService fileService;
	private MailboxService mailboxService;
	private String classification;
	//关键字（站内检索）
	private String keyName;
	
	//产业类型
	private String industryType;
	//项目名称
	private String entryName;
	//联系人
	private String contacts;
	//邮箱
	private String mailbox;
	//联系电话
	private String contactPhone;
	//手机
	private String mobilePhone;
	
	//标题
	private String title;
	//模块
	private String modular;
	private String modular1;
	//内容
	private String content;
	//图片内容
	private String picture;
	//文字摘要
	private String fieldSummary;
	
	//页
	private Integer page = 1;
	//行
	private Integer rows = 20;
	//行
	private Integer rows1 = 10;
	
	private Integer id;
	
	//字符串
	private String characterString;
	
	private String [] idLots;
	
	//文件名称
	private String fileName;
	//项目查询分类
	private String modularString ;
	
	//局长信箱信息字段
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 电子邮箱
	 */
	private String electronicMail;
	/**
	 * 联系电话
	 */
	private String contactPhone1;
	/**
	 * 联系地址
	 */
	private String contactAddress;
	/**
	 * 主题
	 */
	private String title1;
	/**
	 * 内容
	 */
	private String contents;
	/**
	 * 创建时间
	 */
	private Timestamp creationTime;
	
	
	public GatewayServier getGatewayServier() {
		return gatewayServier;
	}

	public void setGatewayServier(GatewayServier gatewayServier) {
		this.gatewayServier = gatewayServier;
	}

	
	public InformationInputService getInformationInputService() {
		return informationInputService;
	}

	public void setInformationInputService(
			InformationInputService informationInputService) {
		this.informationInputService = informationInputService;
	}
	
	

	public FileService getFileService() {
		return fileService;
	}

	public void setFileService(FileService fileService) {
		this.fileService = fileService;
	}
	
	

	public MailboxService getMailboxService() {
		return mailboxService;
	}

	public void setMailboxService(MailboxService mailboxService) {
		this.mailboxService = mailboxService;
	}

	public InformationInput getInformationInput() {
		return informationInput;
	}

	public void setInformationInput(InformationInput informationInput) {
		this.informationInput = informationInput;
	}

	
	//门户分页查询
	public String pagingQuery()
	{
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
			if(modular1!=null){
				try {
					String	modular2 = new String(modular1.getBytes("ISO-8859-1"),"utf-8");
					modular = modular2;
					System.out.println("模块2："+modular);
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				}
			}
			System.out.println(modular);
			Integer totalNum = informationInputService.listPagingQuery(modular, "已发布", "001");
			System.out.println(totalNum+"aaaaa");
			Integer totalPage =  totalNum/rows1+1;
			
			System.out.println(totalPage+"bbbb");
			if(totalNum%rows1==0)
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
			List<Map<String, Object>> list = informationInputService.list2(page,rows1,modular, "已发布", "001");
			ActionContext.getContext().put("totalNum",totalNum);
			ActionContext.getContext().put("totalPage", totalPage);
			ActionContext.getContext().put("informationInput",list);
			System.out.println(JSONArray.fromObject(list));
			return "moreQuery";
	}
	
	//首页-最新消息
	public String latestInformation(){
		modular = "首页-最新消息";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-企业动态
	public String workDynamics(){
		modular = "首页-企业动态";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-通知公告
	public String notificationAnnouncement(){
		modular = "首页-通知公告";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-最新资讯
	public String investmentInformation(){
		modular = "首页-最新资讯";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-投资汕尾
	public String investInShanwei(){
		modular = "首页-投资汕尾";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-投资引导-重点园区
	public String keyPark(){
		modular = "首页-投资引导-重点园区";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-投资引导-重点企业
	public String homeKeyIndustry(){
		modular = "首页-投资引导-重点企业";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-投资引导-投资政策
	public String policy(){
		modular = "首页-投资引导-投资政策";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-投资引导-投资服务
	public String investmentService(){
		modular = "首页-投资引导-投资服务";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-投资引导-招商项目
	public String investmentProjects(){
		modular = "首页-投资引导-招商项目";
		pagingQuery();
		return "moreQuery";
	}
	//首页-投资引导-其他
	public String otherHome(){
		modular = "首页-投资引导-其他";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-重点项目介绍
	public String keyProjectIntroduction(){
		modular = "首页-重点项目介绍";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-重点载体介绍
	public String focusVectorIntroduction(){
		modular = "首页-重点载体介绍";
		pagingQuery();
		return "moreQuery";
	}
	
	//首页-重点企业介绍
	public String keyIndustryIntroduction(){
		modular = "首页-重点企业介绍";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资环境-湛江开发区概况
	public String generalSituationOfShanwei(){
		modular = "投资环境-湛江开发区概况";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资环境-投资优势
	public String investmentAdvantage(){
		modular = "投资环境-投资优势";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资环境-投资成本
	public String investmentCosts(){
		modular = "投资环境-投资成本";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资环境-投资政策
	public String investmentPolicy(){
		modular = "投资环境-投资政策";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资环境-载体介绍
	public String parkCarrier(){
		modular = "投资环境-载体介绍";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资环境-载体介绍
	public String economicDevelopmentData(){
		modular = "投资环境-经济发展";
		pagingQuery();
		return "moreQuery";
	}
	
	//信息公开-通知公告
	public String notificationAnnouncement1(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		//modular = "信息公开-通知公告";
		//pagingQuery();
		Integer totalNum = informationInputService.listPagingQuery1("已发布", "001");
		System.out.println(totalNum+"aaaaa");
		Integer totalPage =  totalNum/rows1+1;
		
		System.out.println(totalPage+"bbbb");
		if(totalNum%rows1==0)
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
		List<Map<String, Object>> list = informationInputService.list3(page,rows1, "已发布", "001");
		ActionContext.getContext().put("totalNum",totalNum);
		ActionContext.getContext().put("totalPage", totalPage);
		ActionContext.getContext().put("informationInput",list);
		System.out.println(JSONArray.fromObject(list));
		return "notificationAnnouncement";
	}
	
	//信息公开-开发区规划
	public String shanweiPlanning(){
		modular = "信息公开-开发区规划";
		pagingQuery();
		return "moreQuery";
	}
	
	//信息公开-统计数据
	public String statisticalData(){
		modular = "信息公开-统计数据";
		pagingQuery();
		return "moreQuery";
	}
	
	//信息公开-重点招商项目
	public String keyProject(){
		modular = "信息公开-重点招商项目";
		pagingQuery();
		return "moreQuery";
	}
	
	//产业布局-重点企业
	public String keyIndustry(){
		modular = "产业布局-重点企业";
		pagingQuery();
		return "moreQuery";
	}
	
	//产业布局-重大落户项目
	public String majorSettledProject(){
		modular = "产业布局-重大落户项目";
		pagingQuery();
		return "moreQuery";
	}
	
	//产业布局-各县区产业-市城区
	public String shantouCity(){
		modular = "产业布局-各县区产业-市城区";
		pagingQuery();
		return "moreQuery";
	}
	
	//产业布局-各县区产业-陆丰市
	public String lufengCity(){
		modular = "产业布局-各县区产业-陆丰市";
		pagingQuery();
		return "moreQuery";
	}
	
	//产业布局-各县区产业-海丰县
	public String haifengCounty(){
		modular = "产业布局-各县区产业-海丰县";
		pagingQuery();
		return "moreQuery";
	}
	
	//产业布局-各县区产业-陆河县
	public String luheCounty(){
		modular = "产业布局-各县区产业-陆河县";
		pagingQuery();
		return "moreQuery";
	}
	
	//产业布局-各县区产业-红海湾
	public String redBay(){
		modular = "产业布局-各县区产业-红海湾";
		pagingQuery();
		return "moreQuery";
	}
	
	//产业布局-各县区产业-华侨
	public String overseasChinese(){
		modular = "产业布局-各县区产业-华侨";
		pagingQuery();
		return "moreQuery";
	}
	
	
	//投资政策-扶持政策
	public String foreignInvestment(){
		modular = "投资政策-扶持政策";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资政策-政策解读
	public String foreignTrade(){
		modular = "投资政策-政策解读";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资政策-本地规章
	public String externalCooperation(){
		modular = "投资政策-本地规章";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资政策-优惠政策
	public String gestionDesports(){
		modular = "投资政策-优惠政策";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资政策-政策宣讲
	public String comprehensive(){
		modular = "投资政策-政策宣讲";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资政策-其他
	public String other(){
		modular = "投资政策-其他";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资服务-投资目录
	public String investmentCatalog(){
		modular = "投资服务-投资目录";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资服务-投资流程
	public String investmentProcess(){
		modular = "投资服务-投资流程";
		pagingQuery();
		return "moreQuery";
	}
	
	//投资服务-职能部门联系
	public String functionalDepartments(){
		modular = "投资服务-职能部门联系";
		pagingQuery();
		return "moreQuery";
	}
	
	//招商项目
	public String investmentProjects1(){
		modular = "招商项目";
		pagingQuery();
		return "moreQuery";
	}
	

	//局长信箱
	public String mailbox(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		return "mailbox";
	}
	
	//局长信箱(信息新增)
	public String addMailbox(){
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer=null;
		Mailbox mailbox = new Mailbox();
		try {
			response.setCharacterEncoding("UTF-8");
			writer = response.getWriter();
			mailbox.setName(name);
			mailbox.setElectronicMail(electronicMail);
			mailbox.setContactPhone(contactPhone1);		
			mailbox.setContactAddress(contactAddress);		
			mailbox.setTitle(title1);
			mailbox.setContents(contents);
			mailbox.setCreationTime(new Timestamp(System.currentTimeMillis()));
			mailboxService.addMailbox(mailbox);
			writer.print("true");
			} catch (Exception e) {
				e.printStackTrace();
			}
			writer.flush(); 
		return null;
	}
	
	//投诉建议
	public String complaint(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		return "complaint";
	}
	
	//意见征集
	public String opinionCollection(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		return "opinionCollection";
	}
	
	//隐私保护
	public String privacyProtection(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		return "privacyProtection";
	}
	
	//免责声明
	public String disclaimerOfLiability(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		return "disclaimerOfLiability";
	}
	
	//网站地图
	public String siteMap(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		return "siteMap";
	}
	
	//资料下载
	public String dataDownload(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		//获取当前用户信息
		/*HttpServletRequest request = (HttpServletRequest)ServletActionContext.getRequest();
		UserInfo user = (UserInfo)request.getSession().getAttribute("onUser");*/
		
		Integer totalNum = fileService.listAll1();
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
		List<Map<String, Object>> list = fileService.list1(page,rows);
		ActionContext.getContext().put("totalNum",totalNum);
		ActionContext.getContext().put("totalPage", totalPage);
		ActionContext.getContext().put("files",list);
		return "dataDownload";
	}
	
	//主页
	public String execute(){
		List<Map<String, Object>> latestInformation = informationInputService.query("首页-最新消息", "已发布", "001");
		List<Map<String, Object>> workDynamics = informationInputService.query("首页-企业动态", "已发布", "001");
		List<Map<String, Object>> notificationAnnouncement = informationInputService.query("首页-通知公告", "已发布", "001");
		List<Map<String, Object>> investmentInformation = informationInputService.query("首页-最新资讯", "已发布", "001");
		List<Map<String, Object>> investInShanwei = informationInputService.query("首页-投资汕尾", "已发布", "001");
		List<Map<String, Object>> smallPicturePolling = informationInputService.query("首页-信息栏", "已发布", "001");
		List<Map<String, Object>> keyPark = informationInputService.query("首页-投资引导-重点园区", "已发布", "001");
		List<Map<String, Object>> homeKeyIndustry = informationInputService.query("首页-投资引导-重点企业", "已发布", "001");
		List<Map<String, Object>> policy = informationInputService.query("首页-投资引导-投资政策", "已发布", "001");
		List<Map<String, Object>> investmentService = informationInputService.query("首页-投资引导-投资服务", "已发布", "001");
		List<Map<String, Object>> investmentProjects = informationInputService.query("首页-投资引导-招商项目", "已发布", "001");
		List<Map<String, Object>> otherHome = informationInputService.query("首页-投资引导-其他", "已发布", "001");
		List<Map<String, Object>> keyProjectIntroduction = informationInputService.query("首页-重点项目介绍", "已发布", "001");
		List<Map<String, Object>> focusVectorIntroduction = informationInputService.query("首页-重点载体介绍", "已发布", "001");
		List<Map<String, Object>> keyIndustryIntroduction = informationInputService.query("首页-重点企业介绍", "已发布", "001");
		
		List<Map<String, Object>> parkCarrier = informationInputService.query("投资环境-载体介绍", "已发布", "001");
		List<Map<String, Object>> keyIndustry = informationInputService.query("产业布局-重点企业", "已发布", "001");
		List<Map<String, Object>> foreignInvestment = informationInputService.query("投资环境-投资政策", "已发布", "001");
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		List<Map<String, Object>> investmentProcess = informationInputService.query("投资政策-投资流程", "已发布", "001");
		
		List<Map<String, Object>> industrialPark = informationInputService.query("信息公开-重点招商项目", "已发布", "001");
		//首页-最新消息
		ActionContext.getContext().put("latestInformation", latestInformation);
		//首页-企业动态
		ActionContext.getContext().put("workDynamics", workDynamics);
		//首页-通知公告
		ActionContext.getContext().put("notificationAnnouncement", notificationAnnouncement);
		//首页-最新资讯
		ActionContext.getContext().put("investmentInformation", investmentInformation);
		//首页-投资汕尾
		ActionContext.getContext().put("investInShanwei", investInShanwei);
		
		//首页-五张小图片轮询
		ActionContext.getContext().put("smallPicturePolling", smallPicturePolling);
		
		//首页-投资引导-重点园区
		ActionContext.getContext().put("keyPark", keyPark);
		//首页-投资引导-重点企业
		ActionContext.getContext().put("homeKeyIndustry", homeKeyIndustry);
		//首页-投资引导-投资政策
		ActionContext.getContext().put("policy", policy);
		//首页-投资引导-投资服务
		ActionContext.getContext().put("investmentService", investmentService);
		//首页-投资引导-招商项目
		ActionContext.getContext().put("investmentProjects", investmentProjects);
		//首页-投资引导-其他
		ActionContext.getContext().put("otherHome", otherHome);
		
		//首页-重点项目介绍
		ActionContext.getContext().put("keyProjectIntroduction", keyProjectIntroduction);
		//首页-重点载体介绍
		ActionContext.getContext().put("focusVectorIntroduction", focusVectorIntroduction);
		//首页-重点企业介绍
		ActionContext.getContext().put("keyIndustryIntroduction", keyIndustryIntroduction);
		
		//首页-重点园区
		ActionContext.getContext().put("parkCarrier", parkCarrier);
		//首页-重点企业
		ActionContext.getContext().put("keyIndustry", keyIndustry);
		//首页-投资政策
		ActionContext.getContext().put("foreignInvestment", foreignInvestment);
		//首页-投资引导-招商项目
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		//首页-投资引导-投资服务
		ActionContext.getContext().put("investmentProcess", investmentProcess);
		
		//首页-投资引导-招商项目(最新)
		ActionContext.getContext().put("industrialPark", industrialPark);
		
		//首页-开发区风采
		List<Map<String, Object>> picture = pictureService.listData();
		ActionContext.getContext().put("picture", picture);
		return "index";
	}
	
	//招商项目
	public String communication(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> investmentProjects = informationInputService.query("招商项目", "已发布", "001");
		//首页-投资引导-招商项目
		ActionContext.getContext().put("investmentProjects", investmentProjects);
		return "communication";
	}
	
	//产业布局
	public String distribution(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> keyIndustry = informationInputService.query("产业布局-重点企业", "已发布", "001");
		List<Map<String, Object>> majorSettledProject = informationInputService.query("产业布局-重大落户项目", "已发布", "001");
		List<Map<String, Object>> shantouCity = informationInputService.query("产业布局-各县区产业-市城区", "已发布", "001");
		List<Map<String, Object>> lufengCity = informationInputService.query("产业布局-各县区产业-陆丰市", "已发布", "001");
		List<Map<String, Object>> haifengCounty = informationInputService.query("产业布局-各县区产业-海丰县", "已发布", "001");
		List<Map<String, Object>> luheCounty = informationInputService.query("产业布局-各县区产业-陆河县", "已发布", "001");
		List<Map<String, Object>> redBay = informationInputService.query("产业布局-各县区产业-红海湾", "已发布", "001");
		List<Map<String, Object>> overseasChinese = informationInputService.query("产业布局-各县区产业-华侨", "已发布", "001");
		//产业布局-重点企业
		ActionContext.getContext().put("keyIndustry", keyIndustry);
		//产业布局-重大落户项目
		ActionContext.getContext().put("majorSettledProject", majorSettledProject);
		//产业布局-各县区产业-市城区
		ActionContext.getContext().put("shantouCity", shantouCity);
		//产业布局-各县区产业-陆丰市
		ActionContext.getContext().put("lufengCity", lufengCity);
		//产业布局-各县区产业-海丰县
		ActionContext.getContext().put("haifengCounty", haifengCounty);
		//产业布局-各县区产业-陆河县
		ActionContext.getContext().put("luheCounty", luheCounty);
		//产业布局-各县区产业-红海湾
		ActionContext.getContext().put("redBay", redBay);
		//产业布局-各县区产业-华侨
		ActionContext.getContext().put("overseasChinese", overseasChinese);
		return "distribution";
	}
	
	//投资环境
	public String environment(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> generalSituationOfShanwei = informationInputService.query("投资环境-湛江开发区概况", "已发布", "001");
		List<Map<String, Object>> investmentAdvantage = informationInputService.query("投资环境-投资优势", "已发布", "001");
		List<Map<String, Object>> investmentCosts = informationInputService.query("投资环境-投资成本", "已发布", "001");
		List<Map<String, Object>> investmentPolicy = informationInputService.query("投资环境-投资政策", "已发布", "001");
		List<Map<String, Object>> parkCarrier = informationInputService.query("投资环境-载体介绍", "已发布", "001");
		//投资环境-湛江开发区概况
		ActionContext.getContext().put("generalSituationOfShanwei", generalSituationOfShanwei);
		//投资环境-投资优势
		ActionContext.getContext().put("investmentAdvantage", investmentAdvantage);
		//投资环境-投资成本
		ActionContext.getContext().put("investmentCosts", investmentCosts);
		//投资环境-投资政策
		ActionContext.getContext().put("investmentPolicy", investmentPolicy);
		//投资环境-载体介绍
		ActionContext.getContext().put("parkCarrier", parkCarrier);
		return "environment";
	}
	
	//首页点击重点载体介绍跳转到载体介绍
	public String seeParkCarrier(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> generalSituationOfShanwei = informationInputService.query("投资环境-湛江开发区概况", "已发布", "001");
		List<Map<String, Object>> investmentAdvantage = informationInputService.query("投资环境-投资优势", "已发布", "001");
		List<Map<String, Object>> investmentCosts = informationInputService.query("投资环境-投资成本", "已发布", "001");
		List<Map<String, Object>> investmentPolicy = informationInputService.query("投资环境-投资政策", "已发布", "001");
		List<Map<String, Object>> parkCarrier = informationInputService.query("投资环境-载体介绍", "已发布", "001");
		//投资环境-湛江开发区概况
		ActionContext.getContext().put("generalSituationOfShanwei", generalSituationOfShanwei);
		//投资环境-投资优势
		ActionContext.getContext().put("investmentAdvantage", investmentAdvantage);
		//投资环境-投资成本
		ActionContext.getContext().put("investmentCosts", investmentCosts);
		//投资环境-投资政策
		ActionContext.getContext().put("investmentPolicy", investmentPolicy);
		//投资环境-载体介绍
		ActionContext.getContext().put("parkCarrier", parkCarrier);
		return "parkCarrier";
	}
	
	//信息公开
	public String informationDisclosure(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> notificationAnnouncement = informationInputService.query1("已发布", "001");
		List<Map<String, Object>> shanweiPlanning = informationInputService.query("信息公开-开发区规划", "已发布", "001");
		List<Map<String, Object>> keyProject = informationInputService.query("信息公开-重点招商项目", "已发布", "001");
		List<Map<String, Object>> statisticalData = informationInputService.query("信息公开-统计数据", "已发布", "001");
		//信息公开-通知公告
		ActionContext.getContext().put("notificationAnnouncement", notificationAnnouncement);
		//信息公开-开发区规划
		ActionContext.getContext().put("shanweiPlanning", shanweiPlanning);
		//信息公开-统计数据
		ActionContext.getContext().put("statisticalData", statisticalData);
		//信息公开-重点招商项目
		ActionContext.getContext().put("keyProject", keyProject);
		return "informationDisclosure";
	}
	
	
	//投资政策
	public String services(){
		List<Map<String, Object>> foreignInvestment = informationInputService.query("投资政策-扶持政策", "已发布", "001");
		List<Map<String, Object>> foreignTrade = informationInputService.query("投资政策-政策解读", "已发布", "001");
		List<Map<String, Object>> externalCooperation = informationInputService.query("投资政策-本地规章", "已发布", "001");
		List<Map<String, Object>> gestionDesports = informationInputService.query("投资政策-优惠政策", "已发布", "001");
		List<Map<String, Object>> comprehensive = informationInputService.query("投资政策-政策宣讲", "已发布", "001");
		List<Map<String, Object>> other = informationInputService.query("投资政策-其他", "已发布", "001");
		List<Map<String, Object>> files = fileService.queryFile();
		List<Map<String, Object>> investmentCatalog = informationInputService.query("投资政策-投资目录", "已发布", "001");
		List<Map<String, Object>> functionalDepartments = informationInputService.query("投资政策-职能部门联系", "已发布", "001");
		List<Map<String, Object>> investmentProcess = informationInputService.query("投资政策-投资流程", "已发布", "001");
		//投资政策-扶持政策
		ActionContext.getContext().put("foreignInvestment", foreignInvestment);
		//投资政策-政策解读
		ActionContext.getContext().put("foreignTrade", foreignTrade);
		//投资政策-本地规章
		ActionContext.getContext().put("externalCooperation", externalCooperation);
		//投资政策-优惠政策
		ActionContext.getContext().put("gestionDesports", gestionDesports);
		//投资政策-政策宣讲
		ActionContext.getContext().put("comprehensive", comprehensive);
		//投资政策-其他
		ActionContext.getContext().put("other", other);
		//投资政策-资料下载
		ActionContext.getContext().put("files", files);
		//投资政策-投资目录
		ActionContext.getContext().put("investmentCatalog", investmentCatalog);
		//投资政策-职能部门联系
		ActionContext.getContext().put("functionalDepartments", functionalDepartments);
		//投资政策-投资流程
		ActionContext.getContext().put("investmentProcess", investmentProcess);
		return "services";
	}
	
	//联系我们
	public String touchuUs(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		return "touchuUs";
	}
	
	//查询更多
	public String moreQuery(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		return "moreQuery";
	}
	
	//详细信息页面
	public String detailPage(){
		InformationInput informationInput = informationInputService.queryInformationInput(id);
		ActionContext.getContext().put("informationInput", informationInput);
		
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		return "detailPage";
	}
	
	//首页-我要投资新增方法
	public String add(){
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer=null;
		Gateway gateway = new Gateway();
		try {
			response.setCharacterEncoding("UTF-8");
			writer = response.getWriter();
			gateway.setIndustryType(industryType);
			gateway.setEntryName(entryName);
			gateway.setContacts(contacts);
			gateway.setMailbox(mailbox);
			gateway.setContactPhone(contactPhone);
			gateway.setMobilePhone(mobilePhone);
			gateway.setCreateTime(new Timestamp(System.currentTimeMillis()));
			gatewayServier.add(gateway);
			writer.print("true");
			} catch (Exception e) {
				e.printStackTrace();
			}
			writer.flush(); 
		return null;
	}
	//新建标题与内容文档
	public String demo(){
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer=null;
		InformationInput informationInput = new InformationInput();
		try {
			response.setCharacterEncoding("UTF-8");
			writer = response.getWriter();
			System.out.println("截取前："+characterString);
				
				informationInput.setTitle(title);
				informationInput.setContent(characterString);
				informationInput.setModular(modular);
				informationInput.setReleaseStatus("未发布");
				informationInput.setDustbin("001");//001存在002被遗弃
				informationInput.setCreationTime(new Timestamp(System.currentTimeMillis()));
				System.out.println("fieldSummary:"+fieldSummary);
				informationInput.setFieldSummary(fieldSummary);//文章摘要
				informationInputService.addInformation(informationInput);
				writer.print("true");
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			writer.flush(); 
		return null;
	}
	
	//新建标题与内容文档(附带图片)
	public String demo2(){
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer=null;
		InformationInput informationInput = new InformationInput();
		try {
			response.setCharacterEncoding("UTF-8");
			writer = response.getWriter();
			System.out.println("截取前："+characterString);
			System.out.println("图片信息："+picture);
				
				informationInput.setTitle(title);
				informationInput.setContent(characterString);
				informationInput.setModular(modular);
				/*informationInput.setPicture(picture+"\\"+fileName);*/
				informationInput.setPicture("./upload/"+fileName);
				informationInput.setFieldSummary(fieldSummary);
				informationInput.setReleaseStatus("未发布");
				informationInput.setDustbin("001");//001存在002被遗弃
				informationInput.setCreationTime(new Timestamp(System.currentTimeMillis()));
				informationInputService.addInformation(informationInput);
				writer.print("true");
			} catch (Exception e) {
				e.printStackTrace();
			}
			writer.flush(); 
		return null;
	}
	
	//Java截取字符串方法
	public static void main(String[] args) {
		//String str="</h1><p>内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容<img /></p>";
		//截取h1标签
		//System.out.println(str.substring(str.indexOf("<h")+4, str.indexOf("</h")+3).replaceAll("<h", "").replaceAll("</h", ""));
		//System.out.println(str.substring(str.indexOf("<p")+3, str.indexOf("</p")+3));
		//除了h1标签以外，其它获取
		//System.out.println(str.substring(str.indexOf("</h1>"), str.length()).replaceAll("</h1>", ""));
		//System.out.println(str.substring(str.indexOf("</h1>"), str.length()));
		//System.out.println(str.substring(0, 3));
		//System.out.println(str.replaceAll("overflow-x: hidden", ""));
		
		String  qqString="{result=0, EntryList=[{FTaxPrice=1.7, CFColorNoid=0, CFBoxingID=0, FTotalReceiveQty=0, FMaterialNumber=5.01.002, FDiscountRate=0, FRowTypeName=原料采购, CFBrand=0, CFTechnologyID=0, FTotalPrePayAmt=0, FDeliveryAddress=云商总经办_刘云, FMaterialClass=5.01, FStorageOrgUnitID=三水生产, CFSquareQty=0, FTotalSupplyStockQty=0, FPieceTaxPrice=0, FRowTypeID=010, FQty=33, CFBoxQty=0, FIsPresent=false, FUnitID=个, FAssistPropertyID=无 , CFBatchNum=0, FPrepayment=0, FTotalReqPayAmt=0, CFSquareMetersQty=0, FTax=8.15, FDiscountAmount=0, FRemark=0, FCloseqty=0, FReceiveOverRate=0, FTotalInvoicedQty=0, FLocalTax=8.15, FAlterassistProperty=0, CFDefect=0, FDestinationType=10, FMaterialID=ELP8DkbhRxCVxnmc/OCgzkQJ5/A=0, FDeliverAdvanceDay=0, FRequestOrgUnitID=三水生产, totalReceivesmQty=0, FMaterialName=白板擦, FBaseStatus=1, CFManufacturerID=0, FLocalAmount=47.95, FTotalExpense=0, FTotalReceiptQty=0, FSupplierMaterialName=0, FLocalTaxAmount=56.1, CFGradeID=0, FAmount=47.95, FTotalInvoicedAmt=0, FSaleOrderNumber=0, FPrice=1.452991, FAdminOrgUnitID=0, CFPackingQtyID=0, FTotalInvoicedAmount=0, FReceiveOwingRate=0, FUnPrereceivedAm=0, FPreReceived=0, FDeliveryDate=2016-10-27, FIsQuantityUnCtrl=false, FPlanReceiveQty=0, FActualTaxPrice=1.7, FTaxRate=17, FWareHouseID=B厂物料仓, FTotalPaidAmount=0, CFSpecif=0, FNoNumMaterialModel=无规格, FDeliverDeferralDay=0, totalReceiveboxQty=0, FTaxAmount=56.1, totalReturnedBoxQty=0, totalReturnedsmQty=0, FProductpropertyID=0, FSupplierMaterialNumber=0, FTotalReturnedQty=0, CFLastTaxPrice=1.7, CFNoscheduling=0, CFProductsize=0, FIsTimeUnCtrl=true, FTotalCancelledStockQty=0}, {FTaxPrice=1.5, CFColorNoid=0, CFBoxingID=0, FTotalReceiveQty=0, FMaterialNumber=5.01.003, FDiscountRate=0, FRowTypeName=原料采购, CFBrand=0, CFTechnologyID=0, FTotalPrePayAmt=0, FDeliveryAddress=云商总经办_刘云, FMaterialClass=5.01, FStorageOrgUnitID=三水生产, CFSquareQty=0, FTotalSupplyStockQty=0, FPieceTaxPrice=0, FRowTypeID=010, FQty=33, CFBoxQty=0, FIsPresent=false, FUnitID=盒, FAssistPropertyID=无 , CFBatchNum=0, FPrepayment=0, FTotalReqPayAmt=0, CFSquareMetersQty=0, FTax=7.19, FDiscountAmount=0, FRemark=0, FCloseqty=0, FReceiveOverRate=0, FTotalInvoicedQty=0, FLocalTax=7.19, FAlterassistProperty=0, CFDefect=0, FDestinationType=10, FMaterialID=81X5yaIVQsGz+JHAyM85CUQJ5/A=0, FDeliverAdvanceDay=0, FRequestOrgUnitID=三水生产, totalReceivesmQty=0, FMaterialName=白色粉笔, FBaseStatus=1, CFManufacturerID=0, FLocalAmount=42.31, FTotalExpense=0, FTotalReceiptQty=0, FSupplierMaterialName=0, FLocalTaxAmount=49.5, CFGradeID=0, FAmount=42.31, FTotalInvoicedAmt=0, FSaleOrderNumber=0, FPrice=1.282051, FAdminOrgUnitID=0, CFPackingQtyID=0, FTotalInvoicedAmount=0, FReceiveOwingRate=0, FUnPrereceivedAm=0, FPreReceived=0, FDeliveryDate=2016-10-27, FIsQuantityUnCtrl=false, FPlanReceiveQty=0, FActualTaxPrice=1.5, FTaxRate=17, FWareHouseID=B厂物料仓, FTotalPaidAmount=0, CFSpecif=0, FNoNumMaterialModel=无规格, FDeliverDeferralDay=0, totalReceiveboxQty=0, FTaxAmount=49.5, totalReturnedBoxQty=0, totalReturnedsmQty=0, FProductpropertyID=0, FSupplierMaterialNumber=0, FTotalReturnedQty=0, CFLastTaxPrice=1.5, CFNoscheduling=0, CFProductsize=0, FIsTimeUnCtrl=true, FTotalCancelledStockQty=0}], BillData={FSupplierID=广东金盛彩印有限公司, FBizTypeID=普通采购, FPurchaseOrgUnitID=三水生产, FPrepaymentRate=0, FAdminOrgUnitID=0, FPrepayment=0, FPurchasePersonID=0, FIsQuicken=false, FCurrencyID=人民币, FIsPriceInTax=true, FSourceBillTypeID=采购申请单, FBizDate=2016-11-08, FPaymentTypeID=赊购, FPaidAmount=0, FExchangeRate=1, FPurchaseGroupID=0, FIsApprovedMaterial=false, FPrepaid=0, CFPurReason=0, FSettlementTypeID=现金, FIsInTax=true, FPrepaymentDate=0, FCompanyOrgUnitID=0, FDescription=0, FCashDiscountID=0, FSupplierConfirm=false, FNumber=PO2016010922, FSaleOrgUnitID=0, FInvoicedAmount=0, CFIswfover=false, FBaseStatus=1, CFIsproduct=false, FSupplierOrderNumber=0}}";
		JSONObject.fromObject("{FTaxPrice=1.7, CFColorNoid=, CFBoxingID=, FTotalReceiveQty=0, FMaterialNumber=5.01.002, FDiscountRate=0, FRowTypeName=原料采购, CFBrand=, CFTechnologyID=, FTotalPrePayAmt=0, FDeliveryAddress=云商总经办_刘云, FMaterialClass=5.01, FStorageOrgUnitID=三水生产, CFSquareQty=0, FTotalSupplyStockQty=0, FPieceTaxPrice=, FRowTypeID=010, FQty=33, CFBoxQty=0, FIsPresent=false, FUnitID=个, FAssistPropertyID=无 , CFBatchNum=, FPrepayment=0, FTotalReqPayAmt=0, CFSquareMetersQty=0, FTax=8.15, FDiscountAmount=0, FRemark=, FCloseqty=, FReceiveOverRate=0, FTotalInvoicedQty=0, FLocalTax=8.15, FAlterassistProperty=, CFDefect=, FDestinationType=10, FMaterialID=ELP8DkbhRxCVxnmc/OCgzkQJ5/A=, FDeliverAdvanceDay=0, FRequestOrgUnitID=三水生产, totalReceivesmQty=, FMaterialName=白板擦, FBaseStatus=1, CFManufacturerID=, FLocalAmount=47.95, FTotalExpense=0, FTotalReceiptQty=0, FSupplierMaterialName=, FLocalTaxAmount=56.1, CFGradeID=, FAmount=47.95, FTotalInvoicedAmt=0, FSaleOrderNumber=, FPrice=1.452991, FAdminOrgUnitID=, CFPackingQtyID=, FTotalInvoicedAmount=0, FReceiveOwingRate=0, FUnPrereceivedAm=0, FPreReceived=0, FDeliveryDate=2016-10-27, FIsQuantityUnCtrl=false, FPlanReceiveQty=, FActualTaxPrice=1.7, FTaxRate=17, FWareHouseID=B厂物料仓, FTotalPaidAmount=0, CFSpecif=, FNoNumMaterialModel=无规格, FDeliverDeferralDay=0, totalReceiveboxQty=, FTaxAmount=56.1, totalReturnedBoxQty=, totalReturnedsmQty=, FProductpropertyID=, FSupplierMaterialNumber=, FTotalReturnedQty=0, CFLastTaxPrice=1.7, CFNoscheduling=, CFProductsize=, FIsTimeUnCtrl=true, FTotalCancelledStockQty=0}");
		
		
	}
	//新增跳转
	public String addJump(){
		return "addInformation";
	}
	
	//信息录入保存方法
	public String addInformation(){
		informationInput.setReleaseStatus("未发布");
		informationInput.setDustbin("001");//001存在002被遗弃
		informationInput.setCreationTime(new Timestamp(System.currentTimeMillis()));
		informationInputService.addInformation(informationInput);
		return "tolist";
	}
	
	//更新跳转
	public String updateJump(){
		InformationInput informationInput = informationInputService.queryInformationInput(id);
		ActionContext.getContext().put("informationInput", informationInput);
		return "updateInformation";
	}
	
	//信息更新方法
	public String updateInformation(){
		/*InformationInput informationInput1 = informationInputService.queryInformationInput(id);
		informationInput1.setTitle(informationInput.getTitle());
		informationInput1.setContent(informationInput.getContent());
		informationInput1.setModular(informationInput.getModular());
		informationInputService.updateInformation(informationInput1);*/
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer=null;
		InformationInput informationInput1 = informationInputService.queryInformationInput(id);
		try {
			response.setCharacterEncoding("UTF-8");
			writer = response.getWriter();
			informationInput1.setTitle(title);
			informationInput1.setContent(content);
			informationInput1.setModular(modular);
			informationInputService.updateInformation(informationInput1);
			} catch (Exception e) {
				e.printStackTrace();
			}
			writer.flush(); 
		return null;
	}
	
	//信息发布
	public String release(){
		InformationInput informationInput1 = informationInputService.queryInformationInput(id);
		informationInput1.setReleaseStatus("已发布");
		informationInput1.setPublisher("管理员");
		informationInput1.setReleaseTime(new Timestamp(System.currentTimeMillis()));
		informationInputService.updateInformation(informationInput1);
		return "tolist";
	}
	
	//信息一键发布
	public String oneButtonPublishing(){
		for(int i=0;i<idLots.length;i++){
			InformationInput informationInput1 = informationInputService.queryInformationInput(Integer.parseInt(idLots[i]));
			informationInput1.setReleaseStatus("已发布");
			informationInput1.setPublisher("管理员");
			informationInput1.setReleaseTime(new Timestamp(System.currentTimeMillis()));
			informationInputService.updateInformation(informationInput1);
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
	
	//撤销发布信息
	public String revoke(){
		InformationInput informationInput1 = informationInputService.queryInformationInput(id);
		informationInput1.setReleaseStatus("未发布");
		informationInput1.setPublisher("");
		informationInput1.setReleaseTime(null);
		informationInputService.updateInformation(informationInput1);
		return "tolist";
	}
	
	//一键撤销
	public String oneKeyRevocation(){
		for(int i=0;i<idLots.length;i++){
			InformationInput informationInput1 = informationInputService.queryInformationInput(Integer.parseInt(idLots[i]));
			informationInput1.setReleaseStatus("未发布");
			informationInput1.setPublisher("");
			informationInput1.setReleaseTime(null);
			informationInputService.updateInformation(informationInput1);
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
	
	//删除
	public String delete() {
		InformationInput informationInput1 = informationInputService.queryInformationInput(id);
		informationInput1.setDustbin("002");//001存在     002被遗弃
		informationInputService.updateInformation(informationInput1);
		return "tolist";
	}
	
	//批量删除
	public String deleteLots(){
		for(int i=0;i<idLots.length;i++){
			InformationInput informationInput1 = informationInputService.queryInformationInput(Integer.parseInt(idLots[i]));
			informationInput1.setDustbin("002");//001存在     002被遗弃
			informationInputService.updateInformation(informationInput1);
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
	
	//从垃圾箱测地删除
	public String removeCompletely(){
		informationInputService.delete(id);
		return "tolist1";
	}
	
	//垃圾箱批量删除
	public String batchRemoval(){
		informationInputService.batchRemoval(idLots);
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
	
	//在垃圾箱激活一条信息
	public String activation(){
		InformationInput informationInput1 = informationInputService.queryInformationInput(id);
		informationInput1.setDustbin("001");//001存在     002被遗弃
		informationInputService.updateInformation(informationInput1);
		return "tolist1";
	}
	//查看
	public String query() {
		InformationInput informationInput = informationInputService.queryInformationInput(id);
		ActionContext.getContext().put("informationInput", informationInput);
		return "queryInformation";
	}
	
	
	//信息查看和发布信息页面
	public String seeInformation(){
		Integer totalNum = informationInputService.listAll(title, modular);
		Integer totalPage = totalNum/rows+1;
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
		List<Map<String, Object>> list = informationInputService.list(page, rows, title, modular);
		ActionContext.getContext().put("totalNum", totalNum);
		ActionContext.getContext().put("totalPage",totalPage);
		ActionContext.getContext().put("informationInput", list);
		return "seeInformation";
	}
	
	//垃圾箱
	public String dustbin(){
		Integer totalNum = informationInputService.listAlll(title, modular);
		Integer totalPage = totalNum/rows+1;
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
		List<Map<String, Object>> list = informationInputService.list1(page, rows, title, modular);
		ActionContext.getContext().put("totalNum", totalNum);
		ActionContext.getContext().put("totalPage",totalPage);
		ActionContext.getContext().put("informationInput", list);
		return "dustbinInformation";
	}
	
	//投资项目（首页-我要投资）
	public String homeInvestmentProjects(){
		Integer totalNum = gatewayServier.listAll();
		Integer totalPage = totalNum/rows+1;
		if(totalPage%rows==0)
		{
			totalPage = totalPage-1;
		}
		if(page<1)
		{
			page=1;
		}
		else if(page>totalPage)
		{
			page=totalPage;
		}
		List<Map<String, Object>> list = gatewayServier.list(page, rows);
		ActionContext.getContext().put("totalNum", totalNum);
		ActionContext.getContext().put("totalPage",totalPage);
		ActionContext.getContext().put("gateway", list);
		
		return "homeInvestmentProjects";
	}
	
	public String deleteLots1(){
		gatewayServier.deleteLots(idLots);
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
	
	//第二版修改
	//投资环境-湛江开发区概况
	public String survey(){
		/*List<Map<String, Object>> generalSituationOfShanwei = informationInputService.query("投资环境-湛江开发区概况", "已发布", "001");
		ActionContext.getContext().put("generalSituationOfShanwei", generalSituationOfShanwei);*/
		InformationInput generalSituationOfShanwei = informationInputService.queryInformationInput(498);
		ActionContext.getContext().put("generalSituationOfShanwei", generalSituationOfShanwei);
		return "survey";
	}
	
	//投资环境-投资优势
	public String advantage(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> investmentAdvantage = informationInputService.query("投资环境-投资优势", "已发布", "001");
		ActionContext.getContext().put("investmentAdvantage", investmentAdvantage);
		return "advantage";
	}
	
	//投资环境-投资成本
	public String cost(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> investmentCosts = informationInputService.query("投资环境-投资成本", "已发布", "001");
		ActionContext.getContext().put("investmentCosts", investmentCosts);
		return "cost";
	}
	
	//投资环境-经济发展
	public String economicDevelopment(){
		List<Map<String, Object>> economicDevelopment = informationInputService.query("投资环境-经济发展", "已发布", "001");
		ActionContext.getContext().put("economicDevelopment", economicDevelopment);
		return "economicDevelopment";
	}
	
	//投资环境-投资政策
	public String shanweiPolicy(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> investmentPolicy = informationInputService.query("投资环境-投资政策", "已发布", "001");
		ActionContext.getContext().put("investmentPolicy", investmentPolicy);
		return "shanweiPolicy";
	}
	
	//投资环境-载体介绍
	public String carrier(){
		List<Map<String, Object>> parkCarrier = informationInputService.query("投资环境-载体介绍", "已发布", "001");
		ActionContext.getContext().put("parkCarrier", parkCarrier);
		return "carrier";
	}
	
	//投资环境-汕尾市宣传片
	public String trailer(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		return "trailer";
	}
	
	//信息公开-通知公告
	public String information(){
		List<Map<String, Object>> notificationAnnouncement = informationInputService.query1("已发布", "001");
		ActionContext.getContext().put("notificationAnnouncement", notificationAnnouncement);
		return "information";
	}
	
	//信息公开-统计数据
	public String dataStatistical(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> statisticalData = informationInputService.query("信息公开-统计数据", "已发布", "001");
		ActionContext.getContext().put("statisticalData", statisticalData);
		return "dataStatistical";
	}
	
	//信息公开-开发区规划
	public String plan(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> shanweiPlanning = informationInputService.query("信息公开-开发区规划", "已发布", "001");
		ActionContext.getContext().put("shanweiPlanning", shanweiPlanning);
		return "plan";
	}
	
	//信息公开-重点招商项目
	public String keyInvestment(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> keyProject = informationInputService.query("信息公开-重点招商项目", "已发布", "001");
		ActionContext.getContext().put("keyProject", keyProject);
		return "keyInvestment";
	}
	
	//信息公开-投资指南
	public String investmentGuide(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		//投资目录
		InformationInput investmentCatalog = informationInputService.queryInformationInput(419);
		ActionContext.getContext().put("investmentCatalog", investmentCatalog);
		//投资流程
		InformationInput investmentProcess = informationInputService.queryInformationInput(433);
		ActionContext.getContext().put("investmentProcess", investmentProcess);
		//职能部门联系
		InformationInput functionalDepartments = informationInputService.queryInformationInput(422);
		ActionContext.getContext().put("functionalDepartments", functionalDepartments);
		return "investmentGuide";
	}
	
	
	//产业布局-各县区产业
	public String theCountyIndustrialZone(){
		/*//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> shantouCity = informationInputService.query("产业布局-各县区产业-市城区", "已发布", "001");
		List<Map<String, Object>> lufengCity = informationInputService.query("产业布局-各县区产业-陆丰市", "已发布", "001");
		List<Map<String, Object>> haifengCounty = informationInputService.query("产业布局-各县区产业-海丰县", "已发布", "001");
		List<Map<String, Object>> luheCounty = informationInputService.query("产业布局-各县区产业-陆河县", "已发布", "001");
		List<Map<String, Object>> redBay = informationInputService.query("产业布局-各县区产业-红海湾", "已发布", "001");
		List<Map<String, Object>> overseasChinese = informationInputService.query("产业布局-各县区产业-华侨", "已发布", "001");
		//产业布局-各县区产业-市城区
		ActionContext.getContext().put("shantouCity", shantouCity);
		//产业布局-各县区产业-陆丰市
		ActionContext.getContext().put("lufengCity", lufengCity);
		//产业布局-各县区产业-海丰县
		ActionContext.getContext().put("haifengCounty", haifengCounty);
		//产业布局-各县区产业-陆河县
		ActionContext.getContext().put("luheCounty", luheCounty);
		//产业布局-各县区产业-红海湾
		ActionContext.getContext().put("redBay", redBay);
		//产业布局-各县区产业-华侨
		ActionContext.getContext().put("overseasChinese", overseasChinese);
		return "theCountyIndustrialZone";*/
		
		return "theCountyIndustrialZone";
	}
	
	//产业布局-重点企业
	public String keyindustry(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> keyIndustry = informationInputService.query("产业布局-重点企业", "已发布", "001");
		ActionContext.getContext().put("keyIndustry", keyIndustry);
		return "keyindustry";	
	}
	
	//产业布局-重点落户项目
	public String settledProject(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		List<Map<String, Object>> majorSettledProject = informationInputService.query("产业布局-重大落户项目", "已发布", "001");
		ActionContext.getContext().put("majorSettledProject", majorSettledProject);
		return "settledProject";
	}
	
	
	//投资政策-扶持政策
	public String supportPolicy(){
		List<Map<String, Object>> foreignInvestment = informationInputService.query("投资政策-扶持政策", "已发布", "001");
		ActionContext.getContext().put("foreignInvestment", foreignInvestment);
		return "supportPolicy";
	}

	
	//投资政策-政策解读
	public String policyInterpretation(){
		List<Map<String, Object>> foreignTrade = informationInputService.query("投资政策-政策解读", "已发布", "001");
		ActionContext.getContext().put("foreignTrade", foreignTrade);
		return "policyInterpretation";
	}
	
	
	//投资服务-投资流程
	public String investmentProcessData(){
		List<Map<String, Object>> investmentProcessData = informationInputService.query("投资服务-投资流程", "已发布", "001");
		ActionContext.getContext().put("investmentProcessData", investmentProcessData);
		return "investmentProcessData";
	}
	
	//投资服务-投资目录
	public String investmentCatalogData(){
		List<Map<String, Object>> investmentCatalogData = informationInputService.query("投资服务-投资目录", "已发布", "001");
		ActionContext.getContext().put("investmentCatalogData", investmentCatalogData);
		return "investmentCatalogData";
	}
	
	//投资服务-职能部门联系
	public String functionalDepartmentsData(){
		InformationInput functionalDepartmentsData = informationInputService.queryInformationInput(518);
		ActionContext.getContext().put("functionalDepartmentsData", functionalDepartmentsData);
		return "functionalDepartmentsData";
	}
	
	//投资服务-资料下载
	public String fileDownload(){
		List<Map<String, Object>> files = fileService.queryFile();
		ActionContext.getContext().put("files", files);
		return "fileDownload";
	}
	
	
	//招商项目-工业园区及基础设施
	//招商项目-农业
	//招商项目-电子信息
	//招商项目-工业制造
	//招商项目-旅游服务业
	//招商项目-服务外包
	//招商项目-其他
	public String investmentProjectsList(){
		InformationInput informationInput = informationInputService.queryInformationInput(id);
		ActionContext.getContext().put("informationInput", informationInput);
		
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		return "investmentProjectsList";
	}
	
	
	//招商项目（签约项目）
	public String contractProject(){//
		List<Map<String, Object>> industrialPark = informationInputService.query("工业园区及基础设施", "已发布", "001");
		List<Map<String, Object>> agriculture = informationInputService.query("农业", "已发布", "001");
		List<Map<String, Object>> electronics = informationInputService.query("电子信息", "已发布", "001");
		List<Map<String, Object>> industry = informationInputService.query("工业制造", "已发布", "001");
		List<Map<String, Object>> tourism = informationInputService.query("旅游服务业", "已发布", "001");
		List<Map<String, Object>> serviceOutsourcing = informationInputService.query("服务外包", "已发布", "001");
		List<Map<String, Object>> other = informationInputService.query("其他", "已发布", "001");
		if("1".equals(classification)){
			ActionContext.getContext().put("industrialPark", industrialPark);
			System.out.println(industrialPark.get(0).get("picture"));
			return "contractProject";
		}else if ("2".equals(classification)) {
			ActionContext.getContext().put("agriculture", agriculture);
			return "agriculture";
		}else if ("3".equals(classification)) {
			ActionContext.getContext().put("electronics", electronics);
			return "electronics";
		}else if ("4".equals(classification)) {
			ActionContext.getContext().put("industry", industry);
			return "industry";
		}else if ("5".equals(classification)) {
			ActionContext.getContext().put("tourism", tourism);
			return "tourism";
		}else if ("6".equals(classification)) {
			ActionContext.getContext().put("serviceOutsourcing", serviceOutsourcing);
			return "serviceOutsourcing";
		}else if ("7".equals(classification)) {
			ActionContext.getContext().put("other", other);
			return "other";
		}
		return "contractProject";
	}
	
	
	//项目阅读
	public String projectReading(){
		InformationInput informationInput = informationInputService.queryInformationInput(id);
		ActionContext.getContext().put("informationInput", informationInput);
		
		
		
		//修改点击率
		if(informationInput.getClickRate()==null){
			informationInput.setClickRate(1);
		}else {
			informationInput.setClickRate(informationInput.getClickRate()+1);
		}
		informationInputService.updateInformation(informationInput);
		
		
		
		ActionContext.getContext().put("classification", classification);
		ActionContext.getContext().put("ids", id);
		
		if("1".equals(classification)){
			modularString = "工业园区及基础设施";
		}else if("2".equals(classification)){
			modularString = "农业";
		}else if("3".equals(classification)){
			modularString = "电子信息";
		}else if("4".equals(classification)){
			modularString = "工业制造";
		}else if("5".equals(classification)){
			modularString = "旅游服务业";
		}else if("6".equals(classification)){
			modularString = "服务外包";
		}else if("7".equals(classification)){
			modularString = "其他";
		}
		List<InformationInput> lastOne = informationInputService.lastOne(id,modularString);
		if(lastOne.size()==0){
			ActionContext.getContext().put("lastOneId", "javascript:void(0);");
			ActionContext.getContext().put("lastOneTitle", "没有啦！");
		}else{
			ActionContext.getContext().put("lastOneId", "gateway_projectReading.action?id="+lastOne.get(0).getId()+"&classification="+classification);
			ActionContext.getContext().put("lastOneTitle", lastOne.get(0).getTitle());
			System.out.println("上一页:"+lastOne.get(0).getTitle());
		}
		List<InformationInput> nextArticle = informationInputService.nextArticle(id,modularString);		
		if(nextArticle.size()==0){
			ActionContext.getContext().put("nextArticleId", "javascript:void(0);");
			ActionContext.getContext().put("nextArticleTitle", "没有啦！");
		}else {
			ActionContext.getContext().put("nextArticleId", "gateway_projectReading.action?id="+nextArticle.get(0).getId()+"&classification="+classification);
			ActionContext.getContext().put("nextArticleTitle", nextArticle.get(0).getTitle());
			System.out.println("下一页:"+nextArticle.get(0).getTitle());
		}
		
		return "projectReading";
	}
	//更多项目
	public String moreProjects(){
		if("1".equals(classification)){
			modular = "工业园区及基础设施";
			classification = "1";
			moreProjectsQuery();
			return "moreProjects";
		}else if ("2".equals(classification)) {
			modular = "农业";
			classification = "2";
			moreProjectsQuery();
			return "moreProjects";
		}else if ("3".equals(classification)) {
			modular = "电子信息";
			classification = "3";
			moreProjectsQuery();
			return "moreProjects";
		}else if ("4".equals(classification)) {
			modular = "工业制造";
			classification = "4";
			moreProjectsQuery();
			return "moreProjects";
		}else if ("5".equals(classification)) {
			modular = "旅游服务业";
			classification = "5";
			moreProjectsQuery();
			return "moreProjects";
		}else if ("6".equals(classification)) {
			modular = "服务外包";
			classification = "6";
			moreProjectsQuery();
			return "moreProjects";
		}else if ("7".equals(classification)) {
			modular = "其他";
			classification = "7";
			moreProjectsQuery();
			return "moreProjects";
		}
		return "moreProjects";
	}
	
	//门户分页查询
	public String moreProjectsQuery()
	{
		if(modular1!=null){
			try {
				String	modular2 = new String(modular1.getBytes("ISO-8859-1"),"utf-8");
				modular = modular2;
				System.out.println("模块2："+modular);
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			}
		}
		System.out.println(modular);
		Integer totalNum = informationInputService.listPagingQuery(modular, "已发布", "001");
		System.out.println(totalNum+"aaaaa");
		Integer totalPage =  totalNum/rows1+1;
		
		System.out.println(totalPage+"bbbb");
		if(totalNum%rows1==0)
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
		List<Map<String, Object>> list = informationInputService.list2(page,rows1,modular, "已发布", "001");
		ActionContext.getContext().put("totalNum",totalNum);
		ActionContext.getContext().put("totalPage", totalPage);
		ActionContext.getContext().put("informationInput",list);
		ActionContext.getContext().put("modular", modular);
		ActionContext.getContext().put("classification", classification);
		if(list.size()==0){
			ActionContext.getContext().put("noData", "暂无数据");
		}else {
			ActionContext.getContext().put("noData", "");
		}
		return "moreProjects";
	}
	
	
	//首页-点击查询方法(弹框)
	public String clickQuery(){
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter writer=null;
		
		try {
			response.setCharacterEncoding("UTF-8");
			writer = response.getWriter();
			
			InformationInput informationInput = informationInputService.queryInformationInput(id);
			ActionContext.getContext().put("informationInput", informationInput);
			
			//修改点击率
			if(informationInput.getClickRate()==null){
				informationInput.setClickRate(1);
			}else {
				informationInput.setClickRate(informationInput.getClickRate()+1);
			}
			informationInputService.updateInformation(informationInput);
			
			System.out.println("getModular:"+informationInput.getModular());
			if("首页-信息栏".equals(informationInput.getModular())){
				modularString = "首页-信息栏";
			}else if("首页-最新资讯".equals(informationInput.getModular())){
				modularString = "首页-最新资讯";
			}else if("首页-企业动态".equals(informationInput.getModular())){
				modularString = "首页-企业动态";
			}else if("首页-通知公告".equals(informationInput.getModular())){
				modularString = "首页-通知公告";
			}
			List<InformationInput> lastOne = informationInputService.lastOne(id,modularString);
			
			List<Map<String, Object>> lists = new ArrayList<Map<String,Object>>();
			Map<String, Object> map = new HashMap<String, Object>();
			if(lastOne.size()==0){
				map.put("lastOneId", "null");
				map.put("lastOneTitle", "没有啦！");
			}else{
				map.put("lastOneId", lastOne.get(0).getId());
				map.put("lastOneTitle", lastOne.get(0).getTitle());
				
				System.out.println("上一页:"+lastOne.get(0).getTitle());
			}
			List<InformationInput> nextArticle = informationInputService.nextArticle(id,modularString);		
			if(nextArticle.size()==0){
				map.put("nextArticleId", "null");
				map.put("nextArticleTitle", "没有啦！");
			}else {
				map.put("nextArticleId", nextArticle.get(0).getId());
				map.put("nextArticleTitle", nextArticle.get(0).getTitle());
				System.out.println("下一页:"+nextArticle.get(0).getTitle());
			}
			 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			 String dateString = formatter.format(informationInput.getReleaseTime());
			map.put("releaseTime", dateString);
			map.put("content", informationInput.getContent());
			map.put("title", informationInput.getTitle());
			map.put("clickRate", informationInput.getClickRate());
			map.put("picture", informationInput.getPicture());
			lists.add(map);
			System.out.println("时间:"+dateString);
			writer.print(JSONArray.fromObject(lists));
			} catch (Exception e) {
				e.printStackTrace();
			}
			writer.flush(); 
		return null;
	}
		
	//联系我们-机构职能
	public String mechanismFunction(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		return "mechanismFunction";
	}
	
	//联系我们-联系我们
	public String contactUs(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		return "contactUs";
	}
	
	//站内检索
	public String siteSearch(){
		//遍历招商项目-二级菜单
		List<Map<String, Object>> investmentProjects1 = informationInputService.query("招商项目", "已发布", "001");
		ActionContext.getContext().put("investmentProjects1", investmentProjects1);
		
		if("".equals(keyName)){
			List<Map<String, Object>> siteSearchList = informationInputService.siteSearchList("111111111111111111111");
			ActionContext.getContext().put("siteSearchList", siteSearchList);
			ActionContext.getContext().put("size", "0");
		}else {
			List<Map<String, Object>> siteSearchList = informationInputService.siteSearchList(keyName);
			System.out.println("siteSearchList:"+siteSearchList);
			ActionContext.getContext().put("siteSearchList", siteSearchList);
			ActionContext.getContext().put("size", siteSearchList.size());
		}
		
		
		ActionContext.getContext().put("keyName", keyName);
		
		return "siteSearch";
	}
	
	public String index1(){
		return "index1";
	}
	public String getIndustryType() {
		return industryType;
	}

	public void setIndustryType(String industryType) {
		this.industryType = industryType;
	}

	public String getEntryName() {
		return entryName;
	}

	public void setEntryName(String entryName) {
		this.entryName = entryName;
	}

	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}

	public String getMailbox() {
		return mailbox;
	}

	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getModular() {
		return modular;
	}

	public void setModular(String modular) {
		this.modular = modular;
	}

	public String getCharacterString() {
		return characterString;
	}

	public void setCharacterString(String characterString) {
		this.characterString = characterString;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String[] getIdLots() {
		return idLots;
	}

	public void setIdLots(String[] idLots) {
		this.idLots = idLots;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Integer getRows1() {
		return rows1;
	}

	public void setRows1(Integer rows1) {
		this.rows1 = rows1;
	}

	public String getModular1() {
		return modular1;
	}

	public void setModular1(String modular1) {
		this.modular1 = modular1;
	}

	public String getFieldSummary() {
		return fieldSummary;
	}

	public void setFieldSummary(String fieldSummary) {
		this.fieldSummary = fieldSummary;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getElectronicMail() {
		return electronicMail;
	}

	public void setElectronicMail(String electronicMail) {
		this.electronicMail = electronicMail;
	}

	public String getContactPhone1() {
		return contactPhone1;
	}

	public void setContactPhone1(String contactPhone1) {
		this.contactPhone1 = contactPhone1;
	}

	public String getContactAddress() {
		return contactAddress;
	}

	public void setContactAddress(String contactAddress) {
		this.contactAddress = contactAddress;
	}

	public String getTitle1() {
		return title1;
	}

	public void setTitle1(String title1) {
		this.title1 = title1;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Timestamp creationTime) {
		this.creationTime = creationTime;
	}

	public String getKeyName() {
		return keyName;
	}

	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public String getModularString() {
		return modularString;
	}

	public void setModularString(String modularString) {
		this.modularString = modularString;
	}

	public PictureService getPictureService() {
		return pictureService;
	}

	public void setPictureService(PictureService pictureService) {
		this.pictureService = pictureService;
	}

	

	
}
