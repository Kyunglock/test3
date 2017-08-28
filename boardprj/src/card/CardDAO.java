package card;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CardDAO {
	private Connection conn;
	private ResultSet rs;
	public CardDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/kkldb";
			String dbID = "root";
			String dbPassword = "qwer1234";
			Class.forName("com.mysql.jdbc.Driver");//mysql에 접속할 수 있도록 도와주는 하나의 라이브러리
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int getCountGeneral() {
		String SQL = "SELECT count(cardimp) AS cardNum FROM cardItem WHERE cardimp = 'general' order by cardimp";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next() ) {				
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
				
	}
	public int getCountRare() {
		String SQL = "SELECT count(cardimp) AS cardNum FROM cardItem WHERE cardimp = 'rare' order by cardimp";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next() ) {				
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int randomRange(int n1, int n2) {
		return (int)(Math.random() * (n2 - n1 +1)) + n1;
	}
	public int getCountChoRare() {
		String SQL = "SELECT count(cardimp) AS cardNum FROM cardItem WHERE cardimp = 'chorare' order by cardimp";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next() ) {				
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int getCountInfinity() {
		String SQL = "SELECT count(cardimp) AS cardNum FROM cardItem WHERE cardimp = 'Infinity' order by cardimp";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next() ) {				
				return rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

}
