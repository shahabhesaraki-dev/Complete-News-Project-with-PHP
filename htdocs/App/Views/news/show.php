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
                                <li class="breadcrumb-item"><a href="/news/show/<?php echo $array['news']['id'] ?>">Post details</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <!-- breadcrumb End -->
        <!-- Post Details Stat -->
        <div class="psot-details pb-80">
            <div class="container">
                <div class="row">
                    <?php
                    showMsg();
                    ?>
                    <div class="col-lg-12">
                        <div class="details-img mb-40">
                            <img class="img-fluid" style="width: 1146px; height: 600px" src="/uploads/<?php echo $array['news']['image'] ?>" alt="">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="about-details-cap">
                            <h2><?php echo $array['news']['title'] ?></h2>
                        </div>
                    </div>
                    <div class="col-lg-10">
                        <div class="about-details-cap">
                            <p class="mb-50"><?php echo $array['news']['content'] ?></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Post Details End -->
        <!--comments Area -->
        <div class="coments-area pb-80">
            <div class="container">
                <div class="row ">
                    <div class="col-xl-12">
                        <div class="small-tittle mb-30">
                            <h1 style="font-weight: bold">messages</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <?php
                        while ($comment=$array['comments']->fetch()){
                            if ($comment['answer']==null){
                    ?>
                            <div class="col-lg-11">
                                <div class="single-comments mb-40">
                                    <div class="comments-items">
                                        <div class="comments-img">
                                            <img src="/assets/img/gallery/comment.png" style="width: 40px; height: 40px" alt="">
                                        </div>
                                        <div class="comments-tittle">
                                            <h2 style="color: black"><?php echo $comment['name']?></h2>
                                            <span><?php echo $comment['created_at']?></span>
                                            <p><?php echo $comment['message']?></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <?php
                            }else{
                            ?>

                                <div class="col-lg-11">
                                    <div class="single-comments mb-40">
                                        <div class="comments-items">
                                            <div class="comments-img">
                                                <img src="/assets/img/gallery/comment.png" style="width: 40px; height: 40px" alt="">
                                            </div>
                                            <div class="comments-tittle">
                                                <h2 style="color: black"><?php echo $comment['name']?></h2>
                                                <span><?php echo $comment['created_at']?></span>
                                                <p><?php echo $comment['message']?></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-11">
                                    <div class="single-comments mb-30 ml-80">
                                        <div class="comments-items">
                                            <div class="comments-img">
                                                <img src="/assets/img/gallery/answerMessage.png" style="width: 40px; height: 40px" alt="">
                                            </div>
                                            <div class="comments-tittle">
                                                <h2 style="color: black">Author</h2>
                                                <p><?php echo $comment['answer']?></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <?php
                            }
                        }
                    ?>
                </div>
                <!-- Form -->
                <div class="row">
                    <div class="col-lg-12">
                        <!-- contact-form -->
                        <div class="form-wrapper pt-80">
                            <div class="row ">
                                <div class="col-xl-12">
                                    <div class="small-tittle mb-30">
                                        <h2>Drop your message</h2>
                                    </div>
                                </div>
                            </div>
                            <form id="contact-form" action="/news/show/<?php echo $array['news']['id'] ?>" method="POST">
                                <div class="row">
                                    <div class="col-lg-7 col-md-6">
                                        <div class="form-box user-icon mb-15">
                                            <input type="text" name="name" placeholder="Enter your name">
                                        </div>
                                    </div>
                                    <div class="col-lg-7 col-md-6">
                                        <div class="form-box email-icon mb-15">
                                            <input type="email" name="email" placeholder="Enter your email">
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-box message-icon mb-15">
                                            <textarea name="message" id="message" placeholder="Comment"></textarea>
                                        </div>
                                        <div class="submit-info">
                                            <button class="submit-btn2" type="submit">Leave Comment</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--comments Area End -->
        <!-- Latest Posts Area -->
        <div class="latest-posts pt-80 pb-80">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="section-tittle mb-35">
                            <h2>Related Posts</h2>
                        </div>
                    </div>
                </div>
                <div class="row">

                    <?php
                        $currentNews=relatedPosts($array['news']['id']);

                        while ($relatedPost=$currentNews->fetch()){
                    ?>
                            <div class="col-lg-4 col-md-6">
                                <div class="single-baner-nw2 mb-30">
                                    <div class="banner-img-cap2">
                                        <div class="banner-img">
                                            <img src="/uploads/<?php echo $relatedPost['image']?>" style="width: 350px; height: 220px" alt="">
                                        </div>
                                        <div class="banner-cap2">
                                            <p>
                                                <?php
                                                $categories=getCategories();
                                                foreach ($categories as $category){
                                                    if ($relatedPost['category_id']==$category['id']){
                                                        echo $category['title'];
                                                    }
                                                }
                                                ?>
                                            </p>
                                            <h3><a href="/news/show/<?php echo $relatedPost['id']?>"><?php echo $relatedPost['title']?></a></h3>
                                            <p class="blog-text" style="text-transform: normal !important;"><?php echo $relatedPost['summary']?></p>
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