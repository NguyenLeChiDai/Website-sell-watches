package servlet;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;


import dbutil.DongHoDbUtil;
import dbutil.ThuongHieuDao;
import entity.DongHo;
import entity.ThuongHieu;

/**
 * Servlet implementation class CRUDServlet
 */
@WebServlet("/CRUDServlet")
public class CRUDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Resource(name = "jdbc/ShopDongHo")
	private DataSource dataSource;
	private DongHoDbUtil dongHoDao;
	private ThuongHieuDao thuongHieuDao;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CRUDServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		try {
			dongHoDao = new DongHoDbUtil(dataSource);
			thuongHieuDao = new ThuongHieuDao(dataSource);
		}
		catch (Exception e) {
			// TODO: handle exception
			throw new ServletException();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			listBrand(request, response);
			String command = request.getParameter("command");
			if (command == null) {
				command = "LIST";
			}
			switch (command) 
			{		
				case "LIST":    listDongHo(request, response);
					break;		
				
				case "ADD":     addDongHo(request, response);
					break;	
					
				case "LOAD":    loadDongHo(request, response);
					break;	
						
				case "UPDATE":	updateDongHo(request, response);
					break;	
					
				case "DELETE":	deleteDongHo(request, response);
					break;
					
				case "LIST_BY_PRICE_ASCENDING": listByPriceAscending(request, response);
					break;
					
				case "LIST_BY_PRICE_DESCENDING": listByPriceDescending(request, response);
				break;
				
				case "SEARCH":
				    searchDongHo(request, response);
				    break;
						
				case "LIST_BY_BRAND":
				    listDongHoByBrand(request, response);
				    break;
				   
				default:
					listDongHo(request, response);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			throw new ServletException();
		}
	}

	private void listBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<ThuongHieu> listBrands = thuongHieuDao.getAllBrands();
		request.setAttribute("LIST_BRANDS", listBrands);
	}

	private void listDongHoByBrand(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String thuongHieuIdStr = request.getParameter("thuongHieuId");
	    int thuongHieuId = (thuongHieuIdStr != null && !thuongHieuIdStr.isEmpty()) ? Integer.parseInt(thuongHieuIdStr) : 0;

	    List<DongHo> listDongHoByBrand = dongHoDao.getDongHoByBrand(thuongHieuId);
	    List<ThuongHieu> listBrands = thuongHieuDao.getAllBrands(); 

	    request.setAttribute("LIST_DONGHO", listDongHoByBrand);
	    request.setAttribute("LIST_BRANDS", listBrands);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("list-dongho.jsp");
	    dispatcher.forward(request, response);
	}

	private void searchDongHo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tenDH = request.getParameter("tenDH");
	    List<DongHo> listDongHo = dongHoDao.searchDongHoByName(tenDH);
	    request.setAttribute("LIST_DONGHO", listDongHo);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("list-dongho.jsp");
	    dispatcher.forward(request, response);
	}

	private void deleteDongHo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("maDH");
		dongHoDao.deleteDongHo(id);
		listDongHo(request, response);
	}

	private void updateDongHo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("maDH"));
		String tenDH = request.getParameter("tenDH");
		float giaBan = Float.parseFloat(request.getParameter("giaBan"));
		int soLuong = Integer.parseInt(request.getParameter("soLuong"));
		String moTa = request.getParameter("moTa");
		int thuongHieuId = Integer.parseInt(request.getParameter("thuongHieuId"));
		String hinhAnh = request.getParameter("hinhAnh");
		DongHo dongHo = new DongHo(id, tenDH, giaBan, soLuong, moTa, thuongHieuId, hinhAnh);
		dongHoDao.updateDongHo(dongHo);
		listDongHo(request, response);
	}

	private void loadDongHo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("maDH");
		DongHo dongHo = dongHoDao.getDongHo2(id);
		request.setAttribute("DONGHO", dongHo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("update-dongho-form.jsp");
		dispatcher.forward(request, response);		
	}

	private void addDongHo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tenDongHo = request.getParameter("tenDH");
		String giaBanStr = request.getParameter("giaBan");
		float giaBan = Float.parseFloat(giaBanStr);
		String soLuongStr = request.getParameter("soLuong");
		int soLuong = Integer.parseInt(soLuongStr);
		String moTa = request.getParameter("moTa");
		String thuongHieuIdStr = request.getParameter("thuongHieuId");
		int thuongHieuId = Integer.parseInt(thuongHieuIdStr);
		String hinhAnh = request.getParameter("hinhAnh");
		DongHo dongHo = new DongHo(tenDongHo, giaBan, soLuong, moTa, thuongHieuId, hinhAnh);
		dongHoDao.addDongHo(dongHo);
		listDongHo(request, response);
	}

	private void listDongHo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<DongHo> listDongHo = dongHoDao.getALLDongHo();
		request.setAttribute("LIST_DONGHO", listDongHo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("list-dongho.jsp");
		dispatcher.forward(request, response);
	}
	
	private void listByPriceAscending(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<DongHo> listDongHo = dongHoDao.getALLDongHoSortedByPriceAscending();
		request.setAttribute("LIST_DONGHO", listDongHo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("list-dongho.jsp");
		dispatcher.forward(request, response);
	}
	
	private void listByPriceDescending(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<DongHo> listDongHo = dongHoDao.getALLDongHoSortedByPriceDescending();
		request.setAttribute("LIST_DONGHO", listDongHo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("list-dongho.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
