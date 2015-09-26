<?php 
class Main{
	public static function init()
    {
        $rssnoticias = Main::getFeed("http://cdn02.ib.infobae.com/adjuntos/162/rss/Infobae.xml",3);//"http://noticias-tucuman.webnode.es/rss/novedades.xml");//"http://cdn02.am.infobae.com/adjuntos/163/rss/ahora.xml");
        (new View())->show("main",array('rssnoticias'=>$rssnoticias));
    }

    public static function getFeed($feed_url,$cantidad=5) {

        $content = file_get_contents($feed_url);
        $x = new SimpleXmlElement($content);

        $rss = "<div class='col-sm-2'></div>";
        $cnt = 0;
        foreach($x->channel->item as $entry) {
            if($cnt == 3 ) {
                break;
            }
            $rss.= "<div class='col-sm-3'>";
            $rss.= "<a href='$entry->link' title='$entry->title'>" . $entry->title . "</a><br>";
            $rss.= "$entry->description";
            $rss.= "</div>";
            $cnt++;
        }
        $rss .= "<div class='col-sm-1'></div>";

        return $rss;
    }

}

 ?>