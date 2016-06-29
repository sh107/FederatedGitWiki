<?php

ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_NOTICE);

$path = "../wiki-html";

function getAllWiki(){
    global $path;

    $dir = $path;

    getFilenames($dir);
}


function getContentFromWiki($folderName){

    global $path;

    $dir = $path."/".$folderName;

    getFilenames($dir);
}

function getFilenames($dir){

    $data = createEmptyJSONDataArray();

    if(is_dir($dir)){
        $indir = array_filter(scandir($dir), function($item) {
            return $item[0] !== '.';
        });

        $data['result'] = 1;
        $data['data'] = $indir;
    }

    print_r(json_encode($data));
}

function createEmptyJSONDataArray(){
    $data = array();

    $data['result'] = 0;
    $data['data'] = json_decode ("{}");

    return $data;
}

?>
