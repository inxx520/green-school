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
 * Servlet implementation class PG_xwlist
 */
@WebServlet("/PG_xwlist")
public class PG_xwlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PG_xwlist() {
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

	       
	        json01=json01+"[{\"IdNumber\":\"43100000000000\", \"Name\":\"����\", \"BirthDate\":\"1982\", \"Address\":\"������\", \"PostCode\":\"518000\" },";
	        json01=json01+"{\"IdNumber\":\"43100000000001\", \"Name\":\"����\", \"BirthDate\":\"1983\", \"Address\":\"������\", \"PostCode\":\"518000\" },";
	        json01=json01+"{ \"IdNumber\":\"43100000000002\", \"Name\":\"����\", \"BirthDate\":\"1984\", \"Address\":\"������\", \"PostCode\":\"518000\" },";
	        json01=json01+"{\"IdNumber\":\"43100000000003\", \"Name\":\"����\", \"BirthDate\":\"1985\", \"Address\":\"������\", \"PostCode\":\"518000\" },";
	        json01=json01+"{\"IdNumber\":\"43100000000004\", \"Name\":\"ţ��\", \"BirthDate\":\"1986\", \"Address\":\"������\", \"PostCode\":\"518000\" }]";

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
      	String Sql_str = "select * from new_data order by xwid desc";
      	String Ostr="";
      	try {
  			PreparedStatement pstat = conn.prepareStatement(Sql_str);
  			ResultSet rs = (ResultSet) pstat.executeQuery();
  			Ostr=Ostr+"[";
  			while(rs.next())  
  	            {  
  				Ostr=Ostr+"{\"XWID\":\""+rs.getString("xwid")+"\", ";
  				Ostr=Ostr+"\"TITLE\":\""+rs.getString("title")+"\", ";
  				Ostr=Ostr+"\"SOURCE\":\""+rs.getString("source")+"\", ";
  				Ostr=Ostr+"\"CONTENT\":\""+rs.getString("content")+"\", ";
  				Ostr=Ostr+"\"ORIGINAL\":\""+rs.getString("original")+"\",";
  				Ostr=Ostr+"\"XWTIME\":\""+rs.getString("xwtime")+"\",";
  				Ostr=Ostr+"\"COPIC\":\""+rs.getString("copic")+"\",";
  				Ostr=Ostr+"\"XWPIC\":\""+rs.getString("xwpic")+"\"},";
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
