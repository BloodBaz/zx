 

; CSSCGC 2007 
; Crap Games Competition 2007 Submission
; 2007 Chris Walsh
; Shave Rick's Beard
; -------------------------------
;
; Use Tabs: {16, 20, 24, step 8}




; -----------------------
; DEFINES
; -----------------------

; -----------------------
; END OF DEFINES
; -----------------------





; -----------------------
; MACROS
; -----------------------


; STEPDOWN
; Moves screen address held in HL down by one pizel 
; Uses: A
#DEFINE	STEPDOWN INC H\ LD A,H\ AND 7\ JR NZ,$+12\ LD A,L\ ADD A,32\ LD L,A\ JR C,$+6\ LD A,H\ SUB 8\ LD H,A


; -----------------------
; END OF MACROS
; -----------------------







; MEMORY MAP
;
; Address	Length	Description
; --------	------	----------------------------------------------------------------------
; 32768      	6144	Backbuffer copy of Rick's Mug
; 49152	*		Code

BitmapAddr:	.equ 32768

	
	.org 49152
	

	; INITIALISE
	
	; Draw Rick Face
	CALL LoadScreen
	
	; Reset Timer
	CALL TimerReset
	
	; Init Beard
	CALL InitBeard
	
	
	; MAIN LOOP
MainLoop1:	
	CALL ProcessBeard
	CALL KeyboardScan	
	HALT
	CALL PlotFace
	CALL PlotCursor		
	;CALL CompareScreen3Opt
	CALL TimerDec		

	JR MainLoop1
	


; LoadScreen
; Copies Face to Screen
LoadScreen:
	LD HL, BitmapAddr
	LD DE, 16384
	LD BC, 6144
	LDIR	
	RET


; FlashInv
; White on Black (Inverted)
FlashInv:
	LD A, 7+64
FlashInv0:	LD HL, 22528
	LD DE, 22529
	LD BC, 767
	LD (HL), A
	LDIR
	RRA
	RRA
	RRA
	AND 7
	OUT (254), A
	RET
	
; FlashNorm
; Black on White
FlashNorm:
	LD A, 56
	JR FlashInv0





; CompareScreen3Opt
; Optimised version of CompareScreen3.
; Only actually updates every 10th time.  Returns last score otherwise
; TODO: Make this the RIGHT section of screen
CompareScreen3Opt:
	LD A, (CompOpt)
	OR A
	JR Z, _CS1
	
	; Quick version
	DEC A
	LD (CompOpt), A
	LD BC, (LastCompValue)
	RET
	
	; Slow version
_CS1:	LD A, (CompOptMax)
	LD (CompOpt), A
	CALL CompareScreen3
	LD (LastCompValue), BC
	
	
	; Convert to a percentage
	; BC/(192*8) * 100
	
	
	
	
	
	RET
	

; CompareScreen3
; Compares the bottom 2/3rds of the screen for a byte/byte match.
; Counts number of mismatches.  Returns result in BC.
; TODO: Make this the RIGHT section of screen
CompareScreen3:
	LD HL, 16384+24
	LD DE, BitmapAddr+24
	LD B, 192
	LD IX, 0		; Count
	
_CSloop:
	LD A, (DE)
	CP (HL)
	JR Z, _CSskip0
	INC IX
_CSskip0:	INC L
	INC E

	LD A, (DE)
	CP (HL)
	JR Z, _CSskip1
	INC IX
_CSskip1:	INC L
	INC E

	LD A, (DE)
	CP (HL)
	JR Z, _CSskip2
	INC IX
_CSskip2:	INC L
	INC E

	LD A, (DE)
	CP (HL)
	JR Z, _CSskip3
	INC IX
_CSskip3:	INC L
	INC E

	LD A, (DE)
	CP (HL)
	JR Z, _CSskip4
	INC IX
_CSskip4:	INC L
	INC E

	LD A, (DE)
	CP (HL)
	JR Z, _CSskip5
	INC IX
_CSskip5:	INC L
	INC E

	LD A, (DE)
	CP (HL)
	JR Z, _CSskip6
	INC IX
