<?

ini_set('display_errors', 1);
error_reporting(E_ALL ^ E_NOTICE);

include('service.php');

switch($_SERVER['REQUEST_METHOD']) {
    case 'GET':
        $file_name = isset($_GET['filename']) ? $_GET['filename'] : '';
        listFiles($file_name);
        break;
    default:
        print_r(json_encode(createEmptyJSONDataArray()));
}

function listFiles($file_name){

    // No ../ are allowed and something has to be requested
    if(  (strpos($file_name, '../') !== false || $file_name == '') ) {
        getAllWiki();
    } else {
        getContentFromWiki($file_name);
    }

}

?>
