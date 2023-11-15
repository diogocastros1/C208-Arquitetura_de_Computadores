# C208-Arquitetura_de_Computadores
Dedicado aos exercícios e anotações de arquitetura de computadores.

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