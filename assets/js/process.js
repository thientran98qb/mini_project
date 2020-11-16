$(document).ready(function(){
    function getRow(category,i=0){
        var str="";
        str+=`
        <tr>
                <td class="align-middle">${i}</td>
                <td class="align-middle"><a href=".?controller=admin&module=showProductbyCategory&category_id=${category['category_id']}">${category['category_name']}</a></td>
                <td class="align-middle">
                    <input type="checkbox" class="statusChange" data-id=${category['category_id']}  ${ (category['status'] == 1) ? "checked" : "" }  data-toggle="toggle" data-on="Active" data-off="NonActive" data-onstyle="info" data-offstyle="danger">
                </td>
                <td class="align-middle">
                <a href="#" class="btn btn-success btn-sm mr-3 profile" data-categoryid="${category['category_id']}" data-toggle="modal" data-target="#categoryViewModal" title="Prfile"><i class="fa fa-address-card-o" aria-hidden="true"></i></a>
                <a href="#" class="btn btn-warning btn-sm mr-3 editCategory" data-categoryid="${category['category_id']}" data-toggle="modal" data-target="#categoryModal" title="Edit"><i class="fa fa-pencil-square-o fa-lg"></i></a>
                <a href="#" class="btn btn-danger btn-sm deletecategory" data-categoryid="${category['category_id']}" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a>
                </td>
        </tr>
        `;
        return str;
    }
    function load(){
        $.ajax({
            url:".?controller=admin&module=viewCategoryAjax",
            type:"GET",
            dataType:"json",
            data:{},
            success:function(result){
                var rows="";
                $.each(result.category,function(index,value){
                    rows+=getRow(value,index);           
                });
                
                $("#categorytable tbody").html(rows)
            }
        });
    }
    $(document).on("submit",'#addform',function(e){
        e.preventDefault();
        var ms=$("#category_id").val()!='' ? 'Updated success' : 'Add new success' ;
        $.ajax({
            url:".?controller=admin&module=addCategroy",
            type:"POST",
            dataType:"JSON",
            data:new FormData(this),
            processData: false,
            contentType: false, 
            success:function(rows){
                Swal.fire(
                    ms,
                    'You clicked the button!',
                    'success'
                )
                $("#categoryModal").modal("hide");
                load();

                $("#addform")[0].reset();
            },
            error:function(){
                console.log('error');
            }
        });
    });
    $(document).on("change",".statusChange",function(e){
        let idChangee=$(this).data("id");
        statuss=$(this).prop("checked")==true ? 1 : 0;
        $.ajax({
            url:".?controller=admin&module=changeStatusCategory",
            type:"GET",
            dataType:"JSON",
            data:{id:parseInt(idChangee),tt: parseInt(statuss)},
            success:function(result){
                if(result){
                    $(".message").html("<p>"+result.update+"</p>").fadeIn().delay(2000).fadeOut();
                }
            },
            error:function(){
                console.log("error");
            }
        });
    });
    $(document).on("click",".profile",function(e){
        idCate=$(this).data("categoryid");
        $.ajax({
            url:".?controller=admin&module=viewDetailCategory",
            type:"GET",
            dataType:"JSON",
            data:{id:idCate},
            success:function(result){
                if(result){
                    let str="";
                    str+=`
                    <div class="row">
                    <div class="col-sm-6 col-md-8">
                        <h4 class="text-primary">Category Name : ${result['row']['category_name']}</h4>
                        <p class="text-secondary">
                        <i class="fa fa-envelope-o" aria-hidden="true"></i>Status: ${(result['row']['status']==1) ? "Public" : "Private"}
                        <br />
                        </p>
                    </div>
                    </div>`;
                    $("#profile").html(str);
                }
            },
            error:function(){
                console.log("Not connect success");
            }
        });
    });
    $(document).on("click",".deletecategory",function(e){
        idCatee=$(this).data("categoryid");
        console.log(idCatee)
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
          }).then((result) => {
            if (!result.isConfirmed) return;
            $.ajax({
                url:".?controller=admin&module=deleteCategoryy",
                type:"GET",
                dataType:"JSON",
                data:{idCate:idCatee},
                success:function(results){
                    if(results){
                        Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                        load();
                    }
                },
                error:function(){
                    Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Something went wrong!',
                    footer: 'Record have constrain foreign key'
                  })
                }
            });
          });
        
    });
    $(document).on("click",".editCategory",function(){
        $("#statuss").removeAttr("checked","checked");
        id=$(this).data("categoryid");
        $.ajax({
            url:".?controller=admin&module=viewDetailCategory",
            type:"GET",
            dataType:"JSON",
            data:{id:id},
            success:function(result){
                if(result){
                    $("#category_name").val(result.row.category_name);
                    if(result.row.parent_id==0){
                        $("#root").attr("selected","selected");
                    }
                    if(result.row.status==1){
                        $("#status").attr("checked","checked");
                    }else{
                        $("#status").removeAttr("checked","checked");
                    }
                    $("#category_id").val(result.row.category_id);
                }
            },
            error:function(){

            }
        });
    });
    $(document).on("click","#btn-add",function(){
        $("#addform")[0].reset();
        $("#root").removeAttr("selected");
        $("#default").attr("selected");
        $("#status").removeAttr("checked","checked");
        $("#category_id").val("");
    });
    load();
    /*==============Process Product ===================*/
    $(document).on("click",".detailProduct",function(){
        let product_id=$(this).data('id');
        console.log(product_id);
        $.ajax({
            url:".?controller=admin&module=detailProduct",
            type:"GET",
            dataType:"JSON",
            data:{product_id:product_id},
            success:function(result){
                let str='';
                str+=` <div class="row">
                <div class="col-sm-6 col-md-4">
                    <img src="assets/uploads/${result.product.product_img}" height="100px" width="100px" alt="" class="rounded responsive" />
                </div>
                <div class="col-sm-6 col-md-8">
                    <h4 class="text-primary">${result.product.product_name}</h4>
                    <p class="text-secondary mt-2 mb-2">
                        ${result.product.product_description}
                    </p>
                    <p>Product Price: <span style="font-weight: 600;">${result.product.product_price} VND</span></p>
                    <p>Product Price Sale: <span style="font-weight: 600;">${result.product.product_sale_price} VND</span></p>
                    <p class="mt-2 mb-2">
                        Category : ${result.product.category_name}
                    </p>
                    <p class="mt-2 mb-2">
                        Date Created : ${result.product.product_date_created}
                    </p>
                </div>
                </div>`;
                $("#detailProductt").html(str);
            },
            error:function(){
                console.log('error');
            }
        });
    });
    $(document).on("click",".deleteProduct",function(e){
        e.preventDefault();
        let product_id=$(this).data('id');
        swal.fire({
            title: "Are you sure?",
            text: "You will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        }).then((result) => {
            if (!result.isConfirmed) return;
            $.ajax({
                url: ".?controller=admin&module=deleteProduct",
                type: "GET",
                data: {
                    product_id:product_id
                },
                dataType: "JSON",
                success: function (results) {
                    if(results.flag==true){
                        swal.fire("Done!", "It was succesfully deleted!", "success");
                        setTimeout(function(){
                            window.location.replace(".?controller=admin&module=displayproduct");
                        },1500);
                    } 
                },
                error: function () {
                    swal.fire("Error deleting!", "Please try again", "error");
                }
            });
        });
        
    })
});