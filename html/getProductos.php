<?php
$host = 'my-ecomerce-db-container'; // Nombre del contenedor de MySQL
$user = 'dbadmin'; // Usuario de la base de datos
$password = '5xzDZ00'; // Contraseña de la base de datos
$database = 'db-my-ecomerce'; // Nombre de la base de datos

// Conexión a la base de datos
$conn = new mysqli($host, $user, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error en la conexión: " . $conn->connect_error);
}

// Consulta para obtener los datos de la tabla Usuario
$sql = "SELECT * FROM Productos";
$result = $conn->query($sql);

$productos = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $productos[] = $row;
    }
}

$conn->close();

// Devolver los datos en formato JSON
header('Content-Type: application/json');
echo json_encode($productos);
?>