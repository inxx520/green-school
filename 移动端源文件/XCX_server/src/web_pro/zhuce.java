package web_pro;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class zhuce
 */
@WebServlet("/zhuce")
public class zhuce extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public zhuce() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 //-------------------------------------------------------
		    response.setContentType("text/json;charset=UTF-8");
	        response.setCharacterEncoding("UTF-8");
	        PrintWriter JsonOut = response.getWriter();
        //-------------------------------------------------------
	        request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String userschool = request.getParameter("userschool");
			String usersnum = request.getParameter("usersnum");
			String logName = request.getParameter("logName");
			String sex = request.getParameter("sex");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String mobile = request.getParameter("mobile");
			
			
			String Ostr="";
			Connection  conn = pub_fun.getConnection();
		    String sql = "insert into xyh_data (YH_address,YH_num,YH_log,YH_sex,YH_email,YH_pwd,YH_phone)";
		        sql =sql +"values (?,?,?,?,?,?,?)";

				try {
					PreparedStatement pstat = conn.prepareStatement(sql);    
					pstat.setString(1, userschool);	
					pstat.setInt(2,Integer.parseInt(usersnum));
					pstat.setString(3, logName);
					pstat.setString(4,sex );
					pstat.setString(5, email);
					pstat.setString(6, password );
					pstat.setString(7, mobile );
				    pstat.executeUpdate();
			        pstat.close();
			        conn.close();
		 
		        } catch (SQLException e) {
		           e.printStackTrace();
		        }
				Ostr="{\"code\":200,\"message\":\"鎴愬姛\",\"date\":1504785964984}";
				
				request.setCharacterEncoding("UTF-8");
			//	System.out.println("http://"+request.getServerName()+":"+request.getServerPort()+request.getServletPath()+"/Login.html");
		    	response.setContentType("text/html;charset=utf-8");
		    //	response.sendRedirect("http://169.254.100.196:3000/Login.html");
		    	 JsonOut.println(Ostr);
		         JsonOut.flush();
		         JsonOut.close();
		    	//String alertstr = "鎿嶄綔宸茬粡瀹屾垚";
		    	//response.getWriter().append("<script>alert('"+ alertstr +"');window.location.href=\"admin/HT_xw_list.jsp\";</script>");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
