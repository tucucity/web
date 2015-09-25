<?php
Class Object
{
    private $object;
    private $clase;
    private $id;

    public function __construct($clase, $id=null)
    {
        $this->clase = $clase;
        $this->id = $id;
        if (class_exists($this->clase))
        {
            $this->object = ($this->id==null)? new $this->clase() : new $this->clase($this->id);
        }
        else
        {
            $reflect = new Reflect();
            if($reflect->createClass($this->clase))
            {
                include_once(SERVER_ROOT."/model/".$this->clase.".php");
                $this->object = ($id==null)? new $clase() : new $clase($id);
            }
            else
            {
                echo "La Tabla ".$this->clase." No Existe en la Base de Datos...";
                exit();
            }
        }
    }

    public function __set($method, $value)
    {
        if(method_exists($this->object,$method))
        {
            $this->object->$method($value);
        }
        else
        {
            $reflect = new Reflect();
            $OldObject = $this->object;
            if($reflect->createClass($this->clase))
            {
                unset($this->object);
                include_once(SERVER_ROOT."/model/".$this->clase.".php");
                $this->object = ($this->id==null)? new $this->clase() : new $this->clase($this->id);
                $this->object->setAttributesJSON($OldObject->convertToJSON());

                if(method_exists($this->object,$method))
                {
                    $this->object->$method($value);
                }
                else
                {
                    echo "El Metodo ".$method." No Existe en la Clase ".$this->clase."...";
                    exit();
                }
            }
            else
            {
                echo "La Tabla ".$this->clase." No Existe en la Base de Datos...";
                exit();
            }
        }
    }

    public function __get($method)
    {
        if(method_exists($this->object,$method))
        {
            return $this->object->$method();
        }
        else
        {
            $reflect = new Reflect();
            $OldObject = $this->object;
            if($reflect->createClass($this->clase))
            {
                include_once(SERVER_ROOT."/model/".$this->clase.".php");
                $this->object = ($this->id==null)? new $this->clase() : new $this->clase($this->id);

                $this->object->setAttributesJSON($OldObject->convertToJSON());

                if(method_exists($this->object,$method))
                {
                    return $this->object->$method();
                }
                else
                {
                    echo "La Metodo ".$method." No Existe en la Clase ".$this->clase."...";
                    exit();
                }
            }
            else
            {
                echo "La Tabla ".$this->clase." No Existe en la Base de Datos...";
                exit();
            }
        }
    }

    public function save()
    {
        $this->object->save();
    }

    public function delete()
    {
        $this->object->delete();
    }

    public function show()
    {
        return $this->object->show();
    }

    public function convertToJSON()
    {
        return $this->object->convertToJSON();
    }

    public function setAttributesJSON($JSON)
    {
        $this->object->setAttributesJSON($JSON);
    }


}

?>