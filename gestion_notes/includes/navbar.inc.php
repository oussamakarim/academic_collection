<?php
    require_once('./php/config.php');
    
    if( !strcmp($_SESSION['role'], 'professor') ){
        $links = array('Profile', 'grades');
    } elseif ( !strcmp($_SESSION['role'], 'student') ) {
        $links = array('Profile', 'grades');
    } else {
        header('Location: ./index.php');
        die("Error: Including the navbar links");
    }
?>

<nav class="navbar sticky-top justify-content-end shadow-lg">

    <!-- university logo -->
    <a href="./professor.php" class="navbar-brand" style="flex-grow: 1;">
        <img src="<?=MEDIAPATH . 'icons/ensak.png';?>" alt="ENSAKH" height="44px">
    </a>

    <ul class="nav" role="tablist">
        <?php
            foreach($links as $link){
                echo '<li class="nav-item">';
                echo '<a href="#' . $link . '" class="nav-link" data-toggle="tab" role="tab" aria-controls="' . $link .  '">' . $link . '</a>';
                echo '</li>';
            }
        ?>

        <!-- search bar -->
        <?php

            if ($_SESSION['role'] == 'professor'){
                echo '<div class="form-inline searchbar" action="">';
                echo '    <input class="form-control" type="text" placeholder="Search">';
                echo '</div>';
            }
        ?>

        <!-- log out button -->
        <li class="nav-item">
            <a href="./logout.php" class="nav-link">logout</a>
        </li>
    </ul>
</nav>