main:
    mov sp, #256                /* assumes RAM of 64 words */
    mov r0, #10
    bl fib_rec_a

end_main:
    b end_main

fib_rec_a:
    sub sp, sp, #16             /* allocate stack memory */
    str lr, [sp]
    cmp r0, #0
    beq done
    cmp r0, #1
    beq done
    add sp, sp, #4
    str r0, [sp]
    sub sp, sp, #4
    sub r0, r0, #1              /* n - 1 */
    bl fib_rec_a                /* fib(n - 1) */
    add sp, sp, #8
    str r0, [sp]
    sub sp, sp, #8
    add sp, sp, #4
    ldr r0, [sp]
    sub sp, sp, #4
    sub r0, r0, #2              /* n - 2 */
    bl fib_rec_a                /* fib(n - 2) */
    add sp, sp, #8
    ldr r1, [sp]
    sub sp, sp, #8
    add r0, r0, r1              /* fib(n - 1) + fib(n - 2) */

done:
    ldr lr, [sp]
    add sp, sp, #16             /* deallocate stack memory */
    bx lr
