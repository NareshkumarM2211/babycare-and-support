package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Name;
import dbconnection.DBConnection;

public class NamesDao {

public static List<Name> getNames(String gender,String religion,String mustInclude)
{ List<Name> names= new ArrayList<Name>();
  try{
	  PreparedStatement ps=null;   
	  Connection con = DBConnection.getCon();
//System.out.println(gender+"a "+religion+"b "+mustInclude+"c ");		      		      
//1
if(gender.equals("ALL") && religion.equals("ALL") && mustInclude.isEmpty())
{ ps = con.prepareStatement("SELECT * FROM namesdb");
}
//2
if(gender.equals("ALL") && religion.equals("ALL") && !mustInclude.isEmpty())
{ ps = con.prepareStatement("SELECT * FROM namesdb WHERE name LIKE '"+mustInclude+"%'");  
}
//3
if(gender.equals("ALL") && !religion.equals("ALL") && mustInclude.isEmpty())
{ ps = con.prepareStatement("SELECT * FROM namesdb where religion=?");
  ps.setString(1, religion);
}
//4
if(gender.equals("ALL") && !religion.equals("ALL") && !mustInclude.isEmpty())
{ ps = con.prepareStatement("SELECT * FROM namesdb where religion=? and name LIKE '"+mustInclude+"%'");
  ps.setString(1, religion);
}
//5
if(!gender.equals("ALL") && religion.equals("ALL") && mustInclude.isEmpty())
{ ps = con.prepareStatement("SELECT * FROM namesdb where gender=?");
  ps.setString(1, gender);
}

//6
if(!gender.equals("ALL") && religion.equals("ALL") && !mustInclude.isEmpty())
{ ps = con.prepareStatement("SELECT * FROM namesdb where gender=? and name LIKE '"+mustInclude+"%'");
  ps.setString(1, gender);
}
//7
if(!gender.equals("ALL") && !religion.equals("ALL") && mustInclude.isEmpty())
{ ps = con.prepareStatement("SELECT * FROM namesdb where gender=? and religion=?");
  ps.setString(1, gender);
  ps.setString(2, religion);
}
//8
if(!gender.equals("ALL") && !religion.equals("ALL") && !mustInclude.isEmpty())
{ ps = con.prepareStatement("SELECT * FROM namesdb where gender=? and religion=? and name LIKE '"+mustInclude+"%'");
  ps.setString(1, gender);
  ps.setString(2, religion);
}
				ResultSet rs=ps.executeQuery();				
				while(rs.next())
				{
					Name name = new Name();
					name.setId(Integer.parseInt(rs.getString("id")));
					name.setName(rs.getString("name"));
					name.setMeaning("meaning");
					name.setGender(rs.getString("gender"));
					name.setReligion(rs.getString("religion"));
					names.add(name);
				}
				con.close();
			}
		    catch(Exception e)
		    {System.out.println(e);
		     //System.out.println(gender+"x "+religion+"y "+mustInclude+"z ");	
		    }
			return names;
		}						
}