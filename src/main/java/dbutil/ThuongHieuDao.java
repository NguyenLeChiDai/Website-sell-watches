package dbutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import entity.ThuongHieu;

public class ThuongHieuDao {

	private DataSource dataSource;

	public ThuongHieuDao(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
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

	private void close(Connection conn, PreparedStatement stmt, ResultSet rs) {
		// TODO Auto-generated method stub
		try {
			if (conn != null) {
				conn.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (rs != null) {
				rs.close();
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
