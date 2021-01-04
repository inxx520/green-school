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
 * Servlet implementation class HT_splist
 */
@WebServlet("/HT_splist")
public class WX_splist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WX_splist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		// TODO Auto-generated method stub
  		//response.getWriter().append("Served at: ").append(request.getContextPath());
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
  		
  //
//  	        json01=json01+"[{\"SPID\":\"43101\", \"SPMC\":\"ssssss\", \"SPJG\":\"$48\", \"SPKC\":\"600\", \"SPPIC\":\"001.jpg\" },";
//  	        json01=json01+"{\"SPID\":\"43102\", \"SPMC\":\"商品02\", \"SPJG\":\"$65\", \"SPKC\":\"76\", \"SPPIC\":\"002.jpg\" },";
//  	        json01=json01+"{ \"SPID\":\"43103\", \"SPMC\":\"商品03\", \"SPJG\":\"$285\", \"SPKC\":\"95\", \"SPPIC\":\"003.jpg\" },";
//  	        json01=json01+"{\"SPID\":\"43104\", \"SPMC\":\"商品04\", \"SPJG\":\"$1985\", \"SPKC\":\"32\", \"SPPIC\":\"004.jpg\" },";
//  	        json01=json01+"{\"SPID\":\"43105\", \"SPMC\":\"商品05\", \"SPJG\":\"$258\", \"SPKC\":\"74\", \"SPPIC\":\"002.jpg\" },";
//  	        json01=json01+"{\"SPID\":\"43106\", \"SPMC\":\"商品06\", \"SPJG\":\"$52\", \"SPKC\":\"68\", \"SPPIC\":\"003.jpg\" },";
//  	        json01=json01+"{\"SPID\":\"43107\", \"SPMC\":\"商品07\", \"SPJG\":\"$45\", \"SPKC\":\"21\", \"SPPIC\":\"004.jpg\" },";
//  	        json01=json01+"{\"SPID\":\"43108\", \"SPMC\":\"商品08\", \"SPJG\":\"$125\", \"SPKC\":\"87\", \"SPPIC\":\"001.jpg\" }]";

//              System.out.println(json01);
//  	        JsonOut.println(json01);
  	        
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
