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
 * Servlet implementation class PG_splist
 */
@WebServlet("/PG_splist")
public class PG_splist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PG_splist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
/*		String json01="";
	    response.setContentType("text/json;charset=UTF-8");
//	      response.setContentType("application/json;charset=utf-8");
	    response.setContentType("text/javascript");  
        response.setCharacterEncoding("UTF-8");
        PrintWriter JsonOut = response.getWriter();
    //-------------------------------------------------------
//        request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");

	       
	        json01=json01+"[{\"IdNumber\":\"43100000000000\", \"Name\":\"张三\", \"BirthDate\":\"1982\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
	        json01=json01+"{\"IdNumber\":\"43100000000001\", \"Name\":\"李四\", \"BirthDate\":\"1983\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
	        json01=json01+"{ \"IdNumber\":\"43100000000002\", \"Name\":\"王五\", \"BirthDate\":\"1984\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
	        json01=json01+"{\"IdNumber\":\"43100000000003\", \"Name\":\"赵六\", \"BirthDate\":\"1985\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" },";
	        json01=json01+"{\"IdNumber\":\"43100000000004\", \"Name\":\"牛七\", \"BirthDate\":\"1986\", \"Address\":\"深圳市\", \"PostCode\":\"518000\" }]";

            System.out.println(json01);
	        JsonOut.println(json01);
	        JsonOut.flush();
	        JsonOut.close();*/
  		String json01="";
  	    response.setContentType("text/json;charset=UTF-8");
          response.setCharacterEncoding("UTF-8");
          PrintWriter JsonOut = response.getWriter();
      //-------------------------------------------------------
          request.setCharacterEncoding("utf-8");
  		response.setCharacterEncoding("utf-8");

  		Connection  conn = (Connection) pub_fun.getConnection();
      	String Sql_str = "select * from sp_data order by spid  desc";
      	String Ostr="";
      	try {
  			PreparedStatement pstat = conn.prepareStatement(Sql_str);
  			ResultSet rs = (ResultSet) pstat.executeQuery();
  			Ostr=Ostr+"[";
  			while(rs.next())  
  	            {  
  				Ostr=Ostr+"{\"SPID\":\""+rs.getString("spid")+"\", ";
  				Ostr=Ostr+"\"SPMC\":\""+rs.getString("spmc")+"\", ";
  				Ostr=Ostr+"\"SPJG\":\""+rs.getString("spjg")+"\", ";
  				Ostr=Ostr+"\"SPKC\":\""+rs.getString("spkc")+"\", ";
  				Ostr=Ostr+"\"SPPIC\":\""+rs.getString("sppic")+"\",";
  				Ostr=Ostr+"\"SPXQ\":\""+rs.getString("spinfo")+"\"},";
  						}  
  			Ostr=Ostr+"]";
  			Ostr=Ostr.replace("},]", "}]");
  	        pstat.close();
  	        conn.close();

          } catch (SQLException e) {
              e.printStackTrace();
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
