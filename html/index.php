<!DOCTYPE html>
<html lang="html">
<head>

  <title>Text Parser</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="css/index.css">

<?php

session_start();

if(!isset($_SESSION['login'])) {
    header("Location: /php/login.php");
}

?>

</head>
<header>
<div id="banner">
  <div id="upload">
    <form action="/php/upload.php" method="post" enctype="multipart/form-data">
      <input type="file" name="fileToUpload" id="fileToUpload" accept=".txt">
      </br></br>
      <input id="squarebutton" type="submit" value="Submit" name="submit">
    </form>
  </div>
  <div id="user-info">
    <?php
    echo "Current user: ".$_SESSION['login'];
    ?><br><br>
    <form method="post">
      <input type="submit" name="reset" value="Change user">
    </form>
  </div>
</div>
</header>
<body>
<div id="wrapper">
  <div id="content">
<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

if (isset($_POST['reset'])) {
  session_destroy();
  header("Location: /php/login.php");
}

$servername = "localhost";
$username = "root";
$password = "bolkur1";
$dbname = "textdb";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT paper.paper_id, paper.paper_name, paper.student_id, student.student_id, student.student_name FROM paper, student WHERE student.student_id = paper.student_id AND student.student_name = '".$_SESSION['login']."'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<br>". $row["paper_name"]. " (". $row["student_name"]. ")<br>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>
  </div>
</div>
</body>
</html>
