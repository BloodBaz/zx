; 
; Knot in 2D (Machine Code edition)
; ---------------------------------
; This code is developed for the CSSCGC 2008
;
; Version 1.0	7th January 2009
; Initial Implementation
;
;
#DEFINE	STEPDOWN INC H\ LD A,H\ AND 7\       JR NZ,$+12\ LD A,L\ ADD A,32\ LD L,A\ JR C,$+6\ LD A,H\ SUB   8\ LD H,A
#DEFINE	STEPUP   DEC H\ LD A,H\ AND 7\ CP 7\ JR NZ,$+12\ LD A,L\ SUB   32\ LD L,A\ JR C,$+6\ LD A,H\ ADD A,8\ LD H,A


	.CSEG

	.org 8000h	; 32768



	.MODULE MainApp

Start:

	; Display the welcome message and wait for a key to be pressed
	; to start the game
	CALL DisplayWelcome

	; Initialise game	
	CALL InitGame
	
	; Play a whole game
	CALL RunGame
	
;	CALL GameOver
	
	JP Start




; RunGame
; Runs a single instance of the whole game
RunGame:


LevelLoop:

	; Display Level Message
	CALL DisplayLevel
	
	; Initialise Sheet
	CALL InitSheet

	; Play Level
	CALL PlayLevel
	
	; Display Level Result
	CALL DisplayLevelResult
	
	JR LevelLoop


	
PlayLevel: 

	; Draw Head
	CALL DrawSnakeHead
	
	; Render Room
	CALL RenderRoom

	; Increment and Draw Score
	CALL UpdateScore
	
	; Decrement and Draw Time
	CALL UpdateTimer

	; Level Complete? (Time)
	RET Z

	; Wait
	HALT
	HALT
	
	; Read Keys
	CALL ScanGameKeys

	
	; Change Direction (if required) and Move Hero
	; Note: EXIT may occur inside this call
	CALL UpdatePosition
	
	; Test Damage
	CALL TestDamage
	
	JR PlayLevel






	.MODULE MainFunctions



; CLS
; Clears the screen.
; Sets the screen attributes to colour stored in A
; Sets border to black
CLS:
	CALL CLS_Pixels

	LD (HL),A
	LD BC,767
	LDIR

	XOR A
	OUT (254),A
	RET

; CLS_GAME
; Clears the attributes of the screen only - third line downwards
; Sets the screen attributes to colour stored in A
CLS_GAME:
	LD HL,22528+64
	LD DE,22528+65
	LD BC,767-64
	LD (HL), 7
	LDIR	
	RET


; CLS_Pixels
; Clears the screen area (not attributes) from line 16 downwards
CLS_Pixels:
	LD HL,16384
	LD DE,16385
	LD BC,6144
	LD (HL),0
	LDIR
	RET
	
; CLS_PixelsFrom16
; Clears the screen area (not attributes) from line 16 downwards
CLS_PixelsFrom16:
	LD HL,16384+64
	LD C, 192-16	; Pixel Rows to Clear
	LD D, 32		; Useful number (bytes per line)
CLS1:
	XOR A
	LD B, D
	PUSH HL
CLS2:
	LD (HL), A
	INC L
	DJNZ CLS2
	POP HL
	STEPDOWN
	DEC C
	JR NZ, CLS1
	RET

InitRandom:
	LD A, R	
	LD H, 0
	LD L, A
	LD (Seed), HL
	RET
	
; Pseudo-random number generator.
; Steps a pointer through the ROM (held in seed), returning the contents
; of the byte at that location.
Random:	
	PUSH HL
	LD HL, (Seed)	; Pointer
	LD A, H
	CP 58		; Approaching end of "random" area?
	JR NC,_Rand0	; Yes - reset pointer.
	LD A, R
	XOR (HL)	; Get "random" number from location.
	INC HL		; Increment pointer.
	LD (Seed),HL
	POP HL
	RET
_Rand0:	LD HL,0		; Reset pointer.
	LD (Seed),HL
	POP HL
	RET



; TestKeyPress
; Tests to see if user is pressing a key
; Returns:
;	If no key is pressed, then returns with the Z flag set
;	If a key is pressed,  then returns with the Z flag reset
TestKeyPress:
	LD BC, 254
	IN A, (C)
	AND 31
	XOR 31
	RET

; SafeWaitKey
; Waits for the user to release any currently pressed key
; before waiting for a key press
SafeWaitKey:
	CALL WaitNoKeyPress
	CALL WaitKeyPress
	RET
	
; WaitKeyPress	
; Waits patiently for a key press
WaitKeyPress:
	LD BC, 254
_WKPLp:	IN A, (C)
	AND 31
	XOR 31
	RET NZ
	HALT
	JR _WKPLp
	RET

; WaitNoKeyPress	
; Waits patiently for a key press
WaitNoKeyPress:
	LD BC, 254
_WNKPLp:IN A, (C)
	AND 31
	XOR 31
	RET Z
	HALT
	JR _WNKPLp
	RET


; DisplayWelcome
; Display a welcome message
DisplayWelcome:

	; Clear Screen
	XOR A
	CALL CLS

	; We want a keypress to exit our scrolly
	LD A, 1
	LD (ScrollFlags), A
	
	; Display Welcome Message
	LD IX, WelcomeMsg
	CALL DisplayMessage

	; We DON'T want a keypress to exit by default
	LD HL, ScrollFlags
	LD (HL), 0

	; Return if user pressed a key to exit early
	RET NZ

	; Wait for a key before starting game
	JP WaitKeyPress






	
; DisplayLevel
; Displays a message on the screen saying what level we are on
DisplayLevel:

	; Clear Game Screen
	CALL CLS_GAME

	; Get Level Number
	LD A, (Level)

	; Position in Message to insert Level Number
	LD HL, LevelXXMsg2
	
	CALL Write2BinDigitsIntoMsg
	
	
	LD IX, LevelXXMsg
	CALL DisplayMessage
	RET





; Write2DDADigitsIntoMsg
; Input:
; 	A = Number to write (DDA) [0..99]
;	HL = Points to word to write ascii characters
Write2DDADigitsIntoMsg:
	; Get High Nibble
	LD B, A	; Save
	RRA
	RRA
	RRA
	RRA
	AND 15
	
	; Add '0' and locate character in Lookup Table
	ADD A, 48	
	LD (HL), A
	INC HL

	LD A, B
	AND 15
	ADD A, 48
	LD (HL), A
	RET


; Write5BinDigitsIntoMsg
; Input:
; 	HL = Number to write (binary) [0..65535]
;	IX = Points to word to write ascii characters
Write5BinDigitsIntoMsg:
	
	LD A, '0'		; 10000 column
	LD BC, 10000
	AND A

W2BLoop1:
	SBC HL, BC
	JR C, W2BSkip1
	INC A
	JR W2BLoop1

W2BSkip1:
	ADD HL, BC
	LD (IX), A
	INC IX

Write4BinDigitsIntoMsg:

	LD A, '0'		; 1000 column
	LD BC, 1000
	AND A

W2BLoop2:
	SBC HL, BC
	JR C, W2BSkip2
	INC A
	JR W2BLoop2

W2BSkip2:
	ADD HL, BC
	LD (IX), A
	INC IX

Write3BinDigitsIntoMsg:

	LD A, '0'		; 100 column
	LD BC, 100
	AND A

