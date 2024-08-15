package pkg1;

public class User {
	private int uid;
	private String fullName; 
	private String email;
	private String phone;
	private String loginName;
	private String loginPassword;
	private String userType;
	
	public User() {
		this.uid = 0;
		this.fullName = "";
		this.email = "";
		this.phone = "";
		this.loginName = "";
		this.loginPassword = "";
		this.userType = "";
	}
	
	public User(int uid, String fullName, String email, String phone, String loginName, String loginPassword,
			String userType) {
		this.uid = uid;
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.loginName = loginName;
		this.loginPassword = loginPassword;
		this.userType = userType;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", fullName=" + fullName + ", email=" + email + ", phone=" + phone + ", loginName="
				+ loginName + ", loginPassword=" + loginPassword + ", userType=" + userType + "]";
	}
}
