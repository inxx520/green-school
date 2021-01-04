package web_pro;


import java.net.URL;

public class WX_token {
	
	private String WXtoke="";
	private int ExpireTime=0;
	
	
	public String getWXtoke() {
		try {
			get_wxtoken() ;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return WXtoke;
	}

	public int getExpireTime() {	
		return ExpireTime;
	}

	public void setExpireTime(int expireTime) {
		ExpireTime = expireTime;
	}

	public void setWXtoke(String wXtoke) {
		WXtoke = wXtoke;
	}
	
	private void get_wxtoken() throws Exception {
		String URL_Str="https://api.weixin.qq.com/cgi-bin/token?appid=wxf44632e5dd81fe76&secret=a142c12605b4c6915f4fda97632b6414&grant_type=client_credential";
		
		try{
		    URL WX_url=new URL(URL_Str);
			java.net.HttpURLConnection WX_conn=(java.net.HttpURLConnection)WX_url.openConnection();
			WX_conn.setConnectTimeout(30000);
			WX_conn.setReadTimeout(30000);
			WX_conn.setDoInput(true);
			WX_conn.setRequestMethod("GET");
			WX_conn.connect();
			java.io.BufferedReader WX_in=new java.io.BufferedReader (new java.io.InputStreamReader(WX_conn.getInputStream(),"UTF-8"));
			String line="noData";
			line=WX_in.readLine();
			
			WX_in.close();
			line = line.substring(17,line.indexOf(",")-1);
			WXtoke=line;
			
			
		}catch(Exception e){
			throw e;
		}
	}
}
