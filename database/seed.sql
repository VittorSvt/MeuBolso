USE meubolso;

-- Usado apenas para testes

INSERT INTO usuarios (nome, email, senha_hash)
VALUES (
    'Usuario Teste',
    'teste@meubolso.local',
    'HASH_PENDENTE'
);

-- Categorias do usuario de teste

INSERT INTO categorias (usuario_id, nome, tipo)
SELECT id, 'Salario', 'receita'
FROM usuarios WHERE email = 'teste@meubolso.local';

INSERT INTO categorias (usuario_id, nome, tipo)
SELECT id, 'Alimentacao', 'despesa'
FROM usuarios WHERE email = 'teste@meubolso.local';

INSERT INTO categorias (usuario_id, nome, tipo)
SELECT id, 'Transporte', 'despesa'
FROM usuarios WHERE email = 'teste@meubolso.local';

INSERT INTO categorias (usuario_id, nome, tipo)
SELECT id, 'Lazer', 'despesa'
FROM usuarios WHERE email = 'teste@meubolso.local';

-- Receita de exemplo

INSERT INTO transacoes
(usuario_id, categoria_id, descricao, valor, tipo, data)
SELECT u.id, c.id, 'Salario mensal', 2500.00, 'receita', '2026-11-05'
FROM usuarios u
JOIN categorias c ON c.usuario_id = u.id
WHERE u.email = 'teste@meubolso.local'
AND c.nome = 'Salario';

-- Despesa com alimentacao

INSERT INTO transacoes
(usuario_id, categoria_id, descricao, valor, tipo, data)
SELECT u.id, c.id, 'Compras no mercado', 350.75, 'despesa', '2026-11-08'
FROM usuarios u
JOIN categorias c ON c.usuario_id = u.id
WHERE u.email = 'teste@meubolso.local'
AND c.nome = 'Alimentacao';

-- Despesa com transporte

INSERT INTO transacoes
(usuario_id, categoria_id, descricao, valor, tipo, data)
SELECT u.id, c.id, 'Abastecimento', 120.00, 'despesa', '2026-11-12'
FROM usuarios u
JOIN categorias c ON c.usuario_id = u.id
WHERE u.email = 'teste@meubolso.local'
AND c.nome = 'Transporte';

-- Despesa com lazer

INSERT INTO transacoes
(usuario_id, categoria_id, descricao, valor, tipo, data)
SELECT u.id, c.id, 'Cinema', 45.00, 'despesa', '2026-11-15'
FROM usuarios u
JOIN categorias c ON c.usuario_id = u.id
WHERE u.email = 'teste@meubolso.local'
AND c.nome = 'Lazer';
