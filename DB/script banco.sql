USE bhtdf3tusbz6r8ua6rnp;

CREATE TABLE unidades(
	id INT AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    ativo BOOLEAN NOT NULL,
    
    PRIMARY KEY (id)
);

CREATE TABLE clientes(
	id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    telefone VARCHAR(10),
    celular VARCHAR(11) NOT NULL,
    cep produtosVARCHAR(8) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    complemento VARCHAR(20),
    ativo BOOLEAN NOT NULL,
    
    PRIMARY KEY (id)
);

CREATE TABLE produtos(
	id INT AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    fabricante VARCHAR(30) NOT NULL,
    valor DOUBLE NOT NULL,
    descricao VARCHAR(255),
    ativo BOOLEAN NOT NULL,
    
    PRIMARY KEY (id)
);

CREATE TABLE estoque(
	id INT AUTO_INCREMENT,
    id_produto INT NOT NULL,
    id_unidade INT NOT NULL,
    quantidade INT NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (id_produto) REFERENCES produtos (id),
    FOREIGN KEY (id_unidade) REFERENCES unidades (id)
);

CREATE TABLE funcionarios(
	id INT AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    telefone VARCHAR(10),
    celular VARCHAR(11) NOT NULL,
    cep VARCHAR(8) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    complemento VARCHAR(20),
    id_unidade INT NOT NULL,
    area VARCHAR(20) NOT NULL,
    cargo VARCHAR(20) NOT NULL,
    salario DOUBLE NOT NULL,
    ativo BOOLEAN NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (id_unidade) REFERENCES unidades (id)
);

CREATE TABLE credenciais(
	id INT AUTO_INCREMENT,
    id_funcionario INT NOT NULL,
    usuario VARCHAR(30) UNIQUE NOT NULL,
    senha VARCHAR(30) NOT NULL,
    nivel_acesso INT NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id)
);

CREATE TABLE vendas(
	id INT AUTO_INCREMENT,
    id_funcionario INT NOT NULL,
    id_cliente INT NOT NULL,
    id_unidade INT NOT NULL,
    valor DOUBLE NOT NULL,
    data_venda DATE NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios (id),
    FOREIGN KEY (id_unidade) REFERENCES unidades (id)
);

CREATE TABLE venda_produto(
	id INT AUTO_INCREMENT,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (id_venda) REFERENCES vendas (id),
    FOREIGN KEY (id_produto) REFERENCES produtos (id)
);

CREATE TABLE teste_cliente(
	id INT AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    idade INT,
    
    PRIMARY KEY(id)
);

