package product.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Favorite")
public class favorite {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer fid;
	private Integer mid;
	private Integer pid;
	
	public favorite() {
		super();
	}

	public favorite(Integer fid, Integer mid, Integer pid) {
		super();
		this.fid = fid;
		this.mid = mid;
		this.pid = pid;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("favorite [fid=");
		builder.append(fid);
		builder.append(", mid=");
		builder.append(mid);
		builder.append(", pid=");
		builder.append(pid);
		builder.append("]");
		return builder.toString();
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
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
	
}
