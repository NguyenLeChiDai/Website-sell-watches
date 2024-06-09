package entity;

public class ChiTietDongHo {
  private String SuatXu;
  private String hangSX;
  private String thoiHanBaoHanh;
  private String loai;
  private String moTa;
public ChiTietDongHo(String suatXu, String hangSX, String thoiHanBaoHanh, String loai, String moTa) {
	super();
	this.SuatXu = suatXu;
	this.hangSX = hangSX;
	this.thoiHanBaoHanh = thoiHanBaoHanh;
	this.loai = loai;
	this.moTa = moTa;
}
public String getSuatXu() {
	return SuatXu;
}
public void setSuatXu(String suatXu) {
	this.SuatXu = suatXu;
}
public String getHangSX() {
	return hangSX;
}
public void setHangSX(String hangSX) {
	this.hangSX = hangSX;
}
public String getThoiHanBaoHanh() {
	return thoiHanBaoHanh;
}
public void setThoiHanBaoHanh(String thoiHanBaoHanh) {
	this.thoiHanBaoHanh = thoiHanBaoHanh;
}
public String getLoai() {
	return loai;
}
public void setLoai(String loai) {
	this.loai = loai;
}
public String getMoTa() {
	return moTa;
}
public void setMoTa(String moTa) {
	this.moTa = moTa;
}
@Override
public String toString() {
	return "ChiTietDongHo [suatXu=" + SuatXu + ", hangSX=" + hangSX + ", thoiHanBaoHanh=" + thoiHanBaoHanh + ", loai="
			+ loai + ", moTa=" + moTa + "]";
}
  
}
