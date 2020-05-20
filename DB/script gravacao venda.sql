START TRANSACTION;

INSERT INTO vendas (id_funcionario, id_cliente, id_unidade, valor, data_venda)
VALUES  (3, 1, 1, 500, "2020-05-19");

SET @sale_id = LAST_INSERT_ID();

INSERT INTO venda_produto (id_venda, id_produto, quantidade)
VALUES (@sale_id, 1, 1);

INSERT INTO venda_produto (id_venda, id_produto, quantidade)
VALUES (@sale_id, 2, 1);

INSERT INTO venda_produto (id_venda, id_produto, quantidade)
VALUES (@sale_id, 3, 1);

COMMIT;