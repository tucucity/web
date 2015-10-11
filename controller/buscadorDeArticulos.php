<?php

class BuscardorDeArticulos
{
    public static function init()
    {

    }

    public static function buscar()
    {
        $cnx = new Conexion();
        $cnx->open();
        echo json_encode($cnx->consult("SELECT * FROM search1"));
        $cnx->close();
    }
}

?>