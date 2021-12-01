<?php
view("include/_dashHeader")
?>

<div class="register-form-area">
    <div class="container">
        <div class="row">
            <div class="col-xl-10 col-lg-10 mt-5">
                <div class="card m-2 p-3">
                    <h1 style="text-align: center; color: black">Create News</h1>
                    <?php
                    showMsg();
                    ?>
                    <div class="card-body p-4">
                        <form action="/news/create" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <label style="font-weight: bold">Title</label>
                                <input type="text" class="form-control" placeholder="Enter Title" name="title">
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Summary</label>
                                <textarea name="summary" cols="30" rows="5" class="form-control" maxlength="300" placeholder="Enter Summary"></textarea>
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Content</label>
                                <textarea id="editor" name="content" class="form-control" placeholder="Enter Content"></textarea>
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Image</label>
                                <input type="file" class="form-control" name="image">
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Category</label>

                                <select class="js-example-basic-single form-control" name="category_id">
                                    <option selected="selected" value="0"></option>
                                    <?php
                                        while ($category=$array['categories']->fetch()){
                                    ?>
                                            <option value="<?php echo $category['id']?>"><?php echo $category['title']?></option>
                                    <?php
                                        }
                                    ?>

                                </select>
                            </div>

                            <button type="submit" name="submit" class="btn btn-primary mt-3">Add News</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Register Area End -->

<?php
view("include/_dashFooter")
?>