W2BLoop3:
	SBC HL, BC
	JR C, W2BSkip3
	INC A
	JR W2BLoop3

W2BSkip3:
	ADD HL, BC
	LD (IX), A
	INC IX

	; HL is now < 100
	LD A, L
	PUSH IX
	POP HL

; ...........

; Write2BinDigitsIntoMsg
; Input:
; 	A = Number to write (binary) [0..99]
;	HL = Points to word to write ascii characters
Write2BinDigitsIntoMsg:

	; D contains ASCII "0" which is the 10s digit
	LD D, '0'

WBDLoop:
	; A>10?
	CP 10
	JR C, WBDOut
	
	SUB 10
	INC D
	JR WBDLoop

WBDOut:
	; Output 10s
	LD (HL), D
	INC HL
	
	; Output Units
	ADD A, '0'
	LD (HL), A
	RET




; InitGame
; One off initialisation at the start of the game.
; Draws the screen/score etc.
InitGame:

	; Fully clear screen
	LD A, 7
	CALL CLS
	
	
	; Draw Top Bar:
	; Score, Damage and Time
	LD HL, 22528
	LD DE, 22528+1
	LD BC, 5
	LD (HL), ScoreBarCol
	LDIR
	LD BC, 32-5
	LD (HL), DamageBarCol
	LDIR
	LD BC, 5
	LD (HL), ScoreBarCol
	LDIR
	LD BC, 32-5
	LD (HL), TimerBarCol
	LDIR


	; Print "Score: Damage: " etc.
	LD HL, 16384
	LD DE, ScoreImage
	CALL PrintCharAtDE
	CALL PrintCharAtDE
	CALL PrintCharAtDE
	
	INC L
	INC L

	CALL PrintCharAtDE
	CALL PrintCharAtDE
	CALL PrintCharAtDE
	CALL PrintCharAtDE
	
	LD L, 32+5
	
	CALL PrintCharAtDE
	CALL PrintCharAtDE
	CALL PrintCharAtDE
	

	; Initialise objects
	CALL InitRandom
	CALL InitLevel
	CALL InitScore	
	CALL InitDamage


	RET



	
; InitSheet
; Clears the memory copy of the maze
; (Sheet as in Slippery Sid)
InitSheet:

	; Clear Game Screen
	CALL CLS_GAME


	; Initialise X, Y, DX and DY
	LD A, RoomWidth/2	; X Pos = half way in
	LD (HeroXPos), A
	LD A, 16
	LD (HeroYPos), A

	XOR A
	LD (HeroDY), A
	INC A
	LD (HeroDX), A
	
	; Set timer to top
	CALL InitTimer
	

	; Empty SnakeHead Buffer
	LD HL, SnakeHeadBuffer
	LD A, SnakeHeadBufferLen
	ADD A, A
	LD B, A
	XOR A
_IS2:	LD (HL), A
	INC HL
	DJNZ _IS2
	
	; Draw Snake Head
	LD DE, SnakeRight
	CALL DrawSnakeUDG

	; Blank the Maze
	LD HL, RoomBuffer
	LD DE, RoomBuffer+1
	LD BC, RoomBufSize-1
	LD (HL), RoomSpaceCol		; Colour of Space
	LDIR

	; Add Level Content
	DI
	PUSH IY
	CALL AddLevelBits
	POP IY
	EI
	
	RET










	.MODULE LevResult


; DisplayLevelResult
DisplayLevelResult:

	; ClearSnakeUDG
	CALL ClearSnakeUDG

	; Clear Game Screen
	CALL CLS_GAME

	; Display Level Results
	CALL _DLR_Message

	; Clear Game Screen
	CALL CLS_PixelsFrom16
	CALL CLS_GAME

	; Increment Level
	CALL UpdateLevel	

	RET


; DrawStripe
; Draws a two colour stripe across two attribute chars on the screen.
; Used to provide ink colour to "HalfMessages" that span attribute boundaries
; Input:
;	A = Stripe Y Position (0..22)
;   B = Top Colour
;   C = Bottom Colour
DrawStripe:

	; Turn E (Y position) into an attribute value
	AND 31	; Just in case
	RLCA			; * 2
	RLCA			; * 4
	RLCA			; * 8
	LD L, A
	LD H, 0
	ADD HL, HL		; * 16
	ADD HL, HL		; * 32
	LD DE, 22528
	ADD HL, DE
	LD D, H
	LD E, L
	INC DE

	LD (HL), B		; Top Colour
	LD A, C			; Store Bottom Colour
	
	LD BC, 32
	LDIR
	
	LD (HL), A		; Bottom Colour
		
	LD BC, 31
	LDIR
	RET

_DLR_Message:

	; Set up attribute area
	
	; Line 5/6 = White/Yellow
	LD A, 5
	LD B, 64+7
	LD C, 64+6
	CALL DrawStripe
	
	; Line 9/10 = Cyan/Green
	LD A, 9
	LD B, 64+5
	LD C, 64+4
	CALL DrawStripe

	; Line 13/14 = White/Yellow
	LD A, 13
	LD B, 64+7
	LD C, 64+6
	CALL DrawStripe

	; Line 22/23 = Blue/Red
	LD A, 22
	LD B, 64+3
	LD C, 64+2
	CALL DrawStripe


	; Copy Level into Message
	
	; Fill in Level number
	LD A, (Level)
	LD HL, LevelEndMsg00
	CALL Write2BinDigitsIntoMsg
	LD A, (DamageLeft)
	LD HL, LevelEndMsg01
	CALL Write2BinDigitsIntoMsg
	LD A, (DamageLeft)
	LD HL, LevelEndMsg02
	CALL Write2BinDigitsIntoMsg
	LD HL, (Score)
	LD IX, LevelEndMsg03
	CALL Write5BinDigitsIntoMsg

	LD IX, LevelEndMsg1
	LD HL, 16384 + 8 + (5*32)
	CALL PrintHalfMsg
	
	LD IX, LevelEndMsg2
	LD HL, 16384 + 3 + 2048+(1*32)
	CALL PrintHalfMsg

	LD IX, LevelEndMsg3
	LD HL, 16384 + 10 + 2048+(5*32)
	CALL PrintHalfMsg

	; Wait a while
	LD BC, 50*3		; 4 Second Wait
	Call Wait
	
	; Add Damage to Score in units
	
	; Get Damage * 10
	LD A, (DamageLeft)
	LD L, A
	LD H, 0
	ADD HL, HL	; *2
	PUSH HL
	ADD HL, HL	; *4
	ADD HL, HL	; *8
	POP BC
	ADD HL, BC	; *10
	LD (ScratchHL), HL

_DLR_Loop1:
	
	; Decrement Damage
	LD HL, (ScratchHL)
	LD A, H
	OR L
	JR Z, _DLR_End
	DEC HL
	DEC HL
	LD (ScratchHL), HL
	
	; Write Damage
	LD IX, LevelEndMsg04
	CALL Write3BinDigitsIntoMsg
	LD IX, LevelEndMsg04
	LD HL, 16384 + 3 + 2048+(1*32) + 23
	CALL PrintHalfMsg
	
	; Increment Score
	LD HL, (Score)
	INC HL
	INC HL
	LD (Score), HL

	; Write Score
	LD IX, LevelEndMsg03
	CALL Write5BinDigitsIntoMsg
	LD IX, LevelEndMsg03
	LD HL, 16384 + 10 + 2048+(5*32) + 6
	CALL PrintHalfMsg
	
	HALT
	
	JR _DLR_Loop1
	
	
	
