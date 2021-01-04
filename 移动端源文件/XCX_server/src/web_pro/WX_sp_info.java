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
 * Servlet implementation class HT_sp_info
 */
@WebServlet("/HT_sp_info")
public class WX_sp_info extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WX_sp_info() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
//		String json01="";
//	    response.setContentType("text/json;charset=UTF-8");
//        response.setCharacterEncoding("UTF-8");
//        PrintWriter JsonOut = response.getWriter();
//    //-------------------------------------------------------
//        request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");
//
//		   String VPN=request.getParameter("PN");
//		   if(VPN==null || VPN.equals("")){
//			   VPN="1";
//			}else{
//				VPN=VPN.trim();
//			}
//		   json01="{\"SPID\":\"43107\", \"SPMC\":\"商品07\", \"SPJG\":\"$45\", \"SPKC\":\"21\", \"SPPIC\":\"004.jpg\", \"SPXQ\":\"各家公司的大力投入，让现今的 AI 技术得以在各个不同的领域快速发展。比如说新华社，日前就迎来了两位中、英文「AI 合成主播」。其背后是由搜狗的「分身」技术来驱动，简单来说，这套系统可以凭借少量真人主播的音频和面部数据，来模拟出一个外型、声音都跟其相像，并且会根据新闻内容即时调整嘴唇动作和表情的「分身」。\" }";
//           
//	       // json01="successCallback({\"SPID\":\"43107\", \"SPMC\":\"商品07\", \"SPJG\":\"$45\", \"SPKC\":\"21\", \"SPPIC\":\"004.jpg\", \"SPXQ\":\"各家公司的大力投入，让现今的 AI 技术得以在各个不同的领域快速发展。比如说新华社，日前就迎来了两位中、英文「AI 合成主播」。其背后是由搜狗的「分身」技术来驱动，简单来说，这套系统可以凭借少量真人主播的音频和面部数据，来模拟出一个外型、声音都跟其相像，并且会根据新闻内容即时调整嘴唇动作和表情的「分身」。\" })";
//            //json01="({\"c\":1,\"d\":2})";
//            System.out.println(json01);
//	        JsonOut.println(json01);
//	        JsonOut.flush();
//	        JsonOut.close();
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
