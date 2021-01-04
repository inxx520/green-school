package web_pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class XW_edit {
	
	private int id=0;
	private String biaoti="";
	private String guanjianzi="";
	private String shenhe="";
	private String yinyong="";
	private String neirong="";
	

	public String getGuanjianzi() {
		return guanjianzi;
	}
	public void setGuanjianzi(String guanjianzi) {
		this.guanjianzi = guanjianzi;
	}
	public String getShenhe() {
		return shenhe;
	}
	public void setShenhe(String shenhe) {
		this.shenhe = shenhe;
	}
	public String getYinyong() {
		return yinyong;
	}
	public void setYinyong(String yinyong) {
		this.yinyong = yinyong;
	}
	public String getNeirong() {
		return neirong;
	}
	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
//	对接bean	<jsp:setProperty  name="XW_edit" property="id"   value="123456"/> 
		this.id = id;
		 System.out.println("this.id ="+this.id);
		 XW_get(this.id);
	}
	//----------------------------------------------------------------------
    public void XW_get(int Vxwid){
    	Connection  conn = pub_fun.getConnection();
    	String Sql_str = "select * from XW_data where XW_id="+Vxwid+"   ";
    	boolean Oboolean=false;
    	try {
			PreparedStatement pstat = conn.prepareStatement(Sql_str);
			ResultSet rs = (ResultSet) pstat.executeQuery();
			while(rs.next())  
	            {  
				this.setBiaoti(rs.getString("XW_topic"));
				this.setGuanjianzi(rs.getString("XW_keyword"));
				}  
	        pstat.close();
	        conn.close();

 
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
	public String getBiaoti() {
		return biaoti;
	}
	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	} 

}
