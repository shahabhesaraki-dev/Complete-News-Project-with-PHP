<?php
view("include/_dashHeader")
?>

<div class="register-form-area">
    <div class="container">
        <div class="row">
            <div class="col-xl-10 col-lg-10 mt-5">
                <div class="card m-2 p-3">
                    <h1 style="text-align: center; color: black">Edit News</h1>
                    <?php
                    showMsg();
                    ?>
                    <div class="card-body p-4">
                        <form action="/news/edit/<?php echo $array['news']['id'] ?>" method="post" enctype="multipart/form-data">

                            <div class="form-group">
                                <label style="font-weight: bold">Title</label>
                                <input type="text" class="form-control" value="<?php echo $array['news']['title']?>" placeholder="Enter Title" name="title">
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Summary</label>
                                <textarea name="summary" cols="30" rows="5" class="form-control" maxlength="300" placeholder="Enter Summary"><?php echo $array['news']['summary']?></textarea>
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Content</label>
                                <textarea id="editor" name="content" class="form-control" placeholder="Enter Content"><?php echo $array['news']['content']?></textarea>
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Image</label>
                                <img src="/uploads/<?php echo $array['news']['image'] ?>" width="100" alt="">
                                <input type="file" class="form-control" name="image">
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Category</label>

                                <select class="js-example-basic-single form-control" name="category_id">
                                    <?php
                                    while ($category=$array['categories']->fetch()){
                                        if ($category['id']==$array['news']['category_id']){
                                        ?>
                                        <option value="<?php echo $category['id']?>" selected><?php echo $category['title']?></option>
                                        <?php
                                        }else{
                                            ?>
                                        <option value="<?php echo $category['id']?>"><?php echo $category['title']?></option>
                                    <?php
                                        }
                                    }
                                    ?>

                                </select>
                            </div>

                            <button type="submit" name="submit" class="btn btn-primary mt-3">Update News</button>

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
