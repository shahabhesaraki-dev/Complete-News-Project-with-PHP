<?php
view("include/_dashHeader")
?>

<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-envelope mt-1 me-2" style="float: left"></i>
        Subscribes
        <?php
        showMsg();
        ?>
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <?php
            while ($subscribe=$array['subscribes']->fetch()){
                ?>
                <tr>
                    <td><?php echo $subscribe['id']?></td>
                    <td><?php echo $subscribe['email']?></td>
                    <td><?php echo $subscribe['created_at']?></td>
                    <td><?php echo $subscribe['updated_at']?></td>
                    <td>
                        <a onclick="return confirm('Are you sure ?')"  href="/subscribes/delete/<?php echo $subscribe['id']?>" class="btn btn-danger">Delete</a>
                        <a href="/subscribes/edit/<?php echo $subscribe['id']?>" class="btn btn-success" style="padding-right: 22px; padding-left: 22px">Edit</a>
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
