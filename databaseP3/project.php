<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title>Project Page</title>
    <style>
    </style>
</head>
<body>
    <h2><a href="index.html">Go To Home Page</a></h2>
    <h1>Project Page</h1>

    <?php
    //database connection
    include 'dbconnect.php';

    //fetch the names of projects from the database
    $sql = "SELECT pName FROM project";
    $result = $conn->query($sql);
    ?>

<form action="" method="post">
    <label for="project">Select Project:</label>
    <select name="project" id="project">
        <?php
        
        while ($row = $result->fetch_assoc()) {
            $pName = $row['pName'];
            $selected = '';
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['project']) && $_POST['project'] == $pName) {
                $selected = 'selected';
            }
            echo "<option value='$pName' $selected>$pName</option>";
        }
        ?>
    </select>
    <input type="submit" value="Submit">
</form>


    <?php
    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $selectedProject = $_POST["project"];

        //display the project details
        $queryProject = "SELECT * FROM project WHERE pName = '$selectedProject'";
        $resultProject = $conn->query($queryProject);

        
        if ($resultProject->num_rows > 0) {
            echo "<h3>Project Details</h3><br><br>";
            echo "<table>";
            echo "<tr><th>Project Name</th><th>Lead SSN</th><th>Subject</th><th>Budget</th><th>Start Date</th><th>End Date</th><th>Controlling Department Name</th></tr>";
            
            while ($row = $resultProject->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["pName"] . "</td>";
                echo "<td>" . $row["leadSsn"] . "</td>";
                echo "<td>" . $row["subject"] . "</td>";
                echo "<td>" . $row["budget"] . "</td>";
                echo "<td>" . $row["startDate"] . "</td>";
                echo "<td>" . $row["enddate"] . "</td>";
                echo "<td>" . $row["controllingDName"] . "</td>";
                echo "</tr>";
            }

            echo "</table>";
        } else {
            echo "<p>No project found.</p>";
        }
    }

    //close the database connection 
    $conn->close();
    ?>
</body>
</html>
