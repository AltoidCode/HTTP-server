section .data
    msg db 'Hello, World!', 0

section .bss
    sockfd resb 4

section .text
    global _start

_start:
    ; Create socket (syscall number 102)
    mov eax, 102
    xor ebx, ebx
    mov ecx, 1      ; SOCK_STREAM
    mov edx, 6      ; AF_INET
    int 0x80
    mov [sockfd], eax

    ; Bind socket to port 8080 (code omitted for brevity)

    ; Accept and send a response
    ; (code omitted for brevity)

    ; Exit (code omitted for brevity)
