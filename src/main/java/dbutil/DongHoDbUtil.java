package dbutil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import entity.DongHo;
import entity.GioHang;
import entity.ThuongHieu;


public class DongHoDbUtil {
	private DataSource dataSource;

	public DongHoDbUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	public List<DongHo> getALLDongHo() {
	    List<DongHo> dsDongHo = new ArrayList<DongHo>();
	    Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet result = null;

	    try {
	        connection = dataSource.getConnection();
	        String sqlQuery = "SELECT * FROM DongHo";
	        statement = connection.prepareStatement(sqlQuery);
	        result = statement.executeQuery();

	        while (result.next()) {
	            int maDH = result.getInt("maDH");
	            String tenDH = result.getString("tenDH");
	            float giaBan = result.getFloat("giaBan");
	            int soLuong = result.getInt("soLuong");
	            String moTa = result.getString("moTa");
	            int thuongHieuId = result.getInt("thuongHieuId");
	            String hinhAnh = result.getString("hinhAnh");

	            DongHo dongho = new DongHo(maDH, tenDH, giaBan,soLuong, moTa, thuongHieuId, hinhAnh);
	            dsDongHo.add(dongho);
	        }
	        return dsDongHo;
	    } catch (Exception e) {
	        // Xử lý ngoại lệ ở đây
	    } finally {
	        close(connection, statement, result);
	    }
	    return dsDongHo;
	}

	public List<DongHo> getALLDongHoNam() {
	    List<DongHo> dsDongHo = new ArrayList<DongHo>();
	    Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet result = null;

	    try {
	        connection = dataSource.getConnection();
	        String sqlQuery = "SELECT * FROM DongHo WHERE tenDH LIKE ?";
	        statement = connection.prepareStatement(sqlQuery);
	        statement.setString(1, "%nam%");
	        result = statement.executeQuery();

	        while (result.next()) {
	            int maDH = result.getInt("maDH");
	            String tenDH = result.getString("tenDH");
	            float giaBan = result.getFloat("giaBan");
	            int soLuong = result.getInt("soLuong");
	            String moTa = result.getString("moTa");
	            int thuongHieuId = result.getInt("thuongHieuId");
	            String hinhAnh = result.getString("hinhAnh");

	            DongHo dongho = new DongHo(maDH, tenDH, giaBan,soLuong, moTa, thuongHieuId, hinhAnh);
	            dsDongHo.add(dongho);
	        }
	        return dsDongHo;
	    } catch (Exception e) {
	        // Xử lý ngoại lệ ở đây
	    } finally {
	        close(connection, statement, result);
	    }
	    return dsDongHo;
	}
	
