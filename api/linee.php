<?php
require_once("internal/connessione.php");

$id = isset($_GET["id"]) ? $_GET["id"] : null;


$extraQuery = "";
if (!is_null($id)) {
    $extraQuery = " WHERE Linee.id = " . $id;
}


$queryLinee = "SELECT * FROM Linee" . $extraQuery;

$result = mysqli_fetch_all(mysqli_query($conn, $queryLinee), MYSQLI_ASSOC);

for ($i = 0; $i < count($result); $i++) {
    $queryFermate = "SELECT Fermate.id, Fermate.Zona, Fermate.Nome, Fermate.Lat, Fermate.Lon FROM Fermate INNER JOIN Fermate_Linee ON Fermate_Linee.idFermata = Fermate.id INNER JOIN Linee ON Fermate_Linee.idLinea = Linee.id WHERE Linee.id = " . $result[$i]["id"];
    $fermate = mysqli_fetch_all(mysqli_query($conn, $queryFermate), MYSQLI_ASSOC);

    $result[$i]["fermate"] = $fermate;
}

echo json_encode($result);
