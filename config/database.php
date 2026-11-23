
<?php

$host = getenv('DB_HOST') ?: 'db';
$dbname = getenv('DB_NAME') ?: 'meubolso';
$user = getenv('DB_USER') ?: 'meubolso';
$password = getenv('DB_PASSWORD');

if ($password === false) {
    throw new RuntimeException('Senha do banco nao configurada.');
}

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$dbname;charset=utf8mb4",
        $user,
        $password
    );

    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    error_log($e->getMessage());
    throw new RuntimeException('Erro ao conectar com o banco de dados.', 0, $e);
}
