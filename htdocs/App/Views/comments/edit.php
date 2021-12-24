<?php
view("include/_dashHeader")
?>

<div class="register-form-area">
    <div class="container">
        <div class="row">
            <div class="col-xl-10 col-lg-10 mt-5">
                <div class="card m-2 p-3">
                    <h1 style="text-align: center; color: black">Edit Comment</h1>


                    <div class="card-body p-4">
                        <?php
                        showMsg();
                        ?>
                        <form action="/comments/edit/<?php echo $array['comments']['id']?>" method="post">

                            <div class="form-group">
                                <label for="email" style="font-weight: bold">name</label>
                                <input type="text" class="form-control" placeholder="Enter name" value="<?php echo $array['comments']['name']?>" name="name">
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Comment</label>
                                <textarea name="message" cols="30" rows="5" class="form-control" maxlength="300" placeholder="Enter message"><?php echo $array['comments']['message']?></textarea>
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Answer</label>
                                <textarea name="answer" cols="30" rows="5" class="form-control" maxlength="300" placeholder="Enter answer"><?php echo $array['comments']['answer']?></textarea>
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">adminAccept</label>

                                <select class="js-example-basic-single form-control" name="adminAccept">
                                    <?php

                                        if ($array['comments']['adminAccept']==0){
                                            ?>
                                            <option value="<?php echo $array['comments']['adminAccept']?>" selected>not accept</option>
                                            <option value="1">accept</option>
                                            <?php
                                        }elseif ($array['comments']['adminAccept']==1){
                                            ?>
                                            <option value="<?php echo $array['comments']['adminAccept']?>" selected>accept</option>
                                            <option value="0">not accept</option>
                                            <?php
                                        }

                                    ?>

                                </select>
                            </div>

                            <button type="submit" name="submit" class="btn btn-primary mt-3">Update Comment</button>

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
