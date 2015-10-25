<br>
<div class="row">
    <div class="col-sm-4">

    </div>
    <div class="col-sm-4">
        <div class="panel panel-primary">
            <div class="panel-heading">Modificar {Tabla}</div>
            <div class="panel-body">

                <form id="formMod{Tabla}">
                    {inputMod}

                    <button type="submit" class="btn btn-primary">Guardar</button>
                    <span id="respuestaMod{Tabla}"></span>
                </form>

            </div>
        </div>
    </div>
    <div class="col-sm-4">

    </div>
</div>

<script>
    window.onload = function()
    {
        $("#formMod{Tabla}").submit(function(e)
        {
            e.preventDefault();

            {Tabla}($('#mod{Tabla}{Pk}').val(),function(ob)
            {
                {getValMod}
                ob.save(function(resp)
                {
                    if(resp="OK")
                    {
                        $("#respuestaMod{Tabla}").html(" <span class='glyphicon glyphicon-ok' style='color:#3e8f3e'></span> Guardado...");
                    }
                    else
                    {
                        $("#respuestaMod{Tabla}").html(resp);
                    }
                });
            });
            return false;
        });

        $("#buscar{Tabla}").click(function()
        {
            {Tabla}($('#mod{Tabla}{Pk}').val(),function(ob)
            {
                {setValMod}
            });
        });
    }

</script>