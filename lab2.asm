.data
  str1: .asciiz "What is the first input?\n"
  str2: .asciiz "What is the second input?\n"
  str_sub: .asciiz " - "
  str_eq: .asciiz " = "

  # Variables to store input and result
  a:    .word 0
  b:    .word 0
  c:    .word 0

.text
.globl main
main:
  # Ask for the first input
  la a0, str1   # Load address of string 1 into a0
  li v0, 4      # Syscall to print string
  syscall

  # Get the first input
  li v0, 5      # Syscall to read integer
  syscall
  sw v0, a      # Store the input in variable a

  # Ask for the second input
  la a0, str2   # Load address of string 2 into a0
  li v0, 4      # Syscall to print string
  syscall

  # Get the second input
  li v0, 5      # Syscall to read integer
  syscall
  sw v0, b      # Store the input in variable b

  # Calculate c = a - b
  lw t0, a      # Load a into t0
  lw t1, b      # Load b into t1
  sub t2, t0, t1   # Perform the subtraction: t2 = t0 - t1
  sw t2, c      # Store the result in c

  # Print a
  lw a0, a      # Load a into a0 for printing
  li v0, 1      # Syscall to print integer
  syscall

  # Print " - "
  la a0, str_sub   # Load address of " - " into a0
  li v0, 4         # Syscall to print string
  syscall

  # Print b
  lw a0, b      # Load b into a0 for printing
  li v0, 1      # Syscall to print integer
  syscall

  # Print " = "
  la a0, str_eq    # Load address of " = " into a0
  li v0, 4         # Syscall to print string
  syscall

  # Print c
  lw a0, c      # Load c into a0 for printing
  li v0, 1      # Syscall to print integer
  syscall

  # Newline for clean output
  li v0, 11
  li a0, '\n'
  syscall

  # Exit the program
  li v0, 10     # Syscall to exit
  syscall
