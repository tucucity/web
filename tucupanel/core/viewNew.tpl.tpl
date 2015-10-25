<br>
<div class="row">
    <div class="col-sm-4">

    </div>
    <div class="col-sm-4">
        <div class="panel panel-primary">
            <div class="panel-heading">New {Tabla}</div>
            <div class="panel-body">

                <form id="formNew{Tabla}">
                    {inputNew}
                    <button type="submit" class="btn btn-primary">Guardar</button>
                    <span id="respuestaNew{Tabla}"></span>
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
        $("#formNew{Tabla}").submit(function(e)
        {
            e.preventDefault();

            ob = new {Tabla}();
            {attribJSNew}
            ob.save(function(resp)
            {
                if(resp="OK")
                {
                    $("#respuestaNew{Tabla}").html(" <span class='glyphicon glyphicon-ok' style='color:#3e8f3e'></span> Guardado...");
                }
                else
                {
                    $("#respuestaNew{Tabla}").html(resp);
                }
            });
            return false;
        });
    }

</script>