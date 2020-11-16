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
            <button href="" data-toggle="modal" data-target="#categoryModal" id="btn-add" class="btn btn-primary p-2">Add Category</button>
        </div>
        <div class="alert alert-success text-center message" role="alert" style="display: none;">

        </div>
        <?php require "addform.php"; ?>
        <?php require "detail.php"; ?>
        <table class="table"  id="categorytable">
        <thead>
            <tr>
            <th scope="col">STT</th>
            <th scope="col">Category Name</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            
        </tbody>
        </table><!-- table -->  
    </div>

</div>
<?php include DOCUMENT_ROOT."/views/admin/layouts/footer.php"; ?>
