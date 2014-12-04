#Brandon Banks
#if (theNumber is divisible by 3) then	--->
#    if (theNumber is divisible by 5) then
#      print "FizzBuzz"
#    else			  <---
#      print "Fizz"
#  else if (theNumber is divisible by 5) then
#      print "Buzz"
#  else /* theNumber is not divisible by 3 or 5 */
#      print theNumber
#  end if

.data
fizzbuzz: .asciiz "FizzBuzz\n"
fizz: .asciiz "Fizz\n"
buzz: .asciiz "Buzz\n"
space: .asciiz "\n"
.text
li $t1, 1
while: 		bgt $t1, 100, done			#when i > 100 exit loop
body:
ifmod3:   	rem $t2, $t1, 3			    # i%3
        	bnez $t2, ifmod5		    # i%3=/=0 skip then mod 3

ifboth:		rem $t2, $t1, 5			    # i%5
        	bnez $t2, thenmod3		  	# i%5=/=0 skip then mod 5
		
thenboth:	li $v0, 4           		# to print a string
		    la $a0, fizzbuzz     		# put address of null-terminted string in $a0
		    syscall                 	# print the string
		    j endwhile
		
thenmod3:	li $v0, 4           		# to print a string
		    la $a0, fizz     		    # put address of null-terminted string in $a0
		    syscall             		# print the string
		    j endwhile	

ifmod5:		rem $t2, $t1, 5			    # i%5
		    bnez $t2, thennone		  	# i%5=/=0 skip then mod 5
		
thenmod5:	li $v0, 4           		# to print a string
		    la $a0, buzz     		    # put address of null-terminted string in $a0
		    syscall             		# print the string
		    j endwhile
		
thennone:	li $v0, 1         		  	# to print an integer
		    move $a0, $t1       		# copy the output integer to $a0
		    syscall             		# print the integer
		    li $v0, 4           		# to print a string
		    la $a0, space     		  	# put address of null-terminted string in $a0
		    syscall             		# print the string

endwhile:	add $t1, $t1, 1			    # i++
		    j while						# go back to test loop condition
done:		li $v0, 10          		# to end program execution
		    syscall             		# end program execution
