<?php include DOCUMENT_ROOT."/views/admin/layouts/header.php"; ?>
<div class="container">
    <div class="list_product p-3">
    <?php if(!empty($products)){ ?>
        <table class="table table-hover"  id="userstable">
        <thead>
            <tr>
            <th scope="col">Thumb</th>
            <th scope="col">Name</th>
            <th scope="col">Product Desc</th>
            <th scope="col">Product Price</th>
            <th scope="col">Status</th>
            <th scope="col">Category</th>
            <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($products as $key => $value) {?>
            <tr>
                <td class="align-middle"><img src="assets/uploads/<?php echo $value['product_img']; ?>" class="img-thumbnail rounded float-left"></td>
                <td class="align-middle"><?php echo $value['product_name']; ?></td>
                <td class="align-middle"><?php echo $value['product_description']; ?></td>
                <td class="align-middle">
                    <p>Product Price: <span style="font-weight: 600;"><?php echo processPrice($value['product_price'],'VND'); ?></span></p>
                    <p>Product Price Sale: <span style="font-weight: 600;"><?php echo processPrice($value['product_sale_price'],'VND');?></span></p>
                </td>
                <td class="align-middle">
                    <?php if($value['product_status']==0){ ?>
                        <span class="badge badge-success">Active</span>
                    <?php }else{ ?>
                        <span class="badge badge-danger">Non Active</span>
                    <?php }?>
                </td>
                <td class="align-middle"><?php echo $value['category_name']; ?></td>
                <td class="align-middle">
                    <a href="#" class="btn btn-success mr-1 profile" data-toggle="modal" data-target="#userViewModal" title="Prfile"><i class="fa fa-address-card-o" aria-hidden="true"></i></a>
                    <a href="#" class="btn btn-warning mr-1 edituser" data-toggle="modal" data-target="#userModal" title="Edit"><i class="fa fa-pencil-square-o fa-lg"></i></a>
                    <a href="#" class="btn btn-danger deleteuser" data-userid="14" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a>
                </td>
            </tr>
            <?php } ?>
        </tbody>
        </table><!-- table --> 
    <?php }else { ?>
        <p>No records in the table</p>
    <?php }?> 
        </div>

</div>
<?php include DOCUMENT_ROOT."/views/admin/layouts/footer.php"; ?>
