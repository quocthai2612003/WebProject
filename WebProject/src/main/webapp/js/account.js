function kiemTraMatKhau() {
    matKhau = document.getElementById("password").value;
    nhapLaiMatKhau = document.getElementById("password__repeat").value;
    if (matKhau != nhapLaiMatKhau && matKhau != "") {
        document.getElementById("checkPass").innerHTML = "Mật khẩu không khớp";
        document.getElementById("checkPass").classList.add("notification-error");
    } else {
        document.getElementById("checkPass").innerHTML = "";
    }
}

function kiemTraSuThayDoi(element, row) {
    row.classList.add("background-yellow");
}


function kiemTraSoDienThoai() {
    var phone = document.getElementById("phone").value;
    var kiemTraPhone = /^[0-9]{10}$/;
    if (kiemTraPhone.test(phone) || phone == 0) {
        document.getElementById("checkPhone").innerHTML = "";
    } else {
        document.getElementById("checkPhone").innerHTML = "Số điện thoại không hợp lệ";
        console.log("helo");
        document.getElementById("checkPhone").classList.add("notification-error");
    }
}