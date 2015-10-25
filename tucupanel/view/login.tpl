
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-4 col-lg-4"></div>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
            <div class="panel panel-primary login">
                <div class="panel-heading text-center">
                    <h3 class="panel-title">Tucu Panel</h3>
                </div>
                <div class="panel-body text-center">
                    <div id="preloader" class="preloader5OFF">
                        <div id="imgLogin">
                            <img src="{IMG}avatar.png">
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-12 col-lg-12">
                        <form id="formLogin">
                            <label id="user"></label>
                            <input id="txtUser" class="form-control text-center" type="text" placeholder="Ingrese el Usuario"/>
                            <input id="txtPass" class="form-control text-center" type="password" placeholder="Ingrese el Password"/>
                            <br>
                            <input type="submit" id="btnSession" class="btn btn-primary form-control" value="Siguiente">
                            <br>
                            <label id="respuesta" class="text-danger"></label>
                        </form>
                    </div>
                </div>
                <button id="btnVolver" class="btn"><span class="glyphicon glyphicon-chevron-left"></span></button>
            </div>
        </div>
        <div class="col-sm-3 col-md-4 col-lg-4"></div>
    </div>
</div>

<script>
    window.images = '{IMG}';
    window.user;
    $('#txtUser').focus();
    $('#txtPass').hide();
    $('#btnVolver').hide();
    $('#btnVolver').on('click',function()
    {
        $('#txtUser').show();
        $('#txtUser').focus();
        $('#txtPass').hide();
        $('#btnVolver').hide();
        $('#respuesta').html("");
        $('#user').html("");
        $('#imgLogin').find('img').attr('src',window.images+'avatar.png');
    });

    $('#formLogin').submit(
            function()
            {
                cargando();
                $('#formLogin').fadeTo("slow" , 0.2)

                if($('#txtUser').css('display')!='none')
                {
                    $('#respuesta').html("");
                    setTimeout(getUsuario,2000);
                }
                else
                {
                    $('#respuesta').html("");
                    setTimeout(iniciarSession,2000);
                }
                return false;
            }
    );
    function getUsuario()
    {
        $.post('{HOME}login/getUser/'+$('#txtUser').val(),function(result)
        {
            detenerCarga();
            if(result.length>0)
            {
                window.user = result[0];
                $('#user').html(window.user.nombre);
                $('#imgLogin').find('img').attr('src',window.images+window.user.foto);
                $('#txtUser').hide();
                $('#txtPass').show();
                $('#btnVolver').show();
                $('#btnSession').val("Iniciar Sesión");
                $('#txtPass').focus();
            }
            else
            {
                $('#respuesta').html("El usuario no existe...");
            }
            $('#formLogin').fadeTo("slow" , 1);

        },'json');
    }

    function iniciarSession()
    {
        if($('#txtPass').val() == window.user.password)
        {
            $.post('{HOME}session/iniciar/'+window.user.Id,function(result)
            {
                window.location.href = '{HOME}';
            },'json');
        }
        else
        {
            detenerCarga();
            $('#respuesta').html("Contraseña Incorrecta...");
            $('#txtPass').focus();
            $('#formLogin').fadeTo("slow" , 1);
        }
    }

    function cargando()
    {
        $('#preloader').removeClass('preloader5OFF');
        $('#preloader').addClass('preloader5ON');
    }
    function detenerCarga()
    {
        $('#preloader').removeClass('preloader5ON');
        $('#preloader').addClass('preloader5OFF');
    }
</script>
