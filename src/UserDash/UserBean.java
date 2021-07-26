package UserDash;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="userinfo")
public class UserBean 
{
    @Id
    @Column(name="uid",length=20)
    String uid;
    
    @Column(name="name",length=20)
    String name;
    
    @Column(name="phone",length=20)
    String phone;
    
    @Column(name="address",length=40)
    String address;
    
    @Column(name="city",length=20)
    String city;
    
    @Column(name="state",length=20)
    String state;
    
    @Column(name="code",length=20)
    String code;
    
    @Column(name="pic",length=200)
    String pic;

    public UserBean(){}
    
	public UserBean(String uid, String name, String phone, String address, String city, String state, String code,
			String pic) {
		super();
		this.uid = uid;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.city = city;
		this.state = state;
		this.code = code;
		this.pic = pic;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
    
    
    
}
