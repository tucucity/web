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
}
?>