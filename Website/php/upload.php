<?php

ini_set('display_errors', '1');
ini_set('display_startup_errors', '1');
error_reporting(E_ALL);

$target_dir = "../temp/";
$user = "gud";
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
if($fileType != "txt" && !empty(basename($_FILES["fileToUpload"]["name"]))) {
  echo "Only .txt files allowed.";
  $uploadOk = 0;
}

// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
  echo "<br>Your file was not uploaded.";
  echo "<br><a href='../'> Go back </a>";
// if everything is ok, try to upload file
} else {
  if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
    sleep(1);
    if (file_exists("../temp/test.txt")) {
      echo $user;
      echo $file_name;
      $run = shell_exec("../bash/copyToUploads.sh $user $file_name");
      echo "The file ". htmlspecialchars(basename( $_FILES["fileToUpload"]["name"])). " has been uploaded.";
      echo "<br><a href='../'> Go back </a>";
    }
  } else {
    echo "Sorry, there was an error uploading your file.";
    echo "<br><a href='../'> Go back </a>";
  }
}
?>
