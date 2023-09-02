.data
palavra1: .word 13   # decimal | words reservam um segmento de memória 
palavra2: .word 0x15 # hexadecimal
palavra3: .ascii "Inatel" # string

nome: .asciiz "Jonas" # adiciona espaco ao final da palavra
escola: .asciiz "Inatel"

idade: .byte 0x20 # alocando memoria de forma otimizada
matricula: .byte 0x50 # desta forma colocamos idade e matricula no mesmo segmeno de memoria

num: .byte 0x10 
num2: .half 0x6070 # ocupa mais memoria

# A declaracao deve ser feita do byte, half e word, desta forma teremo um maior aproveitamento da memoria