<?php
view("include/_dashHeader")
?>

    <div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-user-circle me-2"></i>
        Users
        <?php
        showMsg();
        ?>
    </div>
    <div class="card-body">
        <table id="datatablesSimple">
            <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Admin</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <?php
                while ($user=$array['users']->fetch()){
                    ?>
            <tr>
                <td><?php echo $user['id']?></td>
                <td><?php echo $user['firstName']?></td>
                <td><?php echo $user['lastName']?></td>
                <td><?php echo $user['email']?></td>
                <td>
                    <?php
                        if ($user['admin']==1){
                            echo "Yes";
                        }else{
                            echo "No";
                    }?>
                </td>
                <td><?php echo $user['created_at']?></td>
                <td><?php echo $user['updated_at']?></td>
                <td>
                    <a onclick="return confirm('Are you sure ?')"  href="/users/delete/<?php echo $user['id']?>" class="btn btn-danger">Delete</a>
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