_CSskip6:	INC L
	INC E

	LD A, (DE)
	CP (HL)
	JR Z, _CSskip7
	INC IX
_CSskip7:	INC L
	INC E

	LD A, B	; Save B
	LD BC, 24
	ADD HL, BC
	EX DE, HL
	ADD HL, BC
	;EX DE, HL	; Doesn't matter whether HL or DE are one way or another
	LD B, A	; Restore B
	
	DJNZ _CSloop
	
	; Put Result into BC
	PUSH IX
	POP BC
	RET


; KeyboardScan
; Scans the InterfaceII keys and the QAOP keys for movement and updates as necessary
KeyboardScan:
	LD IX, XPosition
	
	; Save current position as last position
	LD A, (IX+0)
	LD (IX+2), A
	LD A, (IX+1)
	LD (IX+3), A
	
	LD BC, KeyPort06
	IN A, (C)
	LD B, A

_Up1:	
	; "7" = Up
	BIT 3, B
	JR NZ, _Down1
	LD A, (IX+1)
	CP 2
	JR C, _Down1
	DEC (IX+1)
_Down1:
	; "6" = Down
	BIT 4, B
	JR NZ, _Right1
	LD A, (IX+1)
	CP 192-17
	JR NC, _Right1
	INC (IX+1)
_Right1:
	; "8" = Right
	BIT 2, B
	JR NZ, _Left1
	LD A, (IX+0)
	CP 256-16
	JR NC, _Left1
	INC (IX+0)
_Left1:
	; "9" = Left
	BIT 1, B
	JR NZ, _Up2
	LD A, (IX+0)
	CP 2
	JR C, _Up2
	DEC (IX+0)






_Up2:	
	LD BC, KeyPortPY
	IN A, (C)
	LD B, A

	; "P" = Up
	BIT 0, B
	JR NZ, _Down2
	LD A, (IX+1)
	CP 2
	JR C, _Down2
	DEC (IX+1)
_Down2:
	; "O" = Down
	BIT 1, B
	JR NZ, _Right2
	LD A, (IX+1)
	CP 192-17
	JR NC, _Right2
	INC (IX+1)
_Right2:
	; "Q" = Right
	LD BC, KeyPortAG
	IN A, (C)
	BIT 0, A
	JR NZ, _Left2
	LD A, (IX+0)
	CP 256-16
	JR NC, _Left2
	INC (IX+0)
_Left2:
	; "A" = Left
	LD BC, KeyPortQT
	IN A, (C)
	BIT 0, A
	JR NZ, _End
	LD A, (IX+0)
	CP 2
	JR C, _End
	DEC (IX+0)

_End:

	RET


DisableFlashEyes:
	PUSH AF	; Holds important info where it is called
	LD A, 56
	JR _EFE1
EnableFlashEyes:
	PUSH AF	; Holds important info where it is called
	LD A, 128+56;242
_EFE1:	LD HL, 22528 + (7 * 32) + 13
	LD (HL), A
	
	LD DE, 32
	ADD HL, DE	
	LD (HL), A
	
	LD DE, 256
	ADD HL, DE
	LD (HL), A
	
	LD DE, 32
	ADD HL, DE	
	LD (HL), A
_WinkExit	POP AF
	RET


WinkAnim:
	PUSH AF
	
	CP $39	; Too Early?
	JR C, _WinkExit
	CP $41	; Too Late?
	JR NC, _WinkExit
	RRA
	JR C, WinkAnimUp
	CALL WinkDown
	JR _WinkExit
WinkAnimUp:	CALL WinkUp
	JR _WinkExit
	; 3->2 = 31h->38h
	; 2->1 = 39h->40h
	; 1->0 = 41h->48h


WinkUp:
	LD HL,18603		; (13down, 10across) = 16384 + 2048 + 5*32 + 11
	LD B, 56			; 7 chars down
_WinkUpLoop:	LD E, (HL)
	LD (HL), 0
	DEC L
	LD D, (HL)
	LD (HL), E
	DEC L
	LD (HL), D
	INC L
	INC L
	STEPDOWN
	DJNZ _WinkUpLoop
	RET

