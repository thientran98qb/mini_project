<?php include DOCUMENT_ROOT."/views/admin/layouts/header.php"; ?>
<div class="container-fluid py-5">
    <div class="row">
        <div class="col">
            <div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
                <div class="card-header">ĐƠN HÀNG THÀNH CÔNG</div>
                <div class="card-body">
                    <h5 class="card-title"><?php echo $count[0]['countStatus']; ?></h5>
                    <p class="card-text">Đơn hàng giao dịch thành công</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card text-white bg-danger mb-3" style="max-width: 18rem;">
                <div class="card-header">ĐANG XỬ LÝ</div>
                <div class="card-body">
                    <h5 class="card-title"><?php echo $count[2]['countStatus']; ?></h5>
                    <p class="card-text">Số lượng đơn hàng đang xử lý</p>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card text-white bg-success mb-3" style="max-width: 18rem;">
                <div class="card-header">DOANH SỐ</div>
                <div class="card-body">
                    <h5 class="card-title"><?php echo processPrice($count[3]['venue'],"VND"); ?></h5>
                    <p class="card-text">Doanh số hệ thống</p>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card text-white bg-dark mb-3" style="max-width: 18rem;">
                <div class="card-header">ĐƠN HÀNG HỦY</div>
                <div class="card-body">
                    <h5 class="card-title"><?php echo $count[1]['countStatus']; ?></h5>
                    <p class="card-text">Số đơn bị hủy trong hệ thống</p>
                </div>
            </div>
        </div>
    </div>
    <!-- end analytic  -->
    <div class="card">
        <div class="card-header font-weight-bold">
            ĐƠN HÀNG MỚI
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Mã</th>
                        <th scope="col">Khách hàng</th>
                        <th scope="col">Địa chỉ</th>
                        <th scope="col">Ghi chú</th>
                        <th scope="col">Hình thức thanh toán</th>
                        <th scope="col">Trạng thái</th>
                        <th scope="col">Tổng tiền hóa đơn</th>
                        <th scope="col">Tác vụ</th>
                    </tr>
                </thead>
                <tbody>
                <?php $i=0; ?>
                <?php foreach ($customers as $key => $customer) {?>
                    <tr class="align-middle">
                        <td><p><?php echo $customer['id']; ?></p></td>
                        <td>
                            <?php echo $customer['customer_name']; ?><br>
                           <p class="p-2"><?php echo $customer['customer_phone']; ?></p> 
                        </td>
                        <td><p> <?php echo $customer['customer_address']; ?></p></td>
                        <td><p><?php echo $customer['note']; ?></p></td>
                        <td>
                            <?php if($customer['payment_id']==0) {?>
                                <p><?php echo $customer['payment_name']; ?></p>
                            <?php }else{?>
                                <p><?php echo $customer['payment_name']; ?></p>
                            <?php } ?>
                        </td>
                        <td>
                        <?php if($customer['status']==0) {?>
                            <span class="badge badge-warning">
                            Đang xử lý
                            </span>
                        <?php }elseif($customer['status']==1){ ?>
                            <span class="badge badge-success">
                            Da Xac Nhan
                            </span>
                        <?php }else{?>
                            <span class="badge badge-danger">
                            Don Hang Huy
                            </span>                 
                        <?php }?>
                        </td>
                        <td><?php echo processPrice($customer['total_orders'],'VND'); ?></p></td>
                        <td>
                            <a href=".?controller=admin&module=detailOrder&order_id=<?php echo $customer['id']; ?>" class="btn btn-success btn-sm rounded-0 text-white" type="button" data-toggle="tooltip" data-placement="top" title="Edit"><i class="fa fa-edit"></i></a>
                            <a href=".?controller=admin&module=deleteOrder&id=<?php echo $customer['id']; ?>" class="btn btn-danger btn-sm rounded-0 text-white" type="button" data-toggle="tooltip" data-placement="top" title="Delete"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                <?php }?>
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <?php echo pagination($total_page,$current_page,"?controller=admin&module=home") ?>
            </nav>
        </div>
    </div>

</div>
<?php include DOCUMENT_ROOT."/views/admin/layouts/footer.php"; ?>
