<?php
view("include/_dashHeader")
?>

<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-user-circle mt-1 me-2" style="float: left"></i>
            Messages
        <?php
        showMsg();
        ?>
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Created At</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <?php
            while ($message=$array['messages']->fetch()){
                ?>
                <tr>
                    <td><?php echo $message['id']?></td>
                    <td><?php echo $message['name']?></td>
                    <td><?php echo $message['email']?></td>
                    <td><?php echo $message['message']?></td>
                    <td><?php echo $message['created_at']?></td>
                    <td>
                        <a onclick="return confirm('Are you sure ?')"  href="/messages/delete/<?php echo $message['id']?>" class="btn btn-danger">Delete</a>
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
