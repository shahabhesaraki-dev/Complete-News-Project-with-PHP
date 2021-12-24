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
                            <li class="breadcrumb-item"><a href="#">Login</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb End -->
    <!-- login Area Start -->
    <div class="login-form-area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-8">
                    <div class="login-form">
                        <!-- Login Heading -->
                        <div class="login-heading">
                            <?php
                                showMsg();
                            ?>
                            <span>Login</span>
                            <p>Enter Login details to get access</p>
                        </div>
                        <!-- Single Input Fields -->
                        <form action="/login" method="post">
                            <div class="input-box">
                                <div class="single-input-fields">
                                    <label>Email Address</label>
                                    <input type="email" name="email" placeholder="Enter email address">
                                </div>
                                <div class="single-input-fields">
                                    <label>Password</label>
                                    <input type="password" name="password" placeholder="Enter Password">
                                </div>
                            </div>
                            <!-- form Footer -->
                            <div class="register-footer">
                                <p>Don’t have an account? <a href="/signUp" style="color:#009FF0">Sign Up</a> here</p>
                                <button type="submit" class="submit-btn3">Login</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- login Area End -->
</main>

<?php
view("include/_footer")
?>
