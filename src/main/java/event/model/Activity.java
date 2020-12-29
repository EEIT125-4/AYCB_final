package event.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Activity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer activityid;
	@Column(columnDefinition = "nvarchar(max)")
	String activityname;
	
	java.sql.Date date;
	
	public Activity() {}

	public Activity(Integer activityid, String activityname,java.sql.Date batchtime) {
		super();
		this.activityid = activityid;
		this.activityname = activityname;
		this.date = batchtime;
	}

	public Integer getActivityid() {
		return activityid;
	}

	public void setActivityid(Integer activityid) {
		this.activityid = activityid;
	}

	public String getActivityname() {
		return activityname;
	}

	public void setActivityname(String activityname) {
		this.activityname = activityname;
	}

	public java.sql.Date getDate() {
		return date;
	}
	

	public void setDate(java.sql.Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Activity [activityid=");
		builder.append(activityid);
		builder.append(", activityname=");
		builder.append(activityname);
		builder.append(", date=");
		builder.append(date);
		builder.append("]");
		return builder.toString();
	}
	

	
	
	
}
