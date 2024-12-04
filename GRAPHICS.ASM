org 100h

mouseX dw 0
mouseY dw 0

start:
  mov ax, 0013h
  int 10h

  xor ax, ax
  int 33h
  cmp ax, 0
  je no_mouse

  mov ax, 1
  int 33h

main_loop:
  mov ah, 01h
  int 16h
  jz check_mouse
  mov ah, 0
  int 16h
  cmp al, 27
  je exit_program

check_mouse:
  mov ax, 3
  int 33h
  mov [mouseX], cx
  mov [mouseY], dx

  test bx, 1
  jz skip_draw

  mov ax, 0A000h
  mov es, ax
  mov di, [mouseY]
  mov ax, 320
  mul di
  add ax, [mouseX]
  mov di, ax
  mov al, 15
  stosb

skip_draw:
  jmp main_loop

exit_program:
  mov ax, 0003h
  int 10h
  mov ax, 4C00h
  int 21h

no_mouse:
  mov ax, 4C00h
  int 21h