# Lista de Exercicios 
# Estruturas de Repetição e Funções

library(magrittr)
library(tidyverse)
library(data.table)

# Questao 1
# Dado o conjunto de números naturais entre 1 e 500.000, resolva as questões a seguir:
# 
  # 1 Quantos números primos existem neste intervalo?
  # Dica: Crie uma função chamada contar_primos(limite) que receba um número limite (neste caso, 500.000) e retorne a quantidade de números primos encontrados.

is_prime <- function(k){
  if (k <= 1){
    return(FALSE)
  } else if (k == 2 | k == 3){
    return(TRUE)
  } else{
    for (i in 2:floor(k/2)){
      if (k %% i == 0){
        return(FALSE)
      }
    }
  }
  return(TRUE)
}

# Resoluçao:
contar_primos <- function(limite){
  n_primos <- 0
  if (limite > 0 & limite <= 500000){
    for (i in 1:limite){
      if (is_prime(i) == TRUE){
        n_primos <- n_primos + 1
      }
    }
  }
  return(n_primos)
}



# 2 Quantos números pertencem à sequência ( S_i ), definida por:
# [ S_i = i + (i^2)/2 ]
# Condição: Considere apenas os números de ( S_i ) no intervalo [1, 500.000].
# Dica: Implemente uma função chamada calcular_sequencia(limite) que retorne os números ( S_i ) que atendem à condição.

# Resoluçao:
calcular_sequencia <- function(limite){
  i <- 1
  sequencia <- c(0)
  if (limite <= 1 | limite > 500000) {
    return(NULL)
  }
  while (((i^2)/2 + i) <= limite) {
    sequencia <- c(sequencia, ((i^2)/2 + i))
    i <- i + 1
  }
  return(sequencia[-1])
}






# Questao 2
# Faça um programa que calcule o novo salário de um funcionário com base no código de seu cargo, de acordo com a tabela abaixo:
# 
# Código	Cargo	Aumento
# 1	Estagiário	10%
# 2	Analista Júnior	20%
# 3	Analista Pleno	22%
# 4	Analista Senior	25%
# 5	Especialista	28%


# 1 Implemente uma função chamada calcular_aumento(codigo, salario) que receba o
# código do cargo e o salário atual,e retorne o valor do aumento e o novo salário.
# 
# Resoluçao:
calcular_aumento <- function(codigo, salario){
  dt <- data.table(cod = c(1, 2, 3, 4, 5),
                   cargo = c("Estagiário", "Analista Júnior", "Analista Pleno", "Analista Senior", "Especialista"),
                   aumento_percent = c(0.10, 0.2, 0.22, 0.25, 0.28))
  if (codigo < min(dt$cod) | codigo > max(dt$cod)){
    return(NULL)
  }
  aumento_percent <- dt[cod == codigo, aumento_percent]
  novo_salario <- (1 + aumento_percent) * salario
  return(novo_salario)
}

#2 Aplique a função sobre uma lista de funcionários com diferentes cargos e salários, e exiba os resultados.
#
## Resoluçao:
funcionarios <- list(c(1, 12000), c(5, 20000), c(3, 5000), c(2, 6000), c(4, 3000))
lapply(funcionarios, function(param) {
  do.call(calcular_aumento, as.list(param))
})




# Questao 3
# Um indivíduo possui três meios de transporte e escolhe o mais apropriado com base nas condições abaixo:
  # 1 Escolha do meio de transporte com base na distância:
  # Mais de 500 km: Avião.
  # Entre 50 e 500 km: Carro.
  # Menos de 50 km: Bicicleta.
# 
  # 2 Escolha do combustível quando usa o carro:
  # Etanol: até 75% do preço da gasolina.
  # GNV: até 60% do preço da gasolina.
  # Caso contrário: Gasolina.
#
# Implemente as seguintes funções:
# 1 escolher_transporte(distancia) - Retorna o meio de transporte ideal com base na distância.

# Resoluçao:
escolher_transporte <- function(distancia){
  if (distancia < 50){
    return("Bicicleta")
  } else if(distancia >= 50 & distancia <= 500){
    return("Carro")
  } else if(distancia > 500){
    return("Avião")
  }
}

# 2 escolher_combustivel(preco_gasolina, preco_etanol, preco_gnv) - Retorna o combustível ideal baseado nos preços atuais.
# 
# Resoluçao:
escolher_combustivel <- function(preco_gasolina, preco_etanol, preco_gnv){
  if ((preco_gnv/preco_gasolina) <= 0.6){
    return("GVN")
  } else if((preco_etanol/preco_gasolina) <= 0.75){
    return("Etanol")
  } else {
    return("Gasolina")
  }
}

