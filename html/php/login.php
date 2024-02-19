<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html lang="html">
<head>

  <title>Text Parser</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" type="text/css" href="../css/index.css">

</head>
<header>

<div id="login-wrapper">
  <div id="content">
    <a>User:</a></br>
    <form method="post">
      <input type="text" name="login_value">
      <input type="submit" name="login" value="Login">
    </form>
  <?php

  if (isset($_POST['login'])){
    $text = $_POST['login_value'];

    // Checks if login string is empty and if it contains no spaces or non-alphabetical characters
    if (!empty($text) && ctype_alpha($text)) {
      $_SESSION["login"] = $text;
      header("Location: ../index.php");

    } else {
      echo nl2br ("Please enter a user. \n Spaces not allowed. \n Only alphabetical characters.");
    }
  }

  ?>
  </div>
</div>
</header>

<body>

</body>
</html>
