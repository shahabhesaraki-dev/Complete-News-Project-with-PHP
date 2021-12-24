<?php
view("include/_dashHeader")
?>

<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-user-circle mt-1 me-2" style="float: left"></i>
        Comments
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
                <th>Answer</th>
                <th>AdminAccept</th>
                <th>News_id</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

            <?php
            while ($comment=$array['comments']->fetch()){
                ?>
                <tr>
                    <td><?php echo $comment['id']?></td>
                    <td><?php echo $comment['name']?></td>
                    <td><?php echo $comment['email']?></td>
                    <td><?php echo $comment['message']?></td>
                    <td>
                        <?php
                        if ($comment['answer']!=null){
                            echo $comment['answer'];
                        }else{
                            echo '-';
                        }
                        ?>
                    </td>
                    <td>
                        <?php
                            if ($comment['adminAccept']==1){
                                echo 'accept';
                            }else{
                                echo 'not accept';
                            }
                        ?>
                    </td>
                    <td><?php echo $comment['news_id']?></td>
                    <td><?php echo $comment['created_at']?></td>
                    <td><?php echo $comment['updated_at']?></td>
                    <td>
                        <a onclick="return confirm('Are you sure ?')"  href="/comments/delete/<?php echo $comment['id']?>" class="btn btn-danger">Delete</a>
                        <a href="/comments/edit/<?php echo $comment['id']?>" class="btn btn-success" style="padding-right: 22px; padding-left: 22px">Edit</a>
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
