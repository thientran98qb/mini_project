<?php require "layouts/header.php"; ?>
<div id="main-content-wp" class="home-page">
    <div class="wp-inner clearfix">
    <?php require_once "layouts/sidebar.php"; ?>
        <div id="content" class="fl-right">
        <?php foreach ($data as $key => $value) {?>
            <div class="section list-cat">
                <div class="section-head">
                    <h3 class="section-title"><?php echo $value['category_name'] ?></h3>
                </div>
                <div class="section-detail">
                    <ul class="list-item clearfix">
                        <?php $productByCategory=$this->HomeModel->getProductbyCategory($value['category_id']); ?>
                        <?php foreach ($productByCategory as $key => $product) {?>
                            <?php if($product['product_status']==0) {?>
                            <li>
                                <a href="?module=detailProduct&product_id=<?php echo $product['product_id'];?>" title="" class="thumb">
                                    <img src="assets/uploads/<?php echo $product['product_img'] ?>" height="200px" alt="">
                                </a>
                                <a href="?module=detailProduct&product_id=<?php echo $product['product_id'];?>" title="" class="title" style="text-align: center;"><?php echo $product['product_name'] ?></a>
                                <?php if($product['product_sale_price']>0) {?>
                                    <p class="price" style="text-decoration:line-through;text-align:center;"><?php echo processPrice($product['product_price'],'VND');?></p>
                                    <p class="price" style="text-align: center;"><?php echo processPrice($product['product_sale_price'],'VND');?></p>
                                <?php }else{ ?>
                                    <p class="price" style="text-align:center;"><?php echo processPrice($product['product_price'],'VND');?></p>
                                <?php } ?>
                                
                            </li>
                            <?php } ?>
                        <?php }?>
                    </ul>
                </div>
            </div>
            <?php } ?>
        </div>
    </div>
</div>
<?php require "layouts/footer.php"; ?>
