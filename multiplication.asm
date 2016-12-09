.data

	#for input
	printExp1: .asciiz "Enter The First Number : "
	printExp2: .asciiz "Enter The Second Number : "
	
	#user Choice
	AddiExp:.asciiz "\nEnter 1 for Addition"
	SubExp: .asciiz "\nEnter 2 for Subtraction"
	MulExp: .asciiz "\nEnter 3 for Multiplication"
	DivExp: .asciiz "\nEnter 4 for Division"
	
	UserChoice: .asciiz "\nChoice : >>"
	
	ResultExp: .asciiz "\nResult : "

.text
.globl main

main:


#TAKING INPUT 1 HERE
	#PRINT EXP1
	la $a0, printExp1
	li $v0,4
	syscall
	
	#taking input
	li $v0,7
	syscall
	
	#moving infrom from f0 to f4
	#since we're working on double persicion
	mov.d $f4,$f0
	

#taking input 2

	#PRINT EXP2
	la $a0, printExp2
	li $v0,4
	syscall
	
	#taking input
	li $v0,7
	syscall
	
	#moving infrom from f0 to f6
	mov.d $f6,$f0
	
	#NOW ASK FROM USER WHAT HE?SHE WANTS
	
	#addition
	la $a0,AddiExp
	li $v0,4
	syscall
	
	#subtraction
	la $a0,SubExp
	li $v0,4
	syscall
	
	#multiplication
	la $a0,MulExp
	li $v0,4
	syscall
	
	#Division
	la $a0,DivExp
	li $v0,4
	syscall
	
	#ASK FOR USER CHOICE
	#choice
	la $a0,UserChoice
	li $v0,4
	Syscall
	
	#taking input from choice
	li $v0,5
	syscall
	
	#moving input from v0 to t0
	move $t0,$v0
	
	#now im setting contants for comparision
	#for eg if user input 1 for addition
	
	addi $t1,$zero,1 #for addition
	addi $t2,$zero, 2
	addi $t3,$zero, 3
	addi $t4,$zero, 4
	
	#now if user choose 1 for addition
	beq $t0,$t1, Addition
	
	#for sub
	beq $t0,$t2, Subtraction
	
	#for mul
	beq $t0,$t3, Multiplication
	
	#for div
	beq $t0,$t4, Division
	
	#program ends
	li $v0,10
	syscall
	
	#now addition
Addition:
	add.d $f4,$f4,$f6
	
	#print exp
	la $a0, ResultExp
	li $v0,4
	syscall
	
	#print sum
	mov.d $f12,$f4
	li $v0,3
	syscall
	
	#end Program
	li $v0,10
	syscall
	
Subtraction:

	sub.d $f4,$f4,$f6
	
	#print exp
	la $a0, ResultExp
	li $v0,4
	syscall
	
	#print sum
	mov.d $f12,$f4
	li $v0,3
	syscall
	
	#end Program
	li $v0,10
	syscall

Multiplication:

	mul.d $f4,$f4,$f6
	
	#print exp
	la $a0, ResultExp
	li $v0,4
	syscall
	
	#print sum
	mov.d $f12,$f4
	li $v0,3
	syscall
	
	#end Program
	li $v0,10
	syscall

Division:

	Div.d $f4,$f4,$f6
	
	#print exp
	la $a0, ResultExp
	li $v0,4
	syscall
	
	#print sum
	mov.d $f12,$f4
	li $v0,3
	syscall
	
	#end Program
	li $v0,10
	syscall