ORG 0000h
	ljmp RST_ISR
ORG 0030h
	main_pro:
	
	lcall begin
	
	lcall hour1
	
	lcall begin
	
	lcall hour2
	
	lcall begin
	
	lcall hour3
	
	lcall begin
	
	lcall hour4
	
	lcall begin
	
	lcall hour5
	lcall begin
	
	lcall hour6
	lcall begin
	
	lcall hour7
	lcall begin
	
	lcall hour8
	lcall begin
	
	lcall hour9
	lcall begin
	
	lcall hour10
	lcall begin
	
	lcall hour11
	lcall begin
	
	lcall hour12
	lcall begin
	
	lcall hour13
	lcall begin
	
	lcall hour14
	lcall begin
	
	lcall hour15
	lcall begin
	
	lcall hour16
	lcall begin
	
	
	lcall hour17
	lcall begin
	
	lcall hour18
	lcall begin
	
	lcall hour19
	lcall begin
	
	
	lcall hour20
	lcall begin
	
	lcall hour21
	lcall begin
	
	lcall hour22
	lcall begin
	
	lcall hour23
	lcall begin
	
	
	lcall hour24
	
	ljmp main_pro
	

	
	RST_ISR:
	mov A, #00h
	mov P0, A
	mov P2, A
	mov P3, A
	ljmp main_pro
	
	begin:
	mov R7, #00h
	mov R3,#60
	mov R2, #10
	
	dem_phut:
	mov R0, #6
	lcall sec
	
	;-- lap 59 lan tuong duong 59 phut
	;-- qua duoc 59 phut => nhay hoac call qua hour
	djnz R3, dem_phut
	mov P2, #00h
	mov P3, #00h
	lcall delay
	ret
	
	delay:
	; su dung timer 0 che do 1
	mov R6, #005h
	loop5:
	mov R5, #0C8h
	loop4:
	mov TMOD, #10h
	mov TH1, #0FCh
	mov TL1, #018h
	setb TR1
	loop_1ms:
	jnb TF1, loop_1ms
	clr TF1
	clr TR1
	djnz R5, loop4
	djnz R6, loop5
	ret
	

	sec:
	;hien thi tu 0 den 9 x 5 lan
	mov R1 ,#10
	
	loop:
	mov 0A0h, A
	add A, #010h
	lcall delay
	djnz R1, loop
	anl A, #00Fh
	add A, #001h
	
	djnz R0, sec
	
	djnz R2, min
	count_min:
	lcall muoi_min
	mov R2, #10
	
	ret
	;mov R, #10
	;;djnz R, muoi
	;count_min:
	;lcall muoi
	
	min:
	;--dem phut tu 0 den 9 
	
	mov A, R7
	add A, #010h
	mov 0A0h, #00h
	mov 0B0h, A
	mov R7, A
	clr A
	
	ret
	muoi_min:
	mov A, R7
	anl A, #00Fh
	add A, #001h
	mov R7,A
	lcall delay
	clr A
	ljmp min
	
	hour1:
	mov 80h, #010h
	lcall delay
	ret 
	
	hour2:
	mov 80h, #020h
	lcall delay
	ret
	
	hour3:
	mov 80h, #030h
	lcall delay
	ret
	hour4:
	mov 80h, #040h
	lcall delay
	ret
	hour5:
	mov 80h, #050h
	lcall delay
	ret
	hour6:
	mov 80h, #060h
	lcall delay
	ret
	hour7:
	mov 80h, #070h
	lcall delay
	ret
	hour8:
	mov 80h, #080h
	lcall delay
	ret
	hour9:
	mov 80h, #090h
	lcall delay
	ret
	
	hour10:
	mov 80h, #001h
	lcall delay
	ret
	
	hour11:
	mov 80h, #011h
	lcall delay
	ret
	hour12:
	mov 80h, #021h
	lcall delay
	ret
	
	hour13:
	mov 80h, #031h
	lcall delay
	ret
	
	hour14:
	mov 80h, #041h
	lcall delay
	ret
	
	hour15:
	mov 80h, #051h
	lcall delay
	ret
	
	hour16:
	mov 80h, #061h
	lcall delay
	ret
	
	hour17:
	mov 80h, #071h
	lcall delay
	ret
	
	hour18:
	mov 80h, #081h
	lcall delay
	ret
	
	hour19:
	mov 80h, #091h
	lcall delay
	ret
	
	hour20:
	mov 80h, #002h
	lcall delay
	ret
	hour21:
	mov 80h, #012h
	lcall delay
	ret
	hour22:
	mov 80h, #022h
	lcall delay
	ret
	hour23:
	mov 80h, #032h
	lcall delay
	ret
	hour24:
	mov 80h, #000h
	lcall delay
	ret


END
	