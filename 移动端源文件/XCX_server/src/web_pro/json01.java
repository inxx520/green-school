package web_pro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class json01
 */
@WebServlet("/json01")
public class json01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public json01() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			//response.getWriter().append("Served at: ").append(request.getContextPath());
			
			request.setCharacterEncoding("utf-8");
		    response.setContentType("text/json;charset=UTF-8");
	        response.setCharacterEncoding("UTF-8");
	        PrintWriter JsonOut = response.getWriter();
	    
	        
	        String json01="";
	      //-------------------本域 json--------------------------
//		        

/*		        json01=json01+"[{\"IdNumber\":\"43100000000000\", \"Name\":\"张三\", \"BirthDate\":\"1982\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
		        json01=json01+"{\"IdNumber\":\"43100000000001\", \"Name\":\"李四\", \"BirthDate\":\"1983\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
		        json01=json01+"{ \"IdNumber\":\"43100000000002\", \"Name\":\"王五\", \"BirthDate\":\"1984\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
		        json01=json01+"{\"IdNumber\":\"43100000000003\", \"Name\":\"赵六\", \"BirthDate\":\"1985\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
		        json01=json01+"{\"IdNumber\":\"43100000000004\", \"Name\":\"牛七\", \"BirthDate\":\"1986\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" }]";*/

		  //-------------------------跨域 json--------------------------

		        json01=json01+"successCallback(";
		        json01=json01+"[{\"IdNumber\":\"43100000000000\", \"Name\":\"张三\", \"BirthDate\":\"1982\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
		        json01=json01+"{\"IdNumber\":\"43100000000001\", \"Name\":\"李四\", \"BirthDate\":\"1983\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
		        json01=json01+"{ \"IdNumber\":\"43100000000002\", \"Name\":\"王五\", \"BirthDate\":\"1984\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
		        json01=json01+"{\"IdNumber\":\"43100000000003\", \"Name\":\"赵六\", \"BirthDate\":\"1985\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
		        json01=json01+"{\"IdNumber\":\"43100000000004\", \"Name\":\"牛七\", \"BirthDate\":\"1986\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" }]";
		        json01=json01+")";
	        

	            System.out.println(json01);
		        JsonOut.println(json01);
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
