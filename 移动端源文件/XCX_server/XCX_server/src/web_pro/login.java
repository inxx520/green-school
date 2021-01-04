package web_pro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
			String log = request.getParameter("log");
			String pwd = request.getParameter("pwd");
			String Ostr="";
			if(log==null || "".equals(log)){
				Ostr="successCallback({\"loginok\":\"用户名不能为容,请重新填写\" })";
			}else if(pwd==null || "".equals(pwd)){
				Ostr="successCallback({\"loginok\":\"密码不能为容,请重新填写\" })";
			}else if("test".equals(log) || "12345678".equals(pwd)){
				Ostr="successCallback({\"login\":\"登录成功，欢迎你\" })";
			}else{
				Ostr="successCallback({\"loginok\":\"用户名或密码错误,请重新填写\" })";
			}		
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
