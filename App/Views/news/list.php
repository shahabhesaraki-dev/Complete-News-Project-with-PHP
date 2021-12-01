<?php
view("include/_dashHeader")
?>

<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-newspaper mt-1 me-2" style="float: left"></i>
        News
        <?php
        showMsg();
        ?>
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Title</th>
                <th>Summary</th>
                <th>Views</th>
                <th>Category</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <?php
            while ($news=$array['news']->fetch()){

                ?>
                <tr>
                    <td><?php echo $news['id']?></td>
                    <td><img src="/uploads/<?php echo $news['image'] ?>" width="100" alt=""></td>
                    <td><?php echo $news['title']?></td>
                    <td><?php echo $news['summary']?></td>
                    <td><?php echo $news['views']?></td>
                    <td>
                        <?php
                        $categories=getCategories();
                        foreach ($categories as $category){
                            if ($news['category_id']==$category['id']){
                                echo $category['title'];
                            }
                        }
                        ?>
                    </td>
                    <td><?php echo $news['created_at']?></td>
                    <td><?php echo $news['updated_at']?></td>
                    <td>
                        <a onclick="return confirm('Are you sure ?')"  href="/news/delete/<?php echo $news['id']?>" class="btn btn-danger">Delete</a>
                        <a href="/news/edit/<?php echo $news['id']?>" class="btn btn-success" style="padding-right: 22px; padding-left: 22px">Edit</a>
                    </td>
                </tr>
                <?php
            }

            ?>

            </tbody>
        </table>
    </div>
</div>

<?php
view("include/_dashFooter")
?>
