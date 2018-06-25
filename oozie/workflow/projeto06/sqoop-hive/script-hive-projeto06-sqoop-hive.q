DROP TABLE IF EXISTS projeto06_perfis_empresa_dexter;
CREATE EXTERNAL TABLE projeto06_perfis_empresa_dexter (id int, nome string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LOCATION '/dexter/projeto01/perfis';

DROP TABLE IF EXISTS projeto06_funcionarios_empresa_dexter;
CREATE EXTERNAL TABLE projeto06_funcionarios_empresa_dexter  (id int, nome string, email string, salario int, senha string, prf_id int) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LOCATION '/dexter/projeto01/funcionarios';

INSERT OVERWRITE DIRECTORY '/dexter/projeto06/soma_de_salario_por_perfil' SELECT A.nome, SUM(B.salario) FROM projeto06_perfis_empresa_dexter A FULL OUTER JOIN projeto06_funcionarios_empresa_dexter B ON (A.id = B.prf_id) GROUP BY A.nome;