_DLR_End:

	; "Press any key to continue..."
	LD IX, LevelEndMsg4
	LD HL, 16384 + 4096 + (6*32) + 2
	CALL PrintHalfMsg
	
	; Wait for key
	CALL SafeWaitKey
	
	; Clear Screen
	
	RET


; Waits so many 50th seconds by value given by BC
Wait:
	HALT
	DEC BC
	LD A, B
	OR C
	JR NZ, Wait
	RET
	
; TransitionPixels
; Clears out pixels on a given set of lines by a lookup table
; Will scroll out stuff
; Input:
;	IX contains the lookup table ending in 0000h
;	
TransitionPixels:

	LD B, 0				; 256 scrolls
_TPLoop0:
	PUSH BC
	PUSH IX				; Save for next look

_TPLoop1:
	
	; End of Table?
	LD A, (IX)
	AND (IX+1)
	
	JR Z, _TPNextScroll

	; Scroll 8 lines pointed to by IX word
	LD L, (IX)
	LD H, (IX+1)
	INC IX
	INC IX
	
	LD C, 8				; 8 Lines
_TPLoop2:
	PUSH HL
	LD B, 32			; 32 Columns
	AND A				; Clear Carry Flag
_TPLoop3:
	RL (HL)
	INC HL
	DJNZ _TPLoop3
	
	POP HL
	INC H
	DEC C
	JR NZ, _TPLoop2

_TPNextScroll:
	POP IX				; Restore IX to start of table again
	POP BC
	DJNZ _TPLoop0
	
	RET


;	
;	
;	; Test
;	LD HL, 0
;TestLoop:
;	PUSH HL	
;
;	LD IX, TestMsg01
;	CALL Write5BinDigitsIntoMsg
;
;	LD IX, TestMsg
;	LD HL, 16384 + 4096 + 5 + (5*32)
;	CALL PrintHalfMsg
;
;	POP HL
;	INC HL
;	JR TestLoop
;	
;TestMsg01:	.equ $+15
;TestMsg:	.text "Your number is ?????."
;		.byte 0
;
;









	.MODULE LevelBits

; AddLevelBits 
AddLevelBits:
;	JR _LevelTest	; Test Level

	LD A, (Level)	
_LevelLoop:
	DEC A
	RET Z		; Level 1 = Nothing
	DEC A
	JR Z, _Level2	; Level 2
	DEC A
	JR Z, _Level3	; Level 3
	DEC A
	JR Z, _Level4	; Level 4
	DEC A
	JR Z, _Level5	; Level 5
	DEC A
	JR Z, _Level6	; Level 6
	DEC A
	JR Z, _Level7	; Level 7
	DEC A
	JR Z, _Level8	; Level 8
	DEC A
	JR Z, _Level9	; Level 9
	DEC A
	JR Z, _Level10	; Level 10
	DEC A
	JR Z, _Level11	; Level 11
	DEC A
	JR Z, _Level12	; Level 12
	JR _LevelLoop


_LevelTest:


_Level2:	; Grass

	LD A, 8
	LD HL, SpriteGrass
	CALL Top2BottomFill
	RET
	


_Level3:	; Trees

	LD A, 8
	LD HL, SpriteTree
	CALL Top2BottomFill
	RET

_Level4:	; Flowers
	LD A, 8
	LD HL, SpriteFlower
	CALL Top2BottomFill
	RET
	

_Level5:
	
	RET

_Level6:
	RET

_Level7:
	RET

_Level8:
	RET

_Level9:
	RET

_Level10:
	RET

_Level11:
	RET

_Level12:
	RET


; Top2BottomFill
; Fills a sprite of your choosing evenly down but in random X
; across the maze
; Input:
;	HL = Sprite
;	A  = Y Step between each Sprite
Top2BottomFill:

	; Save
	LD (_T2BYStep), A
	LD (_T2BSprite), HL

	XOR A		; First tree will be at this height
	LD IX, RoomBuffer

_L2a	PUSH AF
	PUSH IX
	
	; Get a random X position
	CALL Random
	AND RoomWidthMask

	LD D, 0
	LD E, A
	ADD IX, DE

	; Draw Tree
	LD HL, (_T2BSprite)
	CALL DrawSprite

	; Restore Maze Row (IX)
	POP IX
	
	; Move IX down "_T2BYStep" Room squares
	LD DE, RoomWidth
	LD A, (_T2BYStep)
_L2b:	ADD IX, DE
	DEC A
	JR NZ, _L2b
	ADD A, 8

	; Restore Y position (A)
	POP AF
	
	; Move A down "_T2BYStep" Room squares
	LD HL, _T2BYStep
	ADD A, (HL)

	; End?
	CP RoomHeight-16
	JR C, _L2a
	RET

_T2BSprite:	.word 0	; Address of sprite to draw
_T2BYStep:	.byte 0	; Y Step



; DrawWalls
; Draws a wall around the whole maze
DrawWalls:
	; Make top wall (Red+32 = Yellow)
	LD HL, RoomBuffer
	LD DE, RoomBuffer+1
	LD BC, RoomWidth-1
	LD (HL), RoomWallCol		; Colour of Wall
	LDIR
	
	; Make left wall (Red)
	LD HL, RoomBuffer
	LD DE, RoomWidth
	LD B,  RoomHeight
	LD A,  RoomWallCol		; Colour of Wall
_IS1:	LD (HL), A
	ADD HL, DE
	DJNZ _IS1
	RET
	
; DrawTree
; Draws a tree at IX where IX is top left and size is 8x7
; Shape:
;   X   X  X X
;   XX  XX  X
;   0123456789
;     X  X X
;    X XX X
;      XX
;      XX
;      XX





; DrawSprite
; Draws a sprite pointed to by HL at Maze Address pointed to by IX
DrawSprite:
	; Save base IX position (in case of AT command)
	LD (DWIXBase), IX
	
_DWLoop:; Get next byte
	LD A, (HL)
	INC HL

	; End?
	CP ENDSPRITE
	RET Z
	
	; New Colour?
	CP COLOUR
	JR Z, _DWChangeColour
	
	; Newline?
	CP NEWLINE
	JR Z, _DWNewLine
	
	; Jump to new address?
	CP JUMP
	JR Z, _DWJump
	
	; Jump to new x/y position
	CP AT
	JR Z, _DWAt
	
	; A = Poke Offset
	; Poke IY displacement
	LD ($+5), A
	LD (IX+0), C	
	JR _DWLoop	


_DWChangeColour:
	LD C, (HL)
	INC HL
	JR _DWLoop

_DWNewLine:
	LD DE, RoomWidth
	ADD IX, DE
	JR _DWLoop

_DWJump:
	LD A, (HL)
	INC HL
	LD H, (HL)
	LD L, A
	JR _DWLoop
	
_DWAt:
	; Go back to (0,0)
	LD IX, (DWIXBase)
	
	; Get Y coordinate
	LD A, (HL)
	INC HL
	
	; Move down
	LD DE, RoomWidth
_DWAt0:	ADD IX, DE
	DEC A
	JR NZ, _DWAt0
	
	; Get X coordinate
	LD A, (HL)
	INC HL

	; Move Across	
	LD D, 0
	LD E, A
	ADD IX, DE
	JR _DWLoop


