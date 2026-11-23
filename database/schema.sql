USE meubolso:

CREATE TABLE usuarios(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    perfil ENUM('usuario','admin') NOT NULL DEFAULT 'usuario',
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

);
CREATE TABLE categorias(
    in INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    nome VARCHAR(200) NOT NULL,
    tipo ENUM('receita','despesa') NOT NULL

    FOREGIN KEY (usuario_id) REFERENCES usuario(id)
        ON DELETE CASCADE
);


CREATE TABLE transacoes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    categoria_id INT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    valor(10,2) NOT NULL,
    tipo ENUM('receita','despesa')NOT NULL,
    data DATE NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP

    FOREGIN KEY (usuario_id) REFERENCES usuario(id)
        ON DELETE RESTRICT,

    FOREGIN KEY (categoria_id) REFERENCES categorias(id)
        ON DELETE RESTRICT,

        CONSTRAINT chk_valor_positivo CHECK (valor > 0)
);