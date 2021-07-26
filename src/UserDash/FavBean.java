package UserDash;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="favvendors")
public class FavBean 
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
    @Column(name="uid",length=100)
    String uid;
	
	
    @Column(name="vid",length=100)
    String vid;
	
    
    @Column(name="service",length=100)
    String service;


	public FavBean(String uid, String vid, String service) {
		super();
		this.uid = uid;
		this.vid = vid;
		this.service = service;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getVid() {
		return vid;
	}


	public void setVid(String vid) {
		this.vid = vid;
	}


	public String getService() {
		return service;
	}


	public void setService(String service) {
		this.service = service;
	}

    

	
    
}
