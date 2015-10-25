<?php
class Login
{
    public static function init()
    {
        (new View())->show("login","masterPage");
    }

    public static function getUser($userName)
    {
        $ColUser = new CollectionObject('usuario',"(user='".$userName."' OR email='".$userName."')");
        if(count($ColUser->usuario)>0)
        {
            //$ColUser->usuario[0]->setPass = "";
        }
        echo $ColUser->convertToJSON();
    }
}
?>