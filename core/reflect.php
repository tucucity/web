<?php 
class Reflect
{
	public function createClass($tableName,$temp=null)
    {
		$dir = SERVER_ROOT."/model/";
		$maquetaClass = file_get_contents(SERVER_ROOT."/core/class.tpl.php");
		$clase = $tableName;

		//********************************************************************

		$oBB = new Conexion();
		$oBB->open();
		$atrib = $oBB->consult("DESCRIBE ".$clase);
		$oBB->close();

        if(count($atrib)>0)
        {

            //Clases
            $defAtrib = "";
            $PK_AutoIncremental = "";
            $seters = "";
            $geters = "";
            $insertAtrib = "";
            $insertValues = "";
            $updateValues = "";
            $attribShow = "";

            for($i=0;$i<count($atrib);$i++)
            {
                //------- Definicion de Atributos
                $defAtrib = $defAtrib."private $".$atrib[$i]['Field'].";
		";
                //------- Atributo PK AutoIncremental
                if($atrib[$i]['Extra']=='auto_increment')
                {
                    $PK_AutoIncremental = $atrib[$i]['Field'];
                }
                // -------- Seters
                    $seters = $seters."public function set".ucwords($atrib[$i]['Field'])."($".$atrib[$i]['Field'].")
		        {
		            \$this->".$atrib[$i]['Field']." = $".$atrib[$i]['Field'].";
		        }
		        ";
                // ------- Geters
                $geters = $geters."public function get".ucwords($atrib[$i]['Field'])."()
		        {
		        return \$this->".$atrib[$i]['Field'].";
		        }
		        ";
                //------- Atributo para Insert
                if($atrib[$i]['Extra']!='auto_increment')
                {
                    ($insertAtrib=="")?($insertAtrib = $atrib[$i]['Field']):($insertAtrib = $insertAtrib.",".$atrib[$i]['Field']);
                }

                //------- Valores para Insert
                if($atrib[$i]['Extra']!='auto_increment')
                {
                    if(strpos($atrib[$i]['Type'],'int')!== FALSE || strpos($atrib[$i]['Type'],'tinyint')!== FALSE || strpos($atrib[$i]['Type'],'smallint')!== FALSE || strpos($atrib[$i]['Type'],'mediumint')!== FALSE || strpos($atrib[$i]['Type'],'bigint')!== FALSE || strpos($atrib[$i]['Type'],'float')!== FALSE || strpos($atrib[$i]['Type'],'decimal')!== FALSE)
                    {
                        ($insertValues=="")?($insertValues = "\$this->".$atrib[$i]['Field']):($insertValues = $insertValues.",\$this->".$atrib[$i]['Field']);
                    }
                    else
                    {
                        ($insertValues=="")?($insertValues = "'\$this->".$atrib[$i]['Field']."'"):($insertValues = $insertValues.",'\$this->".$atrib[$i]['Field']."'");
                    }

                }

                //-------------- valores para UPDATE
                if($atrib[$i]['Extra']!='auto_increment')
                {
                    if(strpos($atrib[$i]['Type'],'int')!== FALSE || strpos($atrib[$i]['Type'],'tinyint')!== FALSE || strpos($atrib[$i]['Type'],'smallint')!== FALSE || strpos($atrib[$i]['Type'],'mediumint')!== FALSE || strpos($atrib[$i]['Type'],'bigint')!== FALSE || strpos($atrib[$i]['Type'],'float')!== FALSE || strpos($atrib[$i]['Type'],'decimal')!== FALSE)
                    {
                        ($updateValues=="")?($updateValues = $atrib[$i]['Field']."=\$this->".$atrib[$i]['Field']):($updateValues = $updateValues.",".$atrib[$i]['Field']."=\$this->".$atrib[$i]['Field']);
                    }
                    else
                    {
                        ($updateValues=="")?($updateValues = $atrib[$i]['Field']."='\$this->".$atrib[$i]['Field']."'"):($updateValues = $updateValues.",".$atrib[$i]['Field']."='\$this->".$atrib[$i]['Field']."'");
                    }

                }

                //---------------- atributos para Show
                $attribShow .= "
                            <b>".$atrib[$i]['Field'].": </b>\".\$this->".$atrib[$i]['Field'].".\"<br>";

            }

            $contenido = view::parse($maquetaClass, array(
                    "Tabla" => ucwords($clase),
                    "tabla" => $clase,
                    "atributos" => $defAtrib,
                    "AtributoPK" => $PK_AutoIncremental,
                    "seters" => $seters,
                    "geters" => $geters,
                    "INSERT_ATRIB" => $insertAtrib,
                    "INSERT_VALUES" => $insertValues,
                    "UPDATE" => $updateValues,
                    "AttribShow" => $attribShow
                )
            );
            $file=fopen($dir."\\".$clase.".php","w");
            fwrite($file,$contenido);
            fclose($file);

            if($temp!=null)
            {
                $contenido = view::parse($maquetaClass, array(
                        "Tabla" => ucwords($clase.$temp),
                        "tabla" => $clase,
                        "atributos" => $defAtrib,
                        "AtributoPK" => $PK_AutoIncremental,
                        "seters" => $seters,
                        "geters" => $geters,
                        "INSERT_ATRIB" => $insertAtrib,
                        "INSERT_VALUES" => $insertValues,
                        "UPDATE" => $updateValues,
                        "AttribShow" => $attribShow
                    )
                );
                $file=fopen($dir."\\".$clase.$temp.".php","w");
                fwrite($file,$contenido);
                fclose($file);
            }

            return true;
        }
        else
        {
            return false;
        }

	}

