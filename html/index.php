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

<script>
  function populateContent() {
    console.log(fileName);
    document.getElementById("fileName").innerHTML = "riggar";
  }
</script>

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
    <?php echo "Current user: ".$_SESSION['login'];?><br><br>
    <form method="post">
      <input type="submit" name="reset" value="Change user">
    </form>
  </div>
</div>
</header>

<body>
<div id="wrapper">
  <div id="content">
    <a id="fileName">asd</a>
  </div>
  <div id="submissions">
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

  $sql = "SELECT * FROM paper, student WHERE student.student_name = '".$_SESSION['login']."'";
  $result = $conn->query($sql);
  $_SESSION['sub_count'] = $result->num_rows;
  echo "<a>Your submissions: <br></a>";
  if ($result->num_rows > 0) {
      // Output submissions
      while($row = $result->fetch_assoc()) {
        $testur = "riggar :) :)";
        echo "<a><img src='img/read.png' onclick='populateContent(".$testur."') alt='Info' height='12' width='12' title='Info'></img></a>";
        echo $row["paper_name"];
        echo "<br>";
      }
  } else {
      echo "No submissions found.";
  }

  $conn->close();
  ?>
  </div>
</div>
</body>
</html>
