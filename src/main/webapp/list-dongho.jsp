<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách đồng hồ</title>
<link type="text/css" rel="stylesheet" href="css/styleCRUD.css">
</head>
<script>
    function sortProductsByPriceAscending() {
        window.location.href = 'CRUDServlet?command=LIST_BY_PRICE_ASCENDING';
    }
    
    function sortProductsByPriceDescending() {
        window.location.href = 'CRUDServlet?command=LIST_BY_PRICE_DESCENDING';
    }
    
    function listDongHo() {
        window.location.href = 'CRUDServlet?command=LIST';
    }
    
    function searchDongHo() {
        var searchInput = document.getElementById('searchInput').value;
        window.location.href = 'CRUDServlet?command=SEARCH&tenDH=' + searchInput;
    }

    function filterByBrand() {
        var selectedBrandId = document.getElementById('brandFilter').value;
        window.location.href = 'CRUDServlet?command=LIST_BY_BRAND&thuongHieuId=' + selectedBrandId;
    }
</script>
<body>
	<div id="wrapper">
	
		<div id="header">
       	
		                <a href="DongHoServlet" style="color: white;"><h3>Trang chủ</h3></a>
		                <a href="CRUDServlet" style="color: orange ;"><h5> > Quản Lý Sản Phẩm</h5></a>

			<h2>Quản Lý Sản Phẩm</h2>
		</div>
	</div>
	<div id="container">
		<div id="content">
		
			<input type="button" value="Add Product" 
				   onclick="window.location.href='add-dongho-form.jsp'; return false;"
				   class="add-button"
				   style="margin-left: 0px; margin-right: 20px"/>
				   
			<input type="button" value="Giá: tăng dần" onclick="sortProductsByPriceAscending()"
				class="add-button"
				style="margin-left: 0px; margin-right: 20px"/>
				
			<input type="button" value="Giá: giảm dần" onclick="sortProductsByPriceDescending()"
				class="add-button"
				style="margin-left: 0px; margin-right: 20px">
				
			<input type="button" value="Bỏ lọc" onclick="listDongHo()"
				class="add-button"
				style="margin-left: 0px; margin-right: 20px">
				
			<input type="text" id="searchInput" placeholder="Nhập tên sản phẩm cần tìm..." style="width: 200px">
			<input type="button" value="Tìm kiếm" onclick="searchDongHo()" class="add-button" style="margin-left: 0px; margin-right: 20px">
			
			<select id="brandFilter" onchange="filterByBrand()" style="width: 200px">
			    <option value="">Chọn Thương Hiệu</option>
				<c:forEach var="brand" items="${LIST_BRANDS}">
					<option value="${brand.thuongHieuId}">${brand.name}</option>
				</c:forEach>
			</select>	
			<table>
				<tr>
					<th>Tên đồng hồ</th>
					<th>Đơn giá</th>
					<th>Số lượng</th>
					<th>Mô tả</th>
					<th>Thương hiệu</th>
					<th>Hình ảnh</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="tempDongHo" items="${LIST_DONGHO}">
					
					<c:url var="tempLink" value="CRUDServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="maDH" value="${tempDongHo.maDH}" />
					</c:url>

					<c:url var="deleteLink" value="CRUDServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="maDH" value="${tempDongHo.maDH}" />
					</c:url>																		
					<tr>
						<td> ${tempDongHo.tenDH} </td>
						<td> ${tempDongHo.giaBan} </td>
						<td> ${tempDongHo.soLuong} </td>
						<td> ${tempDongHo.moTa} </td>
						<td> ${tempDongHo.thuongHieuId} </td>
						<td><img src="${tempDongHo.getHinhAnh()}" alt="Image" style="width: 150px; height: 150px"></td>
						<td> 
							<a href="${tempLink}">Update</a> 							  
							<a href="${deleteLink}"
							onclick="if (!(confirm('Ban co chac muon xoa san pham nay?'))) return false">
							Delete</a>	
						</td>
					</tr>
				
				</c:forEach>
				
			</table>
		
		</div>
	
	</div>
</body>
</html>