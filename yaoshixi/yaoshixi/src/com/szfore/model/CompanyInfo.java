package com.szfore.model;

import java.util.Date;

/**
 * 企业信息
 * @author WangLinkai
 * email:wanglk@szfore.com
 * Nov 28, 2013
 */
public class CompanyInfo {

	public static final Integer STATUS_CERTIFIED = 1;
	public static final Integer STATUS_UN_CERTIFY = 0;
	
	private int id;
	//企业用户id
	private Integer userId;
	//公司名称
	private String companyName;
	//公司简称
	private String companyShortName;
	//企业所在城市
	private String city;
	//企业的logo
	private String companyLogo;
	//企业邮箱
	private String email;
	//企业主要的业务领域
	private String filedes;
	//企业主要的业务专业
	private String major;
	//企业的地址
	private String addr;
	//企业的人数规模
	private String scale;
	//企业的公司网站主页
	private String homePage;
	//公司介绍
	private String companyDesc;
	//发展阶段
	private String growthStage;
	//公司性质
	private String nature;
	//联系电话
	private String phone;
	//备注
	private String mark;
	//创始团队
	private String founder;
	
	private Integer famous;//公司知名度
	
	private Integer certifyStatus;//认证状态：0 尚未认证；1 已认证
	
	private Date createDate;//添加时间
	
	private String cdkey;//公司激活码
	
	private String cdkeyStatus;//激活码状态
	
	private String businessLicense;//营业执照
	
	private String organizationCode;//组织机构代码证
	
	private String authentication;//认证状态：0 尚未认证；1 已认证
	
	private String companySlogan;//公司口号
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCompanyLogo() {
		return companyLogo;
	}
	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFiledes() {
		return filedes;
	}
	public void setFiledes(String filedes) {
		this.filedes = filedes;
	}
	public String getScale() {
		return scale;
	}
	public void setScale(String scale) {
		this.scale = scale;
	}
	public String getHomePage() {
		return homePage;
	}
	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}
	public String getMark() {
		return mark;
	}
	public void setMark(String mark) {
		this.mark = mark;
	}
	
	public String getCompanyShortName() {
		return companyShortName;
	}
	public void setCompanyShortName(String companyShortName) {
		this.companyShortName = companyShortName;
	}
	public String getCompanyDesc() {
		return companyDesc;
	}
	public void setCompanyDesc(String companyDesc) {
		this.companyDesc = companyDesc;
	}
	public String getGrowthStage() {
		return growthStage;
	}
	public void setGrowthStage(String growthStage) {
		this.growthStage = growthStage;
	}
	public String getNature() {
		return nature;
	}
	public void setNature(String nature) {
		this.nature = nature;
	}
	public String getFounder() {
		return founder;
	}
	public void setFounder(String founder) {
		this.founder = founder;
	}
	public Integer getCertifyStatus() {
		return certifyStatus;
	}
	public void setCertifyStatus(Integer certifyStatus) {
		this.certifyStatus = certifyStatus;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public Integer getFamous() {
		return famous;
	}
	public void setFamous(Integer famous) {
		this.famous = famous;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCdkey() {
		return cdkey;
	}
	public void setCdkey(String cdkey) {
		this.cdkey = cdkey;
	}
	public String getBusinessLicense() {
		return businessLicense;
	}
	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
	}
	public String getOrganizationCode() {
		return organizationCode;
	}
	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}
	public String getAuthentication() {
		return authentication;
	}
	public void setAuthentication(String authentication) {
		this.authentication = authentication;
	}
	public String getCdkeyStatus() {
		return cdkeyStatus;
	}
	public void setCdkeyStatus(String cdkeyStatus) {
		this.cdkeyStatus = cdkeyStatus;
	}
	public String getCompanySlogan() {
		return companySlogan;
	}
	public void setCompanySlogan(String companySlogan) {
		this.companySlogan = companySlogan;
	}
	
}