DWIXBase:	.word 0

; Constants
COLOUR:	.equ 120	; Code for COLOUR <c>
NEWLINE .equ 121	; Code for NEW LINE
ENDSPRITE .equ 122	; Code for END OF SPRITE
JUMP 	.equ 123	; Code for JUMP <address16> Jump reader to new address
AT	.equ 124	; Code for AT <y> <x>

WHITE:	.equ (7*8)
YELLOW:	.equ (6*8)
CYAN:	.equ (5*8)
GREEN:	.equ (4*8)
MAGENTA:.equ (3*8)
RED:	.equ (2*8)
BLUE:	.equ (1*8)
BLACK:	.equ (0*8)


SpriteFlower:
	; Petals
	.byte COLOUR, WHITE
	.byte 7, 8, 10, 11, NEWLINE
	.byte 7, 8, 10, 11, NEWLINE
	.byte 5, 6, 12, 13, NEWLINE
	.byte 5, 6, 7, 11, 12, 13, NEWLINE
	.byte 5, 6, 12, 13, NEWLINE
	.byte 6, 7, 11, 12, NEWLINE
	.byte 6, 7, 11, 12, NEWLINE

	; Bud
	.byte AT, 2, 0
	.byte COLOUR, YELLOW
	.byte 8, 9, 10, NEWLINE
	.byte 8, 9, 10, NEWLINE
	.byte 8, 9, 10, NEWLINE

	; Stork
	.byte AT, 5, 9
	.byte COLOUR, GREEN
	.byte 0, NEWLINE
	.byte 0, NEWLINE
	.byte 0, NEWLINE
	.byte 0, NEWLINE
	.byte 0, NEWLINE
	.byte 0, NEWLINE
	.byte 0, NEWLINE
	.byte 0

	.byte AT, 12, 0
	.byte JUMP
	.word SpriteGrass

SpriteGrass:
	.byte COLOUR, 32
	.byte 6, 9, 
	.byte COLOUR, 32+64
	.byte 13, 18, NEWLINE
	.byte COLOUR, 32
	.byte 7, 9, 11, 
	.byte COLOUR, 32+64
	.byte 13, 15, 17, NEWLINE
	.byte COLOUR, 32
	.byte 3, 5, 7, 8, 9, 10, 11
	.byte COLOUR, 32+64
	.byte 12, 13, 14, 15, 17, 19, 21, NEWLINE
	.byte COLOUR, 32
	.byte 1, 3, 4, 6, 7, 10, 11, 12
	.byte COLOUR, 32+64
	.byte 13, 14, 15, 16, 17, 18, 19, 21, 22, NEWLINE
	.byte COLOUR, 32
	.byte 0, 2, 3, 5, 
	.byte COLOUR, 32+64
	.byte 15, 16, 17, 18, 20, 21, 23, ENDSPRITE
	
	
	
	
SpriteTree:
	.byte COLOUR, 32
	.byte 3, 6, 8, NEWLINE
	.byte 2, 5, 7, 9, 11, NEWLINE
	.byte 3, 6, 8, 10, 12, 13, NEWLINE
	.byte 1, 4, 5, 7, 9, 11, 12, NEWLINE
	.byte 0, 2, 3, 5, 6, 10, NEWLINE
	.byte 1, 3, 6, 7, 9, 12, NEWLINE
	.byte 2, 4, 6, 8, 11, NEWLINE
	.byte 3, 4, 9, 10
	.byte COLOUR, 16
	.byte 7, NEWLINE, 6, 7
	.byte COLOUR, 32
	.byte 4, 5, 9
	.byte COLOUR, 16
	.byte 6, 7, NEWLINE
	.byte 6, 7, NEWLINE
	.byte 6, 7, NEWLINE
	.byte 6, 7, NEWLINE
	.byte 6, 7, NEWLINE
	.byte 5, 6, 7, 8, NEWLINE
	.byte 4, 6, 8, 9, ENDSPRITE



; RenderRoom
; Draws the screen based on Hero's X/Y position in Maze
RenderRoom:

	; Set ScreenXPos, ScreenYPos and ScreenHL
	CALL CalcScreenFromHero
	
	
	; A holds the current Y position in Maze being rendered
	; It is incremented and ANDed each row so we can detect a
	; "Maze Wrap".
	LD A, (ScreenYPos)

	; Draw Room
	LD HL, (ScreenHL)	; Maze Memory Location that corresponds to ...
	LD DE, 22528+64		; Screen Top Left Memory Address
	LD B,  22		; Screen Height


	
	; INSTRUCTION COUNT MUST BE WIDTH OF SCREEN
	; (THE LOG2 POWER OF ROOM WIDTH e.g. 32 instructions = screen width = 32)
_RR1:	PUSH BC	; Note: LDI still decrements BC so we must save it
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	LDI
	POP BC

	PUSH DE
	
	; Move Maze Position down to start of next row
	LD DE, RoomWidth-32		; Maze Width less 1 screen width
	ADD HL, DE
	
	; Increment Row and MOD
	INC A
	AND RoomHeightMask
	JR NZ, _RRSkipVWrap
	LD DE, RoomBufSize
	AND A			; Clear Carry Flag
	SBC HL, DE
	
_RRSkipVWrap:

	POP DE
	
	; Loop next row	
	DJNZ _RR1
	RET
	


; CalcScreenFromHero
; Calculates the Screen's top left attribute;s X/Y position and Memory location in Maze
CalcScreenFromHero:

	LD A, (HeroXPos)
	SUB 16			; Move from Middle to Left
	AND RoomWidthMask	; Wrap using MOD mask (works because maze is power of 2 in size)
	LD (ScreenXPos), A	; Save Screen X Pos
	
	LD E, A			; Save for later to convert Memory Address
	
	LD A, (HeroYPos)
	SUB 12			; Move from Middle to Top
	AND RoomHeightMask	; Wrap using MOD mask (works because maze is power of 2 in size)
	LD (ScreenYPos), A	; Save Screen X Pos
	
	LD D, A			; Save for later to convert Memory Address
	
	CALL ConvertXYtoHL	; Convert an X/Y position in maze to a Memory Address
	
	LD (ScreenHL), HL
	
	RET
	
	



; ConvertXYtoHL
; Takes an X and Y position and works out its corresponding Memory Address within the Maze
; Input:
;	D = Y Position
;	E = X Position
; Output:
; 	HL = Memory location in Maze
; Damage:
;	DE = Room Buffer base position
ConvertXYtoHL:
	
	; HL = Y Position
	LD H, 0
	LD L, D

	; INSTRUCTION COUNT MUST BE THE LOG2 POWER OF ROOM WIDTH (e.g. 6 instructions = 64 width)
	ADD HL, HL
	ADD HL, HL
	ADD HL, HL
	ADD HL, HL
	ADD HL, HL
	ADD HL, HL
	ADD HL, HL

	; DE = X Position
	LD D, 0
	ADD HL, DE
	
	; DE = Maze Buffer
	LD DE, RoomBuffer
	ADD HL, DE
	RET
	

; DrawSnakeHead
; Draws a graphical head onto the Maze so it will appear later
DrawSnakeHead_OLD:

	; Get Memory Address from Hero Position
	LD HL, (HeroXPos)
	EX DE, HL
	CALL ConvertXYtoHL
	LD A, R
	AND 56		; Paper Only
	OR  8		; Ensure not Black
	LD (HL), A
	RET


