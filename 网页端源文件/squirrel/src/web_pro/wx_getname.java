package web_pro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class wx_getname
 */
public class wx_getname extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   private wx wxtk;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wx_getname() {
        super();
        wxtk=new wx();
      
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String json01=wxtk.getWXtoke3();
	    response.setContentType("text/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter JsonOut = response.getWriter();
    //-------------------------------------------------------
        request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		   String VPN=request.getParameter("PN");
		   if(VPN==null || VPN.equals("")){
			   VPN="1";
			}else{
				VPN=VPN.trim();
			}
	        
	       // json01="successCallback({\"SPID\":\"43107\", \"SPMC\":\"鍟嗗搧07\", \"SPJG\":\"$45\", \"SPKC\":\"21\", \"SPPIC\":\"004.jpg\", \"SPXQ\":\"鍚勫鍏徃鐨勫ぇ鍔涙姇鍏ワ紝璁╃幇浠婄殑 AI 鎶�鏈緱浠ュ湪鍚勪釜涓嶅悓鐨勯鍩熷揩閫熷彂灞曘�傛瘮濡傝鏂板崕绀撅紝鏃ュ墠灏辫繋鏉ヤ簡涓や綅涓�佽嫳鏂囥�孉I 鍚堟垚涓绘挱銆嶃�傚叾鑳屽悗鏄敱鎼滅嫍鐨勩�屽垎韬�嶆妧鏈潵椹卞姩锛岀畝鍗曟潵璇达紝杩欏绯荤粺鍙互鍑�熷皯閲忕湡浜轰富鎾殑闊抽鍜岄潰閮ㄦ暟鎹紝鏉ユā鎷熷嚭涓�涓鍨嬨�佸０闊抽兘璺熷叾鐩稿儚锛屽苟涓斾細鏍规嵁鏂伴椈鍐呭鍗虫椂璋冩暣鍢村攪鍔ㄤ綔鍜岃〃鎯呯殑銆屽垎韬�嶃�俓" })";
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
