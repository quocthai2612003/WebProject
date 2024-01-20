<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="" />
    <meta name="author" content="PQL" />
    <title>Liên hệ | PQL</title>
    <meta name="keywords" content="PQL"/>
    <!--Web icon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!--google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.4.2/js/all.js" crossorigin="anonymous"></script>
    <!--bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>
    <!--    jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
<div id="header_contain"></div>
<section class="bg-light pb-5">
    <div class="container main-content">
        <div class='breadcrumbs row-item'>
            <ol class="breadcrumb row-item">
                <li class='breadcrumb-item breadcrumbs-first'>
                    <a title='PQL' href="home.jsp" rel='nofollow'>Trang chủ</a>
                </li>
                <li class="breadcrumb-item">Liên hệ</li>
            </ol><!-- END: .breadcrumb-content -->
        </div><!-- END: .breadcrumb -->
        <div class="row justify-content-md-center">
            <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
                <h2 class="mb-4 display-5 text-center text-uppercase">Liên hệ</h2>
                <p class="text-secondary mb-2 text-center">Chúng tôi rất hân hạnh khi nhận được thông tin từ bạn. Để liên hệ, vui lòng điền vào mẫu dưới đây hoặc gửi email trực tiếp đến địa chỉ của chúng tôi. Chúng tôi sẽ phản hồi lại bạn trong thời gian sớm nhất có thể. Xin cảm ơn!</p>
                <hr class="w-50 mx-auto mb-5 mb-xl-9 border-dark-subtle">
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row justify-content-lg-center">
            <div class="col-12 col-lg-9">
                <div class="bg-white border rounded shadow-sm overflow-hidden">

                    <form action="#!">
                        <div class="row gy-4 gy-xl-5 p-4 p-xl-5">
                            <div class="col-12 col-md-6">
                                <label for="fullname" class="form-label">Họ tên <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="fullname" name="fullname" value="" required>
                            </div>
                            <div class="col-12 col-md-6">
                                <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                                <div class="input-group">
                  <span class="input-group-text">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
                      <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z" />
                    </svg>
                  </span>
                                    <input type="email" class="form-control" id="email" name="email" value="" required>
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="message" class="form-label">Nội dung <span class="text-danger">*</span></label>
                                <textarea class="form-control" id="message" name="message" rows="3" required></textarea>
                            </div>
                            <div class="col-12">
                                <div class="d-grid">
                                    <button class="btn btn-primary btn-lg col-md-2" type="submit">Gửi Liên Hệ</button>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</section>
<div id="footer_contain"></div>
<script>
    $(function () {
        $('#header_contain').load("header.jsp")
        $('#footer_contain').load("footer.jsp")
    })
</script>
</body>
</html>