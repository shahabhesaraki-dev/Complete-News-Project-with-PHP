<?php
view("include/_dashHeader")
?>

<div class="register-form-area">
    <div class="container">
        <div class="row">
            <div class="col-xl-10 col-lg-10 mt-5">
                <div class="card m-2 p-3">
                    <h1 style="text-align: center; color: black">Add Email</h1>

                    <div class="card-body p-4">
                        <form action="/subscribes/create" method="post">

                            <div class="form-group">
                                <label for="email" style="font-weight: bold">Email</label>
                                <input type="email" class="form-control" placeholder="Enter Email" name="email">
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

                            <button type="submit" name="submit" class="btn btn-primary mt-3">Add Email</button>

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
