<?php
/**
 * Created by PhpStorm.
 * User: Javier
 * Date: 24/09/2015
 * Time: 20:52
 */

class Buscador
{

    public function buscar($frase,$itmf,$ordf,$tipf,$alt,$texto)
    {
// $itmf es una condicion extra que depende del formulario de búsqueda
// $ordf depende también del formulario de búsqueda
// $tipf es AND o OR dependiendo de si se selecciona búsqueda que contengan todas las palabras o no
// para más de 5 palabras, la idea era enviar a la ... pero al final, he decidido que no...
        $paraules = explode(" ", $frase);
        if (count($paraules) == 1) {
            $sqlBuscar = mysql_query("SELECT * FROM items
                                 WHERE $alt LIKE '%$paraules[0]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 OR $texto LIKE '%$paraules[0]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 ORDER BY $ordf")
            or die(mysql_error());
            $totalRows = mysql_num_rows($sqlBuscar);
        } elseif (count($paraules) == 2) {
            $sqlBuscar = mysql_query("SELECT * FROM items
                                 WHERE $alt LIKE '%$paraules[0]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $alt LIKE '%$paraules[1]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 OR $texto LIKE '%$paraules[0]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $texto LIKE '%$paraules[1]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 ORDER BY $ordf")
            or die(mysql_error());
            $totalRows = mysql_num_rows($sqlBuscar);
        } elseif (count($paraules) == 3) {
            $sqlBuscar = mysql_query("SELECT * FROM items
                                 WHERE $alt LIKE '%$paraules[0]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $alt LIKE '%$paraules[1]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $alt LIKE '%$paraules[2]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 OR $texto LIKE '%$paraules[0]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $texto LIKE '%$paraules[1]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $texto LIKE '%$paraules[2]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 ORDER BY $ordf")
            or die(mysql_error());
            $totalRows = mysql_num_rows($sqlBuscar);
        } elseif (count($paraules) == 4) {
            $sqlBuscar = mysql_query("SELECT * FROM items
                                 WHERE $alt LIKE '%$paraules[0]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $alt LIKE '%$paraules[1]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $alt LIKE '%$paraules[2]%'
                                                                  AND sec1+0 > 0
                                 $itmf
                                 $tipf $alt LIKE '%$paraules[3]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 OR $texto LIKE '%$paraules[0]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $texto LIKE '%$paraules[1]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $texto LIKE '%$paraules[2]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $texto LIKE '%$paraules[3]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 ORDER BY $ordf")
            or die(mysql_error());
            $totalRows = mysql_num_rows($sqlBuscar);
        } elseif (count($paraules) == 5) {
            $sqlBuscar = mysql_query("SELECT * FROM items
                                 WHERE $alt LIKE '%$paraules[0]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $alt LIKE '%$paraules[1]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $alt LIKE '%$paraules[2]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $alt LIKE '%$paraules[3]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $alt LIKE '%$paraules[4]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 OR $texto LIKE '%$paraules[0]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $texto LIKE '%$paraules[1]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $texto LIKE '%$paraules[2]%'
                                 AND sec1+0 > 0
                                 $itmf
                                 $tipf $texto LIKE '%$paraules[3]%'
                                 AND sec1+0 > 0
                                 $itmf
                                $tipf $texto LIKE '%$paraules[4]%'
                                 AND sec1+0 > 0
                                $itmf
                                 ORDER BY $ordf")
            or die(mysql_error());
            $totalRows = mysql_num_rows($sqlBuscar);
        } else {
            $sqlBuscar = mysql_query("SELECT * FROM items
                                WHERE $alt LIKE '%$frase%'
                              AND sec1+0 > 0
                               $itmf
                               OR $texto LIKE '%$frase%'
                                 AND sec1+0 > 0
                                 $itmf
                                 ORDER BY $ordf")
            or die("Error, pruebe más tarde");
            $totalRows = mysql_num_rows($sqlBuscar);

        }


    }

}