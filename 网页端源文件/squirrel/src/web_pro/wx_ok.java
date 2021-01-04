package web_pro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class wx_ok
 */
public class wx_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wx_ok() {
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
		response.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
		
		String opid = request.getParameter("opid0");
		String nkname = request.getParameter("nkname0");
		String himg = request.getParameter("himg");
		int count =  Integer.parseInt(request.getParameter("himg0"));
		System.out.println("z这哩！！！！ ="+opid);
		
	
		Connection  conn = pub_fun.getConnection();

	    String sql = "insert into wx_info (openid,nickname,headimgurl)";
	        sql =sql +"values (?,?,?)";
	       
			try {
				for (int i = 0; i < 2; i ++) {
				PreparedStatement pstat = conn.prepareStatement(sql);
				
				pstat.setString(1, opid);	
				pstat.setString(2, nkname);
				pstat.setString(3, himg);
			    pstat.executeUpdate();
		        System.out.println(" add success");
		        pstat.close();
		        conn.close();
		        }
			}
	         catch (SQLException e) {
	           e.printStackTrace();
	        }
			
			
			request.setCharacterEncoding("UTF-8");
	    	response.setContentType("text/html;charset=utf-8");
	    	//String alert = "succeed";
	    	 response.getWriter().append("<script>alert('添加完成');window.location.href=\"./../wx.jsp\";</script>");;
	
	}
}
