package admin;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="function")
public class AdminBean 
{
      @Id
      @Column(name="functions",length=30)
      String functions;
      
      @Column(name="events",length=200)
      String events;

	public AdminBean(String functions, String events) {
		super();
		this.functions = functions;
		this.events = events;
	}

	public String getFunction() {
		return functions;
	}

	public void setFunction(String functions) {
		this.functions = functions;
	}

	public String getEvents() {
		return events;
	}

	public void setEvents(String events) {
		this.events = events;
	}
      
      
      
}
