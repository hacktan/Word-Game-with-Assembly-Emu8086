
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
mov [310h],10; týklanýlan harfin yazýldýðý sütun










mov si,51h;harfin memory'si
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
mov dl,'A'
int 21h

mov dh, 3;;sutun
mov dl, 23;satir
mov ah,2
int 10h

mov ah,2
mov dl,'A'
int 21h

mov dh, 8;;sutun
mov dl, 3;satir
mov ah,2
int 10h

mov ah,2
mov dl,'R'
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
mov dl,'H'
int 21h

mov dh, 8;;sutun
mov dl, 23;satir
mov ah,2
int 10h

mov ah,2
mov dl,'R'
int 21h




mov al, 1
	mov bh, 0
	mov bl, 0011_1011b
	mov cx, msg1end - offset msg1 ; calculate message size. 
	mov dl, 0
	mov dh, 20
	push cs
	pop es
	mov bp, offset msg1
	mov ah, 13h
	int 10h
	jmp msg1end
	msg1 db " Toplam Puan: "
	msg1end:



mov ax,0
mov dx,0
mov cx,0
mov bx,0

mouseKontrol: ;;mouse un x ve y konumu tutuluyor anlýk olarak
mov ax, 3
int 33h
cmp bx,1;;sol click kontrol ediliyor

jne klavyeKontrol
je kontrolXB



klavyeKontrol:
mov ah,01h
int 16h
jz mouseKontrol

mov ah,0 ;;stackoverflow'dan bulduðum kod, tuþa basýldýktan sonra, enter deðil ise buffer'ý sýfýrlýyor.
int 16h

cmp al,0Dh ;;enter tuþu kontrol
je kelimeGiris
jne mouseKontrol

kontrolXB:
cmp cx,29h
jb kontrolYB
ja kontrolXM

kontrolYB:
cmp dx,2ch
jb yazB
jae kontrolYB2

kontrolYB2:
cmp dx,53h
jb yazR
jae mouseKontrol




kontrolXM:
cmp cx,52h
jb kontrolYM
ja kontrolXAA

kontrolYM:
cmp dx,2ch
jb yazM
jae kontrolYM2

kontrolYM2:
cmp dx,53h
jb yazE
jae mouseKontrol




kontrolXAA:
cmp cx,079h
jb kontrolYAA
ja kontrolXAw

kontrolYAA:
cmp dx,2Ch
jb yazA2
jae kontrolYAAA

kontrolYAAA:
cmp dx,53h
jb yazLHarfi
jae mouseKontrol




kontrolXAw:
cmp cx,0A1h
jb kontrolYH
ja kontrolXAg

kontrolYH:
cmp dx,2ch
jb yazA3
jae kontrolYH2

kontrolYH2:
cmp dx,53h
jb yazH2
jae mouseKontrol


kontrolXAg:
cmp cx,0C9h
jb kontrolYAg
ja mouseKontrol

kontrolYAg:
cmp dx,2ch
jb yazA3
jae kontrolYAg2

kontrolYAg2:
cmp dx,53h
jb yazAgRR
jae mouseKontrol







yazA3:
mov [si],'A'
inc [50h]
jmp altaYaz

yazH2:
mov [si],'H'
inc [50h]
jmp altaYaz



yazA2:
mov [si],'A'
inc [50h]
jmp altaYaz





yazE:
mov [si],'E'
inc [50h]
jmp altaYaz



yazAgRR:
mov [si],'R'
inc [50h]
jmp altaYaz

yazM:
mov [si],'M'
inc [50h]
jmp altaYaz

yazR:
mov [si],'R'
inc [50h]
jmp altaYaz

yazB:
mov [si],'B'
inc [50h]
jmp altaYaz

yazLHarfi:
mov [si],'L'
inc [50h]
jmp altaYaz

altaYaz:


mov dh, 15;;satir
mov dl, [310h];sutun, bu memory adresinde tutuluyor
mov ah,2
int 10h

mov ah,0ah
mov al,[si]
inc si
mov bh,0
mov cx,1
int 10h
inc [310h]
jmp mouseKontrol


kelimeGiris:
MOV [1400h],0 ;toplam puan adresi


mov [3000h],3d
mov [3001h],'M'
mov [3002h],'A'
mov [3003h],'L'

mov [3010h],7d
mov [3011h],'M'
mov [3012h],'E'
mov [3013h],'R'
mov [3014h],'H'
mov [3015h],'A'
mov [3016h],'B'
mov [3017h],'A'


mov [3020h],6d
mov [3021h],'H'
mov [3022h],'A'
mov [3023h],'R'
mov [3024h],'A'
mov [3025h],'B'
mov [3026h],'E'

mov [3030h],5d
mov [3031h],'H'
mov [3032h],'A'
mov [3033h],'M'
mov [3034h],'A'
mov [3035h],'L'

mov [3040h],5d
mov [3041h],'A'
mov [3042h],'R'
mov [3043h],'A'
mov [3044h],'B'
mov [3045h],'A'

mov [3050h],5d
mov [3051h],'A'
mov [3052h],'L'
mov [3053h],'A'
mov [3054h],'R'
mov [3055h],'M'

mov [3060h],5d
mov [3061h],'A'
mov [3062h],'M'
mov [3063h],'B'
mov [3064h],'A'
mov [3065h],'R'

mov [3070h],4d
mov [3071h],'H'
mov [3072h],'A'
mov [3073h],'L'
mov [3074h],'A'

mov [3080h],3d
mov [3081h],'E'
mov [3082h],'L'
mov [3083h],'A'

mov [3090h],3d
mov [3091h],'B'
mov [3092h],'A'
mov [3093h],'L'


mov dx,0d
mov di,3000h
mov ax,0h

listeDongu:
mov si,50h


mov cl,[di]
karsilastir:
mov bl,[di]
cmp bl,[si]
je ayniMi
jne farkli
ayniMi:
inc si
inc di
inc al
loop karsilastir
jmp ayni
farkli:
cmp dx,10d
jb siradakiKelime
jae kelimeYok
siradakiKelime:
add dx,1d
sub si,ax
sub di,ax
mov ax,0
add di,10h
jmp listeDongu
hlt
ayni:
mov [1400h],'0'
inc [1400h]
mov dh, 20;;sutun
mov dl, 14;satir
mov ah,2
int 10h

mov ah,2
mov dl,[1400h]
int 21h
mov ax,4
jmp klavyeKontrol
hlt
kelimeYok:
jmp klavyeKontrol
hlt