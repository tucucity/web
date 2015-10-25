function {Tabla}(id,funcion)
{
    id = id || null;
    funcion = funcion || null;

    {atributos}

    this.save = function(funcResp)
    {
        funcResp = funcResp || null;

        strJson =
        {
            {strJson}
        }
        $.post( "{HOME}{tabla}/sync/save",JSON.stringify(strJson, null, 2),function(data)
        {
            if(funcResp!=null)
            {
                funcResp(data.status);
            }

        },"json");

    }

    this.delete = function(funcRespD)
    {
        funcRespD = funcRespD || null;

        strJson =
        {
            {strJson}
        }
    $.post( "{HOME}{tabla}/sync/delete",JSON.stringify(strJson, null, 2),function(data)
    {
        if(funcRespD!=null)
        {
            funcRespD(data.status);
        }

    },"json");

    }

    if(id!=null)
    {
        $.post( "{HOME}{tabla}/sync/get/"+id, function(data)
        {
            ob = new {Tabla}();
            {setAttrib}
            funcion(ob);
        },"json");
    }

}

function Collection{Tabla}(page,filas,condicion,funcionCollection)
{
    this.{tabla};
    this.countPages;

    page = page || 1;
    filas = filas || 100;
    condicion = condicion || "-";
    funcionCollection = funcionCollection || null;

    if(funcionCollection!=null)
    {
        linkData = "{HOME}Collection{Tabla}/sync/get/"+condicion+"/"+page+"/"+filas;
        linkCount = "{HOME}Collection{Tabla}/sync/countPages/"+condicion+"/"+page+"/"+filas;

        $.post(linkData,function(data)
        {
            ob = new Collection{Tabla}();
            ob.{tabla}=data;
            $.post(linkCount,function(dataCount)
            {
                ob.countPages = dataCount.countPages;
                funcionCollection(ob);

            },"json");

        },"json");
    }

}