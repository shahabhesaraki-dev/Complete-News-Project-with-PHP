<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Magazine News</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">

    <!-- CSS here -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/assets/css/slicknav.css">
    <link rel="stylesheet" href="/assets/css/flaticon.css">
    <link rel="stylesheet" href="/assets/css/progressbar_barfiller.css">
    <link rel="stylesheet" href="/assets/css/gijgo.css">
    <link rel="stylesheet" href="/assets/css/animate.min.css">
    <link rel="stylesheet" href="/assets/css/animated-headline.css">
    <link rel="stylesheet" href="/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/assets/css/themify-icons.css">
    <link rel="stylesheet" href="/assets/css/slick.css">
    <link rel="stylesheet" href="/assets/css/nice-select.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" href="/assets/trending/style.css">

</head>
<body>
<!-- ? Preloader Start -->
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img src="/assets/img/logo/loder.png" alt="">
            </div>
        </div>
    </div>
</div>
<!-- Preloader Start-->
<header>
    <!-- Header Start -->
    <div class="header-area">
        <div class="main-header ">
            <div class="header-top ">
                <div class="container-fluid">
                    <div class="col-xl-12">
                        <div class="row d-flex justify-content-lg-between align-items-center">
                            <div class="header-info-left">
                                <li class="d-none d-lg-block">
                                    <div class="form-box f-right "></div>
                                </li>
                                <?php
                                showMsg();
                                ?>
                            </div>
                            <div class="header-info-mid">
                                <!-- logo -->
                                <div class="logo">
                                    <a href="/home"><img src="/assets/img/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="header-info-right d-flex align-items-center">
                                <ul>
                                    <li><a href="/contact">Contact</a></li>
                                    <?php
                                        if(!isset($_SESSION['userLogin'])){
                                    ?>
                                            <li><a href="/login">Login</a></li>
                                    <?php
                                        }else{
                                    ?>
                                            <li><a href="/logout">Logout</a></li>
                                    <?php
                                        }
                                    ?>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom  header-sticky">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-12">
                            <!-- logo 2 -->
                            <div class="logo2">
                                <a href="index.html"><img src="/assets/img/logo/logo.png" alt=""></a>
                            </div>
                            <!-- logo 3 -->
                            <div class="logo3 d-block d-sm-none">
                                <a href="index.html"><img src="/assets/img/logo/logo-mobile.png" alt=""></a>
                            </div>
                            <!-- Main-menu -->
                            <div class="main-menu text-center d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="/home">Home</a></li>
                                        <li><a href="/news/index/1">All news</a></li>
                                        <?php
                                            $categories=getCategories();
                                            while ($category=$categories->fetch()){

                                        ?>
                                                <li><a href="/categories/show/<?php echo $category['id']?>/1"><?php echo $category['title']?></a></li>
                                        <?php
                                            }
                                        ?>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <!-- Mobile Menu -->
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Header End -->
