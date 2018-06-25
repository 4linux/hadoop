DROP TABLE IF EXISTS aula09_tabela_hive;
CREATE EXTERNAL TABLE aula09_tabela_hive (ID int,Nome string, Cargo string, Salario int, Departamento string) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' LOCATION '${INPUT}';
INSERT OVERWRITE DIRECTORY '${OUTPUT}' SELECT * FROM aula09_tabela_hive;
