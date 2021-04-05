package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bean.Hospital;
import dbconnection.DBConnection;;

public class HospitalDao {
	
	public static List<Hospital> getAllRecords(){
		List<Hospital> list = new ArrayList<Hospital>();
		try{
			Connection con=DBConnection.getCon();
			PreparedStatement ps=con.prepareStatement("select * from hospitaldb");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Hospital h=new Hospital();
				h.setId(rs.getInt(1));
				h.setName(rs.getString(2));
				h.setAddress(rs.getString(3));
				h.setCity(rs.getString(4));
				h.setState(rs.getString(5));
				h.setPhone(rs.getString(6));
				h.setDescription(rs.getString(7));
				list.add(h);
			}
			con.close();
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	public static List<Hospital> getRecordsbyFilters(String city, String state, String start){
		List<Hospital> list = new ArrayList<Hospital>();
		try{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT * from hospitaldb WHERE city=? AND state=? AND name LIKE '"+start+"%'");
			ps.setString(1, city);
			ps.setString(2, state);
			//ps.setString(3, start);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Hospital h=new Hospital();
				h.setId(rs.getInt(1));
				h.setName(rs.getString(2));
				h.setAddress(rs.getString(3));
				h.setCity(rs.getString(4));
				h.setState(rs.getString(5));
				h.setPhone(rs.getString(6));
				h.setDescription(rs.getString(7));
				list.add(h);
			}
			con.close();
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	public static List<Hospital> getRecordsbyFilters(String city, String state){
		List<Hospital> list = new ArrayList<Hospital>();
		try{ PreparedStatement ps = null;
			Connection con = DBConnection.getCon();
			if(city.equals("ALL") && state.equals("ALL"))
		    { ps = con.prepareStatement("SELECT * from hospitaldb ");				
		    }
			if(city.equals("ALL") && !state.equals("ALL"))
			{	ps = con.prepareStatement("SELECT * from hospitaldb WHERE state=?");  
		        ps.setString(1, state);    		
			}
			if(!city.equals("ALL") && state.equals("ALL"))
			{	ps = con.prepareStatement("SELECT * from hospitaldb WHERE city=?");  		        
    			ps.setString(1, city);
			}						
			if(!city.equals("ALL") && !state.equals("ALL"))
			{ ps = con.prepareStatement("SELECT * from hospitaldb WHERE state=? AND city=?");
			  ps.setString(1, state);
			  ps.setString(2, city);
		    }			
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				Hospital h=new Hospital();
				h.setId(rs.getInt(1));
				h.setName(rs.getString(2));
				h.setAddress(rs.getString(3));
				h.setCity(rs.getString(4));
				h.setState(rs.getString(5));
				h.setPhone(rs.getString(6));
				h.setDescription(rs.getString(7));
				list.add(h);
			}													    										
			con.close();
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	public static List<Hospital> getRecordsbyCity(String city){
		List<Hospital> list = new ArrayList<Hospital>();
		try{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT * from hospitaldb WHERE city=?");
			ps.setString(1, city);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Hospital h=new Hospital();
				h.setId(rs.getInt(1));
				h.setName(rs.getString(2));
				h.setAddress(rs.getString(3));
				h.setCity(rs.getString(4));
				h.setState(rs.getString(5));
				h.setPhone(rs.getString(6));
				h.setDescription(rs.getString(7));
				list.add(h);
			}
			con.close();
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	public static List<Hospital> getRecordsbyStart(String start){
		List<Hospital> list = new ArrayList<Hospital>();
		try{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT * form hospitaldb WHERE name LIKE '"+start+"%' ");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Hospital h=new Hospital();
				h.setId(rs.getInt(1));
				h.setName(rs.getString(2));
				h.setAddress(rs.getString(3));
				h.setCity(rs.getString(4));
				h.setState(rs.getString(5));
				h.setPhone(rs.getString(6));
				h.setDescription(rs.getString(7));
				list.add(h);
			}
			con.close();
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	public static List<String> getStates(){
		List<String> list = new ArrayList<String>();
		try{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT DISTINCT state from hospitaldb");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				list.add(rs.getString(1));
			}
			con.close();
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	public static List<String> getCities(){
		List<String> list = new ArrayList<String>();
		try{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT DISTINCT city from hospitaldb");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				list.add(rs.getString(1));
			}
			con.close();
		}catch(Exception e){System.out.println(e);}
		return list;
	}
	
	public static Hospital getHospital(String id){
		Hospital hospital = new Hospital();
		try{
			Connection con = DBConnection.getCon();
			//int hospid = Integer.parseInt(id);
			PreparedStatement ps = con.prepareStatement("SELECT * FROM hospitaldb WHERE id=?");
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			hospital.setId(Integer.parseInt(id));
			hospital.setName(rs.getString("name"));
			hospital.setAddress(rs.getString("address"));
			hospital.setCity(rs.getString("city"));
			hospital.setState(rs.getString("state"));
			hospital.setPhone(rs.getString("phone"));
			con.close();
		}catch(Exception e){System.out.println(e);}
		return hospital;
	}
	
}
