package user;

import java.util.Date;

public class User {
	
	private String userID;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userEmail;
	private Date in_year;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getIn_year() {
		return in_year;
	}
	public void setIn_year(Date in_year) {
		this.in_year = in_year;
	}
	

}
