<?php
    $lang = strtoupper(substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2));

    if ($lang == "KO") {
      echo ("<script>location.replace('/oph_kor/main/main.html');</script>");
    } else {
        echo ("<script>location.replace('/oph_eng/main/main.html');</script>");
    }
?>