    public function createRelation($clase,$clase_id,$claseRelacion,$claseRelacion_id,$tipoRelacion)
    {
            $dir = SERVER_ROOT."/model/";
            $maquetaClass = file_get_contents($dir."\\".$clase.".php");

    //********************************************************************

            $methodo = "";
            if($tipoRelacion=="1")
            {
                $methodo = "

        public function get".ucwords($claseRelacion)."()
        {
            \$o".ucwords($claseRelacion)." = new ".ucwords($claseRelacion)."(\$this->".$clase_id.");
            return \$o".ucwords($claseRelacion).";
        }

        //---|||SimplePHP|||---//

        ";
            }
            else
            {
                $methodo = "

        public function getCollection".ucwords($claseRelacion)."(\$wr=null)
        {
            \$where = '';
            if(\$wr!=null)
            {
                \$where = ' AND '.\$wr;
            }

            \$o".ucwords($claseRelacion)." = new Collection".ucwords($claseRelacion)."('".$claseRelacion_id."='.\$this->".$clase_id.".\$where);
            return \$o".ucwords($claseRelacion).";
        }

        //---|||SimplePHP|||---//

        ";
            }

            $maquetaClass = str_replace("//---|||SimplePHP|||---//",$methodo,$maquetaClass);

            $ruta = $dir."\\".$clase.".php";
            $contenido = $maquetaClass;
            unlink($ruta);
            $file=fopen($ruta,"w");
            fwrite($file,$contenido);
            fclose($file);
    }

    public function getAttribClass($class)
    {
        $oBB = new Conexion();
        $oBB->open();
        $atrib = $oBB->consult("DESCRIBE ".$class);
        $oBB->close();
        $atributos = "";
        for($i=0;$i<count($atrib);$i++)
        {
            $atributos = $atributos."<option value='".$atrib[$i]['Field']."'>".$atrib[$i]['Field']."</option>";
        }

        return json_encode(array("options"=>$atributos));
    }

    public function createJS($tableName)
    {
        $dir = SERVER_ROOT."/web/sjs/";
        $maquetaClass = file_get_contents(SERVER_ROOT."/core/classJS.tpl.js");
        $clase = $tableName;

        //********************************************************************

        $oBB = new Conexion();
        $oBB->open();
        $atrib = $oBB->consult("DESCRIBE ".$clase);
        $oBB->close();

        //Clases
        $defAtrib = "";
        $PK_AutoIncremental = "";
        $setAtributos = "";
        $strJson = "";

        for($i=0;$i<count($atrib);$i++)
        {
            //------- Definicion de Atributos
            $defAtrib = $defAtrib."this.".$atrib[$i]['Field'].";
    ";
            //------- Seteo de Atributos
            $setAtributos = $setAtributos."ob.".$atrib[$i]['Field']." = data.".$atrib[$i]['Field'].";
            ";
            //------- Atributo PK AutoIncremental
            if($atrib[$i]['Extra']=='auto_increment')
            {
                $PK_AutoIncremental = $atrib[$i]['Field'];
            }

            $strJson.= ($i==0)?$atrib[$i]['Field'].":this.".$atrib[$i]['Field']:",
            ".$atrib[$i]['Field'].":this.".$atrib[$i]['Field'];

        }

        $contenido = view::parse($maquetaClass, array(
                "Tabla" => ucwords($clase),
                "tabla" => $clase,
                "atributos" => $defAtrib,
                "setAttrib"=>$setAtributos,
                "AtributoPK" => $PK_AutoIncremental,
                "strJson"=>$strJson
            )
        );
        $file=fopen($dir."\\".$clase.".js","w");
        fwrite($file,$contenido);
        fclose($file);

        $masterPage = file_get_contents(SERVER_ROOT."/view/masterPage.tpl");

        if(!strpos($masterPage, "<script src='{SJS}".$clase."'></script>"))
        {
            $script = "<script src='{SJS}".$clase."'></script>
    <!-- SimpleJS -->";
            $masterPage = str_replace("<!-- SimpleJS -->",$script,$masterPage);
            $fileMP=fopen(SERVER_ROOT."/view/masterPage.tpl","w");
            fwrite($fileMP,$masterPage);
            fclose($fileMP);
        }

    }

