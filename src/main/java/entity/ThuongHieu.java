package entity;

public class ThuongHieu {
	
	//properties
	private int thuongHieuId;
	private String name;
	
	//constructors
	public ThuongHieu(int thuongHieuId, String name) {
		super();
		this.thuongHieuId = thuongHieuId;
		this.name = name;
	}
	
	//getters & setters
	public int getThuongHieuId() {
		return thuongHieuId;
	}
	public void setThuongHieuId(int thuongHieuId) {
		this.thuongHieuId = thuongHieuId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	//toString
	@Override
	public String toString() {
		return "ThuongHieu [thuongHieuId=" + thuongHieuId + ", name=" + name + "]";
	}
	
}
