<?php include DOCUMENT_ROOT."/views/admin/layouts/header.php"; ?>
<div class="container">
    <div class="list_product p-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page">Product</li>
        </ol>
    </nav>
        <table class="table"  id="userstable">
        <thead>
            <tr>
            <th scope="col">Img</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Phone</th>
            <th scope="col"></th>
            </tr>
        </thead>
        <tbody><tr>
            <td class="align-middle"><img src="http://placehold.it/80x80" class="img-thumbnail rounded float-left"></td>
            <td class="align-middle">Virat Kohli</td>
            <td class="align-middle">virat@example.com</td>
            <td class="align-middle">xxxxxxxxxx</td>
            <td class="align-middle">
            <a href="#" class="btn btn-success mr-3 profile" data-toggle="modal" data-target="#userViewModal" title="Prfile"><i class="fa fa-address-card-o" aria-hidden="true"></i></a>
            <a href="#" class="btn btn-warning mr-3 edituser" data-toggle="modal" data-target="#userModal" title="Edit"><i class="fa fa-pencil-square-o fa-lg"></i></a>
            <a href="#" class="btn btn-danger deleteuser" data-userid="14" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a>
            </td>
            </tr><tr>
            <td class="align-middle"><img src="http://placehold.it/80x80" class="img-thumbnail rounded float-left"></td>
            <td class="align-middle">MS Dhoni</td>
            <td class="align-middle">dhoni@example.com</td>
            <td class="align-middle">xxxxxxxxxx</td>
            <td class="align-middle">
            <a href="#" class="btn btn-success mr-3 profile" data-toggle="modal" data-target="#userViewModal" title="Prfile"><i class="fa fa-address-card-o" aria-hidden="true"></i></a>
            <a href="#" class="btn btn-warning mr-3 edituser" data-toggle="modal" data-target="#userModal" title="Edit"><i class="fa fa-pencil-square-o fa-lg"></i></a>
            <a href="#" class="btn btn-danger deleteuser" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a>
            </td>
            </tr><tr id="row-9">
            <td class="align-middle"><img src="http://placehold.it/80x80" class="img-thumbnail rounded float-left"></td>
            <td class="align-middle">Sachin Tendulkar</td>
            <td class="align-middle">sachin@example.com</td>
            <td class="align-middle">xxxxxxxxxx</td>
            <td class="align-middle">
            <a href="#" class="btn btn-success mr-3 profile" data-toggle="modal" data-target="#userViewModal" title="Prfile"><i class="fa fa-address-card-o" aria-hidden="true"></i></a>
            <a href="#" class="btn btn-warning mr-3 edituser" data-toggle="modal" data-target="#userModal" title="Edit"><i class="fa fa-pencil-square-o fa-lg"></i></a>
            <a href="#" class="btn btn-danger deleteuser" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a>
            </td>
            </tr>
            <tr>
            <td class="align-middle"><img src="http://placehold.it/80x80" class="img-thumbnail rounded float-left"></td>
            <td class="align-middle">Rohit Sharma</td>
            <td class="align-middle">rohit@example.com</td>
            <td class="align-middle">xxxxxxxxxx</td>
            <td class="align-middle">
            <a href="#" class="btn btn-success mr-3 profile" data-toggle="modal" data-target="#userViewModal" title="Prfile"><i class="fa fa-address-card-o"></i></a>
            <a href="#" class="btn btn-warning mr-3 edituser" data-toggle="modal" data-target="#userModal" title="Edit"><i class="fa fa-pencil-square-o fa-lg"></i></a>
            <a href="#" class="btn btn-danger deleteuser" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a>
            </td>
            </tr>
        </tbody>
        </table><!-- table -->  
        </div>

</div>
<?php include DOCUMENT_ROOT."/views/admin/layouts/footer.php"; ?>
