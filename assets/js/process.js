$(document).ready(function(){
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
                console.log(rows);
                $("#categoryModal").modal("hide");
            }
        });
    });
});