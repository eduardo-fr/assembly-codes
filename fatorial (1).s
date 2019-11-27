	#li carrega imediatamente o valor 4 (impressão de string) para chamada no sistema
main:	li $v0, 4 
	#la passa para $a0 o endereço de memória onde está armazenado a string 'mensagem'
	la $a0, mensagem
	#Chamada de sistema
	syscall

	#li carrega imediatamente o valor 5 (leitura de inteiro) para chamada no sistema
	li $v0, 5 
	syscall
	
	#Grava na memória onde está a variável 'n' o valor contido em $v0
	sw $v0, n

	#inicia o registrador $s0 com o valor contido em $v0
	addi $s0, $v0, 0

	#inicia o registrador $s0 com o valor 1.
	addi $s1,$zero,1

	#Estrutura For
	
	#Pergunta se o valor em $s0 é maior que zero. Se sim, grava em $t0 o valor 1(verdadeiro), se não, grava o valor 0(falso0.
For: 	sgt $t0,$s0,$zero
	#Compara o valor adquirido anteriormente. Se for zero, pula direto para o fim do For.
	beq  $t0,$zero,Fim_For 	
	
	#Faz a multiplicação do fatorial: $s1 = $s1*$s0
	mul $s1,$s1,$s0
	
	#$s0--
	sub $s0,$s0,1
	#Jump para o For	
	j For

	#li carrega imediatamente o valor 4 (impressão de string) para chamada no sistema
Fim_For:li $v0, 4 
	#la passa para $a0 o endereço de memória onde está armazenado a string 'fatorial'
	la $a0, fatorial
	syscall
	
	#li carrega imediatamente o valor 1 (impressão de inteiro) para chamada no sistema
	li $v0, 1
	#la passa para $a0 o valor armazenado em $s1
	move $a0, $s1
	
	syscall
	#fim de código
	jr $ra
