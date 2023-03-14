<?php
require_once("connessione.php");

function simple_query($query){
    global $conn;
    
    return mysqli_fetch_all(mysqli_query($conn, $query), MYSQLI_ASSOC);
}

function send_as_json($toSend){
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($toSend);
}
