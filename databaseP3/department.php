<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title>Department Page</title>
    <style>

    </style>
</head>
<body>
    <h2><a href="index.html">Go To Home Page</a></h2>
    <h1>Department Page</h1>

    <?php
    //database connection
    include 'dbconnect.php';

    //fetch the names of departments from the database
    $sql = "SELECT dName FROM department";
    $result = $conn->query($sql);
    ?>
<form action="" method="post">
    <label for="department">Select Department:</label>
    <select name="department" id="department">
        <?php
        
        while ($row = $result->fetch_assoc()) {
            $dName = $row['dName'];
           
            $selected = '';
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['department']) && $_POST['department'] == $dName) {
                $selected = 'selected';
            }
            echo "<option value='$dName' $selected>$dName</option>";
        }
        ?>
    </select>
    <input type="submit" value="Submit">
</form>


    <?php
   
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $selectedDepartment = $_POST["department"];

        //display the department details
        $queryDepartment = "SELECT * FROM department WHERE dName = '$selectedDepartment'";
        $resultDepartment = $conn->query($queryDepartment);

        
        echo "<h3> Department Details </h3><br><br>";
        if ($resultDepartment->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>Department Name</th><th>Budget</th><th>Head SSN</th><th>Building Name</th></tr>";
            
            while ($row = $resultDepartment->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["dName"] . "</td>";
                echo "<td>" . $row["budget"] . "</td>";
                echo "<td>" . $row["headSsn"] . "</td>";
                echo "<td>" . $row["buildingName"] . "</td>";
                echo "</tr>";
            }

            echo "</table>";
        } else {
            echo "<p>No department found.</p>";
        }
    }

    // close the database connection 
    $conn->close();
    ?>
</body>
</html>
