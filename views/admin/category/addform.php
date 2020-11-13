<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="categoryModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add/Edit Category <i class="fa fa-user-circle-o" aria-hidden="true"></i></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="addform" method="POST" enctype="multipart/form-data">
        <div class="modal-body">
            <div class="form-group">
                <label for="recipient-name" class="col-form-label">Category Name:</label>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" ><i class="fa fa-user-circle-o" aria-hidden="true"></i>
                    </div>
                    <input type="text" class="form-control" id="category_name" name="category_name" required="required">
                </div>
            </div>
            <div class="form-group">
                <label for="category-root">Category Root</label>
                <select class="form-control" name="category-root" id="category-root">
                    <option selected  id="default">Select category root</option>
                    <option value="0" id="root">root</option>
                </select>
            </div>
            <div class="form-group">
                <label for="recipient-name" class="col-form-label">Status:</label>
                <div class="input-group mb-3">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="status" name="status">
                    <label class="form-check-label" for="status">Active</label>
                </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" id="addButton">Submit</button>
            <input type="hidden" name="category_id" id="category_id" value="">
        </div>
      </form>
    </div>
  </div>
</div>