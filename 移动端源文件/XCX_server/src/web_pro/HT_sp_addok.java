package web_pro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HT_sp_addok
 */
@WebServlet("/HT_sp_addok")
public class HT_sp_addok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HT_sp_addok() {
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
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=utf-8");
		
		String topic = request.getParameter("spmc");
		String keyword = request.getParameter("spgjz");
		String check = request.getParameter("spcheck");
		String link = request.getParameter("splj");
		String content = request.getParameter("spxq");
		
		
		Connection  conn = pub_fun.getConnection();
	    String sql = "insert into sp_data ";
	        sql =sql +"values (?,?,?,?,?)";

			try {
				PreparedStatement pstat = conn.prepareStatement(sql);    
				pstat.setString(1, topic);	
				pstat.setString(2, keyword);
				pstat.setInt(3, Integer.parseInt(check));
				pstat.setString(4, link);
				pstat.setString(5, content);
			    pstat.executeUpdate();
		        pstat.close();
		        conn.close();
	 
	        } catch (SQLException e) {
	           e.printStackTrace();
	        }
			
			
			request.setCharacterEncoding("UTF-8");
	    	response.setContentType("text/html;charset=utf-8");
	    	String alertstr = "操作已经完成";
	    	response.getWriter().append("<script>alert('"+ alertstr +"');window.location.href=\"admin/HT_sp_list.jsp\";</script>");
	}

}