WinkDown:
	LD HL,18601		; (13down, 10across) = 16384 + 2048 + 5*32 + 9
	LD B, 56			; 7 chars down
_WinkDnLoop:	LD E, (HL)
	LD (HL), 0
	INC L
	LD D, (HL)
	LD (HL), E
	INC L
	LD (HL), D
	DEC L
	DEC L
	STEPDOWN
	DJNZ _WinkDnLoop
	RET
	RET

FinalWink:
	LD C, 32

_FW0:	PUSH BC
	CALL WinkUp
	POP BC
	
	LD B, C
_FW1:	HALT
	DJNZ _FW1
	
	PUSH BC
	CALL WinkDown
	POP BC

	LD B, C
_FW2:	HALT
	DJNZ _FW2
	
	LD A, C
	RRA		; (NOT RRA) WITH FLAGS
	LD C, A
	OR A
	JR NZ, _FW0
	RET

; TimerReset
; Set timer to 50 seconds
TimerReset:
	; Set timer to 500
	LD HL, Timer
	LD (HL), NumberFont3L
	INC HL
	LD (HL), NumberFont0L
	INC HL
	LD (HL), NumberFont0L
	RET

; TimerDec
; Decrement the timer and draw the time on the screen
TimerDec:
	LD HL, Timer+2
	LD DE, 16384+10

	CALL TimeDecDigit
	PUSH AF
	CALL DrawDigit
	POP AF
	RET C
	
	DEC E
	DEC HL
	
	CALL TimeDecDigit
	PUSH AF
	CALL DrawDigit
	POP AF
	RET C
	
	DEC E
	DEC HL
	
	CALL TimeDecDigit
	PUSH AF
	CALL DrawDigit
RRR:	POP AF
	PUSH AF
	
	; Hundreds column rolling:
	; 3->2 = 31h->38h
	; 2->1 = 39h->40h
	; 1->0 = 41h->48h
	;CP $38
	;CALL Z, EnableFlashEyes
	CP $41
	CALL Z, EnableFlashEyes
	CALL WinkAnim
	CALL BeepWarning
	POP AF
	RET C
	
	; QUIT TO BASIC
	POP HL
	
	; Final Wink
	CALL FinalWink

	; Stop Eyes Flashing	
	CALL DisableFlashEyes

	; Remove Cursor	
	CALL PlotFace		; Remove cursor
	
	; Calculate Score
	CALL CompareScreen3	; BC = Mismatch count
	
	RET


DrawDigit:
	LD B, 8
	LD A, (HL)
	PUSH HL
	LD H, NumberFontH
	LD L, A
_DD1:	LD A, (HL)
	LD (DE), A
	INC D
	INC L
	DJNZ _DD1
	LD A, D
	SUB 8
	LD D, A
	POP HL
	RET

BeepWarning:
	PUSH AF
	LD BC, 255
	LD A, 7
_BWloop1:	
	LD B, C
	OUT (254), A
	DJNZ $
	XOR 18
	OUT (254), A
	DJNZ $
	XOR 18
	
	DEC C
	LD A, C
	OR A
	JR NZ, _BWloop1
	
	POP AF
	RET
	
; TimeDecDigit
; Decrements the digit pointed to by HL
TimeDecDigit:
	LD A, (HL)
	INC A
	
	; Hit very end (2nd 9): Place back at top
	CP NumberFont9L
	JR C, _TDD1
	XOR A
	JR _TDD2
_TDD1:	CP NumberFont0L+1	; Check
_TDD2:	LD (HL), A
	RET	; Carry Not Set if need to do the NEXT digit!


	

	
; PlotFace
; Draws the original onto screen based on Mask and position
PlotFace:
	DI					; We want to use IY
	PUSH IY
	
	LD IX, SpriteMask
	LD A, (XPosition)	; XPos in pixels
	RRA
	RRA
	RRA
	AND 31				; XPos in chars
	LD E, A
	LD A, (YPosition)
	LD D, A
	CALL CalcScreenHL
	
	LD B, 16			; 16 ROWS
