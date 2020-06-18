<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
| -------------------------------------------------------------------
| DATABASE CONNECTIVITY SETTINGS
| -------------------------------------------------------------------
| This file will contain the settings needed to access your database.
|
| For complete instructions please consult the "Database Connection"
| page of the User Guide.
|
| -------------------------------------------------------------------
| EXPLANATION OF VARIABLES
| -------------------------------------------------------------------
|
|	['hostname'] The hostname of your database server.
|	['username'] The username used to connect to the database
|	['password'] The password used to connect to the database
|	['database'] The name of the database you want to connect to
|	['dbdriver'] The database type. ie: mysql.  Currently supported:
				 mysql, mysqli, postgre, odbc, mssql, sqlite, oci8
|	['dbprefix'] You can add an optional prefix, which will be added
|				 to the table name when using the  Active Record class
|	['pconnect'] TRUE/FALSE - Whether to use a persistent connection
|	['db_debug'] TRUE/FALSE - Whether database errors should be displayed.
|	['cache_on'] TRUE/FALSE - Enables/disables query caching
|	['cachedir'] The path to the folder where cache files should be stored
|	['char_set'] The character set used in communicating with the database
|	['dbcollat'] The character collation used in communicating with the database
|
| The $active_group variable lets you choose which connection group to
| make active.  By default there is only one group (the "default" group).
|
| The $active_record variables lets you determine whether or not to load
| the active record class
*/
   ///////////////////////////////////////////////////////////
    $db['localDB']['hostname'] = "localhost";
    $db['localDB']['username'] = "root";
    $db['localDB']['password'] = "mysql"; //en server linux
    $db['localDB']['database'] = "adysgem";
    $db['localDB']['dbdriver'] = "mysql"; //Updated to latest driver.
    $db['localDB']['dbprefix'] = "";
    $db['localDB']['pconnect'] = TRUE;
    $db['localDB']['db_debug'] = FALSE;
    $db['localDB']['cache_on'] = FALSE;
    $db['localDB']['cachedir'] = "";
    $db['localDB']['char_set'] = "utf8";
    $db['localDB']['dbcollat'] = "utf8_general_ci";
   
    $active_group = "localDB";
   
    $CI =& get_instance();
    
    $exconnection=$CI->session->userdata('connection');
  
    $CI->session->set_userdata('exconnection', $exconnection);
    $CI->session->set_userdata('connection', $active_group);
   

$active_record = TRUE;

?>
