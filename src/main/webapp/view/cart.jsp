 <%@page import="entity.GioHang"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.List"%>
<%@page import="entity.GioHang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
	<link rel="stylesheet" href="./css/cart.css" />
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
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
<title>Giỏ hàng</title>
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
	
  <div class="container mt-5 p-3 rounded cart">
        <div class="row no-gutters">
            <div class="col-md-8">
                <div class="product-details mr-2">
                    <div class="d-flex flex-row align-items-center"><i class="fa fa-long-arrow-left"></i><span class="ml-2">
                    		<a href="DongHoServlet">Tiếp tục mua sắm</a></span>
                    </div>
                    <hr>
                    <h6 class="mb-0">Giỏ hàng</h6>
                    <div class="d-flex justify-content-between"><span>Danh sách giỏ hàng của bạn</span>
                        <div class="d-flex flex-row align-items-center"><span class="text-black-50">sắp xếp theo:</span>
                            <div class="price ml-2"><span class="mr-1">giá</span><i class="fa fa-angle-down"></i></div>
                        </div>
                    </div>

                    <c:forEach var="giohang" items="${cart}">
					    <form method="post" action="DongHoServlet">
					        <input type="hidden" name="maDH" value="${giohang.getDongho().getMaDH()}">
					        
					        <div class="d-flex justify-content-between align-items-center mt-3 p-2 items rounded" style="border-bottom: 2px solid #ccc;">
					            <div class="d-flex flex-row">
					                <img class="rounded" src="${giohang.getDongho().getHinhAnh()}" width="40">
					                <div class="ml-2">
					                    <span class="font-weight-bold d-block">${giohang.getDongho().getTenDH()}</span>
					                </div>
					            </div>
					            <div class="d-flex flex-row align-items-center" >
					                <span class="d-block">
					                    <p>Số lượng: <input type="number" style="width: 60px; margin-right: 20px;"  name="soLuong" value="${giohang.getSoLuong()}"></p>
					                    <input type="hidden" name="command" value="UPDATECART">
					                    <button type="submit">Cập nhật số lượng</button>
					                </span>
					                <span class="d-block ml-5 font-weight-bold">${giohang.getDongho().getGiaBan()}</span>
					                <input type="hidden" name="command" value="DELETE">
					                <button class="fa fa-trash-o ml-3 text-black-50" type="submit"></button>
					      
					                
					            </div>
					        </div>
					    </form>
					</c:forEach>
	                       
	                        <!-- <span class="d-block ml-5 font-weight-bold">totalPrice</span><i class="fa fa-trash-o ml-3 text-black-50"></i> -->
	                        
	            </div>  
	          </div>    
	          
	<script>
    function showPaymentForm(type) {
        // Hide all payment forms
        $('.credit-card-details').hide();
        
        // Show the selected payment form
        $('#' + type + 'Form').show();
    }

    // Initially hide all forms except 'tienmatForm'
    $(document).ready(function() {
        $('.credit-card-details').not('#tienmatForm').hide();
    });
