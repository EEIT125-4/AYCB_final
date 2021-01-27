package product.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import blog.model.Blog;
import member.MemberBean;
import video.model.Video;

@Entity
@Table(name = "Collect")
public class CollectBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cid;
	private Integer mid;
	private Integer pid;
	private Integer bid;
	private Integer vid;
	

	@Transient
	@ManyToOne
	@JoinColumn(name="mid")
	MemberBean mcollect;
	
	@Transient
	@ManyToOne
	@JoinColumn(name="pid")
	ProductBean pcollect;
	
	@Transient
	@ManyToOne
	@JoinColumn(name="bid")
	Blog bcollect;
	
	@Transient
	@ManyToOne
	@JoinColumn(name="vid")
	Video vcollect;

	public CollectBean() {
		super();
	}


	public CollectBean(Integer mid, Integer pid, Integer bid) {
		super();
		this.mid = mid;
		this.pid = pid;
		this.bid = bid;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CollectBean [cid=");
		builder.append(cid);
		builder.append(", mid=");
		builder.append(mid);
		builder.append(", pid=");
		builder.append(pid);
		builder.append(", bid=");
		builder.append(bid);
		builder.append(", mcollect=");
		builder.append(mcollect);
		builder.append(", pcollect=");
		builder.append(pcollect);
		builder.append("]");
		return builder.toString();
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public MemberBean getMcollect() {
		return mcollect;
	}

	public void setMcollect(MemberBean mcollect) {
		this.mcollect = mcollect;
	}

	public ProductBean getPcollect() {
		return pcollect;
	}

	public void setPcollect(ProductBean pcollect) {
		this.pcollect = pcollect;
	}
	public Integer getBid() {
		return bid;
	}

	public void setBid(Integer bid) {
		this.bid = bid;
	}


	public Integer getVid() {
		return vid;
	}


	public void setVid(Integer vid) {
		this.vid = vid;
	}


	public Blog getBcollect() {
		return bcollect;
	}


	public void setBcollect(Blog bcollect) {
		this.bcollect = bcollect;
	}


	public Video getVcollect() {
		return vcollect;
	}


	public void setVcollect(Video vcollect) {
		this.vcollect = vcollect;
	}
	
	
}