_Plot1:	PUSH BC

	
	
	; Load Mask into 3 registers	
	LD D, (IX)
	INC IX
	LD E, (IX)
	INC IX
	LD C, 0
	
	; Prepare Shift
	LD A, (XPosition)
	AND 7
	JR Z, _PlotSkipRot
	LD B, A
	
	; Shift
_Plot2:	RR D
	RR E
	RR C
	DJNZ _Plot2

	; Mask is now in correct position in registers D E C
_PlotSkipRot:	
	PUSH HL
	LD A, H
	ADD A, 64			; 16384 --> 32768
	LD H, A
	PUSH HL
	POP IY
	POP HL
	
	; HL is at SCREEN
	; IY is at same position in back buffer
	
	LD A, D
	CPL		; Inverse Mask
	AND (HL)
	LD (HL), A
	LD A, (IY)
	AND D
	OR (HL)
	LD (HL), A
	INC IY
	INC L
	
	LD A, E
	CPL		; Inverse Mask
	AND (HL)
	LD (HL), A
	LD A, (IY)
	AND E
	OR (HL)
	LD (HL), A
	INC IY
	INC L
	
	LD A, C
	CPL		; Inverse Mask
	AND (HL)
	LD (HL), A
	LD A, (IY)
	AND C
	OR (HL)
	LD (HL), A
	;;INC IY
	;;INC L
	
	DEC L
	DEC L
	STEPDOWN

	POP BC
	DJNZ _Plot1

	POP IY
	EI
	RET

	.MODULE Module2
	
; PlotCursor
; Draws the original onto screen based on Mask and position
PlotCursor:
	LD IX, CursorSprite
	LD A, (XPosition)	; XPos in pixels
	RRA
	RRA
	RRA
	AND 31				; XPos in chars
	LD E, A
	LD A, (YPosition)
	LD D, A
	CALL CalcScreenHL
	
	LD A, 
	LD B, 16			; 16 ROWS
_Plot1:	PUSH BC

	
	
	; Load Mask into 3 registers	
	LD D, (IX)
	INC IX
	LD E, (IX)
	INC IX
	LD C, 0
	
	; Prepare Shift
	LD A, (XPosition)
	AND 7
	JR Z, _PlotSkipRot
	LD B, A
	
	; Shift
_Plot2:	RR D
	RR E
	RR C
	DJNZ _Plot2

	; Mask is now in correct position in registers D E C
_PlotSkipRot:	
	
	; HL is at SCREEN
	
	LD A, D
	OR (HL)
	LD (HL), A
	INC L
	
	LD A, E
	OR (HL)
	LD (HL), A
	INC L
	
	LD A, C
	OR (HL)
	LD (HL), A
	;;INC L
	
	DEC L
	DEC L
	STEPDOWN

	POP BC
	DJNZ _Plot1

	RET

; CalcScreenHL
; Calculates position on screen for a given Xchr / Ypix coordinate
; Input
; D = Y (pixels; 0..191)	= 96
; E = X (chars; 0..31)			= 24
; Output:
; HL contains screen address
; Note: BC and DE are untouched
CalcScreenHL:

	; Calculate Screen Address to send sprite
	LD A,D		; =Y
	AND 7
	LD H,A
	LD A,D
	AND 56
	RLCA
	RLCA
	OR E		; =X
	LD L,A
	LD A,D		; =Y
	AND 192
	RRCA
	RRCA
	RRCA
	ADD A,64
	OR H
	LD H,A
	RET
	




; PLOT
; B = Y Position (Pixels)
; C = X Position (Pixels)
; Returns:
; HL address 
; A containing bit position
Plot:
	PUSH BC
	LD A,C
	AND 7
	INC A
	LD E,A
	SRL C
	SRL C
	SRL C
	LD A,B
	AND 56
	SLA A
	SLA A
	OR C
	LD C,A
	LD A,B
	AND 7
	LD D,A
	LD A,B
	AND 192
	SRL A
	SRL A
	SRL A
	ADD A,D
	ADD A,64
	LD B,A
	PUSH BC
	POP HL
	LD B,E
	LD A,128
	JR _PlotSkip
