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
 * Servlet implementation class XW_addok
 */
@WebServlet("/XW_addok")
public class XW_addok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XW_addok() {
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
		request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=utf-8");
		
		String biaoti = request.getParameter("biaoti");
		String guanjianzi = request.getParameter("guanjianzi");
		String shenhe = request.getParameter("shenhe");
		String yinyong = request.getParameter("yinyong");
		String neirong = request.getParameter("neirong");
		System.out.print("biaoti = " + biaoti);
		
		Connection  conn = pub_fun.getConnection();
		  PreparedStatement stmt = null;
		  String sql="insert  into XW_data(XW_topic,XW_keyword,XW_check,XW_link,XW_content)";
		        sql+=" values(?,?,?,?,?)";
		        try {
		        stmt = conn.prepareStatement(sql);
		   		stmt.setString(1,biaoti);
		         stmt.setString(2,guanjianzi);
			   	stmt.setString(3,shenhe);
			    stmt.setString(4,yinyong);
			    stmt.setString(5,neirong);
		         stmt.executeUpdate();
		         System.out.println("success");
		  } catch (SQLException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		
	}

}
