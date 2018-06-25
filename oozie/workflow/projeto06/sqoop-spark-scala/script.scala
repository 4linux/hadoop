case class TiposClass (ID: Long, Nome: String, Valor_KM: String, Prazo_Maximo: String)
case class EncomendasClass (ID: Long, CLI_ID: Long, Fun_ID: Long, Tip_ID: Long, Valor: Long, Data_Coleta: String, Data_Entrega: String)

val Tipos = sc.textFile("/dexter/projeto01/tipos_encomenda").map(callDetail => callDetail.split(",")).map(attributes => TiposClass (attributes(0).toInt,attributes(1),attributes(2),attributes(3))).toDF()
val Encomendas = sc.textFile("/dexter/projeto01/encomendas").map(callDetail => callDetail.split(",")).map(attributes => EncomendasClass (attributes(0).toInt,attributes(1).toInt,attributes(2).toInt,attributes(3).toInt,attributes(4).toInt,attributes(5),attributes(6))).toDF()

val Encomendas_Join = Encomendas.join(Tipos,Encomendas("Tip_ID") <=> Tipos("ID"))
val soma_encomendas_por_tipos = Encomendas_Join.groupBy($"nome").agg(sum("valor"))

soma_encomendas_por_tipos.rdd.saveAsTextFile("/dexter/projeto06/temp")
sc.textFile("/dexter/projeto06/temp/part*").coalesce(1).saveAsTextFile("/dexter/projeto06/soma_encomendas_por_tipos")

val fs = org.apache.hadoop.fs.FileSystem.get(new java.net.URI("hdfs://namenode:8020"), sc.hadoopConfiguration)
fs.delete(new org.apache.hadoop.fs.Path("/dexter/projeto06/temp"),true)
:quit
