<?php include DOCUMENT_ROOT."/views/admin/layouts/header.php"; ?>
<div class="container">
    <div class="list_product p-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Category</li>
        </ol>
    </nav>
        <div class="p-2">
            <button href="" data-toggle="modal" data-target="#categoryModal" class="btn btn-primary p-2">Add Category</button>
        </div>
        <?php require "addform.php"; ?>
        <table class="table"  id="userstable">
        <thead>
            <tr>
            <th scope="col">STT</th>
            <th scope="col">Category Name</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <?php $i=0; ?>
            <?php foreach ($category as $key => $value) { ?>        
            <tr>
                <td class="align-middle"><?php echo ++$i; ?></td>
                <td class="align-middle"><?php echo $value['category_name']; ?></td>
                <td class="align-middle"><?php echo $value['status']; ?></td>
                <td class="align-middle">
                <a href="#" class="btn btn-success mr-3 profile" data-toggle="modal" data-target="#userViewModal" title="Prfile"><i class="fa fa-address-card-o" aria-hidden="true"></i></a>
                <a href="#" class="btn btn-warning mr-3 edituser" data-toggle="modal" data-target="#userModal" title="Edit"><i class="fa fa-pencil-square-o fa-lg"></i></a>
                <a href="#" class="btn btn-danger deleteuser" data-userid="14" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a>
                </td>
            </tr>
            <?php } ?>
        </tbody>
        </table><!-- table -->  
    </div>

</div>
<?php include DOCUMENT_ROOT."/views/admin/layouts/footer.php"; ?>