	public List<DongHo> getALLDongHoNu() {
	    List<DongHo> dsDongHo = new ArrayList<DongHo>();
	    Connection connection = null;
	    PreparedStatement statement = null;
	    ResultSet result = null;

	    try {
	        connection = dataSource.getConnection();
	        String sqlQuery = "SELECT * FROM DongHo WHERE tenDH LIKE ?";
	        statement = connection.prepareStatement(sqlQuery);
	        statement.setString(1, "%nữ%");
	        result = statement.executeQuery();

	        while (result.next()) {
	            int maDH = result.getInt("maDH");
	            String tenDH = result.getString("tenDH");
	            float giaBan = result.getFloat("giaBan");
	            int soLuong = result.getInt("soLuong");
	            String moTa = result.getString("moTa");
	            int thuongHieuId = result.getInt("thuongHieuId");
	            String hinhAnh = result.getString("hinhAnh");

	            DongHo dongho = new DongHo(maDH, tenDH, giaBan,soLuong, moTa, thuongHieuId, hinhAnh);
	            dsDongHo.add(dongho);
	        }
	        return dsDongHo;
	    } catch (Exception e) {
	        // Xử lý ngoại lệ ở đây
	    } finally {
	        close(connection, statement, result);
	    }
	    return dsDongHo;
	}
		public void close(Connection myConn, Statement myStmt, ResultSet myRs) {
			try {
				if (myRs != null) {
					myRs.close(); }			
				if (myStmt != null) {
					myStmt.close();	}			
				if (myConn != null) {
					myConn.close();   
					// doesn't really close it ... just puts back in connection pool
				}
			}
			catch (Exception exc) {
				exc.printStackTrace();
			}
		}
		
		
		public DongHo getDongHo(String maDongHo) throws Exception {
			DongHo dongho = null;	
			Connection myConn = null;
			PreparedStatement myStmt = null;
			ResultSet myRs = null;
			try {
				
				// get connection to database
				myConn = dataSource.getConnection();
				// create sql to get selected product
				String sql = "Select * from DongHo where maDH = " + maDongHo;			
				// create prepared statement
				myStmt = myConn.prepareStatement(sql);					
				// execute statement
				myRs = myStmt.executeQuery();			
				// retrieve data from result set row
				if (myRs.next()) {
					int maDH = myRs.getInt("maDH");
					String tenDH = myRs.getString("tenDH");
					float giaBan = myRs.getFloat("giaBan");
					int soLuong = myRs.getInt("soLuong");
					String moTa = myRs.getString("moTa");
					int thuongHieuId = myRs.getInt("thuongHieuId");
					String hinhAnh = myRs.getString("hinhAnh");
					
					//đư ảnh từ csdl sql server lên đây
					
				 dongho = new DongHo(maDH,tenDH, giaBan,soLuong, moTa, thuongHieuId, hinhAnh);
				}
				else {
					throw new Exception("Could not find DongHo with maDH = " + maDongHo);	}							
				return dongho;
			}
			finally {
				// clean up JDBC objects
				close(myConn, myStmt, myRs);}
		}

		
		//update
		public void loadChiTiet(DongHo dongho) {
			Connection connection = null;
			PreparedStatement statement = null;
			try {
				connection = dataSource.getConnection();
				String sqlQuery = "UPDATE DongHo " + 
		                 "SET tenDH=?, giaBan=?, moTa=?, hinhAnh=? " +
		                 "WHERE maTT=?";
				statement = connection.prepareStatement(sqlQuery);
				statement.setString(1, dongho.getTenDH());
				statement.setFloat(2, dongho.getGiaBan());
				statement.setString(3, dongho.getMoTa());
				statement.setString(4, dongho.getHinhAnh()); 
				statement.setInt(5, dongho.getMaDH()); 
				statement.execute();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				close(connection, statement, null);
			}
		}
		
		public DongHo getDongHoByid(int maDH) {
			Statement state = null;
			ResultSet rs;
			Connection con;
			try {
				String sql = "Select * from DongHo where maDH = " + maDH;
				con = dataSource.getConnection();
				state = con.createStatement();
				rs = state.executeQuery(sql);
				while (rs.next()) {
					 int maDongHo = rs.getInt("maDH");
			            String tenDH = rs.getString("tenDH");
			            float giaBan = rs.getFloat("giaBan");
			            int soLuong = rs.getInt("soLuong");
			            String moTa = rs.getString("moTa");
			            int thuongHieuId = rs.getInt("thuongHieuId");
			            String hinhAnh = rs.getString("hinhAnh");

			            DongHo dongho = new DongHo(maDongHo, tenDH, giaBan,soLuong, moTa, thuongHieuId, hinhAnh);
			            return dongho;
			        }
			        
				
			} 
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return null;
		}
		
		
		//THEM SUA XOA
		public List<DongHo> getALLDongHoSortedByPriceAscending() {
		    List<DongHo> dsDongHo = new ArrayList<DongHo>();
		    Connection connection = null;
		    PreparedStatement statement = null;
		    ResultSet result = null;

		    try {
		        connection = dataSource.getConnection();
		        String sqlQuery = "SELECT * FROM DongHo ORDER BY giaBan ASC";
		        statement = connection.prepareStatement(sqlQuery);
		        result = statement.executeQuery();

		        while (result.next()) {
		            int maDH = result.getInt("maDH");
		            String tenDH = result.getString("tenDH");
		            float giaBan = result.getFloat("giaBan");
		            int soLuong = result.getInt("soLuong");
		            String moTa = result.getString("moTa");
		            int thuongHieuId = result.getInt("thuongHieuId");
		            String hinhAnh = result.getString("hinhAnh");

		            DongHo dongho = new DongHo(maDH, tenDH, giaBan,soLuong, moTa, thuongHieuId, hinhAnh);
		            dsDongHo.add(dongho);
		        }
		        return dsDongHo;
		    } 
		    catch (Exception e) {
		        e.printStackTrace();
		    } 
		    finally {
		        close(connection, statement, result);
		    }
		    return dsDongHo;
		}
		
