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
	private String eventdate;
	private String eventlocation;
	private String eventdescription;
	private String host;
	private String hostphone;
	private String filename;
	private Blob eventimg;
	private String pax;
	@Transient
	MultipartFile eventimage;
	
//	@OneToOne(mappedBy = "event")
//	Attendance attendance;

	
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

	public String getPax() {
		return pax;
	}

	public void setPax(String pax) {
		this.pax = pax;
	}

	public MultipartFile getEventimage() {
		return eventimage;
	}

	public void setEventimage(MultipartFile eventimage) {
		this.eventimage = eventimage;
	}

//	public Attendance getAttendance() {
//		return attendance;
//	}
//
//	public void setAttendance(Attendance attendance) {
//		this.attendance = attendance;
//	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Event [eventid=");
		builder.append(eventid);
		builder.append(", eventname=");
		builder.append(eventname);
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
		builder.append(", eventimage=");
		builder.append(eventimage);
		return builder.toString();
	}

	public Event(Integer eventid, String eventname, String eventdate, String eventlocation, String eventdescription,
			String host, String hostphone, String filename, Blob eventimg, String pax, MultipartFile eventimage
			) {
		super();
		this.eventid = eventid;
		this.eventname = eventname;
		this.eventdate = eventdate;
		this.eventlocation = eventlocation;
		this.eventdescription = eventdescription;
		this.host = host;
		this.hostphone = hostphone;
		this.filename = filename;
		this.eventimg = eventimg;
		this.pax = pax;
		this.eventimage = eventimage;
//		this.attendance = attendance;
	}

	public Event() {
		super();
		
	}

	
//	@ManyToOne
//    @JoinColumn(name="AId")
//	private Attendance attendance;
//	
	
	
}

   
   

