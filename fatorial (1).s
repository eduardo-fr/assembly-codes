	.data


mensagem: .asciiz "Digite um numero: \n"
fatorial: .asciiz "Fatorial: "
n:	  .word 1


	.text

main:	li $v0, 4 
	la $a0, mensagem
	
	syscall
	
	li $v0, 5 
	
	syscall
	
	
	sw $v0, n

	addi $s0, $v0, 0

	addi $s1,$zero,1

For: 	sgt $t0,$s0,$zero
	beq  $t0,$zero,Fim_For 	
	
	mul $s1,$s1,$s0

	sub $s0,$s0,1	
	j For

Fim_For:li $v0, 4 
	
	la $a0, fatorial
	syscall
	
	li $v0, 1
	move $a0, $s1
	
	syscall
	jr $ra