<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title>Instructor Page</title>
    <style>
    </style>
</head>
<body>
    
    <h2><a href="index.html">Go To Home Page</a></h2>
    <h1>Instructor Page</h1>
    <?php
    //database connection
    include 'dbconnect.php';

    //fetch the names of instructors from the database
    $sql = "SELECT iname FROM instructor";
    $result = $conn->query($sql);
    ?>

<form action="" method="post">
    <label for="instructor">Select Instructor:</label>
    <select name="instructor" id="instructor">
        <?php
        
        while ($row = $result->fetch_assoc()) {
            $iname = $row['iname'];
            
            $selected = '';
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['instructor']) && $_POST['instructor'] == $iname) {
                $selected = 'selected';
            }
            echo "<option value='$iname' $selected>$iname</option>";
        }
        ?>
    </select>
    <input type="submit" value="Submit">
</form>


    <?php
    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        echo "<br>";
        $selectedInstructor = $_POST["instructor"];
        //display the information for the selected instructor
        $query = "SELECT * FROM instructor WHERE iname = '$selectedInstructor'";
        $result = $conn->query($query);
        echo "<h3>The information for $selectedInstructor</h3>";echo "<br><br>";
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            echo "<table>";
            echo "<tr><th>SSN</th><th>Name</th><th>Rank</th><th>Base Salary</th><th>Department Name</th><th>Extra Salary</th></tr>";
            echo "<tr><td>" . $row["ssn"] . "</td><td>" . $row["iname"] . "</td><td>" . $row["rankk"] . "</td><td>" . $row["baseSal"] . "</td><td>" . $row["dName"] . "</td><td>" . $row["extraSalary"] . "</td></tr>";
            echo "</table>";
            echo "<br><br>";
        } else {
            echo "<p>No instructor found.</p>";
            echo "<br><br>";
        }
        //display the courses taught by the selected instructor
        $queryCourses = "SELECT c.courseCode, c.courseName 
        FROM course c JOIN sectionn s ON c.courseCode = s.courseCode 
        JOIN instructor i ON s.issn = i.ssn 
        WHERE i.iName = '$selectedInstructor'";
        $resultCourses = $conn->query($queryCourses);
        
        echo "<h3>The courses taught by $selectedInstructor</h3>";echo "<br><br>";
        if ($resultCourses->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>Course Code</th><th>Course Name</th></tr>";
            while ($row = $resultCourses->fetch_assoc()) {
                echo "<tr><td>" . $row["courseCode"] . "</td><td>" . $row["courseName"] . "</td></tr>";
            }
            echo "</table>";
            echo "<br><br>";
        } else {
            echo "<p>No courses found.</p>";
            echo "<br><br>";
        }

        //display the weekly schedule of the selected instructor
        $querySchedule = "SELECT s.dayy, s.hourr, r.buildingName, r.roomNumber, c.courseCode, c.courseName 
        FROM weeklyschedule s JOIN sectionn sec ON s.issn = sec.issn 
        JOIN course c ON sec.courseCode = c.courseCode 
        JOIN buildingandroom r ON s.buildingName = r.buildingName AND s.roomNumber = r.roomNumber
        JOIN instructor i ON sec.issn = i.ssn
        WHERE i.iName = '$selectedInstructor'";
        $resultSchedule = $conn->query($querySchedule);

        echo "<h3>The weekly schedule of $selectedInstructor</h3>";echo "<br><br>";
        if ($resultSchedule->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>Day</th><th>Time</th><th>Building Name</th><th>Room Number</th><th>Course Code</th><th>Course Name</th></tr>";
            while ($row = $resultSchedule->fetch_assoc()) {
                echo "<tr><td>" . $row["dayy"] . "</td><td>" . $row["hourr"] . "</td><td>" . $row["buildingName"] . "</td><td>" . $row["roomNumber"] . "</td><td>" . $row["courseCode"] . "</td><td>" . $row["courseName"] . "</td></tr>";
            }
            echo "</table>";
            echo "<br><br>";
        } else {
            echo "<p>No schedule found.</p>";
            echo "<br><br>";
        }

        //students of each course the instructor is teaching
        $queryStudentCourse = "SELECT c.courseCode, c.courseName, s.studentname
        FROM course c
        JOIN sectionn sec ON c.courseCode = sec.courseCode
        JOIN enrollment e ON sec.issn = e.issn AND sec.courseCode = e.courseCode
        JOIN student s ON e.sssn = s.ssn
        JOIN instructor i ON sec.issn = i.ssn
        WHERE i.iName = '$selectedInstructor'";
        $resultStudentCourse = $conn->query($queryStudentCourse);
        
        echo "<h3>The students of each course $selectedInstructor is teaching</h3>";echo "<br><br>";
        if ($resultStudentCourse->num_rows > 0) {

            echo "<table>";
            echo "<tr><th>Course Code</th><th>Course Name</th><th>Student Name</th></tr>";
            while ($row = $resultStudentCourse->fetch_assoc()) { 
                echo "<tr><td>" . $row["courseCode"] . "</td><td>" . $row["courseName"] . "</td><td>" . $row["studentname"] . "</td></tr>";
            }
            echo "</table>";
            echo "<br><br>";
        } else {
            echo "<p>No studentname found.</p>";
            echo "<br><br>";
        }

        //the projects s/he is leading
        $queryLead = "SELECT p.pName FROM project p
        JOIN instructor i ON p.leadSsn = i.ssn
        WHERE i.iName = '$selectedInstructor';";
        $resultLead = $conn->query($queryLead);
        // Display the projects s/he is leading
        echo "<h3>The projects $selectedInstructor is leading</h3>";echo "<br><br>";
        if ($resultLead->num_rows > 0) {
            
            echo "<table>";
            echo "<tr><th>Project Name</th></tr>";
            while ($row = $resultLead->fetch_assoc()) { 
                echo "<tr><td>" . $row["pName"] . "</td></tr>";
            }
            echo "</table>";
            echo "<br><br>";
        } else {
            echo "<p>No leading project found.</p>";
            echo "<br><br>";
        }

        //the projects s/he is working
        $queryWorking = "SELECT p.pName
        FROM project p
        JOIN project_has_instructor phi ON p.leadSsn = phi.leadSsn AND p.pName = phi.pName
        JOIN instructor i ON phi.issn = i.ssn
        WHERE i.iName = '$selectedInstructor';";
        $resultWorking = $conn->query($queryWorking);
        echo "<h3>The projects $selectedInstructor is working</h3>";
        echo "<br><br>";
        
        if ($resultWorking->num_rows > 0) {
            
            echo "<table>";
            echo "<tr><th>Project Name</th></tr>";
            while ($row = $resultWorking->fetch_assoc()) { 
                echo "<tr><td>" . $row["pName"] . "</td></tr>";
            }
            echo "</table>";
            echo "<br><br>";
        } else {
            
            echo "<p>No working project found.</p>";
            echo "<br><br>";
        }

        //the students s/he is advising
        $queryAdvising = "SELECT s.studentname FROM student s JOIN instructor i ON s.advisorSsn = i.ssn 
        WHERE i.iName = '$selectedInstructor';";
        $resultAdvising = $conn->query($queryAdvising);
        echo "<h3>The students $selectedInstructor is advising</h3>";
        echo "<br><br>";
        
        if ($resultAdvising->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>Student Name</th></tr>";
            while ($row = $resultAdvising->fetch_assoc()) { 
                echo "<tr><td>" . $row["studentname"] . "</td></tr>";
            }
            echo "</table>";
            echo "<br><br>";
        } else {
            echo "<p>No studentname found.</p>";
            echo "<br><br>";
        }

        //the graduate students s/he is supervising
        $queryGradAdvising = "SELECT s.studentname
        FROM gradstudent gs
        JOIN instructor i ON gs.supervisorSsn = i.ssn
        JOIN student s ON s.ssn = gs.ssn
        WHERE i.iName = '$selectedInstructor';";
        $resultGradAdvising = $conn->query($queryGradAdvising);
        echo "<h3>The grad students $selectedInstructor is advising</h3>";
        echo "<br><br>";
        
        if ($resultGradAdvising->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>Student Name</th></tr>";
            while ($row = $resultGradAdvising->fetch_assoc()) { 
                echo "<tr><td>" . $row["studentname"] . "</td></tr>";
            }
            echo "</table>";
            echo "<br><br>";
        } else {
            echo "<p>No studentname found.</p>";
            echo "<br><br>";
        }

        //display free hours report for the courses s/he teaching
        $queryFree = "SELECT sec.courseCode, sec.sectionId, sec.yearr, sec.semester, s.dayy, s.hourr
        FROM sectionn sec
        JOIN weeklyschedule s ON sec.issn = s.issn
        JOIN instructor i ON sec.issn = i.ssn
        WHERE i.iName = '$selectedInstructor';";
        $resultFree = $conn->query($queryFree);
        echo "<h3>The free hours report for $selectedInstructor </h3>";
        echo "<br><br>";
        
        if ($resultFree->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>Course Code</th><th>Section ID</th><th>Year</th><th>Semester</th><th>Day</th><th>Hour</th></tr>";
            while ($row = $resultFree->fetch_assoc()) { 
                echo "<tr><td>" . $row["courseCode"] . "</td><td>" . $row["sectionId"] . "</td><td>" . $row["yearr"] . "</td><td>" . $row["semester"] . "</td><td>" . $row["dayy"] . "</td><td>" . $row["hourr"] . "</td></tr>";
            }
            echo "</table>";
            echo "<br><br>";
        } else {
            echo "<p>No free hours found.</p>";
            echo "<br><br>";
        }

    }

    //close the database connection
    $conn->close();
    ?>

</body>
</html>
