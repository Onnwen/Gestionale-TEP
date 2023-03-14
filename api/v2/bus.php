<?php
require_once("../internal/common.php");

$allBuses = simple_query("SELECT * FROM Autobus");

// Traduzione da nomi del database a nomi dell'api
for($i = 0; $i < count($allBuses); $i++){
    $finalObj[$i]["id"       ] = $allBuses[$i]["idBus"      ];
    $finalObj[$i]["latitude" ] = $allBuses[$i]["Latitudine" ];
    $finalObj[$i]["longitude"] = $allBuses[$i]["Longitudine"];
    $finalObj[$i]["status"   ] = $allBuses[$i]["Stato"      ];
    
    // TODO: Trovare questi dati tramite query
    $finalObj[$i]["next_stop"  ] = "TODO";
    $finalObj[$i]["last_stop"  ] = "TODO";
    $finalObj[$i]["last_update"] = "TODO";
}

send_as_json($finalObj);