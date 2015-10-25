<?php
/**
 * Created by PhpStorm.
 * User: Javier
 * Date: 02/09/2015
 * Time: 23:09
 */
class Mail {

    private $destino; // Email destino
    private $nomDes; // Nombre del destinatario (No es obligatorio)
    private $origen; // Email Origen
    private $passw;  // Password Origen
    private $nomOrigen; // Nombre del remitente (No es obligatorio)
    private $port = 486; // Numero de puerto smtp
    private $secure = false; // Si es seguro entonces hay que establecer un tipo de seguridad en la variable $ssl (TLS o SSL)
    private $ssl = "";
    private $smtp = true;
    private $asunto; // Titulo del mensaje
    private $texto; // Texto del mensaje (Puede ser HTML)
    private $error;

    public function __construct(){}
    public function __destruct(){}

    public function __set($name, $value)
    {
        $this->$name = $value;
    }

    public function __get($name)
    {
        if (isset($this->$name)) {
            return $this->$name;
        }
        return null;
    }

    public function enviar() {

        //require_once('core/class.phpmailer.php');

        $mail = new PHPMailer(); // defaults to using php "mail()"

        $mail->CharSet = "utf-8"; // Aca debe ir el mismo juego de caracteres que los archivos para que se interpreten bien los caracteres como acentos, etc.
        //$mail->Encoding = "quoted­printable";

        if ($this->smtp) $mail->IsSMTP();

        if (!isset($this->host)) {
            $this->error = "Debe indicar el HOST de envio de correo.";
            return false;
        }
        $mail->Host = $this->host; //"smtp.gmail.com";

        $mail->SMTPAuth = $this->smtp; //true;
        $mail->SMTPDebug  = 0;
        $mail->Port = $this->port; //587;

        if (!isset($this->origen)) {
            $this->error = "Debe indicar Email Origen/Usuario.";
            return false;
        } else {
            $mail->Username = $this->origen;
            if (isset($this->nomOrigen)) {
                $mail->SetFrom($this->origen, $this->nomOrigen);
                $mail->AddReplyTo($this->origen, $this->nomOrigen); //hay que dejar la misma direccion que el From, para no caer en SPAM
            } else {
                $mail->SetFrom($this->origen);
                $mail->AddReplyTo($this->origen);
            }
        }

        if (!isset($this->passw)) {
            $this->error = "Debe indicar Password Origen.";
            return false;
        }
        $mail->Password = $this->passw;

        if ($this->secure) $mail->SMTPSecure = $this->ssl; //'tls';

        if (isset($this->destino)) {
            if (isset($this->nomDes)) {
                $mail->AddAddress($this->destino, $this->nomDes);
            } else {
                $mail->AddAddress($this->destino);
            }
        } else {
            $this->error = "Debe indicar Email Destino.";
            return false;
        }

        $mail->Subject = (!isset($this->asunto) ? "" : $this->asunto);

        $mail->AltBody = "Cuerpo alternativo del mensaje";

        $body = (!isset($this->texto) ? "" : $this->texto);
        $mail->MsgHTML($body);

        //$mail->AddAttachment("ruta/archivo_adjunto.gif");


        if(!$mail->Send()) {
            echo "Error al enviar el mensaje: " . $mail->ErrorInfo;
        } else {
            echo "Mensaje enviado!!";
        }
        return true;
    }
}