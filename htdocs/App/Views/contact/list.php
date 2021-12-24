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
                <th>Address</th>
                <th>Postal Code</th>
                <th>Number</th>
                <th>Days of Work</th>
                <th>Email</th>
                <th>Description</th>
                <th>Created At</th>
                <th>Updated At</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>

                <tr>
                    <td><?php echo $array['contact']['id']?></td>
                    <td><?php echo $array['contact']['address']?></td>
                    <td><?php echo $array['contact']['postal_code']?></td>
                    <td><?php echo $array['contact']['number']?></td>
                    <td><?php echo $array['contact']['days']?></td>
                    <td><?php echo $array['contact']['email']?></td>
                    <td><?php echo $array['contact']['description']?></td>
                    <td><?php echo $array['contact']['created_at']?></td>
                    <td><?php echo $array['contact']['updated_at']?></td>
                    <td>
                        <a href="/contact/edit/<?php echo $array['contact']['id']?>" class="btn btn-success" style="padding-right: 22px; padding-left: 22px">Edit</a>
                    </td>
                </tr>

            </tbody>
        </table>
    </div>
</div>

<?php
view("include/_dashFooter")
?>
