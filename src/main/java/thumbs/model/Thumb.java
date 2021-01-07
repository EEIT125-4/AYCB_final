package thumbs.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import member.MemberBean;

@Entity
@Table
public class Thumb {
	
	
	private String category;
	private MemberBean member;
	private Integer pk;
	
	
	
	

}
