<?php include DOCUMENT_ROOT."/views/admin/layouts/header.php"; ?>
<div class="container">
    <div class="area_add_form p-3">
        <h1 class="title_add_product">Add Product</h1>
        <form action=".?controller=admin&module=processAddProduct" method="post" id="addProduct" enctype="multipart/form-data">
            <div class="form-group">
                <label for="product_name">Product Name</label>
                <input type="text" class="form-control" value="<?php if(isset($product['product_name'])){
                    echo $product['product_name'];
                }else{echo put_value('product_name');} ?>" id="product_name" name="product_name">
                <p id="error">
                    <?php echo put_error('product_name'); ?>
                </p>
            </div>
            <div class="form-group">
                <label for="product_desc">Product Description</label>
                <input type="text" class="form-control" name="product_desc" value="<?php if(isset($product['product_description'])){
                    echo $product['product_description'];
                }else{echo put_value('product_desc');} ?>" id="product_desc">
                <p id="error">
                    <?php echo put_error('product_desc'); ?>
                </p>
            </div>
            <div class="form-group">
                <label for="product_content">Product Content</label>
                <textarea name="product_content" class="form-control" name="product_content"  id="product_content" cols="30" rows="10"><?php if(isset($product['product_content'])){
                    echo $product['product_content'];
                }else{echo put_value('product_content');}?></textarea>
                <p id="error">
                    <?php echo put_error('product_content'); ?>
                </p>
            </div>
            <div class="form-group">
                <label for="product_price">Product Price</label>
                <input type="number" min="1" step="any" class="form-control" id="product_price" value="<?php if(isset($product['product_price'])){
                    echo $product['product_price'];
                }else{echo put_value('product_price');} ?>" name="product_price" />
                <p id="error">
                    <?php echo put_error('product_price'); ?>
                </p>
            </div>
            <div class="form-group">
                <label for="product_price_sale">Product Price Sale</label>
                <input type="number" min="0" step="any" class="form-control" id="product_price_sale" value="<?php if(isset($product['product_sale_price'])){
                    echo $product['product_sale_price'];
                }else{echo put_value('product_price_sale');} ?>" name="product_price_sale" />
                <p id="error">
                    <?php echo put_error('product_price_sale'); ?>
                </p>
            </div>
            <div class="form-group">
                <label for="product_status">Product Status</label>
                <select name="product_status" id="product_status">
                    <?php if(isset($product['product_status']) && $product['product_status']==0){ ?>
                        <option value="0" selected>Active</option>
                        <option value="1">Non Active</option>
                    <?php } else{?>
                        <option value="0">Active</option>
                        <option value="1"selected>Non Active</option>
                    <?php }?>
                </select>
            </div>
            <div class="form-group">
                <label for="product_img">Product Image</label>
                <input type="file" class="form-control" id="productimg" name="productimg" />
            </div>
            <?php if(isset($product['product_img'])) {?>
                <div class="form-group">
                    <img src="assets/uploads/<?php echo $product['product_img']; ?>" class="img-thumbnail rounded "></br>
                </div>
            <?php }?>
            <p id="error">
                <?php echo put_error('file'); ?>
            </p>
            <div class="form-group">
                <label for="product_cate">Product Category</label>
                <select name="product_cate" id="product_cate">
                    <option selected disabled>Category Product</option>
                    <?php foreach ($category as $key => $value) {?>
                       <option value="<?php echo $value['category_id']; ?>" <?php (isset($product['category_id'])&&($value['category_id']==$product['category_id'])) ? print('selected') : '' ?>><?php echo $value['category_name']; ?></option>
                    <?php } ?>
                </select>
                <p id="error">
                    <?php echo put_error('product_cate'); ?>
                </p>
            </div>
            <div class="form-group">
                <input type="hidden" name="IdProduct" value="<?php if(isset($product['product_id'])){
                    echo $product['product_id'];
                }else{
                    echo "";
                }?>">
                <input type="submit" value="Submit" class="btn btn-primary" name="btn_submit">
            </div>
        </form>
    </div>  
</div>
<?php include DOCUMENT_ROOT."/views/admin/layouts/footer.php"; ?>