_PlotRepeat: 	SRL A
_PlotSkip:	DJNZ _PlotRepeat
	POP BC
	RET


InitBeard:	; Remove all whiskers from last game
	LD HL, BeardArray
	LD DE, BeardArray+1
	LD (HL), 0
	LD BC, (MaxWhiskers * BeardItemSize)-1
	LDIR
	RET
	


ProcessBeard:
	LD IX, BeardArray
	LD A, (WhiskersAddr)
	OR A	; Zero?
	RET Z
	
	LD B, A
_PB1:	PUSH BC

        ; BeardArray:
        ; IX+0  = Xpos Sub Value	(LO)
        ; IX+1  = Xpos	    Value	(HI)	; If this is less than (say) 128, then new whisker

        ; IX+2  = Ypos Sub Value	(LO)
        ; IX+3  = Ypos	    Value	(HI)

        ; IX+4  = Xdir Sub Value	(LO)
        ; IX+5  = Xdir     Value	(HI)	= 0 (Right)

        ; IX+6  = Ydir Sub Value	(LO)
        ; IX+7  = Ydir     Value	(HI)	= 0 (Down) or 255 (Up)

	LD A, (IX+1)
	CP 128
	JR C, _PBNewWhisker
	LD A, (IX+3)
	CP 190
	JR NC, _PBNewWhisker

	; Test for an early NewWhisker
	LD H, RandomTableH
	LD A, (RandomTableSeed)
	LD L, A
	LD A, (HL)	
	LD B, A
	INC L
	LD A, L
	LD (RandomTableSeed), A
	AND 10010101b
	JR Z, _PBNewWhisker
	
	
	
	JR _PBPlot

_PBNewWhisker:
	; a) Read a new XY value from the RandomXY table
	LD H, RandomXYH
	LD A, (RandomXYSeed)
	LD L, A
	LD A, (HL)	; Xpix
	LD (IX+1), A
	INC L
	LD A, (HL)	; Ypix
	LD (IX+3), A
	INC L
	LD A, L
	LD (RandomXYSeed), A
	
	XOR A
	LD (IX+0), A	; Xsubpix
	LD (IX+2), A	; Ysubpix
	LD (IX+5), A	; Xdir     Value
	LD (IX+7), A	; Ydir     Value
	
	
	
	; Generate a sub dx and dy value
	LD H, RandomTableH
	LD A, (RandomTableSeed)
	LD L, A
	LD A, (HL)	
	LD (IX+4), A
	INC L
	LD A, (HL)	
	LD (IX+6), A
	INC L
	LD A, (HL)
	RRA
	JR C, _PBA
	DEC (IX+7)		; Make "255" (up)
_PBA:
	INC L
	LD A, L
	LD (RandomTableSeed), A
	
	
	
_PBPlot:	
	; Plot
	LD C, (IX+1)
	LD B, (IX+3)
	LD A, B
	CP 191	; Extra protection
	JR C, _SafePlot
	LD BC, 0	; Y > 192!!!
_SafePlot:	CALL Plot
	OR (HL)
	LD (HL), A
	
	; Update Position (X=X+dx)
	LD L, (IX+0)
	LD H, (IX+1)
	LD E, (IX+4)
	LD D, (IX+5)
	ADD HL, DE
	LD (IX+0), L
	LD (IX+1), H
	
	; Update Position (Y=Y+dy)
	LD L, (IX+2)
	LD H, (IX+3)
	LD E, (IX+6)
	LD D, (IX+7)
	ADD HL, DE
	LD (IX+2), L
	LD (IX+3), H
	
	; Move to next item
	LD DE, 8
	ADD IX, DE
	
	POP BC
	DJNZ _PB1_
	RET

_PB1_	JP _PB1




	
XPosition: 	.byte $C7 ; 192
YPosition:	.byte 96
XLastPos: 	.byte 192
YLastPos:	.byte 96

