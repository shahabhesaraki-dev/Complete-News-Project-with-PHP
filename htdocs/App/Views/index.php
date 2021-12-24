<?php
    view ("include/_header")
?>

<main>
    <!-- Nwes slider Start -->
    <div class="nes-slider-area pt-80 pb-80">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-tittle mb-35">
                        <h2>Categories</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="news-slider-active">
                        <?php
                            $banners=catRand();
                            while ($banner=$banners->fetch()){
                        ?>
                                <div class="single-news-slider">
                                    <div class="news-img">
                                        <a href="/categories/show/<?php echo $banner['category_id']?>"><img src="/uploads/<?php echo $banner['image']?>" style="width: 264px; height:200px " alt=""></a>
                                    </div>
                                </div>
                        <?php
                            }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Nwes slider End -->

    <!-- Latest Posts Area -->
    <div class="latest-posts pt-80 pb-80">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-tittle mb-35">
                        <h2>Latest Posts</h2>
                    </div>
                </div>
            </div>
            <!-- Slider -->
            <div class="row">

                <?php
                $latestNews=latestNews();
                while ($news=$latestNews->fetch()){
                    ?>


                    <!-- single-job-content -->
                    <div class="col-lg-6">
                        <div class="single-baner-nw2 mb-30 text-center">
                            <div class="banner-img-cap2">
                                <div class="banner-img">
                                    <a href="news/show/<?php echo $news['id']?>"><img src="uploads/<?php echo $news['image']?>" style="width: 558px; height:440px " alt=""></a>
                                </div>
                                <div class="banner-cap2">
                                    <p>
                                        <?php
                                        $categories=getCategories();
                                        foreach ($categories as $category){
                                            if ($news['category_id']==$category['id']){
                                                echo $category['title'];
                                            }
                                        }
                                        ?>
                                    </p>
                                    <h3><a href="news/show/<?php echo $news['id']?>"><?php echo $news['title']?></a></h3>
                                </div>
                            </div>
                        </div>
                    </div>

                    <?php
                }
                ?>

            </div>
        </div>
    </div>
    <!-- Latest Posts End-->

    <!-- Trending Area -->
    <div class="product-area section">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-tittle mb-35">
                        <h2>Trending</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="product-info">
                        <div class="nav-main">
                            <!-- Tab Nav -->
                            <ul class="nav nav-tabs" id="myTab" role="tablist">

                                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#all" role="tab">all</a></li>


                                <?php
                                $categories=getCategories();

                                while ($category=$categories->fetch()){
                                    ?>
                                    <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#<?php echo $category['title']?>" role="tab"><?php echo $category['title']?></a></li>
                                    <?php
                                }
                                ?>

                            </ul>
                            <!--/ End Tab Nav -->
                        </div>
                        <div class="tab-content" id="myTabContent">

                            <div class="tab-pane fade show active" id="all" role="tabpanel">

                                <div class="tab-single">
                                    <div class="row">

                                        <?php

                                        while ($newsLimit=$array['news']->fetch()){
                                            ?>
                                            <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                <div class="single-product">
                                                    <div class="product-img">
                                                        <a href="/news/show/<?php echo $newsLimit['id']?>">
                                                            <img class="default-img" style="width: 312px; height: 244px" src="/uploads/<?php echo $newsLimit['image']?>" alt="#">
                                                        </a>
                                                        <div class="button-head">
                                                            <div class="product-action-2">
                                                                <a title="Add to cart" href="/news/show/<?php echo $newsLimit['id']?>">Read more</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <?php
                                        }
                                        ?>
                                    </div>
                                </div>
                            </div>


                            <?php
                            $categories=getCategories();

                            while ($category=$categories->fetch()){
                                ?>
                                <div class="tab-pane" id="<?php echo $category['title']?>" role="tabpanel">
                                    <div class="tab-single">
                                        <div class="row">
                                            <?php
                                            $newsCat=newsByCat($category['id']);
                                            while ($news=$newsCat->fetch()){

                                                ?>
                                                <div class="col-xl-3 col-lg-4 col-md-4 col-12">
                                                    <div class="single-product">
                                                        <div class="product-img">
                                                            <a href="/news/show/<?php echo $news['id']?>">
                                                                <img class="default-img" style="width: 312px; height: 244px" src="/uploads/<?php echo $news['image']?>" alt="#">
                                                            </a>
                                                            <div class="button-head">
                                                                <div class="product-action-2">
                                                                    <a title="Add to cart" href="/news/show/<?php echo $news['id']?>">Read more</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <?php

                                            }
                                            ?>


                                        </div>
                                    </div>
                                </div>
                                <?php
                            }

                            ?>

                            <!--/ End Single Tab -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Trending Area End -->

    <!-- Top Posts Area -->
    <div class="latest-posts pt-80 pb-80">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-tittle mb-35">
                        <h2>Top Posts</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <?php
                        $topPosts=topPosts();
                    while ($topNews=$topPosts->fetch()){
                        ?>

                        <div class="col-lg-4 col-md-6">
                            <div class="single-baner-nw2 mb-30">
                                <div class="banner-img-cap2">
                                    <div class="banner-img">
                                        <a href="/news/show/<?php echo $topNews['id']?>"><img src="/uploads/<?php echo $topNews['image']?>" style="width: 312px; height: 244px" alt=""></a>
                                    </div>
                                    <div class="banner-cap2">
                                        <p>
                                            <?php
                                            $categories=getCategories();
                                            foreach ($categories as $category){
                                                if ($topNews['category_id']==$category['id']){
                                                    echo $category['title'];
                                                }
                                            }
                                            ?>
                                        </p>
                                        <h3><a href="/news/show/<?php echo $topNews['id']?>"><?php echo $topNews['title']?></a></h3>
                                        <p class="blog-text" style="text-transform: normal !important;"><?php echo $topNews['summary']?>..</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    <?php
                    }
                ?>
            </div>
        </div>
    </div>
    <!-- Top Posts End-->

    <section class="wantToWork-area gray-bg ">
        <div class="container">
            <div class="wants-wrapper w-padding2">
                <div class="row align-items-center justify-content-between">
                    <div class="col-xl-6 col-lg-7 col-md-10">
                        <div class="wantToWork-caption wantToWork-caption2">
                            <h2>Subscribe for latest updates</h2>
                            <p>Indie folks start out by making something they want to read, that tell stories they want told..</p>
                        </div>
                    </div>
                    <div class="col-xl-5 col-lg-5 col-md-12">
                        <form action="/home" method="post" class="search-box">
                            <div class="input-form">
                                <input type="email" name="email" placeholder="Enter your email">
                            </div>
                            <div class="search-form">
                                <button type="submit" class="btn" style="background: #072366; height: 100%" name="submit">Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>



<?php
    view ("include/_footer")
?>
