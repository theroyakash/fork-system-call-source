	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15, 6	sdk_version 10, 15, 6
	.globl	_getDetailsIfOperationIsForked ## -- Begin function getDetailsIfOperationIsForked
	.p2align	4, 0x90
_getDetailsIfOperationIsForked:         ## @getDetailsIfOperationIsForked
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	callq	_fork
	cmpl	$0, %eax
	jne	LBB0_2
## %bb.1:
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -8(%rbp)          ## 4-byte Spill
	callq	_getpid
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	callq	_getppid
	leaq	L_.str.1(%rip), %rdi
	movl	-12(%rbp), %esi         ## 4-byte Reload
	movl	%eax, %edx
	movb	$0, %al
	callq	_printf
	leaq	L_.str.2(%rip), %rdi
	movl	%eax, -16(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.3(%rip), %rdi
	leaq	-4(%rbp), %rsi
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	movl	-4(%rbp), %esi
	leaq	L_.str.4(%rip), %rdi
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	jmp	LBB0_3
LBB0_2:
	leaq	L_.str.5(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	callq	_getpid
	leaq	L_.str.6(%rip), %rdi
	movl	%eax, %esi
	movb	$0, %al
	callq	_printf
	leaq	L_.str.7(%rip), %rdi
	movl	%eax, -32(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
LBB0_3:
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	callq	_getDetailsIfOperationIsForked
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"\n******* CHILD PROCESS *******\n"

L_.str.1:                               ## @.str.1
	.asciz	"This Process ID is %d and Parent ID is %d"

L_.str.2:                               ## @.str.2
	.asciz	"Parent task waits until your child is terminated.\nTo terminate the child task enter a number:\n"

L_.str.3:                               ## @.str.3
	.asciz	"%d"

L_.str.4:                               ## @.str.4
	.asciz	"You gave me a number which is %d\n Your child process is now terminated, now its time for the parent process\n\n"

L_.str.5:                               ## @.str.5
	.asciz	"\n******* PARENT PROCESS *******\n"

L_.str.6:                               ## @.str.6
	.asciz	"This Process ID %d"

L_.str.7:                               ## @.str.7
	.asciz	"Parent process is now terminated thank you.\n\n"

.subsections_via_symbols
