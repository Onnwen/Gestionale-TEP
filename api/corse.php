<?php
require_once("internal/connessione.php");

$id = isset($_GET["id"]) ? $_GET["id"] : null;


$extraQuery = "";
if (!is_null($id)) {
    $extraQuery = " WHERE id = " . $id;
}


$query = "SELECT * FROM Corse" . $extraQuery;

$result = mysqli_fetch_all(mysqli_query($conn, $query), MYSQLI_ASSOC);

echo json_encode($result);
