package web_pro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HT_xw_list {

	 public String xw_list_all(){
	    	Connection  conn = pub_fun.getConnection();
	    	String Sql_str = "select * from XW_data order by XW_id  desc";
	    	String Ostr="";
	    	try {
				PreparedStatement pstat = conn.prepareStatement(Sql_str);
				ResultSet rs = (ResultSet) pstat.executeQuery();
				while(rs.next())  
		            {  
	 
			                Ostr=Ostr+"<tr>";
			                Ostr=Ostr+"<td><input name='check' type='checkbox' value='' /></td>"; 
			                Ostr=Ostr+"<td>"+rs.getString("XW_id")+"</td>";  
			                Ostr=Ostr+"<td>"+rs.getString("XW_topic")+"</td>";  
			                Ostr=Ostr+"<td>国际新闻</td>";  
			                Ostr=Ostr+"<td>"+rs.getString("atime")+"</td>";
			                Ostr=Ostr+"<td><a href='../XW_del?xwid="+rs.getString("XW_id")+"' class='tablelink'> 删除</a></td>";
			                Ostr=Ostr+ "</tr>";  

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
