package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//회원데이터베이스 테이블에 접근할 수 있도록 돕는 클래스 데이터베이스 데이터 넣고 빼기
public class UserInven {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserInven() {
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
	public User getUser(String userID) {
		String SQL= "SELECT * FROM USER WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				User user = new User();
				user.setUserID(rs.getString(1));
				user.setUserName(rs.getString(2));
				return user;
			}
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return null;
	}
	//소유한 카드 수량 구하기 
	public int getAmount(int getCardNum, String userID) {
		String SQL = "SELECT MAX(cardAmount) AS cardAmount FROM userInven WHERE getCardNum = ? AND getUserID = ?";
		try
		{			
			pstmt = conn.prepareStatement(SQL);			
			pstmt.setInt(1,  getCardNum);
			pstmt.setString(2,  userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return -1;
				
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int existCard(int getCardNum, String getUserID) {
		String SQL = "SELECT getCardNum, cardAmount FROM userInven WHERE getUserID = ? and getCardnum = ?";
		try
		{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, getUserID);
			pstmt.setInt(2, getCardNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1) == getCardNum) {
					return 1;
				}
				else return 0;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return 0;
	}
	public int gethenceCard(int getCardNum, String getUserID) {
		String SQL = "SELECT distinct getCardNum, hence FROM userInven WHERE getUserID = ? and getCardnum = ?";
		try
		{
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, getUserID);
			pstmt.setInt(2, getCardNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt(1) == getCardNum) {
					return rs.getInt("hence");
				}
				else return 0;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return 0;
	}
	public int henceProcPlus(int getCardNum, String getUserID) {
		String SQL = "UPDATE userInven SET hence = ? WHERE getCardNum =? AND getUserID=?";
		try
		{
			int i = gethenceCard(getCardNum, getUserID);
			i++;
			pstmt = conn.prepareStatement(SQL);			
			pstmt.setInt(1, i);
			pstmt.setInt(2, getCardNum);
			pstmt.setString(3, getUserID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return 0;
	}
	//카드 아이템 넣기
	public int getCard(int getCardNum, String userID) {
		String cardSQL = "SELECT * FROM cardItem WHERE cardNum = ?";
		String cardName="";
		String cardimp="";
		try {
			pstmt = conn.prepareStatement(cardSQL);
			pstmt.setInt(1, getCardNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cardName = rs.getString(2);
				cardimp = rs.getString(3);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String SQL = "INSERT INTO userInven VALUES(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getCardNum);
			pstmt.setString(2, cardName);
			pstmt.setString(3, cardimp);
			if(getAmount(getCardNum, userID) == 0 ) {
				pstmt.setInt(4, 1);
			}
			else {
				pstmt.setInt(4, getAmount(getCardNum, userID));
			}			
			pstmt.setString(5, userID);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}		
		return -1;		
	}
	//강화실패시 삭제
	public int deleteItem(int cardNum, String userID)
	{
		
		String SQL = "DELETE FROM userInven WHERE getCardNum = ? and getUserID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			pstmt.setInt(1, cardNum);
			pstmt.setString(2, userID);
			
			pstmt.executeUpdate();			
			return 0;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

}
