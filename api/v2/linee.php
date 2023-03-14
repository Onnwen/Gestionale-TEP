<?php
require_once("../internal/common.php");

$allLines = simple_query("SELECT * FROM Linee");

// Traduzione da nomi del database a nomi dell'api
for($i = 0; $i < count($allLines); $i++){
    $finalObj[$i]["id"] = $allLines[$i]["idLinea"];
    
    // TODO: Trovare questi dati tramite query
    $finalObj[$i]["daily_passengers"] = "TODO";
    $finalObj[$i]["last_update"     ] = "TODO";
    $finalObj[$i]["current_bus"     ] = "TODO";
    $finalObj[$i]["last_stop"       ] = "TODO";
    $finalObj[$i]["last_update"     ] = "TODO";
    $finalObj[$i]["stops"           ] = get_all_stops($allLines[$i]);
}

send_as_json($finalObj);


function get_all_stops($line){
    // TODO: Fare effettivamente la query invece di returnare array vuoto
    return array();
}