package web_pro;

import java.io.IOException;
import java.io.PrintWriter;

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
		String json01="";
	    response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter JsonOut = response.getWriter();
    //-------------------------------------------------------
        request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		 String VPNID=request.getParameter("PID");
		   if(VPNID==null || VPNID.equals("")){
			   VPNID="1";
			}else{
				VPNID=VPNID.trim();
			}
	        
		    json01=json01+"{\"SPID\":\""+VPNID+"\", \"SPMC\":\"商品"+VPNID+"\", \"SPJG\":\"$45\", \"SPKC\":\"21\", \"SPPIC\":\"001.jpg\", \"SPXQ\":\"各家公司的大力投入，让现今的 AI 技术得以在各个不同的领域快速发展。比如说新华社，日前就迎来了两位中、英文「AI 合成主播」。其背后是由搜狗的「分身」技术来驱动，简单来说，这套系统可以凭借少量真人主播的音频和面部数据，来模拟出一个外型、声音都跟其相像，并且会根据新闻内容即时调整嘴唇动作和表情的「分身」。\" }";
	       // json01=json01+")";
            //json01="({\"c\":1,\"d\":2})";
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