		public List<DongHo> getALLDongHoSortedByPriceDescending() {
		    List<DongHo> dsDongHo = new ArrayList<DongHo>();
		    Connection connection = null;
		    PreparedStatement statement = null;
		    ResultSet result = null;

		    try {
		        connection = dataSource.getConnection();
		        String sqlQuery = "SELECT * FROM DongHo ORDER BY giaBan DESC";
		        statement = connection.prepareStatement(sqlQuery);
		        result = statement.executeQuery();

		        while (result.next()) {
		            int maDH = result.getInt("maDH");
		            String tenDH = result.getString("tenDH");
		            float giaBan = result.getFloat("giaBan");
		            int soLuong = result.getInt("soLuong");
		            String moTa = result.getString("moTa");
		            int thuongHieuId = result.getInt("thuongHieuId");
		            String hinhAnh = result.getString("hinhAnh");

		            DongHo dongho = new DongHo(maDH, tenDH, giaBan,soLuong, moTa, thuongHieuId, hinhAnh);
		            dsDongHo.add(dongho);
		        }
		        return dsDongHo;
		    } 
		    catch (Exception e) {
		        e.printStackTrace();
		    } 
		    finally {
		        close(connection, statement, result);
		    }
		    return dsDongHo;
		}
		
		public List<DongHo> searchDongHoByName(String inputTenDH) {
			// TODO Auto-generated method stub
			List<DongHo> dsDongHo = new ArrayList<DongHo>();
		    Connection connection = null;
		    PreparedStatement statement = null;
		    ResultSet result = null;

		    try {
		        connection = dataSource.getConnection();
		        String sqlQuery = "SELECT * FROM DongHo WHERE tenDH LIKE ?";
		        statement = connection.prepareStatement(sqlQuery);
		        statement.setString(1, "%" + inputTenDH + "%");
		        result = statement.executeQuery();

		        while (result.next()) {
		            int maDH = result.getInt("maDH");
		            String tenDH = result.getString("tenDH");
		            float giaBan = result.getFloat("giaBan");
		            int soLuong = result.getInt("soLuong");
		            String moTa = result.getString("moTa");
		            int thuongHieuId = result.getInt("thuongHieuId");
		            String hinhAnh = result.getString("hinhAnh");

		            DongHo dongho = new DongHo(maDH, tenDH, giaBan,soLuong, moTa, thuongHieuId, hinhAnh);
		            dsDongHo.add(dongho);
		        }
		        return dsDongHo;
		    } 
		    catch (Exception e) {
		        e.printStackTrace();
		    } 
		    finally {
		        close(connection, statement, result);
		    }
		    return dsDongHo;
		}
		
		public void addDongHo(DongHo dongHo) {
			Connection conn = null;
			PreparedStatement stmt = null;
			try {
				conn = dataSource.getConnection();
				String sqlQuery = "INSERT INTO DongHo "
						+ "(tenDH, giaBan, soLuong, moTa, thuongHieuId, hinhAnh) "
						+ "VALUES(?, ?, ?, ?, ?, ?)";
				stmt = conn.prepareStatement(sqlQuery);
				stmt.setString(1, dongHo.getTenDH());
				stmt.setFloat(2, dongHo.getGiaBan());
				stmt.setInt(3, dongHo.getSoLuong());
				stmt.setString(4, dongHo.getMoTa());
				stmt.setInt(5, dongHo.getThuongHieuId());
				stmt.setString(6, dongHo.getHinhAnh());
				stmt.execute();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				close(conn, stmt, null);
			}
		}
		
		public void deleteDongHo(String id) {
			Connection conn = null;
			PreparedStatement stmt = null;
			try {
				int maDH = Integer.parseInt(id);
				conn = dataSource.getConnection();
				String sql = "DELETE FROM DongHo WHERE maDH=?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, maDH);
				stmt.execute();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				close(conn, stmt, null);
			}
		}
		
