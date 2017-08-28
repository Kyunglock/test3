package reply;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.Board;

//회원데이터베이스 테이블에 접근할 수 있도록 돕는 클래스 데이터베이스 데이터 넣고 빼기
public class ReplyDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ReplyDAO() {
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

	
	public int write(int itemNum, String replyContent, String replyUserID) {
		String SQL = "INSERT INTO reply VALUES(null, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, itemNum);
			pstmt.setString(2, replyContent);
			pstmt.setInt(3, 0);
			pstmt.setString(4, replyUserID);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return -1;		//데이터베이스 오류
	}
	
	public boolean check_id(String userID)
	{
		String SQL = "SELECT userID FROM USER WHERE userID = ?";
		boolean x= false;
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) x=true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}
	
	public ArrayList<Reply> getList(int itemNum) {	
		String SQL = "SELECT * FROM reply WHERE itemNum = ? ORDER BY itemNum DESC";
		ArrayList<Reply> list = new ArrayList<Reply>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, itemNum);
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				Reply reply = new Reply();
				reply.setReplyNum(rs.getInt(1));
				reply.setItemNum(rs.getInt(2));
				reply.setReplyContent(rs.getString(3));
				reply.setReplyRoom(rs.getInt(4));
				reply.setReplyUserID(rs.getString(5));
				list.add(reply);
			}
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return list;
	}
}
