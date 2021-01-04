package web_pro;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WXtoweb
 */
@WebServlet("/WXtoweb")
public class WXtoweb extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection conn;
    private PreparedStatement pstat;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public WXtoweb() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String act_now = request.getParameter("code");
        String isadd = request.getParameter("state");
        String my_openid = "DFOid";
        int Oid_start = 0, Oid_end = 0;
        //HttpSession WX_session = request.getSession(false);

        PrintWriter out = response.getWriter();
        //String WX_res="";
        boolean Jump = false;
        //out.println(act_now);
				String URL_Str="https://api.weixin.qq.com/cgi-bin/token?appid=wxf44632e5dd81fe76&secret=a142c12605b4c6915f4fda97632b6414&grant_type=client_credential";
//				String URL_Str="https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxe0664a3c68b0e7ef&secret=23e6fa032797f98f40014ddfb6d1058e&code="+act_now+"&grant_type=authorization_code"; //公众号二次开发
				//String URL_Str="https://api.weixin.qq.com/cgi-bin/user/get?access_token=ACCESS_TOKEN&next_openid=NEXT_OPENID"
				//out.println(URL_Str);
		        try {
		            URL WX_url = new URL(URL_Str);
		            java.net.HttpURLConnection WX_conn = (java.net.HttpURLConnection) WX_url.openConnection();
		            WX_conn.setConnectTimeout(30000);
		            WX_conn.setReadTimeout(30000);
		            WX_conn.setDoInput(true);
//							WX_conn.setRequestMethod("POST"); //公众号二次开发
		            WX_conn.setRequestMethod("GET");
		            WX_conn.connect();
		            java.io.BufferedReader WX_in = new java.io.BufferedReader(new java.io.InputStreamReader(WX_conn.getInputStream(), "UTF-8"));
		            String line = "noData";
		            line = WX_in.readLine();
//							out.println(line);
		            JSONObject obj = JSON.parseObject(line);
		            String access_token = (String) obj.get("access_token");
		            String expires_in = String.valueOf((Integer) obj.get("expires_in"));
//							公众号二次开发
//							Oid_start=line.indexOf("openid")+9;
//							if(Oid_start>0){
//								Oid_end=line.indexOf(",", Oid_start)-1;
//								my_openid=line.substring(Oid_start, Oid_end);
//								//WX_res=my_openid;
//							}
//							out.println(my_openid);
//							公众号二次开发 结束
		            WX_in.close();
					//获取用户列表
					String userlistdata=openlistRequest(access_token);
					JSONObject obj2 = JSON.parseObject(userlistdata);
					JSONObject data= (JSONObject) obj2.get("data");
					JSONArray openIdsJSON=(JSONArray)data.get("openid");
					List<String> openIds=openIdsJSON.toJavaList(String.class);
					List<User> users=new ArrayList<>();
					for (String openid:openIds) {
						User user;
						String userJson=userdetailRequest(access_token,openid);
						user=JSON.parseObject(userJson,User.class);
						users.add(user);
						System.out.println(openid);
					}
					//存入数据库
		            Connection connection = pub_fun.getConnection();
		            String sql = "insert into wuser (nickname,avactor_url,country,openid) values (?,?,?,?)";
		            for (User u:users) {
		                PreparedStatement preparedStatement = connection.prepareStatement(sql);
		                preparedStatement.setString(1, u.getNickname());
		                preparedStatement.setString(2, u.getHeadimgurl());
		                preparedStatement.setString(3,u.getCountry());
		                preparedStatement.setString(4,u.getOpenid());
		                preparedStatement.execute();
		            }
		            connection.close();
					System.out.println(users.size());
					request.setAttribute("users", users);
					request.setAttribute("access_token", access_token);
		            request.setAttribute("expires_in", expires_in);
		            request.getRequestDispatcher("/WX_assecc_detail.jsp").forward(request, response);

		        } catch (Exception e) {
					try {
						throw e;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}

//							if(!"".equals(my_openid)){
//									String sql = "select Xxm from stu_data where Xwxh='"+my_openid+"'";
//						            Connection conn = public_fun.getConnection();
//						            try {
//							            PreparedStatement pstat = conn.prepareStatement(sql);
//							            ResultSet rs = (ResultSet) pstat.executeQuery();
//										while(rs.next())  
//							            {  
//											Jump=true;
//							            }
//										pstat.close();
//								        conn.close();
//						            } catch (SQLException e) {
//						                e.printStackTrace();
//						            }
//								}

		        //out.println(WX_res);
//						if(Jump==true){
//						   // response.sendRedirect("./homepage.jsp?Oid="+my_openid);
//						    response.sendRedirect("./mobil.jsp?Oid="+my_openid);
//							//out.println(Jump);
//						}else{
//							response.sendRedirect("./login.jsp?Oid="+my_openid);
//						    //out.println(Jump);
//						}
		        //request..getRequestDispatcher("/homepage.jsp").forward(request, response);
		    }

		    /**
		     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		     */
		    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		        // TODO Auto-generated method stub
		        doGet(request, response);
		    }

		    public String openlistRequest(String access) throws Exception {
		        URL WX_url = new URL("https://api.weixin.qq.com/cgi-bin/user/get?access_token=" + access + "&next_openid=");
		        java.net.HttpURLConnection WX_conn = (java.net.HttpURLConnection) WX_url.openConnection();
		        WX_conn.setConnectTimeout(30000);
		        WX_conn.setReadTimeout(30000);
		        WX_conn.setDoInput(true);
//							WX_conn.setRequestMethod("POST"); //公众号二次开发
		        WX_conn.setRequestMethod("GET");
		        WX_conn.connect();
		        java.io.BufferedReader WX_in = new java.io.BufferedReader(new java.io.InputStreamReader(WX_conn.getInputStream(), "UTF-8"));
		        String line = "noData";
		        line = WX_in.readLine();
				WX_in.close();
		        return line;
		    }

		    public String userdetailRequest(String access,String openId) throws Exception {
		        URL WX_url = new URL("https://api.weixin.qq.com/cgi-bin/user/info?access_token="+access+"&openid="+openId);
		        java.net.HttpURLConnection WX_conn = (java.net.HttpURLConnection) WX_url.openConnection();
		        WX_conn.setConnectTimeout(30000);
		        WX_conn.setReadTimeout(30000);
		        WX_conn.setDoInput(true);
//							WX_conn.setRequestMethod("POST"); //公众号二次开发
		        WX_conn.setRequestMethod("GET");
		        WX_conn.connect();
		        java.io.BufferedReader WX_in = new java.io.BufferedReader(new java.io.InputStreamReader(WX_conn.getInputStream(), "UTF-8"));
		        String line = "noData";
		        line = WX_in.readLine();
				WX_in.close();
		        return line;
		    }

		}

