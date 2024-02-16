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
  function getFileContents(file) {
  var path = "../uploads/" + file + ".txt";
  var req = new XMLHttpRequest();
  req.open("GET", path, true);
  req.send();
  req.onreadystatechange = function() {
      if (req.readyState== 4 && req.status == 200) {
        return req.responseText;
      }
    }
  }

  function populateContent(fileName, words, uniqueWords, fileContents) {
    document.getElementById("displayName").innerHTML = fileName;
    document.getElementById("wordCount").innerHTML = words;
    document.getElementById("wordCountUnique").innerHTML = uniqueWords;
    document.getElementById("fileContents").innerHTML = fileContents;
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
    Submission name: <a id="displayName"></a><br>
    Word count: <a id="wordCount"></a><br>
    Unique word count: <a id="wordCountUnique"></a><br>
    Submission contents: <br><textarea id="fileContents" readonly></textarea><br>
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

  // Connect
  $conn = new mysqli($servername, $username, $password, $dbname);
  // Connection check
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }

  $sql = "SELECT * FROM paper, student WHERE student.student_id = paper.student_id AND student.student_name = '".$_SESSION['login']."'";
  $result = $conn->query($sql);
  if ($result->num_rows > 0) {
      // Output submissions
      while($row = $result->fetch_assoc()) {
        echo "<button class='borderButton' onclick='populateContent(\"$row[paper_display_name]\", \"$row[number_of_words]\", \"$row[number_of_unique_words]\", getFileContents(\"$row[paper_name]\"))'><img src='img/read.png' alt='Info' height='12' width='12' title='Info'></img></button>";
        echo " " . $row["paper_display_name"] . "<br>";
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