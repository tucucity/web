<br>
<div class="row">
    <div class="col-sm-4">

    </div>
    <div class="col-sm-4">
        <div class="panel panel-primary">
            <div class="panel-heading">Eliminar {Tabla}</div>
            <div class="panel-body">

                <form id="formDel{Tabla}">
                    {inputDel}

                    <button type="submit" class="btn btn-danger">Eliminar</button>
                    <span id="respuestaDel{Tabla}"></span>
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
        $("#formDel{Tabla}").submit(function(e)
        {
            e.preventDefault();

            {Tabla}($('#del{Tabla}{Pk}').val(),function(ob)
            {
                ob.delete(function(resp)
                {
                    if(resp="OK")
                    {
                        $("#respuestaDel{Tabla}").html(" <span class='glyphicon glyphicon-ok' style='color:#3e8f3e'></span> Eliminado...");
                    }
                    else
                    {
                        $("#respuestaDel{Tabla}").html(resp);
                    }
                });
            });
            return false;
        });

        $("#buscar{Tabla}").click(function()
        {
            {Tabla}($('#del{Tabla}{Pk}').val(),function(ob)
            {
                {setValDel}
            });
        });
    }

</script>