; DrawSnakeHead
; Draws a graphical head onto the Maze so it will appear later
DrawSnakeHead:

	; Get Memory Address from Hero Position
	LD HL, (HeroXPos)
	EX DE, HL
	CALL ConvertXYtoHL
	
	LD IX, SnakeHeadBuffer
	LD B, 7	; Last 7 positions need repainting
	LD A, 8 ; Colour of snake head

_DSHLoop:
	; Paint HL with Snake Head Colour and update colour
	LD (HL), A
	ADD A, 8
	
	; DE = Index [i]
	LD E, (IX+0)
	LD D, (IX+1)

	; Index [i] = HL
	LD (IX+0), L
	LD (IX+1), H
	
	INC IX
	INC IX
	
	EX DE, HL

	DJNZ _DSHLoop
	RET


; UpdatePosition
; This will take the keyboard/joystick keypresses from KeyData byte
; and change the direction of the Snake if required.
; It will then adjust the X/Y position based on DX/DY
UpdatePosition:

	; Get current DX and DY (B = DX; C = DY)
	LD A, (HeroDX)
	LD B, A
	LD A, (HeroDY)
	LD C, A	
	
	; Get KeyData.  If no keys are pressed, then skip testing them individually
	LD A, (KeyData)
	OR A
	JR Z, _UPAfterKeys

	
	; FIRE?
	RRCA
	JR NC, _UP1
	
	; Fire means quit.  We simply RET to main code by dropping the last call on the stack
	RST 08h
	.byte 255
	POP HL		; Dummy POP
	POP HL		; Dummy POP
	POP HL		; Dummy POP
	RET		; Return to BASIC

	
	; UP?
_UP1:	RRCA
	JR NC, _UP2

	; Test: If we are currently going UP or DOWN then ignore
	LD D, A
	LD A, C		; Test HeroDY
	OR A
	LD A, D
	JR NZ, _UP2
	
	; Set to UP
	LD B, 0
	LD C, -1

	LD DE, SnakeUp
	CALL DrawSnakeUDG
	;JR _UP5

	; DOWN?
_UP2:	RRCA
	JR NC, _UP3

	; Test: If we are currently going UP or DOWN then ignore
	LD D, A
	LD A, C		; Test HeroDY
	OR A
	LD A, D
	JR NZ, _UP3
	
	; Set to DOWN
	LD B, 0
	LD C, 1

	LD DE, SnakeDown
	CALL DrawSnakeUDG
	;JR _UP5


	; RIGHT?
_UP3:	RRCA
	JR NC, _UP4

	; Test: If we are currently going LEFT or RIGHT then ignore
	LD D, A
	LD A, B		; Test HeroDX
	OR A
	LD A, D
	JR NZ, _UP4
	
	; Set to RIGHT
	LD B, 1
	LD C, 0

	LD DE, SnakeRight
	CALL DrawSnakeUDG
	;JR _UP5

	; LEFT?
_UP4:	RRCA
	JR NC, _UP5

	; Test: If we are currently going LEFT or RIGHT then ignore
	LD D, A
	LD A, B		; Test HeroDX
	OR A
	LD A, D
	JR NZ, _UP5
	
	; Set to LEFT
	LD B, -1
	LD C, 0

	LD DE, SnakeLeft
	CALL DrawSnakeUDG
	;JR _UP5


_UP5:	; Save DX/DY back
	LD A, B
	LD (HeroDX), A
	LD A, C
	LD (HeroDY), A



_UPAfterKeys:
	; X += DX
	LD A, (HeroXPos)
	ADD A, B
	AND RoomWidthMask
	LD (HeroXPos), A

	; Y += DY
	LD A, (HeroYPos)
	ADD A, C
	AND RoomHeightMask
	LD (HeroYPos), A

	RET
	


; CharToHL
; Converts an ASCII character in A to a Character Table location in HL
; BC = Untouched
CharToHL:
	LD L, A
	LD H, 0
	ADD HL, HL
	ADD HL, HL
	ADD HL, HL
	LD A, (23606)
	LD E, A
	LD A, (23607)
	LD D, A
	ADD HL, DE
	RET
	


	.MODULE Damage

; The user has 32 damage during the level.  A damage point is lost
; for each block they hit.  The damage is reflected by a coloured bar
; at the bottom of the page.

;DamageLeft:	.byte 32	; 32 
;DamageHL:	.word 23295	; Attr End Pos

; TestDamage
; Tests the Hero's position on the Maze to see if there is a block
; there or not.  Reduces damage and update's damage bar if a hit occurs
; along with a sound effect.  Quits if damage reaches zero.
; DamageLeft goes from 32 to 0; DamageHL is the next AttrPos to make "black"
TestDamage:

	; Increment Score
	LD HL, (Score)
	INC HL
	LD (Score), HL
	
	; Get Memory Address from Hero Position
	LD HL, (HeroXPos)
	EX DE, HL
	CALL ConvertXYtoHL


	; Sample Maze Position
	LD A, (HL)
	CP RoomSpaceCol
	
	; OK?
	RET Z
	
	; DAMAGE!!!!!
	
	; Reduce Damage (UI)
	LD HL, (DamageHL)
	DEC HL
	LD (HL), DamageBarGoneCol
	LD (DamageHL), HL
	
	; Play Sound Effect
	CALL SoundCrash

	
	; Reduce Damage (Count)
	LD A, (DamageLeft)
	DEC A
	LD (DamageLeft), A
	
	; Test for Dead
	OR A
	RET NZ
	
	; DEAD!!!!!!!
	
	; Exit Program (returning score)
	POP HL	; Quit Level
	POP HL	; Quit Game
	LD BC, (Score)
	RET


; ClearSnakeUDG
ClearSnakeUDG:
	LD HL, 16384 + 2048 + (6 * 32) + 16
	LD B, 8
	XOR A
_CSHLp:	LD (HL), A
	INC H
	DJNZ _CSHLp
	RET
	
; DrawSnakeUDG
; Based on the DX/DY values, we draw one of the 4 UDGs representing the SNAKE HEAD
; Graphic will be inverted as the snake head's blue colour is PAPER
; Input:
; 	DE = UDG Source Graphic
; (Registers must be preserved)
DrawSnakeUDG:
	PUSH AF
	PUSH BC
	PUSH HL
	LD HL, 16384 + 2048 + (6 * 32) + 16
	LD B, 8
_DSU1:	LD A, (DE)
	NEG
	DEC A
	LD (HL), A
	INC H
	INC DE
	DJNZ _DSU1
	POP HL
	POP BC
	POP AF
	RET

; SoundCrash
SoundCrash:
	LD HL, 0
	LD C, 255
_SC0:	LD A, (HL)
	AND 7+16
	OUT (C), A
	LD B, A
_SC1:	DJNZ _SC1
	INC HL
	DEC C
	JR NZ, _SC0
	XOR A
	OUT (C), A
	RET

; SoundTimerTick
SoundTimerTick:
	LD C, 25
_STT0:	LD A, 16
	OUT (C), A
	LD B, 4
_STT1:	DJNZ _STT1
	XOR A
	OUT (C), A
	LD B, 32
_STT2:	DJNZ _STT2
	DEC C
	JR NZ, _STT0
	RET
	




	.MODULE Score

