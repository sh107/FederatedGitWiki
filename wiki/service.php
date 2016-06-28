<?

ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_NOTICE);


$dir = "../wiki-html";


$indir = array_filter(scandir($dir), function($item) {
    return $item[0] !== '.';
});


print_r($indir);

$dir = "../wiki-html/phenomenal-h2020.wiki";


$indir = array_filter(scandir($dir), function($item) {
    return $item[0] !== '.';
});


print_r($indir);
?>
