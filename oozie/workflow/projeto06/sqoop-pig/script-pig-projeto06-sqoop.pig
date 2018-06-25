clientes_dexter = LOAD '/dexter/projeto01/clientes/part-m-00000' USING PigStorage(',') AS (id:int, nome_razao:chararray, cpf_cnpj:chararray, email:chararray, telefone:chararray, celular:chararray, cep:chararray, endereco:chararray, numero:int, bairro:chararray, cidade:chararray, estado:chararray);
encomendas_dexter = LOAD '/dexter/projeto01/encomendas/part-m-00000' USING PigStorage(',') AS (id:int, cli_id:int, fun_id:int, tip_id:int, valor:int, data_coleta:chararray, data_entrega:chararray);

join_clientes_encomendas_dexter = JOIN clientes_dexter BY id FULL OUTER, encomendas_dexter BY cli_id;

group_estado = GROUP join_clientes_encomendas_dexter by estado;

soma_vendas_encomendas_estado = FOREACH group_estado GENERATE group,SUM(join_clientes_encomendas_dexter.valor);

STORE soma_vendas_encomendas_estado INTO '/dexter/projeto06/soma_de_encomendas_por_estado' USING PigStorage(',');
