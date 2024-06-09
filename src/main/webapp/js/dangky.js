$(document).ready(function() {
    var i = 1;

    // Kiểm tra họ tên
    function KiemtraHoTen() {
        var reDiachi = /^[A-Z]/
        if($("#txtHT").val()=="") {
            $("#tbHT").html("*bắt buộc nhập")
            return false
        }
        if(!reDiachi.test($("#txtHT").val())) {
            $("#tbHT").html("*phải nhập in hoa")
            return false
        }
        $("#tbHT").html("*")
        return true
    }
    $("#txtHT").blur(KiemtraHoTen)

    function KiemtraMatKhau() {
        var reMatKhau = /\w$/
        if($("#txtpass").val()=="") {
            $("#tbpass").html("*bắt buộc nhập")
            return false
        }
        if(!reMatKhau.test($("#txtpass").val())) {
            $("#tbpass").html("*mật khẩu phải gồm chữ hoa, thường và số")
            return false
        }
        $("#tbpass").html("*")
        return true
    }
    $("#txtpass").blur(KiemtraMatKhau)

    function KiemtraGmail() {
        var reGmail = /\w@gmail.com$/
        if($("#txtGmail").val()=="") {
            $("#tbGmail").html("*bắt buộc nhập")
            return false
        }
        if(!reGmail.test($("#txtGmail").val())) {
            $("#tbGmail").html("*Gmail phải kết thúc bằng @gmail.com")
            return false
        }
        $("#tbGmail").html("*")
        return true
    }
    $("#txtGmail").blur(KiemtraGmail)

    function KiemtraSDT() {
        var reSDT = /^0\d{3}\d{3}\d{3}$/
        if($("#txtSDT").val()=="") {
            $("#tbSDT").html("*bắt buộc nhập")
            return false
        }
       if(isNaN($("#txtSDT").val())) {
            $("#tbSDT").html("*phải nhập số")
            return false
        }
        if(!reSDT.test($("#txtSDT").val())) {
            $("#tbSDT").html("*10 chữ số nhập theo mẫu 0xxx-xxx-xxx")
            return false
        }
        $("#tbSDT").html("*")
        return true
    }
    $("#txtSDT").blur(KiemtraSDT)

    function KiemtraNickName() {
        if($("#txtNickName").val()=="") {
            $("#tbNickName").html("*bắt buộc nhập")
            return false
        }
        $("#tbNickName").html("*")
        return true
    }
    $("#txtNickName").blur(KiemtraNickName)

    $(document).ready(function() {
        $('.btn').click(function(){
            if(!KiemtraHoTen() || !KiemtraMatKhau() ||!KiemtraGmail || !KiemtraSDT) {
                $("#thongbao").html("Mời bạn nhập đúng và đầy đủ thông tin")
                return false
            }
            alert('Đăng ký thành công !')
            return true
        });
    })
});