LastCompValue:	.word 0
CompOpt:	.byte 0
CompOptMax:	.byte 10


RandomTableSeed: 	.byte 0
RandomXYSeed:	 	.byte 0



SpriteMask:
	.byte 3, 192, 15, 240, 31, 248, 63, 252, 127, 254, 127, 254, 255, 255, 255, 255 
	.byte 255, 255, 255, 255, 127, 254, 127, 254, 63, 252, 31, 248, 15, 240, 3, 192
	
CursorSprite:
	.byte 0, 0, 0, 0, 7, 224, 15, 240, 28, 56, 56, 28, 48, 12, 48, 12
	.byte 48, 12, 48, 12, 56, 28, 28, 56, 15, 240, 7, 224, 0, 0, 0, 0
	




			; NUM    : 1    2   4  8  16
			; BIT	: 0    1   2  3  4 	B  C
			; -------; ----------------	-----
KeyPortCSV	.equ 65278	; cap  Z   X  C  V	FE FE
KeyPortAG	.equ 65022	; A    S   D  F  G  	FD FE
KeyPortQT	.equ 64510	; Q    W   E  R  T	FB FE
KeyPort15	.equ 63486	; 1    2   3  4  5	F7 FE
KeyPort06	.equ 61438	; 0    9   8  7  6	EF FE
KeyPortPY	.equ 57342	; P    O   I  U  Y	DF FE
KeyPortENTH	.equ 49150	; ent  L   K  J  H	BF FE
KeyPortSPB	.equ 32766	; spc  sym M  N  B	7F FE



	
	; Align to the next 256 byte boundary
                .org (($ + 0FFH) & 0FF00H)
	


; Characters 9 8 7 6 5 4 3 2 1 0 9
; are described in a series of 8 bytes
; 256 aligned required
NumberFontH:	.equ $/256
NumberFont0L:	.equ $48
NumberFont3L:	.equ $30
NumberFont5L:	.equ $20
NumberFont9L:	.equ $50

	.byte $00, $3C, $42, $42, $3E, $02, $3C, $00	; 9
	.byte $00, $3C, $42, $3C, $42, $42, $3C, $00	; 8
	.byte $00, $7E, $02, $04, $08, $10, $10, $00	; 7
	.byte $00, $3C, $40, $7C, $42, $42, $3C, $00	; 6
	.byte $00, $7E, $40, $7C, $02, $42, $3C, $00	; 5
	.byte $00, $08, $18, $28, $48, $7E, $08, $00	; 4
	.byte $00, $3C, $42, $0C, $02, $42, $3C, $00	; 3
	.byte $00, $3C, $42, $02, $3C, $40, $7E, $00	; 2
	.byte $00, $18, $28, $08, $08, $08, $3E, $00	; 1
	.byte $00, $3C, $46, $4A, $52, $62, $3C, $00	; 0
	.byte $00, $3C, $42, $42, $3E, $02, $3C, $00	; 9

Timer:	.byte NumberFont0L, NumberFont0L, NumberFont5L







RandomTable:	.equ $FB00		; $FB00 to $FBFF: 256 bytes of random 00..FF values
RandomXY:	.equ $FC00		; $FC00 to $FCFF: 256 bytes of alternate {X, Y} values

RandomTableH:	.equ RandomTable/256
RandomXYH:	.equ RandomXY/256

; BeardArray:
; IX+0  = Xpos Sub Value	(LO)
; IX+1  = Xpos	    Value	(HI)	; If this is less than (say) 128, then new whisker

; IX+2  = Ypos Sub Value	(LO)
; IX+3  = Ypos	    Value	(HI)

; IX+4  = Xdir Sub Value	(LO)
; IX+5  = Xdir     Value	(HI)

; IX+6  = Ydir Sub Value	(LO)
; IX+7  = Ydir     Value	(HI)


MaxWhiskers	.equ 256
WhiskersAddr	.equ 60000
BeardItemSize	.equ 8

BeardArray:	.block MaxWhiskers * BeardItemSize


	.end
	
	
	