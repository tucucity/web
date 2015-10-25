<?php
class Articulo
{
    public static function init()
    {
        (new View())->show("articulos","masterPage");
    }

    public static function getArticulos()
    {
        $ColArt = new CollectionObject('articulos');
        if(count($ColArt->articulos)>0)
        {
            echo $ColArt->convertToJSON();
        }

    }
}
?>