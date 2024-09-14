---
title: "CE302 - Aula 1.1"
author: "victorpietchaki"
date: "2024-09-12"
output: html_document
---

# CE302 - Elementos de ProgramaC'ao para Estatistica {#-sec-01}

> Universidade Federal do Parana - 2024/2![](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Logo_oficial_da_UFPR_%28sem_fundo%29.png/1200px-Logo_oficial_da_UFPR_%28sem_fundo%29.png) Pra. Deysi Departamento de Estatistica e Informatica

## Aula 1 (11/09/2024)

### FormataC'ao em Markdown

Esta C) a primeira linha.

Uma linha nova na proxima linha.

### Formatando o meu texto

Se eu quero escrever algo em negrito deve-se ser usado **negrito** ou **negrito**. Para algo em italico usar *italico* ou *italico*.

> Esta é uma citaçao
> de duas linhas

### Criando listas

Para criar listas usa-se '-' ou '+'

-   item 1.1

-   item 2.1

-   item 3.1

-   item 1.2

-   item 2.2

-   item 3.2

Segue exemplo de uma lista nao ordenada

##### Receita de Bolo do Joaquim

-   Farinha
-   Leite
-   Manteiga
-   Ovos
-   AC'ucar
-   Chocolate em po
-   Fermento natural

### Criando Listas **Ordenadas** Para se criar listas ordenadas, basta inserir o numero seguido de um ponto final.

1.  Item 1
2.  Item 2
3.  Item 3

### Criando Listas **Aninhadas** Para se criar listas aninhadas, deve-se prosseguir dessa forma:

-   Item 1
-   Item 1.1
-   Item 1.2
-   Item 2.1
-   Item 2.2
-   Item 2.3
-   etc.

### Escrevendo e Referenciando Links

[joaovictorpiet/LinkedIn](https://www.linkedin.com/in/joaovictorpiet)

### Inserindo Imagens

Para se inserir imagens, segue-se o mesmo passo para inserir qualquer outro link, entretanto, inicia-se com um ponto de exclamaC'ao!

> #### Exemplo de inserC'ao de imagem

> ![UFPR](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Logo_oficial_da_UFPR_%28sem_fundo%29.png/1200px-Logo_oficial_da_UFPR_%28sem_fundo%29.png)

> > Esta C) a inserC'ao da logo da UFPR atravC)s da sua url disponivel na web.

### Referencias Cruzadas As referC*ncias cruzadas permitem que vocC* crie *links* para seC'C5es especC-ficas dentro do seu documento Markdown. Isso C) especialmente C:til para documentos extensos, onde vocC* deseja facilitar a navegaC'C#o do leitor. Para criar uma referC*ncia cruzada precisamos atribuir um identificador C:nico a um tC-tulo usando a sintaxe `{#identificador}` e, em seguida, criar o link utilizando o mesmo identificador precedido de `#`.

> #### Exemplo de referencia cruzada:

> Para retornar ao inicio deste documento, [clique aqui](#-sec-01) ou retorno clicando em @sec-01

### Criando Tabelas

> Exemplo 1

| Nome  | Idade | ProfissC#o     |
|-------|-------|---------------|
| JoC#o  | 30    | EstatC-stico   |
| Maria | 28    | Designer      |
| Pedro | 35    | Desenvolvedor |

### Escrevendo Blocos de Codigo

Para exibir blocos de cC3digo, utilizamos trC*s acentos graves (```` ``` ````) seguidos do nome da linguagem de programaC'C#o. Isso destacarC! a sintaxe de acordo com a linguagem escolhida.

Quando estamos utilizando Quarto, portanto, um arquivo `.qmd` o cC3digo incluC-do dentro do bloco delimitado serC! executado de acordo com a linguagem definida. Isto C), se o cC3digo dentro do bloco C) um cC3digo em R, serC! executado como em R, se C) um cC3digo em Python, serC! executado em Python, se C) um cC3digo em Mermaid, serC! executado em Mermaid, e assim por diante.

```{markdown}
Escrever o codigo em markdown para relatorio, documentaC'oes ou anotaC'oes
```

```{python}
1 + 1
```

### Criando Linhas Horizontais

Basta escrever '---' entre as linha superior e inferior.

> Texto acima da linha horizontal.

> ------------------------------------------------------------------------

> Texto abaixo da linha horizontal. \### Escrevendo Formulas Matematicas Se vocC* precisa escrever fC3rmulas matemC!ticas, C) possC-vel utilizar a notaC'C#o LaTeX dentro de um par de cifrC5es (`$$`). Isso permitirC! que o Markdown renderize a fC3rmula corretamente. A equaC'C#o quadrC!tica C) definida como $$ax^2 + bx + c = 0.$$

Para se utilizar formulas matematicas dentro de textos basta escrever um '\$' em cada lado da formula: \> A equaC'C#o quadrC!tica C) definida como $ax^2 + bx + c = 0.$

### OrganizaC'ao de Diretorios

``` {markdown}

my_project/
|-- data/
|   |-- raw/
|   |-- clean/
|-- code/
|-- results/

```

### Links Interessantes sobre (R)Markdown <br>

- [Melhore o seu `R.md`](https://holtzy.github.io/Pimp-my-rmd/) <br>

# FIM