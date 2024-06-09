package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import dbutil.DongHoDbUtil;
import entity.DongHo;
import entity.GioHang;





@WebServlet("/DongHoServlet")
public class DongHoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	
	private DongHoDbUtil dongHoUtil;
	
	@Resource(name="jdbc/ShopDongHo")
	private DataSource dataSource;
	
	@Override
	public void init() throws ServletException {
		super.init();

		try {
			dongHoUtil = new DongHoDbUtil(dataSource);
			
		}
		catch (Exception exc) {
			throw new ServletException(exc);
		}
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        String command = request.getParameter("command");
	        if (command == null) {
	            command = "TEST";
	        }
	        switch (command) {
	            case "TEST":
	            	dsDongHoVaTatCaDongHo(request, response);
//	                dsDongHo(request, response);
//	                dsTatCaDongHo(request, response);
	                break;
	            case "MUANGAY":
	                //loadChiTiet(request, response); 
	                AddItemsToCart(request, response);
	                break;
	            case "LOADCHITIET":
	            	ShowViewItem(request, response);	               
	                break;
	          
	    		case "ADDTOCART":
	    			AddItemsToCart(request, response);
	    			//UpdateCart(request, response);
	    			break;
	    			
	    		case "UPDATECART": 		
	    		//	UpdateCart(request, response);
	    			UpdateCart2(request, response);
	    			break;
	    			
	    		case "VIEWCART":
	    			ViewCart(request, response);
	    			break;
	    			
	            case "TAIKHOAN":
	                taiKhoan(request, response); 
	                
	                break;
	            case "TAIKHOANCHITIET":
	                taiKhoan(request, response);
	                break;
	            case "TINTUC":
	                tinTuc(request, response);
	                break;
	                
	            case "THONGTIN":
	                thongTin(request, response);
	                break;
	            case "THONGBAO":
	                thongBao(request, response);
	                break;
	            case "DIACHIGIAO":
	                diaChi(request, response);
	                break;
	            case "DONGHONAM":
	                dongHoNam(request, response);
	                break;
	            case "DONGHONU":
	                dongHoNu(request, response);
	                break;
	            case "TATCADONGHO":
	                tatCaDongHo(request, response);
	                break;
	                
	            case "SEARCH":
				    searchDongHo(request, response);
				    break;
	            case "DELETE":
				    xoaGioHang(request, response);
				    break;
	                
	                
	            default:
	            	dsDongHoVaTatCaDongHo(request, response);               
	                break;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	//DANH SÁCH ĐỒNG HỒ
	private void dsDongHoVaTatCaDongHo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    List<DongHo> dsDongHonam = dongHoUtil.getALLDongHoNam();
	    List<DongHo> dsDongHonu = dongHoUtil.getALLDongHoNu();
	    List<DongHo> dsTatCaDongHo = dongHoUtil.getALLDongHo();
	    
	    request.setAttribute("dsDONGHO", dsDongHonam);
	    request.setAttribute("dsDONGHONU", dsDongHonu);
	    request.setAttribute("DONGHO", dsTatCaDongHo);
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/view/trangchu.jsp");
	    dispatcher.forward(request, response);
	    
	}
	
	//SHOW CHI TIẾT ĐỒNG HỒ
	public void ShowViewItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		int maDH = Integer.parseInt(request.getParameter("maDH"));
		DongHo dongho = dongHoUtil.getDongHoByid(maDH);
		request.setAttribute("DONGHO", dongho);
		request.getRequestDispatcher("/view/chitietdongho.jsp").forward(request, response);
	}
	
	// THÊM VÀO GIỎ HÀNG
    private void AddItemsToCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int maDH = Integer.parseInt(request.getParameter("maDH"));
        DongHo dongho = dongHoUtil.getDongHoByid(maDH);
        int soLuong = Integer.parseInt(request.getParameter("soLuong")); // Lấy số lượng từ request
        GioHang gioHang = new GioHang(dongho, soLuong);
       
        HttpSession session = request.getSession();
        List<GioHang> dsDongHos = (List<GioHang>) session.getAttribute("cart");
        if (dsDongHos == null) {
            dsDongHos = new ArrayList<>();
        }
        

        // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa, nếu có thì cập nhật số lượng
        boolean isUpdated = false;
        for (GioHang existingGioHang : dsDongHos) {
            if (existingGioHang.getDongho().getMaDH() == maDH) {
                existingGioHang.setSoLuong(existingGioHang.getSoLuong() + soLuong);
                
                //cập nhật lại số lượng
                dongho.setSoLuong(dongho.getSoLuong() - (existingGioHang.getSoLuong() + soLuong));
                isUpdated = true;
                break;
            }
        }

        // Nếu sản phẩm chưa có trong giỏ hàng, thêm mới
        if (!isUpdated) {
            dsDongHos.add(gioHang);
            
            //cập nhật lại số lượng
            dongho.setSoLuong(dongho.getSoLuong() - gioHang.getSoLuong());
        }
        session.setAttribute("cart", dsDongHos);
        dsDongHoVaTatCaDongHo(request, response);
    
    }
	//CẬP NHẬT
	public void UpdateCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int maDH = Integer.parseInt(request.getParameter("maDH"));
	    int soLuong = Integer.parseInt(request.getParameter("soLuong"));

	    HttpSession session = request.getSession();
	    List<GioHang> dsDongHos = (List<GioHang>) session.getAttribute("cart");

	    for (GioHang gioHang : dsDongHos) {
	    	
	        if (gioHang.getDongho().getMaDH() == maDH) {
	            gioHang.setSoLuong(soLuong);
	            
	          
	            break;
	        }
	        
	    }

	    session.setAttribute("cart", dsDongHos);
	    dsDongHoVaTatCaDongHo(request, response);
	    
	}
	//CẬP NHẬT NẾU SỐ LƯỢNG 0 THÌ XÓA
	public void UpdateCart2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    int maDH = Integer.parseInt(request.getParameter("maDH"));
	    int soLuong = Integer.parseInt(request.getParameter("soLuong"));

	    HttpSession session = request.getSession();
	    List<GioHang> dsDongHos = (List<GioHang>) session.getAttribute("cart");

	    // Kiểm tra nếu số lượng là 0, thì xóa sản phẩm khỏi giỏ hàng
	    if (soLuong == 0) {
	        for (Iterator<GioHang> iterator = dsDongHos.iterator(); iterator.hasNext();) {
	            GioHang gioHang = iterator.next();
	            if (gioHang.getDongho().getMaDH() == maDH) {
	                iterator.remove();
	                break;
	            }
	        }
	    } else {
	        // Cập nhật số lượng nếu số lượng khác 0
	        for (GioHang gioHang : dsDongHos) {
	            if (gioHang.getDongho().getMaDH() == maDH) {
	                gioHang.setSoLuong(soLuong);
	               
	                break;
	            }
	        }
	    }

	    session.setAttribute("cart", dsDongHos);
	    dsDongHoVaTatCaDongHo(request, response);
	}
	// XÓA SẢN PHẨM KHỎI GIỎ HÀNG
	public void xoaGioHang(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    int maDH = Integer.parseInt(request.getParameter("maDH"));

	    HttpSession session = request.getSession();
	    List<GioHang> dsDongHos = (List<GioHang>) session.getAttribute("cart");

	    Iterator<GioHang> iterator = dsDongHos.iterator();
	    while (iterator.hasNext()) {
	        GioHang gioHang = iterator.next();
	        if (gioHang.getDongho().getMaDH() == maDH) {
	            iterator.remove();
	            break;
	        }
	    }

	    session.setAttribute("cart", dsDongHos);
	    dsDongHoVaTatCaDongHo(request, response);
	}
	
	//VIEW GIỎ HÀNG
	public void ViewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<DongHo> dsDongHos = (List<DongHo>) session.getAttribute("cart");
		String message;
		System.out.println(dsDongHos);
		if (dsDongHos == null) {
			 message = "Cart is null";
		}
		request.getRequestDispatcher("/view/cart.jsp").forward(request, response);	
	}
	
	
	//TÀI KHOẢN
	private void taiKhoan(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/login.jsp");
			dispatcher.forward(request, response);		
		}
	
	
	// TIN TỨC
	private void tinTuc(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/tintuc.jsp");
			dispatcher.forward(request, response);		
		}
	
	//THÔNG TIN
	private void thongTin(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/thongtinlienhe.jsp");
			dispatcher.forward(request, response);		
		}
	
	//THÔNG BÁO
		private void thongBao(HttpServletRequest request, HttpServletResponse response) 
				throws Exception {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/thongbao.jsp");
				dispatcher.forward(request, response);		
			}
		
	//ĐỊA CHỈ GIAO HÀNG
		private void diaChi(HttpServletRequest request, HttpServletResponse response) 
				throws Exception {
						
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/diachigiaohang.jsp");
				dispatcher.forward(request, response);		
			}
		
	//Đồng HỒ NAM
		private void dongHoNam(HttpServletRequest request, HttpServletResponse response) 
				throws Exception {
			 List<DongHo> dsDongHonam = dongHoUtil.getALLDongHoNam();
			 request.setAttribute("dsDONGHO", dsDongHonam);
				  RequestDispatcher dispatcher = request.getRequestDispatcher("/view/donghonam.jsp");
				  dispatcher.forward(request, response);		
				}
		//Đồng HỒ NAM
		private void dongHoNu(HttpServletRequest request, HttpServletResponse response) 
				throws Exception {
			List<DongHo> dsDongHonu = dongHoUtil.getALLDongHoNu();
			request.setAttribute("dsDONGHONU", dsDongHonu);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/view/donghonu.jsp");
				    dispatcher.forward(request, response);		
					}
				
		//TẤT CAE DỒNG HỒ
		private void tatCaDongHo(HttpServletRequest request, HttpServletResponse response) 
				throws Exception {		
			 List<DongHo> dsTatCaDongHo = dongHoUtil.getALLDongHo();
			 request.setAttribute("DONGHO", dsTatCaDongHo);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/view/tatcadongho.jsp");
					dispatcher.forward(request, response);		
					}
		
		//TÌM ĐỒNG HỒ
		private void searchDongHo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			String tenDH = request.getParameter("tenDH");
		    List<DongHo> listDongHo = dongHoUtil.searchDongHoByName(tenDH);
		    request.setAttribute("DONGHO", listDongHo);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("/view/timsanpham.jsp");
		    dispatcher.forward(request, response);
		}

	
	
	
	
	
	
}
