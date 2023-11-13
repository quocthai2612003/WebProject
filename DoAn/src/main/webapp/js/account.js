function kiemTraMatKhau() {
    matKhau = document.getElementById("password").value;
    nhapLaiMatKhau = document.getElementById("password__repeat").value;
    if (matKhau != nhapLaiMatKhau) {
        document.getElementById("notification").innerHTML = "Mật khẩu không khớp";
    } else {
        document.getElementById("notification").innerHTML = "";
    }
}