# Qual transporte e combustível o indivíduo deve escolher para ir:
# A Florianópolis (750 km).
escolher_transporte(750)
# A Natal (3.000 km).
escolher_transporte(3000)
# A Araucária (25 km).
escolher_transporte(25)




# Questao 4
# Crie uma matriz ( M ) ( 10 \times 10 ) preenchida com números aleatórios entre 1 e 100.
# Desenvolva as seguintes funções para manipular a matriz:

M <- matrix(runif(1:100, 1, 100), nrow = 10)

# 1 soma_linha(matriz, linha) - Calcula a soma dos elementos de uma linha específica.
soma_linha <- function(matriz, linha){
  soma <- sum(matriz[linha, ])
  return(soma)
}
# soma_coluna(matriz, coluna) - Calcula a soma dos elementos de uma coluna específica.
soma_coluna <- function(matriz, coluna){
  soma <- sum(matriz[, coluna])
  return(soma)
}
# diagonal_principal(matriz) - Retorna os elementos da diagonal principal.
diagonal_principal <- function(matriz){
  if (nrow(matriz) != ncol(matriz)){return(NULL)}
  soma = 0
  for (i in 1:ncol(matriz)){
    soma = soma + matriz[i, i]
  }
  return(soma)
}
# 4 diagonal_secundaria(matriz) - Retorna os elementos da diagonal secundária.
diagonal_secundaria <- function(matriz){
  if (nrow(matriz) != ncol(matriz)){return(NULL)}
  soma = 0
  for (i in 1:ncol(matriz)){
    soma = soma + matriz[i, nrow(matriz) - i + 1]
  }
  return(soma)
}

# Teste todas as funções percorrendo a matriz. Mostre:

# A soma dos elementos de cada linha.
apply(M, 1, sum)

# A soma dos elementos de cada coluna.
apply(M, 2, sum)

# Os elementos da diagonal principal e secundária.
principal <- c()
secundaria <- c()
for (i in 1:ncol(M)){
  principal <- c(principal, M[i, i])
  secundaria <- c(secundaria, M[nrow(M) - i + 1, i])
}
diagonais <- list(principal, secundaria)
diagonais




# Questao 5
# Implemente um programa para determinar se uma matriz é simétrica. Para isso:
# Crie a função verificar_simetria(matriz) que receba uma matriz quadrada e retorne se ela é simétrica ou não.
# Preencha a matriz com valores aleatórios e verifique sua simetria.

verificar_simetria <- function(M){
  if (nrow(M) != ncol(M)){return(NULL)}
  for (i in 1:nrow(M)){
    for (j in 1:ncol(M)){
      if (M[i, j] != M[j, i]){
        return(FALSE)
      }
    }
  }
  return(TRUE)
}



# Questao 6
# Implemente um programa para calcular as seguintes operações sobre uma matriz de números inteiros ( M ) ( 5 \times 5 ):
# 
M <- matrix(runif(1:25, 1, 100), nrow = 5)

# maior_valor(matriz) - Retorna o maior valor contido na matriz.
maior_valor <- function(matriz){
  maior <- matriz[1, 1]
  for (i in 1:nrow(matriz)){
    for (j in 1:ncol(matriz)){
      if(matriz[i, j] > maior){
        maior <- matriz[i, j]
      }
    }
  }
  return(maior)
}

# menor_valor(matriz) - Retorna o menor valor contido na matriz.
menor_valor <- function(matriz){
  menor <- matriz[1, 1]
  for (i in 1:nrow(matriz)){
    for (j in 1:ncol(matriz)){
      if(matriz[i, j] < menor){
        menor <- matriz[i, j]
      }
    }
  }
  return(menor)
}

# media_geral(matriz) - Retorna a média aritmética de todos os elementos da matriz.
media_geral <- function(matriz){
  soma <- 0
  for (i in 1:nrow(matriz)){
    for (j in 1:ncol(matriz)){
      soma <- soma + matriz[i, j]
    }
  }
  media <- soma / length(matriz)
  return(media)
}
# Aplique as funções sobre a matriz e exiba os resultados.
maior_valor(M)
menor_valor(M)
media_geral(M)




