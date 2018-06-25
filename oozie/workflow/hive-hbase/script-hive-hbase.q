DROP TABLE IF EXISTS aula09_hbase_table_funcionarios_oozie;
CREATE TABLE aula09_hbase_table_funcionarios_oozie (id int, nome string, cargo string, salario int, departamento string) STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler' WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,dados:nome,dados:cargo,dados:salario,dados:departamento") TBLPROPERTIES ("hbase.table.name" = "aula09_funcionarios_import_hive_oozie");
INSERT OVERWRITE TABLE aula09_hbase_table_funcionarios_oozie SELECT * FROM aula05_funcionarios WHERE departamento = 'Vendas';
