# C208 A - L4 | Arquitetura de Computadores
Dedicado aos exercícios e anotações de arquitetura de computadores.

---
## Arquitetura e organização

Etapas do processo de desenvolvimento:

**1. Prog. Fonte**
**2. Montador**
3. Prog. Objeto
4. Link-Edição (Ligação)

## Resumo do assembly MIPS

### Tipos de instruções
| | | | | | | Tipo |
|:------:|:-----:|:-----:|:-----:|:-----:|:-----:|--------:|
| OP | rs | rt | rd | sa | funct | R |
| OP | rs | rt | ///// | ///// | ////// | I |
| OP | ///// | ///// | ///// | ///// | ////// | J |
| 31~26 | 25~21 | 20~16 | 15~11 | 10~6 | 5-0 | |

/ -> 1 bit, // -> 2 bits, ...

![Referência](/assets/images/img2.png)

#### Tipo R
Campos:
- op → código da operação (opcode)
- rs → endereço do primeiro registrador de origem
- rt → endereço do segundo registrador de origem
- rd → endereço do registrador destino
- shamt → quantidade de bits a ser deslocado 
- funct → função específica a ser realizada

| OP | rs | rt | rd | sa | funct |
|:------:|:-----:|:-----:|:-----:|:-----:|:------:|
| 000000 | 01001 | 01000 | 01010 | 00000 | 100000 |
| 0x0 | 9 | 8 | 10 | shamt | 0x20 |

#### Tipo I
Campos:
- op → código da operação (opcode)
- rs → número do registrador base a ser operado com o valor constante
- rt → número do registrador de destino ou operando
- constante → –2^15 a +2^15–1
- endereço → –2^15 a +2^15–1

Neste exemplo estamos utilizando uma constante.

| OP | rs | rt | constante ou endereço |
|:------:|:-----:|:-----:|:-----:|
| 000000 | 01001 | 01000 | 00000 00001 100100 |
| 0x0 | 9 | 8 | 100 |

#### Tipo J
Campos:
- op → código da operação (opcode)
- endereço → endereço destino

Neste exemplo
| OP | rs | rt | constante ou endereço |
|:------:|:-----:|:-----:|:-----:|
| 000010 | 00000 00000 00000 00011 110101 |
| 0x2 | 9 | 8 | 245 |

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

Exemplo de código com beg (branch if greatar or equal):
~~~assembly
.text
  li $t1, 8
  li $t2, 5

  # if ($t1 > 10): maior, else: $t2 - 1
  bge $t1, 10, maior 
  addi $t2, $t2, -1
  j exit # pula para exit e nao entra no maior

  maior: 
    addi $t2, $t2, 1
  exit: 
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
### ADDIU
|      |        |
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

