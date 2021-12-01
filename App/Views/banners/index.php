<?php
view("include/_dashHeader")
?>

<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-newspaper mt-1 me-2" style="float: left"></i>
        Banners
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
                <th>Category</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <?php
            while ($banner=$array['banners']->fetch()){

                ?>
                <tr>
                    <td><?php echo $banner['id']?></td>
                    <td><img src="/uploads/<?php echo $banner['image'] ?>" width="100" alt=""></td>
                    <td><?php echo $banner['title']?></td>
                    <td>
                        <?php
                        $categories=getCategories();
                        foreach ($categories as $category){
                            if ($banner['category_id']==$category['id']){
                                echo $category['title'];
                            }
                        }
                        ?>
                    </td>
                    <td><?php echo $banner['created_at']?></td>
                    <td><?php echo $banner['updated_at']?></td>
                    <td>
                        <a onclick="return confirm('Are you sure ?')"  href="/banners/delete/<?php echo $banner['id']?>" class="btn btn-danger">Delete</a>
                        <a href="/banners/edit/<?php echo $banner['id']?>" class="btn btn-success" style="padding-right: 22px; padding-left: 22px">Edit</a>
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
