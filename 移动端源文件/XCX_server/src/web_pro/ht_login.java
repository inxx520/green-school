package web_pro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ht_login
 */
@WebServlet("/ht_login")
public class ht_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ht_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String log = request.getParameter("log");
		String pwd = request.getParameter("pwd");
		
		String yh_name="";
		HttpSession session=request.getSession();
		if("tom".equals(log)&&"123456".equals(pwd)){
			session.setAttribute("yh_name", log);
			response.sendRedirect("./admin/main.html");
			
			System.out.println("login good!");
		}else{
			response.sendRedirect("./admin/login.html");
			System.out.println("login bad!");
		}
		
/*		String yh_name="";
		HttpSession session=request.getSession();
		yh_name=xm_check(log,pwd);
		if(!"".equals(yh_name)){
			session.setAttribute("yh_name", yh_name);
			response.sendRedirect("./admin/main.jsp");
		}else{
			response.sendRedirect("./admin/login.jsp");
		}	*/
	}
//----------------------------------------------------------------------
    public String sp_check(String spid,String spmingcheng){
    	Connection  conn = pub_fun.getConnection();
    	String Sql_str = "select * from sheet1 where sp_id= '  "+spid+"  ' ";
    	String Ostr="娌℃壘鍒�";
    	boolean Oboolean=false;
    	try {
			PreparedStatement pstat = conn.prepareStatement(Sql_str);
			ResultSet rs = (ResultSet) pstat.executeQuery();
			while(rs.next())  
	            {  
				Ostr="鎵惧埌浜�";
				}  
	        pstat.close();
	        conn.close();

 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	System.out.println(Ostr);
		return Ostr;
	}  
  //----------------------------------------------------------------------
    public String xm_check(String yhlog,String yhpwd){
    	Connection  conn = pub_fun.getConnection();
    	String Sql_str = "select * from yh_data where yh_log= '"+yhlog+"' and yh_pwd='"+yhpwd+"'";
    	String Ostr="";
    	try {
			PreparedStatement pstat = conn.prepareStatement(Sql_str);
			ResultSet rs = (ResultSet) pstat.executeQuery();
			while(rs.next())  
	            {  
				Ostr=rs.getString("yh_xingming");
				}  
	        pstat.close();
	        conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	//System.out.println(Ostr);
		return Ostr;
	} 
		

}
