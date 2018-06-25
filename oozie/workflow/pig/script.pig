Funcionarios = LOAD '${INPUT}' USING PigStorage('\t') AS (ID, Nome, Cargo, Salario, Departamento);
STORE Funcionarios INTO '${OUTPUT}' USING PigStorage('\t');
