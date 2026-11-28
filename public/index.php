<?php

header('Content-Type: application/json; charset=utf-8');

try {
    require_once __DIR__ . '/../config/database.php';

    $pdo->query('SELECT 1');

    http_response_code(200);

    echo json_encode([
        'status' => 'ok',
        'mensagem' => 'MeuBolso funcionando',
        'banco' => 'conectado'
    ]);

} catch (Throwable $e) {
    error_log($e->getMessage());

    http_response_code(500);

    echo json_encode([
        'status' => 'erro',
        'mensagem' => 'Erro interno do servidor'
    ]);
}
