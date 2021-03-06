<html>
    <head>
        <title>Thien Tran</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/bootstrap/bootstrap-theme.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/reset.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/style.css" rel="stylesheet" type="text/css"/>
        <link href="assets/responsive.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/jquery-2.2.4.min.js" type="text/javascript"></script>
        <script src="assets/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/js/main.js" type="text/javascript"></script>
    </head>
    <body>
        <div id="site">
            <div id="container">
                <div id="header-wp" class="clearfix">
                    <div class="wp-inner">
                        <a href="./" title="" id="logo" class="fl-left">THIENTRAN STORE</a>
                        <div id="btn-respon" class="fl-right"><i class="fa fa-bars" aria-hidden="true"></i></div>
                        <div id="cart-wp" class="fl-right">
                            <a href="?module=showCart" title="" id="btn-cart">
                                <span id="icon"><img src="assets/images/icon-cart.png" alt=""></span>
                                <span id="num"><?php (isset($_SESSION['cart']['total_cart']['total_quantity'])) ? print_r($_SESSION['cart']['total_cart']['total_quantity']) : 0 ?></span>
                            </a>
                        </div>
                    </div>
                </div>