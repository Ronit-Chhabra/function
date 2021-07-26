package UserDash;

public class VendorFetchBean 
{
    String uid,name,mobile,firm,est,address,city,site,function,service,pwork,pic1,pic2;

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

	public VendorFetchBean()
	{
		
	}
	
	public VendorFetchBean(String uid, String name, String mobile, String firm, String est, String address, String city,String site, String function, String service, String pwork, String pic1, String pic2) {
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
    
}
