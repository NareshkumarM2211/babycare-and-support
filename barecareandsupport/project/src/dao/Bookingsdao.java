package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.Booking;
import dbconnection.DBConnection;

public class Bookingsdao {
	
	public static Booking getBooking(String id){
		Booking booking = new Booking();
		try{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM bookingdb WHERE id=?");
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			booking.setPname(rs.getString("pname"));
			booking.setPcname(rs.getString("pcname"));
			booking.setPcage(rs.getString("pcage"));
			booking.setPdate(rs.getString("pdate"));
			booking.setPphone(rs.getString("pphone"));
			booking.setPreason(rs.getString("preason"));
			booking.setHname(rs.getString("hname"));
			booking.setHphone(rs.getString("hphone"));
			booking.setId(Integer.parseInt(id));
			con.close();
		}catch(Exception e){System.out.println(e);}
		return booking;
	}
	
	public static void insertBooking(Booking booking){
		try{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("INSERT INTO bookingdb (id, pname, pcname, pcage, pdate, pphone, preason, hname, hphone) VALUES (?,?,?,?,?,?,?,?,?)"); 
			ps.setString(1, String.valueOf(booking.getId()));
			ps.setString(2, booking.getPname());
			ps.setString(3, booking.getPcname());
			ps.setString(4, booking.getPcage());
			ps.setString(5, booking.getPdate());
			ps.setString(6, booking.getPphone());
			ps.setString(7, booking.getPreason());
			ps.setString(8, booking.getHname());
			ps.setString(9, booking.getHphone());
			ps.executeUpdate();
			con.close();
		}catch(Exception e){System.out.println(e);}
	}
	
	public static int getID(){
		int id = 0;
		try{
			Connection con = DBConnection.getCon();
			PreparedStatement ps = con.prepareStatement("SELECT id FROM bookingdb");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				id = Integer.parseInt(rs.getString("id"));
			}
			id += 1;
			con.close();
		}catch(Exception e){System.out.println(e);}
		return id;
	}
}
