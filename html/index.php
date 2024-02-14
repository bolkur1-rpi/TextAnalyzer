<!DOCTYPE html>
<html lang="html">
<head>

  <title>Text Parser</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="css/index.css">

<?php
session_start();
if(!isset($_SESSION['login'])) { header("Location: /php/login.php"); }
?>

</head>
<header>

<!--<div id="box" class="box">

  <div class="box-content">
    <span class="close">&times;</span>
    <p>ASD</p>
  </div>

</div>-->

<div id="banner">
  <div id="upload">
    <form action="/php/upload.php" method="post" enctype="multipart/form-data">
      <input type="file" name="fileToUpload" id="fileToUpload" accept=".txt">
      </br></br>
      <input id="squarebutton" type="submit" value="Submit" name="submit">
    </form>
  </div>
  <div id="user-info">
    <?php echo "Current user: ".$_SESSION['login'];?><br><br>
    <form method="post">
      <input type="submit" name="reset" value="Change user">
    </form>
  </div>
</div>
</header>

<body>
<div id="wrapper">
  <div id="submissions">
    <a>asd</a>
  </div>
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

  $sql = "SELECT * FROM paper, student WHERE student.student_id = paper.student_id AND student.student_name = '".$_SESSION['login']."'";
  $result = $conn->query($sql);
  echo "<a>Your submissions: <br></a>";
  if ($result->num_rows > 0) {
      // output data of each row
      while($row = $result->fetch_assoc()) {
        echo "<div id='info'><img src='img/read.png' alt='read' height='12' width='12' title='Info'></a>";
        echo $row["paper_name"]. " (". $row["student_name"]. ")";
        
      }
  } else {
      echo "0 results";
  }

  $conn->close();
  ?>
  </div>
</div>

<script>

var box = document.getElementById("box");
var close = document.getElementById("info");
var span = document.getElementsByClassName("close")[0];

close.onclick = function() {
  box.style.display = "block";
}

span.onclick = function() {
  box.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == box) {
    box.style.display = "none";
  }
}
</script>

</body>
</html>
