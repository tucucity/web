<?php 
class Main{
	public static function init()
    {
        $rssnoticias = Main::getFeed("http://cdn02.ib.infobae.com/adjuntos/162/rss/Infobae.xml",2);//"http://noticias-tucuman.webnode.es/rss/novedades.xml");//"http://cdn02.am.infobae.com/adjuntos/163/rss/ahora.xml");
        (new View())->show("main","masterPage",array('rssnoticias'=>$rssnoticias));
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
            $rss.= "<div class='col-xs-12 col-sm-6 col-md-5 col-lg-5'>";
            $rss.= "<h5><a target='_blank' href='$entry->link' title='$entry->title'>" . strtoupper($entry->title) . "</a></h5>";
            $rss.= "<p>$entry->description</p>";
            $rss.= "</div>";
            $cnt++;
        }

        return $rss;
    }

}

 ?>