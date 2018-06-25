Funcionarios = LOAD '${INPUT}' USING PigStorage('\t') AS (id:int,nome:chararray,cargo:chararray,salario:int,departamento:chararray);
Filter_Funcionarios = FILTER Funcionarios BY departamento == 'Projetos';
STORE Filter_Funcionarios INTO 'hbase://aula09_funcionarios_import_pig_oozie' using org.apache.pig.backend.hadoop.hbase.HBaseStorage('dados:nome,dados:cargo,dados:salario,dados:departamento');
