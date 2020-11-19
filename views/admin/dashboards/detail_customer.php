<?php include DOCUMENT_ROOT."/views/admin/layouts/header.php"; ?>
<div class="container-fluid py-5">
    <div class="info_order">
        <a href=".?controller=admin&module=home" class="btn btn-primary">Back Home</a>
        <div class="card">
        <?php if($detailCustomer['status']==1){?>
            <div class="alert alert-primary" role="alert">
                Đơn hàng đã được xác nhận
            </div>
        <?php }?>
        <?php if($detailCustomer['status']==2){?>
            <div class="alert alert-danger" role="alert">
                Đơn hàng đã bị hủy
            </div>
        <?php }?>
            <div class="card-header font-weight-bold">
                Detail Order Customer
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="">Ten khach hang</label>
                    <p class="form-control"><?php echo $detailCustomer['customer_name']; ?></p>
                </div>
                <div class="form-group">
                    <label for="">Dia Chi</label>
                    <p class="form-control"><?php echo $detailCustomer['customer_address']; ?></p>
                </div>
                <div class="form-group">
                    <label for="">Email</label>
                    <p class="form-control"><?php echo $detailCustomer['customer_email']; ?></p>
                </div>
                <div class="card">
                    <label for="">San Pham</label>
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
                            <?php foreach ($products as $key => $product) {?>
                            <?php $detail_product=$this->AdminModel->getProductbyOrder_id($product['product_id'],$product['order_id']);?>
                            <tr>
                                <td><?php echo $detail_product['product_id']; ?></td>
                                <td>
                                    <a href="" title="" class="thumb">
                                        <img src="assets/uploads/<?php echo $detail_product['product_img']; ?>"
                                            width="100px" height="100px" alt="">
                                    </a>
                                </td>
                                <td>
                                    <a href="?module=detailProduct&product_id=<?php echo $detail_product['product_id'];?>"
                                        title="" class="name-product"><?php echo $detail_product['product_name']; ?></a>
                                </td>
                                <td>
                                    <?php if($detail_product['product_sale_price']==0) {?>
                                    <p class="price"><?php echo processPrice($detail_product['product_price'],'VND'); ?></p>
                                    <?php }else{?>
                                    <p class="price"><?php echo processPrice($detail_product['product_sale_price'],'VND'); ?>
                                    </p>
                                    
                                    <?php }?>
                                </td>
                                <td>
                                    <input type="text" disabled value="<?php echo $detail_product['quantity']; ?>"
                                        class="text-center p-2">
                                </td>
                                <td>
                                    <p>
                                        <?php echo processPrice($detail_product['total_price'],'VND'); ?></p>
                                </td>
                            </tr>
                            <?php }?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="7">
                                    <div class="clearfix">
                                        <p class="fl-right" style="font-weight:600;">Tổng giá: <span
                                                id="total-price"><?php echo processPrice($detailCustomer['total_orders'],'VND'); ?></span>
                                        </p>
                                    </div>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="form-group">
                    <label for="">Ngay Dat Hang</label>
                    <p class="form-control"><?php echo $detailCustomer['date_order']; ?></p>
                </div>
                <div class="form-group">
                    <label for="">Tong hoa don</label>
                    <p class="form-control"><?php echo processPrice($detailCustomer['total_orders'],'VND'); ?></p>
                </div>
                <div class="form-group">
                    <?php if($detailCustomer['status']!=1){?>
                        <a href=".?controller=admin&module=acceptOrder&order_id=<?php echo $detailCustomer['order_id']; ?>&id_c=<?php echo $detailCustomer['id']; ?>&status=1&id=<?php echo $detailCustomer['customer_id']; ?>" class="btn btn-success">Xác nhận</a>
                    <?php } ?>
                    <?php if($detailCustomer['status']!=2 && $detailCustomer['status']!=1){?>
                        <a href=".?controller=admin&module=cancelOrder&status=2&id=<?php echo $detailCustomer['customer_id']; ?>"  class="btn btn-danger">Huy Don Hang</a>
                    <?php } ?>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<?php include DOCUMENT_ROOT."/views/admin/layouts/footer.php"; ?>