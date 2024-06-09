package entity;


public class GioHang {

	//properties
	private DongHo dongho;
	private int soLuong;

	public GioHang(DongHo dongho, int soLuong) {
		super();
		this.dongho = dongho;
		this.soLuong = soLuong;
	}
	public GioHang() {
		super();
	}
	public DongHo getDongho() {
		return dongho;
	}
	public void setDongho(DongHo dongho) {
		this.dongho = dongho;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	@Override
	public String toString() {
		return "GioHang [dongho=" + dongho + ", soLuong=" + soLuong + "]";
	}
	
	

	
	
	
}
