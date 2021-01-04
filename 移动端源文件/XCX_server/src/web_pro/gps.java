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

/**
 * Servlet implementation class gps
 */
@WebServlet("/gps")
public class gps extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gps() {
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
			String GPS_jd = request.getParameter("GPS_jd");
			String GPS_wd = request.getParameter("GPS_wd");
			String GPS_jl = request.getParameter("GPS_jl");
			System.out.println(GPS_jd);
			System.out.println(GPS_wd);
			System.out.println(GPS_jl);
			String Ostr="";
			if (Double.parseDouble(GPS_jl) <= 1.0){
			Connection  conn = pub_fun.getConnection();
		    String sql = "insert into gps_data (GPS_jd,GPS_wd,GPS_jl)";
		        sql =sql +"values (?,?,?)";

				try {
					PreparedStatement pstat = conn.prepareStatement(sql);    
					pstat.setDouble(1,Double.parseDouble(GPS_jd));
					pstat.setDouble(2,Double.parseDouble(GPS_wd));
					pstat.setDouble(3,Double.parseDouble(GPS_jl));

				    pstat.executeUpdate();
			        pstat.close();
			        conn.close();
		 
		        } catch (SQLException e) {
		           e.printStackTrace();
		        }
			
				Ostr="{\"code\":200,\"message\":\"成功\",\"date\":1504785964984}";
			}else{
				Ostr="{\"code\":300,\"message\":\"成功\",\"date\":1504785964984}";
			}
//				
				request.setCharacterEncoding("UTF-8");
		    	response.setContentType("text/html;charset=utf-8");
     	    	 JsonOut.println(Ostr);
		         JsonOut.flush();
		         JsonOut.close();
		    	//String alertstr = "操作已经完成";
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
