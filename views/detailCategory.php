<?php require "layouts/header.php"; ?>
<div id="main-content-wp" class="category-product-page">
    <div class="wp-inner clearfix">
        <?php require_once "layouts/sidebar.php"; ?>
        <div id="content" class="fl-right">
            <div class="section list-cat">
                <div class="section-head">
                    <h3 class="section-title"><?php echo $count["category_name"] ?></h3>
                    <p class="section-desc">Có <?php echo $count["pcount"] ?> sản phẩm trong mục này</p>
                </div>
                <div class="section-detail">
                    <ul class="list-item clearfix">
                        <?php foreach ($products as $key => $value) {?>
                        <li>
                            <a href="?module=detailProduct&product_id=<?php echo $value['product_id'];?>" title="" class="thumb">
                                <img src="assets/uploads/<?php echo $value['product_img'] ?>" height="200px" alt="">
                            </a>
                            <a href="?module=detailProduct&product_id=<?php echo $value['product_id'];?>" title="" class="title" style="text-align: center;"><?php echo $value['product_name'] ?></a>
                                <?php if($value['product_sale_price']>0) {?>
                                    <p class="price" style="text-decoration:line-through;text-align:center;"><?php echo processPrice($value['product_price'],'VND');?></p>
                                    <p class="price" style="text-align: center;"><?php echo processPrice($value['product_sale_price'],'VND');?></p>
                                <?php }else{ ?>
                                    <p class="price" style="text-align:center;"><?php echo processPrice($value['product_price'],'VND');?></p>
                                <?php } ?>
                        </li>
                        <?php } ?>
                    </ul>
                </div>
                <div class="section" id="pagenavi-wp">
                <div class="section-detail">
                    <?php echo pagination($totalpage,$page,".?controller=home&module=detailCategory&category_id=".$category_id); ?>  
                </div>
            </div>
            </div>
            
        </div>
    </div>
</div>
<?php require "layouts/footer.php"; ?>
