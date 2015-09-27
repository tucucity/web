<?php 
class Main{
	public static function init()
    {
        $rssnoticias = Main::getFeed("http://cdn02.ib.infobae.com/adjuntos/162/rss/Infobae.xml",4);//"http://noticias-tucuman.webnode.es/rss/novedades.xml");//"http://cdn02.am.infobae.com/adjuntos/163/rss/ahora.xml");
        (new View())->show("main",array('rssnoticias'=>$rssnoticias));
    }

    public static function getFeed($feed_url,$cantidad=4) {

        $content = file_get_contents($feed_url);
        $x = new SimpleXmlElement($content);

        $rss = "";
        $cnt = 0;
        foreach($x->channel->item as $entry) {
            if($cnt == $cantidad ) {
                break;
            }
            $rss.= "<div class='col-xs-3 col-sm-3'>";
            $rss.= "<a class='link-fondoRojo' target='_blank' href='$entry->link' title='$entry->title'>" . strtoupper($entry->title) . "</a><br>";
            $rss.= "$entry->description";
            $rss.= "</div>";
            $cnt++;
        }
        //$rss .= "<div class='col-sm-2'></div>";

        return $rss;
    }

}

 ?>