<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="img/logo-mini.jpg" type="image/x-icon" />
    <link rel="stylesheet" href="css/style_trangchu.css" type="text/css"/>
    <link rel="stylesheet" href="css/reset.css" />
    
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="fontawesome/css/all.css" />
    
   
    
    
    <script src="js/jquery.js"></script>
    <script src="js/style.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>Tất Cả đồng hồ</title>
</head>

<body>


  <script type="text/javascript">
        $(document).ready(function() {
            $('.list-menu li').hover(function() {
                    $(this).find(".sub-menu").stop().fadeIn(500);
                },
                function() {
                    $(this).find(".sub-menu").stop().fadeOut(300);
                });
        });
        
        function searchDongHo() {
            var searchInput = document.getElementById('searchInput').value;
            window.location.href = 'DongHoServlet?command=SEARCH&tenDH=' + searchInput;
        }
    </script>
    
    
    
<input type="hidden" name="command" value="TEST">

            
 <div id="main">
    <!-- ============ HEADER ===============-->
    <div id="header">
        
        <div class="banner">
            <div class="login">
              
                <div class="sub-login">
                    <p><a href="tel:0354985272"><i class="fas fa-phone-alt"></i> HOTLINE: 0354985272</a></p>
                    <ul>
                    
                    <!-- Ẩn nút TK sau khi đăng nhập -->
                    <c:if test ="${sessionScope.acc == null}">
                         	<li>
                            <p><a href="DongHoServlet?command=TAIKHOAN"><i class="fas fa-user"></i>Tài khoản</a></p>
							</li>
                        </c:if>
                       
                    </ul>
                    <p><a href="#"><i class="fas fa-map-marker-alt" ></i>Hệ thống cửa hàng</a></p>
                    <a href="?command=VIEWCART" class="cart-link">
					  <i class="fas fa-shopping-cart" style="margin-left: 1000px;"></i>
					  <span class="cart-counter">1</span>
					  <span class="cart-title">Giỏ hàng</span>
					</a>
                    
                     </div>
            </div>
            <div class="sub-banner">
                 <a href="DongHoServlet"><img class="logo" style="color: red; width: 60%; height:79px;  " src="img/logodonghonho.jpg" alt="" /></a>
                
                <form action>
                    <input type="search" id="searchInput" placeholder="Bạn đang tìm sản phẩm nào..." />
                    
                </form>
                <i class="fas fa-search" onclick="searchDongHo()" ></i>
            </div>
        </div>
    </div>   
</div> 

