package event.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import member.MemberBean;

@Entity
@Table

public class Record {

	@Id

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer recordid;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member")
	private MemberBean member;
	
	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "event")
	private Event event;
	
	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	private String recorddesc;

	public Integer getRecordid() {
		return recordid;
	}

	public void setRecordid(Integer recordid) {
		this.recordid = recordid;
	}

	



	public String getDesc() {
		return recorddesc;
	}

	public void setDesc(String desc) {
		this.recorddesc = desc;
	}

	public Record() {
	};

	public Record(Integer recordid, MemberBean member, Event event, String desc) {
		super();
		this.recordid = recordid;
		this.member = member;
		this.event = event;
		this.recorddesc = desc;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Record [recordid=");
		builder.append(recordid);
		builder.append(", member=");
		builder.append(member);
		builder.append(", event=");
		builder.append(event);
		builder.append(", desc=");
		builder.append(recorddesc);
		builder.append("]");
		return builder.toString();
	}

}