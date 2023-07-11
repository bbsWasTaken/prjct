<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <title>Student Page</title>
    <style>

    </style>
</head>
<body>
<h2><a href="index.html">Go To Home Page</a></h2>
    <h1>Student Page</h1>

    <?php
    //database connection
    include 'dbconnect.php';

    //fetch the names of students from the database
    $sql = "SELECT studentname FROM student";
    $result = $conn->query($sql);
    ?>

<form action="" method="post">
    <label for="student">Select Student:</label>
    <select name="student" id="student">
        <?php
        
        while ($row = $result->fetch_assoc()) {
            $name = $row['studentname'];
            $selected = '';
            if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['student']) && $_POST['student'] == $name) {
                $selected = 'selected';
            }
            echo "<option value='$name' $selected>$name</option>";
        }
        ?>
    </select>
    <input type="submit" value="Submit">
</form>


    <?php
    
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $selectedStudent = $_POST["student"];

        //display if the student is a graduate student or not
        $queryGraduateStatus = "SELECT gradorUgrad FROM student WHERE studentname = '$selectedStudent'";
        $resultGraduateStatus = $conn->query($queryGraduateStatus);

        
        echo "<h3>Graduate status of $selectedStudent </h3><br>";
        if ($resultGraduateStatus->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>Graduate Status</th></tr>";
            echo "<tr>";
            
            $row = $resultGraduateStatus->fetch_assoc();
            $isGraduate = $row["gradorUgrad"];
            $graduateStatus = ($isGraduate ? "Graduate Student" : "Undergraduate Student");
            
            echo "<td>$graduateStatus</td>";
            echo "</tr>";
            echo "</table>";
        } else {
            echo "No graduate status found.";
        }
        //display the department the student is studying
        $queryDepartment = "SELECT d.dName
        FROM department d
        JOIN student s ON d.dName = s.dName
        WHERE s.studentName = '$selectedStudent';";
        $resultDepartment = $conn->query($queryDepartment);
        // Display the department of the student
            echo "<h3>The department of $selectedStudent</h3>";
            if ($resultDepartment->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>Department</th></tr>";
            while ($row = $resultDepartment->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["dName"] . "</td>";
                echo "</tr>";
                    }
                echo "</table>";
            } else {
                echo "No department found.";
                }
                

        //display the course the student is taking
        $queryCourse = "SELECT c.courseCode, c.courseName
        FROM course c
        JOIN enrollment e ON c.courseCode = e.courseCode
        JOIN student s ON e.sssn = s.ssn
        WHERE s.studentName = '$selectedStudent';
        ";
        $resultCourse = $conn->query($queryCourse);

       
        echo "<h3>The course of $selectedStudent</h3><br>";
        if ($resultCourse->num_rows > 0) {
            
            echo "<table><tr><th>Course Code</th><th>Course Name</th></tr>";
            while ($row = $resultCourse->fetch_assoc()) {
                echo "<tr><td>" . $row["courseCode"] . "</td><td>" . $row["courseName"] . "</td></tr>";
            }
            echo "</table><br><br>";
        }else {
            echo "<p>No course found.</p>";
        }

        //display the grade report of the student
        $queryGradeReport = "SELECT c.courseCode, c.courseName, e.grade
        FROM course c
        JOIN enrollment e ON c.courseCode = e.courseCode
        JOIN student s ON e.sssn = s.ssn
        WHERE s.studentName = '$selectedStudent';
        ";
        $resultGradeReport = $conn->query($queryGradeReport);

        
        echo "<h3>The grade report of $selectedStudent</h3><br>";
        if ($resultGradeReport->num_rows > 0) {
            
            echo "<table><tr><th>Course Code</th><th>Course Name</th><th>Grade</th></tr>";
            while ($row = $resultGradeReport->fetch_assoc()) {
                echo "<tr><td>" . $row["courseCode"] . "</td><td>" . $row["courseName"] . "</td><td>" . $row["grade"] . "</td></tr>";
            }
            echo "</table><br><br>";
        } else {
            echo "<p>No grade report found.</p>";
        }

        //display the weekly schedule of the student
        $querySchedule = "SELECT ws.dayy, ws.hourr, br.buildingName, br.roomNumber, c.courseCode, c.courseName
        FROM weeklyschedule ws
        JOIN sectionn sec ON ws.issn = sec.issn
        JOIN course c ON sec.courseCode = c.courseCode
        JOIN buildingandroom br ON ws.buildingName = br.buildingName AND ws.roomNumber = br.roomNumber
        JOIN enrollment e ON sec.issn = e.issn AND sec.courseCode = e.courseCode
        JOIN student s ON e.sssn = s.ssn
        WHERE s.studentName = '$selectedStudent';
        ";
        $resultSchedule = $conn->query($querySchedule);

        
        echo "<h3>The weekly schedule of $selectedStudent</h3><br>";
        if ($resultSchedule->num_rows > 0) {
            
            echo "<table><tr><th>Day</th><th>Time</th><th>Building</th><th>Room Number</th><th>Course Code</th><th>Course Name</th></tr>";
            while ($row = $resultSchedule->fetch_assoc()) {
                echo "<tr><td>" . $row["dayy"] . "</td><td>" . $row["hourr"] . "</td><td>" . $row["buildingName"] . "</td><td>" . $row["roomNumber"] . "</td><td>" . $row["courseCode"] . "</td><td>" . $row["courseName"] . "</td></tr>";
            }
            echo "</table><br><br>";
        } else {
            echo "<p>No schedule found.</p>";
        }

        //display the advisor of the student
        $queryAdvisor = "SELECT i.iName
        FROM instructor i
        JOIN student s ON i.ssn = s.advisorSsn
        WHERE s.studentName = '$selectedStudent';
        ";
        $resultAdvisor = $conn->query($queryAdvisor);

        
        echo "<h3>Advisor of $selectedStudent </h3><br>";
        if ($resultAdvisor->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>Advisor</th></tr>";
        
            while ($row = $resultAdvisor->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["iName"] . "</td>";
                echo "</tr>";
            }
        
            echo "</table>";
        } else {
            echo "No advisor found.";
        }
        

        //display the list of courses the student is supposed to take
        $queryCourseList = "SELECT c.courseCode, c.courseName
        FROM curriculacourses cc
        JOIN course c ON cc.courseCode = c.courseCode
        JOIN curricula cur ON cc.currCode = cur.currCode
        JOIN student s ON cur.dName = s.dName AND cur.currCode = s.currCode
        WHERE s.studentName = '$selectedStudent';
        ";
        $resultCourseList = $conn->query($queryCourseList);

        
        echo "<h3>The list of courses $selectedStudent is supposed to take</h3><br>";
        if ($resultCourseList->num_rows > 0) {
            
            echo "<table><tr><th>Course Code</th><th>Course Name</th></tr>";
            while ($row = $resultCourseList->fetch_assoc()) {
                echo "<tr><td>" . $row["courseCode"] . "</td><td>" . $row["courseName"] . "</td></tr>";
            }
            echo "</table><br><br>";
        } else {
            echo "<p>No course list found.</p>";
        }

        //display the list of projects the graduate student is working on
        if ($isGraduate) {
            $queryProjects = "SELECT p.pName, p.subject
                      FROM project p
                      JOIN project_has_gradstudent pg ON p.pName = pg.pName
                      JOIN gradstudent g ON pg.Gradssn = g.ssn
                      JOIN student s ON g.ssn = s.ssn
                      WHERE s.studentName = '$selectedStudent';";
                      
            $resultProjects = $conn->query($queryProjects);

            // Display the list of projects the student is working on
            if ($resultProjects->num_rows > 0) {
                echo "<h3>List of projects $selectedStudent is working on</h3><br>";
                echo "<table><tr><th>Project Name</th><th>Subject</th></tr>";
                while ($row = $resultProjects->fetch_assoc()) {
                    echo "<tr><td>" . $row["pName"] . "</td><td>" . $row["subject"] . "</td></tr>";
                }
                echo "</table><br><br>";
            } else {
                echo "<p>No projects found.</p>";
            }
        }

    }

    //close the database connection 
    $conn->close();
    ?>
</div>
</body>
</html>
