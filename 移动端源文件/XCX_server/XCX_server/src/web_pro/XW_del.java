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
 * Servlet implementation class XW_del
 */
@WebServlet("/XW_del")
public class XW_del extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XW_del() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=utf-8");
		
		String xwid = request.getParameter("xwid");
		Connection  conn = pub_fun.getConnection();
	    String sql = "delete from XW_data where XW_id="+xwid;

			try {
				PreparedStatement pstat = conn.prepareStatement(sql);    
			    pstat.executeUpdate();
		        pstat.close();
		        conn.close();
	        } catch (SQLException e) {
	           e.printStackTrace();
	        }
			
			
			request.setCharacterEncoding("UTF-8");
	    	response.setContentType("text/html;charset=utf-8");
	    	String alertstr = "操作已经完成";
	    	response.getWriter().append("<script>alert('"+ alertstr +"');window.location.href=\"admin/HT_xw_list.jsp\";</script>");
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
