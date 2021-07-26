package UserDash;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="signuptable")
public class loginBean 
{
	@Id
	@Column(name="uid",length=100)
    String uid;
	
	@Column(name="pwd",length=100)
    String pwd;
	
	@Column(name="type",length=100)
    String type;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public loginBean(String uid, String pwd, String type) {
		super();
		this.uid = uid;
		this.pwd = pwd;
		this.type = type;
	}
	
	public loginBean(){}
}