; InitLevel
InitLevel: 
	; Initialise Level to 1
	LD A, 1
	LD (Level), A
	RET

; UpdateLevel
; Add 1 to the level
UpdateLevel:
	LD HL, Level
	INC (HL)
	RET


; InitScore
; Set score to 0 including preparing the UI
InitScore:
	; Initialise Score to 0
	LD HL, 0
	LD (Score), HL
	LD HL, Digit1		; Point to next digit to display (1)
	LD (ScoreHLs+0), HL
	LD (ScoreHLs+2), HL
	LD (ScoreHLs+4), HL
	LD (ScoreHLs+6), HL
	LD (ScoreHLs+8), HL
	RET


; UpdateScore
; Increments score and redraws to screen
UpdateScore:

	; Increment score
	LD HL, Score
	INC (HL)
	
	; Need to update digits
	LD HL, 16384 + 32 + 4		; Screen address of units digit
	LD IX, ScoreHLs			; Array of 5 Pointers to characters
	LD B, 5				; 5 digits
	LD C, (DigitEnd & 0FFh)		; Limit (only need to test E and C)
	
_US0:	LD E, (IX+0)
	LD D, (IX+1)

	CALL PrintCharAtDE
	
	; Does DE = BC?
	LD A, E
	CP C	
	JR NZ, _US1

	; Move back to "0"
	LD DE, Digit1
	
	; Write back
	LD (IX+0), E
	LD (IX+1), D
	DEC L		; Move to PREVIOUS address on screen (PrintCharAtDE incremented it!)
	DEC L
	INC IX		; Move to next pointer
	INC IX
	DJNZ _US0
	RET		; Looped the score!!!

	
	; Write back and exit
_US1:	LD (IX+0), E
	LD (IX+1), D
	RET	

	
; InitTimer
; Set Timer to full including preparing the UI
InitTimer:

	; Count Down
	LD A, 32-5
	LD (TimerLeft), A
	
	; Pointer to UI
	LD HL, 22528+64
	LD (TimerHL), HL
	
	; Sub Count
	LD A, (TimerLoReset)
	LD (TimerLo), A

	; Draw UI
	LD HL, 22528+32+5
	LD DE, 22528+32+6
	LD BC, 32-6
	LD (HL), TimerBarCol
	LDIR

	RET

; UpdateTimer
UpdateTimer:
	; Decrement the SubTimer
	LD A, (TimerLo)
	DEC A
	LD (TimerLo), A
	RET NZ

	; Reset SubTime
	LD A, (TimerLoReset)
	LD (TimerLo), A


	; Reduce Timer (UI)
	LD HL, (TimerHL)
	DEC HL
	LD (HL), TimerBarGoneCol
	LD (TimerHL), HL
	
	; Play Sound Effect
	CALL SoundTimerTick
	
	; Reduce Damage (Count)
	LD A, (TimerLeft)
	DEC A
	LD (TimerLeft), A
	
	; Test for Level Complete
	OR A
	RET	; Z = Complete;


; InitDamage
; Set Damage to full including preparing the UI
InitDamage:
	; Initialise Damage
	LD A, 32-5
	LD (DamageLeft), A
	LD HL, 22528+32
	LD (DamageHL), HL
	RET






	.MODULE HalfText
; Displays a message to the screen spanning between two lines
; Great for colour effects

; PrintHalfMsg
; IX = Message to display
; HL = Screen address to display message (must be 4 pixels into the cell)
PrintHalfMsg:
	
	; Force HL to be 4 characters down into the character cell
	LD A, H
	OR  00000100b
	AND 11111100b
	LD H, A


	; Get Next Character 
_PHM0:	LD A, (IX)
	INC IX

	; End if string?
	AND A	
	RET Z
	
	CALL PrintHalfChar
	JR _PHM0
	

; PrintHalfChar
; Prints ASCII character A at screen position held in HL.
; Returns with HL incremented
PrintHalfChar:
	
	; Convert A to Character Source Address in DE
	PUSH HL
	CALL CharToHL
	EX DE, HL	; Put Source in DE
	POP HL
	
	PUSH HL
	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	STEPDOWN	; Cross Character Boundary Here
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	POP HL
	INC L
	RET



	.MODULE FastText
; Displays a message to the screen without using the OS


; PrintMessage
; IX = Message to display
; HL = Screen address to display message
PrintMessage:

	; Get Next Character 
_PM0:	LD A, (IX)
	INC IX

	; End if string?
	AND A	
	RET Z
	
	CALL PrintChar
	JR _PM0	


; PrintChar
; Prints ASCII character A at screen position held in HL.
; Returns with HL incremented
PrintChar:
	
	; Convert A to Character Source Address in DE
	PUSH HL
	CALL CharToHL
	EX DE, HL	; Put Source in DE
	POP HL
	
PrintCharAtDE:
	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, (DE)
	LD (HL), A
	INC H
	INC DE

	LD A, H
	SUB 8
	LD H, A
	INC L
	RET



	.MODULE KeyboardScanning


ScanGameKeys:
	LD HL, InputScanData	; This is where the CURRENT keyboard/joystick port is
	LD DE, 5*256			; D = # Keys; E = Result
_SGK0:	
	LD C, (HL)				; PORT (low)
	INC HL	
	LD B, (HL)				; PORT (high)
	INC HL	
	IN A, (C)
	AND (HL)				; BIT POSITION MASK
	INC HL
	
	JR Z, _SGK1				; ? KEY PRESS / JOYSTICK NOT PRESSED?
	SCF
	JR _SGK2
_SGK1:	XOR A

_SGK2:	RL E				; SHIFT RESULT INTO E

	DEC D
	JR NZ, _SGK0			; MOVE TO NEXT KEY
	
	; Negate?
	LD A, (HL)				; NEGATIVE FLAG...
	OR A
	LD A, E					; Copy Result to A
	JR Z, _SGK3
	XOR 31					; Negate
_SGK3:	LD (KeyData), A		; Store
	RET



	.MODULE BigText



; DisplayMessage
; Displayes the message pointed to by HL to the screen in the
; form of a scrolly
; Input:
;	IX = Points to message
; Returns:
;	Z Flag Reset = User pressed a key to terminate early
DisplayMessage:

	; Get Next Character 
_DM0:	LD A, (IX)
	AND A	; CP 0
	JR Z, DM_ScrollEnd
	CP 32	; CP ' '
	JR Z, DM_ScrollSpace
	
	; Find location in Font Table
	; HL points to Font Character
	CALL CharToHL

	; Copy Character into writable area	
	LD DE, ScrollCharBuf
	LD BC, 8
	LDIR

	; For each vertical pixel...
_DM1
	CALL DM_KeyPress	; Test key press if required
	RET NZ			; Quit if Key Pressed
	
	HALT
	CALL DM_Scroll
	CALL DM_FillRight
	CALL DM_TestEmptyBuffer
	JR NZ, _DM1
	
_DMNextChar:
	INC IX
	JR _DM0

DM_ScrollSpace:
	LD B, 8
_DM12:	PUSH BC
	HALT
	CALL DM_Scroll
	CALL DM_FillRight
	POP BC
	DJNZ _DM12
	JR _DMNextChar

; DM_ScrollEnd
; Scrolls off the rest of the message
DM_ScrollEnd:

	LD B, 32
_DM2	HALT
	PUSH BC
	CALL DM_Scroll
	CALL DM_FillRight
	POP BC
	DJNZ _DM2
	XOR A			; Set Z Flag
	RET

