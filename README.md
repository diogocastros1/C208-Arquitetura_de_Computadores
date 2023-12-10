# C208 A - L4 | Arquitetura de Computadores
Dedicado aos exercícios e anotações de arquitetura de computadores.

---
## Resumo do assembly MIPS

Para receber um numero inteiro do usuario, efetuar uma soma com um numero inteiro e printar o resultado no final, podemos utilizar a estrutura abaixo:
~~~assembly 
# 1º criar variavel e frase para user
.data 
  A: .word 0 # variavel A com valor = 0
  frase_A: .asciiz "Alguma frase aqui: "

# 2º utilizar a variavel e entrar com alguma info
.text
  # print da frase
  li $v0, 4 # print de uma string
  la $a0, frase_A # atribuindo a frase para $a0
  syscall # executando a instrução de $v0

  # entrada de dados
  li $v0, 5 # leitura de int
  syscall
  sw $v0, A # salvando a leitura em A

  # somando o valor de A com 5 e salvando em A novamente
  lw $t0, A # atribuindo o valor de A para $t0
  addi $t0, $t0, 5 # somando 5 com o valor de $t0 e salvando em $t0 novamente
  sw $t0, A # salvando o valor de $t0 em A novamente
  
  # printando o novo valor de A
  li $v0, 1 # print int
  lw $a0, A # atribuindo o valor de A para $a0
  syscall
~~~

---

## Etapas do processador
1. Busca (Fetch)
2. Decodificação
3. Acesso aos registradores
4. Execução
5. Memória
6. Write Back

---

|ADDIU      |        |
|:---------:|:------:|
|REG_DEST   | 1      |
|ALU_SRC    | 1      |
|ALU_OP     | 0x0010 |
|STORE      | 0      |
|LOAD       | 0      |
|MEM_TO_REG | 0      |


---

## Estágios de execução de uma instrução
1. Busca
2. Acesso aos registradores (Endereçamento)
3. Execução da instrução (ULA)
4. Acesso à mem. (Load ou Store)
5. Write Back (Gravação no registrador destino)

![Etapas da excução](/assets/images/img1.jpeg)

>Exercicio de Exemplo
>Como ficaria no pipeline a seguinte sequência de instruções: 
>1. lw $t0, 8($t1)
>2. add $a0, $t0,$t5
>3. sw $a0,12($t0)
>4. beq $t0,$a0, Label
> 

|         |2ns      |2ns      |2ns      |2ns      |2ns      |2ns      |2ns      |
|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|
|LW       |Busca    |///REG   |ULA      |MEM      |///REG   |         |         |
|ADD      |         |Busca    |///REG   |ULA      |REG///   |         |         |
|SW       |         |         |Busca    |REG      |ULA      |MEM      |         |
|BEQ      |         |         |         |Busca    |//////   |///REG   |ULA      |

- Sem pipeline = LW(8ns)+ADD(6ns)+SW(7ns)+BEQ(5ns) = 26ns
- Com pipeline = 14ns
---
>Exemplo 2:
>1. li $s0, 0x61
>2. li $s7, 0x1001000C
>3. sb $s0, 0($s7)
>4. add $t2, $0, $s7
>5. sub $t3, $0, $s7

|         |2ns      |2ns      |2ns      |2ns      |2ns      |2ns      |2ns      |2ns      |
|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|:-------:|
|LI       |Busca    |///REG   |ULA      |MEM      |///REG   |         |         |         |
|LI       |         |Busca    |///REG   |ULA      |MEM      |///REG   |         |         |
|SB       |         |         |Busca    |///REG   |ULA      |MEM      |         |         |
|ADD      |         |         |         |Busca    |REG///   |ULA      |REG      |         |
|SUB      |         |         |         |         |Busca    |REG///   |ULA      |REG      |

