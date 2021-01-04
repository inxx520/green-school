package web_pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class XW_list {
	//----------------------------------------------------------------------
    public String XW_list(){
    	Connection  conn = pub_fun.getConnection();
    	String Sql_str = "select * from XW_data order by XW_id  desc ";
    	String Ostr="";
    	try {
			PreparedStatement pstat = conn.prepareStatement(Sql_str);
			ResultSet rs = (ResultSet) pstat.executeQuery();
			while(rs.next())  
	            {  
						Ostr=Ostr+"<tr><td>"+rs.getString("XW_id")+"</td>";
		                Ostr=Ostr+"<td>"+rs.getString("XW_topic")+"</td>";   
		                Ostr=Ostr+"<td>"+rs.getString("XW_keyword")+"</td>";  
		                
		                Ostr=Ostr+"<td><a href ='../admin/HT_xw_show.jsp?XWid="+rs.getString("XW_id")+"' class = 'tablelink'>详情</a>";  
		                Ostr=Ostr+"<a href ='../admin/XW_edit.jsp?XWid="+rs.getString("XW_id")+"' class = 'tablelink'>修改</a>";  
		                Ostr=Ostr+"<a href='../XW_delok?XWid="+rs.getString("XW_id")+"'class = 'tablelink'>删除</a></td></tr>";  
		                

						}  
	        pstat.close();
	        conn.close();

 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    	//System.out.println(Ostr);
		return Ostr;
	} 
}
