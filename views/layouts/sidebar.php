<?php $home=new HomeModel();
$category=$home->getCategory(); ?>
<div id="sidebar" class="fl-left">
    <div id="main-menu-wp">
        <ul class="list-item">
            <li class="active">
                <a href=".?" title="Trang chủ">Trang chủ</a>
            </li>
            <?php foreach ($category as $key => $value) { ?>
            <li>
                <a class="side_bar_name"
                    href=".?controller=home&module=detailCategory&category_id=<?php echo $value['category_id']; ?>"
                    title="<?php echo $value['category_name']; ?>"><?php echo $value['category_name']; ?></a>
            </li>
            <?php }?>
            <li>
                <a class="side_bar_name" href="?page=detail_news" title="Liên hệ">Liên hệ</a>
            </li>
        </ul>
    </div>
</div>