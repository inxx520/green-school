package web_pro;

import java.io.DataOutputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLEncoder;


import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class wx {
	
	private String WXtoke="";
	private String WXtoke2="";
	private String WXtoke3="";
	private int ExpireTime=0;
	private JSONArray jsondata;
	
	
	public String getWXtoke() {
		try {
			get_wxtoken() ;
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return WXtoke;
	}
	public String getWXtoke2() {
		try {
			get_wxtoken() ;
			get_wxtoken2() ;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return WXtoke2;
	}
	public String getWXtoke3() {
		try {
			get_wxtoken() ;
			get_wxtoken2() ;
			get_wxtoken3() ;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return WXtoke2;
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
		String URL_Str="https://api.weixin.qq.com/cgi-bin/token?appid=wx41f140ccb0d1294c&secret=40d19cf9394367aeba965ad0cb6754c7&grant_type=client_credential";
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
			JSONObject jsonobject =JSONObject.fromObject(line);
			WXtoke=jsonobject.getString("access_token");
			
			System.out.print(WXtoke+"\n");
		}catch(Exception e){
			throw e;
		}
	}
	
	private void get_wxtoken2() throws Exception {
		String URL_Str="https://api.weixin.qq.com/cgi-bin/user/get?access_token="+WXtoke+"&next_openid=";
		System.out.print(URL_Str);
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
			JSONObject jsonobject =JSONObject.fromObject(line);
			String data =jsonobject.getString("data");
			System.out.print(data);
			jsonobject=JSONObject.fromObject(data);
			jsondata = jsonobject.getJSONArray("openid");
			
			for(int i=0;i<jsondata.size();i++)System.out.print("\n\n"+jsondata.get(i));
//			JSONArray jsonarray = jsonobject.getJSONArray("openid");
			//jsonarray[2];
//			line=line.substring(17,line.indexOf(",")-1);
			WXtoke2=line;
			WX_in.close();
			
		}catch(Exception e){
			throw e;
		}
	}
//	private void get_wxtoken3() throws Exception {
//		String URL_Str="https://api.weixin.qq.com/cgi-bin/user/info?access_token=33_ZADFXfeXl0VW5daK4Ckmrjeo2RPTfljV47_JKeYMSF5CUyNxSIkJ1HX3StojfyrhDd7-dh2VQ_oxNFtguc09pH3F4mYtzRR_kEThr8wSQcqgvDjCd5w8ZdPUT5b05nyPx1V-XH5uCvM0rChXEVFbABARIS&openid=otY-cwXlInI42yVlfZ1CGrnGLJEo&lang=zh_CN";
//		try{
//		    URL WX_url=new URL(URL_Str);
//			java.net.HttpURLConnection WX_conn=(java.net.HttpURLConnection)WX_url.openConnection();
//			WX_conn.setConnectTimeout(30000);
//			WX_conn.setReadTimeout(30000);
//			WX_conn.setDoInput(true);
//			WX_conn.setRequestMethod("GET");
//			WX_conn.connect();
//			java.io.BufferedReader WX_in=new java.io.BufferedReader (new java.io.InputStreamReader(WX_conn.getInputStream(),"UTF-8"));
//			String line="noData";
//			line=WX_in.readLine();
////			line=line.substring(17,line.indexOf(",")-1);
//			WX_in.close();
//			WXtoke2=line;
//		}catch(Exception e){
//			throw e;
//		}
//	}
	private void get_wxtoken3() throws Exception {
		String userlist="";
		for(int i=0;i<jsondata.size();i++)
			{
				if(i==0)
					userlist="{\"openid\":\""+jsondata.get(i)+"\"}";
				else
					userlist=userlist+",{\"openid\":\""+jsondata.get(i)+"\"}";
			}
		String body="{\"user_list\":["+userlist+"]}";
		System.out.print(body);
		String URL_Str="https://api.weixin.qq.com/cgi-bin/user/info/batchget?access_token="+WXtoke;
		try{
		    URL WX_url=new URL(URL_Str);
			java.net.HttpURLConnection WX_conn=(java.net.HttpURLConnection)WX_url.openConnection();
			WX_conn.setConnectTimeout(30000);
			WX_conn.setReadTimeout(30000);
			WX_conn.setDoInput(true);
			WX_conn.setRequestMethod("POST");
			WX_conn.setDoOutput(true);
			WX_conn.connect();
			OutputStream outputStream=WX_conn.getOutputStream();
			outputStream.write(body.getBytes());
			outputStream.flush();
            outputStream.close();
			
			java.io.BufferedReader WX_in=new java.io.BufferedReader (new java.io.InputStreamReader(WX_conn.getInputStream(),"UTF-8"));
			String line="noData";
			line=WX_in.readLine();
//			line=line.substring(17,line.indexOf(",")-1);
			WX_in.close();
			WXtoke2=line;
			WXtoke2=WXtoke2.replace("\\", "");
			

			
			System.out.print(line);
		}catch(Exception e){
			throw e;
		}
	}
}
