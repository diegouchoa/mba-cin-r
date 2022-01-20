# install.packages()
# library(reshape2)
# library(data.table)
# class(x) % tipo de dados 
# str(x) % exemplo do conteudo
# tail(x, y) % inverso do head
# getwd() % verificar o diretório de trabalho
# length(x) % verificar o tamanho do vetor
# choose(n, k) % Calcula o número de combinações de n elementos em grupos de tamanho k
# read.csv(file="text.csv", header=TRUE, sep=";") % lendo um csv

### Instalacao dos pacotes, caso ja nao existam
if (!require("reshape2")) install.packages("reshape2")
if (!require("data.table")) install.packages("data.table")
if (!require("rvest")) install.packages("rvest")

### Configuracao do ambiente
path <- "dados/megasena.csv"

### Leitura do arquivo e ja convertendo em um dataframe
df <- as.data.frame(read.csv(path, sep = ";", encoding = "UTF-8"))

### Renomeando a 1a coluna
colnames(df)[1] <- "Concurso"


### Descobrindo os numeros que aparecem com maior frequencia
m <- as.matrix(df[4:9])
inteiros_unicos <- unique(c(m))
qtd_repeticoes <- sapply(inteiros_unicos, function(x) sum(m == x))
names(qtd_repeticoes) <- inteiros_unicos
qtd_repeticoes <- sort(qtd_repeticoes, decreasing = TRUE)
top_numeros <- head(qtd_repeticoes, 50)
# barplot(top_numeros)


# Análise combinatoria de jogos a partir das dezenas escolhidas
S <- top_numeros
n <- length(S)
r <- 6
result <- t(combn(S,r))
result
