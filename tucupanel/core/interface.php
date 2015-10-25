<?php

class Form
{
    private $id;
    private $method;
    private $action;
    private $class;
    private $element;

    public function __construct($id="",$method="",$action="",$class="")
    {
        $element = array();
    }

    public function add($element)
    {
        array_push($this->element,$element);
    }

    public function show()
    {
        $strHTML = "<form action='".$this->action." method='".$this->action."'>{content}</form>";
        for($i=0;$i<count($this->element);$i++)
        {
            $I = new Input();
        }

    }

}

class Input
{
    private $id;
    private $name;
    private $type;
    private $label;
    private $placeholder;
    private $value;
    private $class;

    function __construct()
    {
        $this->id="";
        $this->name="";
        $this->type="";
        $this->label="";
        $this->placeholder="";
        $this->value="";
        $this->class="";
    }
    function getId()
    {
        return $this->id;
    }
    function getName()
    {
        return $this->name;
    }
    function getType()
    {
        return $this->type;
    }
    function getLabel()
    {
        return $this->label;
    }
    function getPlaceholder()
    {
        return $this->placeholder;
    }
    function getValue()
    {
        return $this->value;
    }
    function getClass()
    {
        return $this->class;
    }

    function setId($val)
    {
        $this->id = $val;
    }
    function setName($val)
    {
        $this->name = $val;
    }
    function setType($val)
    {
        $this->type = $val;
    }
    function setLabel($val)
    {
        $this->label = $val;
    }
    function setPlaceholder($val)
    {
        $this->placeholder = $val;
    }
    function setValue($val)
    {
        $this->value = $val;
    }
    function setClass($val)
    {
        $this->class = $val;
    }

    public function show()
    {
        switch($this->type)
        {
            case 'text':
                return "<div class='form-group'>
                            <label for='".$this->id."'>".$this->label."</label>
                            <input type='".$this->type."' value='".$this->value."' class='form-control ".$this->class."' id='".$this->id."' placeholder='".$this->placeholder."'>
                          </div>";
                break;

            case 'textMod':
                return "<div class='form-group'>
                            <label for='".$this->id."'>".$this->label."</label>
                            <div class='input-group'>
                                  <input type='text' id='textMod_".$this->id."' value='".$this->value."' class='form-control ".$this->class."' placeholder='".$this->placeholder."'>
                                  <span class='input-group-btn'>
                                    <button class='btn btn-default' type='button'><span id='btnMod_textMod_".$this->id."' class='glyphicon glyphicon-pencil' style='line-height:inherit'></span></button>
                                    <button class='btn btn-default' type='button'><span id='btnSave_textMod_".$this->id."' class='glyphicon glyphicon-floppy-disk' style='line-height:inherit'></span></button>
                                  </span>
                            </div>
                        </div>
                        ";
                break;

            case 'submit':
                return "<button type='button' class='btn ".$this->class."'>".$this->value."</button>";
                break;

            default:
                return "<div class='form-group'>
                            <label for='".$this->id."'>".$this->label."</label>
                            <input type='".$this->type."' class='form-control' id='".$this->id."' placeholder='".$this->placeholder."'>
                          </div>";
        }

    }
}

?>