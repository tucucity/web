<br>
<div class="row">
    <div class="col-sm-3">
        <div class="input-group">
            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span></span>
            <input type="text" id="txtCondicion{Tabla}" class="form-control" placeholder="Search..." aria-describedby="basic-addon1" onkeypress="buscar{Tabla}(event);">
        </div>
    </div>
    <div class="col-sm-9 text-right">
        <nav>
            <ul class="pagination" style="margin: 0px;">
                <!-- li pages -->
            </ul>
        </nav>
    </div>
    <div class="col-sm-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                Lista de {Tabla}
            </div>
            <div class="panel-body" style="overflow: auto;">
                <table class="table table-hover" id="tabla{Tabla}">
                    <thead>
                    <tr>
                        {th}
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Data -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    var countRow = 8;
    var numberPage = 1;
    var condicion = null;

    window.onload = function()
    {
        setTable{Tabla}();
    }

    function clearTable{Tabla}()
    {
        filas = $("#tabla{Tabla} tr").length;
        for(i=1;i<filas;i++)
        {
            $("#tabla{Tabla} tr:last").remove();
        }
    }

    function buscar{Tabla}(e)
    {
        if(e.which == 13)
        {
            numberPage = 1;
            if($("#txtCondicion{Tabla}").val()!="")
            {
                condicion = $("#txtCondicion{Tabla}").val().toString();
            }
            else
            {
                condicion = null;
            }

            setTable{Tabla}();
        }
    }

    function setTable{Tabla}(page)
    {
        numberPage = page || numberPage;
        clearTable{Tabla}();
        Collection{Tabla}(numberPage,countRow,condicion,function(oc)
        {
            $(".pagination li").remove();

            $(".pagination").append('<li><a href="#" aria-label="Previous" onclick="$(\'#inputNumberPage\').val(parseInt($(\'#inputNumberPage\').val())-1);setTable{Tabla}($(\'#inputNumberPage\').val());"><span aria-hidden="true">&laquo;</span></a></li>');
            $(".pagination").append('<li><a><input id="inputNumberPage" type="number" onkeypress="if(event.which == 13){setTable{Tabla}($(\'#inputNumberPage\').val());}" value="'+numberPage+'" style="width: 50px;"> / '+oc.countPages+'</a></li>');
            $(".pagination").append('<li><a href="#" aria-label="Next" onclick="$(\'#inputNumberPage\').val(parseInt($(\'#inputNumberPage\').val())+1);setTable{Tabla}($(\'#inputNumberPage\').val());"><span aria-hidden="true">&raquo;</span></a></li>');


            clearTable{Tabla}();

            for(i=0;i<oc.{tabla}.length;i++)
            {
                $("#tabla{Tabla}").append("<tr>{td}</tr>");
            }


        });
    }

</script>