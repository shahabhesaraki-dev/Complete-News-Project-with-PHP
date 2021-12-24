<?php
view ("include/_header")
?>

<main>
    <!-- breadcrumb Start-->
    <div class="page-notification">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a href="/home">Home</a></li>
                            <li class="breadcrumb-item"><a href="/news/index/1">News</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb End -->
    <!-- Top Posts Start -->
    <div class="top-post-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-tittle mb-35">
                        <h2>All News</h2>
                    </div>
                </div>
            </div>
            <div class="row justify-content-lg-between">
                <div class="col-lg-8 col-md-8">

                    <?php
                    while ($news=$array['news']->fetch()){
                        ?>
                        <!-- single-job-content -->
                        <div class="single-job-items mb-30">
                            <div class="job-items">
                                <div class="company-img">
                                    <a href="/news/show/<?php echo $news['id'] ?>"><img src="/uploads/<?php echo $news['image'] ?>" style="width: 264px; height:214px " alt=""></a>
                                </div>
                                <div class="job-tittle">
                                        <span>
                                            <?php
                                            $categories=getCategories();
                                            foreach ($categories as $category){
                                                if ($news['category_id']==$category['id']){
                                                    echo $category['title'];
                                                }
                                            }
                                            ?>
                                        </span>
                                    <a href="/news/show/<?php echo $news['id'] ?>"><h4><?php echo $news['title'] ?></h4></a>
                                    <p> <?php echo $news['summary'] ?>...<a href="/news/show/<?php echo $news['id'] ?>" style="color: #140C40; font-weight: bold">More</a></p>
                                </div>
                            </div>
                        </div>
                        <?php
                    }

                    ?>

                </div>
            </div>
        </div>
    </div>
    <!-- Top Posts End -->
    <!--Pagination Start  -->
    <div class="pagination-area text-center">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="single-wrap d-flex justify-content-center">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-start " id="myDIV">

                                <?php

                                $pagination=pagination();

                                $totalNews=$pagination['number'];
                                $totalPage=ceil($pagination['number']/4);


                                    if ($array['currentPage']!=1){
                                 ?>
                                        <li class="page-item"><a class="page-link" href="<?php echo $array['currentPage']-1?>"><span class="ti-angle-left"></span></a></li>
                                 <?php
                                    }
                                ?>


                                <?php

                                for($page=1;$page<=$totalPage;$page++){
                                    ?>
                                    <li class="page-item <?php if($array['currentPage'] == $page) { echo " active";} ?>"><a class="page-link" href="/news/index/<?php echo $page ?>"><?php echo $page ?></a></li>
                                    <?php
                                }

                                ?>

                                <li class="page-item"><a class="page-link" href="<?php echo $array['currentPage']+1?>"><span class="ti-angle-right"></span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Pagination End  -->
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
    <!-- Latest Posts End-->

</main>

<?php
view ("include/_footer")
?>
