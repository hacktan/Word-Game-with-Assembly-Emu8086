
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

org 100h
mov al,00h
mov ah,0
int 10h
 
mov dh, 0;satýr konumu
mov dl, 0;sutun konumu
mov ah,2
int 10h

mov cx,25 ;;üst kenar yazdýrýlýyor
ustkenar:
mov bl,0f4h
mov ah,2
mov dl,205
int 21h
loop ustkenar

mov dh, 5;satýr konumu
mov dl, 0;sutun konumu
mov ah,2
int 10h

mov cx,25 ;;üst kenar yazdýrýlýyor
ustkenar2:
mov bl,0f4h
mov ah,2
mov dl,205
int 21h
loop ustkenar2

mov dh, 10;satýr konumu
mov dl, 0;sutun konumu
mov ah,2
int 10h

mov cx,25 ;;üst kenar yazdýrýlýyor
ustkenar3:
mov bl,0f4h
mov ah,2
mov dl,205
int 21h
loop ustkenar3

mov dh, 0;satýr konumu
mov dl, 0;sutun konumu
mov ah,2
int 10h

mov cx,10 ;;üst kenar yazdýrýlýyor
ustkenar4:
mov bl,0f4h
mov ah,2
mov dl,205
int 21h
loop ustkenar4

;;dikey cizgiler


mov cl,10
Kenarlik1:

mov dh,cl
mov dl,0
mov bh,0
mov ah,2
int 10h

mov ah,2
mov dl,186
int 21h
loop Kenarlik1

mov cl,10
Kenarlik2:

mov dh,cl
mov dl,5
mov bh,0
mov ah,2
int 10h

mov ah,2
mov dl,186
int 21h
loop Kenarlik2

mov cl,10
Kenarlik3:

mov dh,cl
mov dl,10
mov bh,0
mov ah,2
int 10h

mov ah,2
mov dl,186
int 21h
loop Kenarlik3

mov cl,10
Kenarlik4:

mov dh,cl
mov dl,15
mov bh,0
mov ah,2
int 10h

mov ah,2
mov dl,186
int 21h
loop Kenarlik4

mov cl,10
Kenarlik5:

mov dh,cl
mov dl,20
mov bh,0
mov ah,2
int 10h

mov ah,2
mov dl,186
int 21h
loop Kenarlik5

mov cl,10
Kenarlik6:

mov dh,cl
mov dl,25
mov bh,0
mov ah,2
int 10h

mov ah,2
mov dl,186
int 21h
loop Kenarlik6



mov dh, 3;;sutun
mov dl, 3;satir
mov ah,2
int 10h

mov ah,2
mov dl,'B'
int 21h

mov dh, 3;;sutun
mov dl, 8;satir
mov ah,2
int 10h

mov ah,2
mov dl,'M'
int 21h

mov dh, 3;;sutun
mov dl, 13;satir
mov ah,2
int 10h

mov ah,2
mov dl,'A'
int 21h

mov dh, 3;;sutun
mov dl, 18;satir
mov ah,2
int 10h

mov ah,2
mov dl,'R'
int 21h

mov dh, 3;;sutun
mov dl, 23;satir
mov ah,2
int 10h

mov ah,2
mov dl,'H'
int 21h

mov dh, 8;;sutun
mov dl, 3;satir
mov ah,2
int 10h

mov ah,2
mov dl,'A'
int 21h

mov dh, 8;;sutun
mov dl, 8;satir
mov ah,2
int 10h

mov ah,2
mov dl,'E'
int 21h

mov dh, 8;;sutun
mov dl, 13;satir
mov ah,2
int 10h

mov ah,2
mov dl,'L'
int 21h

mov dh, 8;;sutun
mov dl, 18;satir
mov ah,2
int 10h

mov ah,2
mov dl,'A'
int 21h

mov dh, 8;;sutun
mov dl, 23;satir
mov ah,2
int 10h

mov ah,2
mov dl,'R'
int 21h



mouseKontrol: ;;mouse un x ve y konumu tutuluyor anlýk olarak
mov ax, 3
int 33h
cmp bx,1;;sol click kontrol ediliyor
jne mouseKontrol
je kontrolXB

kontrolXB:
cmp cx,28
jb kontrolYB
ja mouseKontrol

kontrolYB:
cmp dx,2ch
jb flag
jae mouseKontrol

flag:
hlt