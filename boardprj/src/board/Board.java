package board;

import java.util.Date;

public class Board {

	private String madeUserID;
	private String ITEMCONTENT;
	private int itemRoom;
	private Date itemProduced;
	private String itemTitle;
	private int joinCount;
	private int itemNum;
	private String itemImage;
	
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}
	
	
	public int getItemNum() {
		return itemNum;
	}
	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}
	public int getJoinCount() {
		return joinCount;
	}
	public void setJoinCount(int joinCount) {
		this.joinCount = joinCount;
	}
	public String getItemTitle() {
		return itemTitle;
	}
	public void setItemTitle(String itemTitle) {
		this.itemTitle = itemTitle;
	}
	public String getMadeUserID() {
		return madeUserID;
	}
	public void setMadeUserID(String madeUserID) {
		this.madeUserID = madeUserID;
	}
	public String getITEMCONTENT() {
		return ITEMCONTENT;
	}
	public void setITEMCONTENT(String iTEMCONTENT) {
		ITEMCONTENT = iTEMCONTENT;
	}
	public int getItemRoom() {
		return itemRoom;
	}
	public void setItemRoom(int itemRoom) {
		this.itemRoom = itemRoom;
	}
	public Date getItemProduced() {
		return itemProduced;
	}
	public void setItemProduced(Date itemProduced) {
		this.itemProduced = itemProduced;
	}
}
