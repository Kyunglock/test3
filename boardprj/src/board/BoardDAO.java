package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection conn;
	private ResultSet rs;
	private ResultSet rs2;
	public BoardDAO() {
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
	
	public String getDate() //현재시간
	{
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next() ) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return "";		
	}

	public int getNext() //현재시간
	{
		String SQL = "SELECT MAX(itemNum) as room FROM board_item";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next() ) {
				int i =rs.getInt(1) / 10;
				i++;
				return i;
			}
			return -2;
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return 1;		
	}
	
	public int write(String itemTitle, String madeUserID, String ITEMCONTENT, String itemImage) {
		String SQL = "INSERT INTO BOARD_ITEM VALUES(?, null, ?, ?, now(), ?, 0, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, madeUserID);
			pstmt.setString(2, ITEMCONTENT);
			pstmt.setInt(3, getNext());
			pstmt.setString(4, itemTitle);
			pstmt.setString(5, itemImage);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return -1;		//데이터베이스 오류
	}
	
	public ArrayList<Board> getList(int item_Room) {	
		String SQL = "SELECT * FROM board_item WHERE itemRoom = ? ORDER BY itemNum DESC";
		ArrayList<Board> list = new ArrayList<Board>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, item_Room);
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				Board board = new Board();
				board.setMadeUserID(rs.getString(1));
				board.setItemNum(rs.getInt(2));
				board.setITEMCONTENT(rs.getString(3));
				board.setItemProduced(rs.getDate(5));
				board.setItemTitle(rs.getString(6));
				board.setJoinCount(rs.getInt(7));
				board.setItemImage(rs.getString(8));
				list.add(board);
			}
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return list;
	}
	
	public Board getBoard(int itemNum) {
		String SQL= "SELECT * FROM board_item WHERE itemNum = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, itemNum);
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				Board board = new Board();
				board.setMadeUserID(rs.getString(1));
				board.setItemNum(rs.getInt(2));
				board.setITEMCONTENT(rs.getString(3));
				board.setItemProduced(rs.getDate(5));
				board.setItemTitle(rs.getString(6));
				board.setJoinCount(rs.getInt(7));
				board.setItemImage(rs.getString(8));
				return board;
			}
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return null;
		
	}
	
	public int getRoom() {
		String SQL = "SELECT MAX(itemRoom) AS ROOM FROM BOARD_ITEM";
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
	//조회수 기능
	public void joinCount(int itemNum, int joinCount)
	{ 
		String SQL = "UPDATE BOARD_ITEM SET joinCount=? WHERE itemNum=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, joinCount);
			pstmt.setInt(2, itemNum);			
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int reUpdate(int itemNum, String ITEMCONTENT, String itemTitle)
	{
		String SQL = "UPDATE BOARD_ITEM SET ITEMCONTENT=?, itemTitle=? WHERE itemNum=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			pstmt.setString(1, ITEMCONTENT);
			pstmt.setString(2, itemTitle);	
			pstmt.setInt(3, itemNum);
			pstmt.executeUpdate();
			return 0;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int deleteItem(int itemNum)
	{
		String SQL = "DELETE FROM board_item WHERE itemNum =?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);			
			pstmt.setInt(1, itemNum);
			pstmt.executeUpdate();			
			return 0;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
