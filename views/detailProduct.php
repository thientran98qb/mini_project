<?php require "layouts/header.php"; ?>
<div id="main-content-wp" class="detail-product-page clearfix">
    <div class="wp-inner clearfix">
        <?php require_once "layouts/sidebar.php"; ?>
        <div id="content" class="fl-right">
            <div class="section" id="info-product-wp">
                <div class="section-detail clearfix">
                    <div class="thumb fl-left">
                        <img src="assets/uploads/<?php echo $product['product_img']; ?>" alt="">
                    </div>
                    <div class="detail fl-right">
                        <h3 class="title"><?php echo $product['product_name']; ?></h3>
                        <?php if($product['product_sale_price']==0) {?>
                        <p class="price"><?php echo processPrice($product['product_price'],'VND'); ?></p>
                        <?php }else{?>
                        <p class="price"><?php echo processPrice($product['product_sale_price'],'VND'); ?></p>
                        <p class="product-code">Giá gốc : <span
                                style="text-decoration: line-through;"><?php echo processPrice($product['product_price'],'VND'); ?></span>
                        </p>
                        <?php }?>
                        <div class="desc-short">
                            <h5>Mô tả sản phẩm:</h5>
                            <p><?php echo $product['product_description']; ?></p>
                        </div>
                        <div class="num-order-wp">
                            <span>Số lượng:</span>
                            <input type="number" id="num-order" name="num-order" min="1" value="1">
                            <input type="hidden" id="productID" value="<?php echo $product['product_id'];?>">
                            <a href="?module=processCart&product_id=<?php echo $product['product_id'];?>" title="" class="add-to-cart">Thêm giỏ hàng</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="section" id="desc-wp">
                <div class="section-head">
                    <h3 class="section-title">Chi tiết sản phẩm</h3>
                </div>
                <div class="section-detail">
                    <?php echo $product['product_content']; ?>
                </div>
            </div>
        </div>
    </div>
    
</div>
<?php require "layouts/footer.php"; ?>