<?php
view("include/_dashHeader")
?>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Dashboard</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body"><a href="/users/index" style="color:white; text-decoration: none">Users</a></div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body"><a href="/news/list" style="color:white; text-decoration: none">News</a></div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body"><a href="/categories/index" style="color:white; text-decoration: none">Categories</a></div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body"><a href="/comments/index" style="color:white; text-decoration: none">Comments</a></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-12">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                        Visit statistics
                    </div>
                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                </div>
            </div>
        </div>

    </div>
</main>

<?php

global $db;

$statistic=[
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-01-01 00:00:00' and '2021-01-31 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-02-01 00:00:00' and '2021-02-28 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-03-01 00:00:00' and '2021-03-31 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-04-01 00:00:00' and '2021-04-30 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-05-01 00:00:00' and '2021-05-31 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-06-01 00:00:00' and '2021-06-30 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-07-01 00:00:00' and '2021-07-31 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-08-01 00:00:00' and '2021-08-31 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-09-01 00:00:00' and '2021-09-30 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-10-01 00:00:00' and '2021-10-31 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-11-01 00:00:00' and '2021-11-30 23:59:59'")->fetch(),
    $db->query("SELECT COUNT(*) as number FROM `statistics` WHERE `created_at` BETWEEN '2021-12-01 00:00:00' and '2021-12-31 23:59:59'")->fetch(),
];

?>

<footer class="py-4 bg-light mt-auto">

</footer>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/dashAssets/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/dashAssets/js/datatables-simple-demo.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
<script>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .then( editor => {
            editor.ui.view.editable.element.style.height = '300px';
        })
        .catch( error => {
            console.error( error );
        } );
</script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script>
    $(document).ready(function() {
        $('.js-example-basic-single').select2();
    });
</script>
<script>

    // Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

    // Bar Chart Example
    var ctx = document.getElementById("myBarChart");
    var myLineChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
            datasets: [{
                label: "Revenue",
                backgroundColor: "rgba(2,117,216,1)",
                borderColor: "rgba(2,117,216,1)",
                data:["<?php echo $statistic[0]['number']?>","<?php echo $statistic[1]['number']?>","<?php echo $statistic[2]['number']?>","<?php echo $statistic[3]['number']?>","<?php echo $statistic[4]['number']?>","<?php echo $statistic[5]['number']?>","<?php echo $statistic[6]['number']?>","<?php echo $statistic[7]['number']?>","<?php echo $statistic[8]['number']?>","<?php echo $statistic[9]['number']?>","<?php echo $statistic[10]['number']?>","<?php echo $statistic[11]['number']?>"],
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'month'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 12
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 10000,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        display: true
                    }
                }],
            },
            legend: {
                display: false
            }
        }
    });


</script>
</body>
</html>