; DM_TestEmptyBuffer:
; Tests to see if the ScrollCharBuf contains
; all empty values
; Returns:
;	ZF Set if all empty
;	ZF Reset if pixels left
DM_TestEmptyBuffer:
	LD HL, ScrollCharBuf
	XOR A
	LD B, 8
_DM_Loop5:
	OR (HL)
	INC HL
	DJNZ _DM_Loop5
	AND A
	RET


; DM_KeyPress
; Tests if user has pressed a key (to exit scrolly).  Only applies if
; Bit 0 of ScrollFlags is set
; Returns:
;	Z Flag: Set = Continue Scrolling; Reset = Quit Scroll
;	ZF=1	Exit Scrolly
DM_KeyPress:

	LD A, (ScrollFlags)
	AND 1
	RET Z	; Continue Scroll
	
	JP TestKeyPress; Returns Z Flag set if no key pressed and continue scroll


; DM_Scroll
; Scrolls middle 8 attribute rows to the left 1 leaving
; the right most column unaffected
DM_Scroll:
	LD A, 8
	LD HL, 22528 + (8 * 32) + 1
	LD DE, 22528 + (8 * 32)
_DM14:	LD BC, 31
	LDIR
	INC L	; Leave Right Most Column alone
	INC E
	DEC A
	JR NZ, _DM14
	RET 
	
; DM_FillRight
; Fills right column with pixels from ScrollCharBuf
DM_FillRight:
	LD B, 8
	LD HL, ScrollCharBuf
	LD DE, 22528 + (8 * 32) + 31
_DMFRLoop:
	XOR A
	RL (HL)
	JR NC, _DMFRSkip	; Empty pixel
	LD A, B
	OR A
	JR NZ, _DMFRSkip2
	INC A
_DMFRSkip2:
	RLA
	RLA
	RLA		; Turn Row into Paper
_DMFRSkip:
	LD (DE), A
	INC HL
	LD A, 32
	ADD A, E
	LD E, A
	DJNZ _DMFRLoop
	RET










	.MODULE KeyboardData
	



			; BIT	: 0    1   2  3  4 	B  C
			; NUM   : 1    2   4  8  16
			; ------; ----------------	-----
KeyPortCSV	.equ 65278	; cap  Z   X  C  V	FE FE
KeyPortAG	.equ 65022	; A    S   D  F  G  	FD FE
KeyPortQT	.equ 64510	; Q    W   E  R  T	FB FE
KeyPort15	.equ 63486	; 1    2   3  4  5	F7 FE
KeyPort06	.equ 61438	; 0    9   8  7  6	EF FE
KeyPortPY	.equ 57342	; P    O   I  U  Y	DF FE
KeyPortENTH	.equ 49150	; ent  L   K  J  H	BF FE
KeyPortSPB	.equ 32766	; spc  sym M  N  B	7F FE

KempstonPort	.equ 31


; KEYBOARD / JOYSTICK TABLE
; Each Block comprises of an entry for each input mechanism
; Each Block contains 15 bytes for LEFT, RIGHT, UP, DOWN and FIRE
; Order of entries are : { LEFT RIGHT DOWN UP FIRE } 
; Where each key is a 2 byte PORT and a 1 byte MASK
; A Neg Flag is used to determine whether to negate the msak or not
InputScanData:

; The CURRENT ACTION KEYS 
; (copy of one of the following entries)

		.word KeyPortPY	; LEFT  = 'O'
		.byte 2
		.word KeyPortPY	; RIGHT = 'P'
		.byte 1
		.word KeyPortAG	; DOWN  = 'A'
		.byte 1
		.word KeyPortQT	; UP    = 'Q'
		.byte 1
		.word KeyPortSPB; FIRE  = 'space'
		.byte 1
		
		.byte 1		; Negative = True


; KEYBOARD (OAOP SPACE)

		.word KeyPortPY	; LEFT  = 'O'
		.byte 2
		.word KeyPortPY	; RIGHT = 'P'
		.byte 1
		.word KeyPortAG	; DOWN  = 'A'
		.byte 1
		.word KeyPortQT	; UP    = 'Q'
		.byte 1
		.word KeyPortSPB; FIRE  = 'space'
		.byte 1
		
		.byte 1		; Negative = True

; KEMPSTON JOYSTICK

		.word KempstonPort 	; LEFT
		.byte 2
		.word KempstonPort	; RIGHT
		.byte 1
		.word KempstonPort	; DOWN
		.byte 4
		.word KempstonPort	; UP
		.byte 8
		.word KempstonPort	; FIRE
		.byte 16
		
		.byte 0		; Negative = False

; CURSOR KEYS

		.word KeyPort15	; LEFT  = '5'
		.byte 16
		.word KeyPort06	; RIGHT = '8'
		.byte 4
		.word KeyPort06	; DOWN  = '6'
		.byte 16
		.word KeyPort06	; UP    = '7'
		.byte 8
		.word KeyPort06	; FIRE  = '0'
		.byte 1
		
		.byte 1		; Negative = True



; INTERFACE 2

		.word KeyPort06	; LEFT  = '6'
		.byte 16
		.word KeyPort06	; RIGHT = '7'
		.byte 8
		.word KeyPort06	; DOWN  = '8'
		.byte 4
		.word KeyPort06	; UP    = '9'
		.byte 2
		.word KeyPort06	; FIRE  = '0'
		.byte 1
		
		.byte 1		; Negative = True



; KeyData
; This holds the keypress combination
; and is set by calling ScanGameKeys
; Bit 0 = FIRE
; Bit 1 = UP
; Bit 2 = DOWN
; Bit 3 = RIGHT
; Bit 4 = LEFT
KeyData:		.byte 0


; SnakeHeadBuffer
; This is a history list of the last 8 Maze positions
; that the head has been in.  Each frame, the newest
; position is placed into index [0] and [0] is moved
; into [1] and [1] into [2] etc.
; At the same time, the memory positions are painted
; with a increasingly faded colour
SnakeHeadBuffer:	.word 0,0,0,0,0,0,0,0
SnakeHeadBufferLen:	.equ 8
	
	
	.MODULE DataSection


RoomBuffer:	.equ 49152
RoomWidth:	.equ 128	; Must be a power of two (update ConvertXYtoHL accordingly)
RoomHeight:	.equ 64		; Must be a power of two
RoomWidthMask:	.equ RoomWidth-1	; MOD mask
RoomHeightMask:	.equ RoomHeight-1	; MOD mask

RoomBufSize:	.equ RoomWidth * RoomHeight
RoomSpaceCol:	.equ 7		; Black (white Ink)
RoomWallCol:	.equ 22		; Red   (yellow Ink)

ScoreBarCol:		.equ 16		; Red   (black ink)
DamageBarCol:		.equ 24+64	; Magenta (black ink)
TimerBarCol:		.equ 32+64	; Green (black ink)
DamageBarGoneCol: 	.equ 24		; Green (black ink)
TimerBarGoneCol:	.equ 32		; Green (black ink)

HeroXPos:	.byte 8		; Position of Hero in maze (0..RoomWidth-1)
HeroYPos:	.byte 8		; Position of Hero in maze (0..RoomHeight-1)
HeroDX:		.byte 1		; Direction of Hero in X (0,1,-1)
HeroDY:		.byte 0		; Direction of Hero in Y (0,1,-1)

