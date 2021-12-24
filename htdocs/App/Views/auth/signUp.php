<?php
    view("include/_header")
?>

<main>
    <!-- breadcrumb Start-->
    <div class="page-notification">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Sign Up</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb End -->
    <!-- Register Area Start -->
    <div class="register-form-area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-6 col-lg-8">
                    <div class="register-form text-center">
                        <!-- Login Heading -->
                        <div class="register-heading">
                            <span>Sign Up</span>
                            <p>Create your account to get full access</p>
                        </div>
                        <!-- Single Input Fields -->
                        <form action="/signUp" method="post">
                            <div class="input-box">
                                <div class="single-input-fields">
                                    <label>Firstname</label>
                                    <input type="text" name="firstName" value="<?php echo isset($_POST["firstName"]) ? $_POST["firstName"] : ''; ?>" placeholder="Enter first name">
                                </div>
                                <div class="single-input-fields">
                                    <label>Lastname</label>
                                    <input type="text" name="lastName" value="<?php if(isset($_POST['lastName'])) { echo $_POST['lastName']; } ?>" placeholder="Enter last name">
                                </div>
                                <div class="single-input-fields">
                                    <label>Email Address</label>
                                    <input type="email" name="email" value="<?php if(isset($_POST['email'])) { echo $_POST['email']; } ?>" placeholder="Enter email address">
                                </div>
                                <div class="single-input-fields">
                                    <label>Password</label>
                                    <input type="password" name="password" placeholder="Enter Password">
                                    <?php
                                        showMsg();
                                    ?>
                                </div>
                            </div>
                            <!-- form Footer -->
                            <div class="register-footer">
                                <p> Already have an account? <a href="/login"> Login</a> here</p>
                                <button type="submit" name="submit" class="submit-btn3">Sign Up</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Area End -->
</main>


<?php
view("include/_footer")
?>
