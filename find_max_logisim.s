main:
    mov sp, #256                       /* assumes RAM of 64 words */
    sub sp, sp, #4
    mov r0, #1
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #2
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #3
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #4
    str r0, [sp]
    sub sp, sp, #4
    mov r0, #5
    str r0, [sp]    

    mov r0, sp
    mov r1, #5
    bl find_max_a

    
end_main:
    b end_main

/* int find_max_a(int *array, int n); */
find_max_a:
    sub sp, sp, #4
    str r4, [sp]
    mov r2, #0                         /* int i */
    ldr r3, [r0]                       /* r3 = max = array[0] */

loop:
    cmp r2, r1                         /* i < n */
    beq done          
    ldr r4, [r0]                       /* array[i] */
    cmp r3, r4                         /* if (array[i] > max) */
    movlt r3, r4                       /* max = array[i] */
    add r0, r0, #4
    add r2, r2, #1                     /* i++ */
    b loop

done:
    ldr r4, [sp]
    add sp, sp, #4
    mov r0, r3                         /* return max */
    bx lr