</script>
                    
            <div class="col-md-4">
                <div class="payment-info">
                    <div class="d-flex justify-content-between align-items-center">
                    	<span>THANH TOÁN</span><img class="rounded" src="https://i.imgur.com/WU501C8.jpg" width="30"></div><span class="type d-block mt-3 mb-1">Chọn phương thức thanh toán</span>
		                   	<label class="radio"> 
		                   		<input type="radio" name="card" value="payment" onchange="showPaymentForm('tienmat')" checked> 
		                   		<span>tiền mặt</span>
		                   	 </label>
		                    <label class="radio">
					            <input type="radio" name="card" value="payment" onchange="showPaymentForm('visa')">
					            <span><img width="30" src="https://img.icons8.com/officel/48/000000/visa.png"/></span>
					        </label>
					        <label class="radio">
					            <input type="radio" name="card" value="payment" onchange="showPaymentForm('amex')">
					            <span><img width="30" src="https://img.icons8.com/ultraviolet/48/000000/amex.png"/></span>
					        </label>
					        <label class="radio">
					            <input type="radio" name="card" value="payment" onchange="showPaymentForm('paypal')">
					            <span><img width="30" src="https://img.icons8.com/officel/48/000000/paypal.png"/></span>
					        </label>
					        
					        
					<!-- FROM thanh toán -->
        				<div class="credit-card-details" id="tienmatForm">
            				<div><label class="credit-card-label">Tên người nhận</label><input type="text" class="form-control credit-inputs" placeholder="Họ và tên"></div>
		                    <div><label class="credit-card-label">Địa chỉ</label><input type="text" class="form-control credit-inputs" placeholder="Số nhà, Ấp(Đường), Xã(Phường), Huyện(Quận), Tỉnh(Thành Phố)"></div>
		                    <div><label class="credit-card-label">Số điện thoại</label><input type="text" class="form-control credit-inputs" placeholder="000 0000 000"></div>
		                    <input type="text" class="form-control credit-inputs" placeholder="Nhập OTP" name="otp">
		                    
		                </div>
        				<div class="credit-card-details" id="visaForm">
           					<div><label class="credit-card-label">Tên thẻ</label><input type="text" class="form-control credit-inputs" placeholder="Tên thẻ"></div>
		                    <div><label class="credit-card-label">Mã thẻ</label><input type="text" class="form-control credit-inputs" placeholder="0000 0000 0000 0000"></div>
		                    <div class="row">
		                        <div class="col-md-6"><label class="credit-card-label">Ngày cấp</label><input type="text" class="form-control credit-inputs" placeholder="12/24"></div>
		                        <div class="col-md-6"><label class="credit-card-label">CVV</label><input type="text" class="form-control credit-inputs" placeholder="342"></div>
		                    </div>
		                </div>
        				<div class="credit-card-details" id="amexForm">
        					<div><label class="credit-card-label">Tên thẻ</label><input type="text" class="form-control credit-inputs" placeholder="Tên thẻ"></div>
            				<div><label class="credit-card-label">Mã thẻ</label><input type="text" class="form-control credit-inputs" placeholder="0000 0000 0000 0000"></div>
		                    <div class="row">
		                        <div class="col-md-6"><label class="credit-card-label">Ngày cấp</label><input type="text" class="form-control credit-inputs" placeholder="12/24"></div>
		                        <div class="col-md-6"><label class="credit-card-label">CVV</label><input type="text" class="form-control credit-inputs" placeholder="342"></div>
		                    </div>
        				</div>
				        <div class="credit-card-details" id="paypalForm">
				        <div><label class="credit-card-label">Tên thẻ</label><input type="text" class="form-control credit-inputs" placeholder="Tên thẻ"></div>
				            <div><label class="credit-card-label">Mã thẻ</label><input type="text" class="form-control credit-inputs" placeholder="0000 0000 0000 0000"></div>
		                    <div class="row">
		                        <div class="col-md-6"><label class="credit-card-label">Ngày cấp</label><input type="text" class="form-control credit-inputs" placeholder="12/24"></div>
		                        <div class="col-md-6"><label class="credit-card-label">CVV</label><input type="text" class="form-control credit-inputs" placeholder="342"></div>
		                    </div>
        				</div>
        </div>
                    <hr class="line">
                    
                     
	                        <%
	                        	float thue = 20.000f;
						        List<GioHang> giohangs = (List<GioHang>) session.getAttribute("cart");
						        float totalPrice = 0.0f;
						        for (GioHang giohang : giohangs) {
						            totalPrice += giohang.getDongho().getGiaBan() * giohang.getSoLuong();
						        }      
						    %>
	                        
                    <div class="d-flex justify-content-between information"><span>Tổng tiền sản phẩm</span><span><%= totalPrice %></span></div>
                    <div class="d-flex justify-content-between information"><span>Thuế</span><span><%= thue %></span></div>
					<div class="d-flex justify-content-between information"><span>Tổng phải thanh toán</span><span><%= totalPrice + thue %></span></div>
					<button class="btn btn-primary btn-block d-flex justify-content-between mt-3" type="button">
					    <span><%= totalPrice + thue %></span>
					    <span>Thanh toán<i class="fa fa-long-arrow-right ml-1"></i></span>
					</button>
           
            </div>
        </div>
    </div>

</body>
</html>