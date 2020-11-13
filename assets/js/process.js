$(document).ready(function(){
    function getRow(category,i=0){
        var str="";
        str+=`
        <tr>
                <td class="align-middle">${i}</td>
                <td class="align-middle">${category['category_name']}</td>
                <td class="align-middle">
                    <input type="checkbox"  class="statusChange" data-id=${category['category_id']}  ${ (category['status'] == 1) ? "checked" : "" }  data-toggle="toggle" data-on="Active" data-off="NonActive" data-onstyle="info" data-offstyle="danger">
                </td>
                <td class="align-middle">
                <a href="#" class="btn btn-success mr-3 profile" data-categoryid="${category['category_id']}" data-toggle="modal" data-target="#categoryViewModal" title="Prfile"><i class="fa fa-address-card-o" aria-hidden="true"></i></a>
                <a href="#" class="btn btn-warning mr-3 editCategory" data-categoryid="${category['category_id']}" data-toggle="modal" data-target="#categoryModal" title="Edit"><i class="fa fa-pencil-square-o fa-lg"></i></a>
                <a href="#" class="btn btn-danger deletecategory" data-categoryid="${category['category_id']}" title="Delete"><i class="fa fa-trash-o fa-lg"></i></a>
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
        $.ajax({
            url:".?controller=admin&module=addCategroy",
            type:"POST",
            dataType:"JSON",
            data:new FormData(this),
            processData: false,
            contentType: false, 
            success:function(rows){
                Swal.fire(
                    'Add new category success!',
                    'You clicked the button!',
                    'success'
                )
                $("#categoryModal").modal("hide");
                load();
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
        $.ajax({
            url:".?controller=admin&module=deleteCategoryy",
            type:"GET",
            dataType:"JSON",
            data:{idCate:idCatee},
            success:function(results){
                if(results){
                    Swal.fire({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, delete it!'
                      }).then((result) => {
                        if (result.isConfirmed) {
                                Swal.fire(
                                    'Deleted!',
                                    'Your file has been deleted.',
                                    'success'
                                )
                                load();
                        }
                      });
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
    $(document).on("click",".editCategory",function(){
        id=$(this).data("categoryid");
        $.ajax({
            url:".?controller=admin&module=viewDetailCategory",
            type:"GET",
            dataType:"JSON",
            data:{id:id},
            success:function(result){
                $("#category_name").val(result.row.category_name);
                if(result.row.parent_id==0){
                    $("#root").attr("selected","selected");
                }
                if(result.row.status==1){
                    $("#status").attr("checked","checked");
                }
                $("#category_id").val(result.row.category_id);
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
});