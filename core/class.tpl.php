<?php
Class {Tabla}
{
    private $oBB;
    {atributos}

	public function __construct($id=null)
    {
        $this->oBB = new Conexion();
        if(!is_null($id))
        {
            $this->oBB->open();
            $result = $this->oBB->consult("SELECT * FROM {tabla} WHERE {AtributoPK}=".$id.";");
            $this->oBB->close();
            if(count($result)>0)
            {
                foreach ($result["0"] as $campo => $valor )
                {
                    $this->$campo = $valor;
                }
            }
        }
        else
        {
            $this->{AtributoPK} = null;
        }
    }

        {seters}

        {geters}

    public function save()
    {
        if($this->{AtributoPK}==null)
        {
            $this->oBB->open();
            $this->{AtributoPK} = $this->oBB->insert_id("INSERT INTO {tabla} ({INSERT_ATRIB}) VALUES ({INSERT_VALUES})");
            $this->oBB->close();
        }
        else
        {
            $this->oBB->open();
            $this->oBB->run("UPDATE {tabla} SET {UPDATE} WHERE {AtributoPK}=".$this->{AtributoPK}.";");
            $this->oBB->close();
        }
    }

    public function delete()
    {
        $this->oBB->open();
        $this->oBB->run("DELETE FROM {tabla} WHERE {AtributoPK}=".$this->{AtributoPK}.";");
        $this->oBB->close();
    }

    public function show()
    {
        return "
                    <div class='panel panel-default'>
                      <div class='panel-body'>
                        {AttribShow}
                      </div>
                    </div>
                    ";
    }

    public function convertToJSON()
    {
        $var = get_object_vars($this);
        unset($var['oBB']);
        return json_encode($var);
    }

    public function setAttributesJSON($JSON)
    {
        $Obj = json_decode($JSON);
        $result = "";
        foreach($Obj as $Attribute => $val)
        {
            if(property_exists($this,$Attribute))
            {
                $this->$Attribute = $val;
            }
        }
    }

    //---|||SimplePHP|||---//

}

// - Coleccion

Class Collection{Tabla}
{
    private $oBB;
    private $count;
    private $list;
    public ${tabla};

    public function __construct($condicion=null,$limit=null)
    {
        $this->oBB = new Conexion();
        $this->{tabla} = array();

        if(is_null($condicion))
        {
            $where = "";
        }
        else
        {
            $where = " WHERE ".$condicion;
        }

        if(is_null($limit))
        {
            $limit = "";
        }
        else
        {
            $limit = " LIMIT ".$limit;
        }

        $this->oBB->open();
        $result = $this->oBB->consult("SELECT * FROM {tabla} ".$where." ".$limit.";");
        $this->oBB->close();
        $this->count = count($result);
        $this->list = $result;
        if(count($result)>0)
        {
            for($i=0;$i<count($result);$i++)
            {
                $ob = new Object("{tabla}");
                foreach ( $result[$i] as $campo => $valor )
                {
                    $MCampo = 'set'.ucwords($campo);
                    $ob->$MCampo = $valor;
                }
                array_push($this->{tabla},$ob);
            }

        }

    }

    public function save()
    {
        for($i=0;$i<$this->count;$i++)
        {
            $this->{tabla}[$i]->save();
        }
    }

    public function count()
    {
        return $this->count;
    }

    public function convertToJSON()
    {
        return json_encode($this->list);
    }

}
?>