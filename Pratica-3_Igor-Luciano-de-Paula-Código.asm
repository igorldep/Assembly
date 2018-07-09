.data 
	
	Array: .space 32			#Declaração do vetor de 32 posições
	msg:   .ascii "Valor de retorno: "	#Texto para mensagem de saída

.text 
main:	addi $a0, $zero, 31			#valor de x a ser passado como parametro
	addi $a1, $zero, 34			#valor de y a ser passado como parametro
	jal g					#chamada da função g
	jal i_str				#imprime String
	jal i_saida				#imprime saída do programa
	j fim					#finaliza programas
	
i_str:	li  $v0, 4				#serviço 4: imprime string
	la  $a0 msg
	syscall					#chamada do sistema
	jr $ra

i_saida:li  $v0, 1				#serviço 1: imprime um integer
	move $a0, $t6			
	syscall
	jr $ra

fim:	li $v0, 10				#serviço 10: Finaliza programa
	syscall
	
	
g:	add $t1, $zero, $a0			#t1: i; i = x

	addi $s0, $zero, 1			#Atribuição dos valores do vetor
	addi $s1, $zero, 2
	addi $s2, $zero, 3
	addi $s3, $zero, 4
	addi $s4, $zero, 32
	addi $s5, $zero, 43
	addi $s6, $zero, 12
	addi $s7, $zero, 98
	
	#index = $t0
	add $t0, $zero, $zero			#Valor base para Array
	
	sw $s0, Array($t0)			#Salva s0 na posição zero do vetor
	    addi $t0, $t0, 4			#Adicionar + 4, para salvar o próximo valor no vetor
	sw $s1, Array($t0)			#Valor do endereço de memória = Array + 4
	    addi $t0, $t0, 4
	sw $s2, Array($t0)
	    addi $t0, $t0, 4
	sw $s3 Array($t0)
	    addi $t0, $t0, 4
	sw $s4 Array($t0)
	    addi $t0, $t0, 4
	sw $s5 Array($t0)
	    addi $t0, $t0, 4
	sw $s6, Array($t0)
	    addi $t0, $t0, 4
	sw $s7, Array($t0)
	
	
for:	slt $t2, $t1, $a1			#$t2 = 1, se i < y
	beq $t2, $zero, exitfor			#se i >= y, desvia para exitfor
	add $t3, $t1, $a1			#$t3 = i + y
	add $t4, $t1, $t1			#$t4 = 2i
	add $t4, $t4, $t4			#$t4 = 4i
	sw  $t3, Array($t4)			#Array[i] = i + y
	addi $t1, $t1, 1			#i++
	j for					#volta para o Loop
	
	
exitfor:subi $t5, $t4, 4			#$t5 = i - 1
	lw  $t6, Array($t5)			#$t6 = Array[i-1]
	add $v0, $zero, $t6			#retorna Array[i-1]
	jr $ra					#retorna para função de chamada
	
	
	
	
	
	
	
	
	
	
	
