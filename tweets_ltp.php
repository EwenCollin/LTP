<?php
$tweet_nb = $_GET['nb'];
$message_is = $_GET['msg'];
libxml_use_internal_errors(true);
$dom = new DOMDocument;
$dom->loadHTMLFile('https://twitter.com/hashtag/ltp?f=tweets&vertical=default&src=hash');
libxml_use_internal_errors(false);

$tags_trash = array("<div class=\"js-tweet-text-container\">", "<p class=\"TweetTextSize  js-tweet-text tweet-text\" lang=\"fr\" data-aria-label-part=\"0\">", "<a href=\"/hashtag/FEEDTHEPATRICK?src=hash\" data-query-source=\"hashtag_click\" class=\"twitter-hashtag pretty-link js-nav\" dir=\"ltr\"><s>", "</s><b><strong>", "</strong></b></a></p>\n</div>", "\n");
$tags_trash_pseudo = array("<b>", "</b>", "<span class=\"username u-dir u-textTruncate\" dir=\"ltr\" data-aria-label-part=\"\">","</span>", "\n", "Plus", "Copier le lien du Tweet", "Intégrer le Tweet", " ", " ", "minilya");
$tags_trash_pseudo_cleanup = array("minilya", "hilya", "silya");

$xpath = new DOMXPath($dom);
$tweet_content1 = new DOMDocument;
$tweet_content1 = $xpath->query('//div[@class="js-tweet-text-container"]');
$xpath_pseudo = new DOMXPath($dom);
$pseudo1 = $xpath_pseudo->query('//div[@class="stream-item-header"]');

	$tweet_content_final = $tweet_content1->item($tweet_nb);
	$tweet_content_final = $dom->saveXML($tweet_content_final);

	$pseudo_final = $pseudo1->item($tweet_nb);
	$pseudo_final = $dom->saveXML($pseudo_final);


	$tweet = $tweet_content_final;
	$tweet = str_replace($tags_trash, "", $tweet);
	$tweet = strip_tags($tweet);
	$tweet = html_entity_decode($tweet);
	$pseudo = $pseudo_final;
	$pseudo = str_replace($tags_trash_pseudo, "", $pseudo);
	$pseudo  = strip_tags($pseudo );
	$pseudo  = html_entity_decode($pseudo );
	$pseudo = str_replace($tags_trash_pseudo_cleanup, "", $pseudo);
	if ($message_is == 1) {
		echo $tweet;	
		echo "\n";	
	}
	else {
		echo " ";
		echo $pseudo;
		echo " - ";
		echo $tweet;	
		echo "\n";	
		
	}
?>