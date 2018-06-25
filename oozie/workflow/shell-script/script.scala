val funcionarios = spark.read.json("/user/hduser/dados/funcionarios.json")
funcionarios.createOrReplaceTempView("funcionarios")
val qtd_departamentos_funcionarios = spark.sql("SELECT cargo,COUNT(departamento) FROM funcionarios GROUP by cargo")
qtd_departamentos_funcionarios.rdd.saveAsTextFile("/user/hduser/spark/contagem_funcionarios_por_departamentos")
:quit
