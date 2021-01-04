package web_pro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WX_login
 */
@WebServlet("/WX_login")
public class WX_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WX_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		 //-------------------------------------------------------
	    response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter JsonOut = response.getWriter();
    //-------------------------------------------------------
        request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String log = request.getParameter("loginName");
		String pwd = request.getParameter("password");
		System.out.println(log);
		System.out.println(pwd);
		
		
		Connection  conn = pub_fun.getConnection();
    	String Sql_str = "select * from yh_data where log='"+log+"' and pwd='"+pwd+"'";
    	String Ostr="";
    	try {
			PreparedStatement pstat = conn.prepareStatement(Sql_str);
			ResultSet rs = (ResultSet) pstat.executeQuery();
			if(rs.next())  
	            {  
				
					Ostr="{\"code\":200,\"message\":\"鎴愬姛\",\"date\":1504785964984}";
				}else{
					Ostr="{\"loginok\":\"鐢ㄦ埛鍚嶆垨瀵嗙爜閿欒,璇烽噸鏂板～鍐橽" }";
				}


	        pstat.close();
	        conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
		
		
		
		
//		if(log==null || "".equals(log)){
//			Ostr="{\"loginok\":\"鐢ㄦ埛鍚嶄笉鑳戒负瀹�,璇烽噸鏂板～鍐橽" }";
//		}else if(pwd==null || "".equals(pwd)){
//			Ostr="{\"loginok\":\"瀵嗙爜涓嶈兘涓哄,璇烽噸鏂板～鍐橽" }";
//		}else if("test".equals(log) || "12345678".equals(pwd)){
////			Ostr="{\"login\":\"鐧诲綍鎴愬姛锛屾杩庝綘\" }";
//			Ostr="{\"code\":200,\"message\":\"鎴愬姛\",\"date\":1504785964984}";
//		}else{
//			Ostr="{\"loginok\":\"鐢ㄦ埛鍚嶆垨瀵嗙爜閿欒,璇烽噸鏂板～鍐橽" }";
//		}		
		System.out.println(Ostr);
        JsonOut.println(Ostr);
        JsonOut.flush();
        JsonOut.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
