<?php
view("include/_dashHeader")
?>

<div class="register-form-area">
    <div class="container">
        <div class="row">
            <div class="col-xl-10 col-lg-10 mt-5">
                <div class="card m-2 p-3">
                    <h1 style="text-align: center; color: black">Create User</h1>
                    <div class="card-body p-4">
                        <form action="/users/create" method="post">

                            <div class="form-group">
                                 <label for="email" style="font-weight: bold">First Name</label>
                                <input type="text" class="form-control" placeholder="Enter First Name" name="firstName">
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Last Name</label>
                                <input type="text" class="form-control" placeholder="Enter Last Name" name="lastName">
                            </div>

                            <div class="form-group">
                                <label style="font-weight: bold">Email Address</label>
                                <input type="email" class="form-control" placeholder="Enter email" name="email">
                            </div>
                            <div class="form-group">
                                <label style="font-weight: bold">Password</label>
                                <input type="password" class="form-control" placeholder="Enter password" name="password">
                                <?php
                                showMsg();
                                ?>
                            </div>

                            <button type="submit" class="btn btn-primary mt-3">Add User</button>

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
