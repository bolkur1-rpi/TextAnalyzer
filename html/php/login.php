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

    if (!empty($text) && str_replace(' ', '', ($text)) == $text) {
      $_SESSION["login"] = $text;
      header("Location: ../index.php");

    } else {
      echo "Please enter a user.\nSpaces not allowed.";
    }
  }

  ?>
  </div>
</div>
</header>

<body>

</body>
</html>
