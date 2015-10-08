<?php
class Login
{
    public static function init()
    {
        (new View())->show("tucupanel/login","tucupanel/masterPage");
    }
}
?>