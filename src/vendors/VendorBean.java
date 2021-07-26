package vendors;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="vendorinfo")
public class VendorBean 
{
    @Id
    @Column(name="uid",length=30)
    String uid;
    
    @Column(name="name",length=30)
    String name;
    
    @Column(name="mobile",length=30)
    String mobile;
    
    @Column(name="firm",length=30)
    String firm;
    
    @Column(name="est",length=30)
    String est;
    
    @Column(name="address",length=30)
    String address;
    
    @Column(name="city",length=30)
    String city;
    
    @Column(name="site",length=30)
    String site;
    
    @Column(name="function",length=30)
    String function;
    
    @Column(name="service",length=30)
    String service;
    
    @Column(name="pwork",length=30)
    String pwork;
    
    @Column(name="pic1",length=300)
    String pic1;
    
    @Column(name="pic2",length=300)
    String pic2;

    public VendorBean()
    {
    	
    }
    
	public VendorBean(String uid, String name, String mobile, String firm, String est, String address, String city,
			String site, String function, String service, String pwork, String pic1, String pic2) {
		super();
		this.uid = uid;
		this.name = name;
		this.mobile = mobile;
		this.firm = firm;
		this.est = est;
		this.address = address;
		this.city = city;
		this.site = site;
		this.function = function;
		this.service = service;
		this.pwork = pwork;
		this.pic1 = pic1;
		this.pic2 = pic2;
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

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getFirm() {
		return firm;
	}

	public void setFirm(String firm) {
		this.firm = firm;
	}

	public String getEst() {
		return est;
	}

	public void setEst(String est) {
		this.est = est;
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

	public String getSite() {
		return site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getPwork() {
		return pwork;
	}

	public void setPwork(String pwork) {
		this.pwork = pwork;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
    
    
}
