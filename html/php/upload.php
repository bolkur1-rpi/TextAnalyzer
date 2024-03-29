<?php

ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

session_start();
if(!isset($_SESSION['login'])) { header("Location: /php/login.php"); }

$target_dir = "../temp/";
$user = $_SESSION['login'];
$file_name = str_replace(' ', '_', basename($_FILES["fileToUpload"]["name"]));
$target_file = $target_dir . str_replace(' ', '_', basename($_FILES["fileToUpload"]["name"]));
$uploadOk = 1;
$fileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

// Check if file is chosen
if (empty(basename($_FILES["fileToUpload"]["name"]))) {
  echo "No file chosen.";
  $uploadOk = 0;
}

// Check if file already exists
if (file_exists($target_file) && !empty(basename($_FILES["fileToUpload"]["name"]))) {
  echo "File already exists.";
  $uploadOk = 0;
}

// Check file size
if ($_FILES["fileToUpload"]["size"] > 50000 && !(file_exists($target_file))) {
  echo "File is too large.";
  $uploadOk = 0;
}

// Allow certain file formats
if ($fileType != "txt" && !empty(basename($_FILES["fileToUpload"]["name"]))) {
  echo "Only .txt files allowed.";
  $uploadOk = 0;
}

// Checks if file is empty or contains only whitespace
if (strlen(trim(file_get_contents($_FILES["fileToUpload"]["tmp_name"]))) <= 0) {
  echo "File is empty or contains no text.";
  $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
  echo "<br>Your file was not uploaded.";
  echo "<br><a href='../'> Go back </a>";
// if everything is ok, try to upload file
} else {
  if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
    if (file_exists($target_file)) {
      //echo basename($_FILES["fileToUpload"]["name"]);
      $run = shell_exec("../bash/copyToUploads.sh $user $file_name");
      echo htmlspecialchars(basename( $_FILES["fileToUpload"]["name"])). " has been successfully uploaded.";
      echo "<br><a href='../'> Go back </a>";
    }
  } else {
    echo "Sorry, there was an error uploading your file.";
    echo "<br><a href='../'> Go back </a>";
  }
}
?>
