$(document).ready(function () {
    //  EVEN MENU RESPON
    $('html').on('click', function (event) {
        var target = $(event.target);
        var site = $('#site');

        if (target.is('#btn-respon i')) {
            if (!site.hasClass('show-respon-menu')) {
                site.addClass('show-respon-menu');
            } else {
                site.removeClass('show-respon-menu');
            }
        } else {
            $('#container').click(function () {
                if (site.hasClass('show-respon-menu')) {
                    site.removeClass('show-respon-menu');
                    return false;
                }
            });
        }
    });

    //    MENU RESPON
    $('#main-menu-respon li .sub-menu').after('<span class="fa fa-angle-right arrow"></span>');
    $('#main-menu-respon li .arrow').click(function () {
        if ($(this).parent('li').hasClass('open')) {
            $(this).parent('li').removeClass('open');
            $(this).parent('li').find('.sub-menu').slideUp();
        } else {
            $('.sub-menu').slideUp();
            $('#main-menu-respon li').removeClass('open');
            $(this).parent('li').addClass('open');
            $(this).parent('li').find('.sub-menu').slideDown();
        }
    });
    $(document).on("change","#num-order",function(e){
        number=$(this).val();
        idPro=$("#productID").val();
        $('.add-to-cart').attr('href',"?module=processCart&product_id="+idPro+"&number="+number);
    });
    $(document).on("change",".num-order",function(){
        number=$(this).val();
        product_id=$(this).data("id");
        $.ajax({
            url:".?module=changeNumberAjax",
            type:"GET",
            dataType:"JSON",
            data:{numberr:number,product_id:product_id},
            success:function(result){
                $(".total_price_product"+product_id).html(result.total_product);
                $("#total-price").html(result.total_order);
                $("#num").html(result.sum);
            },
            error:function(){
                console.log('error');
            }
        });
        
    });
});