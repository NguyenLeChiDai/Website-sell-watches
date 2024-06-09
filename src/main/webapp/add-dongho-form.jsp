<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	* {
		width: 1280px;
		margin: 0 auto;
	}

	/*
	html, body{
		margin-left:15px; margin-right:15px; 
		padding:0px; 
		font-family:Verdana, Arial, Helvetica, sans-serif;
	}
	*/
	
	table {   
		border-collapse:collapse;
		border-bottom:1px solid gray;
		font-family: Tahoma,Verdana,Segoe,sans-serif;
		width:72%;
	}
	 
	th {
		border-bottom:1px solid gray;
		background:none repeat scroll 0 0 #0775d3;
		padding:10px;
		color: #FFFFFF;
	}
	
	tr {
		border-top:1px solid gray;
		text-align:center;	
	}
	 
	tr:nth-child(even) {background: #FFFFFF}
	tr:nth-child(odd) {background: #BBBBBB}	
	 
	#wrapper {width: 100%; margin-top: 0px;}
	#header {background: #0775d3; margin-top: 0px; padding:15px 0px 15px 0px; text-align: center;}
	#header h2 {width: 100%; margin:auto; color: #FFFFFF;}
	#container {width: 100%}
	#container h3 {color: #000;}
	#container #content {margin-top: 20px;}
	
	.add-button {
		border: 1px solid #666; 
		border-radius: 5px; 
		padding: 4px; 
		font-size: 12px;
		font-weight: bold;
		width: 120px; 
		padding: 5px 10px; 
		margin-bottom: 15px;
		background: #cccccc;
		margin-left: 160px;
	}

	form {
		margin-top: 10px;
	}
	
	label {
		font-size: 16px; 
		width: 100px; 
		display: block; 
		text-align: right;
		margin-right: 10px;
		margin-top: 8px;
		margin-bottom: 8px;
	}
	
	input {
		width: 250px;
		border: 1px solid #666; 
		border-radius: 5px; 
		padding: 4px; 
		font-size: 16px;
	}
	
	.save {
		font-weight: bold;
		width: 130px; 
		padding: 5px 10px; 
		margin-top: 30px;
		background: #cccccc;
	}
	
	table {   
		border-style:none;
		width:50%;
	}
	
	tr:nth-child(even) {background: #FFFFFF}
	tr:nth-child(odd) {background: #FFFFFF}
	
	tr {
		border-style:none;
		text-align:left;	
	}
</style>
<script>
        function validateForm() {
        	var tenDH = document.getElementsByName("tenDH")[0].value;
            var giaBan = document.getElementsByName("giaBan")[0].value;
            var soLuong = document.getElementsByName("soLuong")[0].value;
            var moTa = document.getElementsByName("moTa")[0].value;
            var thuongHieuDropdown = document.getElementById("thuongHieuDropdown");
            var hinhAnh = document.getElementsByName("hinhAnh")[0].value;

            // Kiểm tra không được bỏ trống các trường input
            if (tenDH.trim() === "" || giaBan.trim() === "" || soLuong.trim() === "" || moTa.trim() === "" || thuongHieuDropdown.value.trim() === "" || hinhAnh.trim() === "") {
                alert("Không được bỏ trống các trường input.");
                return false;
            }

            // Kiểm tra nếu giá bán không phải là số
            if (isNaN(giaBan)) {
alert("Giá bán phải là một số.");
                return false;
            }

            // Kiểm tra nếu số lượng không phải là số
            if (isNaN(soLuong)) {
                alert("Số lượng phải là một số.");
                return false;
            }

            // Nếu mọi thứ đều hợp lệ, cho phép gửi form
            return true;
        }
        
        function updateInput() {
            var thuongHieuDropdown = document.getElementById('thuongHieuDropdown');
            var thuongHieuIdInput = document.getElementById('thuongHieuId');
            var selectedIndex = thuongHieuDropdown.selectedIndex;
            thuongHieuIdInput.value = selectedIndex + 1;
        }
    </script>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Add New Product</h2>
		</div>
	</div>
	
	<div id="container">
		<form action="CRUDServlet" method="GET" onsubmit="return validateForm();">
		
			<input type="hidden" name="command" value="ADD"/>
			
			<table>
				<tbody>
					<tr>
						<td><label>Tên đồng hồ:</label></td>
						<td><input type="text" name="tenDH" /></td>
					</tr>
					

					<tr>
						<td><label>Giá bán:</label></td>
						<td><input type="text" name="giaBan" /></td>
					</tr>

					<tr>
						<td><label>Số lượng:</label></td>
						<td><input type="text" name="soLuong" /></td>
					</tr>
					
					<tr>
						<td><label>Mô tả:</label></td>
						<td><input type="text" name="moTa" /></td>
					</tr>
					
					<tr>
						<td><label>Thương hiệu:</label></td>
						<td>
							<select id="thuongHieuDropdown" onchange="updateInput()" style="width: 200px; margin-top: 20px">
			    				<option>Rolex</option>
			    				<option>Seiko</option>
			    				<option>Citizen</option>
			    				<option>Casio</option>
			    				<option>Orient</option>
							</select>
							<input type="text" id="thuongHieuId" name="thuongHieuId" style="margin-top: 10px" readonly />
						</td>
						
						
					</tr>
					
					<tr>
						<td><label>Hình ảnh:</label></td>
						<td><input type="text" name="hinhAnh" /></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		
	</div>
</body>
</html>