		public void updateDongHo(DongHo dongHo) {
			Connection conn = null;
			PreparedStatement stmt = null;
			try {
				conn = dataSource.getConnection();
				String sqlQuery = "UPDATE DongHo "
						+ "SET tenDH=?, giaBan=?, soLuong=?, moTa=?, thuongHieuId=?, hinhAnh=? "
						+ "WHERE maDH=?";
				stmt = conn.prepareStatement(sqlQuery);
				stmt.setString(1, dongHo.getTenDH());
				stmt.setFloat(2, dongHo.getGiaBan());
				stmt.setInt(3, dongHo.getSoLuong());
				stmt.setString(4, dongHo.getMoTa());
				stmt.setInt(5, dongHo.getThuongHieuId());
				stmt.setString(6, dongHo.getHinhAnh());
				stmt.setInt(7, dongHo.getMaDH());
				stmt.execute();
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		
		
		
		
		public DongHo getDongHo2(String maDongHo) {
			DongHo dongho = null;	
			Connection myConn = null;
			PreparedStatement myStmt = null;
			ResultSet myRs = null;
			try {
				
				// get connection to database
				myConn = dataSource.getConnection();
				// create sql to get selected product
				String sql = "Select * from DongHo where maDH = " + maDongHo;			
				// create prepared statement
				myStmt = myConn.prepareStatement(sql);					
				// execute statement
				myRs = myStmt.executeQuery();			
				// retrieve data from result set row
				if (myRs.next()) {
					int maDH = myRs.getInt("maDH");
					String tenDH = myRs.getString("tenDH");
					float giaBan = myRs.getFloat("giaBan");
					int soLuong = myRs.getInt("soLuong");
					String moTa = myRs.getString("moTa");
					int thuongHieuId = myRs.getInt("thuongHieuId");
					String hinhAnh = myRs.getString("hinhAnh");
					
					//đư ảnh từ csdl sql server lên đây
					
				 dongho = new DongHo(maDH,tenDH, giaBan,soLuong, moTa, thuongHieuId, hinhAnh);
				}
				else {
					throw new Exception("Could not find DongHo with maDH = " + maDongHo);	}							
				return dongho;
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				// clean up JDBC objects
				close(myConn, myStmt, myRs);
			}
			return null;
		}
		
		//THUONG HIEU
		public List<ThuongHieu> getAllBrands() {
			List<ThuongHieu> listThuongHieu = new ArrayList<ThuongHieu>();
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dataSource.getConnection();
				String sql = "SELECT * FROM ThuongHieu";
				stmt = conn.prepareStatement(sql);
				rs = stmt.executeQuery();
				while (rs.next()) {
					int thuongHieuId = rs.getInt("thuongHieuId");
					String name = rs.getString("name");
					ThuongHieu thuongHieu = new ThuongHieu(thuongHieuId, name);
					listThuongHieu.add(thuongHieu);
				}
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				close(conn, stmt, rs);
			}
			return listThuongHieu;
		}

		public List<DongHo> getDongHoByBrand(int id) {
			// TODO Auto-generated method stub
			List<DongHo> listDongHo = new ArrayList<DongHo>();
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dataSource.getConnection();
				String sqlQuery = "SELECT * FROM DongHo WHERE thuongHieuId = ?";
				stmt = conn.prepareStatement(sqlQuery);
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				while (rs.next()) {
		            int maDH = rs.getInt("maDH");
		            String tenDH = rs.getString("tenDH");
		            float giaBan = rs.getFloat("giaBan");
		            int soLuong = rs.getInt("soLuong");
		            String moTa = rs.getString("moTa");
		            int thuongHieuId = rs.getInt("thuongHieuId");
		            String hinhAnh = rs.getString("hinhAnh");
		            DongHo dongho = new DongHo(maDH, tenDH, giaBan,soLuong, moTa, thuongHieuId, hinhAnh);
		            listDongHo.add(dongho);
		        }
			}
			catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			finally {
				close(conn, stmt, rs);
			}
			return listDongHo;
		}
		
	
}
