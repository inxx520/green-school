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
 * Servlet implementation class XW_delok
 */
@WebServlet("/XW_delok")
public class XW_delok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XW_delok() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		String XWid = request.getParameter("XWid");
		System.out.println("XWid = " + XWid);
		
		Connection  conn = pub_fun.getConnection();
		PreparedStatement stmt = null;
		String sql = "delete from XW_data where XW_id= ?";
		  try {
		        stmt = conn.prepareStatement(sql);
		   		stmt.setInt(1,Integer.parseInt(XWid));
		         stmt.executeUpdate();
		         System.out.println("delete success");
		  } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  response.getWriter().append("<script>alert('delete success!');window.location.href=\"admin/HT_xw_list.jsp\";</script>");
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
