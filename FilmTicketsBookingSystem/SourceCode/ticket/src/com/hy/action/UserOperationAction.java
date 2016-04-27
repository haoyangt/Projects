package com.hy.action;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.hy.biz.ICinemaBiz;
import com.hy.biz.IFilmBiz;
import com.hy.biz.IUserBiz;
import com.hy.biz.impl.CinemaBizImpl;
import com.hy.biz.impl.FilmBizImpl;
import com.hy.biz.impl.UserBizImpl;
import com.hy.po.Cinema;
import com.hy.po.Film;
import com.hy.po.User;
import com.hy.vo.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UserOperationAction extends ActionSupport implements ServletResponseAware,ServletRequestAware{
		private String jspComeFrom;
		private String username;
		private String password;
		private int fno;
		private int cno;
		private int currentPage;
		private String newpwd;
		private String vpwd;
		private HttpServletResponse response;
		private HttpServletRequest request;
		private String usecookie;
		
		public String getUsecookie() {
			return usecookie;
		}
		public void setUsecookie(String usecookie) {
			this.usecookie = usecookie;
		}
		public String getNewpwd() {
			return newpwd;
		}
		public void setNewpwd(String newpwd) {
			this.newpwd = newpwd;
		}
		public String getVpwd() {
			return vpwd;
		}
		public void setVpwd(String vpwd) {
			this.vpwd = vpwd;
		}
		public int getFno() {
			return fno;
		}
		public void setFno(int fno) {
			this.fno = fno;
		}
		public int getCno() {
			return cno;
		}
		public void setCno(int cno) {
			this.cno = cno;
		}
		public int getCurrentPage() {
			return currentPage;
		}
		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}
		public String getJspComeFrom() {
			return jspComeFrom;
		}
		public void setJspComeFrom(String jspComeFrom) {
			this.jspComeFrom = jspComeFrom;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		
		//登录
		public String login(){
			Map<String, Object> session=ActionContext.getContext().getSession();
			//判断是username password是否正确
			if(username!=null&&password!=null){
				IUserBiz ub=new UserBizImpl();
				User user=ub.findUser(username, password);
				if(user.getUsername()!=null){
					if(usecookie!=null){
						//存入Cookie
						Cookie ck1=new Cookie("username", username);
						Cookie ck2=new Cookie("password", password);
						ck1.setMaxAge(3600);
						ck2.setMaxAge(3600);
						response.addCookie(ck1);
						response.addCookie(ck2);
					}
					session.put("user", user);
					if(session.containsKey("errorLoginMsg"))
						session.remove("errorLoginMsg");
					if(user.getStatus()>=2)
						return "admin_index";
				}else{
					session.put("errorLoginMsg", "用户名或密码错误");
				}
			}
			
			if(jspComeFrom.equals("cinema_detail"))
				cinemaDetail();
			if(jspComeFrom.equals("film_detail"))
				filmDetail();
				
			return jspComeFrom;
		}
		
		//登出
		public String logout(){
			Map<String, Object> session=ActionContext.getContext().getSession();
			if(session.containsKey("user")){
				//消除Cookie
				Cookie[] cookie=request.getCookies();
				if(cookie!=null){
				   for(Cookie c:cookie){
				      if(c.getName().equals("username")){
				    	  c.setMaxAge(0);
				    	  response.addCookie(c);
				      }
				      if(c.getName().equals("password")){
				    	  c.setMaxAge(0);   
				    	  response.addCookie(c);
				      }
				   }
				}
				//消除session
				session.remove("user");
				request.setAttribute("readCookie", "no");
			}
			if(jspComeFrom.equals("cinema_detail"))
				cinemaDetail();
			if(jspComeFrom.equals("film_detail"))
				filmDetail();
			return jspComeFrom;
		}
		
		//修改密码
		public String changePwd(){
			Map<String, Object> session=ActionContext.getContext().getSession();
			if(newpwd.length()<6){
				session.put("errorChangePwdMsg", "密码长度必须大于等于6位");
			}else{
				if(newpwd.equals(vpwd)){
					User user=new User();
					user=(User) session.get("user");
					IUserBiz ub=new UserBizImpl();
					ub.changePassword(user.getUno(), newpwd);
					if(session.containsKey("errorChangePwdMsg"))
						session.remove("errorChangePwdMsg");
					if(session.containsKey("user"))
						session.remove("user");
					return "index";
				}else{
					session.put("errorChangePwdMsg", "两次密码输入不一致");
				}
			}
			if(jspComeFrom.equals("cinema_detail"))
				cinemaDetail();
			if(jspComeFrom.equals("film_detail"))
				filmDetail();
			return jspComeFrom;
		}
		
		//用户注册
		public String register(){
			Map<String, Object> session=ActionContext.getContext().getSession();
			if(newpwd.length()<6||vpwd.length()<6){
				session.put("errorRegisterMsg", "密码长度必须大于等于6位");
			}else{
				if(newpwd.equals(vpwd)){
					User user=new User();
					user.setUsername(username);
					user.setPassword(newpwd);
					user.setStatus(1);
					IUserBiz ub=new UserBizImpl();
					ub.register(user);
					if(session.containsKey("errorRegisterMsg"))
						session.remove("errorRegisterMsg");
				}else{
					session.put("errorRegisterMsg", "两次密码输入不一致");
				}
			}
			if(jspComeFrom.equals("cinema_detail"))
				cinemaDetail();
			if(jspComeFrom.equals("film_detail"))
				filmDetail();
			return jspComeFrom;
		}
		
		
		
		//以下为两个页面的数据重新读取
		//film_detail.jsp
		private void filmDetail(){
			//电影详情
			IFilmBiz fb=new FilmBizImpl();
			Film film=fb.findFilmByFno(fno);
			HttpServletRequest request = ServletActionContext.getRequest ();
			request.setAttribute("film", film);
			
			//热映电影
			fb=new FilmBizImpl();
			PageBean listFilm=fb.findAllReleasedFilm(1, 5);
			request.setAttribute("listFilm", listFilm);
			
			//电影院列表
			int pageSize=5;				//设置每页显示的电影数目
			if(currentPage<=0)
				currentPage=1;
			ICinemaBiz cb=new CinemaBizImpl();
			PageBean listCinema=null;
			listCinema=cb.findAllCinemaByFno(currentPage, pageSize, fno);
			request.setAttribute("simpleloc", "all");
			request.setAttribute("listCinema", listCinema);
			
			displayAllCinemaCount();
		}
		
		//cinema_detail.jsp
		private void cinemaDetail(){
			//电影院详情
			ICinemaBiz cb=new CinemaBizImpl();
			Cinema cinema=cb.findCinemaByCno(cno);
			HttpServletRequest request = ServletActionContext.getRequest ();
			request.setAttribute("cinema", cinema);
			
			//电影院的上映电影列表
			IFilmBiz fb=new FilmBizImpl();
			int pageSize=5;				//设置每页显示的电影数目
			if(currentPage<=0)
				currentPage=1;
			PageBean listFilm=fb.findReleasedFilmByCno(currentPage, pageSize, cno);
			request.setAttribute("listFilm", listFilm);
		}
		
		//获取地区分类的电影院数目
		private void displayAllCinemaCount(){
			HttpServletRequest request = ServletActionContext.getRequest ();
			ICinemaBiz cb;
			cb=new CinemaBizImpl();
			request.setAttribute("all", cb.findCinemaCountByFno(fno));
			cb=new CinemaBizImpl();
			request.setAttribute("heping", cb.findCinemaCountByFno(fno,"heping"));
			cb=new CinemaBizImpl();
			request.setAttribute("nankai", cb.findCinemaCountByFno(fno,"nankai"));
			cb=new CinemaBizImpl();
			request.setAttribute("hexi", cb.findCinemaCountByFno(fno,"hexi"));
			cb=new CinemaBizImpl();
			request.setAttribute("binhai", cb.findCinemaCountByFno(fno,"binhai"));
			cb=new CinemaBizImpl();
			request.setAttribute("beichen", cb.findCinemaCountByFno(fno,"beichen"));
			cb=new CinemaBizImpl();
			request.setAttribute("hongqiao", cb.findCinemaCountByFno(fno,"hongqiao"));
			cb=new CinemaBizImpl();
			request.setAttribute("hedong", cb.findCinemaCountByFno(fno,"hedong"));
			cb=new CinemaBizImpl();
			request.setAttribute("jinghai", cb.findCinemaCountByFno(fno,"jinghai"));
			cb=new CinemaBizImpl();
			request.setAttribute("baodi", cb.findCinemaCountByFno(fno,"baodi"));
		}
		@Override
		public void setServletResponse(HttpServletResponse arg0) {
			// TODO Auto-generated method stub
			this.response=arg0;
		}
		@Override
		public void setServletRequest(HttpServletRequest arg0) {
			// TODO Auto-generated method stub
			this.request=arg0;
		}
		
}
