<?php require "layouts/header.php"; ?>
<div id="main-content-wp" class="cart-page">
    <div class="section" id="breadcrumb-wp">
        <div class="wp-inner">
            <div class="section-detail">
                <h3 class="title">Giỏ hàng</h3>
            </div>
        </div>
    </div>
    <div id="wrapper" class="wp-inner clearfix">
        <div class="section" id="info-cart-wp">
            <div class="section-detail table-responsive">
                <?php if(isset($_SESSION['cart'])&& !empty($_SESSION['cart']['product'])){ ?>
                <table class="table">
                    <thead>
                        <tr>
                            <td>Mã sản phẩm</td>
                            <td>Ảnh sản phẩm</td>
                            <td>Tên sản phẩm</td>
                            <td>Giá sản phẩm</td>
                            <td>Số lượng</td>
                            <td colspan="2">Thành tiền</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($cart as $key => $value) {?>
                        <tr>
                            <td><?php echo $value['product_id']; ?></td>
                            <td>
                                <a href="" title="" class="thumb">
                                    <img src="assets/uploads/<?php echo $value['product_img']; ?>" alt="">
                                </a>
                            </td>
                            <td>
                                <a href="?module=detailProduct&product_id=<?php echo $value['product_id'];?>" title="" class="name-product"><?php echo $value['product_name']; ?></a>
                            </td>
                            <td><?php echo processPrice($value['product_price'],'VND'); ?></td>
                            <td>
                                <input type="number" name="num-order" min="1" data-id="<?php echo $value['product_id']; ?>" value="<?php echo $value['quantity']; ?>" class="num-order" >
                            </td>
                            <td>
                                <p class="total_price_product<?php echo $value['product_id']; ?>"><?php echo processPrice($value['total_price_product'],'VND'); ?></p>
                            </td>
                            <td>
                                <a href="?module=deleteCartbyId&product_id=<?php echo $value['product_id']; ?>" title="" class="del-product"><i class="fa fa-trash-o"></i></a>
                            </td>
                        </tr>
                        <?php }?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="7">
                                <div class="clearfix">
                                    <p class="fl-right">Tổng giá: <span id="total-price"><?php echo processPrice($total['total'],'VND'); ?></span></p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <div class="clearfix">
                                    <div class="fl-right">
                                        <a href="?module=checkout" title="" id="checkout-cart">Thanh toán</a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tfoot>
                </table>
                <?php }else{?>
                    <p style="text-align: center;font-size:20px;font-weight:600;">Không có sản phẩm nào trong giỏ hàng</p>
                <?php }?>
            </div>
        </div>
        <div class="section" id="action-cart-wp">
            <div class="section-detail">
                <p class="title">Click vào <span>“Cập nhật giỏ hàng”</span> để cập nhật số lượng. Nhập vào số lượng <span>0</span> để xóa sản phẩm khỏi giỏ hàng. Nhấn vào thanh toán để hoàn tất mua hàng.</p>
                <a href="?" title="" id="buy-more">Mua tiếp</a><br/>
                <a href="?module=deleteCart" title="" id="delete-cart">Xóa giỏ hàng</a>
            </div>
        </div>
    </div>
</div>
<?php require "layouts/footer.php"; ?>