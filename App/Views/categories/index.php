<?php
view("include/_dashHeader")
?>

<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-user-circle mt-1 me-2" style="float: left"></i>
        Categories
        <?php
        showMsg();
        ?>
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <?php
            while ($category=$array['categories']->fetch()){
                ?>
                <tr>
                    <td><?php echo $category['id']?></td>
                    <td><?php echo $category['title']?></td>
                    <td><?php echo $category['description']?></td>
                    <td><?php echo $category['created_at']?></td>
                    <td><?php echo $category['updated_at']?></td>
                    <td>
                        <a onclick="return confirm('Are you sure ?')"  href="/categories/delete/<?php echo $category['id']?>" class="btn btn-danger">Delete</a>
                        <a href="/categories/edit/<?php echo $category['id']?>" class="btn btn-success" style="padding-right: 22px; padding-left: 22px">Edit</a>
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
