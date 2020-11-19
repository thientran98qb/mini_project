<?php require "layouts/header.php"; ?>

<div id="main-content-wp" class="checkout-page ">
    <div class="wp-inner clearfix">
        <?php require_once "layouts/sidebar.php"; ?>
        <div id="content" class="fl-right">
            <div class="section" id="checkout-wp">
                <div class="section-head">
                    <h3 class="section-title">Thanh toán</h3>
                </div>
                <div class="section-detail">
                    <div class="wrap clearfix">
                        <form method="POST" action=".?controller=home&module=processCheckout">
                            <div id="custom-info-wp" class="fl-left">
                                <h3 class="title">Thông tin khách hàng</h3>
                                <div class="detail">
                                    <div class="field-wp">
                                        <label>Họ tên</label>
                                        <input type="text" name="fullname" id="fullname" value="<?php echo put_value('fullname'); ?>">
                                        <div id="error"> <?php echo put_error('error_fullname'); ?></div>
                                    </div>
                                    
                                    <div class="field-wp">
                                        <label>Email</label>
                                        <input type="email" name="email" id="email" value="<?php echo put_value('email'); ?>">
                                        <div id="error"> <?php echo put_error('error_email'); ?></div>
                                    </div>
                                    <div class="field-wp">
                                        <label>Địa chỉ nhận hàng</label>
                                        <input type="text" name="address" id="address" value="<?php echo put_value('address'); ?>">
                                        <div id="error"> <?php echo put_error('error_address'); ?></div>
                                    </div>
                                    <div class="field-wp">
                                        <label>Số điện thoại</label>
                                        <input type="tel" name="tel" id="tel" value="<?php echo put_value('tel'); ?>">
                                        <div id="error"> <?php echo put_error('error_tel'); ?></div>
                                    </div>
                                    <div class="field-full-wp">
                                        <label>Ghi chú</label>
                                        <textarea name="note"></textarea>
                                    </div>

                                </div>
                            </div>
                            <div id="order-review-wp" class="fl-right">
                                <h3 class="title">Thông tin đơn hàng</h3>
                                <div class="detail">
                                    <table class="shop-table">
                                        <thead>
                                            <tr>
                                                <td>Sản phẩm(<?php echo $total_cart['total_quantity']; ?>)</td>
                                                <td>Tổng</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($cart as $key => $value) { ?>
                                            <tr class="cart-item">
                                                <td class="product-name"><?php echo $cart[$key]['product_name']; ?><strong class="product-quantity">x <?php echo $cart[$key]['quantity']; ?></strong></td>
                                                <td class="product-total"><?php echo processPrice($cart[$key]['total_price_product'],"VND"); ?></td>
                                            </tr>
                                            <?php } ?>
                                        </tbody>
                                        <tfoot>
                                            <tr class="order-total">
                                                <td>Tổng đơn hàng: <?php echo processPrice($total_cart['total'],"VND"); ?></td>
                                                <td><strong class="total-price"></strong></td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                    <div id="payment-checkout-wp">
                                        <ul id="payment_methods">
                                            <li>
                                                <input type="radio" checked="checked" id="direct-payment" name="payment-method" value="1">
                                                <label for="direct-payment">Internet Banking/Momo</label>
                                            </li>
                                            <li>
                                                <input type="radio" id="payment-home" name="payment-method" value="2">
                                                <label for="payment-home">Thanh toán tại nhà</label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="place-order-wp clearfix">
                                        <button type="submit" name="checkout">Đặt hàng</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require "layouts/footer.php"; ?>
