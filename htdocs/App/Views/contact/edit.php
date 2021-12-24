<?php
view("include/_dashHeader")
?>

<div class="register-form-area">
    <div class="container">
        <div class="row">
            <div class="col-xl-10 col-lg-10 mt-5">
                <div class="card m-2 p-3">
                    <h1 style="text-align: center; color: black">Edit Contact</h1>
                    <div class="card-body p-4">
                        <?php
                        showMsg();
                        ?>
                        <form action="/contact/edit/<?php echo $array['contact']['id']?>" method="post">

                            <div class="form-group">
                                <label style="font-weight: bold">Address</label>
                                <textarea name="address" cols="30" rows="5" class="form-control" maxlength="300" placeholder="Enter Address"><?php echo $array['contact']['address']?></textarea>
                            </div>

                            <div class="form-group">
                                <label for="email" style="font-weight: bold">Postal Code</label>
                                <input type="text" class="form-control" placeholder="Enter Postal Code" value="<?php echo $array['contact']['postal_code']?>" name="postal_code">
                            </div>

                            <div class="form-group">
                                <label for="email" style="font-weight: bold">Number</label>
                                <input type="text" class="form-control" placeholder="Enter Number" value="<?php echo $array['contact']['number']?>" name="number">
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Days of Work</label>
                                <textarea name="days" cols="30" rows="5" class="form-control" maxlength="300" placeholder="Enter Days of Work"><?php echo $array['contact']['days']?></textarea>
                            </div>

                            <div class="form-group">
                                <label for="email" style="font-weight: bold">Email</label>
                                <input type="email" class="form-control" placeholder="Enter Email" value="<?php echo $array['contact']['email']?>" name="email">
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Description</label>
                                <textarea name="description" cols="30" rows="5" class="form-control" maxlength="300" placeholder="Enter Description"><?php echo $array['contact']['description']?></textarea>
                            </div>

                            <button type="submit" name="submit" class="btn btn-primary mt-3">Update Contact</button>

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
