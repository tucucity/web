<?php

Class Imagen
{

	public function __construct()
    {
		
	}

    public static function getURLs($folder="web/images/")
    {
        $directorio = dir(SERVER_ROOT."/".$folder);
        $imgList = array();
        while ($archivo = $directorio -> read())
        {
            if($archivo!="." && $archivo!="..")
            {
                if(is_file(SERVER_ROOT.$folder.$archivo))
                {
                    $ext = explode(".",$archivo);
                    if($ext[1]=="jpg" || $ext[1]=="png")
                    {
                        array_push($imgList,HOME.$folder.$archivo);
                    }
                }
            }
        }
        return $imgList;
    }

    public static function getImg($ruta,$anchop=0,$altop=0)
    {
        $file = $ruta;
        $info = new SplFileInfo($file);
        $File_Ext = $info->getExtension();
        $File_Name = $info->getFilename();
        $File_Dir = $info->getPath();

        if (headers_sent()) {
            // las cabeceras ya se han enviado, no intentar añadir una nueva
        }
        else {
            // es posible añadir nuevas cabeceras HTTP
            header("Content-type: image/".$File_Ext);
        }

        list($anchoO, $altoO) = getimagesize($file);

        if (($anchoO<>$anchop || $altoO<>$altop) && ($anchop<>0 || $altop<>0)) {
            $ancho = ($anchop==0 ? ($altop==0 ? $anchoO : $altop ): $anchop);
            $alto = ($altop==0 ? ($anchop==0 ? $altoO : $anchop ): $altop);

            $thumb = imagecreatetruecolor($ancho, $alto);
            switch($File_Ext){
                case 'bmp': $origen = imagecreatefromwbmp($file); break;
                case 'gif': $origen = imagecreatefromgif($file); break;
                case 'jpg': $origen = imagecreatefromjpeg($file); break;
                case 'png': $origen = imagecreatefrompng($file); break;
                default : return 'Tipo de archivo no soportado!';
            }

            imagecopyresized($thumb, $origen, 0, 0, 0, 0, $ancho, $alto, $anchoO, $altoO); //Parametros: $dst_image, $src_image, $dst_x, $dst_y, $src_x, $src_y, $dst_w, $dst_h, $src_w, $src_h

        }
        else {
            $thumb = imagecreatetruecolor($anchoO, $altoO);
            switch($File_Ext){
                case 'bmp': $origen = imagecreatefromwbmp($file); break;
                case 'gif': $origen = imagecreatefromgif($file); break;
                case 'jpg': $origen = imagecreatefromjpeg($file); break;
                case 'png': $origen = imagecreatefrompng($file); break;
                default : return 'Tipo de archivo no soportado!';
            }
            imagecopyresized($thumb, $origen, 0, 0, 0, 0, $anchoO, $altoO, $anchoO, $altoO);
            //$salida = $thumb; //imagepng($origen,null,5,PNG_FILTER_UP);
            //echo "Salida:".$salida."<br><br><br><br><br>";
        }

        imagepng($thumb);

    }

    public static function upload($input,$folder="/web/images/",$nombreImg="")
    {
        //$input es el id del input de la vista por ejemplo: <input name="FileInput" id="FileInput" type="file" />
        $file = SERVER_ROOT.$folder;
        $directorio = dir(SERVER_ROOT.$folder);

        if(isset($_FILES["$input"]) && $_FILES["$input"]["error"]== UPLOAD_ERR_OK)
        {
            //Se fija si es una peticion por Ajax
            /*if (!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){
                return "Llamado incorrectamente!!!";
            }*/

            //SI el archivo es superior al tamaño permitido
            if ($_FILES["$input"]["size"] > 5242880) {
                //die("Archivo supera los 5MB!");
                return "Archivo supera los 5MB!";
            }

            //Se fija si esta dentro de los tipos de archivos permitidos
            switch(strtolower($_FILES['$input']['type']))
            {
                case 'image/png':
                    break;
                case 'image/gif':
                    break;
                case 'image/jpeg':
                    break;
                case 'image/pjpeg':
                    break;
                case 'text/plain':
                    return 'Tipo de archivo no soportado!';
                    break;
                case 'text/html':
                    return 'Tipo de archivo no soportado!';
                    break;
                case 'application/x-zip-compressed':
                    return 'Tipo de archivo no soportado!';
                    break;
                case 'application/pdf':
                    return 'Tipo de archivo no soportado!';
                    break;
                case 'application/msword':
                    return 'Tipo de archivo no soportado!';
                    break;
                case 'application/vnd.ms-excel':
                    return 'Tipo de archivo no soportado!';
                    break;
                case 'video/mp4':
                    return 'Tipo de archivo no soportado!';
                    break;
                default:
                    return 'Tipo de archivo no soportado!';
            }

            $File_Name          = strtolower($_FILES['$input']['name']);
            $File_Ext           = substr($File_Name, strrpos($File_Name, '.'));
            $Random_Number      = rand(0, 9999999999);
            $NewFileName 		= (($nombreImg=="") ? 'Original_'.$Random_Number.'.png' : 'Original_'.$nombreImg.'.png');
            $NewFileName1 		= (($nombreImg=="") ? $Random_Number.'.png' : $nombreImg.'.png');

            if (move_uploaded_file($_FILES['$input']['tmp_name'], $directorio . $NewFileName)) {
                list($ancho, $alto) = getimagesize($directorio . $NewFileName);
                $thumb = imagecreatetruecolor(960, 380);

                switch($File_Ext){
                    case '.bmp': $origen = imagecreatefromwbmp($directorio . $NewFileName); break;
                    case '.gif': $origen = imagecreatefromgif($directorio . $NewFileName); break;
                    case '.jpg': $origen = imagecreatefromjpeg($directorio . $NewFileName); break;
                    case '.png': $origen = imagecreatefrompng($directorio . $NewFileName); break;
                    default : return 'Tipo de archivo no soportado!';
                }

                //Guardo la imagen original cambiada de tamaño
                if (imagecopyresized($thumb, $origen, 0, 0, 0, 0, 960, 380, $ancho, $alto)) {
                    if (imagepng($thumb,$directorio . $NewFileName1)) {
                        unlink($directorio . $NewFileName); //Elimino la imagen original subida.
                        return 'Correcto!';
                    }
                    else {
                        unlink($directorio . $NewFileName); //Elimino la imagen original subida.
                        return "No se pudo guardar la imagen con tamaño nuevo.";
                    }
                }
                else return "Algo no anduvo bien :(";

            } else {
                return 'Error al subir el archivo!';
            }
        }
        else
        {
            return 'Algo no anduvo bien porque el archivo supero el limite! Verificar "upload_max_filesize" del servidor.';
        }
    }
}
?>