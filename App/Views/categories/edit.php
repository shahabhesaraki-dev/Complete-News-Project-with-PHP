<?php
view("include/_dashHeader")
?>

<div class="register-form-area">
    <div class="container">
        <div class="row">
            <div class="col-xl-10 col-lg-10 mt-5">
                <div class="card m-2 p-3">
                    <h1 style="text-align: center; color: black">Edit Category</h1>

                    <div class="card-body p-4">
                        <form action="/categories/edit/<?php echo $array['categories']['id']?>" method="post">

                            <div class="form-group">
                                <label for="email" style="font-weight: bold">Title</label>
                                <input type="text" class="form-control" placeholder="Enter Title" value="<?php echo $array['categories']['title']?>" name="title">
                                <?php
                                if (isset($array['message'][0])){
                                    ?>
                                    <p style="color: red; font-weight: bold">
                                        <?php
                                        echo $array['message'][0];
                                        ?>
                                    </p>
                                    <?php
                                }
                                ?>
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Description</label>
                                <textarea name="description" cols="30" rows="5" class="form-control" maxlength="300" placeholder="Enter Description"><?php echo $array['categories']['description']?></textarea>
                            </div>

                            <button type="submit" name="submit" class="btn btn-primary mt-3">Update Category</button>

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
