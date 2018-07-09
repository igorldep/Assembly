.text
Main:	addi $s0, $zero, 2344		#Atribuição do valor (2344) à variável $s0
 	addi $t0, $zero, 80		#Atribuição do valor (80) à variável $t0, para uso no condicional
	addi $t1, $zero, 4		#Atribuição do valor (4) à variável $t1, para uso na divisão
	addi $t2, $zero, 1		#Atribuição do valor (1) à variável $t2, para uso no teste do loop While
	
While:  slt  $t3, $t0, $s0		#Se $t0(80) < $s0(variável), -> $t3 = 1 
	bne  $t3, $zero, More		#Se $t3 = 1, o fluxo vai para o More, indicando que a variável é maior que 80
	div  $s0, $s0, $t1		#Caso o fluxo não vá para More, o número é divido por 4
	j Main2				#Vai para a Continuação da função Main(Main2), para evitar que a função more 
	
More:	subi $s0, $s0, 2		#Subrai a variável por 2, caso a mesma seja maior que 80

Main2:	beq $s0, $t2, Exit		#Continuação da função Main, caso $s0 seja igual a $t2(1), A função vai para Exit
	j While				#Caso não vá para Exit, a função volta no Loop(While)

Exit:	li $v0, 10			#Fim do programa
	syscall 