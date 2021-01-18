package event.model;

import java.sql.Blob;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;



import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name = "Event")
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer eventid;
	@Column(columnDefinition = "nvarchar(max)")
	private String eventname;
	private String eventcategory;
	private String eventdate;
	private String eventlocation;
	private String eventdescription;
	private String host;
	private String hostphone;
	private String filename;
	private Blob eventimg;
	private Integer pax;
	private Integer totalpax;
	
	@Transient
	MultipartFile eventimage;
	
	
	public Event(Integer eventid, String eventname, String eventcategory, String eventdate, String eventlocation,
			String eventdescription, String host, String hostphone, String filename, Blob eventimg, Integer pax,
			Integer totalpax, MultipartFile eventimage) {
		super();
		this.eventid = eventid;
		this.eventname = eventname;
		this.eventcategory = eventcategory;
		this.eventdate = eventdate;
		this.eventlocation = eventlocation;
		this.eventdescription = eventdescription;
		this.host = host;
		this.hostphone = hostphone;
		this.filename = filename;
		this.eventimg = eventimg;
		this.pax = pax;
		this.totalpax = totalpax;
		this.eventimage = eventimage;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Event [eventid=");
		builder.append(eventid);
		builder.append(", eventname=");
		builder.append(eventname);
		builder.append(", eventcategory=");
		builder.append(eventcategory);
		builder.append(", eventdate=");
		builder.append(eventdate);
		builder.append(", eventlocation=");
		builder.append(eventlocation);
		builder.append(", eventdescription=");
		builder.append(eventdescription);
		builder.append(", host=");
		builder.append(host);
		builder.append(", hostphone=");
		builder.append(hostphone);
		builder.append(", filename=");
		builder.append(filename);
		builder.append(", eventimg=");
		builder.append(eventimg);
		builder.append(", pax=");
		builder.append(pax);
		builder.append(", totalpax=");
		builder.append(totalpax);
		builder.append(", eventimage=");
		builder.append(eventimage);
		builder.append("]");
		return builder.toString();
	}


	public Integer getEventid() {
		return eventid;
	}


	public void setEventid(Integer eventid) {
		this.eventid = eventid;
	}


	public String getEventname() {
		return eventname;
	}


	public void setEventname(String eventname) {
		this.eventname = eventname;
	}


	public String getEventcategory() {
		return eventcategory;
	}


	public void setEventcategory(String eventcategory) {
		this.eventcategory = eventcategory;
	}


	public String getEventdate() {
		return eventdate;
	}


	public void setEventdate(String eventdate) {
		this.eventdate = eventdate;
	}


	public String getEventlocation() {
		return eventlocation;
	}


	public void setEventlocation(String eventlocation) {
		this.eventlocation = eventlocation;
	}


	public String getEventdescription() {
		return eventdescription;
	}


	public void setEventdescription(String eventdescription) {
		this.eventdescription = eventdescription;
	}


	public String getHost() {
		return host;
	}


	public void setHost(String host) {
		this.host = host;
	}


	public String getHostphone() {
		return hostphone;
	}


	public void setHostphone(String hostphone) {
		this.hostphone = hostphone;
	}


	public String getFilename() {
		return filename;
	}


	public void setFilename(String filename) {
		this.filename = filename;
	}


	public Blob getEventimg() {
		return eventimg;
	}


	public void setEventimg(Blob eventimg) {
		this.eventimg = eventimg;
	}


	public Integer getPax() {
		return pax;
	}


	public void setPax(Integer pax) {
		this.pax = pax;
	}


	public Integer getTotalpax() {
		return totalpax;
	}


	public void setTotalpax(Integer totalpax) {
		this.totalpax = totalpax;
	}


	public MultipartFile getEventimage() {
		return eventimage;
	}


	public void setEventimage(MultipartFile eventimage) {
		this.eventimage = eventimage;
	}


	public Event() {
		super();
		
	}
	

	
}

   
   