# Questao 7
# Dado um vetor ( V ) contendo 100 elementos aleatórios entre 1 e 1.000:
V <- sample(1:1000, 100, replace = TRUE)

# Crie uma função par_impar(vetor) que retorne dois vetores: um contendo apenas os números pares e outro com os números ímpares
par_impar <- function(vetor){
  pares <- c()
  impares <- c()
  for (i in 1:length(vetor)){
    if (vetor[i] %% 2 == 0){
      pares <- c(pares, vetor[i])
    } else{
      impares <- c(impares, vetor[i])
    }
  }
  lista <- list(pares, impares)
  return(lista)
}

# Aplique a função sobre ( V ) e calcule a média dos elementos pares e ímpares separadamente.
lapply(par_impar(V), mean)





# Questao 8
# Dada uma matriz ( N ) ( 6 \times 6 ), implemente um programa para encontrar:
N <- matrix(runif(1:36, 1, 100), nrow = 6)

# A soma dos elementos acima da diagonal principal.
soma_acima_diagonal <- function(N){
  if (nrow(N) != ncol(N)){return(NULL)}
  soma <- 0
  for (i in 1:nrow(N)){
    for (j in 1:ncol(N)){
      if (j > i){
        soma <- soma + N[i, j]
      }
    }
  }
  return(soma)
}
# A soma dos elementos abaixo da diagonal principal.
soma_abaixo_diagonal <- function(N){
  if (nrow(N) != ncol(N)){return(NULL)}
  soma <- 0
  for (i in 1:nrow(N)){
    for (j in 1:ncol(N)){
      if (i > j){
        soma <- soma + N[i, j]
      }
    }
  }
  return(soma)
}

# Implemente as funções soma_acima_diagonal(matriz) e soma_abaixo_diagonal(matriz) e aplique sobre ( N ).
soma_acima_diagonal(N)
soma_abaixo_diagonal(N)


# Questao 9
# 1 Crie uma função que calcula o fatorial de um número ( n ).
fatorial <- function(n){
  if (n < 0){return(NULL)}
  result <- 1
  for (i in n:1){
    result <- result * i
  }
  return(result)
}

# 2 Crie uma função que dado um número, retorna o número primo mais próximo.
primo_mais_proximo <- function(n){
  if (is_prime(n) == TRUE){
    return(n)
  }
  found <- is_prime(n)
  count_iteration <- 1
  while(found  == FALSE){
    if (is_prime(n + count_iteration) == TRUE){
      found <- is_prime(n + count_iteration)
      return(n + count_iteration)
    } else if (((n - count_iteration) >= 1) & is_prime(n - count_iteration) == TRUE){
      found <- is_prime(n - count_iteration)
      return(n - count_iteration)
    }
    count_iteration <- count_iteration + 1
  }
}

# 3 Crie uma função que dado um número, retorna o número quadrado perfeito mais próximo.
quadrado_perfeito_mais_proximo <- function(n){
  if(n < 0){return(1)}
  valor <- (round(sqrt(n), 0))^2
  return(valor)
}

# 4 Crie uma função que dado um número, retorna o resto da divisão por 3.
resto_div_3 <- function(n){
  valor <- n %% 3
  return(valor)
}

# 5 Varra uma matriz de 20x20 com números aleatórios entre 1 e 1000 e aplique as funções criadas sobre cada elemento da matriz segundo as seguintes regras:

M <- matrix(sample(1:400), nrow = 20)

# Se o número for par e menor do que 10, aplique a função do fatorial.
# Se o número for ímpar, aplique a função do número primo mais próximo.
# Se o número for maior do que 10 e menor do que 100, aplique a função do número quadrado perfeito mais próximo.
# Se o número for maior do que 100, aplique a função do resto da divisão por 3.
# Retorne 0 caso contrário.


matriz20X20 <- function(M){
  for (i in 1:nrow(M)){
    for (j in 1:ncol(M)){
      result <- c(0)
      if((M[i, j] %% 2 == 0) & M[i, j] < 10){
        M[i, j] <- fatorial(M[i, j])
      }
      if((M[i, j] %% 2 != 0)){
        M[i, j] <- primo_mais_proximo(M[i, j])
      }
      if (M[i, j] > 10 & M[i, j] < 100){
        M[i, j] <- quadrado_perfeito_mais_proximo(M[i, j])
      }
      if (M[i, j] > 100){
        M[i, j] <- resto_div_3(M[i, j])
      }
      return(M)
    }
  }
}