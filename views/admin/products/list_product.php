<?php include DOCUMENT_ROOT."/views/admin/layouts/header.php"; ?>
<div class="container">
    <div class="list_product p-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Product</li>
        </ol>
    </nav>
    <?php if(isset($alert) && $alert!=''){ ?>
        <div class="alert alert-success" role="alert">
            <?php echo $alert; ?>
        </div>
    <?php }?>
        <a href=".?controller=admin&module=addViewProduct" class="btn btn-primary">Add Product</a>
        <?php if(!empty($products)) {?>
        <table class="table table-hover table-bordered"  id="userstable">
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
                    <a href="#" class="btn btn-success btn-sm detailProduct" data-toggle="modal" data-id="<?php echo $value['product_id']; ?>" data-target="#productViewModal" title="Prfile"><i class="fa fa-address-card-o" aria-hidden="true"></i></a>
                    <a href=".?controller=admin&module=editViewProduct&idproduct=<?php echo $value['product_id'];?>" class="btn btn-warning btn-sm edituser" title="Edit"><i class="fa fa-pencil-square-o fa-lg"></i></a>
                    <a href="#" class="btn btn-danger btn-sm deleteProduct" data-id="<?php echo $value['product_id']; ?>" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a>
                </td>
            </tr>
            <?php } ?>
        </tbody>
        </table><!-- table -->  
        <?php }else{?>
            <h1>No records in table</h1>
        <?php } ?>
    </div>
<?php require "detail_product.php"; ?>
</div>
<?php include DOCUMENT_ROOT."/views/admin/layouts/footer.php"; ?>