<!-- ============END HEADER=============== -->
        <!-- ============MENU=============== -->

    <nav style="margin-left: 0px;">
        <ul class="list-menu" style="margin-left: 50px;">
        
        <!--  Hello Người dùng-->
        <c:if test="${not empty sessionScope.acc}">
						    <c:if test="${not empty sessionScope.acc.user}">
						        <li class="f">
						            <a  href="#" style="color: while;">Hello ${sessionScope.acc.user}</a>
						        </li>
						        
						     
						        <li class="f">
						            <a style="color: while;" href="LogoutControll">Logout</a>
						        </li>
						    </c:if>
						    
						    
						</c:if>
    
        
            <li class="f"><a style="color: black; margin-left: 150px;" href="DongHoServlet">Trang chủ</a></li>
            
            
            <li class="dmsp" ><a href="#">THƯƠNG HIỆU<i class="fas fa-caret-down"></i></a>
                <ul class="sub-menu">
                    <li><a href="#rolex">ROLEX</a></li>
                    <li><a href="#seiko">SEIKO</a></li>
                    <li><a href="#casio">CASIO</a></li>
                    <li><a href="#citizen">CITIZEN</a></li>
                    <li><a href="#orient">ORIENT</a></li>
                </ul>
          </li>
            
         <li>
                <a href="#">GIỚI TÍNH<i class="fas fa-caret-down"></i></a>
                <ul class="sub-menu">  
                    <li><a href="DongHoServlet?command=DONGHONAM">ĐỒNG HỒ NAM</a></li>
                    <li><a href="DongHoServlet?command=DONGHONU">ĐỒNG HỒ NỮ</a></li>
                     <li><a href="DongHoServlet?command=TATCADONGHO">TẤT CẢ ĐỒNG HỒ</a></li>
                    
            	</ul>
          </li>
          
         
          <li>
            <a href="#">PHỤ KIỆN<i class="fas fa-caret-down"></i></a>
            <ul class="sub-menu">
                
                 <li><a href="DongHoServlet?command=THONGBAO">DÂY DA ĐỒNG HỒ</a></li>
                <li><a href="DongHoServlet?command=THONGBAO">DÂY KIM LOẠI</a></li>
                <li><a href="DongHoServlet?command=THONGBAO">VÍ DA</a></li>
            </ul>
          </li>
          
            <li>
	            <a href="#">TIN TỨC<i class="fas fa-caret-down"></i></a>
	             <ul class="sub-menu">
	                
	                <li><a href="DongHoServlet?command=TINTUC">TIn ĐỒNG HỒ</a></li>
	               
	            </ul>
           </li>
           
           <li><a href="DongHoServlet?command=THONGTIN">THÔNG TIN</a></li>
           
           <c:if test ="${sessionScope.acc.isAdmin == 1}">
           
	            <li><a href="CRUDServlet" >QUẢN LÝ DỒNG HỒ</a>
	            
          </c:if>
       </ul>
  </nav>
      <div class="slider">
  <img src="img/logodh.gif" style="height: 250px;">
 </div>
   <!--  THÔNG BÁO -->
      <!--  TẤT CẢ ĐỒNG HỒ -->
    <div class="col-sm-12" id="tatcadongho">
	 	<div class="box-head">
	        	<p id="converse">Sản phẩm tìm được</p>
	    </div>
                    <div class="row">
                    	
                        <c:forEach var="dsTatCaDongHo" items="${DONGHO}">
                        <c:url var="tempLink" value="DongHoServlet">
	                    	<c:param name="command" value="LOADCHITIET" />
	                    	<c:param name="maDH" value="${dsTatCaDongHo.maDH}" />
	                	</c:url>
						    <div class="col-12 col-md-6 col-lg-3">
						    	
						        <div class="card">
						            <a href="${tempLink}"><img class="card-img-top" src="${dsTatCaDongHo.hinhAnh}" alt="Card image cap"></a>
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a href="#" style="color: #7A7A7A" >${dsTatCaDongHo.tenDH}</a></h4>
                                        <%-- <p class="card-text show_txt">${dsTatCaDongHo.tenDH}</p> --%>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-danger btn-block">${dsTatCaDongHo.giaBan} $</p>
                                            </div>
                                            <div class="col">
                                                <a href="${tempLink}" class="btn btn-success btn-block">Mua Ngay</a>
                                     
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

   <!-- Footer -->
   
   
     <div class="footer">
        <div class="container">
             <div class="footer-main">
                <div class="footer-main__map">
                    <img src="imgDongHo/logodh11.jpg" width="99%" height="99%"  style="border:0;" allowfullscreen="" loading=""></img>
                </div>

                <div class="footer-list">
                    <div class="footer-wraper-1">
                        <p class="footer-list__title">
                                <strong> LUXURY BRAND ! </strong> 
                        </p>

                        <ul class="footer-address font-15">
                            <li class="footer-address__items">
                                <i class="footer-icon fas fa-map-marker-alt"></i><span class="footer-address__items-none">Address: HCM - 12 Nguyễn Văn Bảo - Quận Gò Vấp</span>
                            </li>
                             <li class="footer-address__items">
                                <i class="footer-icon fas fa-phone-alt"></i><a href="#" class="footer-address__items-link" tel: >0354.985.272</a>
                            </li>
                            <li class="footer-address__items">
                                <i class="footer-icon fas fa-envelope"></i><a href="#" class="footer-address__items-link">sinhviennguyenlechidai@gmail.com</a>
                            </li>
                        </ul>

                        <div class="footer-info">
                            <i class="footer-info__icon fab fa-facebook-f"></i>
                            <i class="footer-info__icon fab fa-youtube"></i>
                            <i class="footer-info__icon fab fa-instagram"></i>
                        </div>

                        <p class="footer-desc">LUXURY BRAND, thành lập vào năm 2023, chuyên cung cấp đồng hồ hàng hiệu chính hãng tại TPHCM. 
                        Chúng tôi mang đến các sản phẩm đồng hồ cao cấp, 
                        từ những mẫu đồng hồ thời trang đến những chiếc đồng hồ nam nữ tầm trung, 
                        bao gồm các thương hiệu nổi tiếng như Rolex, Patek Philippe, Omega và nhiều hãng danh tiếng khác. 
                        Đa dạng về kiểu dáng và mẫu mã, phù hợp cho phong cách lịch lãm của nam giới và sự sang trọng của phụ nữ.
						Chúng tôi, LUXURY BRAND, cam kết không bán hàng nhái, hàng xách tay không rõ nguồn gốc xuất xứ. 
						Tất cả các sản phẩm đều được dán tem barcode chống hàng giả BCA và đi kèm thẻ bảo hành chính hãng, 
						đảm bảo nguồn gốc và chất lượng. Khách hàng mua online sẽ được hưởng ưu đãi giảm giá 10% từ giá niêm yết 
						trên trang web.
                        </p>
                    </div>
                </div>   
            </div>
              
        </div>
            <div class="copyright">
                    <div class="copyright-main">
                      @2021 - <span class="copyright-main__color">Đồng hồ LUXURY BRAND</span> 
                      <span class="copyright-mobile-1"> | </span> 
                      <span class="copyright-mobile-2">
                        WEB
                        <a href="DongHoServlet?command=THONGTIN"><span style="color: orange;">Nguyễn Lê Chí Đại - Phạm Minh Hiếu - Trương Minh Hữu - Nguyễn Anh Đức</span></a>
                      </span>
                    </div>

                    <div class="top">
                        <a class="top-link" href="#">Trở lại đầu trang <i class="top-icon fas fa-chevron-up"></i></a>
                    </div>
            </div>  

        </div>
</body>
</html>