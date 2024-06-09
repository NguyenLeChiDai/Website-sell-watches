<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lag="en">
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
    <title>Trang tin tức</title>
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
 <div id="wrapper">
      
    <div class="contaner">
        <div class="row">
            <div class="row ml-5">
                <a href="DongHoServlet"><h6>Trang chủ</h6></a>
                <h6 style="color: gray;"> > Tin đồng hồ thời trang</h6>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-9">
                <div class="border-bottom">
                    <h3 style = "font-family:courier,arial,helvetica;">Tin đồng hồ thời trang</h3>
                </div>
                <h2 style="text-align: center;">Phân biệt đồng hồ chính hãng với hàng giả cùng LUXURY BRAND</h2>
                <p style="font-family:Lucida Calligraphy,Comic Sans MS,Lucida Console; text-align: center;">POSTED BY · FEBRUARY 20, 2021</p>
                <a href="tintucchitiet.html"><img src="imgDongHo/logodh2.PNG" width="85%" style="margin-left: 30px;"></a>
                
                <a href="tintucchitiet.html"><p style="font-weight: bold; margin-left: 30px; color: black;">Biết cách phân biệt đồng hồ chính hãng với đồng hồ giả là cách tốt nhất để bạn
                     có thể sở hữu những chiếc đồng hồ chất lượng, phù hợp với túi tiền.</p></a>
                
                <div class="border-bottom">
                    <!--  <button type="submit" style="border-radius: 3px; margin-left: 30px;">Read more</button>-->
                    <a href="https://tours.bpsc.vn/threads/124249-bat-mi-cach-phan-biet-dong-ho-thuy-si-chinh-hang-va-gia-tai-viet-nam" style="border-radius: 3px; margin-left: 30px;" target="_blank">
    					<button type="button">Read more</button>
					</a>
					
                    
                </div>
                <h2 style="text-align: center;">Hướng dẫn chọn đồng hồ phù hợp với bản thân</h2>
                <p style="font-family:Lucida Calligraphy,Comic Sans MS,Lucida Console; text-align: center;">POSTED BY · FEBRUARY 19, 2021</p>
                <img src="imgDongHo/logodh3.jpg" width="85%" style="margin-left: 30px;">
                <p style="font-weight: bold; margin-left: 30px;">Việc chọn một chiếc đồng hồ phù hợp có thể có ảnh hưởng lớn đến phong cách và cảm nhận cá nhân của bạn.</p>
                <div class="border-bottom">
                    <!--  <button type="submit" style="border-radius: 3px; margin-left: 30px;">Read more</button>-->
                    <a href="https://shopdongho.com/cach-deo-dong-ho-nam-dung-chuan/" style="border-radius: 3px; margin-left: 30px;" target="_blank">
    					<button type="button">Read more</button>
					</a>
					
                </div>
                <h2 style="text-align: center;">Xu hướng đồng hồ năm 2023</h2>
                <p style="font-family:Lucida Calligraphy,Comic Sans MS,Lucida Console; text-align: center;">POSTED BY · NOVEMBER 13, 2023</p>
                <img src="imgDongHo/logodh4.PNG"  width="85%" style="margin-left: 30px;">
                <p style="font-weight: bold; margin-left: 30px;">Không chỉ là một vật dụng để xem giờ, đồng hồ còn nâng tầm phong cách cho người dùng. 
                    Khám phá ngay xu hướng đồng hồ thời trang mới nhất.</p>
                <div class="border-bottom">
                     <!--  <button type="submit" style="border-radius: 3px; margin-left: 30px;">Read more</button>-->
                    <a href="https://bossluxurywatch.vn/5-xu-huong-lon-cua-nganh-che-tac-dong-ho-trong-nam-2023" style="border-radius: 3px; margin-left: 30px;" target="_blank">
    					<button type="button">Read more</button>
					</a>
					
                </div>
                <h2 style="text-align: center;">Đồng hồ đẹp nhất thế giới Midnight Planetarium</h2>
                <p style="font-family:Lucida Calligraphy,Comic Sans MS,Lucida Console; text-align: center;">POSTED BY · AUGUST 12, 2020</p>
                <img src="imgDongHo/logodh5.jpg"  width="85%" style="margin-left: 30px;">
                <p style="font-weight: bold; margin-left: 30px;">Đây là một trong số ít những chiếc đồng hồ thiên văn tái hiện lại 6 hành tinh nhỏ xoay quanh mặt trời bằng 6 viên đá quý, mặt trời bằng vàng.</p>
                <div class="border-bottom">
                     <a href="https://www.watchstore.vn/blogs/news/top-10-dong-ho-dep-nhat-the-gioi-ma-ban-khong-nen-bo-qua-277" style="border-radius: 3px; margin-left: 30px;" target="_blank">
    					<button type="button">Read more</button>
					</a>
					
                </div>
                <h2 style="text-align: center;">Đồng hồ đắt nhất thế giới 2023</h2>
                <p style="font-family:Lucida Calligraphy,Comic Sans MS,Lucida Console; text-align: center;">POSTED BY · AUGUST 12, 2020</p>
                <img src="imgDongHo/logodh6.png"  width="85%" style="margin-left: 30px;">
                <p style="font-weight: bold; margin-left: 30px;">Graff Diamonds Hallucination là chiếc đồng hồ đắt nhất thế giới, với mức giá 55 triệu USD. Chiếc đồng hồ này được trang trí bằng hơn 110 carat kim cương 
                quý hiếm và nhiều màu sắc, bao gồm kim cương màu hồng, xanh dương, xanh lá cây, vàng và cam.</p>
                <div class="border-bottom">
                    <a href="https://www.navigator.com.vn/post/dong-ho-graff-diamonds-hallucination-tri-gia-55-trieu-do-mang-ve-xa-hoa-tot-bac" style="border-radius: 3px; margin-left: 30px;" target="_blank">
    					<button type="button">Read more</button>
					</a>
                </div>
            </div>

            <div class="col-md-3">
                <div class="border-bottom">
                    <h3 style = "font-family:courier,arial,helvetica;">Recent posts</h3>
                </div>
                <p style="font-family:Garamond;">FEBRUARY 20, 2021</p>
                <p style="font-family:Lucida Calligraphy,Comic Sans MS,Lucida Console;">Phân biệt đồng hồ chính hãng với hàng giả cùng D&H eyeglass</p>
                <p style="font-family:Garamond;">FEBRUARY 19, 2021</p>
                <p style="font-family:Lucida Calligraphy,Comic Sans MS,Lucida Console;">Hướng dẫn chọn đồng hồ phù hợp với bản thân</p>
                <p style="font-family:Garamond;">NOVEMBER 13, 2020</p>
                <p style="font-family:Lucida Calligraphy,Comic Sans MS,Lucida Console;">Xu hướng đồng hồ 2023</p>
                <p style="font-family:Garamond;">RSS FEED</p>


            </div>
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
    </div>
</body>
</html>