    public function createView($tableName)
    {
        $dir = SERVER_ROOT."/view/";
        $maquetaViewNew = file_get_contents(SERVER_ROOT."/core/viewNew.tpl.tpl");
        $maquetaViewList = file_get_contents(SERVER_ROOT."/core/viewList.tpl.tpl");
        $maquetaViewMod = file_get_contents(SERVER_ROOT."/core/viewMod.tpl.tpl");
        $maquetaViewDel = file_get_contents(SERVER_ROOT."/core/viewDel.tpl.tpl");
        $clase = $tableName;

        //********************************************************************

        $oBB = new Conexion();
        $oBB->open();
        $atrib = $oBB->consult("DESCRIBE ".$clase);
        $oBB->close();

        $viewNew = "";
        $viewMod = "";
        $viewMod2 = "";
        $viewDel = "";
        $viewDel2 = "";
        $attrJSViewNew = "";
        $thViewList = "";
        $lineasTD = "";
        $Pk = "";
        $getValMod = "";
        $setValMod = "";
        $getValDel = "";
        $setValDel = "";

        for($i=0;$i<count($atrib);$i++)
        {
            //------- Definicion de input para alta
            if($atrib[$i]['Extra']!='auto_increment')
            {
            $viewNew = $viewNew."<div class='form-group'>
                        <label for='new".ucwords($clase).ucwords($atrib[$i]['Field'])."'>".$atrib[$i]['Field']."</label>
                        <input type='text' class='form-control' id='new".ucwords($clase).ucwords($atrib[$i]['Field'])."' placeholder='Enter ".$atrib[$i]['Field']."' required=''>
                    </div>
    ";
                $viewMod2 = $viewMod2."<div class='form-group'>
                        <label for='mod".ucwords($clase).ucwords($atrib[$i]['Field'])."'>".$atrib[$i]['Field']."</label>
                        <input type='text' class='form-control' id='mod".ucwords($clase).ucwords($atrib[$i]['Field'])."' placeholder='Enter ".$atrib[$i]['Field']."' required=''>
                    </div>
    ";
                $viewDel2 = $viewDel2."<div class='form-group'>
                        <label for='del".ucwords($clase).ucwords($atrib[$i]['Field'])."'>".$atrib[$i]['Field']."</label>
                        <input type='text' class='form-control' id='del".ucwords($clase).ucwords($atrib[$i]['Field'])."' placeholder='Enter ".$atrib[$i]['Field']."' required=''>
                    </div>
    ";
                $attrJSViewNew = $attrJSViewNew."ob.".$atrib[$i]['Field']." = $('#new".ucwords($clase).ucwords($atrib[$i]['Field'])."').val();
            ";
                $getValMod = $getValMod."ob.".$atrib[$i]['Field']." = $('#mod".ucwords($clase).ucwords($atrib[$i]['Field'])."').val();
            ";
                $setValMod = $setValMod."$('#mod".ucwords($clase).ucwords($atrib[$i]['Field'])."').val(ob.".$atrib[$i]['Field'].");
            ";

                $setValDel = $setValDel."$('#del".ucwords($clase).ucwords($atrib[$i]['Field'])."').val(ob.".$atrib[$i]['Field'].");
            ";
            }
            else
            {
                $Pk = $atrib[$i]['Field'];
                $viewMod = $viewMod."<div class='form-group'>
                        <label for='mod".ucwords($clase).ucwords($atrib[$i]['Field'])."'>".$atrib[$i]['Field']."</label>
                        <div class='input-group'>
                            <input type='text' class='form-control' id='mod".ucwords($clase).ucwords($atrib[$i]['Field'])."' placeholder='Enter ".$atrib[$i]['Field']."' required=''>
                              <span class='input-group-btn'>
                                <button id='buscar".ucwords($clase)."' class='btn btn-default' type='button'><span class='glyphicon glyphicon-search'></span></button>
                              </span>
                        </div>
                    </div>
    ";
                $viewDel = $viewDel."<div class='form-group'>
                        <label for='del".ucwords($clase).ucwords($atrib[$i]['Field'])."'>".$atrib[$i]['Field']."</label>
                        <div class='input-group'>
                            <input type='text' class='form-control' id='del".ucwords($clase).ucwords($atrib[$i]['Field'])."' placeholder='Enter ".$atrib[$i]['Field']."' required=''>
                              <span class='input-group-btn'>
                                <button id='buscar".ucwords($clase)."' class='btn btn-default' type='button'><span class='glyphicon glyphicon-search'></span></button>
                              </span>
                        </div>
                    </div>
    ";
            }

            //------------- th para tabla en ViewList
            $thViewList .= "<th>".$atrib[$i]['Field']."</th>";
            $lineasTD .= "<td>\"+oc.".$clase."[i].".$atrib[$i]['Field']."+\"</td>";
        }

        // ------------------ creacion de TPL
        $contenido = view::parse($maquetaViewNew, array(
                "Tabla" => ucwords($clase),
                "tabla" => $clase,
                "inputNew"=>$viewNew,
                "attribJSNew" => $attrJSViewNew
            )
        );
        $file=fopen($dir."\\new".ucwords($clase).".tpl","w");
        fwrite($file,$contenido);
        fclose($file);

        $contenido = view::parse($maquetaViewList, array(
                "Tabla" => ucwords($clase),
                "tabla" => $clase,
                "th"=>$thViewList,
                "td"=>$lineasTD
            )
        );
        $file=fopen($dir."\\ver".ucwords($clase).".tpl","w");
        fwrite($file,$contenido);
        fclose($file);

        $contenido = view::parse($maquetaViewMod, array(
                "Tabla" => ucwords($clase),
                "tabla" => $clase,
                "inputMod"=>$viewMod.$viewMod2,
                "Pk"=>ucwords($Pk),
                "getValMod"=>$getValMod,
                "setValMod"=>$setValMod
            )
        );
        $file=fopen($dir."\\mod".ucwords($clase).".tpl","w");
        fwrite($file,$contenido);
        fclose($file);

        $contenido = view::parse($maquetaViewDel, array(
                "Tabla" => ucwords($clase),
                "tabla" => $clase,
                "inputDel"=>$viewDel.$viewDel2,
                "Pk"=>ucwords($Pk),
                "setValDel"=>$setValDel
            )
        );
        $file=fopen($dir."\\del".ucwords($clase).".tpl","w");
        fwrite($file,$contenido);
        fclose($file);



        // Agrega Menu
        $masterPage = file_get_contents(SERVER_ROOT."/view/masterPage.tpl");

        if(!strpos($masterPage, "<a href='#' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>".ucwords($clase)." <span class='caret'></span></a>"))
        {
            $itemMenu = "<li class='dropdown'>
                        <a href='#' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>".ucwords($clase)." <span class='caret'></span></a>
    <ul class='dropdown-menu'>
                            <li><a href='{HOME}view/show/new".ucwords($clase)."'><span class='glyphicon glyphicon-plus'></span> Nuevo</a></li>
                            <li><a href='{HOME}view/show/ver".ucwords($clase)."'><span class='glyphicon glyphicon-th-list'></span> Listar</a></li>
                            <li><a href='{HOME}view/show/mod".ucwords($clase)."'><span class='glyphicon glyphicon-pencil'></span> Modificar</a></li>
                            <li><a href='{HOME}view/show/del".ucwords($clase)."'><span class='glyphicon glyphicon-remove'></span> Eliminar</a></li>
                        </ul>
                    </li>
                    <!-- itemMenuSimplePHP -->";
            $masterPage = str_replace("<!-- itemMenuSimplePHP -->",$itemMenu,$masterPage);
            $fileMP=fopen(SERVER_ROOT."/view/masterPage.tpl","w");
            fwrite($fileMP,$masterPage);
            fclose($fileMP);
        }


    }

}

 ?>