ScreenXPos:	.byte 0		; Position of Top Left Screen Attr in maze (0..RoomWidth-1)
ScreenYPos:	.byte 0		; Position of Top Left Screen Attr in maze (0..RoomHeight-1)
ScreenHL:	.word 0		; Memory address of Top Left Screen Attr in maze


DamageLeft:	.byte 32-5	; 
DamageHL:	.word 0		; Attr End Pos (22528+5)

TimerLeft:	.byte 32-5	; 
TimerHL:	.word 0		; Attr End Pos (22528+5+32)

Level:		.byte 0		; Level (in DDA mode)
Score:		.word 0		; 
ScoreHLs:	.word 0,0,0,0,0	; Each digit points to address of CHAR 0 in rom , increments etc.. 
TimerLoReset:	.byte 24	; 
TimerLo:	.byte 0

Seed:		.word 0		; For Pseudo Random Number Generator

ScratchHL:	.word 0		; Temporary Value

; User Defined Graphics...
SnakeUp:	.byte 0, 60, 126, 126, 255, 255, 255, 255
SnakeRight:	.byte 240, 254, 255, 255, 255, 255, 254, 240
SnakeDown:	.byte 255, 255, 255, 255, 126, 126, 60, 0
SnakeLeft:	.byte 15, 63, 127, 127, 127, 127, 63, 15

StartPosition:

; Message Data
ScrollCharBuf:	.byte 0,0,0,0,0,0,0,0	; Holds character being scrolled
ScrollCallBack:	.word DefaultCallBack	; Point to default return
ScrollFlags:	.byte 0	; Bit 0: If set, will test for keypress each frame and quit if true

DefaultCallBack: RET	; Return!

WelcomeMsg:	.text "Welcome to 'Knot in 2D' (machine code edition).  "
		.text "CSSCGC 2009 entry by BloodBaz.  "
		.text "For refunds, email chris.walsh@zxlife.net.  "
		.text "Keys: QAOP.  "
		.text "Instructions: Tie a knot in the 2D space, avoiding the string "
		.text "and whatever."
		.byte 0

LevelXXMsg:	.text "Level "
LevelXXMsg2:	.text "00"
		.byte 0

LevelEndMsg00:	.equ $+6
LevelEndMsg1:	.text "LEVEL ?? CLEARED"	; 16 chars.  Offset = 8
		.byte 0

LevelEndMsg01:	.equ $+13
LevelEndMsg02:	.equ $+23
LevelEndMsg2:	.text "DAMAGE BONUS ?? x 10 = ??0"; 26 chars.  Offset = 3
		.byte 0

LevelEndMsg03:	.equ $+6
LevelEndMsg04:	.equ $+8
LevelEndMsg3:	.text "SCORE ?????"			; 11 chars.  Offset = 10
		.byte 0

LevelEndMsg4:	.text "Press any key to continue..."			; 28 chars.  Offset = 2
		.byte 0



		; Move to a 256 boundary
		
		.org  (($ + 0FFh) & 0FF00h)

Digit1:		.byte 00h, 18h, 28h, 08h, 08h, 08h, 3Eh, 00h	; 1
Digit2:		.byte 00h, 3Ch, 42h, 02h, 3Ch, 40h, 7Eh, 00h	; 2
Digit3:		.byte 00h, 3Ch, 42h, 0Ch, 02h, 42h, 3Ch, 00h	; 3
Digit4:		.byte 00h, 08h, 18h, 28h, 48h, 7Eh, 08h, 00h	; 4
Digit5:		.byte 00h, 7Eh, 40h, 7Ch, 02h, 42h, 3Ch, 00h	; 5
Digit6:		.byte 00h, 3Ch, 40h, 7Ch, 42h, 42h, 3Ch, 00h	; 6
Digit7:		.byte 00h, 7Eh, 02h, 04h, 08h, 10h, 10h, 00h	; 7
Digit8:		.byte 00h, 3Ch, 42h, 3Ch, 42h, 42h, 3Ch, 00h	; 8
Digit9:		.byte 00h, 3Ch, 42h, 42h, 3Eh, 02h, 3Ch, 00h	; 9
Digit0:		.byte 00h, 3Ch, 46h, 4Ah, 52h, 62h, 3Ch, 00h	; 0
DigitEnd:













ScoreImage:
		; SCORE in 3 chars
		.byte 0
		.byte 01111000b
		.byte 01000011b
		.byte 01111010b
		.byte 00001010b
		.byte 01111010b
		.byte 00000011b
		.byte 0

		.byte 0
		.byte 00111100b
		.byte 10100101b
		.byte 00100101b
		.byte 00100101b
		.byte 00111101b
		.byte 10000001b
		.byte 0

		.byte 0
		.byte 00001110b
		.byte 11001000b
		.byte 01101100b
		.byte 11001000b
		.byte 01101110b
		.byte 00100000b
		.byte 0

		; DAMAGE in 4 chars
		.byte 0
		.byte 01110000b
		.byte 01001001b
		.byte 01001010b
		.byte 01001011b
		.byte 01110010b
		.byte 00000010b
		.byte 0

		.byte 0
		.byte 00010001b
		.byte 10011011b
		.byte 01010101b
		.byte 11010001b
		.byte 01010001b
		.byte 01000000b
		.byte 0

		.byte 0
		.byte 00000011b
		.byte 00110010b
		.byte 01001010b
		.byte 01111010b
		.byte 01001011b
		.byte 01001000b
		.byte 0

		.byte 0
		.byte 10000000b
		.byte 00011100b
		.byte 11010000b
		.byte 10011000b
		.byte 10010000b
		.byte 00011100b
		.byte 0

		; TIME in 3 chars
		.byte 0
		.byte 01111100b
		.byte 00010001b
		.byte 00010000b
		.byte 00010000b
		.byte 00010000b
		.byte 00000001b
		.byte 0

		.byte 0
		.byte 00010001b
		.byte 11011011b
		.byte 10010101b
		.byte 10010001b
		.byte 10010001b
		.byte 11000000b
		.byte 0

		.byte 0
		.byte 00000000b
		.byte 01111000b
		.byte 01000000b
		.byte 01100000b
		.byte 01000000b
		.byte 01111000b
		.byte 0
		


	; The Load Routine is position independant.  We will shift it to 32000 to save it.
	; Start is "LoadRoutine".  Length is "LoadRoutineLength"
		
LoadRoutine:

		; Screen Loader
		LD IX, 16384	; Start Address
		LD DE, 6912		; Length
		LD A, 255		; Data Block (not Header)
		SCF				; Load, Not Verify
		CALL 1366		; Load Routine
		JR NC, LoadError; Error!

		; Main Program
		LD IX, 32768	; Start Address
		LD DE, 32768	; Length (probably will error but will all load in!)
		LD A, 255		; Data Block (not Header)
		SCF				; Load, Not Verify
		CALL 1366		; Load Routine

		; Start Program		
		LD SP, 65535	; Reset Stack Pointer
		JP Start		; Start of Program
		
		
LoadError:

		LD HL, 16384
		LD DE, 16385
		LD BC, 6144
		LD (HL), 0
		LDIR
		LD BC, 767
		LD (HL), 64+6	; Yellow Ink, Black Paper, Bright
		LDIR
		RET


LoadRoutineLength .equ $ - LoadRoutine

	.end
