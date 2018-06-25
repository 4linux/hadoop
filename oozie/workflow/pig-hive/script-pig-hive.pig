Funcionarios = LOAD 'aula05_funcionarios' USING org.apache.hive.hcatalog.pig.HCatLoader();
Filter_Funcionarios = FILTER Funcionarios BY departamento == 'Vendas';
STORE Filter_Funcionarios INTO '${OUTPUT}' USING PigStorage('\t');
