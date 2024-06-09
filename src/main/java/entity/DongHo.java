package entity;


public class DongHo {
	private int maDH;
	private String tenDH;
	private float giaBan;
	private int soLuong = 1;
	private String moTa;
	private int thuongHieuId;
	private String hinhAnh;
	
	public DongHo(int maDH, String tenDH, float giaBan, int soLuong, String moTa, int thuongHieuId,
			String hinhAnh) {
		super();
		this.maDH = maDH;
		this.tenDH = tenDH;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
		this.moTa = moTa;
		this.thuongHieuId = thuongHieuId;
		this.hinhAnh = hinhAnh;
	}

	public DongHo(int maDH, String tenDH, float giaBan, String hinhAnh) {
		super();
		this.maDH = maDH;
		this.tenDH = tenDH;
		this.giaBan = giaBan;
		this.hinhAnh = hinhAnh;
	}
	
	public DongHo(String tenDH, float giaBan, String moTa, String hinhAnh) {
		super();
		this.tenDH = tenDH;
		this.giaBan = giaBan;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
	}
	public DongHo(String tenDH, float giaBan, String hinhAnh) {
		super();
		this.tenDH = tenDH;
		this.giaBan = giaBan;
		this.hinhAnh = hinhAnh;
	}
	public DongHo(String tenDH, float giaBan, String moTa, int thuongHieuId, String hinhAnh) {
		super();
		this.tenDH = tenDH;
		this.giaBan = giaBan;
		this.moTa = moTa;
		this.thuongHieuId = thuongHieuId;
		this.hinhAnh = hinhAnh;
	}
	

	

	public DongHo(String tenDH, float giaBan, int soLuong, String moTa, int thuongHieuId, String hinhAnh) {
		super();
		this.tenDH = tenDH;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
		this.moTa = moTa;
		this.thuongHieuId = thuongHieuId;
		this.hinhAnh = hinhAnh;
	}

	public int getMaDH() {
		return maDH;
	}

	public void setMaDH(int maDH) {
		this.maDH = maDH;
	}

	public String getTenDH() {
		return tenDH;
	}

	public void setTenDH(String tenDH) {
		this.tenDH = tenDH;
	}

	public float getGiaBan() {
		return giaBan;
	}

	public void setGiaBan(float giaBan) {
		this.giaBan = giaBan;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public int getThuongHieuId() {
		return thuongHieuId;
	}

	public void setThuongHieuId(int thuongHieuId) {
		this.thuongHieuId = thuongHieuId;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	@Override
	public String toString() {
		return "DongHoBanChay [maDH=" + maDH + ", tenDH=" + tenDH + ", giaBan=" + giaBan + ", soLuong=" + soLuong
				+ ", moTa=" + moTa + ", thuongHieuId=" + thuongHieuId + ", hinhAnh=" + hinhAnh + "]";
	}
	
	
	
}