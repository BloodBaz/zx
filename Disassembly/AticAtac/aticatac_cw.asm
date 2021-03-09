; This assembly code and associated include define has been developed from
; the a previous disassemly of Atic Atac located here:
; http://opensourcezx.untergrund.net/files/aticatac/aticatac.txt
; 
; From this reference I've made extensive further disassembly of code and data.
; All comments and all labels not in the form Lnnnn are my own.
; A lot of the code should now be relocatable as assembly uses named references to code and data.
;
; The code compiles to a playable game and is byte for byte the same as the original release.
; Assembly layout works best with a tab size of 4 (spaces).
;
; BloodBaz


;z80
;zx-spectrum
;assembler
	;DEFINE USE_MONITOR
	DEVICE ZXSPECTRUM48

INCLUDE "aticatac-defines.asm"
IFDEF USE_MONITOR
INCLUDE "aticatac-monitor.asm"
ENDIF



		.org 5B80h

Decrypt:   ; 5B80
; This is an 18 byte routine that is the first of the three final load blocks.
; It shifts all bytes half a byte forward in memory starting at one byte before 6000h which is the start of the program.
		LD   HL,5FFFh
		LD   BC,007Ch	; 7C00h (31744) bytes will be shifted (6000h to DC00h / 24576 to 56320)
		XOR  A
.loop	RRD
		INC  HL
		DJNZ .loop
		DEC  C
		JR   NZ, .loop
		JP   PlayGame

L5B92
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,0FFh,000h
	DB 000h,000h,0FFh,000h,023h,00Dh,00Dh,023h
	DB 005h,000h,000h,000h,016h,006h,001h,000h
	DB 006h,000h,00Bh,000h,001h,000h,001h,000h
	DB 006h,000h,010h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,03Ch,040h,000h
	DB 0FFh,0CDh,000h,0FBh,05Fh,000h,000h,000h
	DB 001h,000h,0FFh,002h,000h,003h,007h,000h
	DB 000h,00Ch,05Eh,000h,000h,0B6h,05Ch,0BBh
	DB 05Ch,0CBh,05Ch,0C5h,05Dh,0CAh,05Ch,00Dh
	DB 05Eh,010h,05Eh,0C4h,05Dh,067h,05Fh,012h
	DB 05Eh,01Eh,05Eh,01Eh,05Eh,02Dh,092h,05Ch
	DB 000h,002h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,09Dh,01Ah,000h,000h,056h,025h
	DB 000h,058h,0FFh,000h,000h,021h,000h,05Bh
	DB 021h,017h,020h,048h,0E0h,050h,021h,00Fh
	DB 021h,017h,003h,040h,000h,040h,000h,000h
	DB 089h,02Eh,09Dh,036h,0B1h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h

JumpHL:	JP   (HL)   ; 5CB0

L5CB1
	DB 000h,0FEh,05Fh,0FFh,0FFh,0F4h,009h,0A8h
	DB 010h,04Bh,0F4h,009h,0C4h,015h,053h,081h
	DB 00Fh,0C4h,015h,052h,0F4h,009h,0C4h,015h
	DB 050h,080h,000h,001h,0C7h,000h,0FDh,0B0h
	DB 022h,032h,034h,035h,037h,034h,022h,03Ah
	DB 0E7h,0A7h,02Dh,0A7h,03Ah,0DAh,0A7h,02Dh
	DB 0A7h,03Ah,0D9h,0A7h,02Dh,0A7h,03Ah,0DCh
	DB 0A7h,02Fh,0A7h,03Ah,0FBh,03Ah,0F5h,0ACh
	DB 0B0h,022h,039h,022h,02Ch,0B0h,022h,035h
	DB 022h,03Bh,022h,011h,007h,010h,000h,041h
	DB 054h,049h,043h,020h,041h,054h,041h,043h
	DB 020h,069h,073h,020h,06Ch,06Fh,061h,064h
	DB 069h,06Eh,067h,020h,021h,022h,03Ah,0EFh
	DB 022h,022h,0AAh,03Ah,0F5h,0ACh,0B0h,022h
	DB 036h,022h,02Ch,0A7h,02Dh,0A7h,03Ah,0EFh
	DB 022h,022h,0AFh,03Ah,0F5h,0ACh,0B0h,022h
	DB 036h,022h,02Ch,0A7h,02Dh,0A7h,03Ah,0EFh
	DB 022h,022h,0AFh,03Ah,0F4h,0B0h,022h,032h
	DB 033h,037h,032h,038h,022h,02Ch,0B0h,022h
	DB 032h,033h,033h,022h,03Ah,0D7h,0B0h,022h
	DB 02Eh,033h,022h,02Ch,0B0h,022h,037h,022h
	DB 03Ah,0D7h,0B0h,022h,02Eh,033h,022h,02Ch
	DB 0B0h,022h,034h,022h,03Ah,0D7h,0B0h,022h
	DB 02Eh,035h,022h,02Ch,0B0h,022h,035h,022h
	DB 03Ah,0D7h,0B0h,022h,02Eh,033h,022h,02Ch
	DB 0B0h,022h,037h,022h,03Ah,0D7h,0B0h,022h
	DB 02Eh,033h,022h,02Ch,0B0h,022h,034h,022h
	DB 03Ah,0D7h,0B0h,022h,02Eh,035h,022h,02Ch
	DB 0B0h,022h,035h,022h,00Dh,000h,002h,02Bh
	DB 000h,0F4h,0B0h,022h,032h,033h,036h,037h
	DB 032h,022h,02Ch,0B0h,022h,036h,031h,022h
	DB 03Ah,0F4h,0B0h,022h,032h,033h,036h,037h
	DB 033h,022h,02Ch,0B0h,022h,033h,037h,022h
	DB 03Ah,0F5h,0C0h,0B0h,022h,032h,033h,034h
	DB 032h,034h,022h,00Dh,000h,003h,043h,000h
	DB 0F8h,022h,041h,074h,069h,063h,02Dh,041h
	DB 074h,061h,063h,022h,0CAh,0B0h,022h,031h
	DB 022h,03Ah,0F8h,022h,030h,022h,0AAh,03Ah
	DB 0F8h,022h,031h,022h,0AFh,0B0h,022h,032h
	DB 034h,035h,037h,035h,022h,02Ch,0B0h,097h
	DB 050h,050h,07Dh,0FFh,050h,0E5h,0A1h,089h
	DB 07Dh,000h,000h,015h,0A2h,032h,07Ch

; StackPoint is set here and travels upwards
; Next 10 bytes are set to 0 at Start of program
StackTop:   ; 5E00

	; Control Flags:
	; b1 & b2: Control Mode: 00=Keyboard 01=Kempston; 10=Cursor
	; b3 & b4: Character:    00=Knight;  01=Wizard;   10=Surf
ControlFlags:	DEFB 00h   ; 5E00

FontBase:		DEFW Font   ; 5E01 (Font=BE4C)

				DB 000h		 ;5E03
				DB 000h,000h,000h,000h	;5E04-5E07
				DB 000h,000h			;5E08-5E09

				DB 000h,000h,000h,000h,000h,000h	; 5E0A-5E0F

; Workspace is between 5E10-5FFF inclusive.
; It is used in some of the core rendering routines
; All these values are initialised to zero on game start to don't worry
; about their actual values here!
WorkspaceStart:   ; 5E10
SpriteCharWidth DB 002h            ; 5E10: Set to 2 if sprite is character aligned, or 3 if not.
L5E11           DB 012h            ; Some kind of Y (pixels)
GameClock       DW 03332h          ; 5E12; Game Clock - used to control opening and closing of doors etc. increments once per game frame
GameClockHi     EQU (GameClock+1)  ; High Byte of 16-bit Game Clock
RoomInPlay      DB 034h            ; Bit 0 is SET every frame, but is RESET for 1 frame every time room is redrawn.  This allows player sprite etc. to be redrawn so not to leave a ghost imprint behind (L5E14)
SpriteID        DB 032h            ; 5E15:  ID of Sprite to be drawn
SpriteXPos      DB 028h            ; 5E16:  X pos (pixels) of Sprite to be drawn
SpriteYPos      DB 097h            ; 5E17:  Y pos (pixels) of Sprite to be drawn
SpriteHeight    DB 000h            ; 5E18:  Height (pixels) of Sprite to be undrawn.  Taken from first byte of Sprite's Bitmap Data
UndrawSpriteHeight  DB 000h        ; 5E19:  Height (pixels) of Sprite to be drawn.  Taken from first byte of Sprite's Bitmap Data
RoomColour:     DB 080h            ; 5E1A

; When drawing all the background room decoration artifacts during the Draw Room procedure,
; BackItemPointer will point to the vector of the object being drawn.
;  So when drawing Room #0 for example, this value will take on the values 76A9 through to 76C1.
BackItemPointer:DW 005Bh           ; 5E1B

RoomSize: 		DW 0000Dh          ; 5E1D 	Size of Room (1818h, 1838h, 3818h or 3838h)
RoomWidth:		.equ (RoomSize+00h); 5E1D	Half the Width of Room in pixels
RoomHeight:		.equ (RoomSize+01h); 5E1E	Half the Height of Room in pixels

				DB 000h            ; 5E1F
CollectKeyPressed: DB 080h         ; 5E20   Determines if "Z" (Collect) key is being pressed (0=Not Pressed; 2=Pressed)

LivesLeft:		DB 05Bh            ; Set to 3 on game start.  End of game when drops below zero.

MenuItemColour:	DB 047h            ; 5E22   Colour of Menu Item being coloured

				DB 000h            ; 5E23   ...
				DB 00Ah            ; 5E24   ...

GhostsInRoom:	DB 000h            ; 5E25   Number of Ghosts in current room (0..2).  Count includes when ghost is spawning and alive but not when exploding.
				                   ;        Value is reset every frame at the start of the main loop and incremented as each ghost is processed (anim etc.)

CopyOfRoomNo:	DB 000h            ; 5E26   Copy of Room Number.  Used to detect change of room compared to (PlayerRoomNo)

EnterRoomCountDown:	DB 000h        ; 5E27   Counter which counts down from 20h (32) to 0 upon entering a room.  During this time, ghosts cannot spawn

				DB 000h            ; 5E28
				DB 079h            ; 5E29

Score:			DB 05Ch,000h,000h	; 5E2A (24106): Holds the score in 3 bytes in BCD format (MSB first)

InDoorway		DB 000h ; 5E2D: When non-zero then player is in a doorway and is unable to shoot.

OpenCloseTimer	DB 025h ; 5E2E  Countdown timer for when next to open or close a door.  Only counts in rooms where toggleable doors exist

FootstepIndex:	DB 000h	; 5E2F (previously labelled Audio)

Inventory:		; 5E30
		; The Inventory holds information on what you are carrying.
		; There are three enties, each entry is 4 bytes as follows:
		; WORD   Address of object (e.g. EAC0 for Green key)
		; BYTE   SpriteID+1
		; BYTE   Colour
		; Slots contain zeros if empty
		DB 000h,000h,00Ah,000h
		DB 000h,000h,000h,000h
		DB 000h,000h,000h,000h

L5E3C:	DB 000h,000h,000h,000h


VisitedScreensBitmap:	; 5E40
	; Bitmap of 19 bytes (152 bits) which holds
	; which rooms have been visited.  Used to
	; calculate percentage of rooms that are visited
	; during the game to display on the end screen.
	; (2% awarded for every 3 rooms visited)
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h

L5E53
	DB 000h,000h

NextRespawnFoodPtr:   ; 5E55
	DW 0000h	; Every 512 game frames, 8 is added to it.  Starts with FoodObjectsTable (EB58)

	DB 000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,0DBh,002h,04Dh
	DB 000h,003h,000h,0B1h,033h,022h,05Eh,005h
	DB 000h,0B1h,033h,022h,05Eh,000h,000h,01Dh
	DB 05Eh,019h,05Eh,01Dh,05Eh,0B1h,033h,018h
	DB 05Eh,0DBh,002h,04Dh,000h,01Eh,05Eh,001h
	DB 0A2h,05Dh,0DBh,064h,000h,087h,05Bh,02Bh
	DB 02Dh,065h,033h,000h,000h,0EDh,010h,00Dh
	DB 000h,053h,000h,02Fh,020h,0EDh,01Fh,0DBh
	DB 01Fh,076h,01Bh,003h,013h,000h,03Eh,000h
WorkspaceEnd:	; 5FFF

	; The bytes below here in the Stack during the load process
	; CLEAR 24574

PlayGame:          ; 06000h
6000 	DI
6001 	LD   SP, StackTop
6004 	LD   A,(5C79h)	; Check that (23673)=25h (2nd of two bytes loaded in the final load block)
6007 	CP   25h	; If this value is not correct then the exact time from finishing the load and
		; shifting the program half a byte up is incorrect - which indicates user intervention.
		; When then happens, the program does a RET but as the stack pointer has moved, it
		; intentionally crashes the program.
		; This can be bypassed by removing the RET NZ using POKE 24585, 0.
6009 	RET  NZ
600A 	JP   Start




; ====================== START OF TEMPLATE DATA @ 600D ======================
; The 5488 (1570h) byte memory block between:
; 	600Dh and 757Dh
; gets copied to
; 	EA90-FFFF (60048-65535)
; at the start of each game which is an offset of 8A83 (35459) bytes.
; The destination copy is the working copy.
; The data includes:
;	Gra = (Object / Graphic from SprGfx) + 1 (subtract 1 from Gra to locate sprite)
;
; EAxx copy is the "in game" dynamic version.  When you relocate a key, the new room/pos is reflected in EAxx, not 60xx
; When you pick up a key, the Gra becomes 00 instead of the actual Gra+1
; ===========================================================================
InGameOffset       EQU 8A83h
TemplateBlockSize  EQU 1570h
TemplateStart:   ; 600D
GameDataStart      EQU (TemplateStart+InGameOffset) ; =EA90


; Following are a list of game objects.  These are: the player, the player's shots, collectable objects, food, ghosts and monsters (Mummy etc.)
; Each entry is 8 bytes:
; Byte 00: (IX):     SpriteID: A 1-based spriteID (as 0 represents an object that is no longer visible such as food that has been eaten and can change during game play).
; Byte 01: (IX+01h): RoomNo:   Room number that sprite exists in.  This can during over the game play.
; Byte 02: (IX+02h): Bits 0-3: When entering a room counts down from 15 to 0 to control player's movement.
; Byte 03: (IX+03h): X position of object in pixels
; Byte 04: (IX+04h): Y position of object in pixels
; Byte 05: (IX+05h): Colour of object (can change during gameplay)
; Byte 06: (IX+06h): Player's Momentum in X (20 reducing to 0 when moving in Right; E0 increasing to 0 when moving Left) [Serf/Knight]
;                    Wizard doesn't have any momentum so we see 20 when moving Right; E0 when moving left but instantly returns to 0 on key release [Wizard]
;                    When respawning, counts up from 0 to 16 for the player's height to render.
;                    When dying, counts down from 16 to 0 for the player's height to render.
;                    Set to FF before respawn commences
; Byte 07: (IX+07h): Player's Momentum in Y (20 reducing to 0 when moving in Down; E0 increasing to 0 when moving Up)
;                    Set to 18h when respawning

;	     SprID Room  -02-  -X-   -Y-   Colr  DirX  DirY
	DEFB 000h, 000h, 000h, 000h, 000h, 000h, 000h, 000h      ; Player Sprite           ; 600D => @EA90 PlayerSprite

PlayerSprite		equ $EA90	; (60048)
PlayerRoomNo		equ $EA91	; (60049)  Current room number of player
Player02			equ $EA92	; (60050)
PlayerXPos			equ $EA93	; (60051)
PlayerYPos			equ $EA94	; (60052)
PlayerColr			equ $EA95	; (60053)
PlayerMomentumX		equ $EA96	; (60054)
PlayerMomentumY		equ $EA97	; (60055)


;	   SprID                         Room  -02-  -X-   -Y-   Colr  Time  Unkn
	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; Original ShotSprite     ; 6015 => @EA98

ShotSprite			equ $EA98	; (60056) ; Axe/Spell/Sword being fired
ShotRoomNo			equ $EA99	; (60057)

	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h 	; Explosion Object        ; 601D => @EAA0

;	   SpriteID                      Room  -02-  -X-   -Y-   Colr  Time  Unkn
	DB SprGfxObjAcgKey1Idx+1,        000h, 000h, 058h, 058h, 046h, 000h, 000h  ; Yellow ACG Key (AC)     ; 6025 => @EAA8
	DB SprGfxObjAcgKey2Idx+1,        000h, 000h, 058h, 058h, 046h, 000h, 000h  ; Yellow ACG Key (G)      ; 602D => @EAB0
	DB SprGfxObjAcgKey3Idx+1,        000h, 000h, 058h, 058h, 046h, 000h, 000h  ; Yellow ACG Key (handle) ; 6035 => @EAB8
	DB SprGfxObjColourKeyIdx+1,      005h, 000h, 070h, 060h, 044h, 000h, 000h  ; Green  Colour Key       ; 603D => @EAC0
	DB SprGfxObjColourKeyIdx+1,      017h, 000h, 080h, 040h, 042h, 000h, 000h  ; Red    Colour Key       ; 6045 => @EAC8
	DB SprGfxObjColourKeyIdx+1,      053h, 000h, 058h, 058h, 045h, 000h, 000h  ; Blue   Colour Key       ; 604D => @EAD0
	DB SprGfxObjColourKeyIdx+1,      066h, 000h, 030h, 087h, 046h, 000h, 000h  ; Yellow Colour Key       ; 6055 => @EAD8
	DB SprGfxObjMummyLeafIdx+1,      009h, 000h, 040h, 040h, 042h, 000h, 000h  ; Red Mummy Leaf          ; 605D => @EAE0

	; Up to 4 gravestone objects are stored here as lives are lost
GravestoneObjectsTable  equ ($+InGameOffset)    ; 6065 => @EAE8

	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 6065 => @EAE8	Gravestone #1
	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 606D => @EAF0	Gravestone #2
	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 6075 => @EAF8	Gravestone #3
	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 607D => @EB00	Gravestone #4
	DB SprGfxObjCrucifixIdx+1,       005h, 000h, 040h, 070h, 046h, 000h, 000h	; 6085 => @EB08	Yellow Crucifix
	DB SprGfxObjSpannerIdx+1,        030h, 000h, 040h, 070h, 045h, 000h, 000h	; 608D => @EB10	Green Spanner
	DB SprGfxObjBottleIdx+1,         03Bh, 000h, 060h, 060h, 044h, 000h, 000h	; 6095 => @EB18	Green Bottle
	DB SprGfxObjSwedeIdx+1,          048h, 000h, 070h, 070h, 045h, 000h, 000h	; 609D => @EB20	Cyan Swede
	DB SprGfxObjWingIdx+1,           064h, 000h, 080h, 080h, 046h, 000h, 000h	; 60A5 => @EB28	Yellow Wing
	DB SprGfxObjNecklaceIdx+1,       06Bh, 000h, 040h, 040h, 045h, 000h, 000h	; 60AD => @EB30	Cyan Necklace
	DB SprGfxObjTelescopeIdx+1,      013h, 000h, 050h, 050h, 044h, 000h, 000h	; 60B5 => @EB38	Green Telescope
	DB SprGfxObjGemIdx+1,            084h, 000h, 060h, 040h, 043h, 000h, 000h	; 60BD => @EB40	Magenta Gem
	DB SprGfxObjMoneyBagIdx+1,       01Fh, 000h, 070h, 070h, 042h, 000h, 000h	; 60C5 => @EB48	Red Bag of Money
	DB SprGfxObjSkullIdx+1,          049h, 000h, 050h, 040h, 047h, 000h, 000h	; 60CD => @EB50	White Skull

	; Food Objects start here
FoodObjectsTable   equ ($+InGameOffset)   ; 60D5 => @EB58

	DB SprGfxFoodCanIdx+1,           027h, 000h, 057h, 067h, 043h, 000h, 000h	; 60D5 => @EB58	Magenta Canned Food in Room  39
	DB SprGfxFoodCanIdx+1,           07Fh, 000h, 040h, 040h, 046h, 000h, 000h	; 60DD => @EB60	Yellow  Canned Food in Room 127
	DB SprGfxFoodCanIdx+1,           01Eh, 000h, 050h, 057h, 046h, 000h, 000h	; 60E5 => @EB68	Yellow  Canned Food in Room  30
	DB SprGfxFoodCanIdx+1,           00Ch, 000h, 060h, 060h, 043h, 000h, 000h	; 60ED => @EB70	Magenta Canned Food in Room  39
	DB SprGfxFoodCanIdx+1,           067h, 000h, 057h, 040h, 042h, 000h, 000h	; 60F5 => @EB78	Red     Canned Food in Room 103
	DB SprGfxFoodCanIdx+1,           041h, 000h, 057h, 067h, 042h, 000h, 000h	; 60FD => @EB80	Red     Canned Food in Room  65

	DB SprGfxFoodStrippedCandyIdx+1, 075h, 000h, 030h, 040h, 044h, 000h, 000h	; 6105 => @EB88	Room 117
	DB SprGfxFoodStrippedCandyIdx+1, 083h, 000h, 030h, 040h, 046h, 000h, 000h	; 610D => @EB90	Yellow  Stripped Candy Food in Room 131
	DB SprGfxFoodStrippedCandyIdx+1, 00Ch, 000h, 060h, 070h, 042h, 000h, 000h	; 6115 => @EB98	Red     Stripped Candy Food in Room  12
	DB SprGfxFoodStrippedCandyIdx+1, 068h, 000h, 057h, 040h, 043h, 000h, 000h	; 611D => @EBA0	Magenta Stripped Candy Food in Room 104
	DB SprGfxFoodStrippedCandyIdx+1, 045h, 000h, 057h, 046h, 045h, 000h, 000h	; 6125 => @EBA8
	DB SprGfxFoodStrippedCandyIdx+1, 046h, 000h, 043h, 07Bh, 045h, 000h, 000h	; 612D => @EBB0

	DB SprGfxFoodLegOfLambIdx+1,     086h, 000h, 047h, 060h, 043h, 000h, 000h	; 6135 => @EBB8	        Leg Of Lamb Food in Room 134
	DB SprGfxFoodLegOfLambIdx+1,     06Eh, 000h, 060h, 077h, 042h, 000h, 000h	; 613D => @EBC0	Red     Leg Of Lamb Food in Room 110
	DB SprGfxFoodLegOfLambIdx+1,     07Dh, 000h, 057h, 067h, 043h, 000h, 000h	; 6145 => @EBC8	Magetna Leg Of Lamb Food in Room 125
	DB SprGfxFoodLegOfLambIdx+1,     06Ah, 000h, 030h, 067h, 042h, 000h, 000h	; 614D => @EBD0	Red     Leg Of Lamb Food in Room 106
	DB SprGfxFoodLegOfLambIdx+1,     03Eh, 000h, 043h, 07Bh, 042h, 000h, 000h	; 6155 => @EBD8	        Leg Of Lamb Food in Room  62
	DB SprGfxFoodLegOfLambIdx+1,     035h, 000h, 057h, 067h, 043h, 000h, 000h	; 615D => @EBE0	        Leg Of Lamb Food in Room  53

	DB SprGfxFoodLollypopIdx+1,      02Bh, 000h, 040h, 080h, 046h, 000h, 000h	; 6165 => @EBE8
	DB SprGfxFoodLollypopIdx+1,      08Ah, 000h, 057h, 067h, 045h, 000h, 000h	; 616D => @EBF0
	DB SprGfxFoodLollypopIdx+1,      009h, 000h, 080h, 090h, 044h, 000h, 000h	; 6175 => @EBF8
	DB SprGfxFoodLollypopIdx+1,      070h, 000h, 080h, 090h, 043h, 000h, 000h	; 617D => @EC00
	DB SprGfxFoodLollypopIdx+1,      074h, 000h, 057h, 087h, 042h, 000h, 000h	; 6185 => @EC08
	DB SprGfxFoodLollypopIdx+1,      033h, 000h, 057h, 067h, 045h, 000h, 000h	; 618D => @EC10

	DB SprGfxFoodConeIdx+1,          078h, 000h, 037h, 037h, 047h, 000h, 000h	; 6195 => @EC18
	DB SprGfxFoodConeIdx+1,          08Ah, 000h, 07Fh, 07Fh, 047h, 000h, 000h	; 619D => @EC20
	DB SprGfxFoodConeIdx+1,          00Bh, 000h, 057h, 067h, 046h, 000h, 000h	; 61A5 => @EC28	Yellow Cone Food in Room 11
	DB SprGfxFoodConeIdx+1,          065h, 000h, 057h, 087h, 046h, 000h, 000h	; 61AD => @EC30
	DB SprGfxFoodConeIdx+1,          053h, 000h, 043h, 07Bh, 047h, 000h, 000h	; 61B5 => @EC38
	DB SprGfxFoodConeIdx+1,          04Ch, 000h, 06Bh, 07Bh, 046h, 000h, 000h	; 61BD => @EC40

	DB SprGfxFoodBowlIdx+1,          07Bh, 000h, 050h, 060h, 045h, 000h, 000h	; 61C5 => @EC48
	DB SprGfxFoodBowlIdx+1,          087h, 000h, 057h, 067h, 045h, 000h, 000h	; 61CD => @EC50
	DB SprGfxFoodBowlIdx+1,          00Dh, 000h, 030h, 067h, 043h, 000h, 000h	; 61D5 => @EC58
	DB SprGfxFoodBowlIdx+1,          066h, 000h, 043h, 087h, 043h, 000h, 000h	; 61DD => @EC60
	DB SprGfxFoodBowlIdx+1,          053h, 000h, 06Bh, 07Bh, 042h, 000h, 000h	; 61E5 => @EC68
	DB SprGfxFoodBowlIdx+1,          04Fh, 000h, 057h, 067h, 047h, 000h, 000h	; 61ED => @EC70

	DB SprGfxFoodAppleIdx+1,         07Eh, 000h, 037h, 080h, 044h, 000h, 000h	; 61F5 => @EC78	Green Apple Food in Room 126
	DB SprGfxFoodAppleIdx+1,         08Ch, 000h, 057h, 067h, 044h, 000h, 000h	; 61FD => @EC80
	DB SprGfxFoodAppleIdx+1,         070h, 000h, 030h, 090h, 044h, 000h, 000h	; 6205 => @EC88
	DB SprGfxFoodAppleIdx+1,         066h, 000h, 06Bh, 087h, 044h, 000h, 000h	; 620D => @EC90
	DB SprGfxFoodAppleIdx+1,         03Ch, 000h, 043h, 07Bh, 042h, 000h, 000h	; 6215 => @EC98
	DB SprGfxFoodAppleIdx+1,         039h, 000h, 043h, 07Bh, 042h, 000h, 000h	; 621D => @ECA0

	DB SprGfxFoodMilkBottleIdx+1,    07Eh, 000h, 087h, 080h, 047h, 000h, 000h	; 6225 => @ECA8	White Milk Bottle Food in Room 126
	DB SprGfxFoodMilkBottleIdx+1,    024h, 000h, 060h, 070h, 047h, 000h, 000h	; 622D => @ECB0	White Milk Bottle Food in Room  36
	DB SprGfxFoodMilkBottleIdx+1,    070h, 000h, 057h, 090h, 047h, 000h, 000h	; 6235 => @ECB8
	DB SprGfxFoodMilkBottleIdx+1,    012h, 000h, 057h, 040h, 047h, 000h, 000h	; 623D => @ECC0
	DB SprGfxFoodMilkBottleIdx+1,    05Eh, 000h, 057h, 067h, 047h, 000h, 000h	; 6245 => @ECC8
	DB SprGfxFoodMilkBottleIdx+1,    01Dh, 000h, 030h, 067h, 047h, 000h, 000h	; 624D => @ECD0

	DB SprGfxFoodCanIdx+1,           017h, 000h, 040h, 040h, 042h, 000h, 000h	; 6255 => @ECD8
	DB SprGfxFoodCanIdx+1,           073h, 000h, 030h, 067h, 042h, 000h, 000h	; 625D => @ECE0	Red     Canned Food in Room 115
	DB SprGfxFoodCanIdx+1,           007h, 000h, 057h, 067h, 043h, 000h, 000h	; 6265 => @ECE8
	DB SprGfxFoodCanIdx+1,           002h, 000h, 057h, 067h, 043h, 000h, 000h	; 626D => @ECF0

	DB SprGfxFoodStrippedCandyIdx+1, 00Fh, 000h, 057h, 067h, 043h, 000h, 000h	; 6275 => @ECF8
	DB SprGfxFoodStrippedCandyIdx+1, 03Ah, 000h, 030h, 048h, 043h, 000h, 000h	; 627D => @ED00
	DB SprGfxFoodStrippedCandyIdx+1, 041h, 000h, 080h, 067h, 042h, 000h, 000h	; 6285 => @ED08
	DB SprGfxFoodStrippedCandyIdx+1, 085h, 000h, 043h, 07Bh, 042h, 000h, 000h	; 628D => @ED10	Red    Stripped Candy Food in Room 133

	DB SprGfxFoodLegOfLambIdx+1,     06Ch, 000h, 057h, 047h, 043h, 000h, 000h	; 6295 => @ED18
	DB SprGfxFoodLegOfLambIdx+1,     03Ah, 000h, 057h, 048h, 043h, 000h, 000h	; 629D => @ED20
	DB SprGfxFoodLegOfLambIdx+1,     069h, 000h, 030h, 040h, 003h, 000h, 000h	; 62A5 => @ED28
	DB SprGfxFoodLegOfLambIdx+1,     080h, 000h, 030h, 040h, 003h, 000h, 000h	; 62AD => @ED30

	DB SprGfxFoodLollypopIdx+1,      004h, 000h, 057h, 067h, 042h, 000h, 000h	; 62B5 => @ED38
	DB SprGfxFoodLollypopIdx+1,      04Bh, 000h, 030h, 088h, 042h, 000h, 000h	; 62BD => @ED40
	DB SprGfxFoodLollypopIdx+1,      011h, 000h, 057h, 067h, 046h, 000h, 000h	; 62C5 => @ED48
	DB SprGfxFoodLollypopIdx+1,      080h, 000h, 057h, 040h, 044h, 000h, 000h	; 62CD => @ED50

	DB SprGfxFoodConeIdx+1,          069h, 000h, 030h, 067h, 046h, 000h, 000h	; 62D5 => @ED58
	DB SprGfxFoodConeIdx+1,          035h, 000h, 057h, 090h, 046h, 000h, 000h	; 62DD => @ED60
	DB SprGfxFoodConeIdx+1,          069h, 000h, 030h, 090h, 046h, 000h, 000h	; 62E5 => @ED68
	DB SprGfxFoodConeIdx+1,          080h, 000h, 080h, 080h, 044h, 000h, 000h	; 62ED => @ED70

	DB SprGfxFoodBowlIdx+1,          057h, 000h, 057h, 040h, 046h, 000h, 000h	; 62F5 => @ED78	        Bowl Food in Room 87
	DB SprGfxFoodBowlIdx+1,          035h, 000h, 057h, 040h, 046h, 000h, 000h	; 62FD => @ED80	        Bowl Food in Room 53
	DB SprGfxFoodBowlIdx+1,          025h, 000h, 06Bh, 07Bh, 043h, 000h, 000h	; 6305 => @ED88	Magenta Bowl Food in Room 37
	DB SprGfxFoodBowlIdx+1,          01Bh, 000h, 057h, 067h, 044h, 000h, 000h	; 630D => @ED90	        Bowl Food in Room 27

	DB SprGfxFoodAppleIdx+1,         058h, 000h, 057h, 040h, 044h, 000h, 000h	; 6315 => @ED98	Green Apple Food in Room  88
	DB SprGfxFoodAppleIdx+1,         04Eh, 000h, 067h, 040h, 042h, 000h, 000h	; 631D => @EDA0	      Apple Food in Room  78
	DB SprGfxFoodAppleIdx+1,         037h, 000h, 057h, 067h, 046h, 000h, 000h	; 6325 => @EDA8	      Apple Food in Room  55
	DB SprGfxFoodAppleIdx+1,         085h, 000h, 06Bh, 07Bh, 044h, 000h, 000h	; 632D => @EDB0	Green Apple Food in Room 133

	DB SprGfxFoodMilkBottleIdx+1,    05Bh, 000h, 057h, 067h, 047h, 000h, 000h	; 6335 => @EDB8	White Milk Bottle Food in Room  91
	DB SprGfxFoodMilkBottleIdx+1,    04Eh, 000h, 040h, 067h, 047h, 000h, 000h	; 633D => @EDC0	White Milk Bottle Food in Room  78
	DB SprGfxFoodMilkBottleIdx+1,    049h, 000h, 057h, 067h, 047h, 000h, 000h	; 6345 => @EDC8	White Milk Bottle Food in Room  73
	DB SprGfxFoodMilkBottleIdx+1,    028h, 000h, 057h, 067h, 047h, 000h, 000h	; 634D => @EDD0	White Milk Bottle Food in Room  40

FoodObjectsTableEnd:   equ ($+InGameOffset)   ; 6355 => @EDD8

	DB SprGfxMushroomIdx+1,          050h, 000h, 057h, 040h, 042h, 000h, 000h	; 6355 => @EDD8
	DB SprGfxMushroomIdx+1,          043h, 000h, 06Bh, 054h, 042h, 001h, 000h	; 635D => @EDE0
	DB SprGfxMushroomIdx+1,          040h, 000h, 043h, 07Bh, 042h, 002h, 000h	; 6365 => @EDE8
	DB SprGfxMushroomIdx+1,          08Fh, 000h, 057h, 08Fh, 042h, 003h, 000h	; 636D => @EDF0
	DB SprGfxMushroomIdx+1,          08Fh, 000h, 043h, 07Bh, 042h, 004h, 000h	; 6375 => @EDF8
	DB SprGfxMushroomIdx+1,          08Fh, 000h, 06Bh, 07Bh, 042h, 005h, 000h	; 637D => @EE00
	DB SprGfxMushroomIdx+1,          045h, 000h, 080h, 067h, 042h, 006h, 000h	; 6385 => @EE08
	DB SprGfxMushroomIdx+1,          038h, 000h, 06Bh, 054h, 042h, 007h, 000h	; 638D => @EE10
	DB SprGfxMushroomIdx+1,          074h, 000h, 030h, 040h, 042h, 006h, 000h	; 6395 => @EE18
	DB SprGfxMushroomIdx+1,          074h, 000h, 030h, 088h, 042h, 005h, 000h	; 639D => @EE20
	DB SprGfxMushroomIdx+1,          074h, 000h, 078h, 088h, 042h, 004h, 000h	; 63A5 => @EE28
	DB SprGfxMushroomIdx+1,          074h, 000h, 080h, 040h, 042h, 003h, 000h	; 63AD => @EE30
	DB SprGfxMushroomIdx+1,          054h, 000h, 057h, 040h, 042h, 002h, 000h	; 63B5 => @EE38
	DB SprGfxMushroomIdx+1,          03Bh, 000h, 043h, 07Bh, 042h, 001h, 000h	; 63BD => @EE40
	DB SprGfxMushroomIdx+1,          03Bh, 000h, 06Bh, 07Bh, 042h, 000h, 000h	; 63C5 => @EE48
	DB SprGfxMushroomIdx+1,          053h, 000h, 080h, 040h, 042h, 001h, 000h	; 63CD => @EE50

;temp: 49, 49, 78, (FE), 152, (FF), 94
	DB 031h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 63D5 => @EE58

	; Transient Ghosts are located here.  They spawn start up with the SprGfxSpawnIdx sprite (87-90) and then
	; manifest into a ghost (Spider, Monster, Rabbit, Ghoul, Ghost, Bat etc.).
	; During play, monsters requrie 16 bytes instead of normal 8 so there are 3 slots here.
	; The whole map allows for a max of 3 ghosts.  As ghosts are "spawned up" in the current room, the replace
	; ghosts that exist in previous rooms (which still exist when re-entered until replaced)

	; Ghost Slots use (IX+0Fh) as follows:
	; When a ghost spawns, it is set to 80h (128).  While the player is in the same room as the ghost, the value doesn't change.
	; When I player leaves the room, ghosts that are alive in other rooms will see this count decrement every frame.
	; While the value is non-zero, the slot cannot be used for spawning a new ghost.  Once the value reaches zero, the slot can be
	; reused to spawn a new ghost in a different room.

GhostObjectsTable   equ ($+InGameOffset)   ; =EE60

	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 63DD => @EE60
	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 63E5 => @EE68
	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 63ED => @EE70
	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 63F5 => @EE78
	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 63FD => @EE80
	DB 000h,                         000h, 000h, 000h, 000h, 000h, 000h, 000h	; 6405 => @EE88

	; Mosters are located here.
	; During play, monsters requrie 16 bytes instead of normal 8.
	; (IX+08) = DX required to move object closer to target (usually -1 0 or +1)
	; (IX+09) = DY required to move object closer to target (usually -1 0 or +1)
	DB SprGfxMonsterMummyIdx+1,      017h, 000h, 050h, 050h, 047h, 000h, 000h	; 640D => @EE90
	DB 000h,                         000h, 000h, 068h, 068h, 000h, 000h, 000h	; 6415 => @EE98
	DB SprGfxMonsterDraculaIdx+1,    06Dh, 000h, 050h, 050h, 044h, 000h, 000h	; 641D => @EEA0
	DB 000h,                         000h, 000h, 072h, 072h, 000h, 000h, 000h	; 6425 => @EEA8
	DB SprGfxMonsterDevilIdx+1,      043h, 000h, 050h, 050h, 043h, 000h, 000h	; 642D => @EEB0
	DB 000h,                         000h, 000h, 072h, 072h, 000h, 000h, 000h	; 6435 => @EEB8
	DB SprGfxMonsterFrankensteinIdx+1,055h,000h, 050h, 050h, 042h, 000h, 000h	; 643D => @EEC0
	DB 000h,                         000h, 000h, 050h, 060h, 000h, 000h, 000h	; 6445 => @EEC8
	DB SprGfxMonsterHunchbackIdx+1,  056h, 000h, 058h, 038h, 042h, 000h, 000h	; 644D => @EED0
	DB 000h,                         000h, 000h, 050h, 060h, 000h, 000h, 000h	; 6455 => @EED8


BackgroundTables EQU ($+InGameOffset)                                    		; 645D => @EEE0

;	This table is all the background items for all the screens.
;   If an item is connected to another item on another screen (door, trapdoor, clock, bookshelf, clock)
;   then the item it is connected to the item immediately before or immediately after the entry depending
;   on if it is an odd or even entry eg. 0 connects to 1, 3 connects to 2. etc.
;
;	The table contains 538 (224h) items.  At 8 bytes per entry, the block is 4384 (1120h) bytes long.
;
;		type	offset	description
;		BYTE	00	graphic: graphic representaion of this entry.	Min=1; Max = 39
;		BYTE	01	screen: screen this entry belongs to.	Min=0; Max = 148
;		BYTE	02	unknown but common 0x34,0x38,0xc4 (0 if not a door)
;		    		Value   HValue Count
;		    		    0     00h   138
;		    		   52     34h   402
;		    		   56     38h     5
;		    		  116     74h     1
;		    		  196     C4h     2
;
;		BYTE	03	x position
;		BYTE	04	y position
;		BYTE	05	flags - (do not fully understand)
;		    		[0000xxxx] 0x00 North (unrotated)
;		    		[0110xxxx] 0x60 East
;		    		[1000xxxx] 0x80 South
;		    		[1110xxxx] 0xE0 West
;		    		[RRxxxxxx] R Rotates as above
;		    		[xxDxxxxx] D Flips the reflects the sprite before rotating it
;		    		or other common values...
;		    		0x41 - 0x11
;		    		0x04 - used if Sprite 18 (Table 0x12)
;		    		0x03 - used if Trapdoor 0x19
;		    		used by rug 0x1b
;		    		---- these are used by objects that are doors ----
;		    		0x01 - 0x10
;		    		0x61 - 0x10, 0x11
;		    		0x81 - 0x10, 0x11, 0x015, 0x16, 0x26
;		    		0xe1 - 0x10, 0x11, 0x1a, 0x26
;		BYTE	06	door timing? time a door is open or closed (0 if not a door)
;		BYTE	07	unknown (0 if not a door)
;		    		one of the flags (if set - stops door from closing)

645D:
;	   Background Item Sprite  Room -02- -X-  -Y-  Flag Time Unkn
	DB BkSprOpnRmDoorIdx+1,    007h,034h,050h,01Fh,000h,004h,056h	; ] North door in room 7 is connected to...
	DB BkSprOpnRmDoorIdx+1,    000h,034h,050h,0B7h,080h,004h,006h	; ] ... south door in room 0.

	DB BkSprOpnRmDoorIdx+1,    019h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    000h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorBluIdx+1, 001h,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorBluIdx+1, 000h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    002h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    001h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    003h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    002h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    004h,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    003h,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    019h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    004h,034h,080h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    005h,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    004h,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    006h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    005h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprLargeRmDoorIdx+1,  01Ah,038h,048h,0B6h,080h,016h,008h
	DB BkSprOpnRmDoorIdx+1,    006h,034h,050h,03Fh,000h,004h,056h

	DB BkSprLckRmDoorGrnIdx+1, 008h,034h,050h,01Fh,000h,004h,056h
	DB BkSprLckRmDoorGrnIdx+1, 006h,034h,050h,097h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    007h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    006h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    009h,034h,050h,01Fh,000h,004h,057h
	DB BkSprOpnRmDoorIdx+1,    008h,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    00Ah,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    009h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    00Bh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    00Ah,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    00Ch,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    00Bh,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    00Dh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    00Ch,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    00Eh,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    00Dh,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    00Fh,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    00Eh,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    010h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    00Fh,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorRedIdx+1, 011h,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorRedIdx+1, 010h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    012h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    011h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    013h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    012h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    014h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    013h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    015h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    014h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    016h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    015h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprLckRmDoorRedIdx+1, 017h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprLckRmDoorRedIdx+1, 016h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprLckRmDoorGrnIdx+1, 018h,034h,050h,01Fh,000h,004h,056h
	DB BkSprLckRmDoorGrnIdx+1, 017h,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    018h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    002h,034h,050h,03Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    01Ah,034h,050h,028h,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    01Bh,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    01Bh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLargeRmDoorIdx+1,  01Ch,074h,008h,077h,0E0h,008h,0F5h

	DB BkSprOpnRmDoorIdx+1,    01Ch,034h,098h,06Fh,060h,0AFh,003h
	DB BkSprOpnCvnDoorIdx+1,   01Dh,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    01Eh,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    01Fh,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    01Fh,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    020h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    020h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    021h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    021h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    022h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    022h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    023h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    023h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    024h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    024h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    025h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorBluIdx+1,    025h,034h,050h,01Fh,000h,004h,056h
	DB BkSprLckRmDoorBluIdx+1,    01Eh,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    024h,034h,050h,03Fh,000h,004h,056h
	DB BkSprLargeRmDoorIdx+1,  026h,038h,048h,0B6h,080h,016h,008h

	DB BkSprOpnRmDoorIdx+1,    002h,034h,050h,097h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    026h,034h,050h,028h,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    027h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    028h,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorBluIdx+1,    028h,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorBluIdx+1,    029h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    029h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    02Ah,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    02Ah,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    02Bh,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    02Bh,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    02Ch,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    02Ch,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    02Dh,034h,050h,0B7h,080h,004h,006h

	DB BkSprLckRmDoorGrnIdx+1, 02Dh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorGrnIdx+1, 02Eh,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    02Eh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    027h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    027h,034h,050h,01Fh,000h,004h,056h
	DB BkSprLargeRmDoorIdx+1,  02Fh,038h,048h,0B6h,080h,016h,008h

	DB BkSprLckRmDoorYelIdx+1, 020h,034h,050h,097h,080h,004h,006h
	DB BkSprLckRmDoorYelIdx+1, 02Fh,034h,050h,028h,000h,004h,056h

	DB BkSprOpnCvnDoorIdx+1,   030h,034h,050h,0A7h,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   031h,034h,050h,027h,000h,004h,056h

	DB BkSprOpnCvnDoorIdx+1,   031h,034h,050h,0AFh,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   032h,034h,050h,027h,000h,004h,056h

	DB BkSprOpnCvnDoorIdx+1,   032h,034h,050h,0AFh,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   033h,034h,050h,02Fh,000h,004h,056h

	DB BkSprOpnCvnDoorIdx+1,   033h,034h,050h,0A7h,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   034h,034h,050h,027h,000h,004h,056h

	DB BkSprOpnCvnDoorIdx+1,   034h,034h,050h,0AFh,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   035h,034h,050h,02Fh,000h,004h,056h

	DB BkSprOpnCvnDoorIdx+1,   033h,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   036h,034h,010h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   036h,034h,098h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   037h,034h,010h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   037h,034h,098h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   038h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   038h,034h,050h,0A7h,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   039h,034h,050h,02Fh,000h,004h,056h

	DB BkSprLckCvnDoorGrnIdx+1,038h,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprLckCvnDoorGrnIdx+1,03Ah,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   039h,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   03Bh,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   03Ah,034h,050h,0A7h,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   03Bh,034h,050h,02Fh,000h,004h,056h

	DB BkSprLckCvnDoorGrnIdx+1,03Bh,034h,050h,0A7h,080h,004h,006h
	DB BkSprLckCvnDoorGrnIdx+1,03Ch,034h,050h,02Fh,000h,004h,056h

	DB BkSprOpnCvnDoorIdx+1,   03Bh,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   03Dh,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   03Ch,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   03Eh,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   03Dh,034h,050h,0A7h,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   03Eh,034h,050h,02Fh,000h,004h,056h

	DB BkSprLckCvnDoorBluIdx+1,03Dh,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprLckCvnDoorBluIdx+1,03Fh,034h,010h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   03Fh,034h,098h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   040h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   040h,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   041h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   040h,034h,050h,02Fh,000h,004h,056h
	DB BkSprOpnCvnDoorIdx+1,   042h,034h,050h,0AFh,080h,004h,006h

	DB BkSprOpnCvnDoorIdx+1,   042h,034h,050h,027h,000h,004h,056h
	DB BkSprOpnCvnDoorIdx+1,   043h,034h,050h,0A7h,080h,004h,006h

	DB BkSprOpnCvnDoorIdx+1,   043h,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   044h,034h,010h,06Fh,0E0h,006h,003h

	DB BkSprLckCvnDoorRedIdx+1,044h,034h,098h,06Fh,060h,0B7h,003h
	DB BkSprLckCvnDoorRedIdx+1,045h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   043h,034h,050h,02Fh,000h,004h,056h
	DB BkSprOpnCvnDoorIdx+1,   046h,034h,050h,0A7h,080h,004h,006h

	DB BkSprOpnCvnDoorIdx+1,   046h,034h,018h,06Fh,0E0h,006h,003h
	DB BkSprOpnCvnDoorIdx+1,   047h,034h,098h,06Fh,060h,0B7h,003h

	DB BkSprLckCvnDoorRedIdx+1,047h,034h,010h,06Fh,0E0h,006h,003h
	DB BkSprLckCvnDoorRedIdx+1,048h,034h,090h,06Fh,060h,0B7h,003h

	DB BkSprOpnCvnDoorIdx+1,   048h,034h,050h,0A7h,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   049h,034h,050h,027h,000h,004h,056h

	DB BkSprLckCvnDoorBluIdx+1,048h,034h,018h,06Fh,0E0h,006h,003h
	DB BkSprLckCvnDoorBluIdx+1,04Ah,034h,098h,06Fh,060h,0B7h,003h

	DB BkSprOpnCvnDoorIdx+1,   04Ah,034h,010h,06Fh,0E0h,006h,003h
	DB BkSprOpnCvnDoorIdx+1,   04Bh,034h,090h,06Fh,060h,0B7h,003h

	DB BkSprOpnCvnDoorIdx+1,   04Bh,034h,050h,02Fh,000h,004h,056h
	DB BkSprOpnCvnDoorIdx+1,   04Ch,034h,050h,0A7h,080h,004h,006h

	DB BkSprOpnCvnDoorIdx+1,   048h,034h,050h,02Fh,000h,004h,056h
	DB BkSprOpnCvnDoorIdx+1,   04Dh,034h,050h,0AFh,080h,004h,006h

	DB BkSprLckCvnDoorRedIdx+1,04Dh,034h,050h,027h,000h,004h,056h
	DB BkSprLckCvnDoorRedIdx+1,04Eh,034h,050h,0A7h,080h,004h,006h

	DB BkSprOpnCvnDoorIdx+1,   04Eh,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   04Fh,034h,010h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   04Fh,034h,098h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   050h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   050h,034h,050h,0A7h,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   051h,034h,050h,027h,000h,004h,056h

	DB BkSprLckCvnDoorGrnIdx+1,050h,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprLckCvnDoorGrnIdx+1,052h,034h,010h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   052h,034h,098h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   053h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   01Dh,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   043h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   046h,034h,050h,02Fh,000h,004h,056h
	DB BkSprOpnCvnDoorIdx+1,   051h,034h,050h,0AFh,080h,004h,006h

	DB BkSprOpnCvnDoorIdx+1,   04Ch,034h,018h,06Fh,0E0h,006h,003h
	DB BkSprOpnCvnDoorIdx+1,   055h,034h,090h,06Fh,060h,0B7h,003h

	DB BkSprOpnCvnDoorIdx+1,   054h,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   055h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   054h,034h,018h,06Fh,0E0h,006h,003h
	DB BkSprOpnCvnDoorIdx+1,   030h,034h,090h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    02Dh,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    075h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    075h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    076h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    076h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    077h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    077h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    078h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    078h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    079h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    079h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    07Ah,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    07Ah,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    07Bh,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprLckRmDoorYelIdx+1, 07Bh,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprLckRmDoorYelIdx+1, 07Ch,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprLckRmDoorYelIdx+1, 07Ch,034h,050h,01Fh,000h,004h,056h
	DB BkSprLckRmDoorYelIdx+1, 07Dh,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    07Dh,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    076h,034h,050h,0B7h,080h,004h,006h

	DB BkSprLckRmDoorRedIdx+1, 07Ah,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorRedIdx+1, 07Eh,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    07Eh,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    029h,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    021h,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    088h,034h,050h,0B7h,080h,004h,006h

	DB BkSprLckRmDoorGrnIdx+1, 07Fh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorGrnIdx+1, 080h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    080h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    082h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    082h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    081h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    081h,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    07Fh,034h,050h,0B7h,080h,004h,006h

	DB BkSprLckRmDoorBluIdx+1,    082h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorBluIdx+1,    087h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    087h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    088h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    087h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    08Bh,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    08Bh,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    08Ch,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorGrnIdx+1, 08Ch,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorGrnIdx+1, 08Dh,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorRedIdx+1, 083h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorRedIdx+1, 084h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    084h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    086h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    086h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    085h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    085h,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    083h,034h,050h,0B7h,080h,004h,006h

	DB BkSprLckRmDoorYelIdx+1, 084h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorYelIdx+1, 089h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    089h,034h,050h,01Fh,000h,004h,056h
	DB BkSprOpnRmDoorIdx+1,    08Dh,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    089h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    08Ah,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorGrnIdx+1, 08Ah,034h,050h,01Fh,000h,004h,056h
	DB BkSprLckRmDoorGrnIdx+1, 023h,034h,050h,0B7h,080h,004h,006h

	DB BkSprOpnRmDoorIdx+1,    013h,034h,008h,06Fh,0E0h,006h,003h
	DB BkSprOpnRmDoorIdx+1,    073h,034h,0A0h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    011h,034h,080h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    06Bh,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    06Bh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    06Ch,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorBluIdx+1,    06Ch,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorBluIdx+1,    003h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorGrnIdx+1, 00Fh,034h,080h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorGrnIdx+1, 06Dh,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    06Dh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    06Eh,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    06Eh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    005h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorBluIdx+1,    00Dh,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorBluIdx+1,    06Fh,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    06Fh,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    070h,034h,070h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    070h,034h,030h,01Fh,000h,004h,056h
	DB BkSprLargeRmDoorIdx+1,  071h,038h,048h,0B6h,080h,016h,008h

	DB BkSprOpnRmDoorIdx+1,    071h,034h,050h,028h,000h,004h,056h
	DB BkSprLargeRmDoorIdx+1,  072h,038h,048h,0B6h,080h,016h,008h

	DB BkSprOpnRmDoorIdx+1,    072h,034h,050h,028h,000h,004h,056h
	DB BkSprOpnCvnDoorIdx+1,   035h,034h,050h,0A7h,080h,004h,006h

	DB BkSprOpnCvnDoorIdx+1,   030h,034h,018h,06Fh,0E0h,006h,003h
	DB BkSprOpnCvnDoorIdx+1,   074h,034h,090h,06Fh,060h,0B7h,003h

	DB BkSprOpnRmDoorIdx+1,    056h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    057h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorGrnIdx+1, 057h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorGrnIdx+1, 058h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    058h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    059h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    05Ah,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    05Bh,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorRedIdx+1, 05Bh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorRedIdx+1, 05Ch,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorGrnIdx+1, 05Ch,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorGrnIdx+1, 05Dh,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorRedIdx+1, 05Eh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorRedIdx+1, 05Fh,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorRedIdx+1, 05Fh,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorRedIdx+1, 060h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    060h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    061h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    062h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    063h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    063h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    064h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorYelIdx+1, 064h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorYelIdx+1, 065h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnRmDoorIdx+1,    056h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    05Ah,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorBluIdx+1,    05Ah,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorBluIdx+1,    05Eh,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    05Eh,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    062h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    057h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    05Bh,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorGrnIdx+1, 05Bh,034h,030h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorGrnIdx+1, 05Fh,034h,030h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorBluIdx+1,    05Fh,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorBluIdx+1,    063h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    058h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    05Ch,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorRedIdx+1, 05Ch,034h,070h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorRedIdx+1, 060h,034h,070h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorBluIdx+1,    060h,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorBluIdx+1,    064h,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorYelIdx+1, 059h,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorYelIdx+1, 05Dh,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    05Dh,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    061h,034h,050h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    061h,034h,050h,0B7h,080h,004h,006h
	DB BkSprOpnRmDoorIdx+1,    065h,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorBluIdx+1,    067h,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorBluIdx+1,    056h,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorRedIdx+1, 068h,034h,050h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorRedIdx+1, 059h,034h,050h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorYelIdx+1, 069h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorYelIdx+1, 056h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorGrnIdx+1, 06Ah,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprLckRmDoorGrnIdx+1, 062h,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprLckRmDoorYelIdx+1, 066h,034h,030h,01Fh,000h,004h,056h
	DB BkSprLckRmDoorYelIdx+1, 05Bh,034h,070h,0B7h,080h,004h,006h

	DB BkSprLckRmDoorYelIdx+1, 066h,034h,070h,01Fh,000h,004h,056h
	DB BkSprLckRmDoorYelIdx+1, 05Ch,034h,030h,0B7h,080h,004h,006h

	DB BkSprLckRmDoorYelIdx+1, 066h,034h,030h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorYelIdx+1, 05Fh,034h,070h,01Fh,000h,004h,056h

	DB BkSprLckRmDoorYelIdx+1, 066h,034h,070h,0B7h,080h,004h,006h
	DB BkSprLckRmDoorYelIdx+1, 060h,034h,030h,01Fh,000h,004h,056h

	DB BkSprOpnRmDoorIdx+1,    065h,034h,0A0h,06Fh,060h,0B7h,003h
	DB BkSprOpnRmDoorIdx+1,    01Bh,034h,008h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   040h,034h,050h,0A7h,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   08Fh,034h,050h,02Fh,000h,004h,056h

	DB BkSprOpnCvnDoorIdx+1,   054h,034h,050h,0A7h,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   090h,034h,050h,02Fh,000h,004h,056h

	DB BkSprOpnCvnDoorIdx+1,   090h,034h,050h,0A7h,080h,004h,006h
	DB BkSprOpnCvnDoorIdx+1,   091h,034h,050h,02Fh,000h,004h,056h

	DB BkSprOpnCvnDoorIdx+1,   091h,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   092h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   092h,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   093h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   093h,034h,090h,06Fh,060h,0B7h,003h
	DB BkSprOpnCvnDoorIdx+1,   094h,034h,018h,06Fh,0E0h,006h,003h

	DB BkSprOpnCvnDoorIdx+1,   03Ah,034h,050h,02Fh,000h,004h,056h
	DB BkSprOpnCvnDoorIdx+1,   094h,034h,050h,0A7h,080h,004h,006h

	; Trapdoor / Rug Pairs
	DB BkSprTrapdoorOpnIdx+1,  073h,034h,050h,070h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      074h,034h,048h,074h,003h,000h,000h

	DB BkSprTrapdoorOpnIdx+1,  003h,034h,030h,070h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      065h,034h,038h,074h,003h,000h,000h

	DB BkSprTrapdoorOpnIdx+1,  061h,034h,050h,070h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      04Bh,034h,048h,074h,003h,000h,000h

	DB BkSprTrapdoorOpnIdx+1,  02Dh,034h,050h,090h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      08Dh,034h,048h,094h,003h,000h,000h

	DB BkSprTrapdoorOpnIdx+1,  076h,034h,050h,070h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      084h,034h,048h,074h,003h,000h,000h

	DB BkSprTrapdoorOpnIdx+1,  08Bh,034h,050h,070h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      06Ch,034h,048h,074h,003h,000h,000h

	DB BkSprTrapdoorOpnIdx+1,  08Dh,034h,050h,050h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      06Eh,034h,048h,054h,003h,000h,000h

	DB BkSprTrapdoorOpnIdx+1,  021h,034h,070h,070h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      003h,034h,068h,074h,003h,000h,000h

	DB BkSprTrapdoorOpnIdx+1,  015h,034h,050h,080h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      066h,034h,048h,074h,003h,000h,000h

	DB BkSprTrapdoorOpnIdx+1,  078h,034h,070h,070h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      08Ah,034h,068h,074h,003h,000h,000h

	DB BkSprTrapdoorOpnIdx+1,  029h,034h,050h,080h,003h,024h,0E4h
	DB BkSprBearRugIdx+1,      009h,034h,048h,074h,003h,000h,000h

	; Decorations
	DB BkSprGhostPictureIdx+1, 00Bh,000h,050h,097h,081h,000h,000h
	DB BkSprGhostPictureIdx+1, 00Ch,000h,050h,097h,081h,000h,000h

	DB BkSprBarrelPileIdx+1,   091h,000h,050h,08Fh,000h,000h,000h
	DB BkSprBarrelPileIdx+1,   03Dh,000h,05Fh,05Fh,000h,000h,000h

	DB BkSprSuitOfArmourIdx+1, 01Fh,000h,098h,067h,060h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 021h,000h,008h,067h,0E0h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 025h,000h,098h,067h,060h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 023h,000h,008h,067h,0E0h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 000h,000h,098h,03Fh,060h,000h,000h	; [Room 0: North Suit of Armour]
	DB BkSprSuitOfArmourIdx+1, 006h,000h,038h,047h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 000h,000h,098h,08Fh,060h,000h,000h	; [Room 0: South Suit of Armour]
	DB BkSprSuitOfArmourIdx+1, 006h,000h,078h,047h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 001h,000h,058h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 003h,000h,058h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 005h,000h,058h,0B7h,080h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 007h,000h,058h,0B7h,080h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 017h,000h,058h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 015h,000h,078h,097h,080h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 015h,000h,038h,097h,080h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 013h,000h,058h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 088h,000h,008h,03Fh,0E0h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 08Ah,000h,008h,047h,0E0h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 088h,000h,008h,08Fh,0E0h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 08Ah,000h,008h,087h,0E0h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 027h,000h,038h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 02Bh,000h,038h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 027h,000h,078h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 02Bh,000h,078h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 056h,000h,038h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 024h,000h,038h,047h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 056h,000h,078h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 024h,000h,078h,047h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 07Ch,000h,038h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 07Ah,000h,038h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 07Ch,000h,078h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 07Ah,000h,078h,027h,000h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 009h,000h,008h,03Fh,0E0h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 07Fh,000h,038h,0B7h,080h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 009h,000h,008h,08Fh,0E0h,000h,000h
	DB BkSprSuitOfArmourIdx+1, 07Fh,000h,078h,0B7h,080h,000h,000h

	DB BkSprTableIdx+1,        00Dh,000h,038h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        013h,000h,070h,090h,004h,0CCh,049h
	DB BkSprTableIdx+1,        063h,000h,038h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        05Dh,000h,070h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        018h,000h,048h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        088h,000h,070h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        07Ah,000h,038h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        081h,000h,070h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        018h,000h,058h,080h,004h,0CCh,049h
	DB BkSprTableIdx+1,        06Dh,000h,030h,090h,004h,0CCh,049h
	DB BkSprTableIdx+1,        05Bh,000h,038h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        05Ch,000h,070h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        06Ah,000h,078h,098h,004h,0CCh,049h
	DB BkSprTableIdx+1,        01Bh,000h,070h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        02Eh,000h,038h,057h,004h,0CCh,049h
	DB BkSprTableIdx+1,        07Dh,000h,048h,050h,004h,0CCh,049h
	DB BkSprTableIdx+1,        02Eh,000h,060h,07Fh,004h,0CCh,049h
	DB BkSprTableIdx+1,        07Dh,000h,058h,080h,004h,0CCh,049h
	DB BkSprTableIdx+1,        02Ah,000h,038h,057h,004h,0CCh,049h
	DB BkSprTableIdx+1,        02Dh,000h,030h,080h,004h,0CCh,049h
	DB BkSprTableIdx+1,        02Ah,000h,060h,07Fh,004h,0CCh,049h
	DB BkSprTableIdx+1,        02Dh,000h,070h,080h,004h,0CCh,049h

	DB BkSprAcgShieldIdx+1,    08Dh,000h,028h,067h,0E0h,000h,000h
	DB BkSprShield2Idx+1,      08Ch,000h,028h,067h,0E0h,000h,000h
	DB BkSprTrophyHornsIdx+1,  08Bh,000h,088h,06Fh,040h,000h,000h
	DB BkSprTrophyIdx+1,       08Ch,000h,088h,067h,040h,000h,000h
	DB BkSprAcgShieldIdx+1,    016h,000h,058h,037h,000h,000h,000h
	DB BkSprShield2Idx+1,      014h,000h,058h,097h,080h,000h,000h
	DB BkSprTrophyHornsIdx+1,  00Eh,000h,028h,057h,0E0h,000h,000h
	DB BkSprTrophyIdx+1,       012h,000h,088h,06Fh,040h,000h,000h
	DB BkSprAcgShieldIdx+1,    00Fh,000h,028h,067h,0E0h,000h,000h
	DB BkSprShield2Idx+1,      011h,000h,028h,067h,0E0h,000h,000h
	DB BkSprTrophyHornsIdx+1,  010h,000h,088h,06Fh,040h,000h,000h
	DB BkSprTrophyIdx+1,       073h,000h,058h,097h,080h,000h,000h
	DB BkSprAcgShieldIdx+1,    008h,000h,088h,067h,040h,000h,000h
	DB BkSprShield2Idx+1,      018h,000h,088h,067h,040h,000h,000h
	DB BkSprTrophyHornsIdx+1,  06Fh,000h,028h,067h,0E0h,000h,000h
	DB BkSprTrophyIdx+1,       00Eh,000h,028h,077h,0E0h,000h,000h
	DB BkSprPictureIdx+1,      000h,000h,028h,017h,000h,000h,000h
	DB BkSprShield2Idx+1,      019h,000h,058h,037h,000h,000h,000h
	DB BkSprGhostPictureIdx+1, 000h,000h,078h,01Ch,000h,000h,000h
	DB BkSprTrophyIdx+1,       00Bh,000h,058h,037h,000h,000h,000h
	DB BkSprAcgShieldIdx+1,    000h,000h,038h,0B7h,080h,000h,000h
	DB BkSprShield2Idx+1,      019h,000h,058h,097h,080h,000h,000h
	DB BkSprTrophyHornsIdx+1,  000h,000h,078h,0B7h,080h,000h,000h
	DB BkSprTrophyIdx+1,       00Bh,000h,058h,097h,081h,000h,000h
	DB BkSprGhostPictureIdx+1, 004h,000h,028h,047h,0E1h,000h,000h
	DB BkSprTrophyHornsIdx+1,  015h,000h,058h,037h,000h,000h,000h
	DB BkSprTrophyIdx+1,       004h,000h,028h,087h,0E0h,000h,000h
	DB BkSprPictureIdx+1,      014h,000h,058h,037h,000h,000h,000h
	DB BkSprGhostPictureIdx+1, 073h,000h,058h,03Ch,000h,000h,000h
	DB BkSprTrophyIdx+1,       06Eh,000h,058h,0B7h,080h,000h,000h
	DB BkSprAcgShieldIdx+1,    06Dh,000h,058h,0B7h,080h,000h,000h
	DB BkSprPictureIdx+1,      00Eh,000h,088h,06Fh,040h,000h,000h
	DB BkSprPictureIdx+1,      007h,000h,0A8h,06Fh,040h,000h,000h
	DB BkSprAcgShieldIdx+1,    006h,000h,038h,097h,080h,000h,000h
	DB BkSprAcgShieldIdx+1,    006h,000h,078h,097h,080h,000h,000h
	DB BkSprShield2Idx+1,      001h,000h,0A8h,067h,040h,000h,000h
	DB BkSprGhostPictureIdx+1, 018h,000h,028h,06Fh,0E1h,000h,000h
	DB BkSprShield2Idx+1,      017h,000h,0A8h,067h,040h,000h,000h
	DB BkSprTrophyHornsIdx+1,  087h,000h,038h,017h,000h,000h,000h
	DB BkSprTrophyIdx+1,       089h,000h,038h,0B7h,080h,000h,000h
	DB BkSprTrophyIdx+1,       087h,000h,078h,017h,000h,000h,000h
	DB BkSprTrophyHornsIdx+1,  089h,000h,078h,0B7h,080h,000h,000h
	DB BkSprShield2Idx+1,      000h,000h,008h,047h,0E0h,000h,000h
	DB BkSprTrophyIdx+1,       082h,000h,038h,0B7h,080h,000h,000h
	DB BkSprTrophyIdx+1,       000h,000h,008h,087h,0E0h,000h,000h
	DB BkSprTrophyHornsIdx+1,  082h,000h,078h,0B7h,080h,000h,000h
	DB BkSprGhostPictureIdx+1, 066h,000h,0A0h,047h,061h,000h,000h
	DB BkSprShield2Idx+1,      061h,000h,0A8h,06Fh,060h,000h,000h
	DB BkSprTrophyHornsIdx+1,  066h,000h,0A8h,087h,060h,000h,000h
	DB BkSprPictureIdx+1,      05Dh,000h,0A8h,06Fh,060h,000h,000h
	DB BkSprTrophyIdx+1,       066h,000h,008h,047h,0E0h,000h,000h
	DB BkSprShield2Idx+1,      065h,000h,058h,0B7h,080h,000h,000h
	DB BkSprAcgShieldIdx+1,    066h,000h,008h,087h,0E0h,000h,000h
	DB BkSprTrophyIdx+1,       064h,000h,058h,0B7h,080h,000h,000h
	DB BkSprGhostPictureIdx+1, 063h,000h,058h,0B7h,081h,000h,000h
	DB BkSprTrophyHornsIdx+1,  062h,000h,050h,0B7h,080h,000h,000h
	DB BkSprTrophyIdx+1,       070h,000h,038h,0B7h,080h,000h,000h
	DB BkSprTrophyHornsIdx+1,  00Dh,000h,008h,06Fh,0E0h,000h,000h
	DB BkSprShield2Idx+1,      070h,000h,078h,0B7h,080h,000h,000h
	DB BkSprTrophyIdx+1,       00Ch,000h,058h,037h,000h,000h,000h
	DB BkSprTrophyIdx+1,       009h,000h,0A8h,047h,040h,000h,000h
	DB BkSprTrophyHornsIdx+1,  07Fh,000h,008h,060h,0E0h,000h,000h
	DB BkSprGhostPictureIdx+1, 009h,000h,0A0h,087h,041h,000h,000h
	DB BkSprShield2Idx+1,      07Fh,000h,058h,017h,000h,000h,000h
	DB BkSprTrophyHornsIdx+1,  05Ah,000h,008h,047h,0E0h,000h,000h
	DB BkSprPictureIdx+1,      027h,000h,0A8h,047h,060h,000h,000h
	DB BkSprTrophyIdx+1,       05Ah,000h,008h,087h,0E0h,000h,000h
	DB BkSprShield2Idx+1,      027h,000h,0A8h,087h,060h,000h,000h
	DB BkSprAcgShieldIdx+1,    029h,000h,0A8h,047h,060h,000h,000h
	DB BkSprTrophyIdx+1,       07Eh,000h,0A8h,060h,060h,000h,000h
	DB BkSprGhostPictureIdx+1, 029h,000h,0A0h,087h,061h,000h,000h
	DB BkSprTrophyHornsIdx+1,  07Eh,000h,058h,0B7h,080h,000h,000h

	; Grandfather Clocks (Knight)
	DB BkSprClockIdx+1,        00Dh,034h,030h,027h,001h,004h,056h
	DB BkSprClockIdx+1,        013h,034h,030h,0B7h,081h,004h,006h
	DB BkSprClockIdx+1,        009h,034h,030h,027h,001h,004h,056h
	DB BkSprClockIdx+1,        017h,034h,030h,0B7h,081h,004h,006h
	DB BkSprClockIdx+1,        035h,034h,088h,06Fh,061h,0B7h,003h
	DB BkSprClockIdx+1,        08Fh,034h,018h,06Fh,0E1h,006h,003h
	DB BkSprClockIdx+1,        067h,034h,098h,06Fh,061h,0B7h,003h
	DB BkSprClockIdx+1,        068h,034h,008h,06Fh,0E1h,006h,003h
	DB BkSprClockIdx+1,        08Dh,034h,078h,04Fh,061h,0B7h,003h
	DB BkSprClockIdx+1,        022h,034h,028h,06Fh,0E1h,006h,003h
	DB BkSprClockIdx+1,        076h,034h,030h,027h,001h,004h,056h
	DB BkSprClockIdx+1,        075h,034h,030h,0B7h,081h,004h,006h

	; Bookshelfs (Wizard)
	DB BkSprBookshelfIdx+1,    00Ah,034h,040h,047h,000h,004h,056h
	DB BkSprBookshelfIdx+1,    016h,034h,040h,097h,080h,004h,006h
	DB BkSprBookshelfIdx+1,    03Dh,034h,048h,037h,000h,004h,056h
	DB BkSprBookshelfIdx+1,    049h,034h,050h,0AFh,080h,004h,006h
	DB BkSprBookshelfIdx+1,    069h,034h,040h,0B7h,080h,004h,006h
	DB BkSprBookshelfIdx+1,    06Ah,034h,040h,027h,000h,004h,056h
	DB BkSprBookshelfIdx+1,    06Ch,034h,040h,0B7h,080h,004h,006h
	DB BkSprBookshelfIdx+1,    06Eh,034h,040h,027h,000h,004h,056h
	DB BkSprBookshelfIdx+1,    03Eh,034h,088h,077h,060h,0B7h,003h
	DB BkSprBookshelfIdx+1,    041h,034h,048h,0A7h,080h,004h,006h

	; Barrels (Serf)
	DB BkSprBarrelIdx+1,       045h,034h,050h,037h,000h,004h,056h
	DB BkSprBarrelIdx+1,       053h,034h,050h,0A4h,0A0h,004h,006h
	DB BkSprBarrelIdx+1,       04Ch,034h,088h,06Fh,040h,0B7h,003h
	DB BkSprBarrelIdx+1,       04Eh,034h,018h,06Fh,0E0h,006h,003h
	DB BkSprBarrelIdx+1,       038h,034h,050h,037h,000h,004h,056h
	DB BkSprBarrelIdx+1,       04Bh,034h,050h,0A7h,0A0h,004h,006h
	DB BkSprBarrelIdx+1,       06Bh,034h,050h,0B7h,0A0h,004h,006h
	DB BkSprBarrelIdx+1,       06Dh,034h,050h,027h,000h,004h,056h
	DB BkSprBarrelIdx+1,       08Ah,034h,098h,06Fh,060h,0B7h,003h
	DB BkSprBarrelIdx+1,       008h,034h,028h,06Fh,0E1h,006h,003h

	; ACG Door
	DB BkSprAcgDoorIdx+1,      000h,0C4h,098h,07Fh,040h,0BAh,0D6h	; ACG Door (Start Room)
	DB BkSprAcgDoorIdx+1,      08Eh,0C4h,000h,07Fh,0E0h,008h,0D6h	; ACG Door (End Game Room)

	DB BkSprSkeletonIdx+1,     053h,000h,080h,077h,061h,000h,000h
	DB BkSprSkeletonIdx+1,     08Fh,000h,080h,077h,061h,000h,000h
	DB BkSprSkeletonIdx+1,     033h,000h,018h,06Fh,0E1h,000h,000h
	DB BkSprSkeletonIdx+1,     055h,000h,050h,0A7h,081h,000h,000h

; ====================== END OF TEMPLATE COPY @ 757Dh ======================

; Index by screen.
; This is an address table by PlayerRoomNo.
; This gives an offset into the background item list.
BackLocPtr:        ; 757D
	DW 076A9h,076C3h,076CDh,076D7h
	DW 076E5h,076F1h,076FBh,0770Dh
	DW 07717h,07721h,07733h,0773Dh
	DW 07747h,07751h,0775Fh,0776Bh
	DW 07775h,0777Dh,07787h,0778Fh
	DW 0779Dh,077A7h,077B5h,077BFh
	DW 077CBh,077D9h,077E3h,077E9h
	DW 077F3h,077F9h,077FFh,07805h
	DW 0780Dh,07815h,07821h,07829h
	DW 07833h,0783Fh,07847h,0784Dh
	DW 0785Dh,07863h,07871h,0787Bh
	DW 07885h,0788Bh,07899h,078A3h
	DW 078A9h,078B1h,078B7h,078BDh
	DW 078C7h,078CDh,078D5h,078DBh
	DW 078E1h,078EBh,078F1h,078F9h
	DW 07903h,07909h,07915h,0791Dh
	DW 07923h,0792Dh,07933h,07939h
	DW 07943h,07949h,0794Fh,07957h
	DW 0795Dh,07967h,0796Dh,07973h
	DW 0797Dh,07985h,0798Bh,07993h
	DW 07999h,079A1h,079A7h,079ADh
	DW 079B5h,079BDh,079C5h,079D3h
	DW 079DBh,079E3h,079EBh,079F7h
	DW 07A05h,07A13h,07A1Fh,07A27h
	DW 07A33h,07A3Fh,07A4Bh,07A55h
	DW 07A61h,07A6Bh,07A77h,07A8Bh
	DW 07A91h,07A97h,07A9Dh,07AA5h
	DW 07AADh,07AB7h,07AC3h,07ACFh
	DW 07AD7h,07AE1h,07AE7h,07AEDh
	DW 07AF7h,07AFDh,07B05h,07B11h
	DW 07B17h,07B1Fh,07B25h,07B33h
	DW 07B39h,07B43h,07B4Dh,07B57h
	DW 07B61h,07B67h,07B6Fh,07B7Bh
	DW 07B81h,07B8Bh,07B91h,07B97h
	DW 07BA3h,07BAFh,07BBBh,07BC9h
	DW 07BD3h,07BDDh,07BEBh,07BEFh
	DW 07BF7h,07BFDh,07C05h,07C0Bh
	DW 07C11h,07C17h




BackLocLists:      ; 76A9
; Each room is described by a list of addresses to room decoration artifacts.
; So take Room 1 for example... it has only 4 addresses before the 0000h terminator.
; These addresses point to 4 door objects.  When cross referencing those door objects,
; the room they lead onto will be on adjacent in the object list.
; indexes to the address of each room can be found in BackLocPtr

76A9	; Room 0
	DW 0645Dh,0646Dh,0647Dh,0754Dh	; [South Door] [West Door] [North Blue Door] [East ACG Door]
	DW 0705Dh,0706Dh,0728Dh,0729Dh  ; [Suit of armour above ACG door] [Suit of armour above ACG door][][]
	DW 072ADh,072BDh,0735Dh,0736Dh
	DW 00000h

76C3	; Room 1
	DW 0647Dh,0648Dh,0707Dh,0731Dh
	DW 00000h

76CD	; Room 2
	DW 0648Dh,0649Dh,0661Dh,066EDh	; [East Door] [West Door] [North Door] [South Door]
	DW 00000h

76D7	; Room 3
	DW 0649Dh,064ADh,06C4Dh,06F7Dh
	DW 06FDDh,0707Dh,00000h

76E5	; Room 4
	DW 064ADh,064BDh,064CDh,072CDh	; [][East Door]
	DW 072DDh,00000h

76F1	; Room 5
	DW 064CDh,064DDh,06C7Dh,0708Dh
	DW 00000h

76FB	; Room 6
	DW 064DDh,064EDh,064FDh,0650Dh
	DW 0705Dh,0706Dh,0730Dh,0731Dh; [NE Suit of armour][NW Suit of armour][][]
	DW 00000h

770D	; Room 7
	DW 0645Dh,0650Dh,0708Dh,0730Dh
	DW 00000h

7717	; Room 8
	DW 064FDh,0651Dh,0726Dh,0753Dh
	DW 00000h

7721	; Room 9
	DW 0651Dh,0652Dh,0700Dh,0745Dh
	DW 0713Dh,0714Dh,073EDh,073FDh
	DW 00000h

7733	; Room 10
	DW 0652Dh,0653Dh,074ADh,072BDh
	DW 00000h

773D	; Room 11
	DW 0653Dh,0654Dh,0701Dh,0729Dh
	DW 00000h

7747	; Room 12
	DW 0654Dh,0655Dh,0701Dh,073DDh
	DW 00000h

7751	; Room 13
	DW 0655Dh,0656Dh,06C8Dh,0744Dh
	DW 0715Dh,073CDh,00000h

775F	; Room 14
	DW 0656Dh,0657Dh,0723Dh,0727Dh
	DW 072FDh,00000h

776B	; Room 15
	DW 0657Dh,0658Dh,06C5Dh,0724Dh
	DW 00000h

7775	; Room 16
	DW 0658Dh,0659Dh,0725Dh,00000h

777D	; Room 17
	DW 0659Dh,065ADh,06C2Dh,0724Dh
	DW 00000h

7787	; Room 18
	DW 065ADh,065BDh,0723Dh,00000h

0778F	; Room 19
	DW 065BDh,065CDh,06C1Dh,0715Dh
	DW 0744Dh,070ADh,00000h

779D	; Room 20
	DW 065CDh,065DDh,0722Dh,072DDh
	DW 00000h

77A7	; Room 21
	DW 065DDh,065EDh,06FEDh,072CDh
	DW 0709Dh,070ADh,00000h

77B5	; Room 22
	DW 065EDh,065FDh,0722Dh,074ADh
	DW 00000h

77BF	; Room 23
	DW 065FDh,0660Dh,0745Dh,0732Dh
	DW 0709Dh,00000h

77CB	; Room 24
	DW 0660Dh,0661Dh,0726Dh,0717Dh
	DW 0719Dh,0732Dh,00000h

77D9	; Room 25
	DW 0646Dh,064BDh,0728Dh,072ADh
	DW 00000h

77E3	; Room 26
	DW 064EDh,0662Dh,00000h

77E9	; Room 27
	DW 0662Dh,0663Dh,06EEDh,071BDh
	DW 00000h

77F3	; Room 28
	DW 0663Dh,0664Dh,00000h

77F9	; Room 29
	DW 0664Dh,069EDh,00000h

77FF	; Room 30
	DW 0665Dh,066CDh,00000h

7805	; Room 31
	DW 0665Dh,0666Dh,0703Dh,00000h

780D	; Room 32
	DW 0666Dh,0667Dh,0678Dh,00000h

7815	; Room 33
	DW 0667Dh,0668Dh,06AFDh,06FDDh
	DW 0703Dh,00000h

7821	; Room 34
	DW 0668Dh,0669Dh,0748Dh,00000h

7829	; Room 35
	DW 0669Dh,066ADh,06C0Dh,0704Dh
	DW 00000h

7833	; Room 36
	DW 066ADh,066BDh,066DDh,070FDh
	DW 0710Dh,00000h

783F	; Room 37
	DW 066BDh,066CDh,0704Dh,00000h

7847	; Room 38
	DW 066DDh,066EDh,00000h

784D	; Room 39
	DW 066FDh,0676Dh,0677Dh,070DDh
	DW 070EDh,0740Dh,0741Dh,00000h

785D	; Room 40
	DW 066FDh,0670Dh,00000h

7863	; Room 41
	DW 0670Dh,0671Dh,06AEDh,0700Dh
	DW 0742Dh,0743Dh,00000h

7871	; Room 42
	DW 0671Dh,0672Dh,071EDh,071FDh
	DW 00000h

787B	; Room 43
	DW 0672Dh,0673Dh,070DDh,070EDh
	DW 00000h

7885	; Room 44
	DW 0673Dh,0674Dh,00000h

788B	; Room 45
	DW 0674Dh,0675Dh,06A3Dh,06F9Dh
	DW 071EDh,071FDh,00000h

7899	; Room 46
	DW 0675Dh,0676Dh,071CDh,071DDh
	DW 00000h

78A3	; Room 47
	DW 0677Dh,0678Dh,00000h

78A9	; Room 48
	DW 0679Dh,06A2Dh,06CDDh,00000h

78B1	; Room 49
	DW 0679Dh,067ADh,00000h

78B7	; Room 50
	DW 067ADh,067BDh,00000h

78BD	; Room 51
	DW 067BDh,067CDh,067EDh,0756Dh
	DW 00000h

78C7	; Room 52
	DW 067CDh,067DDh,00000h

78CD	; Room 53
	DW 067DDh,06CCDh,0746Dh,00000h

78D5	; Room 54
	DW 067EDh,067FDh,00000h

78DB	; Room 55
	DW 067FDh,0680Dh,00000h

78E1	; Room 56
	DW 0680Dh,0681Dh,0682Dh,0751Dh
	DW 00000h

78EB	; Room 57
	DW 0681Dh,0683Dh,00000h

78F1	; Room 58
	DW 0682Dh,0684Dh,06F5Dh,00000h

78F9	; Room 59
	DW 0683Dh,0684Dh,0685Dh,0686Dh
	DW 00000h

7903	; Room 60
	DW 0685Dh,0687Dh,00000h

7909	; Room 61
	DW 0686Dh,0688Dh,0689Dh,074BDh
	DW 0702Dh,00000h

7915	; Room 62
	DW 0687Dh,0688Dh,074EDh,00000h

791D	; Room 63
	DW 0689Dh,068ADh,00000h

7923	; Room 64
	DW 068ADh,068BDh,068CDh,06EFDh
	DW 00000h

792D	; Room 65
	DW 068BDh,074EDh,00000h

7933	; Room 66
	DW 068CDh,068DDh,00000h

7939	; Room 67
	DW 068DDh,068EDh,0690Dh,069EDh
	DW 00000h

7943	; Room 68
	DW 068EDh,068FDh,00000h

7949	; Room 69
	DW 068FDh,074FDh,00000h

794F	; Room 70
	DW 0690Dh,0691Dh,069FDh,00000h

7957	; Room 71
	DW 0691Dh,0692Dh,00000h

0795D	; Room 72
	DW 0692Dh,0693Dh,0694Dh,0697Dh
	DW 00000h

07967	; Room 73
	DW 0693Dh,074BDh,00000h

0796D	; Room 74
	DW 0694Dh,0695Dh,00000h

07973	; Room 75
	DW 0695Dh,0696Dh,06F8Dh,0751Dh
	DW 00000h

0797D	; Room 76
	DW 0696Dh,06A0Dh,0750Dh,00000h

07985	; Room 77
	DW 0697Dh,0698Dh,00000h

0798B	; Room 78
	DW 0698Dh,0699Dh,0750Dh,00000h

07993	; Room 79
	DW 0699Dh,069ADh,00000h

07999	; Room 80
	DW 069ADh,069BDh,069CDh,00000h

079A1	; Room 81
	DW 069BDh,069FDh,00000h

079A7	; Room 82
	DW 069CDh,069DDh,00000h

079AD	; Room 83
	DW 069DDh,074FDh,0755Dh,00000h

079B5	; Room 84
	DW 06A1Dh,06A2Dh,06F0Dh,00000h

079BD	; Room 85
	DW 06A0Dh,06A1Dh,0756Dh,00000h

079C5	; Room 86
	DW 06CEDh,06DADh,06E6Dh,06E8Dh
	DW 070FDh,0710Dh,00000h

079D3	; Room 87
	DW 06CEDh,06CFDh,06DDDh,00000h

079DB	; Room 88
	DW 06CFDh,06D0Dh,06E0Dh,00000h

079E3	; Room 89
	DW 06D0Dh,06E3Dh,06E7Dh,00000h

079EB	; Room 90
	DW 06D1Dh,06DADh,06DBDh,0740Dh
	DW 0741Dh,00000h

079F7	; Room 91
	DW 06D1Dh,06D2Dh,06DDDh,06DEDh
	DW 06EADh,071ADh,00000h

07A05	; Room 92
	DW 06D2Dh,06D3Dh,06E0Dh,06E1Dh
	DW 06EBDh,071ADh,00000h

07A13	; Room 93
	DW 06D3Dh,06E3Dh,06E4Dh
	DW 0716Dh,0738Dh,00000h

07A1F	; Room 94
	DW 06D4Dh,06DBDh,06DCDh,00000h

07A27	; Room 95
	DW 06D4Dh,06D5Dh,06DEDh,06DFDh
	DW 06ECDh,00000h

07A33	; Room 96
	DW 06D5Dh,06D6Dh,06E1Dh
	DW 06E2Dh,06EDDh,00000h

07A3F	; Room 97
	DW 06D6Dh,06E4Dh,06E5Dh,06F8Dh
	DW 0737Dh,00000h

07A4B	; Room 98
	DW 06D7Dh,06DCDh,06E9Dh,073BDh
	DW 00000h

07A55	; Room 99
	DW 06D7Dh,06D8Dh,06DFDh,0716Dh
	DW 073BDh,00000h

07A61	; Room 100
	DW 06D8Dh,06D9Dh,06E2Dh,073ADh
	DW 00000h

07A6B	; Room 101
	DW 06D9Dh,06E5Dh,06EEDh,06F7Dh
	DW 0739Dh,00000h

07A77	; Room 102: Room with the YELLOW KEY
	DW 06EADh,06EBDh,06ECDh,06EDDh
	DW 06FEDh,0737Dh,0738Dh,0739Dh
	DW 073ADh,00000h

07A8B	; Room 103
	DW 06E6Dh,0747Dh,00000h

07A91	; Room 104
	DW 06E7Dh,0747Dh,00000h

07A97	; Room 105
	DW 06E8Dh,074CDh,00000h

07A9D	; Room 106
	DW 06E9Dh,074CDh,071BDh,00000h

07AA5	; Room 107
	DW 06C2Dh,06C3Dh,0752Dh,00000h

07AAD	; Room 108
	DW 06C3Dh,06C4Dh,06FBDh,074DDh
	DW 00000h

07AB7	; Room 109
	DW 06C5Dh,06C6Dh,0752Dh,072FDh
	DW 0719Dh,00000h

07AC3	; Room 110
	DW 06C6Dh,06C7Dh,06FCDh,074DDh
	DW 072EDh,00000h

07ACF	; Room 111
	DW 06C8Dh,06C9Dh,0727Dh,00000h

07AD7	; Room 112
	DW 06C9Dh,06CADh,073CDh,073DDh
	DW 00000h

07AE1	; Room 113
	DW 06CADh,06CBDh,00000h

07AE7	; Room 114
	DW 06CBDh,06CCDh,00000h

07AED	; Room 115
	DW 06C1Dh,06F6Dh,0725Dh,072EDh
	DW 00000h

07AF7	; Room 116
	DW 06CDDh,06F6Dh,00000h

07AFD	; Room 117
	DW 06A3Dh,06A4Dh,0749Dh,00000h

07B05	; Room 118
	DW 06A4Dh,06A5Dh,06ACDh,06FADh
	DW 0749Dh,00000h

07B11	; Room 119
	DW 06A5Dh,06A6Dh,00000h

07B17	; Room 120
	DW 06A6Dh,06A7Dh,06FFDh,00000h

07B1F	; Room 121
	DW 06A7Dh,06A8Dh,00000h

07B25	; Room 122
	DW 06A8Dh,06A9Dh,06ADDh,0718Dh
	DW 0711Dh,0712Dh,00000h

07B33	; Room 123
	DW 06A9Dh,06AADh,00000h

07B39	; Room 124
	DW 06AADh,06ABDh,0711Dh,0712Dh
	DW 00000h

07B43	; Room 125
	DW 06ABDh,06ACDh,071CDh
	DW 071DDh,00000h

07B4D	; Room 126
	DW 06ADDh,06AEDh
	DW 0742Dh,0743Dh,00000h

07B57	; Room 127
	DW 06B0Dh,06B3Dh,0713Dh,0714Dh
	DW 00000h

07B61	; Room 128
	DW 06B0Dh,06B1Dh,00000h

07B67	; Room 129
	DW 06B2Dh,06B3Dh,0718Dh,00000h

07B6F	; Room 130
	DW 06B1Dh,06B2Dh,06B4Dh,0735Dh
	DW 0736Dh,00000h

07B7B	; Room 131
	DW 06B9Dh,06BCDh,00000h

07B81	; Room 132
	DW 06B9Dh,06BADh,06BDDh,06FADh
	DW 00000h

07B8B	; Room 133
	DW 06BBDh,06BCDh,00000h

07B91	; Room 134
	DW 06BADh,06BBDh,00000h

07B97	; Room 135
	DW 06B4Dh,06B5Dh,06B6Dh,0733Dh
	DW 0734Dh,00000h

07BA3	; Room 136
	DW 06AFDh,06B5Dh,0717Dh,070BDh
	DW 070CDh,00000h

07BAF	; Room 137
	DW 06BDDh,06BEDh,06BFDh,0733Dh
	DW 0734Dh,00000h

07BBB	; Room 138
	DW 06BFDh,06C0Dh,06FFDh,0753Dh
	DW 070BDh,070CDh,00000h

07BC9	; Room 139
	DW 06B6Dh,06B7Dh,06FBDh,0721Dh
	DW 00000h

07BD3	; Room 140
	DW 06B7Dh,06B8Dh,0720Dh,0721Dh
	DW 00000h

07BDD	; Room 141
	DW 06B8Dh,06BEDh,06F9Dh,06FCDh
	DW 0720Dh,0748Dh,00000h

07BEB	; Room 142: Exit Room
	DW 0754Dh,00000h

07BEF	; Room 143
	DW 06EFDh,0746Dh,0755Dh,00000h

07BF7	; Room 144
	DW 06F0Dh,06F1Dh,00000h

07BFD	; Room 145
	DW 06F1Dh,06F2Dh,0702Dh,00000h

07C05	; Room 146
	DW 06F2Dh,06F3Dh,00000h

07C0B	; Room 147
	DW 06F3Dh,06F4Dh,00000h

07C11	; Room 148
	DW 06F4Dh,06F5Dh,00000h

07C17	; Room #149
	DW 00000h


Start:   ; 07C19h
		; Clear first 16 bytes
		LD   HL, StackTop
		LD   B,10
.loop1	LD   (HL),0
		INC  HL
		DJNZ .loop1

		; Clear Screen and Display Main Menu
7C23 	LD   HL,Font
7C26 	LD   (FontBase),HL
7C29 	CALL ClearFullScreen
7C2C 	CALL 0A311h
7C2F 	CALL ColourMenuItems

		; Read Keyboard for Main Menu
7C32 	LD   A,0F7h
7C34 	OUT   (0FDh),A
7C36 	IN   A,(0FEh)		; Read keys 1 to 5
7C38 	CPL
7C39 	LD   E,A
7C3A 	LD   A, (ControlFlags)
7C3D 	BIT  0,E			; 1 pressed? (Keyboard)
7C3F 	JR   Z,7C43h
7C41 	AND  0F9h			; xxxxx00x
7C43 	BIT  1,E			; 2 pressed? (Kempston Joystick)
7C45 	JR   Z,7C4Bh
7C47 	AND  0F9h
7C49 	OR   02h			; xxxxx01x
7C4B 	BIT  2,E			; 3 pressed? (Cursor)
7C4D 	JR   Z,7C53h
7C4F 	AND  0F9h
7C51 	OR   04h			; xxxxx10x
7C53 	BIT  3,E			; 4 pressed? (Knight)
7C55 	JR   Z,7C59h
7C57 	AND  0E7h			; xxx00xxx
7C59 	BIT  4,E			; 5 pressed? (Wizard)
7C5B 	JR   Z,7C61h
7C5D 	AND  0E7h
7C5F 	OR   08h			; xxx01xxx
7C61 	LD   D,A
7C62 	LD   A,0EFh
7C64 	OUT   (0FDh),A
7C66 	IN   A,(0FEh)		; Read keys 6 to 0
7C68 	CPL
7C69 	LD   E,A
7C6A 	LD   A,D
7C6B 	BIT  4,E			; 6 pressed? (Serf)
7C6D 	JR   Z,7C73h
7C6F 	AND  0E7h
7C71 	OR   10h			; xxx10xxx
7C73 	LD   (ControlFlags), A	; Save back revised options
7C76 	LD   C,A
7C77 	BIT  0,E			; 0 pressed? (Start Game)
7C79 	JP   NZ, StartGame
7C7C 	LD   HL, MenuOptionsColours
7C7F 	LD   B,03h
7C81 	LD   A,C
7C82 	CALL 7C90h
7C85 	LD   B,03h
7C87 	LD   A,C
7C88 	RRCA
7C89 	RRCA
7C8A 	CALL 7C90h
7C8D 	JP   7C2Fh

7C90 	RRCA
7C91 	AND  03h
7C93 	JR   Z,7C9Ch
7C95 	CALL 7CA4h
7C98 	DEC  A
7C99 	DJNZ $7C91
7C9B 	RET

7C9C 	CALL 7CABh
7C9F 	JR   7C98h

7CA1 	SET  7,(HL)
7CA3 	INC  HL
7CA4 	RES  7,(HL)
7CA6 	INC  HL
7CA7 	RET

7CA8 	RES  7,(HL)
7CAA 	INC  HL
7CAB 	SET  7,(HL)
7CAD 	INC  HL
7CAE 	RET

ColourMenuItems:   ; 7CAF
7CAF 	LD   HL,Font
7CB2 	LD   (FontBase),HL
7CB5 	LD   DE, MenuOptionsColours	; Colour table pointer stored in DE'
7CB8 	EXX
7CB9 	LD   HL,7CF1h
7CBC 	LD   DE,MenuOptionsTXT
7CBF 	LD   B,07h	                ; 7 menu items

		; Read menu item colour and save into variable
7CC1 	EXX
7CC2 	LD   A,(DE)
7CC3 	LD   (MenuItemColour),A
7CC6 	INC  DE
7CC7 	EXX

7CC8 	PUSH BC
7CC9 	LD   A,(HL)
7CCA 	INC  HL
7CCB 	PUSH HL
7CCC 	LD   H,A
7CCD 	LD   L,58h	; HL = Start of Attributes area
7CCF 	CALL L7D8A
7CD2 	EXX
7CD3 	POP  HL
7CD4 	POP  BC
7CD5 	INC  DE
7CD6 	DJNZ $7CC1
7CD8 	LD   HL,0B800h		; (Y=23 X=0)
7CDB 	LD   DE,CopyrightTXT
7CDE 	CALL PrintText
7CE1 	LD   HL,0020h		; (Y=0 X=4)
7CE4 	LD   DE,GameSelectionTXT
7CE7 	JP   PrintText


MenuOptionsColours:   ; 7CEA
	; These 7 bytes are the "current" colours of the 7 menu items
	; ("1 Keyboard" .. "0 Start Game").  Unselected items are 45h
	; (Bright Cyan) (Start Game is 47h/White) and selected items are
	; C5 (Flashing Bright Cyan).
	; DE' holds pointer to each items and value is read from here to
	; variable during drawing of menu (colours).  You can change these
	; values here for permiant change of menu colours - it's just bit
	; 7 that changes when selection changes.
	DB 045h,045h,045h,045h,045h,045h,047h


	DB 010h,028h,040h,058h,070h,088h,0A0h

MenuOptionsTXT:    ; 07CF8h
	DEFB "1  KEYBOAR", ("D"+80h)
	DEFB "2  KEMPSTON JOYSTIC", ("K"+80h)
	DEFB "3  CURSOR   JOYSTIC", ("K"+80h)
	DEFB "4  KNIGH", ("T"+80h)
	DEFB "5  WIZAR", ("D"+80h)
	DEFB "6  SER", ("F"+80h)
	DEFB "0  START GAM", ("E"+80h)

CopyrightTXT:      ; 07D51h
	DEFB 047h      ; BRIGHT WHITE
	; NOTE: Ascii character 25h (%) is used for (C) symbol
	DEFB "%1983 A.C.G. ALL RIGHTS RESERVE", ("D"+80h)

GameSelectionTXT:  ; 07D72h
	DEFB 047h      ; BRIGHT WHITE
	DEFB "ATICATAC GAME SELECTIO", ("N"+80h)

L7D8A:             ; 07D8Ah
7D8A 	PUSH HL
7D8B 	CALL CalcScreenAddr		; (L=X; H=Y)
7D8E 	LD   A, (MenuItemColour)
7D91 	EX   AF,AF'
7D92 	EXX
7D93 	POP  HL
7D94 	CALL CalcAttrAddr
7D97 	JP   0A1FFh


StartGame:	; User has just pressed 0 to start the game
7D9A 	CALL ClearSomeOtherWorkArea	; Clears memory (5E10-5FFF) 495d bytes

	; Set Lives remaining to 3
7D9D 	LD   A,03h
7D9F 	LD   (LivesLeft),A

	;
7DA2 	LD   HL,FoodObjectsTable	; Start Of Food Objects
7DA5 	LD   (NextRespawnFoodPtr),HL
7DA8 	CALL ClearFullScreen
7DAB 	CALL PrintPanel
7DAE 	CALL 0A2CEh
7DB1 	CALL 94B6h
7DB4 	CALL 98D2h
7DB7 	CALL 8D61h
7DBA 	CALL 94F5h
7DBD 	CALL 9443h
7DC0 	JP   9147h

	; MainLoop?
7DC3 	LD   SP, StackTop
7DC6 	EI
7DC7 	XOR  A
7DC8 	LD   (GhostsInRoom),A
7DCB 	LD   IX,0EAA8h

		; Are we playing the room (NZ) or drawing it (Z)?
7DCF 	LD   A,(RoomInPlay)
7DD2 	BIT  0,A
7DD4 	JR   NZ,7DDCh

7DD6 	LD   IX,BackgroundTables
7DDA 	JR   7E23h

7DDC 	LD   A,(FRAMES)
7DDF 	LD   C,A
7DE0 	LD   A,(5E03h)
7DE3 	CP   C
7DE4 	CALL NZ,7EB2h
7DE7 	LD   A,(PlayerRoomNo)
7DEA 	CP   (IX+01)
7DED 	LD   HL,7DF3h
7DF0 	JP   Z,7E7Eh
7DF3 	LD   DE,0008h
7DF6 	ADD  IX,DE
7DF8 	PUSH IX
7DFA 	POP  HL
7DFB 	LD   DE,GhostObjectsTable
7DFE 	AND  A
7DFF 	SBC  HL,DE
7E01 	JR   C,7DDCh
7E03 	LD   A,(FRAMES)
7E06 	LD   C,A
7E07 	LD   A,(5E03h)
7E0A 	CP   C
7E0B 	CALL NZ,7EB2h
7E0E 	LD   HL,7E13h
7E11 	JR   7E7Eh

7E13 	LD   DE,0010h
7E16 	ADD  IX,DE
7E18 	PUSH IX
7E1A 	POP  HL
7E1B 	LD   DE,BackgroundTables
7E1E 	AND  A
7E1F 	SBC  HL,DE
7E21 	JR   C,7E03h

	; Look up address of room
7E23 	LD   A,(PlayerRoomNo)
7E26 	LD   L,A
7E27 	LD   H,00
7E29 	ADD  HL,HL
7E2A 	LD   BC,BackLocPtr
7E2D 	ADD  HL,BC

	; Read
7E2E 	LD   A,(HL)	; HL = Address of Room entry in BackLocLists
7E2F 	INC  HL
7E30 	LD   H,(HL)
7E31 	LD   L,A	; HL = Address of room background objects (76A9 for Room #0)
7E32 	LD   (BackItemPointer),HL	; Save for each loop

		; Read the address of the next Background Item to draw
ReadNextBackgroundItem:  ; 7E35
7E35 	LD   HL,(BackItemPointer)
7E38 	LD   A,(HL)
7E39 	INC  HL
7E3A 	INC  HL
7E3B 	LD   (BackItemPointer),HL
7E3E 	DEC  HL
7E3F 	LD   H,(HL)
7E40 	LD   L,A
7E41 	OR   H
7E42 	JR   NZ,DrawBackgroundItem
		; No more background items to render
7E44 	LD   HL,(GameClock)
7E47 	INC  HL
7E48 	LD   (GameClock),HL

7E4B 	LD   HL, RoomInPlay
7E4E 	BIT  0,(HL)
7E50 	JR   NZ,7E55h
7E52 	CALL 9291h		; Call only if drawing the room
7E55 	LD   HL,RoomInPlay
7E58 	SET  0,(HL)
7E5A 	LD   HL,(5E05h)
7E5D 	LD   DE,(FRAMES)
7E61 	ADD  HL,DE
7E62 	LD   A,(GameClock)
7E65 	ADD  A,L
7E66 	LD   L,A
7E67 	LD   (5E05h),HL
7E6A 	CALL ReadCollectKey      ; Se if Collect Key is being pressed or not

IFDEF USE_MONITOR
7E6D 	CALL Monitor			 ; Debug - replace Pause Game with Montior routine
ELSE
7E6D 	CALL PauseGameCheck      ; Pause game if SPACE pressed.  Also does DI.
ENDIF

7E70 	CALL ConsiderRespawnFood
7E73 	LD   A,(PlayerRoomNo)
7E76 	CP   8Eh	; Are we in Room #142 (Congratulations/Finish Screen)
7E78 	JP   Z,GameCompleted
7E7B 	JP   7DC3h

7E7E 	PUSH HL
7E7F 	LD   HL,JumpTable1

RoutineDispatchIX:   ; 7E82
7E82 	LD   C,(IX+00)
RoutineDispatch:     ; 7E85
		; Calls the routine in lookup table referenced by HL indexed by C
7E85 	LD   B,00
7E87 	SLA  C
7E89 	RL   B
7E8B 	ADD  HL,BC
7E8C 	LD   A,(HL)
7E8D 	INC  HL
7E8E 	LD   H,(HL)
7E8F 	LD   L,A

	; Look up address of room
7E90 	JP   JumpHL


	; Draw Background Item
	; HL points to an entry in BackgroundTables of the object to draw
DrawBackgroundItem:   ; 7E93
7E93 	LD   BC,ReadNextBackgroundItem ; Stack the return address
7E96 	PUSH BC
7E97 	LD   BC,BackLocPtr
7E9A 	AND  A

	; Read
7E9B 	SBC  HL,BC
7E9D 	PUSH HL
7E9E 	POP  IX
7EA0 	LD   A,(PlayerRoomNo)
7EA3 	CP   (IX+01)                 ; Compare Current Room number with Room number of object
7EA6 	JR   Z,7EADh                 ; If mismatch then go to the following object (doors and trapdoors
7EA8 	LD   BC,0008h                ; are paired together and we want to render the correct door for the room)
7EAB 	ADD  IX,BC
7EAD 	LD   HL,JumpTable2           ; Use JumpTable2 for rendering
7EB0 	JR   RoutineDispatchIX

7EB2 	DI
7EB3 	PUSH IX
7EB5 	LD   A,01h
7EB7 	LD   (5E04h),A
7EBA 	LD   IX,PlayerSprite
7EBE 	LD   HL,7EC5h	; Stack the return address
7EC1 	PUSH HL
7EC2 	JP   7E7Fh

7EC5 	LD   DE,0008h
7EC8 	ADD  IX,DE
7ECA 	PUSH IX
7ECC 	POP  HL
7ECD 	LD   DE,0EAA8h
7ED0 	AND  A
7ED1 	SBC  HL,DE
7ED3 	JR   C,7EBEh
7ED5 	CALL UpdateTimer
7ED8 	LD   A,(FRAMES)
7EDB 	LD   (5E03h),A
7EDE 	XOR  A
7EDF 	LD   (5E04h),A
7EE2 	POP  IX
7EE4 	EI
7EE5 	RET


JumpTable1:        ; 07EE6h
	; Entry for each Sprite
	DW WaitRoutine

	DW KnightRoutine,KnightRoutine,KnightRoutine,KnightRoutine
	DW KnightRoutine,KnightRoutine,KnightRoutine,KnightRoutine
	DW KnightRoutine,KnightRoutine,KnightRoutine,KnightRoutine
	DW KnightRoutine,KnightRoutine,KnightRoutine,KnightRoutine

	DW WizardRoutine,WizardRoutine,WizardRoutine,WizardRoutine
	DW WizardRoutine,WizardRoutine,WizardRoutine,WizardRoutine
	DW WizardRoutine,WizardRoutine,WizardRoutine,WizardRoutine
	DW WizardRoutine,WizardRoutine,WizardRoutine,WizardRoutine

	DW SerfRoutine,SerfRoutine,SerfRoutine,SerfRoutine
	DW SerfRoutine,SerfRoutine,SerfRoutine,SerfRoutine
	DW SerfRoutine,SerfRoutine,SerfRoutine,SerfRoutine
	DW SerfRoutine,SerfRoutine,SerfRoutine,SerfRoutine

	DW 093E3h,WaitRoutine,WaitRoutine
	DW WizardShootRoutine,WizardShootRoutine,WizardShootRoutine,WizardShootRoutine

	DW ShootUpdateRoutine,ShootUpdateRoutine,ShootUpdateRoutine,ShootUpdateRoutine
	DW ShootUpdateRoutine,ShootUpdateRoutine,ShootUpdateRoutine,ShootUpdateRoutine

	DW KnightShootRoutine,KnightShootRoutine,KnightShootRoutine,KnightShootRoutine
	DW KnightShootRoutine,KnightShootRoutine,KnightShootRoutine,KnightShootRoutine

	DW WaitRoutine,WaitRoutine,WaitRoutine,WaitRoutine
	DW 0845Fh,0845Fh,0862Eh,0862Eh
	DW 08C63h,08C63h,08C63h,08C63h
	DW 08C63h,08C63h,08C63h,08C63h
	DW 085F7h,085F7h,085F7h,085F7h
	DW 0845Fh,0845Fh,08672h,08672h
	DW 0871Ah,0871Ah,087A6h,087A6h
	DW PlayKillGhostSound,PlayChangeRoomSound
	DW 08CB7h,08D45h
	DW 08672h,08672h,08301h,08301h
	DW 08787h,08787h,08787h,08787h
	DW 08862h,08862h,08862h,08862h
	DW 08988h,08988h,08988h,08988h
	DW 089EDh,089EDh,089EDh,089EDh
	DW 08906h,08906h,08906h,08906h
	DW 092F5h,092F5h,092F5h,092F5h
	DW 092F5h,092F5h,092F5h,092F5h
	DW 092F5h,092F5h,092F5h,092F5h
	DW 092F5h,092F5h,092F5h,095D7h
	DW 08A2Fh,08A2Fh,08A2Fh,08A2Fh
	DW 08A80h,08A80h,08A80h,08A80h
	DW 08A80h,08A80h,08A80h,08A80h
	DW 08AFFh,08AFFh,08AFFh,08AFFh
	DW PlayEatFoodSound,0988Bh

	; This JumpTable is used for rendering a Background Items in a room
	; Each routine handles a different background item (index by 1-based
	; background sprite index as found in (IX+00h).
	; IX holds the object to render
JumpTable2:        ; 0802Ah
	DW WaitRoutine
	DW ExecuteOpenDoor         ; 00 Open Cavern Door
	DW ExecuteOpenDoor         ; 01 Open Room Door
	DW ExecuteLargeDoor        ; 02 Large Room Door (top of stairs; always open)
	DW WaitRoutine
	DW WaitRoutine
	DW WaitRoutine
	DW WaitRoutine
	DW ExecuteLockedRoomDoor   ; 07 Red Room Door
	DW ExecuteLockedRoomDoor   ; 08 Green Room Door
	DW ExecuteLockedRoomDoor   ; 09 Blue Room Door
	DW ExecuteLockedRoomDoor   ; 10 Yellow Room Door
	DW ExecuteLockedCavernDoor ; 11 Red Cavern Door
	DW ExecuteLockedCavernDoor ; 12 Green Cavern Door
	DW ExecuteLockedCavernDoor ; 13 Blue Cavern Door
	DW ExecuteLockedCavernDoor ; 14 Yellow Cavern Door
	DW ExecuteClock            ; 15 Clock (Knight)
	DW ExecuteDecoration       ; 16 Ghost Picture
	DW ExecuteDecoration       ; 17 Table
	DW WaitRoutine             ; 18 Full Chicken
	DW WaitRoutine             ; 19 Empty Chicken
	DW ExecuteDecoration       ; 20 Trophy Horns
	DW ExecuteDecoration       ; 21 Trophy
	DW ExecuteBookshelf        ; 22 Bookshelf (Wizard)
	DW ExecuteTrapdoorClosed   ; 23 Trapdoor (Closed)
	DW ExecuteTrapdoorOpen     ; 24 Trapdoor (Open)
	DW ExecuteBarrel           ; 25 Barrel (Serf)
	DW ExecuteDecoration       ; 26 Bear Rug (Teleport Landing Point)
	DW ExecuteDecoration       ; 27 Acg Shield
	DW ExecuteDecoration       ; 28 Shield 2
	DW ExecuteDecoration       ; 29 Suit Of Armour
	DW WaitRoutine             ; 30
	DW ExecuteClosedDoor       ; 31 Closed Room Door
	DW ExecuteAltOpenDoor      ; 32 Alt Open Room Door
	DW ExecuteClosedDoor       ; 33 Closed Cavern Door
	DW ExecuteAltOpenDoor      ; 34 Alt Open Cavern Door
	DW ExecuteAcgDoor          ; 35 Acg Door
	DW ExecuteDecoration       ; 36 Picture
	DW ExecuteDecoration       ; 37 Skeleton
	DW ExecuteDecoration       ; 38 Pile of Barrels


WaitRoutine:  ; 807A
	; This routine looks to see if IX references one of the three
	; ghosts in the GhostObjectsTable.  It does this by checking if
	; IX is between GhostObjectsTable and GhostObjectsTable+30h.
	; If it is not reference a ghost, it exits.
	; Otherwise, it performs a 5000 t-state delay
807A 	PUSH IX
807C 	POP  HL
807D 	LD   DE,GhostObjectsTable
8080 	AND  A
8081 	SBC  HL,DE			; HL = IX-GhostObjectsTable where IX is points to item to draw
8083 	LD   A,H
8084 	AND  A
8085 	RET  NZ				; Exit if IX not in EExx range
8086 	LD   A,L
8087 	CP   30h            ; Size of 3 ghost slots
8089 	RET  NC             ; Exit if IX not in EE00-EE30 range
		; Time Delay [10 + 192 * (6 + 4 + 4 + 12) - 12 + 7 + 10] = 5007 t-states
808A 	LD   HL,00C0h       ; 10 t-states
808D 	DEC  HL             ;  6 t-states
808E 	LD   A,H            ;  4 t-states
808F 	OR   L              ;  4 t-states
8090 	JR   NZ,808Dh       ; 12 t-states (7 t-states on final)
8092 	RET                 ; 10 t-states


ClrGameWindow:     ; 8093
8093 	LD   HL,4000h
8096 	LD   BC,18C0h
8099 	XOR  A


; Fills in an area of the Attribute File with the value (colour) in A
; at address in HL of width B characters and height C.
FillAttrRect:        ; 809A
809A 	PUSH BC
809B 	PUSH HL
809C 	LD   DE,0020h
.loop:
809F 	LD   (HL),A
80A0 	INC  HL
80A1 	DJNZ .loop
80A3 	POP  HL
80A4 	ADD  HL,DE
80A5 	POP  BC
80A6 	DEC  C
80A7 	JR   NZ,FillAttrRect
80A9 	RET


ClearFullScreen:        ; 80AA
80AA 	CALL ClearAttr
80AD 	CALL ClearScreen
80B0 	XOR  A
80B1 	OUT  (0FEh),A
80B3 	RET


ClearScreen:            ; 80B4
80B4 	LD   HL,4000h
80B7 	LD   B,58h
ClearUpToB0:   ; 80B9
80B9 	LD   C,00h   	; C=Value to write
ClearUpToB:   ; 80BB
80BB 	LD   (HL),C
80BC 	INC  HL
80BD 	LD   A,H
80BE 	CP   B
80BF 	JR   NZ,ClearUpToB
80C1 	RET

ClearAttr:   ; 80C2
80C2 	LD   HL,5800h
80C5 	LD   B,5Bh
80C7 	LD   C,00h		; (Comment) Could have saved a couple of bytes by just calling ClearUpToB0
80C9 	JR   ClearUpToB

ClearSomeOtherWorkArea: ; (5E10-5FFF) 495d bytes
80CB 	LD   HL,WorkspaceStart
80CE 	LD   B,60h
80D0 	JR   ClearUpToB0


WizardRoutine:   ; 80D2
80D2 	LD   BC,2020h	; Player Speed (C=X; B=Y; Min=10h (v. slow); Max=40h (shot speed))
80D5 	LD   DE,2020h
80D8 	LD   HL,2020h
80DB 	CALL 8D77h
80DE 	LD   E,(IX+06h) ; dx (moving in X?)
80E1 	LD   D,(IX+07h)	; dy (moving in Y?)
80E4 	LD   A,D
80E5 	OR   E
80E6 	JR   Z,811Dh
		; Wizard is moving...
80E8 	LD   A,(FRAMES)
80EB 	AND  03h
80ED 	JR   NZ,811Dh
		; Cycle sprite animation
80EF 	LD   A,(IX+00h)
80F2 	AND  03h
80F4 	ADD  A,11h
80F6 	LD   (IX+00h),A
		; Compare magnitudes of dx and dy
80F9 	LD   A,D
80FA 	AND  A
80FB 	JP   P,8100h
80FE 	NEG
8100 	LD   C,A		; C=ABS(dy)
8101 	LD   A,E
8102 	AND  A
8103 	JP   P,8108h
8106 	NEG
8108 	CP   C			; A=ABS(dx); C=ABS(dy)
8109 	JR   NC,8128h	; Jump if dx > dy
810B 	LD   A,D
810C 	AND  A
810D 	LD   A,(IX+00h)
8110 	JP   M,8115h
8113 	ADD  A,04h		; Switch to Facing Right (=Down)
8115 	ADD  A,08h		; Switch from Horizontal Facing (lt/rt) to Vertical Facing (up/dn)
8117 	LD   (IX+00h),A	; Store

811A 	CALL PlayFootstepSound
811D 	CALL ScanKeys
8120 	AND  10h
8122 	CALL Z,WizardTryShoot	; Fire Key pressed!
8125 	JP   8E78h				; Fire Key Not Pressed

8128 	LD   A,E            ; A = DX
8129 	AND  A
812A 	LD   A,(IX+00h)     ; Facing Left
812D 	JP   M,8117h
8130 	ADD  A,04h          ; Switch to Facing Right
8132 	JR   8117h

KnightTryShoot:
8134 	LD   A,(ShotSprite)
8137 	AND  A
8138 	RET  NZ             ; Exit: Axe already thrown
8139 	LD   A,(InDoorway)
813C 	AND  A
813D 	RET  NZ             ; Exit: In a doorway
813E 	CALL 0A41Bh
8141 	CALL 817Ch
8144 	LD   HL,ShotSprite
8147 	LD   (HL),40h       ; Knight Axe = 40h-47h
8149 	JR   8160h

WizardTryShoot:
814B 	LD   A,(ShotSprite)
814E 	AND  A
814F 	RET  NZ	; Exit: Spell already thrown
8150 	LD   A,(InDoorway)
8153 	AND  A
8154 	RET  NZ             ; Exit: In a doorway
8155 	CALL LA438
8158 	CALL 817Ch
815B 	LD   HL,ShotSprite
815E 	LD   (HL),34h
8160 	INC  HL
8161 	LD   A,(IX+01h)
8164 	LD   (HL),A
8165 	INC  HL
8166 	INC  HL
8167 	LD   A,(IX+03h)
816A 	LD   (HL),A
816B 	INC  HL
816C 	LD   A,(IX+04h)
816F 	LD   (HL),A
8170 	PUSH IX
8172 	LD   IX,ShotSprite
8176 	CALL PrepAndRedrawSprite
8179 	POP  IX
817B 	RET

817C 	LD   HL,0EA9Eh
817F 	LD   A,30h
8181 	LD   (0EAA7h),A
8184 	LD   A,00h
8186 	LD   (0EA9Ah),A
8189 	LD   A,(IX+06h)
818C 	OR   (IX+07h)
818F 	JR   Z,81B3h
8191 	LD   A,(IX+06h)
8194 	AND  A
8195 	JR   Z,81A0h
8197 	JP   M,819Eh
819A 	LD   A,04h
819C 	JR   81A0h

819E 	LD   A,0FCh
81A0 	LD   (HL),A
81A1 	INC  HL
81A2 	LD   A,(IX+07h)
81A5 	AND  A
81A6 	JR   Z,81B1h
81A8 	JP   M,81AFh
81AB 	LD   A,04h
81AD 	JR   81B1h

81AF 	LD   A,0FCh
81B1 	LD   (HL),A
81B2 	RET

81B3 	LD   A,(IX+00h)
81B6 	DEC  A
81B7 	AND  0Ch
81B9 	JR   Z,81C9h
81BB 	CP   04h
81BD 	JR   Z,81CFh
81BF 	CP   08h
81C1 	JR   NZ,81D5h
81C3 	LD   (HL),00h
81C5 	INC  HL
81C6 	LD   (HL),0FCh
81C8 	RET

81C9 	LD   (HL),0FCh
81CB 	INC  HL
81CC 	LD   (HL),00h
81CE 	RET

81CF 	LD   (HL),04h
81D1 	INC  HL
81D2 	LD   (HL),00h
81D4 	RET

81D5 	LD   (HL),00h
81D7 	INC  HL
81D8 	LD   (HL),04h
81DA 	RET

KnightShootRoutine:   ; 81DB
81DB 	CALL PrepSpriteDraw
	; Animate axe to next frame (0..7)
81DE 	LD   A,(FRAMES)
81E1 	CPL
81E2 	RRA
81E3 	AND  07h
81E5 	ADD  A,SprGfxKnightAxeIdx+1
81E7 	LD   (IX+00h),A
81EA 	LD   (IX+05h),42h	; Set Flags to 42
81EE 	JR   8209h

WizardShootRoutine:   ; 81F0
81F0 	CALL PrepSpriteDraw
	; Animate spell to next frame (0..4)
81F3 	LD   A,(IX+00h)
81F6 	INC  A
81F7 	AND  03h
81F9 	ADD  A,SprGfxWizardSpellIdx+1
81FB 	LD   (IX+00h),A
81FE 	LD   A,(FRAMES)
8201 	RLA
8202 	AND  02h
8204 	ADD  A,45h
8206 	LD   (IX+05h),A         ; Alternate colour between BRIGHT WHITE and BRIGHT CYAN
8209 	LD   DE,(RoomSize)
820D 	LD   A,(PlayerRoomNo)
8210 	CP   (IX+01h)
8213 	JR   NZ, RemoveSpriteFromPlay
8215 	DEC  (IX+0Fh)
8218 	JR   Z,826Fh
821A 	BIT  0,(IX+02h)
821E 	JR   NZ,826Fh
8220 	LD   A,(IX+03h)
8223 	ADD  A,(IX+06h)
8226 	LD   C,A
8227 	SUB  58h
8229 	JP   P,822Eh
822C 	NEG
822E 	CP   E
822F 	JR   NC,825Dh
8231 	LD   A,(IX+04h)
8234 	ADD  A,(IX+07h)
8237 	LD   B,A
8238 	SUB  68h
823A 	JP   P,823Fh
823D 	NEG
823F 	CP   D
8240 	JR   NC,824Bh
8242 	LD   (IX+03h),C
8245 	LD   (IX+04h),B
8248 	JP   8E8Eh

824B 	LD   B,(IX+04h)
824E 	LD   A,(IX+07h)
8251 	NEG
8253 	LD   (IX+07h),A
8256 	PUSH BC
8257 	CALL PlayBounceBulletSound
825A 	POP  BC
825B 	JR   8242h

825D 	LD   C,(IX+03h)
8260 	LD   A,(IX+06h)
8263 	NEG
8265 	LD   (IX+06),A
8268 	PUSH BC
8269 	CALL PlayBounceBulletSound
826C 	POP  BC
826D 	JR   8231h

826F 	CALL 9F56h
8272 	CALL 0A445h
8275 	LD   A,(RoomColour)
8278 	LD   (IX+05h),A
827B 	CALL 0A01Ah

RemoveSpriteFromPlay:   ; 827E
		; Simply sets the Sprite Number to 0
827E 	LD   (IX+00h),00h
8282 	RET

SerfTryShoot:
	; Unlike the Wizard's Spell and Knight's Axe, the Serf's Sword is directional
	; (ShotSprite): 38=SwordDown; 3A=SwordRight; 3C=SwordUp; 3E=SwordLeft; 00=SwordNone
8283 	LD   A,(ShotSprite)
8286 	AND  A
8287 	RET  NZ	; Exit: Sword already thrown
8288 	LD   A,(InDoorway)
828B 	AND  A
828C 	RET  NZ             ; Exit: In a doorway
828D 	CALL LA427
8290 	CALL 817Ch
8293 	LD   C,00
8295 	LD   A,(HL)
8296 	AND  A
8297 	JR   Z,82B6h
8299 	JP   P,829Eh
829C 	LD   C,04h
829E 	DEC  HL
829F 	LD   A,(HL)
82A0 	AND  A
82A1 	JR   Z,82A7h
82A3 	JP   P,82B3h
82A6 	DEC  C
	; Apply Direction to Sword Sprite (0=Down;2=Right;4=Up;6=Left)
82A7 	LD   A,C
82A8 	AND  07h
82AA 	ADD  A,38h
82AC 	LD   HL,ShotSprite
82AF 	LD   (HL),A
82B0 	JP   8160h

82B3 	INC  C
82B4 	JR   82A7h

82B6 	DEC  HL
82B7 	BIT  7,(HL)
82B9 	JR   Z,82BFh
82BB 	LD   C,06h
82BD 	JR   82A7h

82BF 	LD   C,02h
82C1 	JR   82A7h

82C3 	LD   C,00h
82C5 	LD   A,(HL)
82C6 	AND  A
82C7 	JR   Z,82E4h
82C9 	JP   P,82CEh
82CC 	LD   C,04h
82CE 	DEC  HL
82CF 	LD   A,(HL)
82D0 	AND  A
82D1 	JR   Z,82D7h
82D3 	JP   P,82E1h
82D6 	DEC  C
82D7 	LD   A,C
82D8 	AND  07h
82DA 	ADD  A,38h
82DC 	LD   HL,ShotSprite
82DF 	LD   (HL),A
82E0 	RET

82E1 	INC  C
82E2 	JR   82D7h

82E4 	DEC  HL
82E5 	BIT  7,(HL)
82E7 	JR   Z,82EDh
82E9 	LD   C,06h
82EB 	JR   82D7h

82ED 	LD   C,02h
82EF 	JR   82D7h

ShootUpdateRoutine:   ; 82F1
	; This routine is called when a shot is in motion
82F1 	CALL PrepSpriteDraw
82F4 	LD   (IX+05h),46h
82F8 	LD   HL,0EA9Fh
82FB 	CALL 82C3h
82FE 	JP   8209h

8301 	LD   A,(PlayerRoomNo)
8304 	CP   (IX+01h)
8307 	JP   NZ, CountDownSpriteLife   ; Kill off sprite if no in same room as player
830A 	CALL PrepSpriteDraw
830D 	LD   HL,GhostsInRoom
8310 	INC  (HL)
8311 	CALL DetectCollsion
8314 	DEC  E
8315 	JP   Z,DoGhostDamage
8318 	CALL 8566h
831B 	DEC  E
831C 	JP   Z,875Fh
831F 	LD   (IX+0Fh),00h
8323 	LD   DE,(RoomSize)
8327 	LD   A,(IX+09h)
832A 	INC  A
832B 	AND  0Fh
832D 	LD   (IX+09h),A
8330 	JP   NZ,833Ah
8333 	LD   A,R
8335 	AND  07h
8337 	LD   (IX+08h),A
833A 	CALL 83BAh
833D 	LD   (IX+05h),43h
8341 	JR   NZ,8344h
8343 	INC  HL
8344 	LD   A,(HL)
8345 	BIT  1,(IX+08h)
8349 	JR   NZ,834Dh
834B 	NEG
834D 	ADD  A,(IX+04h)
8350 	LD   C,A
8351 	SUB  68h
8353 	JR   C,835Ah
8355 	CP   D
8356 	JR   NC,83A2h
8358 	JR   835Fh

835A 	NEG
835C 	CP   D
835D 	JR   NC,83A8h
835F 	LD   (IX+04h),C
8362 	CALL 83BAh
8365 	JR   Z,8368h
8367 	INC  HL
8368 	LD   A,(HL)
8369 	BIT  0,(IX+08h)
836D 	JR   NZ,8371h
836F 	NEG
8371 	ADD  A,(IX+03h)
8374 	LD   C,A
8375 	SUB  58h
8377 	JR   C,837Eh
8379 	CP   E
837A 	JR   NC,83B4h
837C 	JR   8383h

837E 	NEG
8380 	CP   E
8381 	JR   NC,83AEh
8383 	LD   (IX+03h),C
8386 	LD   A,(IX+09h)
8389 	RRA
838A 	RRA
838B 	AND  01h
838D 	LD   C,A
838E 	LD   A,(IX+00h)
8391 	AND  0FEh
8393 	ADD  A,C
8394 	LD   (IX+00h),A
8397 	LD   A,(PlayerSprite)
839A 	CP   31h
839C 	JP   NC,875Fh
839F 	JP   8E8Eh

83A2 	RES  1,(IX+08h)
83A6 	JR   8362h

83A8 	SET  1,(IX+08h)
83AC 	JR   8362h

83AE 	SET  0,(IX+08h)
83B2 	JR   8383h

83B4 	RES  0,(IX+08h)
83B8 	JR   8383h

83BA 	LD   C,(IX+09h)
83BD 	SLA  C
83BF 	LD   B,00h
83C1 	LD   HL,L83CA
83C4 	ADD  HL,BC
83C5 	BIT  2,(IX+08h)
83C9 	RET


L83CA:    ; 83CA
    DB 003h,000h,003h,000h,003h,001h,003h,001h
	DB 003h,001h,002h,002h,002h,002h,002h,002h
	DB 002h,002h,002h,002h,002h,002h,001h,003h
	DB 001h,003h,001h,003h,000h,003h,000h,003h


L83EA:   ; 083EAh
		; Have we changed rooms?
83EA 	LD   A,(CopyOfRoomNo)
83ED 	LD   C,A
83EE 	LD   A,(PlayerRoomNo)
83F1 	CP   C

		; If we have, go off and reset the EnterRoomCountDown (back to 20h / 32)
83F2 	JR   NZ, StartEnterRoomCountDown

		; Are we still in first 32 frames?
83F4 	LD   HL,EnterRoomCountDown
83F7 	LD   A,(HL)
83F8 	AND  A
83F9 	JR   Z, CreateGhostRandom         ; Nope.  Just randomly attempt ghost creation

		; Decrement Room Counter.  Exit if not reached zero
83FB 	DEC  (HL)
83FC 	RET  NZ
		; Counter has reached zero!  Fall through to Create Ghost (if slot available)

CreateGhostIfAvailable:   ; 83FD
		; Find an empty ghost sprite slot (SpriteID = 0).
		; If none cannot be found then exit.
83FD 	LD   HL,GhostObjectsTable
8400 	LD   DE,0010h
8403 	LD   B,03h
8405 	LD   A,(HL)
8406 	AND  A
8407 	JR   Z,840Dh
8409 	ADD  HL,DE
840A 	DJNZ 8405h
840C 	RET  ; No free slots. Exit.

		; Ghost slot has been found (referenced by HL)
		; Populate slot with template "Ghost Spawning" object
840D 	EX   DE,HL
840E 	LD   HL, GhostSpawnTemplate
8411 	LD   BC,0010h
8414 	PUSH DE
8415 	LDIR
8417 	POP  HL

		; Set Room Number for the ghost
8418 	PUSH HL
8419 	INC  HL
841A 	LD   A,(PlayerRoomNo)
841D 	LD   (HL),A
841E 	INC  HL

		; Choose a random value for the ghost object's Byte 02 option from a selection of 16 values
841F 	PUSH HL
8420 	LD   HL,GhostSpawnByte02Options
8423 	LD   A,(FRAMES)
8426 	AND  0Fh
8428 	LD   E,A
8429 	LD   D,00h
842B 	ADD  HL,DE
842C 	LD   A,(HL)
842D 	POP  HL
842E 	LD   (HL),A

		; Choose an initial position for the ghost
842F 	LD   DE,(RoomSize)
8433 	LD   B,E						; B = Half Room Width
8434 	CALL ChooseRandomWithinRoom		; X Pos provided in A.  HL has been incremented
8437 	LD   (HL),A                     ; Set initial X Pos
8438 	LD   B,D                        ; B = Half Room Height
8439 	CALL ChooseRandomWithinRoom     ; Y Pos provided in A.  HL has been incremented
843C 	LD   (HL),A                     ; Set initial Y Pos

		; Chose initial DX/DY value for the ghost (IX+08h) and (IX+09h)
843D 	POP  DE                         ; Reference to Sprite Object
843E 	PUSH IX
8440 	LD   IX,0000h
8444 	ADD  IX,DE
8446 	CALL SetRandomDxDy
8449 	CALL PrepAndRedrawSprite
844C 	POP  IX
844E 	RET

StartEnterRoomCountDown:   ; 844F
844F 	LD   (CopyOfRoomNo),A
8452 	LD   A,20h
8454 	LD   (5E27h),A
8457 	RET

CreateGhostRandom:   ; 8458
		; Every frame, there is a 1 in 16 chance that we will attempt to create a new ghost
		; Ghost won't be created if no ghost slots available.
8458 	LD   A,R
845A 	AND  0Fh
845C 	RET  NZ
845D 	JR   CreateGhostIfAvailable

845F 	CALL PrepSpriteDraw
8462 	LD   A,(PlayerRoomNo)
8465 	CP   (IX+01h)
8468 	JP   NZ, CountDownSpriteLife   ; Kill off sprite if no in same room as player
846B 	LD   HL, GhostsInRoom
846E 	INC  (HL)
846F 	CALL 8566h
8472 	DEC  E
8473 	JP   Z,875Fh
8476 	CALL DetectCollsion
8479 	DEC  E
847A 	JP   Z, DoGhostDamage
847D 	LD   DE,(RoomSize)
8481 	LD   (IX+0Fh),00h
8485 	LD   (IX+05h),46h
8489 	LD   A,(IX+07h)
848C 	AND  0Fh
848E 	JR   NZ,8497h
8490 	LD   A,R
8492 	AND  03h
8494 	LD   (IX+06h),A
8497 	BIT  0,(IX+07h)
849B 	JR   NZ,84BFh
849D 	BIT  0,(IX+06h)
84A1 	JP   Z,854Ah
84A4 	LD   A,(IX+08h)
84A7 	CP   02h
84A9 	JR   Z,84AEh
84AB 	INC  (IX+08h)
84AE 	BIT  1,(IX+06h)
84B2 	JP   Z,8558h
84B5 	LD   A,(IX+09h)
84B8 	CP   02h
84BA 	JR   Z,84BFh
84BC 	INC  (IX+09h)
84BF 	INC  (IX+07h)
84C2 	LD   A,(IX+07h)
84C5 	AND  01h
84C7 	XOR  (IX+00h)
84CA 	LD   (IX+00h),A

	; This entrypoint has:
	; IX pointing to one of the monsters.
	;    (EE90=Mummy, EEA0=Dracula, EEB0=Devil, EEC0=Frankenstein, EED0=Hunchback or a ghost)
	; DE holds half the room width (E) and height (D) in pixels - typically read from (RoomSize).
	; It moves the monster in X (IX+3)+(IX+8) then in Y doing
84CD	LD   A,(IX+03h)
84D0	ADD  A,(IX+08h)
84D3	LD   C,A
84D4	SUB  58h           ; Translate X so origin (0) is centre of room
84D6	JR   C,84E8h       ; Jump if "West of center"
84D8	CP   E             ; Compare with half room width
84D9	JR   C,84F8h       ; JR if inside room (in X)
	; Monster is outside East bounds of room
84DB	RES  0,(IX+06h)
84DF	LD   (IX+08h),0FEh ; Set monster's DX to -2
84E3	LD   C,(IX+03h)    ; Cancel adding DX to X
84E6	JR   84F8h

	; Mirror X for similar comparison as above
84E8 	NEG
84EA 	CP   E             ; Compare with half room width
84EB 	JR   C,84F8h       ; JR if inside room (in X)
	; Monster is outside West bounds of room
84ED 	SET  0,(IX+06h)
84F1 	LD   C,(IX+03h)    ; Cancel adding DX to X
84F4 	LD   (IX+08h),02h  ; Set monster's DX to +2

	; Now do same by for Y
84F8 	LD   A,(IX+04h)
84FB 	ADD  A,(IX+09h)
84FE 	LD   B,A
84FF 	SUB  68h           ; Translate Y so origin (0) is centre of room
8501 	JR   C,8513h       ; Jump if "North of center"
8503 	CP   D             ; Compare with half room height
8504 	JR   C,8523h       ; JR if inside room (in Y)
	; Monster is outside South bounds of room
8506 	RES  1,(IX+06h)
850A 	LD   (IX+09h),0FEh ; Set monster's DY to -2
850E 	LD   B,(IX+04h)    ; Cancel adding DY to Y
8511 	JR   8523h

	; Mirror Y for similar comparison as above
8513 	NEG
8515 	CP   D             ; Compare with half room height
8516 	JR   C,8523h       ; JR if inside room (in Y)
	; Monster is outside North bounds of room
8518 	SET  1,(IX+06h)
851C 	LD   B,(IX+04h)    ; Cancel adding DY to Y
851F 	LD   (IX+09h),02h  ; Set monster's DY to +2

    	; Save entity's new position (C=X; B=Y)
8523 	LD   (IX+03h),C
8526 	LD   (IX+04h),B

	; Is monster actually in the same room as player?
	; Exit routine if not
8529 	LD   A,(PlayerRoomNo)
852C 	CP   (IX+01h)
852F 	RET  NZ

8530 	LD   A,(IX+00h)	    ; Is the Monster hunchback?
8533 	AND  0FCh           ; (Test by taking sprite, masking out lower anination bits and comparing with base sprite)
8535 	CP   SprGfxMonsterHunchbackIdx+1
8537 	JR   Z,8547h        ; JR if sprite is Hunchback
8539 	AND  0F0h
853B 	CP   70h
853D 	JR   Z,8547h        ; JR if sprite is Mummy, Frankenstein, Devil or Dracula
853F 	LD   A,(PlayerSprite)
8542 	CP   31h               ; First 30h sprites are Knight, Wizard, Serf.
8544 	JP   NC,DestroyGhost   ; If Player Sprite is NOT one of these then => 875F
8547 	JP   8E8Eh

854A 	LD   A,(IX+08h)
854D 	CP   0FEh
854F 	JP   Z,84AEh
8552 	DEC  (IX+08h)
8555 	JP   84AEh

8558 	LD   A,(IX+09h)
855B 	CP   0FEh
855D 	JP   Z,84BFh
8560 	DEC  (IX+09h)
8563 	JP   84BFh

8566 	LD   A,(ShotRoomNo)
8569 	LD   E,00h
856B 	CP   (IX+01h)
856E 	RET  NZ
856F 	LD   A,(ShotSprite)
8572 	AND  A
8573 	RET  Z
8574 	LD   A,(0EA9Bh)
8577 	SUB  (IX+03h)
857A 	JP   P,857Fh
857D 	NEG
857F 	CP   0Ch
8581 	RET  NC
8582 	LD   A,(0EA9Ch)
8585 	SUB  (IX+04h)
8588 	JP   P,858Dh
858B 	NEG
858D 	CP   0Ch
858F 	RET  NC
8590 	LD   A,01h
8592 	LD   (0EA9Ah),A
8595 	LD   E,01h
8597 	RET

ChooseRandomWithinRoom:   ; 8598
		; This routine selectes an absolute X or Y position (pixels) based on a the given Room Half Width or Half Height which is provided in B
		; B = Half Room Width or Height (pixels)
		; Returns: A = Randomly selected X Pos (or Y Pos)
8598 	LD   A,B        ; A = Half Room Width or Height (pixels)
8599 	SUB  08h        ; Reduce by 8 pixels so not right up at edge
859B 	LD   B,A
859C 	LD   A,R        ; Get a random number
859E 	INC  HL         ; Move HL to X Pos (or Y Pos)
859F 	CP   B          ; If random number is larger than half room width (or height) then reduce it by half room width and retest
85A0 	JR   C,85A5h
85A2 	SUB  B
85A3 	JR   859Fh
		; Position (A) is now inside half room width
85A5 	LD   C,A		; Save in C
85A6 	LD   A,R
85A8 	BIT  1,A
85AA 	LD   A,60h		; Center of Room (X or Y - it's the same)
85AC 	JR   Z,85B0h
85AE 	ADD  A,C		; Return 60h + the random value
85AF 	RET
85B0 	SUB  C			; Return 60h - the random value
85B1 	RET

DetectCollsion:   ; 85B2
	; Compares object and player for collection.
	; Checks that they reside in the same room and that their X/Y position is within 12 pixels
	; of each other.
	; Returns E register: 0=No collision; 1=Collision
85B2 	LD   A,(PlayerRoomNo)
85B5 	LD   E,00
85B7 	CP   (IX+01h)	; Object in same room as player?
85BA 	RET  NZ			; Exit if not
85BB 	LD   A,(PlayerSprite)
85BE 	AND  A
85BF 	RET  Z
85C0 	CP   31h		; Max Player SpriteID + 1
85C2 	RET  NC			; Exit if not player isn't a normal character sprite
85C3 	LD   A,(PlayerXPos) ; Compare Player and Object X positions
85C6 	SUB  (IX+03h)	; X Pos
85C9 	JP   P,85CEh
85CC 	NEG
85CE 	CP   0Ch
85D0 	RET  NC			; More than 12 pixels away?
85D1 	LD   A,(PlayerYPos) ; Compare Player and Object X positions
85D4 	SUB  (IX+04h)	; Y Pos
85D7 	JP   P,85DCh
85DA 	NEG
85DC 	CP   0Ch
85DE 	RET  NC			; More than 12 pixels away?
85DF 	LD   A,01h
85E1 	LD   (Player02),A	; Player02 = 01h - This could indicate collision
85E4 	CALL PrepExplosionObject
85E7 	LD   E,01h
85E9 	RET

DoGhostDamage:   ; 85EA
85EA 	CALL DoGhostDamageImpl
85ED 	JP   875Fh

CountDownSpriteLife:   ; 85F0
		; Reduce life left in sprite.  When count reaches zero, kill it off.
85F0 	DEC  (IX+0Fh)
85F3 	RET  NZ
85F4 	JP   RemoveSpriteFromPlay

85F7 	CALL PrepSpriteDraw
85FA 	LD   A,(PlayerRoomNo)
85FD 	CP   (IX+01h)
8600 	JP   NZ, CountDownSpriteLife   ; Kill off sprite if no in same room as player
8603 	LD   HL,GhostsInRoom
8606 	INC  (HL)
8607 	DEC  (IX+0Eh)
860A 	JR   Z,8625h
860C 	LD   A,(IX+0Eh)
860F 	AND  03h
8611 	ADD  A,58h
8613 	LD   (IX+00h),A
8616 	LD   (IX+0Fh),80h
861A 	LD   A,(PlayerSprite)
861D 	CP   31h
861F 	JP   NC,875Fh
8622 	JP   8E8Eh

8625 	LD   A,(IX+02h)
8628 	LD   (IX+00h),A
862B 	JP   8E8Eh

862E 	CALL PrepSpriteDraw
8631 	LD   A,(PlayerRoomNo)
8634 	CP   (IX+01h)
8637 	JP   NZ, CountDownSpriteLife   ; Kill off sprite if no in same room as player
863A 	LD   HL,GhostsInRoom
863D 	INC  (HL)
863E 	CALL DetectCollsion
8641 	DEC  E
8642 	JP   Z,DoGhostDamage
8645 	CALL 8566h
8648 	DEC  E
8649 	JP   Z,875Fh
864C 	LD   (IX+05h),45h
8650 	INC  (IX+07h)
8653 	CALL Z,SetRandomDxDy
8656 	LD   A,(IX+07h)
8659 	RRA
865A 	RRA
865B 	AND  01h
865D 	LD   C,A
865E 	LD   A,(IX+00h)
8661 	AND  0FEh
8663 	ADD  A,C
8664 	LD   (IX+00h),A
8667 	LD   DE,(RoomSize)
866B 	LD   (IX+0Fh),00h
866F 	JP   84CDh

8672 	CALL PrepSpriteDraw
8675 	LD   A,(PlayerRoomNo)
8678 	CP   (IX+01)
867B 	JP   NZ, CountDownSpriteLife   ; Kill off sprite if no in same room as player
867E 	LD   HL,GhostsInRoom
8681 	INC  (HL)
8682 	LD   (IX+0Fh),00h
8686 	CALL DetectCollsion
8689 	DEC  E
868A 	JP   Z,DoGhostDamage
868D 	CALL 8566h
8690 	DEC  E
8691 	JP   Z,875Fh
8694 	LD   A,(IX+0Ah)
8697 	RRA
8698 	AND  01h
869A 	LD   C,A
869B 	LD   A,(IX+00h)
869E 	AND  0FEh
86A0 	ADD  A,C
86A1 	LD   (IX+00h),A
86A4 	LD   DE,(RoomSize)
86A8 	INC  (IX+0Ah)
86AB 	LD   A,(IX+0Ah)
86AE 	CP   07h
86B0 	JR   NZ,86B9h
86B2 	CALL SetRandomDxDy
86B5 	LD   (IX+0Ah),0F9h
86B9 	SRA  A
86BB 	ADD  A,(IX+04h)
86BE 	LD   C,A
86BF 	SUB  68h
86C1 	JP   P,86E1h
86C4 	NEG
86C6 	CP   D
86C7 	JR   C,86DBh
86C9 	LD   (IX+09h),02h
86CD 	SET  1,(IX+06h)
86D1 	BIT  7,(IX+0Ah)
86D5 	JR   Z,86DBh
86D7 	LD   (IX+0Ah),00h
86DB 	LD   (IX+04h),C
86DE 	JP   84CDh

86E1 	CP   D
86E2 	JR   C,86DBh
86E4 	RES  1,(IX+06h)
86E8 	LD   (IX+09h),0FEh
86EC 	LD   (IX+0Ah),0F9h
86F0 	JR   86DBh


SetRandomDxDy:   ; 86F2
	; IX = Sprite Object
	; Sets DX (IX+08h) and DY (IX+09h) to one of [-2, -1, 1, 2].
86F2 	LD   A,R
86F4 	BIT  0,A
86F6 	JR   Z,870Eh
86F8 	AND  04h         ; 00h or 02h
86FA 	SUB  02h         ; FEh or 02h
86FC 	LD   (IX+09h),A  ; Save to DY
86FF 	LD   A,R
8701 	RRA
8702 	BIT  0,A
8704 	JR   Z,8714h
8706 	AND  04h
8708 	SUB  02h
870A 	LD   (IX+08h),A  ; Save to DX
870D 	RET
870E 	AND  02h         ; 00h or 02h
8710 	SUB  01h         ; 00h or 02h
8712 	JR   86FCh
8714 	AND  02h         ; 00h or 02h
8716 	SUB  01h         ; 00h or 02h
8718 	JR   870Ah


871A 	CALL PrepSpriteDraw
871D 	LD   A,(PlayerRoomNo)
8720 	CP   (IX+01h)
8723 	JP   NZ, CountDownSpriteLife   ; Kill off sprite if no in same room as player
8726 	LD   HL,GhostsInRoom
8729 	INC  (HL)
872A 	LD   (IX+0Fh),00h
872E 	CALL DetectCollsion
8731 	DEC  E
8732 	JP   Z,DoGhostDamage
8735 	CALL 8566h
8738 	DEC  E
8739 	JP   Z,875Fh
873C 	LD   DE,(RoomSize)
8740 	DEC  (IX+0Dh)
8743 	JR   NZ,874Ch
8745 	LD   (IX+0Dh),11h
8749 	CALL SetRandomDxDy
874C 	LD   A,(IX+0Dh)
874F 	RRA
8750 	AND  01h
8752 	LD   C,A
8753 	LD   A,(IX+00h)
8756 	AND  0FEh
8758 	ADD  A,C
8759 	LD   (IX+00h),A
875C 	JP   84CDh


DestroyGhost:
	; This routine is called once when a ghost is destroyed
	; Redraw sprite with room colour
	; IX = Player or Monster Sprite
875F 	LD   A,(IX+05h) ; Save Sprite Colour and temp set as Room Colour
8762 	PUSH AF
8763 	LD   A,(RoomColour)
8766 	LD   (IX+05h),A
8769 	CALL 9F56h
876C 	CALL 0A01Ah
876F 	POP  AF
8770 	LD   (IX+05h),A		; Restore original sprite colour
8773 	LD   (IX+00h),SprGfxDestroyIdx+1
8777 	LD   (IX+0Eh),10h

		; Add 115 (bcd) to the player's score for topping off a monster
877B 	LD   BC,0155h
877E 	CALL IncrementScore
8781 	CALL PrepAndRedrawSprite
8784 	JP   0A01Ah

8787 	CALL PrepSpriteDraw
878A 	LD   A,(PlayerRoomNo)
878D 	CP   (IX+01h)
8790 	JP   NZ, CountDownSpriteLife   ; Kill off sprite if no in same room as player
8793 	DEC  (IX+0Eh)
8796 	JP   Z,826Fh
8799 	LD   A,(IX+0Eh)
879C 	AND  03h
879E 	ADD  A,6Ch
87A0 	LD   (IX+00h),A
87A3 	JP   8E8Eh

87A6 	CALL PrepSpriteDraw
87A9 	LD   A,(PlayerRoomNo)
87AC 	CP   (IX+01h)
87AF 	JP   NZ, CountDownSpriteLife   ; Kill off sprite if no in same room as player
87B2 	LD   HL,GhostsInRoom
87B5 	INC  (HL)
87B6 	CALL 8566h
87B9 	DEC  E
87BA 	JP   Z,875Fh
87BD 	CALL DetectCollsion
87C0 	DEC  E
87C1 	JP   Z,DoGhostDamage
87C4 	LD   DE,(RoomSize)
87C8 	LD   (IX+0Fh),00h
87CC 	LD   (IX+05h),46h
87D0 	LD   A,(IX+07h)
87D3 	AND  07h
87D5 	JR   NZ,87DEh
87D7 	LD   A,R
87D9 	AND  03h
87DB 	LD   (IX+06h),A
87DE 	BIT  0,(IX+07h)
87E2 	JR   NZ,8804h
87E4 	BIT  0,(IX+06h)
87E8 	JR   Z,8815h
87EA 	LD   A,(IX+08h)
87ED 	CP   02h
87EF 	JR   Z,87F4h
87F1 	INC  (IX+08h)
87F4 	BIT  1,(IX+06h)
87F8 	JR   Z,8821h
87FA 	LD   A,(IX+09h)
87FD 	CP   02h
87FF 	JR   Z,8804h
8801 	INC  (IX+09h)
8804 	INC  (IX+07h)
8807 	LD   A,(IX+07h)
880A 	AND  01h
880C 	XOR  (IX+00h)
880F 	LD   (IX+00h),A
8812 	JP   84CDh

8815 	LD   A,(IX+08h)
8818 	CP   0FEh
881A 	JR   Z,87F4h
881C 	DEC  (IX+08h)
881F 	JR   87F4h

8821 	LD   A,(IX+09h)
8824 	CP   0FEh
8826 	JR   Z,8804h
8828 	DEC  (IX+09h)
882B 	JR   8804h


; Compares the given monster's position against a target X/Y position as provided in DE (E=X; D=Y in pixels)
; Object in this case is a Monster type that requires 16 byte data struct.
; Input:
; 	IX = Address of Monster Object
; 	E = X Position to compare against
; 	D = Y Position to compare against
; Output:
;   C = 0..3: bit 1 set if Monster Y Pos = D; bit 1 set if Monster X Pos = E
;   (IX+08) = -1..+1: X alignment info: 0=Aligned; +1=Monster left of target (needs to move right)  -1=Monster right of target (needs to move left)
;   (IX+09) = -1..+1: Y alignment info: 0=Aligned; +1=Monster above target (needs to move down)  -1=Monster below target (needs to move up)
CompareMonsterPosWithDE:   ; 882D
882D 	LD   C,00h	; Reset Result
882F 	LD   A,D		; Y Pos
8830 	CP   (IX+04h)	; Compare with Monster Y Pos
8833 	JR   Z,8848h	; If match, go onto X pos check
8835 	JR   NC,8850h
		; Monster BELOW target (needs to move UP)
8837 	LD   (IX+09),0FFh	; Object is
883B 	LD   A,E		; X Pos
883C 	CP   (IX+03h)	; Compare with Monster X Pos
883F 	JR   Z,8856h
8841 	JR   NC,885Dh
		; Monster RIGHT of target (needs to move LEFT)
8843 	LD   (IX+08),0FFh
8847 	RET
		; Perfect alignment in Y
8848 	LD   (IX+09h),00h	; Store 00 in +09 value (exactly in line in Y axis)
884C 	SET  0,C			; Set C=1
884E 	JR   883Bh
		; Monster ABOVE target (needs to move DOWN)
8850 	LD   (IX+09h),01h
8854 	JR   883Bh
		; Perfect alignment in X
8856 	LD   (IX+08h),00h
885A 	SET  1,C
885C 	RET
		; Monster LEFT of target (needs to move RIGHT)
885D 	LD   (IX+08h),01h
8861 	RET

8862 	CALL PrepSpriteDraw
8865 	CALL DetectCollsion
8868 	DEC  E
8869 	CALL Z,SapEnergy8

		; Are we carring the Mummy Leaf? (is it in Room 0?)
886C 	LD   HL,MummyLeafObject
886F 	LD   A,(HL)
8870 	AND  A
8871 	JR   Z,8881h
8873 	INC  HL
		; Is Mummy Leaf in the same room as the mummy?
8874 	LD   A,(HL)
8875 	CP   (IX+01h)
8878 	JR   NZ,8881h
887A 	INC  HL
887B 	INC  HL
887C 	LD   E,(HL)	; Leaf X Position
887D 	INC  HL
887E 	LD   D,(HL)	; Leaf Y Position
887F 	JR   88D7h

8881 	BIT  7,(IX+06h)
8885 	JR   NZ,88FDh
8887 	LD   HL,0EAC8h
888A 	LD   A,(HL)
888B 	AND  A
888C 	JR   Z,88F9h
888E 	INC  HL
888F 	LD   A,(HL)
8890 	CP   (IX+01)
8893 	JR   NZ,88F9h
8895 	LD   D,(IX+0Ch)
8898 	LD   E,(IX+0Bh)
889B 	CALL CompareMonsterPosWithDE
889E 	LD   A,C
889F 	CP   03h
88A1 	JR   Z,88B5h

		; Update Mummy sprite (70h..73h)
88A3 	LD   A,(GameClock)
88A6 	RRA
88A7 	RRA
88A8 	AND  03h
88AA 	ADD  A, SprGfxMonsterMummyIdx+1
88AC 	LD   (IX+00h),A
88AF 	LD   DE,3838h
88B2 	JP   89BBh

88B5 	BIT  6,(IX+06h)
88B9 	JR   Z,88C9h
88BB 	LD   (IX+0Bh),8Ch
88BF 	LD   (IX+0Ch),68h
88C3 	RES  6,(IX+06h)
88C7 	JR   88A3h

88C9 	LD   (IX+0Bh),68h
88CD 	LD   (IX+0Ch),38h
88D1 	SET  6,(IX+06h)
88D5 	JR   88A3h

88D7 	CALL CompareMonsterPosWithDE
88DA 	LD   A,C
88DB 	CP   03h	; Is Mummy situated EXACTLY on Leaf?
88DD 	JR   NZ,88A3h
88DF 	PUSH IX
		; Mummy situated EXACTLY on Leaf?
88E1 	LD   IX,MummyLeafObject
88E5 	LD   A,(PlayerRoomNo)
88E8 	CP   (IX+01)
88EB 	JR   NZ,88F0h
88ED 	CALL PrepAndRedrawSprite
88F0 	POP  IX
88F2 	LD   A,6Bh
88F4 	LD   (0EAE1h),A
88F7 	JR   88B5h

88F9 	SET  7,(IX+06h)
88FD 	LD   DE,(PlayerXPos)
8901 	CALL CompareMonsterPosWithDE
8904 	JR   88A3h

8906 	CALL PrepSpriteDraw
8909 	CALL DetectCollsion
890C 	DEC  E
890D 	CALL Z,SapEnergy8	; Dracula takes 8 energy
		; Do we have a Yellow Crucifix in our possession?
8910 	LD   DE,468Ah		; 8Ah = SpriteID+1 = Crucifix; 46h = Bright Yellow
8913 	CALL SearchInventory
8916 	JR   NZ,8931h
		; Reverse direction of Dracula
8918 	LD   DE,(PlayerXPos)
891C 	CALL CompareMonsterPosWithDE
891F 	LD   A,(IX+08h)
8922 	NEG
8924 	LD   (IX+08h),A
8927 	LD   A,(IX+09h)
892A 	NEG
892C 	LD   (IX+09h),A
892F 	JR   8940h

8931 	LD   A,(PlayerRoomNo)
8934 	CP   (IX+01h)
8937 	JR   NZ,8952h
8939 	LD   DE,(PlayerXPos)
893D 	CALL CompareMonsterPosWithDE
8940 	LD   A,(GameClock)
8943 	RRA
8944 	RRA
8945 	AND  03h
8947 	ADD  A,7Ch
8949 	LD   (IX+00h),A
894C 	LD   DE,3434h
894F 	JP   89BBh

8952 	LD   (IX+0Bh),68h	; Set Position to center of screen (13,13)
8956 	LD   (IX+0Ch),68h
895A 	CALL CompareMonsterPosWithDE
895D 	LD   A,(FRAMES)
8960 	AND  A
8961 	JP   NZ,8940h
8964 	LD   A,R
8966 	AND  7Fh
8968 	LD   C,A
8969 	CALL 897Dh
896C 	CP   03h
896E 	JP   NC,8940h
8971 	LD   A,(PlayerRoomNo)
8974 	CP   C
8975 	JP   Z,8940h
8978 	LD   (IX+01h),C
897B 	JR   8940h

; Read the 2nd (high byte) from index A in the vector table at Screens and return in A. HL points to high byte that was read
897D 	LD   L,A
897E 	LD   H,00h
8980 	LD   DE,Screens
8983 	ADD  HL,HL
8984 	ADD  HL,DE
8985 	INC  HL
8986 	LD   A,(HL)
8987 	RET

8988 	CALL PrepSpriteDraw
898B 	CALL DetectCollsion
898E 	DEC  E
898F 	JR   NZ,89A5h
		; Do we have a Cyan Spanner in our possession?
8991 	LD   DE,458Bh		; 8B = SpriteID+1 = Spanner; 45 = Colour (Bright Cyan)
8994 	CALL SearchInventory
8997 	JR   NZ,89A2h

		; Add 1000 (bcd) to the player's score
		; for "offing" Frankenstein with
		; the spanner!
8999 	LD   BC,1000h
899C 	CALL IncrementScore
899F 	JP   875Fh

89A2 	CALL SapEnergy8		; Frankenstein takes 8 energy
89A5 	LD   DE,(PlayerXPos)
89A9 	CALL CompareMonsterPosWithDE
89AC 	LD   A,(GameClock)
89AF 	RRA
89B0 	RRA
89B1 	AND  03h
89B3 	ADD  A,74h
89B5 	LD   (IX+00h),A
89B8 	LD   DE,3434h	; Corner of room (6.5,6.5)

89BB 	LD   A,(PlayerSprite)
89BE 	CP   31h
89C0 	JP   C,84CDh	; JP if player is a tombstone?
89C3 	LD   DE,(PlayerXPos)
89C7 	CALL CompareMonsterPosWithDE
89CA 	LD   A,(IX+08h)
89CD 	NEG
89CF 	LD   (IX+08h),A
89D2 	LD   C,A
89D3 	LD   A,(IX+09h)
89D6 	NEG
89D8 	LD   (IX+09h),A
89DB 	LD   DE,3434h
89DE 	AND  C
89DF 	JP   NZ,84CDh
89E2 	LD   (IX+08h),01h	; Move Right
89E6 	LD   (IX+09h),01h	; Move Down
89EA 	JP   84CDh

89ED 	CALL PrepSpriteDraw
89F0 	CALL DetectCollsion
89F3 	DEC  E
89F4 	CALL Z,SapEnergy8	; Devil takes 8 energy
89F7 	LD   DE,(PlayerXPos)
89FB 	CALL CompareMonsterPosWithDE
		; Update animation of Monster
89FE 	LD   A,(IX+00h)
8A01 	AND  0FCh		; Strip off 4 animation frames
8A03 	LD   C,A
8A04 	LD   A,(GameClock)
8A07 	RRA
8A08 	RRA
8A09 	AND  03h
8A0B 	ADD  A,C		; Reapply correct animation
8A0C 	LD   (IX+00h),A
8A0F 	LD   DE,3434h
8A12 	JP   89BBh


SapEnergy16:   ; 8A15		; Hunchback takes 16 energy
8A15 	LD   A,(ChickenEnergy)
8A18 	SUB  10h
8A1A 	JR   C,SapEnergyLoseLife
8A1C 	JR   SapEnergyEnd

SapEnergy8:   ; 8A1E		; Dracula, Frakenstein, Mummy and Devil each take 8 energy
8A1E 	LD   A,(ChickenEnergy)
8A21 	SUB  08h
8A23 	JR   C,SapEnergyLoseLife

SapEnergyEnd:   ; 8A25
8A25 	LD   (ChickenEnergy),A
8A28 	JP   UpdateChicken

SapEnergyLoseLife:   ; 8A2B
8A2B 	POP  HL
8A2C 	JP   LoseLife



8A2F 	CALL PrepSpriteDraw
8A32 	LD   A,(PlayerRoomNo)
8A35 	CP   (IX+01h)
8A38 	JP   NZ, CountDownSpriteLife   ; Kill off sprite if no in same room as player
8A3B 	LD   HL,GhostsInRoom
8A3E 	INC  (HL)
8A3F 	CALL DetectCollsion
8A42 	DEC  E
8A43 	JP   Z,DoGhostDamage
8A46 	CALL 8566h
8A49 	DEC  E
8A4A 	JP   Z,875Fh
8A4D 	DEC  (IX+0Dh)
8A50 	JR   NZ,8A5Dh
8A52 	CALL SetRandomDxDy
8A55 	SRA  (IX+09h)
8A59 	LD   (IX+0Dh),10h
8A5D 	LD   A,(IX+00h)
8A60 	AND  0FCh
8A62 	BIT  7,(IX+08h)
8A66 	JR   NZ,8A6Ah
8A68 	ADD  A,02h
8A6A 	LD   C,A
8A6B 	LD   A,(IX+0Dh)
8A6E 	RRA
8A6F 	AND  01h
8A71 	ADD  A,C
8A72 	LD   (IX+00h),A
8A75 	LD   DE,(RoomSize)
8A79 	LD   (IX+05h),43h
8A7D 	JP   84CDh

8A80 	CALL PrepSpriteDraw
8A83 	LD   A,(PlayerRoomNo)
8A86 	CP   (IX+01h)
8A89 	JP   NZ, CountDownSpriteLife   ; Kill off sprite if no in same room as player
8A8C 	LD   HL,GhostsInRoom
8A8F 	INC  (HL)
8A90 	CALL DetectCollsion
8A93 	DEC  E
8A94 	JP   Z,DoGhostDamage
8A97 	CALL 8566h
8A9A 	DEC  E
8A9B 	JP   Z,875Fh
8A9E 	DEC  (IX+0Dh)
8AA1 	JR   NZ,8AB8h
8AA3 	CALL SetRandomDxDy
8AA6 	LD   A,(FRAMES)
8AA9 	AND  04h
8AAB 	SUB  02h
8AAD 	LD   (IX+08h),A
8AB0 	SRA  (IX+09h)
8AB4 	LD   (IX+0Dh),20h
8AB8 	LD   A,(IX+00h)
8ABB 	AND  0FCh
8ABD 	BIT  7,(IX+08h)
8AC1 	JR   NZ,8AC5h
8AC3 	ADD  A,02h
8AC5 	LD   C,A
8AC6 	LD   A,(IX+0Dh)
8AC9 	RRA
8ACA 	AND  01h
8ACC 	ADD  A,C
8ACD 	LD   (IX+00h),A
8AD0 	LD   DE,(RoomSize)
8AD4 	LD   (IX+05h),42h
8AD8 	JP   84CDh

8ADB 	LD   HL,0EB18h
8ADE 	LD   DE,0008h
8AE1 	LD   B,08h
8AE3 	PUSH HL
8AE4 	LD   A,(HL)
8AE5 	AND  A
8AE6 	JR   Z,8AF8h
8AE8 	INC  HL
8AE9 	LD   A,(HL)
8AEA 	CP   (IX+01h)
8AED 	JR   NZ,8AF8h
8AEF 	POP  DE
8AF0 	INC  HL
8AF1 	INC  HL
8AF2 	LD   E,(HL)
8AF3 	INC  HL
8AF4 	LD   D,(HL)
8AF5 	LD   C,01h
8AF7 	RET

8AF8 	POP  HL
8AF9 	ADD  HL,DE
8AFA 	DJNZ 8AE3h
8AFC 	LD   C,00h
8AFE 	RET

8AFF 	CALL PrepSpriteDraw
8B02 	CALL DetectCollsion
8B05 	DEC  E
8B06 	CALL Z,SapEnergy16	; Hunchback takes 16 energy per frame
8B09 	XOR  A
8B0A 	LD   (IX+09h),A
8B0D 	LD   (IX+08h),A
8B10 	CALL 8ADBh
8B13 	DEC  C
8B14 	JP   NZ,8B59h
8B17 	CALL CompareMonsterPosWithDE
8B1A 	LD   A,C
8B1B 	CP   03
8B1D 	JR   NZ,8B45h
8B1F 	CALL 8ADBh
8B22 	LD   DE,0004h
8B25 	AND  A
8B26 	SBC  HL,DE
8B28 	PUSH IX
8B2A 	LD   IX,0000h
8B2E 	EX   DE,HL
8B2F 	ADD  IX,DE
8B31 	LD   A,(PlayerRoomNo)
8B34 	CP   (IX+01h)
8B37 	JR   NZ,8B3Ch
8B39 	CALL PrepAndRedrawSprite
8B3C 	LD   (IX+00h),00h
8B40 	POP  IX
8B42 	JP   8B59h

8B45 	LD   A,(IX+00h)
8B48 	AND  0FCh
8B4A 	LD   C,A
8B4B 	LD   A,(GameClock)
8B4E 	RRA
8B4F 	RRA
8B50 	AND  03h
8B52 	ADD  A,C
8B53 	LD   (IX+00h),A
8B56 	LD   DE,3C3Ch
8B59 	LD   A,(PlayerSprite)
8B5C 	CP   31h
8B5E 	JP   C,84CDh
8B61 	LD   DE,3A58h
8B64 	CALL CompareMonsterPosWithDE
8B67 	JP   84CDh


GhostSpawnTemplate:   ; 8B6A (16 bytes)
	DB SprGfxSpawnIdx+1, 000h,05Ch, 068h, 068h, 044h, 000h, 000h
	DB 002h,002h,000h,000h,000h,010h,020h,000h


GhostSpawnByte02Options:   ; 8B7A (one of these is randomly selected and used for (IX+02h) in newly created Ghost Spawn object
	DB 05Ch,05Eh,098h,098h,090h,090h,094h,094h
	DB 05Ch,05Eh,060h,062h,04Ch,04Eh,068h,06Ah

UpdateChicken:   ; 8B8A
		; First check to see if we actually need to re-render (pun!) the chicken as 8 energy = 1 pixel line of chicken
8B8A	LD   A,(ChickenEnergy)
8B8D	SRL  A
8B8F	SRL  A
8B91	SRL  A
8B93	LD   C, A
8B94	LD   A,(LastChickenEnergy)
8B97	SRL  A
8B99	SRL  A
8B9B	SRL  A
8B9D	LD   B, A
8B9E	CP   C
9B9F	RET  Z		; No visible change required

		; Actual Redraw of Chicken
8BA0 	LD   A,(BackSpriteFullChicken+1)	; Read Height of sprite (pixels) = 30
8BA3 	LD   E,A
8BA4 	LD   A,(0C48Dh)
8BA7 	LD   D,A
8BA8 	PUSH IX
8BAA 	LD   IX,L8C2D
8BAE 	PUSH DE
8BAF 	JR   C,8C12h
8BB1 	LD   A,(BackSpriteEmptyChicken)
8BB4 	LD   E,A
8BB5 	LD   D,00h
8BB7 	LD   A,C
8BB8 	PUSH BC
8BB9 	CALL 9AADh
8BBC 	POP  BC
8BBD 	LD   DE,(0A626h)
8BC1 	PUSH DE
8BC2 	ADD  HL,DE
8BC3 	LD   (0A626h),HL
8BC6 	LD   E,(HL)
8BC7 	INC  HL
8BC8 	LD   D,(HL)
8BC9 	LD   A,(0C48Dh)
8BCC 	SUB  C
8BCD 	JR   Z,8BFCh
8BCF 	PUSH DE
8BD0 	LD   (HL),A
8BD1 	LD   A,(BackSpriteEmptyChicken)
8BD4 	DEC  HL
8BD5 	LD   (HL),A
8BD6 	PUSH HL
8BD7 	LD   A,14h
8BD9 	LD   (IX+00h),A
8BDC 	LD   HL,77C8h
8BDF 	LD   A,H
8BE0 	SUB  C
8BE1 	LD   H,A
8BE2 	LD   (8C30h),HL
8BE5 	CALL DrawRoutineLookupAndDispatchIX
8BE8 	LD   HL,(8C30h)
8BEB 	CALL CalcScreenAddr		; (L=X; H=Y)
8BEE 	LD   A,(BackSpriteEmptyChicken)
8BF1 	LD   B,A
8BF2 	LD   (HL),00h
8BF4 	INC  L
8BF5 	DJNZ 8BF2h
8BF7 	POP  HL
8BF8 	POP  DE
8BF9 	LD   (HL),E
8BFA 	INC  HL
8BFB 	LD   (HL),D
8BFC 	POP  HL
8BFD 	LD   (0A626h),HL
8C00 	POP  DE
8C01 	LD   A,E
8C02 	LD   (BackSpriteFullChicken+1),A	; Write height of sprite (pixels); (Actual size is 30)
8C05 	LD   A,D
8C06 	LD   (0C48Dh),A
8C09 	POP  IX
8C0B 	LD   A,(ChickenEnergy)
8C0E 	LD   (LastChickenEnergy),A
8C11 	RET

8C12 	LD   A,C
8C13 	LD   (BackSpriteFullChicken+1),A	; Write height of sprite (pixels); (Actual size is 30)
8C16 	LD   A,13h
8C18 	LD   (IX+00h),A
8C1B 	LD   HL,77C8h
8C1E 	LD   (8C30h),HL
8C21 	CALL DrawRoutineLookupAndDispatchIX
8C24 	LD   B,06h
8C26 	LD   (HL),00h
8C28 	INC  L
8C29 	DJNZ 8C26h
8C2B 	JR   8C00h


L8C2D	DB 000h,000h,000h,000h,000h,000h,000h,000h


GameOverMsg:       ; 08C35h
8C35 	CALL ClrGameWindow
8C38 	LD   HL,Font
8C3B 	LD   (FontBase),HL
8C3E 	LD   HL,3040h		; (Y=6 X=8)
8C41 	LD   DE,GameOverTXT
8C44 	CALL PrintText
8C47 	CALL DisplayFinalScore
	; Wait a few seconds before leaving Game Over page
8C4A 	LD   B,14h
8C4C 	LD   HL,0000h
8C4F 	DEC  HL
8C50 	LD   A,H
8C51 	OR   L
8C52 	JR   NZ,8C4Fh
8C54 	DJNZ 8C4Fh
8C56 	JP   7C29h


GameOverTXT:       ; 08C59h
	DEFB 047h      ; BRIGHT WHITE
	DB "GAME OVE", ("R"+80h)

L8C63:        ; 08C63h
8C63 	CALL PrepSpriteDraw
8C66 	CALL CollisionDetect	; Carry Flag set iff in collision
8C69 	JR   C,8C6Eh			; Jump if in collision
8C6B 	JP   92E0h				; Exit

8C6E 	CALL 9F56h
8C71 	LD   (IX+00h),00h		; Remove object from game
8C75 	CALL 0A485h

		; Eaten some food.  Add 64 energy ensuring it doesn't go over the maximum value of 240.
8C78 	LD   C,40h
8C7A 	LD   A,(ChickenEnergy)
8C7D 	ADD  A,C
8C7E 	JR   C,8C84h		; Handle if went over 256 (byte overflow)
8C80 	CP   EnergyMax		; Handle if went over 240 (max)
8C82 	JR   C,8C86h
8C84 	LD   A,EnergyMax		; Set max value
8C86 	LD   (ChickenEnergy),A
8C89 	JP   UpdateChicken

8C8C 	DEC  A
8C8D 	LD   (5E3Ch),A
8C90 	JR   Z,UnflashScore
8C92 	AND  0Fh
8C94 	CALL Z,PlayRespawnBeep

; Make the scoreboard flash (during new life)
FlashScore:
8C97 	LD   HL,50C8h
8C9A 	CALL CalcAttrAddr
8C9D 	LD   B,06h	; 6 digits of score
8C9F 	LD   A,(HL)
8CA0 	OR   80h		; Apply Flash
8CA2 	LD   (HL),A
8CA3 	INC  HL
8CA4 	DJNZ 8C9Fh
8CA6 	RET

; Unflash the Score Board
UnflashScore:
8CA7 	LD   HL,50C8h
8CAA 	CALL CalcAttrAddr
8CAD 	LD   B,06h		; 6 digits of score
8CAF 	LD   A,(HL)
8CB0 	AND  7Fh		; Remove Flash
8CB2 	LD   (HL),A
8CB3 	INC  HL
8CB4 	DJNZ 8CAFh
8CB6 	RET

8CB7 	LD   A,(5E3Ch)
8CBA 	AND  A
8CBB 	JR   NZ,8C8Ch
8CBD 	LD   A,(FRAMES)
8CC0 	AND  03h
8CC2 	JP   NZ,8D12h
8CC5 	INC  (IX+06h)
8CC8 	LD   A,(IX+07h)
8CCB 	CALL LookupSpriteBitmapDataA
8CCE 	LD   A,(DE)
8CCF 	CP   (IX+06h)
8CD2 	JR   Z,8D32h
8CD4 	PUSH DE
8CD5 	PUSH HL
8CD6 	LD   B,H
8CD7 	LD   C,L
8CD8 	LD   A,(IX+04h)
8CDB 	LD   (IX+02h),A
8CDE 	SUB  (IX+06h)
8CE1 	LD   (IX+04h),A
8CE4 	LD   L,(IX+06h)
8CE7 	LD   H,00h
8CE9 	ADD  HL,HL
8CEA 	ADD  HL,DE
8CEB 	LD   A,H
8CEC 	LD   (BC),A
8CED 	DEC  BC
8CEE 	LD   A,L
8CEF 	LD   (BC),A
8CF0 	PUSH HL
8CF1 	LD   C,(HL)
8CF2 	LD   B,(IX+00h)
8CF5 	PUSH BC
8CF6 	LD   (HL),01h
8CF8 	LD   A,(IX+07h)       ; Assign Player Sprite (08=Knight; 18=Wizard; 28=Serf)
8CFB 	LD   (IX+00h),A
8CFE 	CALL PrepAndRedrawSprite
8D01 	POP  BC
8D02 	POP  HL
8D03 	LD   (HL),C
8D04 	LD   (IX+00h),B
8D07 	LD   A,(IX+02h)
8D0A 	LD   (IX+04h),A
8D0D 	POP  HL
8D0E 	POP  DE
8D0F 	LD   (HL),D
8D10 	DEC  HL
8D11 	LD   (HL),E
8D12 	LD   A,(IX+05h)
8D15 	PUSH AF
8D16 	LD   A,(FRAMES)
8D19 	RRCA
8D1A 	RRCA
8D1B 	AND  07h
8D1D 	JR   NZ,8D20h
8D1F 	INC  A
8D20 	OR   40h
8D22 	LD   (IX+05h),A
8D25 	LD   A,(IX+06h)
8D28 	CALL 92E2h
8D2B 	POP  AF
8D2C 	LD   (IX+05h),A
8D2F 	JP   0A45Fh

8D32 	LD   A,(IX+07h)
8D35 	LD   (IX+00h),A
8D38 	LD   (IX+06h),00h
8D3C 	LD   (IX+07h),00h
8D40 	LD   (IX+02h),00h
8D44 	RET

8D45 	LD   A,(FRAMES)
8D48 	AND  03h
8D4A 	JR   Z,8D12h
8D4C 	DEC  (IX+06h)
8D4F 	JP   M,8D5Bh
8D52 	LD   A,(IX+07h)
8D55 	CALL LookupSpriteBitmapDataA
8D58 	JP   8CD4h

8D5B 	CALL AddGravestone
8D5E 	JP   9443h

	; Copy a large 5K block to working area at top of memory
8D61 	LD   HL,TemplateStart      ; =600D
8D64 	LD   DE,GameDataStart      ; =EA90
8D67 	LD   BC,TemplateBlockSize  ; =1570 (5488d bytes)
8D6A 	LDIR
8D6C 	RET


	; This is used when entering a room to force the player's character to
	; continue to move into the room for a bit.  Acted on Player object (IX=PlayerSprite)
	; Reduces (IX+02) from 15 to 0 if not already zero.
8D6D 	LD   A,(IX+02h)
8D70 	AND  0Fh
8D72 	RET  Z
8D73 	DEC  (IX+02h)
8D76 	RET

8D77 	LD   A,(PlayerRoomNo)
8D7A 	LD   (0EE59h),A
8D7D 	PUSH BC
8D7E 	PUSH DE
8D7F 	PUSH HL
8D80 	CALL 8D6Dh	; Reduce IX+02 if not zero
8D83 	LD   A,(IX+02h)
8D86 	OR   30h
8D88 	LD   (IX+02h),A
8D8B 	CALL PrepSpriteDraw
8D8E 	CALL ScanKeys
8D91 	LD   C,A
8D92 	POP  HL
8D93 	LD   DE,0000h
8D96 	BIT  1,C
8D98 	JR   NZ,8D9Eh
8D9A 	LD   A,B	; Left Key pressed!
8D9B 	NEG
8D9D 	LD   E,A
8D9E 	BIT  0,C
8DA0 	JR   NZ,8DA3h
8DA2 	LD   E,B	; Right Key pressed!
8DA3 	BIT  2,C
8DA5 	JR   NZ,8DA8h
8DA7 	LD   D,B	; Down Key pressed!
8DA8 	BIT  3,C
8DAA 	JR   NZ,8DB0h
8DAC 	LD   A,B	; Up Key pressed!
8DAD 	NEG
8DAF 	LD   D,A
8DB0 	POP  HL		; HL=Player Momentum Reduction Rates (+ve; L=X; H=Y)
8DB1 	CALL ReducePlayerMomentum
8DB4 	POP  HL
8DB5 	CALL CalcPlayerDxDy
8DB8 	CALL MovePlayer
8DBB 	CALL TestInDoorway
8DBE 	CALL 900Ah
8DC1 	JP   MoveDeltaDxDy

SerfRoutine:   ; 8DC4
8DC4 	LD   BC,2020h	; Player Speed (C=X; B=Y; Min=10h (v. slow); Max=40h (shot speed))
8DC7 	LD   DE,0101h
8DCA 	LD   HL,0707h
8DCD 	CALL 8D77h
8DD0 	LD   E,(IX+06h)	; dx (moving in X?)
8DD3 	LD   D,(IX+07h)	; dy (moving in Y?)
8DD6 	LD   A,D
8DD7 	OR   E
8DD8 	JR   Z,8E0Fh
		; Serf is moving...
8DDA 	LD   A,(FRAMES)
8DDD 	AND  03h
8DDF 	JR   NZ,8E0Fh
		; Cycle sprite animation
8DE1 	LD   A,(IX+00h)
8DE4 	AND  03h
8DE6 	ADD  A,21h
8DE8 	LD   (IX+00h),A
		; Compare magnitudes of dx and dy
8DEB 	LD   A,D
8DEC 	AND  A
8DED 	JP   P,8DF2h
8DF0 	NEG
8DF2 	LD   C,A		; C=ABS(dy)
8DF3 	LD   A,E
8DF4 	AND  A
8DF5 	JP   P,8DFAh
8DF8 	NEG
8DFA 	CP   C			; A=ABS(dx); C=ABS(dy)
8DFB 	JR   NC,8E1Ah	; Jump if dx > dy
8DFD 	LD   A,D
8DFE 	AND  A
8DFF 	LD   A,(IX+00h)
8E02 	JP   M,8E07h
8E05 	ADD  A,04h		; Switch to Facing Right (=Down)
8E07 	ADD  A,08h		; Switch  from Horizontal Facing (lt/rt) to Vertical Facing (up/dn)
8E09 	LD   (IX+00h),A	; Store

8E0C 	CALL PlayFootstepSound
8E0F 	CALL ScanKeys
8E12 	AND  10h
8E14 	CALL Z,SerfTryShoot	; Fire Key pressed!
8E17 	JP   8E78h			; Fire Key not pressed!

8E1A 	LD   A,E			; A=dx
8E1B 	AND  A
8E1C 	LD   A,(IX+00h) 	; Facing Left
8E1F 	JP   M,8E09h
8E22 	ADD  A,04h			; Switch to Facing Right
8E24 	JR   8E09h

KnightRoutine:   ; 8E26
8E26 	LD   BC,2020h	; Player Speed (C=X; B=Y; Min=10h (v. slow); Max=40h (shot speed))
8E29 	LD   DE,0303h
8E2C 	LD   HL,0707h
8E2F 	CALL 8D77h
8E32 	LD   E,(IX+06h) ; dx (moving in X?)
8E35 	LD   D,(IX+07h)	; dy (moving in Y?)
8E38 	LD   A,D
8E39 	OR   E
8E3A 	JR   Z,8E70h
		; Knight is moving...
8E3C 	LD   A,(FRAMES)
8E3F 	AND  03h
8E41 	JR   NZ,8E70h
		; Cycle sprite animation
8E43 	LD   A,(IX+00h)
8E46 	AND  03h
8E48 	INC  A
8E49 	LD   (IX+00h),A
		; Compare magnitudes of dx and dy
8E4C 	LD   A,D
8E4D 	AND  A
8E4E 	JP   P,8E53h
8E51 	NEG
8E53 	LD   C,A		; C=ABS(dy)
8E54 	LD   A,E
8E55 	AND  A
8E56 	JP   P,8E5Bh
8E59 	NEG
8E5B 	CP   C			; A=ABS(dx); C=ABS(dy)
8E5C 	JR   NC,8E94h	; Jump if dx > dy
8E5E 	LD   A,D
8E5F 	AND  A
8E60 	LD   A,(IX+00h)
8E63 	JP   M,8E68h
8E66 	ADD  A,04h		; Switch to Facing Right (=Down)
8E68 	ADD  A,08h		; Switch from Horizontal Facing (lt/rt) to Vertical Facing (up/dn)
8E6A 	LD   (IX+00h),A	; Store

8E6D 	CALL PlayFootstepSound
8E70 	CALL ScanKeys
8E73 	AND  10h
8E75 	CALL Z,KnightTryShoot	; Fire Pressed
8E78 	CALL L83EA
8E7B 	LD   A,(GameClock)
8E7E 	AND  0Fh
8E80 	JR   NZ,8E8Eh

        ; Normal wastage of chicken energy
8E82 	LD   A,(ChickenEnergy)
8E85 	DEC  A
8E86 	JR   Z,LoseLife
8E88 	LD   (ChickenEnergy),A

8E8B 	CALL UpdateChicken
8E8E 	CALL 9FCAh
8E91 	JP   0A01Ah

8E94 	LD   A,E			; A=dx
8E95 	AND  A
8E96 	LD   A,(IX+00h) 	; Facing Left
8E99 	JP   M,8E6Ah
8E9C 	ADD  A,04h			; Switch to Facing Right
8E9E 	JR   8E6Ah


LoseLife:   ; 8EA0
8EA0 	LD   A,(LivesLeft)
8EA3 	AND  A
8EA4 	JP   Z,GameOverMsg
8EA7 	DEC  A
8EA8 	LD   (LivesLeft),A
8EAB 	LD   A,(IX+00h)
8EAE 	DEC  A
8EAF 	CP   30h
8EB1 	JR   C,8EC6h
8EB3 	LD   A,(PlayerSprite)
8EB6 	LD   (PlayerMomentumY),A
8EB9 	CALL LookupSpriteBitmapDataA
8EBC 	LD   A,(DE)
8EBD 	LD   (PlayerMomentumX),A
8EC0 	LD   A,67h
8EC2 	LD   (PlayerSprite),A
8EC5 	RET

8EC6 	LD   A,(SpriteXPos)
8EC9 	LD   (PlayerXPos),A
8ECC 	LD   A,(SpriteYPos)
8ECF 	LD   (PlayerYPos),A
8ED2 	LD   A,(SpriteID)
8ED5 	JR   8EB6h

        ; Ghost ran into you.  Lose 32 energy!
DoGhostDamageImpl:   ; 8ED7
8ED7 	LD   A,(ChickenEnergy)
8EDA 	SUB  20h
8EDC 	JR   Z,.skip1 ; Energy dropped to zero, lose a life.
8EDE 	JR   NC,8EE9h ; Energy left. Okay.
8EE0 	XOR  A	; Energy dropped below zero. Set to zero, lose a life.
.skip1	LD   (ChickenEnergy),A
8EE4 	CALL UpdateChicken
8EE7 	JR   LoseLife
8EE9 	LD   (ChickenEnergy),A
8EEC 	JP   UpdateChicken



CalcPlayerDxDy:   ; 8EEF
		; IX = Address of PlayerSprite object
		; Returns L=DY; H=DY
		LD   A,(IX+02h)	; Are we Entering a Room/Controling Player movement?
		AND  0Fh        ; If so, use the alternative routine instead which just uses Momentum.
		JR   NZ, CalcEnterRoomDxDy

		; IX = Address of PlayerSprite object
		; It uses the momentum values in (IX+06h) and (IX+07h) and also the keyboard direction values
		; in L and H registers to calculate the correct DX and DY values to move the player.
		; DX and DY values are saved in E and D registers respectively.
		; Whichever value (momentum or direction key) is greater is used.  As direction keys are always
		; 20 or E0 when engaged, these always override momentum but momentum wins if direction key is not engaged.
		LD   A,E
		ADD  A,(IX+06h)		; A=PlayerMomentumX
		JP   M, .left		; Moving Left?
		CP   L
		JR   C, .saveDx
		LD   A,L
.saveDx LD   (IX+06h),A   ; 8F01
		LD   A,D
		ADD  A,(IX+07h)
		JP   M,8F2Bh
		CP   H
		JR   C, .saveDy
		LD   A,H
.saveDy LD   (IX+07h),A   ; 8F0F
		LD   A,(IX+06h)
		CALL SignedHighNibbleToLow	; Signed A/16
		LD   E,A
		LD   A,(IX+07h)
		CALL SignedHighNibbleToLow	; Signed A/16
		LD   D,A
		RET
.left	NEG			; 8F21   Negate PlayerMomentumX to look at magnitude
		CP   L		;        Select MAX(PlayerMomentumX, L)
		JR   C, .left0
		LD   A,L
.left0	NEG			;        Restore sign/direction
		JR   .saveDx
.up 	NEG			; 8F2B   Negate PlayerMomentumY to look at magnitude
		CP   H 		;        Select MAX(PlayerMomentumY, H)
		JR   C, .up0
		LD   A,H
.up0	NEG			; 8F31   Restore sign/direction
		JR   .saveDy

	; This code is called for 15 frames when the player is entering the room.
	; IX = Address of PlayerSprite object
	; It uses the momentum values in (IX+06h) and (IX+07h), to calculate the
	; correct DX and DY values to move the player.
	; DX and DY values are saved in E and D registers respectively.
	; DX and DY values will be -2, 0 or 2 which equate to pixels moved this frame.
CalcEnterRoomDxDy:   ; 8F35
		LD   A,(IX+06h)	; Read X direction (00, 20 or E0)
		AND  A
		JP   M, .left	; If left momentum...
		AND  0F0h
		JR   Z, .saveDx
		LD   A,02h   ; DX=2 (right)
.saveDx LD   E,A    ; 8F42
		LD   A,(IX+07h)	; Read Y direction (00, 20 or E0)
		AND  A
		JP   M, .up	; If up momentum...
		AND  0F0h
		JR   Z, .saveDy
		LD   A,02h   ; 8F4E   DY=2 (down)
.saveDy LD   D,A     ; 8F50
		RET
.left   ; 8F52
		NEG
		AND  0F0h
		JR   Z, .saveDx
		LD   A,0FEh   ; DX=-2 (left)
		JR   .saveDx
.up    ; 8F5C
		NEG
		AND  0F0h
		JR   Z, .saveDy
		LD   A,0FEh   ; DY=-2 (up)
		JR    .saveDy


MoveDeltaDxDy:   ; 8F66
		; If the appropriate bits are set in the sprite then
		; move X and Y by delta values in E and D.
8F66 	BIT  4,(IX+02h)	; Can we move in X?
8F6A 	JR   NZ,8F73h
8F6C 	LD   A,E		; = DX
8F6D 	ADD  A,(IX+03h)
8F70 	LD   (IX+03h),A
8F73 	BIT  5,(IX+02h) ; Can we move in Y?
8F77 	RET  NZ
8F78 	LD   A,D		; = DY
8F79 	ADD  A,(IX+04h)
8F7C 	LD   (IX+04h),A
8F7F 	RET

SignedHighNibbleToLow:   ; 8F80
		; Returns signed high nibble A back in A
		; When A < 128 then returns INT (A / 16)
		; When A = 128 then returns -7
		; When A > 128 then returns -6 ... 0
8F80 	AND  A
8F81 	JP   P,HighNibbleToLow
8F84 	NEG
8F86 	RRCA
8F87 	RRCA
8F88 	RRCA
8F89 	RRCA
8F8A 	AND  0Fh
8F8C 	NEG
8F8E 	RET

HighNibbleToLow:   ; 8F8F
8F8F 	RRCA
8F90 	RRCA
8F91 	RRCA
8F92 	RRCA
8F93 	AND  0Fh   ; Mask lower nibble only
8F95 	RET



ReducePlayerMomentum:   ; 8F96
		; Skip this function if doing the 15-frame "Enter Room" countdown
	 	LD   A,(IX+02h)
	 	AND  0Fh
	 	RET  NZ

		; Start with PlayerMomentumX
		; If no momentum in X then skip.
		; Otherwise reduce momentum in right or left direction ensuring
		; that we don't over/underflow, then save back.
	 	LD   A,(IX+06h)
	 	AND  A
	 	JR   Z, .skip     ; No momentum, skip
	 	JP   M, .left
		; right
		SUB  L            ; Reduce momentum by L but don't drop below 0
		JP   P, .saveX
.clampX	XOR  A            ; 8FA9
.saveX 	LD   (IX+06h),A	  ; 8FAA   Save back
		; up/down
.skip 	LD   A,(IX+07h)   ; 8FAD   PlayerMomentumY
		AND  A
		RET  Z            ; No momentum, exit
		JP   M, .up
		; down
		SUB  H            ; Reduce down
		JP   P, .saveY
.clampY	XOR  A            ; 8FB9   Clamp Y
.saveY	LD   (IX+07h),A	  ; 8FBA   Save back
		RET
.left 	ADD  A,L          ; 8FBE
		JP   M, .saveX
		JR   .clampX
.up 	ADD  A,H         ; 8FC4
		JP   M, .saveY
		JR   .clampY

MovePlayer:   ; 8FCA
8FCA 	PUSH DE			; Save DY for later
8FCB 	LD   A,E		; DX
8FCC 	ADD  A,(IX+03h) ; X+DX
8FCF 	LD   E,A
8FD0 	LD   D,(IX+04h) ; Y
8FD3 	LD   B,10h
8FD5 	CALL MovePlayerBoundsCheck
8FD8 	POP  DE			; Recover DY (D register)
8FD9 	PUSH DE
8FDA 	LD   E,(IX+03h) ; X
8FDD 	LD   A,D		; DY
8FDE 	ADD  A,(IX+04h) ; Y
8FE1 	LD   D,A
8FE2 	LD   B,20h
8FE4 	CALL MovePlayerBoundsCheck
8FE7 	POP  DE
8FE8 	RET

MovePlayerBoundsCheck:   ; 8FE9
;		This call checks whether we are outside the room bounds at (X+DX,Y) and also at (X,Y+DY)
;		If room bounds are not breached, we RESET bit 4 (X) or 5 (Y) of (IX+02) so allow that
;		movement to take place
8FE9 	LD   HL,RoomSize  ; HL = Address of "Half Room Width" (pixels)
8FEC 	LD   A,E          ; A  = X position (pixels)
8FED 	SUB  58h          ; Make X position origin the centre of the room
8FEF 	JP   P,8FF4h
8FF2 	NEG               ; Make X position absolute
8FF4 	CP   (HL)         ; Compare
8FF5 	RET  NC           ; Exit with NC if outside room bounds
8FF6 	INC  HL           ; HL = Address of "Half Room Height" (pixels)
8FF7 	LD   A,D          ; A = Y position (pixels)
8FF8 	SUB  68h          ; Make Y position origin the centre of the room
8FFA 	JP   P,8FFFh
8FFD 	NEG               ; Make Y position absolute
8FFF 	CP   (HL)         ; Compare
9000 	RET  NC           ; Exit with NC if outside room bounds
9001 	LD   A,B          ; This is the action bit (B is either 10h or 20h)
9002 	CPL               ; A is now either 0EFh or 0DFh
9003 	AND  (IX+02h)     ;
9006 	LD   (IX+02h),A
9009 	RET

900A 	PUSH DE
900B 	LD   A,E
900C 	ADD  A,(IX+03h)
900F 	LD   E,A
9010 	LD   D,(IX+04h)
9013 	LD   A,10h
9015 	EX   AF,AF'
9016 	CALL 902Bh
9019 	POP  DE
901A 	PUSH DE
901B 	LD   E,(IX+03h)
901E 	LD   A,D
901F 	ADD  A,(IX+04h)
9022 	LD   D,A
9023 	LD   A,20h
9025 	EX   AF,AF'
9026 	CALL 902Bh
9029 	POP  DE
902A 	RET

902B 	LD   C,(IX+01h)
902E 	LD   B,00h
9030 	LD   HL,BackLocPtr
9033 	SLA  C
9035 	RL   B
9037 	ADD  HL,BC
9038 	LD   C,(HL)
9039 	INC  HL
903A 	LD   B,(HL)
903B 	LD   A,(BC)
903C 	INC  BC
903D 	LD   L,A
903E 	LD   A,(BC)
903F 	INC  BC

	; Look up address of room
9040 	LD   H,A
9041 	OR   L
9042 	RET  Z
9043 	PUSH BC
9044 	LD   BC,BackLocPtr
9047 	AND  A

		; Read
9048 	SBC  HL,BC
904A 	INC  HL
904B 	LD   A,(HL)
904C 	CP   (IX+01h)
904F 	JR   Z,9055h
9051 	LD   BC,0008h
9054 	ADD  HL,BC
9055 	INC  HL
9056 	INC  HL
9057 	LD   C,(HL)
9058 	INC  HL
9059 	LD   B,(HL)
905A 	INC  HL
905B 	LD   A,(HL)
905C 	INC  HL
905D 	BIT  2,A
905F 	JR   NZ,909Bh
9061 	BIT  3,A
9063 	JR   NZ,9098h
9065 	LD   A,(HL)
9066 	SRA  A
9068 	SRA  A
906A 	AND  0FCh
906C 	ADD  A,C
906D 	SUB  E
906E 	NEG
9070 	LD   C,A
9071 	LD   A,(HL)
9072 	RLCA
9073 	RLCA
9074 	AND  3Ch
9076 	INC  HL
9077 	CP   C
9078 	JR   C,9098h
907A 	LD   A,(HL)
907B 	SRA  A
907D 	SRA  A
907F 	AND  0FCh
9081 	ADD  A,B
9082 	SUB  D
9083 	LD   B,A
9084 	LD   A,(HL)
9085 	INC  HL
9086 	RLCA
9087 	RLCA
9088 	AND  3Ch
908A 	CP   B
908B 	JR   C,9098h
908D 	EX   AF,AF'
908E 	LD   C,A
908F 	EX   AF,AF'
9090 	LD   A,C       ; A = 10h if doing "X" or 20h if doing "Y"
9091 	CPL
9092 	AND  (IX+02h)
9095 	LD   (IX+02h),A
9098 	POP  BC
9099 	JR   903Bh

909B 	LD   A,(HL)
909C 	SRA  A
909E 	SRA  A
90A0 	AND  0FCh
90A2 	ADD  A,C
90A3 	SUB  E
90A4 	NEG
90A6 	LD   C,A
90A7 	LD   A,(HL)
90A8 	RLCA
90A9 	RLCA
90AA 	AND  3Ch
90AC 	INC  HL
90AD 	CP   C
90AE 	JR   C,9098h
90B0 	LD   A,(HL)
90B1 	SRA  A
90B3 	SRA  A
90B5 	AND  0FCh
90B7 	ADD  A,B
90B8 	SUB  D
90B9 	LD   B,A
90BA 	LD   A,(HL)
90BB 	INC  HL
90BC 	RLCA
90BD 	RLCA
90BE 	AND  3Ch
90C0 	CP   B
90C1 	JR   C,9098h
90C3 	EX   AF,AF'
90C4 	LD   C,A
90C5 	EX   AF,AF'
90C6 	LD   A,C
90C7 	OR   (IX+02)
90CA 	JR   9095h


; Some collision detection whereby C flag is set if player is colliding with the current object referenced by IX
90CC 	LD   A,(Player02)
90CF 	AND  0Fh
90D1 	RET  NZ
90D2 	LD   A,(PlayerSprite)
90D5 	DEC  A
90D6 	CP   30h
90D8 	RET  NC            ; Exit if player isn't alive
90D9 	BIT  6,(IX+05h)
90DD 	JR   Z,90E1h
90DF 	SRL  C
90E1 	LD   A,(PlayerXPos)
90E4 	SUB  (IX+03h)
90E7 	CP   C
90E8 	RET  NC            ; Exit if no collision in X
90E9 	BIT  6,(IX+05)
90ED 	JR   NZ,90F1h
90EF 	SRL  B
90F1 	LD   A,(PlayerYPos)
90F4 	SUB  (IX+04h)
90F7 	NEG
90F9 	CP   B
90FA 	RET

CollisionDetect:   ; 90FB
	; Tests location of Sprite at IX against Player location
	; Returns with carry flag set if they are within 12 pixels of each other
90FB 	LD   A,(PlayerXPos)
90FE 	SUB  (IX+03h)
9101 	JP   P,9106h
9104 	NEG
9106 	CP   0Ch
9108 	RET  NC
9109 	LD   A,(PlayerYPos)
910C 	SUB  (IX+04h)
910F 	JP   P,9114h
9112 	NEG
9114 	CP   0Ch
9116 	RET

9117 	CALL SwitchToTwinObject
911A 	LD   A,(IX+01h)
911D 	LD   (PlayerRoomNo),A
9120 	LD   A,(IX+02h)
9123 	RLCA
9124 	AND  1Eh
9126 	ADD  A,(IX+03h)
9129 	LD   (PlayerXPos),A
912C 	LD   A,(IX+02h)
912F 	RRCA
9130 	RRCA
9131 	RRCA
9132 	AND  1Eh
9134 	NEG
9136 	ADD  A,(IX+04h)
9139 	LD   (PlayerYPos),A
913C 	CALL L986A
913F 	LD   A,(Player02)
9142 	OR   0Fh
9144 	LD   (Player02),A
9147 	LD   A,(PlayerRoomNo)
914A 	CALL MarkRoomAsVisited
914D 	CALL ClrGameWindow
9150 	CALL DrawScreen
9153 	CALL DisplayPanel
9156 	CALL 0A13Bh
9159 	CALL 0A403h
915C 	JP   7DC3h

ExecuteAltOpenDoor:   ; 915F
915F 	LD   A,(GameClock)
9162 	AND  01h
9164 	JP   NZ, ExecuteOpenDoor
		; As door timer reached zero?
9167 	LD   A,(OpenCloseTimer)
916A 	AND  A
916B 	JR   Z,9174h
916D 	DEC  A
916E 	LD   (OpenCloseTimer),A
9171 	JP   ExecuteOpenDoor

9174 	LD   A,(InDoorway)
9177 	AND  A
9178 	JP   NZ, ExecuteOpenDoor      ; JP if in a doorway
917B 	JR   9193h

ExecuteClosedDoor:   ; 917D
917D 	LD   A,(GameClock)
9180 	AND  01
9182 	JP   NZ, ExecuteDecoration
9185 	LD   A,(OpenCloseTimer)
9188 	AND  A
9189 	JP   Z,9193h
918C 	DEC  A
918D 	LD   (OpenCloseTimer),A
9190 	JP   ExecuteDecoration

9193 	LD   A,5Eh						       ; Reset OpenCloseTime
9195 	LD   (OpenCloseTimer),A
9198 	LD   A,(IX+05h)
919B 	PUSH AF
919C 	OR   03h
919E 	LD   (IX+05h),A
91A1 	CALL DrawRoutineLookupAndDispatchIX
91A4 	LD   A,(IX+00)
91A7 	XOR  01									; Toggle between open and closed door
91A9 	CALL SetObjectSpriteIDAndTwin			; Assign new SpriteID to self and twin
91AC 	CALL DrawRoutineLookupAndDispatchIX
91AF 	POP  AF
91B0 	LD   (IX+05h),A
91B3 	CALL 9546h
91B6 	CALL ExecuteDecoration
91B9 	JP   0A46Eh

ExecuteTrapdoorClosed:   ;  91BC
91BC 	LD   A,(GameClock)
91BF 	AND  A
91C0 	JP   NZ, ExecuteDecoration
91C3 	JR   ExecuteTrapdoorOpen.run

ExecuteTrapdoorOpen:   ; 91C5
		LD   A,(5E05h)
		AND  A
		JP   NZ,L9731
.run	LD   A,(IX+05h)
91CF 	PUSH AF
91D0 	OR   03               ; Set bits 0 and 1 of Object's Flags
91D2 	LD   (IX+05h),A
91D5 	CALL DrawRoutineLookupAndDispatchIX
91D8 	LD   A,(IX+00h)
91DB 	XOR  01h			  ; Toggle object's sprite between Open and Closed Trapdoor states
91DD 	LD   (IX+00h),A
91E0 	CALL DrawRoutineLookupAndDispatchIX
91E3 	POP  AF
91E4 	LD   (IX+05h),A
91E7 	CALL ExecuteDecoration
91EA 	JP   0A46Eh

ExecuteLargeDoor:   ; 91ED
91ED 	LD   BC,2020h	; Door is 32x32 pixels in size?
91F0 	JR   ExecuteOpenDoor.run


ExecuteOpenDoor:   ; 91F2
; Process an open (not closed!) Room or Cavern Door
		LD   BC,1111h	; Door is 17x17 pixels in size?
.run 	CALL 90CCh
		CALL C,9117h
		JP   ExecuteDecoration


ExecuteDecoration:   ; 91FE
91FE 	LD   E,(IX+03h)     ; E = X Pos (pixels)
9201 	LD   D,(IX+04h)     ; D = Y Pos (pixels)
9204 	DEC  D
9205 	LD   C,(IX+00h)     ; C = SpriteID
9208 	LD   B,(IX+05h)     ; B = Flags
920B 	CALL DrawAttrRoutineLookupAndDispatch
920E 	LD   A,(RoomInPlay)
9211 	AND  A
9212 	RET  NZ
		; ...
DrawRoutineLookupAndDispatchIX:   ; 9213
9213 	LD   E,(IX+03h)     ; E = X Pos (pixels)
9216 	LD   D,(IX+04h)     ; D = Y Pos (pixels)
9219 	LD   C,(IX+00h)     ; C = SpriteID
921C 	LD   B,(IX+05h)     ; B = Flags
921F 	JP   DrawRoutineLookupAndDispatch

CheckHaveKeyForDoor:
; Looks to see if player is in posession of the correct coloured key to match the
; locked door object referenced by IX.
; Returns C flag set if door is openable
9222 	LD   A,(IX+00)
9225 	AND  03h			; A = Key Colour (00=Red; 01=Green; 02=Blue; 03=Yellow)
9227 	LD   HL,DoorsColourTable
922A 	CALL Add_HL_A
		; Do we have the correct key?
922D 	LD   D,(HL)                     ; D = Colour of Locked Door referenced by IX
922E 	LD   E, SprGfxObjColourKeyIdx+1	; E = 81h = SpriteID+1 = Colour Key Sprite
9230 	CALL SearchInventory
9233 	JP   NZ,923Fh
9236 	CALL OpenDoor
9239 	LD   BC,1111h
923C 	JP   90CCh

923F 	CALL CloseDoor
9242 	AND  A
9243 	RET

ExecuteLockedRoomDoor:   ; 9244
9244 	CALL CheckHaveKeyForDoor
9247 	JP   NC, ExecuteDecoration
		; Set door (and twin) to open room state
924A 	LD   A, BkSprOpnRmDoorIdx + 1
924C 	CALL SetObjectSpriteIDAndTwin
924F 	JP   9117h

ExecuteLockedCavernDoor:   ; 9252
9252 	CALL CheckHaveKeyForDoor
9255 	JP   NC, ExecuteDecoration
9258 	LD   A,01h
925A 	JR   924Ch


DoorsColourTable:  ; 0925Ch
	; These bytes determine the colours of the Red, Green, Blue and Yellow keys respectively
	DB 042h,044h,045h,046h		; BRIGHT RED, BRIGHT GREEN, BRIGHT CYAN, BRIGHT YELLOW


SetObjectSpriteIDAndTwin:   ; 9260
		; Sets a new SpriteID for the object referenced by IX along with it's twin
9260 	PUSH IX
9262 	POP  HL
9263 	LD   (HL),A
9264 	EX   AF,AF'		; Save A while toggling to twin
9265 	LD   A,L
9266 	XOR  08h
9268 	LD   L,A
9269 	EX   AF,AF'
926A 	LD   (HL),A
926B 	RET


Add_HL_A:          ; 0926Ch
926C 	ADD  A,L
926D 	LD   L,A
926E 	LD   A,H
926F 	ADC  A,00h
9271 	LD   H,A
9272 	RET


SearchInventory:   ; 9273  Checks player's inventory for an object which matches sprite ID and colour.
		; E = SpriteID (+1) of object to find
		; D = Colour of Object to find
		; Returns: Z flag is set if found
		LD   B,03h
		LD   HL,Inventory+2
.loop		LD   A,(HL)
		CP   E
		INC  HL
		JR   NZ, .next
		LD   A,(HL)
		CP   D
		RET  Z
.next	INC  HL
		INC  HL
		INC  HL
		DJNZ .loop
		RET

SwitchToTwinObject:   ; 9286
		; All doors, trapdoors and secret portals are paired with their  twin object in another room.
		; This routine switches IX to the twin object.
		PUSH IX
		POP  HL
		LD   A,L
		XOR  08h
		LD   L,A
		PUSH HL
		POP  IX
		RET

9291 	LD   IX,PlayerSprite
9295 	LD   A,(IX+00h)
9298 	AND  A
9299 	JR   Z,92A6h
929B 	LD   A,(PlayerRoomNo)
929E 	CP   (IX+01h)
92A1 	JR   NZ,92A6h
92A3 	CALL PrepAndRedrawSprite
92A6 	LD   DE,0008h
92A9 	ADD  IX,DE
92AB 	PUSH IX
92AD 	POP  HL
92AE 	LD   DE,GhostObjectsTable
92B1 	AND  A
92B2 	SBC  HL,DE
92B4 	JR   C,9295h
92B6 	LD   A,(IX+00h)
92B9 	AND  A
92BA 	JR   Z,92C7h
92BC 	LD   A,(PlayerRoomNo)
92BF 	CP   (IX+01h)
92C2 	JR   NZ,92C7h
92C4 	CALL PrepAndRedrawSprite
92C7 	LD   DE,0010h
92CA 	ADD  IX,DE
92CC 	PUSH IX
92CE 	POP  HL
92CF 	LD   DE,BackgroundTables
92D2 	AND  A
92D3 	SBC  HL,DE
92D5 	JR   C,92B6h
92D7 	RET

92D8 	LD   A,(5E1Fh)
92DB 	AND  0FDh
92DD 	LD   (5E1Fh),A           ; RESET bit 1
92E0 	LD   A,10h		         ; 16 pixels heigh
92E2 	LD   (5E11h),A
		; Set Sprite Char Width (2 or 3 depending on if Sprite is character aligned)
92E5 	LD   A,(IX+03h)	         ; Sprite X Pos
92E8 	AND  07h		         ; Inter Char
92EA 	LD   A,02h
92EC 	JR   Z,92EFh
92EE 	INC  A
92EF 	LD   (SpriteCharWidth),A ; 2 if character aligned; 3 if not
92F2 	JP   0A01Ah

92F5 	CALL PrepSpriteDraw
92F8 	LD   A,(CollectKeyPressed)
92FB 	AND  A
92FC 	JR   Z,92D8h              ; Jump if "Z" (Collect) key not pressed
92FE 	LD   A,(5E1Fh)
9301 	AND  03
9303 	JR   NZ,92E0h
		;
9305 	LD   A,(PlayerSprite)
9308 	DEC  A
9309 	CP   30h
930B 	JR   NC,92E0h             ; Jump out of player is a tombstone
930D 	CALL CollisionDetect      ; Carry Flag set if in collision
9310 	JR   NC,92E0h             ; Jump out of not in collision
9312 	LD   A,(5E1Fh)
9315 	OR   03h
9317 	LD   (5E1Fh),A            ; SET bits 0 and 1
931A 	CALL 9358h
931D 	CALL 934Ch
9320 	CALL 9326h
9323 	JP   0A13Bh

9326 	LD   HL, Inventory
9329 	PUSH IX
932B 	POP  DE
932C 	LD   (HL),E
932D 	INC  HL
932E 	LD   (HL),D
932F 	INC  HL
9330 	LD   A,(IX+00h)
9333 	LD   (HL),A
9334 	INC  HL
9335 	LD   A,(IX+05h)
9338 	LD   (HL),A
9339 	CALL 9F56h
933C 	LD   A,(RoomColour)
933F 	LD   (IX+05h),A
9342 	CALL 0A01Ah
9345 	LD   (IX+00h),00h
9349 	JP   MakePickUpSound

934C 	LD   HL,5E37h
934F 	LD   DE,5E3Bh
9352 	LD   BC,0008h
9355 	LDDR
9357 	RET

9358 	LD   HL,5E38h
935B 	LD   E,(HL)
935C 	INC  HL
935D 	LD   D,(HL)
935E 	INC  HL
935F 	LD   A,D
9360 	OR   E
9361 	RET  Z
9362 	PUSH DE
9363 	LD   A,(HL)
9364 	INC  HL
9365 	LD   (DE),A
9366 	INC  DE
9367 	LD   A,(PlayerRoomNo)
936A 	LD   (DE),A
936B 	INC  DE
936C 	LD   A,80h
936E 	LD   (DE),A
936F 	INC  DE
9370 	LD   A,(PlayerXPos)
9373 	LD   (DE),A
9374 	INC  DE
9375 	LD   A,(PlayerYPos)
9378 	LD   (DE),A
9379 	INC  DE
937A 	LD   A,(HL)
937B 	LD   (DE),A
937C 	POP  DE
937D 	CALL MakeDropObjectSound
9380 	PUSH IX
9382 	PUSH DE
9383 	POP  IX
9385 	CALL PrepAndRedrawSprite
9388 	POP  IX
938A 	RET

ReadCollectKey:   ; 938B
		; Reads Port 7EFE (should be 7FFE?) and BIT 1 to determine if "Z" (Collect) key has been pressed.
		; Result is saved in variable (0 = Not Pressed; 2 = Pressed)
938B 	LD   A,07Eh
938D 	OUT  (0FDh),A
938F 	IN   A,(0FEh)
9391 	CPL
9392 	AND  02h
9394 	LD   (CollectKeyPressed),A
9397 	RET

ScanCursorKeys:
	; Read 56780 from two keybord ports and reorder bits to match Kempston (000FUDLR) but Active Low
9398 	LD   A,0EFh
939A 	OUT  (0FDh),A
939C 	IN   A,(0FEh)	; Read keys 6, 7, 8, 9, 0
939E 	LD   C,A
939F 	AND  08h		; Isolate bit 3 (Up="7") (correct position)
93A1 	LD   E,A		; Store
93A2 	LD   A,C		; Move bits 4 (Down="6") and 2 (Right="8") across 2 positions
93A3 	RRCA			; and also bit 0 (Fire="0") into bit 6
93A4 	RRCA
93A5 	AND  45h
93A7 	OR   E			; Combine
93A8 	LD   E,A		; Store
93A9 	RRCA			; Move Fire button on again from bit 6 to bit 4
93AA 	RRCA
93AB 	AND  10h		; Isolate
93AD 	OR   E			; Combine
93AE 	AND  1Fh		; Clean
93B0 	LD   E,A		; Store
93B1 	LD   A,0F7h
93B3 	OUT  (0FDh),A
93B5 	IN   A,(0FEh)	; Read Keys 1, 2, 3, 4, 5 ("5" = Left in bit 4)
93B7 	RRA				; Move bit 4 (Left="5") into bit 1
93B8 	RRA
93B9 	RRA
93BA 	AND  02h		; Isolate
93BC 	OR   E			; Combine
93BD 	RET				; Return


ScanKeys:   ; 93BE
	; Read the player's preferred keyboard/joystick
	; and return direction + fire in Accumulator (Active Low)
	; in Kempston Position (000FUDLR)
93BE 	LD   A,(ControlFlags)
93C1 	AND  06h
93C3 	JR   Z,ScanKeyboard  ; (5E00h) = xxxxx00x => Keyboard
93C5 	CP   04h
93C7 	JR   Z,ScanCursorKeys; (5E00h) = xxxxx10x => Cursor Keys

ScanKempston:
93C9 	IN   A,(01Fh)	; Read Kempston Joystick
93CB 	CPL	; 000FUDLR (Active Low)
93CC 	RET

ScanKeyboard:
	; Read QWERT and reorder bits to match Kempston (000FUDLR) but Active Low
93CD 	LD   A,0FBh
93CF 	OUT  (0FDh),A
93D1 	IN   A,(0FEh)	; Read keys Q, W, E, R, T (Keyboard)
	; Swap bits 0 (Left="Q") and 1 (Right="W") to match Kempston Layout (000FUDLR)
93D3 	LD   C,A
93D4 	RRA
93D5 	AND  01h	; xxxxxxx1
93D7 	LD   E,A	; Save
93D8 	LD   A,C
93D9 	RLA
93DA 	AND  02h	; xxxxxx1x
93DC 	OR   E		; Combine
93DD 	LD   E,A
	; Bits 2 (Down="E"), 3 (Up="R") and 4 (Fire="T") are already correctly positioned
93DE 	LD   A,C
93DF 	AND  1Ch	; xxx111xx
93E1 	OR   E		; Combine
93E2 	RET

;
93E3 	LD   A,(PlayerSprite)
93E6 	DEC  A
93E7 	CP   30h
93E9 	RET  NC	            ; Exit if not a Player Sprite
93EA 	LD   A,(CollectKeyPressed)
93ED 	AND  A
93EE 	JR   Z,9417h        ; Exit if "Z" (Collect) key isn't being pressed
93F0 	LD   A,(5E1Fh)
93F3 	AND  03h
93F5 	JR   NZ,940Eh
93F7 	OR   02h            ; SET bit 1
93F9 	LD   (5E1Fh),A
93FC 	CALL 9358h
93FF 	CALL 934Ch
		; Blank out Slot 1 of Inventory
9402 	LD   HL,0000h
9405 	LD   (Inventory),HL
9408 	LD   (Inventory+2),HL
940B 	CALL 0A13Bh
940E 	LD   A,(5E1Fh)
9411 	AND  0FEh
9413 	LD   (5E1Fh),A       ; RESET bit 0
9416 	RET

9417 	LD   A,(5E1Fh)
941A 	AND  0FDh
941C 	LD   (5E1Fh),A       ; RESET bit 1
941F 	JR   940Eh

ExecuteBarrel:   ; 9421
9421 	LD   A,(PlayerSprite)
9424 	SUB  21h               ; Take player sprite and bring into range 0..15 if happends to be a Serf
9426 	JR   ExecuteClock.run

ExecuteBookshelf:   ; 9428
9428 	LD   A,(PlayerSprite)
942B 	SUB  11h               ; Take player sprite and bring into range 0..15 if happends to be a Wizard
942D 	JR   ExecuteClock.run

ExecuteClock:   ; 942F
		LD   A,(PlayerSprite)
		DEC  A
.run:	CP   10h               ; Test if player sprite matches object to use as a portal
		JR   NC, .notPortal
		CALL OpenDoor
		JP   ExecuteOpenDoor   ; Treat Clock/Bookshelf/Barrel as an open door
.notPortal                     ; Treat Clock/Bookshelf/Barrel as a decoration
		CALL CloseDoor
		JP   ExecuteDecoration

9443 	LD   A,(ControlFlags)
9446 	RLCA
9447 	AND  30h
9449 	ADD  A,08h	                  ; A = Player Character (08 = Knight; 18 = Wizard; 28 = Serf)
944B 	LD   (TemplatePlayerObject+07h), A  ; Store in (IX+07h)
		; Assign sprite to room
944E 	LD   A,(PlayerRoomNo)
9451 	LD   (TemplatePlayerObject+01h), A
		; Copy over player sprite
9454 	LD   HL, TemplatePlayerObject
9457 	LD   DE, PlayerSprite
945A 	LD   BC,0008h
945D 	LDIR
		;
945F 	LD   A,68h
9461 	LD   (5E3Ch),A
9464 	LD   A,(LivesLeft)
9467 	CP   03h
9469 	JR   Z,9476h
946B 	PUSH IX
946D 	LD   IX, PlayerSprite
9471 	CALL PrepAndRedrawSprite
9474 	POP  IX
9476 	LD   A, EnergyMax
9478 	LD   (ChickenEnergy),A
947B 	CALL UpdateChicken
947E 	JP   0A2CEh


TemplatePlayerObject:   ; 9481
		;    SprID Room  -02-  -X-   -Y-   Colr  Time  Unkn
		DEFB 066h, 000h, 000h, 060h, 068h, 047h, 0FFh, 000h


PauseGameCheck:  ; 9489
9489 	DI

		; Is SPACE (Pause) key pressed?
948A 	LD   A,07Eh
948C 	OUT  (0FDh),A
948E 	IN   A,(0FEh)
9490 	BIT  0,A
9492 	RET  NZ	; Exit if not
9493 	CPL
9494 	AND  1Eh
9496 	RET  NZ ; Exit if any additional keys in half row ARE pressed
		; Loop while SPACE (Pause) key is still pressed
9497 	LD   A,7Eh
9499 	OUT  (0FDh),A
949B 	IN   A,(0FEh)
949D 	BIT  0,A
949F 	JR   Z,9497h
		; Game is now paused.
		; Loop until SPACE (Pause) key is pressed
94A1 	LD   A,7Eh
94A3 	OUT  (0FDh),A
94A5 	IN   A,(0FEh)
94A7 	BIT  0,A
94A9 	JR   NZ,94A1h
		; Loop until SPACE (Pause) key is released
94AB 	LD   A,7Eh
94AD 	OUT  (0FDh),A
94AF 	IN   A,(0FEh)
94B1 	BIT  0,A
94B3 	JR   Z,94ABh
94B5 	RET

94B6 	LD   A,(FRAMES)
94B9 	LD   C,A
94BA 	LD   A,(GameClock)
94BD 	ADD  A,C
94BE 	AND  07h
94C0 	LD   C,A
94C1 	ADD  A,A
94C2 	ADD  A,C
94C3 	LD   L,A
94C4 	LD   H,00h
94C6 	LD   BC,L94DD
94C9 	ADD  HL,BC
94CA 	EX   DE,HL
94CB 	LD   HL,6026h
94CE 	LD   BC,0008h
94D1 	LD   A,03h
94D3 	EX   AF,AF'
94D4 	LD   A,(DE)
94D5 	LD   (HL),A
94D6 	ADD  HL,BC
94D7 	INC  DE
94D8 	EX   AF,AF'
94D9 	DEC  A
94DA 	JR   NZ,94D3h
94DC 	RET


L94DD	DB 081h,045h,07Ch,085h,049h,02Bh,06Ah,03Bh
	DB 07Ch,069h,071h,02Bh,067h,085h,07Ch,068h
	DB 07Fh,02Bh,04Dh,073h,07Ch,017h,010h,02Bh
	DB 03Ah,012h,05Eh,06Fh,03Ah,078h,05Ch,0E6h
	DB 00Fh,0F6h,010h,067h,0D9h,021h,0E0h,0EEh
	DB 011h,0E8h,0EEh,001h,010h,000h,0D9h,07Eh
	DB 023h,0D9h,0FEh,070h,030h,00Ch,01Ah,0BEh
	DB 020h,008h,0FEh,001h,028h,00Bh,0FEh,002h
	DB 028h,023h

L951F:             ; 0951Fh
951F 	ADD  HL,BC
9520 	EX   DE,HL
9521 	ADD  HL,BC
9522 	RET  C
9523 	EX   DE,HL
9524 	JR   950Bh

9526 	LD   A,22h
9528 	LD   (DE),A
9529 	LD   (HL),A
952A 	PUSH DE
952B 	INC  DE
952C 	INC  DE
952D 	INC  DE
952E 	INC  DE
952F 	INC  DE
9530 	LD   A,(DE)
9531 	OR   08h
9533 	LD   (DE),A
9534 	POP  DE
9535 	PUSH HL
9536 	INC  HL
9537 	INC  HL
9538 	INC  HL
9539 	INC  HL
953A 	INC  HL
953B 	LD   A,(HL)
953C 	OR   08h
953E 	LD   (HL),A
953F 	POP  HL
9540 	JR   L951F

9542 	LD   A,20h
9544 	JR   9528h

9546 	LD   A,(IX+00)
9549 	AND  01
954B 	JR   Z, CloseDoor

OpenDoor:   ; 954D
		; This function RESETS bit 3 of flags for the current door referenced by IX.
		; Normal Doors: This is called once when it goes from Closed to Open.
		; Locked Doors: This is called every frame if you posess the matching key.
		; Secret Portals: This is called every frame if your character is appropriate for the object (Knight & Clock etc.)
		; Trapdoors: Not called for these
		LD   A,(IX+05)
		AND  0F7h			; Reset bit 3 of Flags on Door Object
		LD   (IX+05),A
		PUSH IX
		CALL SwitchToTwinObject
		LD   A,(IX+05)
		AND  0F7h			; Reset bit 3 of Flags on Door's Twin Object
		LD   (IX+05),A
		POP  IX
		RET

CloseDoor:   ; 9565
		; This function SETS bit 3 of flags for the current door referenced by IX.
		; Normal Doors: This is called once when it goes from Open to Closed.
		; Locked Doors: This is called every frame if you don't have the matching key.
		; Secret Portals: This is called every frame if your character is NOT appropriate for the object (Knight & Clock etc.)
		; Trapdoors: Not called for these
		LD   A,(IX+05h)
		OR   08h
		LD   (IX+05h),A
		PUSH IX
		CALL SwitchToTwinObject
		LD   A,(IX+05h)
		OR   08h
		LD   (IX+05h),A
		POP  IX
		RET

TestInDoorway:   ; 957D
		PUSH DE	; (Wizard Shooting related when near doorway)
		LD   B,00h      ; B register holds flag as to whether in doorway or not
		LD   HL,(RoomSize)
		INC  L
		INC  H
		LD   E,(IX+03h)	; X Pos
		LD   D,(IX+04h) ; Y Pos
		LD   A,E
		SUB  58h        ; Translate X so origin (0) is centre of room
		JP   P,9593h
		NEG             ; Make X Absolute
		CP   L          ; Compare with Half Room Width + 1
		JR   C,9597h
		INC  B          ; Add one to B if outside bounds of room
		LD   A,D
		SUB  68h        ; Translate Y so origin (0) is centre of room
		JP   P,959Fh
		NEG             ; Make Y Absolute
		CP   H          ; Compare with Half Room Height + 1
		JR   C,95A3h
		INC  B          ; Add oneto B if outside bounds of room
		LD   A,B
		LD   (InDoorway), A  ; Store (0,1,2)
		POP  DE
		RET

	; We can add up to a maximum of 4 gravestones to the map
	; each time the player dies.
	; Find empty record (8 bytes; based at EAE8; max 4 records)
	; to place a gravestone.
AddGravestone:   ; 95A9
		LD   HL,GravestoneObjectsTable
		LD   DE,0008h
		LD   B,04h	; 4 = Max possible Gravestones
.loop	LD   A,(HL)
		AND  A
		JR   Z,AddGravestoneFnd
		ADD  HL,DE
		DJNZ .loop
		RET	; If # lives was ever more than 4, don't save gravestone

	; Found an empty slot (HL)
AddGravestoneFnd:
95B9 	LD   A, BRIGHT_CYAN
95BB 	LD   (PlayerColr),A
95BE 	PUSH HL
95BF 	LD   (HL),SprGfxTombstoneIdx+1	; Gravestone Sprite
95C1 	EX   DE,HL
95C2 	INC  DE
95C3 	LD   HL,PlayerRoomNo
95C6 	LD   BC,0007h	; Copy remaining 7 bytes from PlayerRoomNo (PlayerRoomNo, XPos, YPos, ...)
95C9 	LDIR
95CB 	POP  HL
95CC 	PUSH IX
95CE 	PUSH HL
95CF 	POP  IX
95D1 	CALL PrepAndRedrawSprite	; IX and HL = Address of newly added Gravestone object
95D4 	POP  IX
95D6 	RET

95D7 	JP   92E0h


UpdateTimer:	; 95DA
	; Every 50 frames, reset frames and increment the clock data and display
95DA 	LD   A,(FRAMES)
95DD 	CP   32h
95DF 	RET  C
95E0 	SUB  32h
95E2 	LD   (FRAMES),A

	; Increment Seconds on Clock
95E5 	LD   HL,TimerSeconds
95E8 	LD   A,(HL)
95E9 	INC  A
95EA 	DAA
95EB 	LD   (HL),A
95EC 	CP   60h
95EE 	JR   NZ, DisplayTimer

	; Reset Seconds back to zero
95F0 	LD   (HL),00h
95F2 	DEC  HL
	; Increment Minutes
95F3 	LD   A,(HL)
95F4 	INC  A
95F5 	DAA
95F6 	LD   (HL),A
95F7 	CP   60h
95F9 	JR   NZ, DisplayTimer
	; Bit wrong but if the lower two (of of three) "minute" digits reaches
	; 60, then reset it and increment the "100s" minutes.  This has the
	; (possibly unintended) result of the minutes going from 058..059..100..101
	; There presumably wasn't enough space for a hours:minutes separator on screen.
95FB 	LD   (HL),00h
95FD 	DEC  HL
95FE 	LD   A,(HL)
95FF 	INC  A
9600 	DAA
9601 	AND  0Fh
9603 	LD   (HL),A

DisplayTimer:	; 9604
9604 	LD   HL,40C8h		; (Y=8, X=25)
9607 	CALL CalcScreenAddr

	; Print "Minutes"
960A 	LD   DE,TimerMinutes
960D 	LD   B,02h
960F 	CALL PrintDigitsFromDEOdd

	; Print "Seconds"
9612 	LD   DE,TimerSeconds
9615 	INC  HL ; Move past ":" (screen address)
9616 	LD   B,01h
9618 	JP   PrintDigitsFromDE

ExecuteAcgDoor:   ; 961B
		; This is the main front door - but also appears on the exit page
		; Determine if door is open or closed based on whether you possess the right keys or not
		LD   HL,5E32h
		LD   DE,0004h
		LD   A,(HL)
		CP   SprGfxObjAcgKey1Idx+1
		JR   NZ, .close
		ADD  HL,DE
		LD   A,(HL)
		CP   SprGfxObjAcgKey2Idx+1
		JR   NZ, .close
		ADD  HL,DE
		LD   A,(HL)
		CP   SprGfxObjAcgKey3Idx+1
		JR   NZ, .close
		CALL OpenDoor
		LD   BC,3020h
		JP   ExecuteOpenDoor.run

.close 	CALL CloseDoor
963E 	JP   ExecuteDecoration

DisplayFinalScore:	; 9641
9641 	CALL CalcVisitedRoomsPercent
9644 	LD   HL,4040h		; (Y=8, X=8)
9647 	LD   DE,TimeTXT
964A 	CALL PrintText
964D 	LD   HL,5040h		; (Y=10, X=8)
9650 	LD   DE,ScoreTXT
9653 	CALL PrintText
9656 	LD   HL,6040h		; (Y=12, X=8)
9659 	LD   DE,PercentTXT
965C 	CALL PrintText
965F 	LD   HL,0BFCCh
9662 	LD   (FontBase),HL
9665 	LD   HL,4080h	; (Y=8, X=16)
9668 	CALL 9607h
966B 	LD   HL,5080h	; (Y=10, X=16)
966E 	CALL 0A1B7h
9671 	LD   HL,6080h	; (Y=12, X=16)
9674 	CALL CalcScreenAddr

	; Print 2-digit percentage of map explored
9677 	LD   DE,RoomsVisitedPercentBCD
967A 	LD   B,01h	; Just 2 digits
967C 	JP   PrintDigitsFromDE

TimeTXT:           ; 967F
	DEFB 045h      ; BRIGHT CYAN
	DEFB "TIME       #  ", (" "+80h) ; Hash (#) symbol renders as a Colon (:) symbol

ScoreTXT:          ; 968F
	DEFB 045h      ; BRIGHT CYAN
	DEFB "SCORE         ", (" "+80h)

PercentTXT:        ; 969F
	DEFB 045h      ; BRIGHT CYAN
	DEFB "$             ", (" "+80h) ; Dollar ($) symbol renders as a Percent (%) symbol

MarkRoomAsVisited: ; 96AF
	; A = Room No.
	; Sets a single bit in the VisitedScreensBitmap
	; to say that this room has now been visited.
96AF 	LD   C,A
96B0 	SRL  C
96B2 	SRL  C
96B4 	SRL  C
96B6 	LD   B,00h
96B8 	LD   HL,VisitedScreensBitmap
96BB 	ADD  HL,BC
96BC 	RLCA
96BD 	RLCA
96BE 	RLCA
	; Bit of self modifying code here to change SET 0,(HL) to SET X,(HL) where X
	; is (PlayerRoomNo mod 8)
96BF 	AND  38h
96C1 	OR   0C6h
96C3 	LD   (96C7h),A
96C6 	SET  0,(HL)	; Actually SET 0 1 2 3 4 5 6 or 7
96C8 	RET

	; VisitedScreensBitmap is a "bitmap" of 19 bytes holding "visited" bits
	; of which rooms we've visited.
	; We look through 19 x 8 = 152 rooms, taking each bit and examining it.
	; For every 3rd visited room (counted by D), we add 2% to the count.
	; A holds the count in BCD format.
	; The final result is stored in (RoomsVisitedPercentBCD).
CalcVisitedRoomsPercent:	; 96C9
96C9 	LD   HL,VisitedScreensBitmap
96CC 	LD   BC,0813h
96CF 	LD   D,03h	; Only add 2% for every 3 screens visited
96D1 	XOR  A	; Percent tally is held in A (BCD format)
96D2 	PUSH BC
96D3 	LD   E,(HL)
96D4 	INC  HL
96D5 	RR   E
96D7 	JR   NC,96E1h
96D9 	DEC  D
96DA 	JR   NZ,96E1h
96DC 	LD   D,03h	; Reset screens
96DE 	ADD  A,02h	; Add 2 percent
96E0 	DAA
96E1 	DJNZ 96D5h
96E3 	POP  BC
96E4 	DEC  C
96E5 	JR   NZ,96D2h
96E7 	INC  A
96E8 	LD   (RoomsVisitedPercentBCD),A
96EB 	RET


GameCompleted:	; 96EC
	; Display Exit Screen
96EC 	LD   HL,PlayerSprite
96EF 	CALL 95CCh
96F2 	LD   HL,Font
96F5 	LD   (FontBase),HL
96F8 	LD   HL,2040h		; (Y=4, X=8)
96FB 	LD   DE,CongratulationsTXT
96FE 	CALL PrintText
9701 	LD   HL,3040h		; (Y=6, X=8)
9704 	LD   DE,YouHaveEscapedTXT
9707 	CALL PrintText
970A 	CALL DisplayFinalScore
970D 	JP   8C4Ah

CongratulationsTXT:; 09710h
	DEFB 047h      ; BRIGHT WHITE
	DEFB "CONGRATULATION", ("S"+80h)

YouHaveEscapedTXT: ; 09720h
	DEFB 047h      ; BRIGHT WHITE
	DEFB "YOU HAVE ESCAPE", ("D"+80h)

L9731:             ; 09731h
9731 	LD   BC,1818h
9734 	CALL 90CCh
9737 	JP   NC, ExecuteDecoration

	; TELEPORT
973A 	CALL ClrGameWindow
973D 	LD   A,96h	; Room #150 = Teleport Room
973F 	PUSH IX
9741 	CALL DrawScreenA ; Draw Room #150 without actually making that the "current" room
	; Note: Drawing Teleport room involves drawing all the concentric squares but hiding them via attributes
9744 	POP  IX
9746 	LD   B,80h
9748 	LD   A,(FRAMES)
974B 	LD   C,A
974C 	PUSH BC
974D 	LD   A,B
974E 	CPL
974F 	LD   B,A
9750 	CALL Beep
9753 	POP  BC
9754 	LD   A,(FRAMES)
9757 	CP   C
9758 	JR   Z,974Ch
975A 	AND  07h	; 1 in 8 rings are in WHITE, not BLACK
975C 	LD   A,00h	; PAPER 0: INK 0
975E 	JR   NZ,9762h
9760 	LD   A,47h	; BRIGHT 1: PAPER 0: INK 7
9762 	LD   L,A
9763 	LD   H,A
9764 	LD   (596Bh),HL	; Colour NW+NE Centre of room
9767 	LD   (598Bh),HL	; Colour SW+SE Centre of room
976A 	PUSH BC
976B 	CALL DrawTeleportFrame
976E 	POP  BC
976F 	DJNZ 9748h
9771 	JP   9117h

; Update Attributes to animate Teleport
DrawTeleportFrame: ; 9774h
9774 	LD   BC,170Bh	; y=23; C=12=Number of concentric rings
9777 	LD   HL,5AE0h	; 23264 = Row #23 of Attributes Area (bottom line)
977A 	LD   DE,0020h
977D 	PUSH HL
	; We colour pick from concentric square inside the current one
977E 	AND  A
977F 	SBC  HL,DE	; Move Up an Attribute Row
9781 	INC  L	; Move Right an Attribute Row
9782 	LD   A,(HL)	; Grab the current colour
9783 	POP  HL
	; Start drawing the concentric square in the picked colour
9784 	PUSH BC
9785 	LD   (HL),A	; Draw B squares along the bottom heading right
9786 	INC  L
9787 	DJNZ 9785h
9789 	POP  BC
978A 	PUSH BC
978B 	LD   (HL),A	; Draw B squares along the right heading up
978C 	AND  A
978D 	SBC  HL,DE
978F 	DJNZ 978Bh
9791 	POP  BC
9792 	PUSH BC
9793 	LD   (HL),A	; Draw B squares along the top heading left
9794 	DEC  L
9795 	DJNZ 9793h
9797 	POP  BC
9798 	PUSH BC
9799 	LD   (HL),A	; Draw B squares along the left heading down
979A 	ADD  HL,DE
979B 	DJNZ 9799h
979D 	LD   (HL),A
	; Move in one concentric square (up and right)
979E 	AND  A
979F 	SBC  HL,DE
97A1 	INC  L
97A2 	POP  BC
97A3 	DEC  B	; Next concentric square is 2 chars shorter
97A4 	DEC  B
97A5 	DEC  C
97A6 	JR   NZ,977Dh	; Next ring
97A8 	RET


ScreenType12PointData:   ; 97A9 Teleport Point Data
	DB 05Ch,063h,063h,063h,063h,05Ch,05Ch,05Ch
	DB 054h,06Bh,06Bh,06Bh,06Bh,054h,054h,054h
	DB 04Ch,073h,073h,073h,073h,04Ch,04Ch,04Ch
	DB 044h,07Bh,07Bh,07Bh,07Bh,044h,044h,044h
	DB 03Ch,083h,083h,083h,083h,03Ch,03Ch,03Ch
	DB 034h,08Bh,08Bh,08Bh,08Bh,034h,034h,034h
	DB 02Ch,093h,093h,093h,093h,02Ch,02Ch,02Ch
	DB 024h,09Bh,09Bh,09Bh,09Bh,024h,024h,024h
	DB 01Ch,0A3h,0A3h,0A3h,0A3h,01Ch,01Ch,01Ch
	DB 014h,0ABh,0ABh,0ABh,0ABh,014h,014h,014h
	DB 00Ch,0B3h,0B3h,0B3h,0B3h,00Ch,00Ch,00Ch
	DB 004h,0BBh,0BBh,0BBh,0BBh,004h,004h,004h

ScreenType12DrawData:   ; 9809 Teleport Draw Data
	DB 000h,001h,003h,0FFh,002h,001h,003h,0FFh
	DB 004h,005h,007h,0FFh,006h,005h,007h,0FFh
	DB 008h,009h,00Bh,0FFh,00Ah,009h,00Bh,0FFh
	DB 00Ch,00Dh,00Fh,0FFh,00Eh,00Dh,00Fh,0FFh
	DB 010h,011h,013h,0FFh,012h,011h,013h,0FFh
	DB 014h,015h,017h,0FFh,016h,015h,017h,0FFh
	DB 018h,019h,01Bh,0FFh,01Ah,019h,01Bh,0FFh
	DB 01Ch,01Dh,01Fh,0FFh,01Eh,01Dh,01Fh,0FFh
	DB 020h,021h,023h,0FFh,022h,021h,023h,0FFh
	DB 024h,025h,027h,0FFh,026h,025h,027h,0FFh
	DB 028h,029h,02Bh,0FFh,02Ah,029h,02Bh,0FFh
	DB 02Ch,02Dh,02Fh,0FFh,02Eh,02Dh,02Fh,0FFh
	DB 0FFh

L986A:   ; 986A
986A 	LD   A,(IX+05h)
986D 	RLCA
986E 	RLCA
986F 	RLCA
9870 	AND  06h
9872 	LD   C,A
9873 	LD   B,00h
9875 	LD   HL,L9883
9878 	ADD  HL,BC
9879 	LD   A,(HL)
987A 	INC  HL
987B 	LD   (PlayerMomentumX),A
987E 	LD   A,(HL)
987F 	LD   (PlayerMomentumY),A
9882 	RET


L9883	DB 000h,020h,0E0h,000h,000h,0E0h,020h,000h


L988B:             ; 0988Bh
988B 	CALL PrepSpriteDraw
988E 	CALL CollisionDetect	; Carry Flag set iff in collision
9891 	JR   C,98B1h			; Jump out of in collision with mushroom
9893 	LD   A,(GameClock)
9896 	CPL
9897 	AND  03h				; Cycle mushroom colour every 4 frames
9899 	JR   NZ,989Eh
989B 	INC  (IX+06h)			; (IX+06h) provides a counter which is used
989E 	LD   A,(IX+06h)			; to cycle between 4 colours.  The mushroom
98A1 	AND  03h				; colour goes into (IX+05h)
98A3 	LD   C,A
98A4 	LD   B,00h
98A6 	LD   HL,MushroomAnimColourSequence
98A9 	ADD  HL,BC
98AA 	LD   A,(HL)
98AB 	LD   (IX+05h),A
98AE 	JP   92E0h

		; Mushrooms take a little bit of energy (1 unit per frame)
98B1 	LD   A,(ChickenEnergy)
98B4 	DEC  A
98B5 	LD   (ChickenEnergy),A
98B8 	JP   Z,L98C8
98BB 	CALL UpdateChicken
98BE 	CALL PrepExplosionObject
98C1 	JP   9893h

MushroomAnimColourSequence:   ; 98C4
	DB 042h,043h,046h,043h	; BRIGHT RED, MAGENTA, YELLOW, MAGENTA

L98C8:             ; 098C8h
98C8 	CALL 9F56h
98CB 	LD   (IX+00h),00h
98CF 	JP   LoseLife


       ; Select a Start Room for the GREEN KEY (based on lower 3 bits of FRAMES)
98D2 	LD   A,(FRAMES)
98D5 	LD   HL,GreenKeyStartRoomTable
98D8 	CALL EightByteLookup
98DB 	LD   (GreenKeyStartRoom),A

98DE 	LD   A,(FRAMES)
98E1 	LD   C,A
98E2 	LD   A,(GameClock)
98E5 	ADD  A,C
98E6 	LD   HL,RedKeyStartRoomTable
98E9 	CALL EightByteLookup
98EC 	LD   (RedKeyStartRoom),A
98EF 	LD   (MummyStartRoom),A

98F2 	LD   A,(5C79h)
98F5 	LD   C,A
98F6 	LD   A,(GameClockHi)
98F9 	ADD  A,C
98FA 	LD   HL,BlueKeyStartRoomTable
98FD 	CALL EightByteLookup
9900 	LD   (BlueKeyStartRoom),A
9903 	RET


	; Constrains A to 0..7 then returns byte at (HL+A)
EightByteLookup:   ; 9904
9904 	AND  07h
9906 	LD   C,A
9907 	LD   B,00h
9909 	ADD  HL,BC
990A 	LD   A,(HL)
990B 	RET

GreenKeyStartRoomTable:	; Room numbers for GREEN KEY
L990C	DB 005h,006h,007h,06Dh,025h,024h,023h,022h

RedKeyStartRoomTable:	; Room numbers for RED KEY and MUMMY
L9914	DB 017h,013h,009h,00Dh,089h,087h,080h,085h

BlueKeyStartRoomTable:	; Room numbers for BLUE KEY
L991C	DB 053h,08Fh,041h,094h,033h,091h,039h,04Ch


ConsiderRespawnFood:   ; 09924h
9924 	LD   A,(GameClock)
9927 	LD   C,A
9928 	LD   A,(GameClockHi)
992B 	AND  01h
992D 	OR   C
992E 	RET  NZ		; Only respan once every 512 game frames

	; Update (NextRespawnFoodPtr) to point to the next food item to consider respawning
992F 	LD   HL,(NextRespawnFoodPtr)
9932 	LD   DE,0008h
9935 	ADD  HL,DE
9936 	LD   (NextRespawnFoodPtr),HL

	; If we have moved past the end of the Food section of the object table?
	; If so, set pointer back to the start of the table again
9939 	PUSH HL
993A 	POP  IX	; IX = Food object to possibly respawn
993C 	LD   DE,FoodObjectsTableEnd
993F 	AND  A
9940 	SBC  HL,DE
9942 	JR   NC, ResetRespawnFoodPtr
	; Don't respawn food if food object is in the same room that the player
	; is current in (this might result in you consuming the food despite it
	; not being visible)
9944 	LD   A,(PlayerRoomNo)
9947 	CP   (IX+01h)
994A 	RET  Z
	; Don't respawn food if food object already exists (i.e. hasn't already been eaten)
994B 	LD   A,(IX+00h)
994E 	AND  A
994F 	RET  NZ
	; Choose a new random food item (one of 8 between SprGfxFoodCanIdx and SprGfxFoodMilkBottleIdx)
9950 	LD   A,(FRAMES)
9953 	AND  07h
9955 	ADD  A,SprGfxFoodCanIdx+1
9957 	LD   (IX+00h),A
995A 	RET

ResetRespawnFoodPtr:   ; 995B
995B 	LD   HL,FoodObjectsTable
995E 	LD   (NextRespawnFoodPtr),HL
9961 	RET


DrawRoutineLookupAndDispatch:   ; 9962
9962 	LD   HL,DrawRoutineVectorTable

DrawRoutineCommonLookupAndDispatch:   ; 9965
9965 	PUSH BC
9966 	LD   A,B
9967 	RLCA
9968 	RLCA
9969 	RLCA
996A 	AND  07h
996C 	LD   C,A
996D 	JP   RoutineDispatch

DrawRoutineVectorTable:   ; 9970
	DW DrawRoutineA, DrawRoutineB, DrawRoutineC, DrawRoutineD
	DW DrawRoutineE, DrawRoutineF, DrawRoutineG, DrawRoutineH

DrawAttrRoutineLookupAndDispatch:   ; 9980
9980 	LD   HL,DrawAttrRoutineVectorTable
9983 	JR   DrawRoutineCommonLookupAndDispatch

DrawAttrRoutineVectorTable:   ; 9985
	DW DrawAttrRoutineA, DrawAttrRoutineB, DrawAttrRoutineC, DrawAttrRoutineD
	DW DrawAttrRoutineE, DrawAttrRoutineF, DrawAttrRoutineG, DrawAttrRoutineH


GetBackgroundGFX:  ; 9995
	; INPUT:
	; C contains a 1-based id (sprite number?)
	; DE = Screen Position (x, y pixels)
	; OUTPUT:
	; HL = Screen Address
	; DE = Sprite Bitmap
	; B = Width (bytes)
	; C = Height (bytes)
9995 	LD   HL,BackSprTable
9998 	DEC  C
9999 	LD   B,00h
999B 	SLA  C
999D 	RL   B		; BC = 2*(C-1)
999F 	ADD  HL,BC
99A0 	LD   A,(HL)
99A1 	INC  HL
99A2 	LD   H,(HL)
99A3 	LD   L,A	; HL = looked up address in BackSprTable
99A4 	EX   DE,HL  ; DE = looked up address in BackSprTable
99A5 	CALL CalcScreenAddr	; HL = Screen address
99A8 	LD   A,(DE)
99A9 	LD   B,A	; B = Width (bytes)
99AA 	INC  DE
99AB 	LD   A,(DE)
99AC 	LD   C,A	; C = Height (pixels)
99AD 	INC  DE		; DE = Address of bitmap data
99AE 	RET


GetBackgroundATTR: ; 99AF
99AF 	LD   HL,BackSprAttrTable
99B2 	DEC  C
99B3 	LD   B,00h
99B5 	SLA  C
99B7 	RL   B
99B9 	ADD  HL,BC
99BA 	LD   A,(HL)
99BB 	INC  HL
99BC 	LD   H,(HL)
99BD 	LD   L,A
99BE 	EX   DE,HL
99BF 	CALL CalcAttrAddr
99C2 	LD   A,(DE)
99C3 	LD   B,A
99C4 	INC  DE
99C5 	LD   A,(DE)
99C6 	LD   C,A
99C7 	INC  DE
99C8 	RET



DrawRoutineA:   ; 99C9
	; B contains draw method (overwrite, OR or XOR)
	; C contains a 1-based id (sprite number?)
	; DE = Screen Position (x, y pixels)
99C9 	POP  BC
99CA 	CALL SelectDrawMethod
99CD 	LD   (SelectDrawMethodOpCode1),A
99D0 	CALL GetBackgroundGFX
	; HL = Screen Address
	; DE = Sprite Bitmap
99D3 	PUSH BC
99D4 	PUSH HL
99D5 	LD   A,(DE)
99D6 	INC  DE
SelectDrawMethodOpCode1:  ; 99D7
99D7 	NOP
99D8 	LD   (HL),A
99D9 	INC  L
99DA 	DJNZ 99D5h
99DC 	POP  HL
99DD 	CALL ScreenStepUp
99E0 	POP  BC
99E1 	DEC  C
99E2 	JR   NZ,99D3h
99E4 	RET

DrawRoutineB:   ; 99E5
99E5 	POP  BC
99E6 	CALL SelectDrawMethod
99E9 	LD   (SelectDrawMethodOpCode2),A
99EC 	CALL GetBackgroundGFX
99EF 	PUSH BC
99F0 	PUSH HL
99F1 	CALL 9A9Dh
99F4 	DEC  DE
99F5 	LD   A,(DE)
99F6 	CALL 9A92h
SelectDrawMethodOpCode2:  ; 99F9
99F9 	NOP
99FA 	LD   (HL),A
99FB 	INC  L
99FC 	DJNZ 99F4h
99FE 	POP  HL
99FF 	CALL ScreenStepUp
9A02 	POP  BC
9A03 	CALL 9A9Dh
9A06 	DEC  C
9A07 	JR   NZ,99EFh
9A09 	RET

DrawRoutineC:   ; 9A0A
9A0A 	POP  BC
9A0B 	CALL SelectDrawMethod
9A0E 	LD   (SelectDrawMethodOpCode3),A
9A11 	CALL GetBackgroundGFX
9A14 	LD   A,B
9A15 	EXX
9A16 	LD   L,01h
9A18 	LD   B,A
9A19 	EXX
9A1A 	CALL 9A9Dh
9A1D 	DEC  DE
9A1E 	PUSH BC
9A1F 	PUSH DE
9A20 	PUSH HL
9A21 	LD   A,(DE)
9A22 	EXX
9A23 	AND  L
9A24 	JR   Z,9A27h
9A26 	SCF
9A27 	RL   H
9A29 	EXX
9A2A 	CALL 9A9Dh
9A2D 	DEC  C
9A2E 	LD   A,C
9A2F 	AND  07h
9A31 	JR   NZ,9A21h
9A33 	EXX
9A34 	LD   A,H
9A35 	EXX
SelectDrawMethodOpCode3:  ; 9A36
9A36 	NOP
9A37 	LD   (HL),A
9A38 	INC  L
9A39 	LD   A,C
9A3A 	AND  A
9A3B 	JR   NZ,9A21h
9A3D 	POP  HL
9A3E 	CALL ScreenStepUp
9A41 	POP  DE
9A42 	POP  BC
9A43 	EXX
9A44 	RLC  L
9A46 	EXX
9A47 	JR   NC,9A1Eh
9A49 	EXX
9A4A 	DEC  B
9A4B 	EXX
9A4C 	RET  Z
9A4D 	DEC  DE
9A4E 	JR   9A1Eh

DrawRoutineD:   ; 9A50
9A50 	POP  BC
9A51 	CALL SelectDrawMethod
9A54 	LD   (SelectDrawMethodOpCode4),A
9A57 	CALL GetBackgroundGFX
9A5A 	LD   A,B
9A5B 	EXX
9A5C 	LD   B,A
9A5D 	LD   L,80h
9A5F 	EXX
9A60 	PUSH BC
9A61 	PUSH DE
9A62 	PUSH HL
9A63 	LD   A,(DE)
9A64 	EXX
9A65 	AND  L
9A66 	JR   Z,9A69h
9A68 	SCF
9A69 	RL   H
9A6B 	EXX
9A6C 	CALL 9A9Dh
9A6F 	DEC  C
9A70 	LD   A,C
9A71 	AND  07h
9A73 	JR   NZ,9A63h
9A75 	EXX
9A76 	LD   A,H
9A77 	EXX
SelectDrawMethodOpCode4:  ; 9A78
9A78 	NOP
9A79 	LD   (HL),A
9A7A 	INC  L
9A7B 	LD   A,C
9A7C 	AND  A
9A7D 	JR   NZ,9A63h
9A7F 	POP  HL
9A80 	CALL ScreenStepUp
9A83 	POP  DE
9A84 	POP  BC
9A85 	EXX
9A86 	RRC  L
9A88 	EXX
9A89 	JR   NC,9A60h
9A8B 	EXX
9A8C 	DEC  B
9A8D 	EXX
9A8E 	RET  Z
9A8F 	INC  DE
9A90 	JR   9A60h

9A92 	PUSH BC
9A93 	LD   B,08h
9A95 	RLA
9A96 	RR   C
9A98 	DJNZ 9A95h
9A9A 	LD   A,C
9A9B 	POP  BC
9A9C 	RET

9A9D 	LD   A,B
9A9E 	ADD  A,E
9A9F 	LD   E,A
9AA0 	LD   A,D
9AA1 	ADC  A,00h
9AA3 	LD   D,A
9AA4 	RET

9AA5 	LD   A,E
9AA6 	SUB  B
9AA7 	LD   E,A
9AA8 	LD   A,D
9AA9 	SBC  A,00h
9AAB 	LD   D,A
9AAC 	RET

9AAD 	LD   HL,0000
9AB0 	LD   B,08
9AB2 	ADD  HL,HL
9AB3 	RLCA
9AB4 	JR   NC,9AB7h
9AB6 	ADD  HL,DE
9AB7 	DJNZ 9AB2h
9AB9 	RET

9ABA 	PUSH HL
9ABB 	PUSH DE
9ABC 	LD   A,B
9ABD 	LD   E,C
9ABE 	DEC  E
9ABF 	LD   D,00h
9AC1 	PUSH BC
9AC2 	CALL 9AADh
9AC5 	POP  BC
9AC6 	POP  DE
9AC7 	ADD  HL,DE
9AC8 	EX   DE,HL
9AC9 	POP  HL
9ACA 	RET

DrawRoutineE:   ; 9ACB
9ACB 	POP  BC
9ACC 	CALL SelectDrawMethod
9ACF 	LD   (SelectDrawMethodOpCode5),A
9AD2 	CALL GetBackgroundGFX
9AD5 	CALL 9ABAh
9AD8 	PUSH BC
9AD9 	PUSH DE
9ADA 	PUSH HL
9ADB 	LD   A,(DE)
9ADC 	INC  DE
SelectDrawMethodOpCode5:  ; 9ADD
9ADD 	NOP
9ADE 	LD   (HL),A
9ADF 	INC  L
9AE0 	DJNZ 9ADBh
9AE2 	POP  HL
9AE3 	CALL ScreenStepUp
9AE6 	POP  DE
9AE7 	POP  BC
9AE8 	CALL 9AA5h
9AEB 	DEC  C
9AEC 	JR   NZ,9AD8h
9AEE 	RET

DrawRoutineF:   ; 9AEF
9AEF 	POP  BC
9AF0 	CALL SelectDrawMethod
9AF3 	LD   (SelectDrawMethodOpCode6),A
9AF6 	CALL GetBackgroundGFX
9AF9 	CALL 9ABAh
9AFC 	CALL 9A9Dh
9AFF	PUSH BC		; (This line is missing from the original disassembly)
9B00 	PUSH HL
9B01 	DEC  DE
9B02 	LD   A,(DE)
9B03 	CALL 9A92h
SelectDrawMethodOpCode6:  ; 9B06
9B06 	NOP
9B07 	LD   (HL),A
9B08 	INC  L
9B09 	DJNZ 9B01h
9B0B 	POP  HL
9B0C 	CALL ScreenStepUp
9B0F 	POP  BC
9B10 	DEC  C
9B11 	JR   NZ,9AFFh
9B13 	RET

DrawRoutineG:   ; 9B14
9B14 	POP  BC
9B15 	CALL SelectDrawMethod
9B18 	LD   (SelectDrawMethodOpCode7),A
9B1B 	CALL GetBackgroundGFX
9B1E 	LD   A,B
9B1F 	EXX
9B20 	LD   B,A
9B21 	LD   L,01h
9B23 	EXX
9B24 	CALL 9A9Dh
9B27 	DEC  DE
9B28 	CALL 9ABAh
9B2B 	PUSH BC
9B2C 	PUSH DE
9B2D 	PUSH HL
9B2E 	LD   A,(DE)
9B2F 	EXX
9B30 	AND  L
9B31 	JR   Z,9B34h
9B33 	SCF
9B34 	RL   H
9B36 	EXX
9B37 	CALL 9AA5h
9B3A 	DEC  C
9B3B 	LD   A,C
9B3C 	AND  07
9B3E 	JR   NZ,9B2Eh
9B40 	EXX
9B41 	LD   A,H
9B42 	EXX
SelectDrawMethodOpCode7:  ; 9B43
9B43 	NOP
9B44 	LD   (HL),A
9B45 	INC  L
9B46 	LD   A,C
9B47 	AND  A
9B48 	JR   NZ,9B2Eh
9B4A 	POP  HL
9B4B 	CALL ScreenStepUp
9B4E 	POP  DE
9B4F 	POP  BC
9B50 	EXX
9B51 	RLC  L
9B53 	EXX
9B54 	JR   NC,9B2Bh
9B56 	EXX
9B57 	DEC  B
9B58 	EXX
9B59 	RET  Z
9B5A 	DEC  DE
9B5B 	JR   9B2Bh

DrawRoutineH:   ; 9B5D
9B5D 	POP  BC
9B5E 	CALL SelectDrawMethod
9B61 	LD   (SelectDrawMethodOpCode8),A
9B64 	CALL GetBackgroundGFX
9B67 	LD   A,B
9B68 	EXX
9B69 	LD   B,A
9B6A 	LD   L,80h
9B6C 	EXX
9B6D 	CALL 9ABAh
9B70 	PUSH BC
9B71 	PUSH DE
9B72 	PUSH HL
9B73 	LD   A,(DE)
9B74 	EXX
9B75 	AND  L
9B76 	JR   Z,9B79h
9B78 	SCF
9B79 	RL   H
9B7B 	EXX
9B7C 	CALL 9AA5h
9B7F 	DEC  C
9B80 	LD   A,C
9B81 	AND  07
9B83 	JR   NZ,9B73h
9B85 	EXX
9B86 	LD   A,H
9B87 	EXX
SelectDrawMethodOpCode8:  ; 9B88
9B88 	NOP
9B89 	LD   (HL),A
9B8A 	INC  L
9B8B 	LD   A,C
9B8C 	AND  A
9B8D 	JR   NZ,9B73h
9B8F 	POP  HL
9B90 	CALL ScreenStepUp
9B93 	POP  DE
9B94 	POP  BC
9B95 	EXX
9B96 	RRC  L
9B98 	EXX
9B99 	JR   NC,9B70h
9B9B 	EXX
9B9C 	DEC  B
9B9D 	EXX
9B9E 	RET  Z
9B9F 	INC  DE
9BA0 	JR   9B70h


CalcScreenAddr:   ; 09BA2h
	; INPUT: H=YPos (pixels); L=XPos (pixels)
	; OUTPUT: HL=Screen Address
9BA2 	LD   A,L        ; A = XPos (pixels)
9BA3 	RRCA
9BA4 	RRCA
9BA5 	RRCA
9BA6 	AND  1Fh        ; A = XPos (chars)
9BA8 	LD   L,A
9BA9 	LD   A,H
9BAA 	RLCA
9BAB 	RLCA
9BAC 	AND  0E0h
9BAE 	OR   L          ; A=Low Address (competed)
9BAF 	LD   L,A
9BB0 	LD   A,H
9BB1 	AND  07h
9BB3 	EX   AF,AF'
9BB4 	LD   A,H
9BB5 	RRCA
9BB6 	RRCA
9BB7 	RRCA
9BB8 	AND  18h
9BBA 	OR   40h
9BBC 	LD   H,A
9BBD 	EX   AF,AF'
9BBE 	OR   H
9BBF 	LD   H,A
9BC0 	RET


NextScanLine:      ; 09BC1h
9BC1 	INC  H
9BC2 	LD   A,H
9BC3 	AND  07
9BC5 	RET  NZ
9BC6 	LD   A,L
9BC7 	ADD  A,20h
9BC9 	LD   L,A
9BCA 	AND  0E0h
9BCC 	RET  Z
9BCD 	LD   A,H
9BCE 	SUB  08h
9BD0 	LD   H,A
9BD1 	RET


; HL contains coordinate (L=X position pixels 0-255; H=Y position pixels (0-175))
; Returns HL = address of that pixel coordinate in Attribute area
CalcAttrAddr:       ; 09BD2h
9BD2 	PUSH BC
9BD3 	LD   A,L
9BD4 	RRCA
9BD5 	RRCA
9BD6 	RRCA
9BD7 	AND  1Fh
9BD9 	LD   L,A
9BDA 	LD   A,H
9BDB 	RLCA
9BDC 	RLCA
9BDD 	LD   C,A
9BDE 	AND  0E0h
9BE0 	OR   L
9BE1 	LD   L,A
9BE2 	LD   A,C
9BE3 	AND  03h
9BE5 	OR   58h
9BE7 	LD   H,A
9BE8 	POP  BC
9BE9 	RET


DrawScreen:        ; 09BEAh
9BEA 	XOR  A
9BEB 	LD   (RoomInPlay),A
9BEE 	LD   A,(PlayerRoomNo)

DrawScreenA:	; 9BF1
9BF1 	LD   BC,Screens
9BF4 	LD   L,A
9BF5 	LD   H,00h
9BF7 	ADD  HL,HL
9BF8 	ADD  HL,BC
9BF9 	LD   A,(HL)
9BFA 	INC  HL
9BFB 	LD   (RoomColour),A
9BFE 	EXX

		; Blank the "room area" of the screen
9BFF 	LD   HL,5800h	; Attr Start Pos (0,0)
9C02 	LD   BC,1818h	; Attr Area (B,C). B=Width; C=Height
9C05 	LD   A,(RoomColour)	; Colour to apply (room colour)
9C08 	CALL FillAttrRect

9C0B 	EXX
9C0C 	LD   L,(HL)
9C0D 	LD   H,00h
9C0F 	ADD  HL,HL	; x2
9C10 	LD   C,L
9C11 	LD   B,H
9C12 	ADD  HL,HL	; x4
9C13 	ADD  HL,BC  ; x6
9C14 	LD   BC,ScreenTypesTable
9C17 	ADD  HL,BC
		; Read and Save Room Size
9C18 	LD   A,(HL)
9C19 	INC  HL
9C1A 	LD   (RoomWidth),A
9C1D 	LD   A,(HL)
9C1E 	INC  HL
9C1F 	LD   (RoomHeight),A
		; Get address of Room Data #1 into DE
9C22 	LD   E,(HL)
9C23 	INC  HL
9C24 	LD   D,(HL)
9C25 	INC  HL
		; Get address of Room Data #2 into HL
9C26 	LD   A,(HL)
9C27 	INC  HL
9C28 	LD   H,(HL)
9C29 	LD   L,A
9C2A 	PUSH DE
9C2B 	POP  IX	; IX = Room Data #1
9C2D 	PUSH BC
9C2E 	POP  BC
		; Read byte from Room Data #1
9C2F 	LD   A,(HL)
9C30 	INC  HL
9C31 	CP   0FFh	; Exit on FFh
9C33 	RET  Z
9C34 	SLA  A
9C36 	LD   (9C3Fh),A
9C39 	INC  A
9C3A 	LD   (9C42h),A
9C3D 	LD   C,(IX+00h)	; LD C,(IX+2*(HL))
9C40 	LD   B,(IX+00h)	; LD B,(IX+2*(HL)+1)
9C43 	PUSH BC
9C44 	LD   A,(HL)
9C45 	INC  HL
9C46 	CP   0FFh
9C48 	JR   Z,9C2Eh
9C4A 	SLA  A
9C4C 	LD   (9C55h),A
9C4F 	INC  A
9C50 	LD   (9C58h),A
9C53 	LD   E,(IX+00h)	; LD E,(IX+2*(HL))
9C56 	LD   D,(IX+00h)	; LD D,(IX+2*(HL)+1)
9C59 	PUSH HL
9C5A 	CALL 9C79h
9C5D 	POP  HL
9C5E 	POP  BC
9C5F 	JR   9C43h

9C61 	LD   A,L
9C62 	AND  07h
9C64 	INC  A
9C65 	LD   B,A
9C66 	XOR  A
9C67 	SCF
9C68 	RRA
9C69 	DJNZ 9C68h
9C6B 	PUSH HL
9C6C 	PUSH AF
9C6D 	EX   AF,AF'
9C6E 	PUSH AF
9C6F 	CALL CalcScreenAddr		; (L=X; H=Y)
9C72 	POP  AF
9C73 	EX   AF,AF'
9C74 	POP  AF
9C75 	OR   (HL)
9C76 	LD   (HL),A
9C77 	POP  HL
9C78 	RET

	; Draw line from BC to HL (pixels)
9C79 	LD   H,B
9C7A 	LD   L,C
9C7B 	LD   C,00h
9C7D 	LD   A,H
9C7E 	SUB  D
9C7F 	JR   NC,9C85h
9C81 	NEG
9C83 	SET  0,C
9C85 	LD   B,A
9C86 	LD   A,L
9C87 	SUB  E
9C88 	JR   NC,9C8Eh
9C8A 	NEG
9C8C 	SET  1,C
9C8E 	CP   B
9C8F 	EX   AF,AF'
9C90 	LD   A,C
9C91 	LD   (5E24h),A
9C94 	EX   AF,AF'
9C95 	JP   C,9CD6h
9C98 	LD   (5E23h),A
9C9B 	PUSH DE
9C9C 	PUSH HL
9C9D 	LD   E,A
9C9E 	LD   D,00h
9CA0 	LD   L,D
9CA1 	LD   H,B
9CA2 	CALL LA379
9CA5 	LD   A,(5E24h)
9CA8 	BIT  0,A
9CAA 	JR   NZ,9CAFh
9CAC 	CALL 0A39Eh
9CAF 	LD   A,(5E24h)
9CB2 	BIT  1,A
9CB4 	LD   C,01h
9CB6 	JR   NZ,9CBAh
9CB8 	LD   C,0FFh
9CBA 	EX   DE,HL
9CBB 	POP  HL
9CBC 	LD   A,(5E23h)
9CBF 	INC  A
9CC0 	LD   B,A
9CC1 	LD   A,E
9CC2 	EX   AF,AF'
9CC3 	PUSH BC
9CC4 	CALL 9C61h
9CC7 	LD   A,L
9CC8 	EX   AF,AF'
9CC9 	LD   L,A
9CCA 	ADD  HL,DE
9CCB 	LD   A,L
9CCC 	EX   AF,AF'
9CCD 	POP  BC
9CCE 	ADD  A,C
9CCF 	LD   L,A
9CD0 	DJNZ 9CC3h
9CD2 	POP  HL
9CD3 	JP   9C61h

9CD6 	EX   AF,AF'
9CD7 	LD   A,B
9CD8 	LD   (5E23h),A
9CDB 	EX   AF,AF'
9CDC 	PUSH DE
9CDD 	PUSH HL
9CDE 	LD   E,B
9CDF 	LD   D,00h
9CE1 	LD   L,D
9CE2 	LD   H,A
9CE3 	CALL LA379
9CE6 	LD   A,(5E24h)
9CE9 	BIT  1,A
9CEB 	JR   NZ,9CF0h
9CED 	CALL 0A39Eh
9CF0 	LD   A,(5E24h)
9CF3 	BIT  0,A
9CF5 	LD   C,01h
9CF7 	JR   NZ,9CFBh
9CF9 	LD   C,0FFh
9CFB 	EX   DE,HL
9CFC 	POP  HL
9CFD 	LD   A,(5E23h)
9D00 	INC  A
9D01 	LD   B,A
9D02 	LD   A,E
9D03 	EX   AF,AF'
9D04 	PUSH BC
9D05 	CALL 9C61h
9D08 	LD   A,H
9D09 	EX   AF,AF'
9D0A 	LD   H,L
9D0B 	LD   L,A
9D0C 	ADD  HL,DE
9D0D 	LD   A,L
9D0E 	LD   L,H
9D0F 	EX   AF,AF'
9D10 	POP  BC
9D11 	ADD  A,C
9D12 	LD   H,A
9D13 	DJNZ 9D04h
9D15 	POP  HL
9D16 	JP   9C61h


SelectDrawMethod:   ; 9D19
		; This routine is used before drawing to the screen.  It selects a single-byte op-code which is
		; used in the middle of a draw routine to either overwrite, OR or XOR the screen with the new value.
		; The routine looks at lowest 2 bits of B register and returns A register with an OpCode used for
		; writing to the screen.  The calling function will write this byte into a drawing routine which
		; normally follows:
		; 0 => A = 0  => NOP (overwrite)
		; 1 => A = B6 => OR (HL)
		; 2 => A = AE => XOR (HL)
		; 3 => A = AE => XOR (HL)
9D19 	LD   A,B
9D1A 	AND  03h
9D1C 	RET  Z
9D1D 	CP   01
9D1F 	LD   A,0AEh
9D21 	RET  NZ
9D22 	ADD  A,08h
9D24 	RET

DrawAttrRoutineA:   ; 9D25
9D25 	POP  BC
9D26 	CALL GetBackgroundATTR
9D29 	PUSH BC
9D2A 	PUSH HL
9D2B 	LD   A,(DE)
9D2C 	INC  DE
9D2D 	AND  A
9D2E 	JR   Z,9D38h
9D30 	CP   0FFh
9D32 	JR   NZ,9D37h
9D34 	LD   A,(RoomColour)
9D37 	LD   (HL),A
9D38 	INC  L
9D39 	DJNZ 9D2Bh
9D3B 	POP  HL
9D3C 	LD   BC,0020h
9D3F 	AND  A
9D40 	SBC  HL,BC
9D42 	POP  BC
9D43 	DEC  C
9D44 	JR   NZ,9D29h
9D46 	RET

DrawAttrRoutineB:   ; 9D47
9D47 	POP  BC
9D48 	CALL GetBackgroundATTR
9D4B 	DEC  DE
9D4C 	CALL 9A9Dh
9D4F 	PUSH BC
9D50 	PUSH DE
9D51 	PUSH HL
9D52 	LD   A,(DE)
9D53 	DEC  DE
9D54 	AND  A
9D55 	JR   Z,9D5Fh
9D57 	CP   0FFh
9D59 	JR   NZ,9D5Eh
9D5B 	LD   A,(RoomColour)
9D5E 	LD   (HL),A
9D5F 	INC  L
9D60 	DJNZ 9D52h
9D62 	POP  HL
9D63 	LD   BC,0020h
9D66 	AND  A
9D67 	SBC  HL,BC
9D69 	POP  DE
9D6A 	POP  BC
9D6B 	DEC  C
9D6C 	JR   NZ,9D4Ch
9D6E 	RET

DrawAttrRoutineC:   ; 9D6F
9D6F 	POP  BC
9D70 	CALL GetBackgroundATTR
9D73 	LD   A,B
9D74 	EXX
9D75 	LD   B,A
9D76 	EXX
9D77 	CALL 9A9Dh
9D7A 	DEC  DE
9D7B 	PUSH BC
9D7C 	PUSH DE
9D7D 	PUSH HL
9D7E 	LD   A,(DE)
9D7F 	AND  A
9D80 	JR   Z,9D8Ah
9D82 	CP   0FFh
9D84 	JR   NZ,9D89h
9D86 	LD   A,(RoomColour)	; Color of current room
9D89 	LD   (HL),A
9D8A 	CALL 9A9Dh
9D8D 	INC  L
9D8E 	DEC  C
9D8F 	JR   NZ,9D7Eh
9D91 	POP  HL
9D92 	LD   BC,0020h
9D95 	AND  A
9D96 	SBC  HL,BC
9D98 	POP  DE
9D99 	POP  BC
9D9A 	EXX
9D9B 	DEC  B
9D9C 	EXX
9D9D 	JR   NZ,9D7Ah
9D9F 	RET

DrawAttrRoutineD:   ; 9DA0
9DA0 	POP  BC
9DA1 	CALL GetBackgroundATTR
9DA4 	LD   A,B
9DA5 	EXX
9DA6 	LD   B,A
9DA7 	EXX
9DA8 	PUSH BC
9DA9 	PUSH DE
9DAA 	PUSH HL
9DAB 	LD   A,(DE)
9DAC 	AND  A
9DAD 	JR   Z,9DB7h
9DAF 	CP   0FFh
9DB1 	JR   NZ,9DB6h
9DB3 	LD   A,(RoomColour)
9DB6 	LD   (HL),A
9DB7 	CALL 9A9Dh
9DBA 	INC  L
9DBB 	DEC  C
9DBC 	JR   NZ,9DABh
9DBE 	POP  HL
9DBF 	LD   BC,0020h
9DC2 	AND  A
9DC3 	SBC  HL,BC
9DC5 	POP  DE
9DC6 	POP  BC
9DC7 	INC  DE
9DC8 	EXX
9DC9 	DEC  B
9DCA 	EXX
9DCB 	JR   NZ,9DA8h
9DCD 	RET

DrawAttrRoutineE:   ; 9DCE
9DCE 	POP  BC
9DCF 	CALL GetBackgroundATTR
9DD2 	CALL 9ABAh
9DD5 	PUSH BC
9DD6 	PUSH DE
9DD7 	PUSH HL
9DD8 	LD   A,(DE)
9DD9 	INC  DE
9DDA 	AND  A
9DDB 	JR   Z,9DE5h
9DDD 	CP   0FFh
9DDF 	JR   NZ,9DE4h
9DE1 	LD   A,(RoomColour)
9DE4 	LD   (HL),A
9DE5 	INC  L
9DE6 	DJNZ 9DD8h
9DE8 	POP  HL
9DE9 	LD   BC,0020h
9DEC 	AND  A
9DED 	SBC  HL,BC
9DEF 	POP  DE
9DF0 	POP  BC
9DF1 	CALL 9AA5h
9DF4 	DEC  C
9DF5 	JR   NZ,9DD5h
9DF7 	RET

DrawAttrRoutineF:   ; 9DF8
9DF8 	POP  BC
9DF9 	CALL GetBackgroundATTR
9DFC 	CALL 9ABAh
9DFF 	CALL 9A9Dh
9E02 	DEC  DE
9E03 	PUSH BC
9E04 	PUSH HL
9E05 	LD   A,(DE)
9E06 	DEC  DE
9E07 	AND  A
9E08 	JR   Z,9E12h
9E0A 	CP   0FFh
9E0C 	JR   NZ,9E11h
9E0E 	LD   A,(RoomColour)
9E11 	LD   (HL),A
9E12 	INC  L
9E13 	DJNZ 9E05h
9E15 	POP  HL
9E16 	LD   BC,0020h
9E19 	AND  A
9E1A 	SBC  HL,BC
9E1C 	POP  BC
9E1D 	DEC  C
9E1E 	JR   NZ,9E03h
9E20 	RET

DrawAttrRoutineG:   ; 9E21
9E21 	POP  BC
9E22 	CALL GetBackgroundATTR
9E25 	LD   A,B
9E26 	EXX
9E27 	LD   B,A
9E28 	EXX
9E29 	CALL 9ABAh
9E2C 	CALL 9A9Dh
9E2F 	DEC  DE
9E30 	PUSH BC
9E31 	PUSH DE
9E32 	PUSH HL
9E33 	LD   A,(DE)
9E34 	AND  A
9E35 	JR   Z,9E3Fh
9E37 	CP   0FFh
9E39 	JR   NZ,9E3Eh
9E3B 	LD   A,(RoomColour)
9E3E 	LD   (HL),A
9E3F 	CALL 9AA5h
9E42 	INC  L
9E43 	DEC  C
9E44 	JR   NZ,9E33h
9E46 	POP  HL
9E47 	LD   BC,0020h
9E4A 	AND  A
9E4B 	SBC  HL,BC
9E4D 	POP  DE
9E4E 	POP  BC
9E4F 	EXX
9E50 	DEC  B
9E51 	EXX
9E52 	JR   NZ,9E2Fh
9E54 	RET

DrawAttrRoutineH:   ; 9E55
9E55 	POP  BC
9E56 	CALL GetBackgroundATTR
9E59 	LD   A,B
9E5A 	EXX
9E5B 	LD   B,A
9E5C 	EXX
9E5D 	CALL 9ABAh
9E60 	PUSH BC
9E61 	PUSH DE
9E62 	PUSH HL
9E63 	LD   A,(DE)
9E64 	AND  A
9E65 	JR   Z,9E6Fh
9E67 	CP   0FFh
9E69 	JR   NZ,9E6Eh
9E6B 	LD   A,(RoomColour)
9E6E 	LD   (HL),A
9E6F 	CALL 9AA5h
9E72 	INC  L
9E73 	DEC  C
9E74 	JR   NZ,9E63h
9E76 	POP  HL
9E77 	LD   BC,0020h
9E7A 	AND  A
9E7B 	SBC  HL,BC
9E7D 	POP  DE
9E7E 	POP  BC
9E7F 	INC  DE
9E80 	EXX
9E81 	DEC  B
9E82 	EXX
9E83 	JR   NZ,9E60h
9E85 	RET


LookupSpriteBitmapData:   ; 9E86
; Look up SprGfx index by (SpriteID)
; Returns with DE pointing to the bitmap data
9E86 	LD   A,(SpriteID)

LookupSpriteBitmapDataA:   ; 9E89
; Look up SprGfx index by A
; Returns with DE pointing to the bitmap data
9E89 	DEC  A
9E8A 	LD   L,A
9E8B 	LD   H,00h
9E8D 	ADD  HL,HL
9E8E 	LD   BC,SprGfxTable
9E91 	ADD  HL,BC
9E92 	LD   E,(HL)
9E93 	INC  HL
9E94 	LD   D,(HL)
9E95 	RET

LookupSpriteBitmapDataIX:   ; 9E96
; Look up SprGfx index by (IX)
; Returns with DE pointing to the bitmap data
9E96 	LD   A,(IX+00h)
9E99 	JR   LookupSpriteBitmapDataA



RedrawSprite:   ; 9E9Bh
	; HL,  BC,  DE  = Old Sprite to undraw
	; HL', BC', DE' = New Sprite to draw
	; In both cases:
	; C = Height of Sprite
	; DE = Sprite source bitmap
	; HL = Screen address to draw
	; Undrawing and drawing occurs line by line together to minimise tearing
		LD   A,C	; Remaining Height of old sprite to undraw
		AND  A
		JR   Z, .UndrawDone
		DEC  C
		CALL UndrawLineAndStepUp
		EXX	        ; Switch to "Draw"
		LD   A,C	; Remaining Height of new sprite to draw
		AND  A
		JR   Z, .EndDraw
.Draw:	DEC  C
		CALL DrawLineAndStepUp
.EndDraw:   ; 9EAC
		EXX	        ; Switch to "Undraw"
		JR   RedrawSprite

.UndrawDone:   ; 9EAFh
		EXX	        ; Switch to "Draw"
		LD   A,C
		AND  A
		JR   NZ,.Draw
		EXX	        ; Switch to "Undraw"
		LD   A,(SpriteHeight)
		LD   C,A
		LD   A,(UndrawSpriteHeight)
		OR   C      ; Are both Heights zero?
		RET  Z      ; Finished!
		XOR  A
		LD   (SpriteHeight),A
		EXX	        ; Switch to "Draw"
		LD   A,(UndrawSpriteHeight)
		LD   C,A
		XOR  A
		LD   (UndrawSpriteHeight),A
		EXX	        ; Switch to "Undraw"
		JR   RedrawSprite


	; START OF UndrawLineAndStepUp BLOCK
;[UndrawLineAndStepUpAligned]
		; Called from JR at the end of UndrawLineAndStepUp when the sprite being undrawn is character aligned
		; HL = 16 bits of sprite to XOR to screen
		; DE = Pointer into Source Sprite Graphic
		; Top of Stack = Screen Address to write bits
9ECE 	EX   DE,HL
9ECF 	EX   (SP),HL	; DE is now sprite bit data; HL = Screen Address to write bits; Stack = Pointer to Source Sprite Graphic
9ED0 	LD   A,D
9ED1 	XOR  (HL)
9ED2 	LD   (HL),A
9ED3 	INC  L
9ED4 	LD   A,E
9ED5 	XOR  (HL)
9ED6 	LD   (HL),A
9ED7 	POP  DE
9ED8 	DEC  L
9ED9 	JP   ScreenStepUp

UndrawLineAndStepUp:   ; =9EDC
		; HL = Screen Address (DE while EX)
		; DE = Address of Sprite Source Graphic (HL while EX)
		; Reads off two bytes of a source sprite graphic and then XORs to screen
9EDC 	EX   DE,HL
9EDD 	PUSH DE		; Save Screen address...
9EDE 	LD   D,(HL) ; Read two bytes of sprite into DE
9EDF 	INC  HL
9EE0 	LD   E,(HL)
9EE1 	INC  HL
9EE2 	EX   DE,HL  ; HL=16 bits of sprite data; DE=Pointer into Source Sprite Graphic
9EE3 	XOR  A      ; A is set to 0 as this will hold the bit shifted sprite data in HL into a 24 bit offset: AHL
9EE4 	JR   9EE4h  ; The offset of this JR is overwritten to draw the 16 bits of sprite to screen either:
		            ; a) character aligned (UndrawLineAndStepUpAligned routine at 9ECE above); or
					; b) unaligned (in which case one of 7 entry points below are used starting at 9EE6 which shift the bits)

9EE6 	ADD  HL,HL  ; Shift AHL 7 bits left
9EE7 	ADC  A,A
9EE8 	ADD  HL,HL  ; Shift AHL 6 bits left
9EE9 	ADC  A,A
9EEA 	ADD  HL,HL  ; Shift AHL 5 bits left
9EEB 	ADC  A,A
9EEC 	ADD  HL,HL  ; Shift AHL 4 bits left
9EED 	ADC  A,A
9EEE 	ADD  HL,HL  ; Shift AHL 3 bits left
9EEF 	ADC  A,A
9EF0 	ADD  HL,HL  ; Shift AHL 2 bits left
9EF1 	ADC  A,A
9EF2 	ADD  HL,HL  ; Shift AHL 1 bit left
9EF3 	ADC  A,A
		; AHL = 24 bits of sprite to XOR to screen
		; DE = Pointer into Source Sprite Graphic
		; Top of Stack = Screen Address to write bits
9EF4 	EX   DE,HL
9EF5 	EX   (SP),HL
9EF6 	XOR  (HL)
9EF7 	LD   (HL),A
9EF8 	INC  L
9EF9 	LD   A,D
9EFA 	XOR  (HL)
9EFB 	LD   (HL),A
9EFC 	INC  L
9EFD 	LD   A,E
9EFE 	XOR  (HL)
9EFF 	LD   (HL),A
9F00 	POP  DE
9F01 	DEC  L
9F02 	DEC  L

ScreenStepUp:	; 9F03
	; This routine adjusts HL register to reference 1 pixel higher on the screen
9F03 	DEC  H
9F04 	LD   A,H
9F05 	CPL
9F06 	AND  07
9F08 	RET  NZ
9F09 	LD   A,L
9F0A 	SUB  20h
9F0C 	LD   L,A
9F0D 	RET  C
9F0E 	LD   A,H
9F0F 	ADD  A,08h
9F11 	LD   H,A
9F12 	RET
	; END OF UndrawLineAndStepUp BLOCK


	; START OF DrawLineAndStepUp BLOCK
; [DrawLineAndStepUpAligned]
		; Called from JR at the end of DrawLineAndStepUp when the sprite being drawn is character aligned
		; HL = 16 bits of sprite to XOR to screen
		; DE = Pointer into Source Sprite Graphic
		; Top of Stack = Screen Address to write bits
9F13 	EX   DE,HL
9F14 	EX   (SP),HL	; DE is now sprite bit data; HL = Screen Address to write bits; Stack = Pointer to Source Sprite Graphic
9F15 	LD   A,D
9F16 	XOR  (HL)
9F17 	LD   (HL),A
9F18 	INC  L
9F19 	LD   A,E
9F1A 	XOR  (HL)
9F1B 	LD   (HL),A
9F1C 	POP  DE
9F1D 	DEC  L
9F1E 	JP   ScreenStepUp

DrawLineAndStepUp:   ; =9F21
		; HL = Screen Address (DE while EX)
		; DE = Address of Sprite Source Graphic (HL while EX)
		; Reads off two bytes of a source sprite graphic and then XORs to screen
9F21 	EX   DE,HL
9F22 	PUSH DE
9F23 	LD   D,(HL)
9F24 	INC  HL
9F25 	LD   E,(HL)
9F26 	INC  HL
9F27 	EX   DE,HL  ; HL=16 bits of sprite data; DE=Pointer into Source Sprite Graphic
9F28 	XOR  A      ; A is set to 0 as this will hold the bit shifted sprite data in HL into a 24 bit offset: AHL
9F29 	JR   $      ; The offset of this JR is overwritten to draw the 16 bits of sprite to screen either:
		            ; a) character aligned (DrawLineAndStepUpAligned routine at 9F13 above); or
					; b) unaligned (in which case one of 7 entry points below are used starting at 9F2B which shift the bits)
9F2B 	ADD  HL,HL  ; Shift AHL 7 bits left
9F2C 	ADC  A,A
9F2D 	ADD  HL,HL  ; Shift AHL 6 bits left
9F2E 	ADC  A,A
9F2F 	ADD  HL,HL  ; Shift AHL 5 bits left
9F30 	ADC  A,A
9F31 	ADD  HL,HL  ; Shift AHL 4 bits left
9F32 	ADC  A,A
9F33 	ADD  HL,HL  ; Shift AHL 3 bits left
9F34 	ADC  A,A
9F35 	ADD  HL,HL  ; Shift AHL 2 bits left
9F36 	ADC  A,A
9F37 	ADD  HL,HL  ; Shift AHL 1 bits left
9F38 	ADC  A,A
		; AHL = 24 bits of sprite to XOR to screen
		; DE = Pointer into Source Sprite Graphic
		; Top of Stack = Screen Address to write bits
9F39 	EX   DE,HL
9F3A 	EX   (SP),HL
9F3B 	XOR  (HL)
9F3C 	LD   (HL),A
9F3D 	INC  L
9F3E 	JR   9EF9h
	; END OF DrawLineAndStepUp BLOCK


9F40 	CALL PrepareUndrawSpriteDE
9F43 	JR   9F4Dh

9F45 	CALL PrepareDrawSpriteDE	; DE already holds address of Sprite bitmap data to render
9F48 	JR   9F59h

PrepAndRedrawSprite:   ; 9F4A
9F4A 	CALL PrepareUndrawSpriteIX
9F4D 	EXX
9F4E 	XOR  A
9F4F 	LD   (SpriteHeight),A      ; By setting this to 0 causes no actual rendering of sprite?
9F52 	LD   C,A
9F53 	JP   RedrawSprite

9F56 	CALL PrepareDrawSpriteBySpriteID	; A holds SpriteID which is used to locate sprite bitmap data (from SprGfxTable)
9F59 	EXX
9F5A 	XOR  A
9F5B 	LD   C,A
9F5C 	LD   (UndrawSpriteHeight),A
9F5F 	LD   A,(SpriteHeight)
9F62 	LD   (5E11h),A
		; Set Sprite Char Width (2 or 3 depending on if Sprite is character aligned)
9F65 	LD   A,L							; Sprite X Pos
9F66 	AND  07h
9F68 	LD   A,02h
9F6A 	JR   Z,9F6Dh
9F6C 	INC  A
9F6D 	LD   (SpriteCharWidth),A			; 2 if character aligned; 3 if not
9F70 	EXX
9F71 	JP   RedrawSprite

9F74 	PUSH DE
9F75 	CALL PrepareDrawSpriteDE	; DE already holds address of Sprite bitmap data to render
9F78 	EXX
9F79 	POP  DE
9F7A 	CALL PrepareUndrawSpriteDE
9F7D 	EXX
9F7E 	JR   9FD1h




PrepareDrawSpriteBySpriteID:   ; 9F80
		; A holds SpriteID to prepare rendering for.
		; The following call will look up the address of the bitmap data and return it in DE.  Lookup is done using SprGfxTable.
		; It then goes on to prepare rendering of this Sprite
	 	CALL LookupSpriteBitmapData

PrepareDrawSpriteDE:   ; 9F83
		; This routine works out how much shifting is requried when rendering the sprite to screen
		; and adjusts a JR offset to provide the requried shifting at point of rendering.  It then
		; prepares HL with the screen address to render to.
		; DE holds the address if the Sprite bitmap data (first byte holds sprite height in pixels)

9F83 	LD   HL,(SpriteXPos)	; L=X (pixels); H=Y (pixels)
		; The next 5 instructions convert the lower 3 bits of L (inter char offset of sprite)
		; and converts it to a JR offset value which is written to the JR at 9EE4 so that
		; sprite can shifted left prior to XORing to the screen.  If L is already char aligned,
		; the JR of 0Eh is detected and a different routine [DrawLineAndStepUpAligned] is used
		; to render the 16 bits to screen without any shifting at all.
9F86 	LD   A,L
9F87 	DEC  A
9F88 	RLCA
9F89 	AND  0Eh
9F8B 	CP   0Eh				; (E0h occurs when (L AND 7) = 0) and indicates that graphic is char aligned
9F8D 	JR   NZ,9F91h
9F8F 	LD   A,0E8h				; JR $-24 to use character-aligned routine [DrawLineAndStepUpAligned]
9F91 	LD   (9EE5h),A			; Write JR offset: JR $-24
9F94 	CALL CalcScreenAddr		; (L=X; H=Y)
9F97 	LD   A,(DE)
9F98 	LD   (SpriteHeight),A
9F9B 	LD   C,00h
9F9D 	INC  DE
9F9E 	RET


PrepareUndrawSpriteIX:   ; 9F9F
9F9F 	CALL LookupSpriteBitmapDataIX

PrepareUndrawSpriteDE:   ; 9FA2
9FA2 	LD   L,(IX+03h)
9FA5 	LD   H,(IX+04h)
		; The next 5 instructions convert the lower 3 bits of L (inter char offset of sprite)
		; and converts it to a JR offset value which is written to the JR at 9F29 so that
		; sprite can shifted left prior to XORing to the screen.  If L is already char aligned,
		; the JR of 0Eh is detected and a different routine  is used to render the 16 bits to
		; screen without any shifting at all.
9FA8 	LD   A,L
9FA9 	DEC  A
9FAA 	RLCA
9FAB 	AND  0Eh
9FAD 	CP   0Eh
		; Set Sprite Char Width (2 or 3 depending on if Sprite is character aligned)
9FAF 	JR   NZ,9FB3h
9FB1 	LD   A,0E8h
9FB3 	LD   (9F2Ah),A
9FB6 	LD   A,02h
9FB8 	JR   Z,9FBBh
9FBA 	INC  A
9FBB 	LD   (SpriteCharWidth),A ; 2 if character aligned; 3 if not
9FBE 	CALL CalcScreenAddr		 ; (L=X; H=Y)
9FC1 	LD   A,(DE)				 ; First byte of Sprite Bitmap Data is it's height
9FC2 	LD   (UndrawSpriteHeight),A
9FC5 	LD   (5E11h),A
9FC8 	JR   9F9Bh

9FCA 	CALL PrepareUndrawSpriteIX
9FCD 	EXX
9FCE 	CALL PrepareDrawSpriteBySpriteID
9FD1 	LD   A,(SpriteYPos)
9FD4 	SUB  (IX+04h)
9FD7 	JP   Z, 9EB5h
9FDA 	JP   M, 9FECh
9FDD 	LD   C,A
9FDE 	LD   A,(SpriteHeight)
9FE1 	CP   C
9FE2 	JP   C,9EB5h
9FE5 	SUB  C
9FE6 	LD   (SpriteHeight),A
9FE9 	JP   RedrawSprite

9FEC 	EXX
9FED 	NEG
9FEF 	LD   C,A
9FF0 	LD   A,(UndrawSpriteHeight)
9FF3 	CP   C
9FF4 	JP   C,9EB4h
9FF7 	SUB  C
9FF8 	JP   9EC8h

PrepSpriteDraw:   ; 9FFB
	; Prepare Drawing of Sprite by saving X, Y and SpriteID
	; into working variables from the object at (IX)
9FFB 	LD   A,(IX+03h)			; X
9FFE 	LD   (SpriteXPos),A
A001 	LD   A,(IX+04h)			; Y
A004 	LD   (SpriteYPos),A
A007 	LD   A,(IX+00h)			; Sprite
A00A 	LD   (SpriteID),A
A00D 	RET

A00E 	LD   A,(IX+03h)
A011 	LD   (SpriteXPos),A		; X
A014 	LD   A,(IX+04h)
A017 	LD   (SpriteYPos),A		; Y
; (A01A=Entry point)
A01A 	LD   L,(IX+03h)			; L=XPos
A01D 	LD   H,(IX+04h)			; H=YPos
A020 	LD   D,(IX+05h)			; D=Sprite Colour
A023 	LD   A,(RoomColour)
A026 	LD   E,A				; E=Room Colour
A027 	LD   A,(SpriteCharWidth)
A02A 	LD   B,A				; B=Sprite Char Width
		; Convert Some Kind of Y to "Sprite Char Height" which will end up in C
A02B 	LD   A,(5E11h)			; A=Some kind of Y (pixels)
A02E 	RRCA
A02F 	RRCA
A030 	INC  A					; Round up half a char
A031 	RRCA
A032 	AND  1Fh				; 0..31 (well 24)
A034 	INC  A
A035 	LD   C,A				; C = Sprite Char Height
A036 	PUSH BC
		; Set up B as an index into JumpTable3
A037 	LD   B,00h
A039 	LD   A,(SpriteXPos)
A03C 	CP   L
A03D 	JR   Z,0A043h
A03F 	JR   C,0A042h
A041 	INC  B
A042 	INC  B
A043 	LD   A,(SpriteYPos)
A046 	CP   H
A047 	LD   A,B
A048 	JR   Z,0A050h
A04A 	JR   C,0A04Eh
A04C 	ADD  A,04h
A04E 	ADD  A,04h
A050 	LD   B,A
A051 	CALL CalcAttrAddr   ; L=X position pixels 0-255; H=Y position pixels (0-175)
A054 	LD   A,B
A055 	POP  BC
A056 	PUSH HL
	; Call function #A in JumpTable3 and return
	; Top Of Stack = AttrAddr
A057 	LD   HL,JumpTable3
A05A 	SLA  A
A05C 	CALL Add_HL_A
A05F 	LD   A,(HL)
A060 	INC  HL
A061 	LD   H,(HL)
A062 	LD   L,A
A063 	JP   (HL)

JumpTable3:        ; A064   (11 entries; 9 specific routines)
	; Each routine has the following registers prepared:
	; IX = Sprite Object
	; Top Of Stack = Attribute address of Sprite's position
	; D = Sprite Colour; E = Room Colour
	; B = Sprite Char Width; C = Sprite Char Height
	DW DrawSpriteAttr
	DW DrawSpriteAttrMoveEast
	DW DrawSpriteAttrMoveWest
	DW WaitRoutine
	DW DrawSpriteAttrMoveSouth
	DW DrawSpriteAttrMoveSouthEast
	DW DrawSpriteAttrMoveSouthWest
	DW WaitRoutine
	DW DrawSpriteAttrMoveNorth
	DW DrawSpriteAttrMoveNorthEast
	DW DrawSpriteAttrMoveNorthWest

DrawSpriteAttr:   ; A07A
		; Fills the Attribute with the Sprite colour at Sprite's X,Y position and Char Width, Height
		POP  HL            ; HL = Attribute Address of Sprite's Position
.loop1	PUSH BC
		PUSH HL
.loop2	LD   (HL),D        ; D = Sprite colour
		INC  L
		DJNZ .loop2
		POP  HL
		LD   BC,0020h
		AND  A
		SBC  HL,BC
		POP  BC
		DEC  C
		JR   NZ, .loop1
		RET

DrawSpriteAttrMoveEast:   ; A08D
		; Fills the Attribute with the Sprite colour at Sprite's X,Y position and Char Width, Height
		; Also fills the Attribute column to the LEFT of the sprite with Room Colour
		POP  HL            ; HL = Attribute Address of Sprite's Position
.loop1 	PUSH BC
		PUSH HL
		DEC  L
		LD   (HL),E        ; E = Room Colour
		INC  L
.loop2	LD   (HL),D
		INC  L
		DJNZ .loop2
		POP  HL
		LD   BC,0020h
		AND  A
		SBC  HL,BC
		POP  BC
		DEC  C
		JR   NZ, .loop1
		RET

DrawSpriteAttrMoveWest:   ; A0A3
		; Fills the Attribute with the Sprite colour at Sprite's X,Y position and Char Width, Height
		; Also fills the Attribute column to the RIGHT of the sprite with Room Colour
		POP  HL            ; HL = Attribute Address of Sprite's Position
.loop1 	PUSH BC
		PUSH HL
.loop2 	LD   (HL),D        ; D = Sprite Colour
		INC  L
		DJNZ .loop2
		LD   (HL),E        ; E = Room Colour
		POP  HL
		LD   BC,0020h
		AND  A
		SBC  HL,BC
		POP  BC
		DEC  C
		JR   NZ, .loop1
		RET

DrawSpriteAttrMoveSouth:   ; A0B7
		; Fills the Attribute with the Sprite colour at Sprite's X,Y position and Char Width, Height
		; Also fills the Attribute row ABOVE the sprite with Room Colour
		POP  HL            ; HL = Attribute Address of Sprite's Position
.loop1	PUSH BC
		PUSH HL
.loop2	LD   (HL),D        ; D = Sprite Colour
		INC  L
		DJNZ .loop2
		POP  HL
		LD   BC,0020h
		AND  A
		SBC  HL,BC
		POP  BC
		DEC  C
		JR   NZ, .loop1
.ClearTopRow:   ; A0C9
		LD   A,H
		CP   58h           ; Skip of off top of screen
		RET  C
.loop3 	LD   (HL),E        ; E = Room Colour
		INC  L
		DJNZ .loop3
		RET

DrawSpriteAttrMoveSouthEast:   ; A0D2
		; Fills the Attribute with the Sprite colour at Sprite's X,Y position and Char Width, Height
		; Also fills the Attribute column to the LEFT and row ABOVE the sprite with Room Colour
		POP  HL            ; HL = Attribute Address of Sprite's Position
.loop1 	PUSH BC
		PUSH HL
		DEC  L
		LD   (HL),E        ; E = Room Colour
		INC  L
.loop2 	LD   (HL),D        ; D = Sprite Colour
		INC  L
		DJNZ .loop2
		POP  HL
		LD   BC,0020h
		AND  A
		SBC  HL,BC
		POP  BC
		DEC  C
		JR   NZ, .loop1
		DEC  L
		LD   (HL),E        ; E = Room Colour
		INC  L
		JR   DrawSpriteAttrMoveSouth.ClearTopRow   ; Paint final row with room colour

DrawSpriteAttrMoveNorth:   ; A0EC
		; Fills the Attribute with the Sprite colour at Sprite's X,Y position and Char Width, Height
		; Also fills the Attribute row BELOW the sprite with Room Colour
		POP  HL            ; HL = Attribute Address of Sprite's Position
		PUSH BC
		PUSH HL
		PUSH BC
		LD   BC,0020h
		ADD  HL,BC
		POP  BC
.loop2	LD   (HL),E        ; E = Room Colour
		INC  L
		DJNZ .loop2
		POP  HL
		POP  BC
		JP   DrawSpriteAttr.loop1

DrawSpriteAttrMoveNorthWest:   ; A0FE
		; Fills the Attribute with the Sprite colour at Sprite's X,Y position and Char Width, Height
		; Also fills the Attribute column to the RIGHT and row BELOW the sprite with Room Colour
		POP  HL            ; HL = Attribute Address of Sprite's Position
		PUSH BC
		PUSH HL
		PUSH BC
		LD   BC,0020h
		ADD  HL,BC
		POP  BC
		INC  B
.loop1	LD   (HL),E        ; E = Room Colour
		INC  L
		DJNZ .loop1
		POP  HL
		POP  BC
		JR   DrawSpriteAttrMoveWest.loop1

DrawSpriteAttrMoveSouthWest: ; A110
		; Fills the Attribute with the Sprite colour at Sprite's X,Y position and Char Width, Height
		; Also fills the Attribute column to the RIGHT and row ABOVE the sprite with Room Colour
		POP  HL               ; HL = Attribute Address of Sprite's Position
.loop2 	PUSH BC
		PUSH HL
.loop1	LD   (HL),D           ; D = Sprite Colour
		INC  L
		DJNZ .loop1
		LD   (HL),E           ; E = Room Colour
		POP  HL
		LD   BC,0020h
		AND  A
		SBC  HL,BC
		POP  BC
		DEC  C
		JR   NZ, .loop2
		INC  B
		JP   DrawSpriteAttrMoveSouth.ClearTopRow

DrawSpriteAttrMoveNorthEast:   ; A127
		; Fills the Attribute with the Sprite colour at Sprite's X,Y position and Char Width, Height
		; Also fills the Attribute column to the LEFT and row BELOW the sprite with Room Colour
		POP  HL            ; HL = Attribute Address of Sprite's Position
		PUSH BC
		PUSH HL
		PUSH BC
		LD   BC,0020h
		ADD  HL,BC
		POP  BC
		DEC  L
		INC  B
.loop1	LD   (HL),E        ; E = Room Colour
		INC  L
		DJNZ .loop1
		POP  HL
		POP  BC
		JP   DrawSpriteAttrMoveEast.loop1



; This is called once per room change and on two other events like collecting an object
; DE=2CC8
; Routine loops 3 times (B) and adds 16 to E making DE always 2CC8, 2CD8 and 2CE8.
A13B 	LD   DE, 2CC8h
A13E 	LD   HL, Inventory
A141 	LD   B, 03h
LA143 	CALL LA14D
A146 	LD   A,E
A147 	ADD  A,10h
A149 	LD   E,A
A14A 	DJNZ LA143
A14C 	RET

LA14D 	PUSH BC   ; A14D
A14E 	PUSH DE
A14F 	PUSH IX
A151 	LD   IX, BufferA_8
A155 	LD   A,(HL)
A156 	INC  HL
A157 	OR   (HL)
A158 	INC  HL
A159 	LD   A,(HL)
A15A 	JR   NZ,0A15Eh
A15C 	LD   A,31h
A15E 	INC  HL
A15F 	LD   (IX+00h),A
A162 	LD   (IX+03h),E
A165 	LD   (IX+04h),D
A168 	LD   A,(HL)
A169 	INC  HL
A16A 	LD   (IX+05h),A
A16D 	PUSH HL
A16E 	CALL Clear20by2
A171 	CALL PrepAndRedrawSprite
A174 	CALL 0A00Eh
A177 	POP  HL
A178 	POP  IX
A17A 	POP  DE
A17B 	POP  BC
A17C 	RET


BufferA_8:   ; A17D
	; 8 byte buffer
	DB 000h,000h,000h,000h,000h,000h,000h,000h

	; or could be self-modifying code, but it never appears to get called.
	; We've seen these cases though:
	; [21 00 00 xx xx xx 00 00] => LD HL, 0000 : RET M  : ADC A, L : LD B, A : NOP : NOP
	; [31 00 00 E8 2C 00 00 00] => LD SP, 0000 : RET PE : INC L : NOP    : NOP : NOP
	; [8D 00 00 E8 2C 46 00 00] => ADC A, L    : NOP    : NOP   : RET PE : INC L : LD B, (HL) : NOP : NOP

Clear20by2:		; A185
A185 	LD   L,(IX+03h)		; X pos (pixels; 0=left)
A188 	LD   H,(IX+04h)		; Y pos (pixels; 0=top)
A18B 	CALL CalcScreenAddr
A18E 	LD   B,14h
LA190 	LD   (HL),00		; Blank 20 pixels (2 chars) on screen
A192 	INC  L
A193 	LD   (HL),00
A195 	DEC  L
A196 	CALL ScreenStepUp
A199 	DJNZ LA190
A19B 	RET



		; Adds the value held in BC to the player's score
		; Score is held in BCD format in 3 digits
IncrementScore:   ; 0A19Ch
A19C 	LD   HL,Score+02h	; Lowest two digits of score (BCD)
A19F 	LD   A,(HL)
A1A0 	ADD  A,C
A1A1 	DAA
A1A2 	LD   (HL),A
A1A3 	DEC  HL
A1A4 	LD   A,(HL)
A1A5 	ADC  A,B
A1A6 	DAA
A1A7 	LD   (HL),A
A1A8 	DEC  HL
A1A9 	LD   A,(HL)
A1AA 	ADC  A,00h
A1AC 	DAA
A1AD 	LD   (HL),A

		; Print the Score to the screen
A1AE 	LD   HL,0BFCCh
A1B1 	LD   (FontBase),HL
A1B4 	LD   HL,50C8h
A1B7 	CALL CalcScreenAddr		; (Y=10, X=25)

	; Print Score (3 bytes = 6 digits in BCD format)
A1BA 	LD   DE, Score
A1BD 	LD   B,03h

PrintDigitsFromDE: ; A1BF
	; DE = Address of a BCD number
	; B = Number of bytes (i.e. Number of Digits Printed = 2 * B)
A1BF 	LD   A,(DE)
A1C0 	RRCA
A1C1 	RRCA
A1C2 	RRCA
A1C3 	RRCA
A1C4 	AND  0Fh
A1C6 	CALL Print8x8
PrintDigitsFromDEOdd:	; A1C9
	; This entrypoint allows printing of a odd number of BCD digits located at DE.
A1C9 	LD   A,(DE)
A1CA 	AND  0Fh
A1CC 	CALL Print8x8
A1CF 	INC  DE
A1D0 	DJNZ PrintDigitsFromDE
A1D2 	RET

; Prints ascii character in A to the screen at pre-calculated screen address in HL.
; Leaves HL pointing to the next screen position ready for the next character.
Print8x8:          ; 0A1D3h
A1D3 	PUSH BC
A1D4 	PUSH DE
A1D5 	PUSH HL
A1D6 	LD   L,A
A1D7 	LD   H,00h
A1D9 	ADD  HL,HL
A1DA 	ADD  HL,HL
A1DB 	ADD  HL,HL
A1DC 	LD   DE,(FontBase)
A1E0 	ADD  HL,DE
A1E1 	EX   DE,HL
A1E2 	POP  HL
A1E3 	LD   B,08h
A1E5 	LD   A,(DE)
A1E6 	LD   (HL),A
A1E7 	INC  DE
A1E8 	INC  H
A1E9 	DJNZ A1E5
A1EB 	POP  DE
A1EC 	POP  BC
A1ED 	LD   A,H
A1EE 	SUB  08h
A1F0 	LD   H,A
A1F1 	INC  L
A1F2 	RET


PrintText:   ; A1F3
		PUSH HL		; (L=X; H=Y)
		CALL CalcScreenAddr
		LD   A,(DE)	; Read Text Colour
		EX   AF,AF'	; and save in A'
		INC  DE
		EXX
		POP  HL		; Calc Attribute colour
		CALL CalcAttrAddr
.loop:	EXX			; Save in HL'
		LD   A,(DE)	; Read character
		BIT  7,A	; Last character?
		JR   NZ, PrintText.end
		CALL Print8x8	; Print character
		INC  DE
		EXX
		EX   AF,AF'
		LD   (HL),A		; Print Attr
		INC  L
		EX   AF,AF'
		JR   PrintText.loop
.end:	AND  7Fh   ; A210
		CALL Print8x8	; Print final character
		EXX
		EX   AF,AF'
		LD   (HL),A		; Print Attr
		RET


PrintPanel:        ; 0A219h
		LD   HL,PanelGfx
		LD   (FontBase),HL
		LD   HL,00C0h
		LD   DE,PanelTxt
		LD   BC,0818h
.loop1:	PUSH BC
		PUSH HL
		CALL CalcScreenAddr		; (L=X; H=Y)
.loop2:	LD   A,(DE)
		INC  DE
		CALL Print8x8
		DJNZ .loop2
		POP  HL
		LD   A,H
		ADD  A,08h
		LD   H,A
		POP  BC
		DEC  C
		JR   NZ, .loop1
		JP   0A1AEh


DisplayPanel:      ; A240
		LD   HL,00C0h
		CALL CalcAttrAddr
		LD   BC,0818h
		LD   A,(RoomColour)
		CPL				; Panel is inverse colour of current room
		AND  07h
		CP   02h
		JR   NC,0A255h
		LD   A,44h
		LD   E,A
		PUSH DE
.loop4:	PUSH BC			; A257
		PUSH HL
.loop3:	LD   (HL),E		; A259
		INC  L
		DJNZ .loop3		; A259
		POP  HL
		LD   BC,0020h
		ADD  HL,BC
		POP  BC
		DEC  C
		JR   NZ,.loop4	; A257
A266 	LD   HL,90C8h
A269 	CALL CalcAttrAddr
A26C 	LD   A,(RoomColour)
A26F 	LD   BC,0303h			; 3x3 Area
A272 	CALL FillAttrRect
A275 	INC  L
A276 	LD   (HL),A
A277 	ADD  HL,DE
A278 	LD   BC,0202h			; 2x2 Area
A27B 	CALL FillAttrRect
A27E 	LD   HL,98D0h
A281 	CALL CalcAttrAddr
A284 	POP  DE
A285 	LD   (HL),E
A286 	LD   HL,7DC8h
A289 	CALL CalcAttrAddr
A28C 	LD   BC,0603h
A28F 	LD   A,47h
A291 	CALL FillAttrRect
A294 	LD   HL,5FC8h
A297 	CALL CalcAttrAddr
A29A 	LD   BC,0604h
A29D 	LD   A,46h
A29F 	CALL FillAttrRect
A2A2 	LD   HL,48C8h
A2A5 	CALL CalcAttrAddr
A2A8 	LD   BC,0601h
A2AB 	LD   A,45h
A2AD 	CALL FillAttrRect
A2B0 	LD   BC,0601h
A2B3 	LD   A,47h
A2B5 	CALL FillAttrRect
A2B8 	LD   HL,38C8h
A2BB 	CALL CalcAttrAddr
A2BE 	LD   BC,0601h
A2C1 	LD   A,43h
A2C3 	CALL FillAttrRect
A2C6 	LD   BC,0601h
A2C9 	LD   A,47h
A2CB 	JP   FillAttrRect

A2CE 	PUSH IX
	; Self Modifying Code!
A2D0 	LD   IX, BufferA_8
A2D4 	LD   A,(ControlFlags)
A2D7 	RLCA
A2D8 	AND  30h			; OpCode 00xx0000	= 00 10 20 30
A2DA 	OR   01h			; OpCode 00xx0001	= 01 11 21 31
A2DC 	LD   (IX+00h),A		; Write OpCode      => LD BC,nn | LD DE,nn | LD HL,nn | LD SP,nn
A2DF 	LD   (IX+05h),47h	; Write OpCode		=> LD B, A
A2E3 	LD   HL,8DC8h
A2E6 	LD   (IX+03h),L		; Write value to assign to BC,DE,HL,SP
A2E9 	LD   (IX+04h),H
A2EC 	LD   A,(LivesLeft)
A2EF 	LD   C,A
A2F0 	LD   B,03h			; BC=03(lives)
.loop1:	PUSH BC   ; A2F2
		CALL Clear20by2
		LD   A,C
		AND  A
		JR   Z,0A2FDh
		CALL PrepAndRedrawSprite
		LD   A,(IX+03h)
		ADD  A,10h
		LD   (IX+03h),A
		POP  BC
		DEC  C
		JP   P, .skip1
		LD   C,00h
.skip1:	DJNZ .loop1   ; A30C
A30E 	POP  IX
A310 	RET

A311 	LD   IX, BufferA_8
A315 	LD   HL,LA331
A318 	LD   B,09h
.loop2:	PUSH BC   ; A31A
		LD   DE, BufferA_8
		LD   BC,0008h
		LDIR
		PUSH HL
		PUSH DE
		CALL PrepAndRedrawSprite
		CALL 0A00Eh
		POP  DE
		POP  HL
		POP  BC
		DJNZ .loop2
A330 	RET


LA331:
	; LD (NNNN),A: JR NZ, $-4F : LD B, (HL)??
	DB 032h,000h,000h,020h,04Fh,046h,000h,000h

LA339:
	DB 033h,000h,000h,030h,04Fh,046h,000h,000h
	DB 04Ah,000h,000h,020h,037h,044h,000h,000h
	DB 04Bh,000h,000h,030h,037h,044h,000h,000h
	DB 048h,000h,000h,020h,01Ch,043h,000h,000h
	DB 049h,000h,000h,030h,01Ch,043h,000h,000h
	DB 001h,000h,000h,028h,067h,047h,000h,000h
	DB 011h,000h,000h,028h,07Fh,047h,000h,000h
	DB 021h,000h,000h,028h,097h,047h,000h,000h


LA379: ; A379
A379 	LD   L,H
A37A 	LD   H,00h
A37C 	EXX
A37D 	LD   HL,0000h
A380 	LD   B,08h
A382 	EXX
A383 	SLA  L
A385 	RL   H
A387 	PUSH HL
A388 	AND  A
A389 	SBC  HL,DE
A38B 	JR   C,0A399h
A38D 	POP  AF
A38E 	EXX
A38F 	ADD  HL,HL
A390 	INC  HL
A391 	DJNZ 0A382h
A393 	PUSH HL
A394 	EXX
A395 	LD   E,L
A396 	LD   D,H
A397 	POP  HL
A398 	RET

A399 	POP  HL
A39A 	EXX
A39B 	ADD  HL,HL
A39C 	JR   0A391h

A39E 	PUSH DE
A39F 	EX   DE,HL
A3A0 	LD   HL,0000h
A3A3 	AND  A
A3A4 	SBC  HL,DE
A3A6 	POP  DE
A3A7 	RET


Beep:   ; A3A8
A3A8 	LD   C,01h

MakeSound:   ; A3AA
	; B is approximate frequency; C = approximate duration
A3AA 	LD   A,10h
A3AC 	OUT  (0FEh),A
A3AE 	PUSH BC
A3AF 	DJNZ 0A3AFh
A3B1 	POP  BC
A3B2 	PUSH BC
A3B3 	XOR  A
A3B4 	OUT  (0FEh),A
A3B6 	DJNZ 0A3B6h
A3B8 	POP  BC
A3B9 	DEC  C
A3BA 	JR   NZ,MakeSound
A3BC 	RET

MakePickUpSound: ; A3BD
A3BD 	LD   BC,4040h
A3C0 	JR   MakeSound

MakeDropObjectSound: ; A3C2
A3C2 	LD   BC,2080h	; Approx octive higher than pick up sound
A3C5 	JR   MakeSound

PlayFootstepSound: ; A3C7
A3C7 	LD   HL,FootstepIndex
A3CA 	INC  (HL)
A3CB 	LD   A,(HL)
A3CC 	BIT  1,A
A3CE 	JR   Z,PlayFootstepSound2
A3D0 	AND  01h
A3D2 	RET  Z

	; Footstep #1 Sound
A3D3 	LD   BC,4004h
A3D6 	JR   MakeSound

	; Footstep #2 Sound
PlayFootstepSound2: ; A3D8
A3D8 	AND  01h
A3DA 	RET  Z
A3DB 	LD   BC,6004h
A3DE 	JR   MakeSound

PlayRespawnBeep: ; A3E0
A3E0 	LD   BC,8060h
A3E3 	JR   MakeSound

PrepExplosionObject:   ; A3E5
A3E5 	LD   BC,6410h
A3E8 	LD   HL,ExplosionObject
A3EB 	LD   (HL),B		; 64=SpriteID+1? Axe?
A3EC 	INC  HL
A3ED 	LD   (HL),C		; Room No
A3EE 	RET

PlayKillGhostSound:   ; A3EF
A3EF 	DEC  (IX+01h)				; Reduce index/counter (10h to 01h)
A3F2 	JR   Z,ZeroMemIXAndRet		; Reached end of sound?
A3F4 	LD   A,(IX+01h)
A3F7 	LD   C,A
A3F8 	XOR  43h
A3FA 	LD   B,A
;	The above formula equates to these values:
;	A	0F	0E	0D	0C	0B	0A	09	08	07	06	05	04	03	02	01 (counter)
;	B	4C	4D	4E	4F	48	49	4A	4B	44	45	46	47	40	41	42 (frequency)
;	C	0F	0E	0D	0C	0B	0A	09	08	07	06	05	04	03	02	01 (duration)
A3FB 	JP   MakeSound

ZeroMemIXAndRet:   ; A3FE
A3FE 	LD   (IX+00h),00h
A402 	RET

A403 	LD   BC,650Ah
A406 	JR   0A3E8h


PlayChangeRoomSound:   ; A408
A408 	DEC  (IX+01h)				; Reduce index/counter (09h to 01h)
A40B 	JR   Z,ZeroMemIXAndRet		; Reached end of sound?
A40D 	LD   A,(IX+01h)
A410 	LD   C,A
A411 	RLCA
A412 	RLCA
A413 	RLCA
A414 	CPL
A415 	XOR  40h
A417 	LD   B,A
;	The above formula equates to these values:
;	A	09	08	07	06	05	04	03	02	01 (counter)
;	B	F7	FF	87	8F	97	9F	A7	AF	B7 (frequency)
;	C	09	08	07	06	05	04	03	02	01 (duration)
A418 	JP   MakeSound

A41B 	LD   D,0Ch
A41D 	LD   A,D
A41E 	RRCA
A41F 	LD   B,A
A420 	CALL Beep
A423 	DEC  D
A424 	JR   NZ,0A41Dh
A426 	RET

LA427:	LD   D,10h   ; A427
.loop:	LD   A,D
		RLCA
		RLCA
		XOR  07h
		RLCA
		RLCA
		LD   B,A
		CALL Beep
		DEC  D
		JR   NZ, .loop   ; A429
		RET

LA438:	LD   D,08h   ; A438
.loop:	LD   A,D
		CPL
		RLCA
		LD   B,A
		CALL Beep
		DEC  D
		JR   NZ, .loop   ; A43A
		RET

A445 	LD   A,(GhostsInRoom)
A448 	INC  A
A449 	RLCA
A44A 	RLCA
A44B 	RLCA
A44C 	RLCA
A44D 	OR   0Fh
A44F 	AND  7Fh
A451 	LD   D,A
A452 	LD   A,D
A453 	XOR  20h
A455 	LD   B,A
A456 	CALL Beep
A459 	DEC  D
A45A 	RET  Z
A45B 	DEC  D
A45C 	RET  Z
A45D 	JR   0A452h

A45F 	LD   A,(IX+06h)
A462 	CPL
A463 	RLCA
A464 	AND  3Fh
A466 	OR   40h
A468 	LD   B,A
A469 	LD   C,10h
A46B 	JP   MakeSound

A46E 	LD   BC,0830h
A471 	LD   HL,0000h
A474 	LD   E,(HL)
A475 	INC  HL
A476 	PUSH BC
A477 	RRC  E
A479 	LD   A,E
A47A 	AND  10h
A47C	OUT  (0FEh),A
A47E 	DJNZ 0A477h
A480 	POP  BC
A481 	DEC  C
A482 	JR   NZ,0A474h
A484 	RET

A485 	LD   BC,0A010h
A488 	JP   0A3E8h


PlayEatFoodSound:   ; A48B
A48B	DEC  (IX+01h)				; Reduce index/counter (0Fh to 00h)
A48E	JP   M,ZeroMemIXAndRet		; Reached end of sound?
A491	LD   C,(IX+01h)
A494	LD   B,00h
A496	LD   HL,EatFoodSoundData
A499	ADD  HL,BC
A49A	LD   B,(HL)
A49B	LD   C,08h
A49D	JP   MakeSound



EatFoodSoundData:   ; A4A0
A4A0	DB 080h,090h,080h,090h,080h,090h,080h,090h
A4A8	DB 080h,070h,060h,050h,040h,030h,020h,010h


PlayBounceBulletSound:   ; A4B0
	; Called twice on each bounce (sound occurs over 2 frames basically)
	; Not sure about the point of LD D, 40 : DEC D yet
A4B0	LD D, 40h
A4B2	DEC D
A4B3	RET Z
A4B4	LD A, D
A4B5	RRCA
A4B6	RRCA
A4B7	RRCA
A4B8	LD B, A
A4B9	LD C, 04h
A4BB	JP MakeSound

SprGfxTable:       ; A4BE (160 entries)
	DW SprGfxKnightLt0, SprGfxKnightLt1, SprGfxKnightLt2, SprGfxKnightLt1   ; index 0-3   Player Knight Left (4 frames; 3 sprites)
	DW SprGfxKnightRt0, SprGfxKnightRt1, SprGfxKnightRt2, SprGfxKnightRt1   ; index 4-7   Player Knight Right (4 frames; 3 sprites)
	DW SprGfxKnightUp0, SprGfxKnightUp1, SprGfxKnightUp2, SprGfxKnightUp1   ; index 8-11  Knight Up (4 frames; 3 sprites)
	DW SprGfxKnightDn0, SprGfxKnightDn1, SprGfxKnightDn2, SprGfxKnightDn1  	; index 12-15 Knight Down (4 frames; 3 sprites)

	DW SprGfxWizardLt0, SprGfxWizardLt1, SprGfxWizardLt2, SprGfxWizardLt1   ; index 16-19 Wizard Left (4 frames; 3 sprites)
	DW SprGfxWizardRt0, SprGfxWizardRt1, SprGfxWizardRt2, SprGfxWizardRt1   ; index 20-23 Wizard Right (4 frames; 3 sprites)
	DW SprGfxWizardUp0, SprGfxWizardUp1, SprGfxWizardUp2, SprGfxWizardUp1   ; index 24-27 Wizard Up (4 frames; 3 sprites)
	DW SprGfxWizardDn0, SprGfxWizardDn1, SprGfxWizardDn2, SprGfxWizardDn1   ; index 28-31 Wizard Down (4 frames; 3 sprites)

	DW SprGfxSerfLt0, SprGfxSerfLt1, SprGfxSerfLt2, SprGfxSerfLt1   ; index 32-35 Serf   Left (4 frames; 3 sprites)
	DW SprGfxSerfRt0, SprGfxSerfRt1, SprGfxSerfRt2, SprGfxSerfRt1   ; index 36-39 Serf   Right (4 frames; 3 sprites)
	DW SprGfxSerfUp0, SprGfxSerfUp1, SprGfxSerfUp2, SprGfxSerfUp1   ; index 40-43 Serf   Up (4 frames; 3 sprites)
	DW SprGfxSerfDn0, SprGfxSerfDn1, SprGfxSerfDn2, SprGfxSerfDn1   ; index 44-47 Serf   Down (4 frames; 3 sprites)

	DW 0AEECh								; index 48      [Blank?]

	DW SprGfxIconCursorLeft					; index 49      Cursor Icon (left)
	DW SprGfxIconCursorRight				; index 50      Cursor Icon (right)

	DW SprGfxWizardSpell0, SprGfxWizardSpell1, SprGfxWizardSpell1, SprGfxWizardSpell2   ; index 51-54 Wizard Spell (4 frames; 3 sprites)

	DW SprGfxSerfSwordN, SprGfxSerfSwordNE, SprGfxSerfSwordE, SprGfxSerfSwordSW   ; index 55-58 Serf Sword (n, ne, e, sw)
	DW SprGfxSerfSwordS, SprGfxSerfSwordSE, SprGfxSerfSwordW, SprGfxSerfSwordNW   ; index 59-62 Serf Sword (s, se, w, nw)

	DW SprGfxKnightAxe0, SprGfxKnightAxe1, SprGfxKnightAxe2, SprGfxKnightAxe3	; index 63-70 Knight's Axe (8 frames)
	DW SprGfxKnightAxe4, SprGfxKnightAxe5, SprGfxKnightAxe6, SprGfxKnightAxe7

	DW SprGfxIconKeyboardLeft				; index 71      Icon: Keyboard Icon (left)
	DW SprGfxIconKeyboardRight				; index 72      Icon: Keyboard Icon (right)

	DW SprGfxIconJoystickLeft				; index 73      Icon: Joystick Icon (left)
	DW SprGfxIconJoystickRight				; index 74      Icon: Joystick Icon (right)

	DW SprGfxGhostPumpkin1					; index 75      Ghost: Pumpkin (frame 1)
	DW SprGfxGhostPumpkin2					; index 76      Ghost: Pumpkin (frame 2)

	DW SprGfxGhostMini1						; index 77      Ghost: Mini (frame 1)
	DW SprGfxGhostMini2						; index 78      Ghost: Mini (frame 2)

	DW SprGfxFoodCan						; index 79      Food: Can
	DW SprGfxFoodStrippedCandy				; index 80      Food: Stripped Candy
	DW SprGfxFoodLegOfLamb					; index 81      Food: Leg of Lamb
	DW SprGfxFoodLollypop					; index 82      Food: Lollypop
	DW SprGfxFoodCone						; index 83      Food: Cone
	DW SprGfxFoodBowl						; index 84      Food: Bowl
	DW SprGfxFoodApple						; index 85      Food: Apple
	DW SprGfxFoodMilkBottle					; index 86      Food: Milk Bottle

	DW SprGfxSpawn1							; index 87      Misc: Spawn (frame 1)
	DW SprGfxSpawn2							; index 88      Misc: Spawn (frame 2)
	DW SprGfxSpawn3							; index 89      Misc: Spawn (frame 3)
	DW SprGfxSpawn4							; index 90      Misc: Spawn (frame 4)

	DW SprGfxGhostSpider1					; index 91      Ghost: Spider (frame 1)
	DW SprGfxGhostSpider2					; index 92      Ghost: Spider (frame 2)

	DW SprGfxGhostMonster1					; index 93      Ghost: Monster (frame 1)
	DW SprGfxGhostMonster2					; index 94      Ghost: Monster (frame 2)

	DW SprGfxGhostRabbit1					; index 95      Ghost: Rabbit (frame 1)
	DW SprGfxGhostRabbit2					; index 96      Ghost: Rabbit (frame 2)

	DW SprGfxGhostGhoul1					; index 97      Ghost: Ghoul (frame 1)
	DW SprGfxGhostGhoul2					; index 98      Ghost: Ghoul (frame 2)

	DW 0AEEAh,0AEEAh,0AEEAh,0AEEAh			; index 99-102  (custom)

	DW SprGfxGhostGhost1					; index 103     Ghost: Ghost (frame 1)
	DW SprGfxGhostGhost2					; index 104     Ghost: Ghost (frame 2)

	DW SprGfxGhostBat1						; index 105     Ghost: Bat (frame 1)
	DW SprGfxGhostBat2						; index 106     Ghost: Bat (frame 2)

	DW SprGfxDestroy1						; index 107     Misc: Destroy (frame 1) (ghost animation when you kill it)
	DW SprGfxDestroy2						; index 108     Misc: Destroy (frame 2)
	DW SprGfxDestroy3						; index 109     Misc: Destroy (frame 3)
	DW SprGfxDestroy4						; index 110     Misc: Destroy (frame 4)

	DW SprGfxMonsterMummy1					; index 111     Monster: Mummy (frame 1)
	DW SprGfxMonsterMummy2					; index 112     Monster: Mummy (frame 2)
	DW SprGfxMonsterMummy3					; index 113     Monster: Mummy (frame 3)
	DW SprGfxMonsterMummy2					; index 114     Monster: Mummy (frame 4; repeat of frame 2)

	DW SprGfxMonsterFrankenstein1			; index 115     Monster: Frakenstein (frame 1)
	DW SprGfxMonsterFrankenstein2			; index 116     Monster: Frakenstein (frame 2)
	DW SprGfxMonsterFrankenstein3			; index 117     Monster: Frakenstein (frame 3)
	DW SprGfxMonsterFrankenstein2			; index 118     Monster: Frakenstein (frame 4; repeat of frame 2)

	DW SprGfxMonsterDevil1					; index 119     Monster: Devil (frame 1)
	DW SprGfxMonsterDevil2					; index 120     Monster: Devil (frame 2)
	DW SprGfxMonsterDevil3					; index 121     Monster: Devil (frame 3)
	DW SprGfxMonsterDevil2					; index 122     Monster: Devil (frame 4; repeat of frame 2)

	DW SprGfxMonsterDracula1				; index 123     Monster: Dracula (frame 1)
	DW SprGfxMonsterDracula2				; index 124     Monster: Dracula (frame 2)
	DW SprGfxMonsterDracula3				; index 125     Monster: Dracula (frame 3)
	DW SprGfxMonsterDracula2				; index 126     Monster: Dracula (frame 4; repeat of frame 2)

	DW SprGfxObjMummyLeaf					; index 127     Object: Red Mummy Leaf
	DW SprGfxObjColourKey					; index 128     Object: Red/Green/Cyan/Yellow Colour Key
	DW SprGfxObjBottle						; index 129     Object: Green Bottle
	DW SprGfxObjSwede						; index 130     Object: Cyan Swede
	DW SprGfxObjWing						; index 131     Object: Yellow Wing
	DW SprGfxObjNecklace					; index 132     Object: Cyan Necklace
	DW SprGfxObjTelescope					; index 133     Object: Green Telescope (Talon?)
	DW SprGfxObjGem							; index 134     Object: Magenta Gem
	DW SprGfxObjMoneyBag					; index 135     Object: Red Bag of Money
	DW SprGfxObjSkull						; index 136     Object: White Skull
	DW SprGfxObjCrucifix					; index 137     Object: Yellow Crucifix
	DW SprGfxObjSpanner						; index 138     Object: Green Spanner
	DW SprGfxObjAcgKey1						; index 139     Object: Yellow ACG Key (AC)
	DW SprGfxObjAcgKey2						; index 140     Object: Yellow ACG Key (G)
	DW SprGfxObjAcgKey3						; index 141     Object: Yellow ACG Key (handle)

	DW SprGfxTombstone						; index 142     Misc: Tombstone

	DW SprGfxGhostWitchLeft1				; index 143     Ghost: Witch Left (frame 1)
	DW SprGfxGhostWitchLeft2				; index 144     Ghost: Witch Left (frame 2)
	DW SprGfxGhostWitchRight1				; index 145     Ghost: Witch Right (frame 1)
	DW SprGfxGhostWitchRight2				; index 146     Ghost: Witch Right (frame 2)

	DW SprGfxGhostMonkLeft1					; index 147     Ghost: Monk Left (frame 1)
	DW SprGfxGhostMonkLeft2					; index 148     Ghost: Monk Left (frame 2)
	DW SprGfxGhostMonkRight1				; index 149     Ghost: Monk Right (frame 1)
	DW SprGfxGhostMonkRight2				; index 150     Ghost: Monk Right (frame 2)

	DW SprGfxGhostBatLeft1					; index 151     Ghost: Bat Left  (frame 1)
	DW SprGfxGhostBatLeft2					; index 152     Ghost: Bat Left  (frame 2)
	DW SprGfxGhostBatRight1					; index 153     Ghost: Bat Rightt (frame 1)
	DW SprGfxGhostBatRight2					; index 154     Ghost: Bat Rightt (frame 2)

	DW SprGfxMonsterHunchback1				; index 155     Monster: Hunchback (frame 1)
	DW SprGfxMonsterHunchback2				; index 156     Monster: Hunchback (frame 2)
	DW SprGfxMonsterHunchback3				; index 157     Monster: Hunchback (frame 3)
	DW SprGfxMonsterHunchback2				; index 158     Monster: Hunchback (frame 4; repeat of frame 2)

	DW 0AEEAh								; index 159     (custom)

	DW SprGfxMushroom						; index 160     Misc: Mushroom


BackSprTable:      ; 0A600h
	; This is a list of addresses of sprites.
	; Each sprite comprises of two bytes holding the Width (chars) and Height (pixels).  This is followed by the bitmap data.
	;
	; Sprites are stored and rendered bottom to top so we start with the bottom line of the full chicken.
	; This might be to minimise screen tearing when rendering to the screen.
	;
	; This table is used by GetBackgroundGFX to read the width and height into B and C registers (respectively) and DE pointing to the
	; first byte of the bitmap.

	DW BackSpriteOpenCavernDoor		; BCCE index 0
	DW BackSpriteOpenRoomDoor		; A76E index 1
	DW BackSpriteLargeRoomDoor		; B3EA index 2
	DW 0AEEAh						; AEEA index 3
	DW 0AEEAh						; AEEA index 4
	DW 0AEEAh						; AEEA index 5
	DW 0AEEAh						; AEEA index 6
	DW BackSpriteLockedRoomDoor		; A69C index 7	; Locked Red Door
	DW BackSpriteLockedRoomDoor		; A69C index 8	; Locked Green Door
	DW BackSpriteLockedRoomDoor		; A69C index 9	; Locked Blue Door
	DW BackSpriteLockedRoomDoor		; A69C index 10 ; Locked Yellow Door
	DW BackSpriteLockedCavernDoor	; C2AE index 11	; Locked Red Door
	DW BackSpriteLockedCavernDoor	; C2AE index 12	; Locked Green Door
	DW BackSpriteLockedCavernDoor	; C2AE index 13	; Locked Blue Door
	DW BackSpriteLockedCavernDoor	; C2AE index 14 ; Locked Yellow Door
	DW BackSpriteClock				; B6F2 index 15
	DW BackSpriteGhostPicture		; B4C6 index 16
	DW BackSpriteTable				; A7EC index 17
	DW BackSpriteFullChicken		; C542 index 18
	DW BackSpriteEmptyChicken		; C48C index 19
	DW BackSpriteTrophyHorns		; C66A index 20
	DW BackSpriteTrophy				; C6AC index 21
	DW BackSpriteBookshelf			; C6CE index 22
	DW BackSpriteTrapdoorClosed		; C7F2 index 23
	DW BackSpriteTrapdoorOpen		; C770 index 24
	DW BackSpriteBarrel				; CFD5 index 25
	DW BackSpriteBearRug			; C874 index 26
	DW BackSpriteAcgShield			; C9CA index 27
	DW BackSpriteShield2			; C9EC index 28
	DW BackSpriteSuitOfArmour		; CA0E index 29
	DW 0AEEAh						; AEEA index 30
	DW BackSpriteClosedRoomDoor		; CA82 index 31
	DW BackSpriteOpenRoomDoor		; A76E index 32
	DW BackSpriteClosedCavernDoor	; CAE4 index 33
	DW BackSpriteOpenCavernDoor		; BCCE index 34
	DW BackSpriteAcgDoor			; D069 index 35
	DW BackSpritePicture			; D253 index 36
	DW BackSpriteSkeleton			; D2EE index 37
	DW BackSpriteBarrelPile			; D466 index 38


BackSprAttrTable:	; 0A64Eh
	DW BackSpriteAttrOpenCavernDoor			; A7DE index 0
	DW BackSpriteAttrOpenRoomDoor			; A7D0 index 1
	DW BackSpriteAttrLargeRoomDoor			; B4AC index 2
	DW 0AEEAh								; AEEA index 3
	DW 0AEEAh								; AEEA index 4
	DW 0AEEAh								; AEEA index 5
	DW 0AEEAh								; AEEA index 6
	DW BackSpriteAttrLockedRoomDoorRed		; A6FE index 7	; Locked Red Door
	DW BackSpriteAttrLockedRoomDoorGreen	; A70C index 8	; Locked Green Door
	DW BackSpriteAttrLockedRoomDoorBlue		; A71A index 9	; Locked Blue Door
	DW BackSpriteAttrLockedRoomDoorYellow	; A728 index 10 ; Locked Yellow Door
	DW BackSpriteAttrLockedCavernDoorRed	; A736 index 11	; Locked Red Door
	DW BackSpriteAttrLockedCavernDoorGreen	; A744 index 12	; Locked Green Door
	DW BackSpriteAttrLockedCavernDoorBlue	; A752 index 13	; Locked Blue Door
	DW BackSpriteAttrLockedCavernDoorYellow	; A760 index 14 ; Locked Yellow Door
	DW BackSpriteAttrClock					; B774 index 15
	DW BackSpriteAttrGhostPicture			; B528 index 16
	DW BackSpriteAttrTable					; A846 index 17
	DW 0AEEAh								; AEEA index 18 ; Full Chicken
	DW 0AEEAh								; AEEA index 19 ; Empty Chicken
	DW BackSpriteAttrTrophyHorns			; C960 index 20
	DW BackSpriteAttrTrophy					; C96A index 21
	DW BackSpriteAttrBookshelf				; C970 index 22
	DW BackSpriteAttrTrapdoorClosed			; C998 index 23
	DW BackSpriteAttrTrapdoorOpen			; C986 index 24
	DW BackSpriteAttrBarrel					; D057 index 25
	DW BackSpriteAttrBearRug				; C9AA index 26
	DW BackSpriteAttrAcgShield				; CA50 index 27
	DW BackSpriteAttrShield2				; CA56 index 28
	DW BackSpriteAttrSuitOfArmour			; CA5C index 29
	DW 0AEEAh								; AEEA index 30
	DW BackSpriteAttrClosedRoomDoor			; CA74 index 31
	DW BackSpriteAttrOpenRoomDoor			; A7D0 index 32
	DW BackSpriteAttrClosedCavernDoor		; CA66 index 33
	DW BackSpriteAttrOpenCavernDoor			; A7DE index 34
	DW BackSpriteAttrAcgDoor				; D1AB index 35
	DW BackSpriteAttrPicture				; D295 index 36
	DW BackSpriteAttrSkeleton				; D3B8 index 37
	DW BackSpriteAttrBarrelPile				; D4EF index 38


BackSpriteLockedRoomDoor:      ; A69C
	DB 004h,018h               ; Width: 4 chars; Height: 24 pixels
	DB 0FFh,01Bh,030h,0FFh,01Fh,01Bh,030h,0F8h
	DB 002h,01Bh,030h,040h,03Eh,01Bh,030h,07Ch
	DB 07Fh,033h,018h,03Eh,007h,033h,018h,020h
	DB 0F8h,033h,018h,01Fh,0F8h,033h,000h,01Fh
	DB 008h,063h,007h,008h,0F0h,063h,017h,00Fh
	DB 0F0h,063h,019h,00Fh,01Eh,063h,00Eh,008h
	DB 0FEh,0C3h,000h,01Fh,0F8h,0C3h,006h,01Fh
	DB 0CCh,0C3h,006h,033h,03Eh,0C3h,006h,07Ch
	DB 07Dh,080h,001h,0BEh,03Bh,0F0h,00Fh,0DCh
	DB 017h,0BFh,0FDh,0E8h,007h,07Bh,0DEh,0E0h
	DB 003h,07Bh,0DEh,0C0h,000h,077h,0EEh,000h
	DB 000h,007h,0E0h,000h,000h,000h,000h,000h


BackSpriteAttrLockedRoomDoorRed:       ; A6FE
	DB 004h,003h                       ; Width: 4 chars; Height: 3 chars
	DB 043h,042h,042h,043h,043h,042h,046h,043h	; (Bright Magenta and Red)
	DB 043h,043h,043h,043h


BackSpriteAttrLockedRoomDoorGreen:     ; A70C
	DB 004h,003h                       ; Width: 4 chars; Height: 3 chars
	DB 043h,044h,044h,043h,043h,044h,046h,043h	; (Bright Magenta and Green)
	DB 043h,043h,043h,043h


BackSpriteAttrLockedRoomDoorBlue:      ; A71A
	DB 004h,003h                       ; Width: 4 chars; Height: 3 chars
	DB 043h,045h,045h,043h,043h,045h,046h,043h	; (Bright Magenta and Cyan)
	DB 043h,043h,043h,043h


BackSpriteAttrLockedRoomDoorYellow:    ; A728
	DB 004h,003h                       ; Width: 4 chars; Height: 3 chars
	DB 043h,046h,046h,043h,043h,046h,043h,043h	; (Bright Magenta and Yellow)
	DB 043h,043h,043h,043h


BackSpriteAttrLockedCavernDoorRed:     ; A736
	DB 004h,003h                       ; Width: 4 chars; Height: 3 chars
	DB 0FFh,042h,042h,0FFh,0FFh,042h,046h,0FFh	; (Transparent, Bright Red and Yellow)
	DB 0FFh,0FFh,0FFh,0FFh


BackSpriteAttrLockedCavernDoorGreen:   ; A744
	DB 004h,003h                       ; Width: 4 chars; Height: 3 chars
	DB 0FFh,044h,044h,0FFh,0FFh,044h,046h,0FFh	; (Transparent and Bright Green and Yellow)
	DB 0FFh,0FFh,0FFh,0FFh


BackSpriteAttrLockedCavernDoorBlue:    ; A752
	DB 004h,003h                       ; Width: 4 chars; Height: 3 char
	DB 0FFh,045h,045h,0FFh,0FFh,045h,046h,0FFh	; (Transparent and Bright Cyan and Yellow)
	DB 0FFh,0FFh,0FFh,0FFh


BackSpriteAttrLockedCavernDoorYellow:   ; A760
	DB 004h,003h                        ; Width: 4 chars; Height: 3 chars
	DB 0FFh,046h,046h,0FFh,0FFh,046h,043h,0FFh	; (Transparent and Bright Yellow and Magenta)
	DB 0FFh,0FFh,0FFh,0FFh


BackSpriteOpenRoomDoor:        ; A76E ; Open Room Door
	DB 004h,018h               ; Width: 4 chars; Height: 24 pixels
	DB 0FFh,000h,000h,0FFh,01Fh,000h,000h,0F8h
	DB 002h,000h,000h,040h,03Eh,000h,000h,07Ch
	DB 07Ch,000h,000h,03Eh,004h,000h,000h,020h
	DB 0F8h,000h,000h,01Fh,0F8h,000h,000h,01Fh
	DB 008h,000h,000h,008h,0F0h,000h,000h,00Fh
	DB 0F0h,000h,000h,00Fh,010h,000h,000h,008h
	DB 0F0h,000h,000h,01Fh,0F8h,000h,000h,01Fh
	DB 0CCh,000h,000h,033h,03Eh,000h,000h,07Ch
	DB 07Dh,080h,001h,0BEh,03Bh,0F0h,00Fh,0DCh
	DB 017h,0BFh,0FDh,0E8h,007h,07Bh,0DEh,0E0h
	DB 003h,07Bh,0DEh,0C0h,000h,077h,0EEh,000h
	DB 000h,007h,0E0h,000h,000h,000h,000h,000h


BackSpriteAttrOpenRoomDoor:    ; A7D0
	DB 004h,003h               ; Width: 4 chars; Height: 3 chars
	DB 043h,000h,000h,043h,043h,000h,000h,043h
	DB 043h,043h,043h,043h


BackSpriteAttrOpenCavernDoor:  ; A7DE
	DB 004h,003h               ; Width: 4 chars; Height: 3 chars
	DB 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	DB 0FFh,0FFh,0FFh,0FFh


BackSpriteTable:               ; A7EC
	DB 004h,016h               ; Width: 4 chars; Height: 22 pixels
	DB 060h,000h,000h,006h,070h,000h,000h,00Eh
	DB 030h,000h,000h,00Ch,030h,000h,000h,00Ch
	DB 070h,000h,000h,00Eh,070h,000h,000h,00Eh
	DB 078h,000h,000h,01Eh,03Fh,0FFh,0FFh,0FCh
	DB 07Fh,0FFh,0FFh,0FEh,080h,000h,000h,001h
	DB 07Fh,0FFh,0FFh,0FEh,0FFh,0FFh,0FFh,0FFh
	DB 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	DB 07Fh,0FFh,0FFh,0FEh,07Fh,0FFh,0FFh,0FEh
	DB 07Fh,0FFh,0FFh,0FEh,03Fh,0FFh,0FFh,0FCh
	DB 03Fh,0FFh,0FFh,0FCh,01Fh,0FFh,0FFh,0F8h
	DB 01Fh,0FFh,0FFh,0F8h,00Fh,0FFh,0FFh,0F0h


BackSpriteAttrTable:           ; A846
	DB 004h,003h               ; Width: 4 chars; Height: 3 chars
	DB 045h,045h,045h,045h,042h,042h,042h,042h
	DB 042h,042h,042h,042h


Screens:    ; A854
	DB 042h,000h,043h,002h,044h,003h,045h,002h
	DB 046h,004h,047h,002h,046h,003h,045h,002h
	DB 044h,004h,043h,000h,042h,003h,043h,003h
	DB 044h,003h,045h,000h,046h,004h,047h,004h
	DB 046h,004h,045h,004h,044h,004h,043h,000h
	DB 042h,003h,043h,003h,044h,003h,045h,000h
	DB 046h,004h,047h,003h,046h,005h,045h,000h
	DB 044h,008h,043h,001h,042h,004h,043h,002h
	DB 044h,003h,045h,002h,046h,004h,047h,002h
	DB 046h,003h,045h,002h,044h,005h,043h,000h
	DB 042h,004h,043h,000h,044h,003h,045h,000h
	DB 046h,004h,047h,000h,046h,003h,045h,005h
	DB 044h,001h,043h,00Ah,042h,00Ah,043h,001h
	DB 044h,00Ah,045h,001h,046h,009h,047h,009h
	DB 046h,001h,045h,001h,044h,001h,043h,001h
	DB 042h,001h,043h,001h,044h,001h,045h,009h
	DB 046h,001h,047h,001h,046h,00Ah,045h,001h
	DB 044h,009h,043h,001h,042h,001h,043h,009h
	DB 045h,001h,045h,00Ah,046h,009h,047h,001h
	DB 046h,001h,045h,00Ah,044h,001h,043h,009h
	DB 042h,001h,043h,00Ah,044h,009h,045h,001h
	DB 046h,001h,047h,001h,046h,000h,045h,000h
	DB 044h,000h,043h,000h,042h,000h,047h,000h
	DB 043h,000h,044h,000h,045h,000h,046h,000h
	DB 047h,000h,046h,000h,045h,000h,044h,000h
	DB 043h,000h,042h,000h,043h,000h,044h,000h
	DB 045h,000h,046h,000h,047h,000h,046h,000h
	DB 045h,000h,044h,000h,043h,000h,042h,004h
	DB 043h,000h,044h,005h,045h,005h,046h,003h
	DB 047h,001h,046h,000h,045h,000h,044h,003h
	DB 043h,000h,042h,004h,043h,000h,044h,003h
	DB 045h,000h,046h,004h,047h,000h,046h,000h
	DB 045h,000h,044h,000h,043h,000h,042h,000h
	DB 043h,000h,044h,000h,045h,000h,046h,000h
	DB 047h,000h,046h,000h,045h,000h,044h,004h
	DB 043h,004h,042h,004h,047h,00Bh,043h,001h
	DB 044h,001h,045h,001h,046h,001h,047h,001h
	DB 046h,001h,000h,000h,000h,00Ch

ScreenTypesTable:              ; A982
	; Each room is represented by 6 bytes. Each room holds the following:
	; +0 (byte): Half Width of Room (pixels)
	; +1 (byte): Half Height of Room (pixels)
	; +2/+3 (word): Address of PointData - Pairs of points (X, Y) in pixels
	; +4/+5 (word): Address of DrawData - a sequence of pairs of indexes into PointData that defines line endpoints.  0xFF finishes sequence to start another line and a second FF finishes drawing

	DB 038h,038h 	; 00 = Large Square Room (14x14)
	DW ScreenType00PointData, ScreenType00DrawData

	DB 028h,028h 	; 01 = Large Square Cavern (10x10)
	DW ScreenType01PointData, ScreenType01DrawData

	DB 038h,038h 	; 02 = Large Octogon Room (14x14)
	DW ScreenType02PointData, ScreenType02DrawData

	DB 038h,018h 	; 03 = Horizontal Room (14x6)
	DW ScreenType03PointData, ScreenType00DrawData

	DB 018h,038h 	; 04 = Vertical Room (6x14)
	DW ScreenType04PointData, ScreenType00DrawData

	DB 010h,030h 	; 05 = Stairs Up=South (4x12)
	DW ScreenType05PointData, ScreenType05DrawData

	DB 010h,030h 	; 06 = Stairs Up=North (4x12)
	DW ScreenType06PointData, ScreenType05DrawData

	DB 030h,010h 	; 07 = Stairs Up=East (12x4)
	DW ScreenType07PointData, ScreenType05DrawData

	DB 030h,010h 	; 08 = Stairs Up=West (12x4)
	DW ScreenType08PointData, ScreenType05DrawData

	DB 030h,018h 	; 09 = Horizontal Cavern (12x6)
	DW ScreenType09PointData, ScreenType09DrawData

	DB 018h,030h 	; 10 = Vertical Cavern (6x12)
	DW ScreenType10PointData, ScreenType09DrawData

	DB 038h,038h 	; 11 = Exit Room (14x14)
	DW ScreenType11PointData, ScreenType11DrawData

	DB 038h,038h 	; 12 = Teleporting (14x14)
	DW ScreenType12PointData, ScreenType12DrawData


ScreenType11PointData:   ; A9D0 Exit Room (4 points)
	DB 004h,0BFh,004h,000h,01Fh,0BFh,01Fh,000h

ScreenType11DrawData:    ; A9D8 Exit Room
	DB 000h,001h,0FFh
	DB 002h,003h,0FFh,0FFh

ScreenType00PointData:             ; A9DF (8 points)
	DB 004h,0BBh,004h,004h,0BBh,004h,0BBh,0BBh
	DB 01Fh,0A0h,01Fh,01Fh,0A0h,01Fh,0A0h,0A0h

ScreenType00DrawData:            ; A9EF Square, Horizontal or Vertical Room
	DB 000h,001h,003h,004h,0FFh
	DB 002h,001h,003h,006h,0FFh
	DB 005h,001h,004h,006h,0FFh
	DB 007h,003h,004h,006h,0FFh,0FFh

ScreenType01PointData:             ; AA04 (152 points)
	DB 093h,005h,024h,07Dh
	DB 025h,07Dh,002h,08Eh,011h,0ADh,026h,0B7h
	DB 046h,0ADh,04Fh,090h,03Bh,096h,02Eh,090h
	DB 079h,0ADh,070h,090h,08Ch,0B9h,097h,0B4h
	DB 07Ah,096h,081h,093h,08Ah,099h,082h,094h
	DB 097h,085h,0A2h,0BFh,0B9h,09Ch,0B8h,09Bh
	DB 0ADh,079h,0AEh,079h,091h,071h,090h,070h
	DB 090h,04Fh,0ADh,046h,028h,072h,02Fh,070h
	DB 012h,079h,011h,078h,00Ah,074h,012h,046h
	DB 02Fh,04Fh,026h,03Ch,02Fh,03Ch,005h,02Ch
	DB 017h,02Ch,02Fh,02Bh,017h,013h,037h,024h
	DB 038h,025h,024h,002h,023h,001h,046h,012h
	DB 04Fh,02Fh,079h,012h,070h,02Fh,083h,026h
	DB 083h,02Fh,094h,02Fh,09Ch,037h,09Bh,038h
	DB 0BEh,023h,0BFh,024h,0ACh,017h,093h,017h

ScreenType01DrawData:	; AA78
	DB 000h,02Fh,031h,039h,0FFh,001h,0FFh,002h
	DB 0FFh,003h,001h,004h,020h,0FFh,004h,0FFh
	DB 005h,006h,008h,004h,0FFh,006h,0FFh,007h
	DB 006h,008h,00Bh,0FFh,008h,0FFh,009h,008h
	DB 004h,002h,0FFh,00Ah,00Ch,00Bh,006h,0FFh
	DB 00Bh,0FFh,00Ch,0FFh,00Dh,013h,00Ch,011h
	DB 0FFh,00Eh,00Fh,00Ch,00Bh,0FFh,00Fh,0FFh
	DB 010h,0FFh,011h,010h,0FFh,012h,015h,018h
	DB 010h,0FFh,013h,010h,0FFh,014h,017h,013h
	DB 0FFh,015h,0FFh,016h,019h,0FFh,017h,0FFh
	DB 018h,0FFh,019h,0FFh,01Ah,019h,035h,0FFh
	DB 01Bh,01Ah,036h,016h,0FFh,01Ch,002h,01Dh
	DB 01Eh,0FFh,01Dh,0FFh,01Eh,0FFh,01Fh,0FFh
	DB 020h,01Fh,0FFh,021h,01Eh,022h,025h,0FFh
	DB 022h,01Dh,0FFh,023h,022h,024h,025h,0FFh
	DB 024h,0FFh,025h,0FFh,026h,024h,025h,028h
	DB 0FFh,027h,024h,029h,028h,0FFh,028h,0FFh
	DB 029h,0FFh,02Ah,0FFh,02Bh,029h,0FFh,02Ch   ; AB00
	DB 028h,02Dh,0FFh,02Dh,0FFh,02Eh,02Ah,02Dh
	DB 0FFh,02Fh,02Dh,030h,0FFh,030h,031h,02Eh
	DB 0FFh,031h,0FFh,032h,031h,033h,039h,0FFh
	DB 033h,0FFh,034h,033h,036h,0FFh,035h,0FFh
	DB 036h,0FFh,037h,0FFh,038h,033h,037h,039h
	DB 0FFh,039h,0FFh,0FFh

ScreenType02PointData:   ; AB34
	DB 002h,0A3h,002h,01Ch
	DB 01Ch,002h,0A3h,002h,0BDh,01Ch,0BDh,0A3h
	DB 0A3h,0BDh,01Ch,0BDh,030h,0A0h,01Fh,08Fh
	DB 01Fh,030h,030h,01Fh,08Fh,01Fh,0A0h,030h
	DB 0A0h,08Fh,08Fh,0A0h

ScreenType02DrawData:   ; AB54
	DB 000h,009h,007h,001h
	DB 0FFh,002h,001h,003h,00Bh,0FFh,004h,003h
	DB 005h,00Dh,0FFh,006h,005h,00Fh,007h,0FFh
	DB 008h,007h,009h,00Fh,0FFh,00Ah,001h,009h
	DB 00Bh,0FFh,00Ch,003h,00Bh,00Dh,0FFh,00Eh
	DB 005h,00Dh,00Fh,0FFh,0FFh

ScreenType03PointData:   ; AB7D (8 points)
	DB 003h,09Ch,003h,023h,0BCh,023h,0BCh,09Ch
	DB 01Fh,080h,01Fh,03Fh,0A0h,03Fh,0A0h,080h

ScreenType04PointData   ; AB8D (8 points)
	DB 023h,003h,09Ch,003h,09Ch,0BCh,023h,0BCh
	DB 03Fh,01Fh,080h,01Fh,080h,0A0h,03Fh,0A0h

ScreenType06PointData   ; AB9D
	DB 08Ah,0BAh,008h,004h,035h,0BBh,08Ah,0BBh
	DB 0B7h,004h,038h,028h,038h,03Dh,03Dh,03Dh
	DB 03Dh,051h,041h,051h,041h,063h,045h,063h
	DB 045h,073h,048h,073h,048h,081h,04Bh,081h
	DB 04Bh,08Dh,04Eh,08Dh,04Eh,097h,050h,097h
	DB 050h,09Fh,06Fh,09Fh,06Fh,097h,071h,097h
	DB 071h,08Dh,074h,08Dh,074h,081h,077h,081h
	DB 077h,073h,07Ah,073h,07Ah,063h,07Eh,063h
	DB 07Eh,051h,082h,051h,082h,03Dh,087h,03Dh
	DB 087h,028h,035h,0BAh

ScreenType05DrawData:; ABE9   Stairs Draw Data
	DB 001h,0FFh
	DB 002h,003h,001h,0FFh
	DB 003h,0FFh
	DB 004h,001h,003h,0FFh
	DB 005h,001h,0FFh
	DB 006h,023h,005h,0FFh
	DB 007h,0FFh
	DB 008h,021h,007h,0FFh
	DB 009h,0FFh   ; AC02
	DB 00Ah,01Fh,009h,0FFh
	DB 00Bh,0FFh
	DB 00Ch,01Dh,00Bh,0FFh
	DB 00Dh,0FFh
	DB 00Eh,01Bh,00Dh,0FFh
	DB 00Fh,0FFh
	DB 010h,019h,00Fh,0FFh
	DB 011h,0FFh
	DB 012h,017h,011h,002h,0FFh   ; AC1C
	DB 017h,003h,0FFh
	DB 018h,017h,0FFh
	DB 019h,0FFh
	DB 01Ah,019h,0FFh
	DB 01Bh,0FFh
	DB 01Ch,01Bh,0FFh
	DB 01Dh,0FFh
	DB 01Eh,01Dh,0FFh
	DB 01Fh,0FFh
	DB 020h,01Fh,0FFh
	DB 021h,0FFh
	DB 022h,021h,0FFh
	DB 023h,0FFh
	DB 024h,004h,005h,023h,0FFh
	DB 025h,0FFh,0FFh

ScreenType05PointData   ; AC4A (38 points)
	DB 08Ah,005h,008h,0BBh,038h,004h,08Ah,004h
	DB 0B7h,0BBh,038h,097h,038h,082h,03Dh,082h
	DB 03Dh,06Eh,041h,06Eh,041h,05Ch,045h,05Ch
	DB 045h,04Ch,048h,04Ch,048h,03Eh,04Bh,03Eh
	DB 04Bh,032h,04Eh,032h,04Eh,028h,050h,028h
	DB 050h,020h,06Fh,020h,06Fh,028h,071h,028h
	DB 071h,032h,074h,032h,074h,03Eh,077h,03Eh
	DB 077h,04Ch,07Ah,04Ch,07Ah,05Ch,07Eh,05Ch
	DB 07Eh,06Eh,082h,06Eh,082h,082h,087h,082h
	DB 087h,097h,035h,005h

ScreenType07PointData:   ; AC96 (38 points)
	DB 005h,08Ah,0BBh,008h,004h,038h,004h,08Ah
	DB 0BBh,0B7h,097h,038h,082h,038h,082h,03Dh
	DB 064h,03Dh,06Eh,041h,05Ch,041h,05Ch,045h
	DB 04Ch,045h,04Ch,048h,03Eh,048h,03Eh,04Bh
	DB 032h,04Bh,032h,04Eh,028h,04Eh,028h,050h
	DB 020h,050h,020h,06Fh,028h,06Fh,028h,071h
	DB 032h,071h,032h,074h,03Eh,074h,03Eh,077h
	DB 04Ch,077h,04Ch,07Ah,05Ch,07Ah,05Ch,07Eh
	DB 06Eh,07Eh,06Eh,082h,082h,082h,082h,087h
	DB 097h,087h,005h,035h

ScreenType08PointData:   ; ACE2
	DB 0BAh,08Ah,004h,008h
	DB 0BBh,035h,0BBh,08Ah,004h,0B7h,028h,038h
	DB 03Dh,038h,03Dh,03Dh,051h,03Dh,051h,041h
	DB 063h,041h,063h,045h,073h,045h,073h,048h
	DB 081h,048h,081h,04Bh,08Dh,04Bh,08Dh,04Eh ; AD02
	DB 097h,04Eh,097h,050h,09Fh,050h,09Fh,06Fh
	DB 097h,06Fh,097h,071h,08Dh,071h,08Dh,074h
	DB 081h,074h,081h,077h,073h,077h,073h,07Ah
	DB 063h,07Ah,063h,07Eh,051h,07Eh,051h,082h
	DB 03Dh,082h,03Dh,087h,028h,087h,0BAh,035h

SprGfxKnightDn0:   ; AD2E
	DB 012h        ; 18 pixels high
	DB 03Ch,000h,03Ch,0F0h,01Fh,078h,01Bh,094h
	DB 005h,04Eh,06Bh,06Eh,0E9h,02Ch,0EFh,0E8h
	DB 044h,040h,026h,0C8h,020h,008h,030h,018h
	DB 03Fh,0F8h,013h,0F0h,013h,0F0h,009h,0E0h
	DB 005h,0C0h,002h,080h

SprGfxKnightDn1:   ; AD53
	DB 012h        ; 18 pixels high
	DB 01Eh,0F0h,00Eh,0E0h,005h,040h,003h,0F0h
	DB 065h,04Ch,0EBh,06Eh,0E9h,02Eh,06Fh,0ECh
	DB 004h,040h,026h,0C8h,020h,008h,030h,018h
	DB 03Fh,0F8h,013h,0F0h,013h,0F0h,009h,0E0h
	DB 005h,0C0h,002h,080h

SprGfxKnightDn2:   ; AD78
	DB 012h        ; 18 pixels high
	DB 000h,078h,01Eh,078h,03Dh,0F0h,053h,0B0h
	DB 0E5h,040h,0EBh,06Ch,069h,02Eh,02Fh,0EEh
	DB 004h,044h,026h,0C8h,020h,008h,030h,018h
	DB 03Fh,0F8h,013h,0F0h,013h,0F0h,009h,0E0h
	DB 005h,0C0h,002h,080h

SprGfxKnightUp0:   ; AD9D
	DB 012h        ; 18 pixels high
	DB 03Ch,000h,03Ch,0F0h,01Fh,078h,01Bh,094h
	DB 007h,0CEh,06Fh,0EEh,0EFh,0ECh,0EFh,0E8h
	DB 040h,000h,03Fh,0F8h,027h,0F8h,027h,0F8h
	DB 030h,038h,013h,0F0h,013h,0F0h,009h,0E0h
	DB 005h,0C0h,002h,080h

SprGfxKnightUp1:   ; ADC2
	DB 012h        ; 18 pixels high
	DB 01Eh,0F0h,00Eh,0E0h,005h,040h,003h,080h
	DB 067h,0CCh,0EFh,0EEh,0EFh,0EEh,06Fh,0ECh
	DB 000h,000h,03Fh,0F8h,027h,0F8h,027h,0F8h
	DB 030h,038h,013h,0F0h,013h,0F0h,009h,0E0h
	DB 005h,0C0h,002h,080h

SprGfxKnightUp2:   ; ADE7
	DB 012h        ; 18 pixels high
	DB 000h,078h,01Eh,078h,03Dh,0F0h,053h,0B0h
	DB 0E7h,0C0h,0EFh,0ECh,06Fh,0EEh,02Fh,0EEh
	DB 000h,004h,03Fh,0F8h,027h,0F8h,027h,0F8h
	DB 030h,038h,013h,0F0h,013h,0F0h,009h,0E0h
	DB 005h,0C0h,002h,080h

SprGfxKnightLt0:   ; AE0C
	DB 012h        ; 18 pixels high
	DB 00Ch,070h,01Ch,038h,03Bh,098h,037h,060h
	DB 006h,010h,037h,008h,027h,098h,01Fh,0F0h
	DB 067h,080h,06Bh,07Ch,01Ah,0FCh,001h,0FCh
	DB 01Fh,0FCh,008h,008h,009h,0F8h,004h,0F0h
	DB 002h,0E0h,001h,040h

SprGfxKnightLt1:   ; AE31
	DB 012h        ; 18 pixels high
	DB 007h,0C0h,003h,0C0h,000h,000h,003h,0F0h
	DB 006h,038h,004h,018h,00Fh,098h,01Fh,0F0h
	DB 067h,080h,06Bh,07Ch,01Ah,0FCh,001h,0FCh
	DB 01Fh,0FCh,008h,008h,009h,0F8h,004h,0F0h
	DB 002h,0E0h,001h,040h


SprGfxKnightLt2:   ; AE56
	DB 012h        ; 18 pixels high
	DB 00Ch,070h,01Ch,038h,03Bh,0D8h,037h,0E0h
	DB 004h,074h,008h,03Ah,007h,01Eh,01Fh,0F8h
	DB 067h,080h,06Bh,07Ch,01Ah,0FCh,001h,0FCh
	DB 01Fh,0FCh,008h,008h,009h,0F8h,004h,0F0h
	DB 002h,0E0h,001h,040h

SprGfxKnightRt0:   ; AE7B
	DB 012h        ; 18 pixels high
	DB 00Eh,030h,01Ch,038h,01Bh,0DCh,007h,0ECh
	DB 02Eh,020h,05Ch,010h,078h,0E0h,01Fh,0F8h
	DB 001h,0E6h,03Eh,0D6h,027h,058h,027h,080h
	DB 027h,0F8h,010h,030h,013h,0F0h,009h,0E0h
	DB 005h,0C0h,002h,080h

SprGfxKnightRt1:   ; AEA0
	DB 012h        ; 18 pixels high
	DB 003h,0E0h,003h,0C0h,000h,000h,00Fh,0C0h
	DB 01Ch,060h,018h,020h,019h,0F0h,00Fh,0F8h
	DB 001h,0E6h,03Eh,0D6h,027h,058h,027h,080h
	DB 027h,0F8h,010h,030h,013h,0F0h,009h,0E0h
	DB 005h,0C0h,002h,080h

SprGfxKnightRt2:   ; AEC5
	DB 012h        ; 18 pixels high
	DB 00Eh,030h,01Ch,038h,018h,0DCh,006h,0ECh
	DB 008h,060h,010h,0ECh,019h,0E4h,00Fh,0F8h
	DB 001h,0E6h,03Eh,0D6h,027h,058h,027h,080h
	DB 027h,0F8h,010h,030h,013h,0F0h,009h,0E0h
	DB 005h,0C0h,002h,080h

LAEEA:          ; This is referenced in both BackSprTable and BackSprAttrTable and contents are referenced in SprGfx but I believe it might be populated dynamically
	DB 000h,000h,010h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h

SprGfxObjMummyLeaf:   ; AF0D
	DB 010h           ; 16 pixels high
	DB 000h,003h,000h,03Fh,000h,0FAh,003h,0F2h
	DB 006h,00Ah,00Fh,0DAh,01Fh,0BCh,03Fh,03Ch
	DB 020h,0B8h,07Dh,0B8h,07Bh,0B0h,0F3h,0A0h
	DB 09Bh,0C0h,0DBh,080h,0DEh,000h,0F8h,000h


SprGfxObjColourKey:   ; AF2E
	DB 00Ah           ; 10 pixels high
	DB 00Ch,000h,01Eh,017h,012h,012h,07Bh,01Ah
	DB 0CFh,0FFh,0CFh,0FFh,07Bh,000h,012h,000h
	DB 01Eh,000h,00Ch,000h

SprGfxObjBottle:   ; AF43
	DB 014h        ; 20 pixels high
	DB 019h,0FCh,019h,0FCh,019h,0C0h,019h,0DCh
	DB 019h,0DCh,019h,0DCh,019h,0DCh,019h,0DCh
	DB 019h,0DCh,019h,0DCh,019h,0C0h,019h,0FCh
	DB 01Ch,0FCh,00Eh,0F8h,003h,060h,001h,040h
	DB 001h,040h,001h,040h,002h,0E0h,001h,0C0h

SprGfxFoodMilkBottle:   ; AF6C
	DB 014h             ; 20 pixels high
	DB 019h,0F0h,019h,0F0h,019h,0F0h,019h,0F0h
	DB 019h,0F0h,019h,0F0h,019h,0F0h,019h,0F0h
	DB 019h,0F0h,009h,0E0h,00Dh,0E0h,00Dh,0E0h
	DB 005h,0C0h,005h,0C0h,006h,0C0h,002h,080h
	DB 002h,080h,002h,080h,005h,0C0h,003h,080h

SprGfxObjWing:   ; AF95
	DB 010h      ; 16 pixels high
	DB 0A0h,000h,0B0h,000h,098h,000h,0AFh,080h
	DB 0D0h,000h,0DFh,0C0h,06Fh,0E0h,073h,0F0h
	DB 03Ch,074h,03Fh,088h,01Fh,0F8h,00Fh,0F8h
	DB 007h,0F8h,003h,0FCh,000h,0FEh,000h,01Fh

SprGfxObjNecklace:   ; AFB6
	DB 010h          ; 16 pixels high
	DB 0C0h,000h,0E0h,002h,0E0h,00Ch,000h,030h
	DB 0C0h,030h,0E0h,040h,0E0h,0C0h,040h,080h
	DB 000h,030h,0E0h,036h,070h,006h,070h,003h
	DB 02Ch,01Eh,01Eh,0ECh,00Eh,0E0h,004h,060h

SprGfxObjTelescope:   ; AFD7
	DB 010h           ; 16 pixels high
	DB 090h,008h,0B1h,00Eh,0F6h,01Eh,07Ch,037h
	DB 078h,067h,030h,0CFh,031h,09Eh,033h,03Ch
	DB 032h,078h,076h,0F0h,076h,0F0h,075h,0E0h
	DB 0E7h,0C0h,03Fh,000h,03Eh,000h,018h,000h

SprGfxFoodBowl:   ; AFF8
	DB 010h       ; 16 pixels high
	DB 005h,0E0h,000h,000h,033h,0FCh,067h,0FEh
	DB 000h,000h,0C7h,0FFh,0FFh,0FFh,000h,000h
	DB 06Fh,0FEh,067h,03Eh,07Bh,0DEh,03Fh,0ECh
	DB 00Bh,0E8h,00Ch,0F0h,00Fh,080h,007h,000h

SprGfxFoodApple:   ; B019
	DB 010h        ; 16 pixels high
	DB 003h,0E0h,00Fh,0F8h,01Fh,0FCh,03Fh,0FEh
	DB 07Fh,0FEh,07Fh,0FFh,07Fh,0FFh,067h,0FFh
	DB 063h,0FFh,033h,0FFh,03Bh,006h,01Fh,0F8h
	DB 00Eh,0DCh,001h,086h,007h,07Bh,006h,03Ch


PanelGfx:          ; B03A
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,003h,00Fh,01Fh,03Dh,07Eh,079h
	DB 000h,000h,0FFh,0FFh,0FFh,0B4h,04Ah,000h
	DB 000h,000h,080h,0FEh,0FFh,0D5h,0ADh,042h
	DB 000h,000h,000h,000h,0F0h,07Fh,056h,050h
	DB 000h,000h,000h,000h,003h,0FFh,0B5h,044h
	DB 000h,000h,001h,01Fh,0FFh,0DAh,025h,041h
	DB 000h,007h,0FFh,0FEh,0FCh,0FCh,0D8h,03Fh
	DB 000h,0F0h,008h,004h,002h,002h,002h,0F1h
	DB 0D0h,0CAh,0E0h,0C0h,0C0h,0C0h,060h,060h
	DB 03Bh,01Bh,01Bh,01Bh,01Bh,019h,00Ch,00Ch
	DB 089h,089h,085h,085h,0FDh,081h,081h,081h
	DB 00Ch,006h,003h,003h,003h,001h,001h,001h
	DB 041h,042h,0FCh,000h,000h,080h,080h,080h
	DB 060h,030h,01Ch,006h,03Eh,01Ch,00Ch,006h
	DB 00Ch,018h,018h,018h,00Ch,00Ch,00Ch,00Ch
	DB 006h,006h,006h,006h,006h,006h,006h,006h
	DB 006h,006h,006h,006h,006h,006h,00Ch,00Ch
	DB 00Ch,00Ch,00Ch,018h,018h,018h,018h,018h
	DB 018h,030h,030h,030h,030h,030h,030h,030h
	DB 030h,060h,060h,060h,060h,060h,060h,060h
	DB 060h,060h,060h,060h,030h,030h,030h,018h
	DB 00Ch,018h,018h,018h,030h,030h,018h,030h
	DB 030h,038h,00Ch,006h,00Ch,018h,018h,018h
	DB 00Ch,00Ch,00Ch,00Ch,00Ch,006h,006h,006h
	DB 006h,006h,006h,006h,003h,003h,003h,003h
	DB 003h,003h,003h,003h,003h,003h,003h,003h
	DB 003h,003h,003h,003h,003h,006h,006h,006h
	DB 006h,006h,006h,006h,00Ch,00Ch,00Ch,00Ch
	DB 00Ch,018h,018h,018h,018h,030h,030h,030h
	DB 030h,060h,060h,060h,07Fh,07Eh,00Ch,018h
	DB 000h,000h,00Ch,01Eh,01Dh,00Bh,007h,037h
	DB 07Fh,0FFh,080h,07Fh,0FFh,0C1h,080h,000h
	DB 000h,080h,098h,03Ch,0DCh,0E8h,0F0h,076h
	DB 001h,003h,003h,003h,006h,006h,00Ch,07Fh
	DB 080h,000h,000h,000h,000h,000h,000h,0FCh
	DB 070h,0F0h,018h,0FCh,0F8h,0C0h,0C0h,0C0h
	DB 06Eh,0ECh,0ECh,0ECh,0ECh,0ECh,06Eh,037h
	DB 03Eh,049h,049h,049h,049h,02Ah,01Ch,008h
	DB 03Bh,01Bh,01Bh,01Bh,01Bh,01Bh,03Bh,076h
	DB 000h,080h,080h,080h,080h,080h,000h,000h
	DB 000h,003h,007h,00Eh,007h,001h,000h,000h
	DB 0FDh,0C3h,0DFh,02Fh,097h,0EBh,077h,031h
	DB 0C2h,0C1h,081h,081h,001h,0FDh,005h,005h
	DB 0C0h,060h,060h,060h,030h,018h,00Fh,007h
	DB 007h,00Bh,01Dh,01Eh,00Ch,000h,000h,0FFh
	DB 080h,0C1h,0FFh,07Fh,080h,0FFh,07Fh,03Eh
	DB 0F0h,0E8h,0DCh,03Ch,09Bh,09Fh,07Ch,0E0h
	DB 000h,000h,000h,03Fh,0FFh,0C0h,000h,000h
	DB 000h,000h,000h,000h,0F0h,0FFh,00Fh,000h
	DB 030h,03Fh,030h,018h,018h,00Ch,0FEh,0FFh
	DB 089h,0F1h,001h,001h,002h,004h,008h,0F0h
	DB 0FFh,000h,000h,000h,000h,000h,000h,000h
	DB 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	DB 0FFh,0FFh,07Fh,07Bh,07Bh,039h,039h,038h
	DB 000h,000h,080h,080h,080h,080h,0C0h,0C0h
	DB 010h,010h,010h,000h,000h,000h,000h,000h
	DB 060h,020h,010h,000h,000h,000h,000h,000h
	DB 0C0h,0C0h,0C0h,060h,060h,060h,030h,030h
	DB 030h,018h,018h,018h,018h,030h,030h,030h
	DB 018h,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch
	DB 00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch
	DB 00Ch,00Ch,00Ch,00Ch,018h,018h,018h,018h
	DB 018h,030h,030h,030h,030h,060h,060h,060h
	DB 060h,060h,060h,0C0h,0C0h,0C0h,0C0h,0C0h
	DB 0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0C0h,0C0h
	DB 060h,060h,060h,060h,060h,030h,030h,030h
	DB 018h,018h,018h,00Ch,00Ch,00Ch,00Ch,006h
	DB 006h,006h,006h,006h,003h,003h,003h,003h
	DB 003h,003h,003h,003h,003h,003h,003h,003h
	DB 006h,006h,006h,006h,006h,00Ch,00Ch,00Ch
	DB 00Ch,018h,018h,018h,018h,030h,030h,030h
	DB 060h,060h,060h,0C0h,0C0h,0C0h,080h,080h
	DB 007h,00Fh,00Fh,007h,001h,00Fh,007h,000h
	DB 0C3h,0E7h,00Fh,0CEh,0EFh,0E7h,0C3h,000h
	DB 0C3h,0E7h,08Fh,00Eh,01Fh,0E7h,0C3h,000h
	DB 08Fh,0CFh,0EEh,0EFh,0EFh,0CEh,08Eh,000h
	DB 0CFh,0EFh,06Eh,0EFh,0CEh,0CFh,0EFh,000h
	DB 080h,080h,000h,0C0h,000h,0E0h,0E0h,000h
	DB 000h,000h,008h,01Eh,027h,023h,071h,05Fh
	DB 000h,000h,040h,040h,080h,080h,000h,0C3h
	DB 000h,000h,000h,000h,000h,000h,000h,016h
	DB 000h,000h,000h,005h,003h,003h,003h,033h
	DB 000h,000h,000h,0ACh,018h,018h,018h,018h
	DB 04Fh,022h,01Fh,005h,07Fh,047h,03Bh,000h
	DB 0EFh,06Ch,02Ch,0ACh,04Ch,0CEh,087h,000h
	DB 0BEh,018h,018h,018h,018h,09Ch,00Ch,000h
	DB 0FBh,0DBh,0DBh,0DBh,0DBh,0FBh,061h,000h
	DB 018h,018h,018h,018h,018h,0DEh,08Ch,000h
	DB 0FEh,0FEh,0FEh,038h,038h,038h,038h,000h
	DB 07Ch,07Ch,038h,038h,038h,07Ch,07Ch,000h
	DB 082h,0EEh,0FEh,0FEh,0D6h,0D6h,0D6h,000h
	DB 0F8h,0F8h,0E0h,0FCh,0E0h,0FEh,0FEh,000h
	DB 000h,018h,018h,000h,000h,018h,018h,000h


PanelTxt:           ; B32A
	DB 001h,002h,003h,004h,005h,006h,007h,008h
	DB 009h,04Fh,050h,051h,052h,053h,00Ah,00Bh
	DB 00Eh,054h,055h,056h,057h,058h,00Ch,00Dh
	DB 00Fh,000h,000h,000h,000h,000h,000h,03Ah
	DB 010h,000h,000h,000h,000h,000h,000h,03Bh
	DB 011h,000h,000h,000h,000h,000h,000h,03Ch
	DB 012h,000h,000h,000h,000h,000h,000h,03Dh
	DB 013h,000h,059h,05Ah,05Bh,05Ch,000h,03Eh
	DB 014h,000h,000h,000h,05Dh,000h,000h,03Fh
	DB 015h,049h,04Ah,04Bh,04Ch,04Dh,04Eh,040h
	DB 016h,000h,000h,000h,000h,000h,000h,041h
	DB 017h,000h,000h,000h,000h,000h,000h,042h
	DB 018h,000h,000h,000h,000h,000h,000h,043h
	DB 019h,000h,000h,000h,000h,000h,000h,044h
	DB 01Ah,000h,000h,000h,000h,000h,000h,045h
	DB 01Bh,000h,000h,000h,000h,000h,000h,046h
	DB 01Ch,000h,000h,000h,000h,000h,000h,047h
	DB 01Dh,000h,000h,000h,000h,000h,000h,048h
	DB 01Eh,01Fh,020h,021h,000h,000h,022h,023h
	DB 024h,025h,026h,027h,028h,029h,02Ah,02Bh
	DB 02Ch,02Dh,02Eh,02Fh,030h,031h,032h,033h
	DB 000h,034h,035h,000h,000h,000h,000h,000h
	DB 000h,000h,036h,037h,000h,000h,000h,000h
	DB 000h,000h,038h,039h,000h,000h,000h,000h


BackSpriteLargeRoomDoor:       ; B3EA
	DB 006h,020h               ; Width: 6 chars; Height: 32 pixels
	DB 0FFh,0FEh,000h,000h,03Fh,0FFh,000h,0FEh
	DB 000h,000h,07Fh,000h,001h,0FCh,000h,000h
	DB 03Fh,080h,000h,000h,000h,000h,000h,000h
	DB 001h,0F8h,000h,000h,01Fh,080h,003h,0F8h
	DB 000h,000h,01Fh,0C0h,003h,0F0h,000h,000h
	DB 00Fh,0C0h,000h,000h,000h,000h,000h,000h
	DB 007h,0E0h,000h,000h,007h,0E0h,00Fh,0E0h
	DB 000h,000h,007h,0F0h,00Fh,0C0h,000h,000h
	DB 003h,0F0h,000h,000h,000h,000h,000h,000h
	DB 01Fh,080h,000h,000h,001h,0F8h,01Fh,080h
	DB 000h,000h,001h,0F8h,01Fh,080h,000h,000h
	DB 001h,0F8h,010h,000h,000h,000h,000h,008h
	DB 007h,080h,000h,000h,001h,0E0h,01Fh,080h
	DB 000h,000h,001h,0F8h,01Fh,000h,000h,000h
	DB 000h,0F8h,00Eh,040h,000h,000h,002h,070h
	DB 008h,0E0h,000h,000h,007h,010h,003h,0F4h
	DB 000h,000h,02Fh,0C0h,007h,0EFh,000h,000h
	DB 0F7h,0E0h,003h,0CEh,077h,0EEh,073h,0C0h
	DB 001h,0DEh,0F6h,06Fh,07Bh,080h,000h,09Eh
	DB 0F6h,06Fh,079h,000h,000h,03Ch,0E6h,067h
	DB 03Ch,000h,000h,01Dh,0EEh,0EEh,0B8h,000h
	DB 000h,001h,0EEh,077h,080h,000h,000h,000h
	DB 008h,010h,000h,000h,000h,000h,00Fh,0F0h
	DB 000h,000h,000h,000h,000h,000h,000h,000h


BackSpriteAttrLargeRoomDoor:   ; B4AC
	DB 006h,004h               ; Width: 6 chars; Height: 6 chars
	DB 043h,043h,000h,000h,043h,043h,043h,043h
	DB 000h,000h,043h,043h,043h,043h,043h,043h
	DB 043h,043h,043h,043h,043h,043h,043h,043h


BackSpriteGhostPicture:        ; B4C6
	DB 004h,018h               ; Width: 4 chars; Height: 24 pixels
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 003h,080h,001h,0C0h,007h,0C6h,063h,0E0h
	DB 006h,07Fh,0FEh,060h,003h,0FFh,0FFh,0C0h
	DB 001h,080h,001h,080h,001h,080h,001h,080h
	DB 003h,08Ch,031h,0C0h,007h,08Fh,0F1h,0E0h
	DB 003h,00Ch,030h,0C0h,00Bh,00Fh,0F0h,0D0h
	DB 00Fh,00Ch,090h,0F0h,007h,00Dh,0B0h,0E0h
	DB 006h,007h,0E0h,060h,00Eh,003h,0C0h,070h
	DB 01Eh,000h,000h,078h,037h,0FFh,0FFh,0ECh
	DB 01Fh,0FFh,0FFh,0F4h,035h,0FFh,0FFh,0ACh
	DB 01Bh,01Ch,031h,0D8h,00Eh,006h,060h,070h
	DB 000h,000h,000h,000h,000h,000h,000h,000h


BackSpriteAttrGhostPicture:    ; B528
	DB 004h,003h               ; Width: 4 chars; Height: 3 chars
	DB 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh	; (Transparent)
	DB 0FFh,0FFh,0FFh,0FFh


SprGfxSerfDn0:   ; B536
	DB 012h		 ; 18 pixels high
	DB 01Fh,038h,017h,038h,00Eh,03Ch,001h,05Eh
	DB 003h,0DEh,027h,0EEh,077h,070h,077h,0F4h
	DB 077h,074h,045h,0D0h,000h,080h,00Ah,028h
	DB 01Bh,06Ch,008h,00Ch,01Ch,014h,017h,0FCh
	DB 00Dh,0E8h,007h,050h

SprGfxSerfDn1:   ; B55B
	DB 012h		 ; 18 pixels high
	DB 00Fh,0F8h,00Dh,068h,006h,030h,001h,040h
	DB 023h,0E2h,037h,0F6h,037h,076h,017h,0F4h
	DB 017h,074h,005h,0D0h,000h,080h,00Ah,028h
	DB 01Bh,06Ch,008h,00Ch,01Ch,014h,017h,0FCh
	DB 00Dh,0E8h,007h,050h

SprGfxSerfDn2:   ; B580
	DB 012h		 ; 18 pixels high
	DB 007h,07Ch,007h,074h,01Fh,058h,03Dh,060h
	DB 03Dh,0E0h,03Bh,0F2h,007h,077h,017h,0F7h
	DB 017h,077h,005h,0D2h,000h,080h,00Ah,028h
	DB 01Bh,06Ch,008h,00Ch,01Ch,014h,017h,0FCh
	DB 00Dh,0E8h,007h,0A0h

SprGfxSerfUp0:   ; B5A5
	DB 012h		 ; 18 pixels high
	DB 01Eh,040h,01Eh,070h,00Ah,0B0h,007h,0D8h
	DB 00Fh,0D8h,04Fh,0E8h,0EFh,0E0h,0ECh,06Ch
	DB 0E2h,04Ch,08Dh,0A8h,015h,070h,01Bh,0D0h
	DB 03Ah,098h,02Bh,068h,015h,0D0h,02Fh,0B8h
	DB 013h,050h,00Ah,0A0h

SprGfxSerfUp1:   ; B5CA
	DB 012h		 ; 18 pixels high
	DB 00Eh,0E0h,00Eh,0E0h,002h,080h,007h,0C0h
	DB 047h,0C4h,06Fh,0ECh,06Fh,0ECh,02Ch,068h
	DB 023h,088h,00Dh,0A0h,015h,070h,01Bh,0D0h
	DB 03Ah,098h,02Bh,068h,015h,0D0h,02Fh,0B8h
	DB 013h,050h,00Ah,0A0h

SprGfxSerfUp2:   ; B5EF
	DB 012h		 ; 18 pixels high
	DB 004h,0F0h,01Ch,0F0h,01Ah,0A0h,037h,0C0h
	DB 037h,0E0h,02Fh,0E4h,00Fh,0EEh,06Ch,03Eh
	DB 063h,08Eh,02Dh,0A2h,015h,070h,01Bh,0D0h
	DB 03Ah,098h,02Bh,068h,015h,0D0h,02Fh,0B8h
	DB 013h,050h,00Ah,0A0h

SprGfxSerfLt0:   ; B614
	DB 012h		 ; 18 pixels high
	DB 003h,070h,00Fh,078h,03Fh,01Ch,0FBh,0ECh
	DB 0CBh,010h,077h,088h,007h,0C8h,037h,088h
	DB 077h,030h,00Fh,0C0h,011h,050h,060h,0B8h
	DB 068h,068h,019h,0D0h,007h,0A8h,019h,058h
	DB 016h,0F0h,00Ah,0A0h

SprGfxSerfLt1:   ; B639
	DB 012h		 ; 18 pixels high
	DB 03Fh,0E0h,02Fh,0E0h,024h,0C0h,019h,0E0h
	DB 003h,0F0h,006h,038h,006h,018h,007h,018h
	DB 007h,030h,00Fh,0C0h,011h,050h,060h,0B8h
	DB 068h,068h,019h,0D0h,007h,0A8h,019h,058h
	DB 016h,0F0h,00Ah,0A0h

SprGfxSerfLt2:   ; B65E
	DB 012h		 ; 18 pixels high
	DB 003h,0F0h,03Ah,0F8h,05Ah,05Ch,04Dh,09Ch
	DB 030h,030h,007h,0F8h,008h,07Ah,018h,01Ah
	DB 007h,03Ch,00Fh,0C0h,011h,050h,060h,0B8h
	DB 068h,068h,019h,0D0h,007h,0A8h,019h,058h
	DB 016h,0F0h,00Ah,0A0h

SprGfxSerfRt0:   ; B683
	DB 012h		 ; 18 pixels high
	DB 00Fh,0C0h,01Fh,05Ch,03Ah,05Ah,039h,0B2h
	DB 00Ch,00Ch,01Fh,0E0h,05Eh,010h,058h,018h
	DB 03Ch,0E0h,003h,0F0h,005h,088h,01Dh,006h
	DB 016h,016h,00Bh,098h,015h,0E0h,01Ah,098h
	DB 00Fh,0E8h,005h,050h

SprGfxSerfRt1:   ; B6A8
	DB 012h		 ; 18 pixels high
	DB 007h,0FCh,007h,0F4h,003h,024h,007h,098h
	DB 00Fh,0C0h,01Ch,060h,018h,060h,018h,0E0h
	DB 00Ch,0E0h,003h,0F0h,005h,088h,01Dh,006h
	DB 016h,016h,00Bh,098h,015h,0E0h,01Ah,098h
	DB 00Fh,0E8h,005h,050h

SprGfxSerfRt2:   ; B6CD
	DB 012h		 ; 18 pixels high
	DB 00Eh,0C0h,01Eh,0F0h,031h,0FCh,037h,0DFh
	DB 008h,0D3h,011h,0EEh,013h,0E0h,011h,0ECh
	DB 00Ch,0EEh,003h,0F0h,005h,088h,01Dh,006h
	DB 016h,016h,00Bh,098h,015h,0E0h,01Ah,098h
	DB 00Fh,0E8h,005h,050h


BackSpriteClock:                  ; B6F2
	DB 004h,020h                  ; Width: 4 chars; Height: 32 pixels
	DB 000h,03Fh,0FCh,000h,000h,070h,00Eh,000h
	DB 000h,077h,0EEh,000h,000h,067h,0E6h,000h
	DB 000h,067h,0E6h,000h,000h,06Bh,0F6h,000h
	DB 000h,0E8h,0F7h,000h,000h,0CFh,0F3h,000h
	DB 000h,0DFh,0FBh,000h,000h,0DFh,0FBh,000h
	DB 000h,0C0h,003h,000h,000h,0FFh,0FFh,000h
	DB 000h,0FFh,0FFh,000h,001h,0F9h,09Fh,080h
	DB 001h,0E0h,007h,080h,001h,0C0h,003h,080h
	DB 001h,0F7h,08Fh,080h,001h,0C0h,043h,080h
	DB 001h,0E0h,027h,080h,006h,079h,09Eh,060h
	DB 006h,09Fh,0F9h,060h,006h,0E7h,0E7h,060h
	DB 007h,069h,096h,0E0h,006h,0EEh,077h,060h
	DB 006h,0F7h,06Fh,060h,007h,06Eh,0F6h,0E0h
	DB 006h,0EFh,077h,060h,006h,0F6h,0EFh,060h
	DB 001h,06Fh,076h,000h,000h,06Eh,0F6h,000h
	DB 000h,01Fh,068h,000h,000h,003h,0E0h,000h


BackSpriteAttrClock:           ; B774
	DB 004h,004h               ; Width: 4 chars; Height: 4 pixels
	DB 045h,045h,045h,045h,045h,045h,045h,045h	; (Bright Cyan)
	DB 045h,045h,045h,045h,045h,045h,045h,045h


SprGfxWizardDn0:   ; B786
	DB 014h        ; 20 pixels high
	DB 03Ch,000h,04Ch,0F0h,01Fh,068h,01Bh,084h
	DB 006h,06Eh,06Ch,06Eh,0EEh,0ECh,0EFh,0E8h
	DB 044h,040h,016h,0D0h,018h,030h,01Fh,0F0h
	DB 01Eh,070h,00Ch,0E0h,00Ch,0E0h,004h,0C0h
	DB 006h,040h,003h,080h,003h,080h,001h,000h

SprGfxWizardDn1:   ; B7AF
	DB 014h        ; 20 pixels high
	DB 01Eh,0F0h,026h,0C8h,005h,040h,003h,080h
	DB 066h,0CCh,0ECh,06Eh,0EEh,0EEh,06Fh,0ECh
	DB 004h,040h,016h,0D0h,018h,030h,01Fh,0F0h
	DB 01Eh,070h,00Ch,0E0h,00Ch,0E0h,004h,0C0h
	DB 006h,040h,003h,080h,003h,080h,001h,000h

SprGfxWizardDn2:   ; B7D8
	DB 014h        ; 20 pixels high
	DB 000h,078h,01Eh,064h,02Dh,0F0h,043h,0B0h
	DB 0E6h,0C0h,0ECh,06Ch,06Eh,0EEh,02Fh,0EEh
	DB 004h,044h,016h,0D0h,018h,030h,01Fh,0F0h
	DB 01Eh,070h,00Ch,0E0h,00Ch,0E0h,004h,0C0h
	DB 006h,040h,003h,080h,003h,080h,001h,000h

SprGfxWizardUp0:   ; B801
	DB 014h        ; 20 pixels high
	DB 01Eh,000h,026h,078h,00Fh,0D4h,00Dh,0C2h
	DB 003h,0E7h,03Eh,0F7h,0FFh,0F6h,077h,0F4h
	DB 020h,000h,00Fh,0F8h,00Dh,0F8h,008h,0F8h
	DB 00Dh,0F8h,007h,0F0h,007h,070h,002h,020h
	DB 003h,060h,001h,0C0h,001h,0C0h,000h,080h

SprGfxWizardUp1:   ; B82A
	DB 014h        ; 20 pixels high
	DB 00Fh,078h,013h,064h,002h,0A0h,001h,0C0h
	DB 033h,0E6h,077h,0F7h,077h,0F7h,037h,0F6h
	DB 000h,000h,00Fh,0F8h,00Dh,0F8h,008h,0F8h
	DB 00Dh,0F8h,007h,0F0h,007h,070h,002h,020h
	DB 003h,060h,001h,0C0h,001h,0C0h,000h,080h

SprGfxWizardUp2:   ; B853
	DB 014h        ; 20 pixels high
	DB 000h,03Ch,00Fh,032h,016h,0F8h,021h,0D8h
	DB 073h,0E0h,077h,0F6h,037h,0F7h,017h,0F7h
	DB 000h,002h,00Fh,0F8h,00Dh,0F8h,008h,0F8h
	DB 00Dh,0F8h,007h,0F0h,007h,070h,002h,020h
	DB 003h,060h,001h,0C0h,001h,0C0h,000h,080h

SprGfxWizardLt0:   ; B87C
	DB 014h        ; 20 pixels high
	DB 00Ch,0F0h,01Ch,038h,033h,098h,047h,060h
	DB 006h,010h,037h,008h,007h,098h,031h,0F0h
	DB 035h,080h,00Dh,078h,000h,0D8h,01Fh,088h
	DB 00Fh,0D8h,005h,0F0h,005h,0F0h,002h,0E0h
	DB 002h,0E0h,001h,0C0h,001h,0C0h,000h,080h

SprGfxWizardLt1:   ; B8A5
	DB 014h        ; 20 pixels high
	DB 007h,0C0h,009h,0C0h,000h,000h,003h,0F0h
	DB 006h,038h,004h,018h,007h,098h,031h,0F0h
	DB 035h,080h,00Dh,078h,000h,0D8h,01Fh,088h
	DB 00Fh,0D8h,005h,0F0h,005h,0F0h,002h,0E0h
	DB 002h,0E0h,001h,0C0h,001h,0C0h,000h,080h

SprGfxWizardLt2:   ; B8CE
	DB 014h        ; 20 pixels high
	DB 003h,0F0h,01Ch,038h,033h,0D8h,047h,0E0h
	DB 004h,074h,008h,03Ah,007h,01Eh,031h,0F8h
	DB 035h,080h,00Dh,078h,000h,0D8h,01Fh,088h
	DB 00Fh,0D8h,005h,0F0h,005h,0F0h,002h,0E0h
	DB 002h,0E0h,001h,0C0h,001h,0C0h,000h,080h

SprGfxWizardRt0:   ; B8F7
	DB 014h        ; 20 pixels high
	DB 00Fh,030h,01Ch,038h,01Bh,0CCh,007h,0E2h
	DB 02Eh,020h,05Ch,010h,078h,0E0h,01Fh,08Ch
	DB 001h,0ACh,01Eh,0B0h,01Bh,000h,011h,0F8h
	DB 01Bh,0F0h,00Fh,0A0h,00Fh,0A0h,007h,040h
	DB 007h,040h,003h,080h,003h,080h,001h,000h

SprGfxWizardRt1:   ; B920
	DB 014h        ; 20 pixels high
	DB 003h,0E0h,003h,090h,000h,000h,00Fh,0C0h
	DB 01Ch,060h,018h,020h,019h,0E0h,00Fh,08Ch
	DB 001h,0ACh,01Eh,0B0h,01Bh,000h,011h,0F8h
	DB 01Bh,0F0h,00Fh,0A0h,00Fh,0A0h,007h,040h
	DB 007h,040h,003h,080h,003h,080h,001h,000h

SprGfxWizardRt2:   ; B949
	DB 014h        ; 20 pixels high
	DB 00Fh,030h,01Ch,038h,019h,0CCh,006h,0E2h
	DB 008h,060h,010h,0ECh,019h,0E0h,00Fh,08Ch
	DB 001h,0ACh,01Eh,0B0h,01Bh,000h,011h,0F8h
	DB 01Bh,0F0h,00Fh,0A0h,00Fh,0A0h,007h,040h
	DB 007h,040h,003h,080h,003h,080h,001h,000h

SprGfxSerfSwordW:   ; B972
	DB 00Ch         ; 12 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,020h,000h,010h,000h,012h,07Fh,0DFh
	DB 0FFh,0DFh,000h,012h,000h,010h,000h,020h

SprGfxSerfSwordSW:   ; B98B
	DB 00Dh         ; 13 pixels high
	DB 000h,000h,000h,01Ch,001h,0DCh,000h,07Ch
	DB 000h,030h,000h,0D8h,001h,0C8h,003h,088h
	DB 007h,000h,00Eh,000h,01Ch,000h,018h,000h
	DB 010h,000h

SprGfxSerfSwordS:   ; B9A6
	DB 010h         ; 16 pixels high
	DB 001h,080h,003h,0C0h,001h,080h,001h,080h
	DB 007h,0E0h,008h,010h,001h,080h,001h,080h
	DB 001h,080h,001h,080h,001h,080h,001h,080h
	DB 001h,080h,001h,080h,001h,080h,000h,080h

SprGfxSerfSwordSE:   ; B9C7
	DB 00Dh         ; 13 pixels high
	DB 000h,000h,000h,000h,038h,000h,03Bh,080h
	DB 03Eh,000h,00Ch,000h,01Bh,000h,013h,080h
	DB 011h,0C0h,000h,0E0h,000h,070h,000h,038h
	DB 000h,01Ch

SprGfxSerfSwordE:   ; B9E2
	DB 00Ch         ; 12 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 004h,000h,008h,000h,048h,000h,0FDh,0FFh
	DB 0FDh,0FEh,048h,000h,008h,000h,004h,000h

SprGfxSerfSwordNE:   ; B9FB
	DB 00Ch          ; 12 pixels high
	DB 000h,000h,000h,008h,000h,018h,000h,038h
	DB 000h,070h,000h,0E0h,011h,0C0h,013h,080h
	DB 01Dh,000h,00Ch,000h,03Eh,000h,03Bh,080h

LBA14:   ; (unused)
	DB 038h,000h

SprGfxSerfSwordN:   ; BA16
	DB 010h         ; 16 pixels high
	DB 001h,000h,001h,080h,001h,080h,001h,080h
	DB 001h,080h,001h,080h,001h,080h,001h,080h
	DB 001h,080h,001h,080h,008h,010h,007h,0E0h
	DB 001h,080h,001h,080h,003h,0C0h,001h,080h

SprGfxSerfSwordNW:   ; BA37
	DB 010h         ; 16 pixels high
	DB 000h,000h,000h,000h,010h,000h,018h,000h
	DB 01Ch,000h,00Eh,000h,007h,000h,003h,088h
	DB 001h,0C8h,000h,0D8h,000h,030h,000h,07Ch
	DB 001h,0DCh,000h,01Ch,000h,000h,000h,000h

SprGfxKnightAxe0:   ; BA58
	DB 010h         ; 16 pixels high
	DB 000h,000h,000h,000h,03Ch,000h,07Eh,000h
	DB 0C3h,000h,03Ch,000h,018h,000h,03Dh,0FFh
	DB 03Dh,0FFh,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h

SprGfxKnightAxe1:   ; BA79
	DB 010h         ; 16 pixels high
	DB 000h,000h,000h,004h,000h,00Eh,000h,01Ch
	DB 000h,038h,03Ch,070h,060h,0E0h,0D9h,0C0h
	DB 0BAh,080h,0BFh,000h,08Eh,000h,01Ch,000h
	DB 008h,000h,000h,000h,000h,000h,000h,000h

SprGfxKnightAxe2:   ; BA9A
	DB 010h         ; 16 pixels high
	DB 001h,080h,001h,080h,001h,080h,001h,080h
	DB 001h,080h,001h,080h,001h,080h,001h,080h
	DB 009h,080h,018h,000h,035h,080h,037h,080h
	DB 037h,080h,035h,080h,018h,000h,008h,000h

SprGfxKnightAxe3:   ; BABB
	DB 010h         ; 16 pixels high
	DB 000h,000h,020h,000h,070h,000h,038h,000h
	DB 01Ch,000h,00Eh,000h,007h,000h,003h,080h
	DB 001h,040h,000h,0E0h,004h,070h,005h,0F8h
	DB 005h,0D0h,006h,0C0h,003h,000h,001h,0E0h

SprGfxKnightAxe4:   ; BADC
	DB 010h         ; 16 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,0FFh,0BCh
	DB 0FFh,0BCh,000h,018h,000h,03Ch,000h,0C3h
	DB 000h,07Eh,000h,03Ch,000h,000h,000h,000h

SprGfxKnightAxe5:   ; BAFD
	DB 010h         ; 16 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,010h
	DB 000h,038h,000h,071h,000h,0FDh,001h,05Dh
	DB 003h,09Bh,007h,006h,00Eh,03Ch,01Ch,000h
	DB 038h,000h,070h,000h,020h,000h,000h,000h

SprGfxKnightAxe6:   ; BB1E
	DB 010h         ; 16 pixels high
	DB 000h,010h,000h,018h,001h,0ACh,001h,0ECh
	DB 001h,0ECh,001h,0ACh,000h,018h,001h,090h
	DB 001h,080h,001h,080h,001h,080h,001h,080h
	DB 001h,080h,001h,080h,001h,080h,001h,080h

SprGfxKnightAxe7:   ; BB3F
	DB 010h         ; 16 pixels high
	DB 007h,080h,000h,0C0h,003h,060h,00Bh,0A0h
	DB 01Fh,0A0h,00Eh,020h,007h,000h,002h,080h
	DB 001h,0C0h,000h,0E0h,000h,070h,000h,038h
	DB 000h,01Ch,000h,00Eh,000h,004h,000h,000h

SprGfxWizardSpell0:   ; BB60
	DB 00Fh           ; 15 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,024h
	DB 000h,080h,009h,080h,002h,0D0h,00Dh,060h
	DB 006h,0F0h,043h,042h,005h,0A0h,012h,0A0h
	DB 000h,000h,000h,000h,001h,000h

SprGfxWizardSpell1:   ; BB7F
	DB 00Fh           ; 15 pixels high
	DB 000h,000h,000h,008h,000h,000h,020h,080h
	DB 001h,000h,003h,0A0h,002h,008h,015h,0F0h
	DB 005h,0A8h,006h,060h,001h,080h,008h,020h
	DB 004h,080h,000h,010h,000h,000h

LBB9E:                ; Unused - could have been a 4th Wizard Spell graphic but decided to drop?
	DB 00Fh           ; 15 pixels high
	DB 000h,000h,000h,080h,000h,000h,001h,000h
	DB 004h,010h,001h,082h,003h,060h,045h,068h
	DB 00Eh,0B0h,007h,042h,009h,090h,001h,000h
	DB 020h,000h,000h,008h,010h,080h

SprGfxWizardSpell2:   ; BBBD
	DB 00Fh           ; 15 pixels high
	DB 000h,000h,001h,000h,010h,004h,000h,000h
	DB 000h,040h,001h,090h,007h,040h,005h,0E2h
	DB 017h,068h,003h,0C0h,009h,0C0h,000h,002h
	DB 001h,000h,000h,000h,000h,000h

SprGfxIconCursorLeft:   ; BBDC
	DB 014h             ; 20 pixels high
	DB 000h,001h,000h,003h,000h,007h,000h,00Fh
	DB 000h,01Fh,000h,043h,000h,0C3h,001h,0C3h
	DB 003h,0F8h,007h,0F8h,007h,0F8h,003h,0F8h
	DB 001h,0C3h,000h,0C3h,000h,043h,000h,01Fh
	DB 000h,00Fh,000h,007h,000h,003h,000h,001h

SprGfxIconCursorRight:   ; BC05
	DB 014h              ; 20 pixels high
	DB 080h,000h,0C0h,000h,0E0h,000h,0F0h,000h
	DB 0F8h,000h,0C2h,000h,0C3h,000h,0C3h,080h
	DB 01Fh,0C0h,01Fh,0E0h,01Fh,0E0h,01Fh,0C0h
	DB 0C3h,080h,0C3h,000h,0C2h,000h,0F8h,000h
	DB 0F0h,000h,0E0h,000h,0C0h,000h,080h,000h

SprGfxIconKeyboardLeft:   ; BC2E
	DB 010h               ; 16 pixels high
	DB 00Fh,0FFh,00Fh,0FFh,009h,024h,009h,024h
	DB 00Fh,0FFh,009h,024h,009h,024h,00Fh,0FFh
	DB 00Ch,092h,00Ch,092h,007h,0FFh,008h,000h
	DB 00Fh,0FFh,008h,045h,00Dh,011h,007h,0FFh

SprGfxIconKeyboardRight:   ; BC4F
	DB 010h                ; 16 pixels high
	DB 0FFh,0F8h,0FFh,0F8h,092h,048h,092h,048h
	DB 0FFh,0F8h,092h,048h,092h,048h,0FFh,0F8h
	DB 049h,038h,049h,038h,0FFh,0F0h,000h,008h
	DB 0FFh,0F8h,0FFh,0F8h,0FFh,0F8h,0FFh,0F0h

SprGfxIconJoystickLeft:   ; BC70
	DB 017h               ; 23 pixels high
	DB 000h,0C7h,001h,08Fh,003h,01Fh,000h,000h
	DB 003h,01Fh,001h,08Fh,000h,0C7h,000h,000h
	DB 000h,033h,000h,00Bh,000h,00Bh,000h,00Bh
	DB 000h,001h,000h,001h,000h,000h,000h,003h
	DB 000h,007h,000h,00Fh,000h,009h,000h,009h
	DB 000h,00Ch,000h,006h,000h,003h

SprGfxIconJoystickRight:   ; BC9F
	DB 017h,0FFh               ; 23 pixels high
	DB 000h,0FFh,080h,0FFh,0C0h,000h,000h,0FFh
	DB 0C0h,0FFh,080h,0FFh,000h,000h,000h,0FCh
	DB 000h,0F0h,000h,0F0h,000h,0F0h,000h,080h
	DB 000h,080h,000h,000h,000h,0C0h,000h,0E0h
	DB 000h,0F0h,000h,0F0h,000h,0F0h,000h,070h
	DB 000h,060h,000h,0C0h,000h


BackSpriteOpenCavernDoor:      ; BCCE
	DB 004h,018h               ; Width: 4 chars; Height: 24 pixels
	DB 0FFh,000h,000h,0FFh,003h,000h,000h,0B0h
	DB 003h,000h,000h,0B0h,007h,000h,000h,098h
	DB 00Dh,000h,000h,098h,018h,080h,001h,00Eh
	DB 038h,080h,001h,00Ch,078h,080h,001h,018h
	DB 058h,080h,001h,030h,0CCh,080h,001h,038h
	DB 08Ch,040h,002h,02Ch,00Ch,040h,002h,026h
	DB 00Ch,040h,002h,03Bh,01Ch,040h,002h,0E1h
	DB 034h,040h,002h,083h,062h,020h,004h,086h
	DB 0F2h,020h,004h,086h,07Fh,02Ch,005h,04Ch
	DB 00Fh,062h,025h,04Ch,003h,0C1h,07Dh,058h
	DB 000h,0F0h,0DFh,078h,000h,03Dh,087h,0F0h
	DB 000h,00Fh,000h,0C0h,000h,002h,000h,000h



SprGfxGhostPumpkin1:   ; BD30
	DB 013h         ; 19 pixels high
	DB 007h,0E0h,01Fh,0F8h,03Fh,0FCh,07Dh,0BEh
	DB 07Bh,09Eh,0F5h,00Fh,0EFh,067h,0F6h,067h
	DB 0FFh,0FFh,0FFh,07Fh,0EAh,047h,0F7h,0CFh
	DB 07Bh,0CEh,07Fh,0FEh,03Fh,0FCh,00Dh,0B0h
	DB 001h,0C0h,000h,0E0h,000h,060h

SprGfxGhostPumpkin2:   ; BD57
	DB 013h         ; 19 pixels high
	DB 007h,0E0h,01Fh,0F8h,03Fh,0FCh,07Dh,0FEh
	DB 079h,0BEh,0F0h,05Fh,0E6h,0EFh,0E6h,077h
	DB 0FFh,0FFh,0FEh,0FFh,0E2h,06Fh,0F3h,0DFh
	DB 073h,0FFh,07Fh,0FEh,03Fh,0FCh,00Dh,0B0h
	DB 001h,0C0h,000h,0E0h,000h,060h

ScreenType09DrawData:   ; BD7E
	DB 000h,017h,001h,004h,0FFh,001h,0FFh,002h
	DB 003h,019h,001h,0FFh,003h,0FFh,004h,0FFh
	DB 005h,006h,01Bh,003h,0FFh,006h,0FFh,007h
	DB 008h,006h,01Dh,0FFh,008h,0FFh,009h,004h
	DB 033h,00Ah,0FFh,00Ah,0FFh,00Bh,00Dh,01Fh
	DB 008h,0FFh,00Ch,0FFh,00Dh,0FFh,00Eh,00Fh
	DB 00Dh,00Ch,0FFh,00Fh,0FFh,010h,031h,00Ah
	DB 035h,0FFh,011h,012h,023h,00Fh,0FFh,012h
	DB 0FFh,013h,036h,035h,0FFh,014h,025h,015h
	DB 012h,0FFh,015h,0FFh,016h,017h,004h,033h
	DB 0FFh,017h,0FFh,018h,019h,017h,001h,0FFh
	DB 019h,0FFh,01Ah,01Bh,019h,003h,0FFh,01Bh
	DB 0FFh,01Ch,01Dh,01Bh,006h,0FFh,01Dh,0FFh
	DB 01Eh,01Fh,01Dh,008h,0FFh,01Fh,0FFh,020h
	DB 00Dh,01Fh,0FFh,021h,0FFh,022h,023h,021h
	DB 00Fh,0FFh,023h,0FFh,024h,025h,023h,012h
	DB 0FFh,025h,0FFh,026h,025h,027h,015h,0FFh
	DB 027h,0FFh,028h,027h,029h,03Ch,0FFh,029h
	DB 0FFh,02Ah,02Bh,03Ah,029h,0FFh,02Bh,0FFh
	DB 02Ch,02Dh,02Bh,038h,0FFh,02Dh,0FFh,02Eh
	DB 02Fh,02Dh,036h,0FFh,02Fh,0FFh,030h,013h
	DB 031h,02Fh,0FFh,031h,0FFh,032h,033h,031h
	DB 00Ah,0FFh,033h,0FFh,034h,0FFh,035h,034h
	DB 0FFh,036h,0FFh,037h,02Dh,038h,036h,0FFh
	DB 038h,0FFh,039h,02Bh,038h,03Ah,0FFh,03Ah
	DB 0FFh,03Bh,03Ah,029h,03Ch,0FFh,03Ch,0FFh
	DB 03Dh,015h,03Ch,027h,0FFh,0FFh

ScreenType10PointData:   ; BE54
	DB 079h,00Ah,086h,004h,091h,004h,0A6h,019h
	DB 046h,00Ah,09Bh,038h,0A7h,04Bh,09Ah,058h
	DB 0AAh,068h,037h,001h,02Ah,007h,09Bh,07Eh
	DB 09Bh,087h,09Bh,08Fh,0A8h,08Fh,095h,0A1h
	DB 02Ah,01Eh,095h,0B8h,088h,0BEh,024h,030h
	DB 079h,0B5h,046h,0B5h,04Fh,027h,070h,027h
	DB 079h,023h,082h,023h,08Fh,030h,084h,047h
	DB 089h,052h,080h,05Bh,08Bh,066h,085h,074h
	DB 085h,07Dh,089h,080h,081h,088h,081h,099h
	DB 077h,09Dh,070h,098h,04Fh,098h,046h,09Ch
	DB 03Dh,09Ch,030h,08Fh,03Bh,078h,036h,06Dh
	DB 03Fh,064h,034h,059h,03Ah,04Ch,03Ah,042h
	DB 036h,03Fh,03Eh,037h,03Eh,026h,047h,022h
	DB 024h,038h,018h,030h,024h,041h,015h,057h
	DB 025h,067h,018h,074h,024h,087h,018h,0A6h
	DB 02Eh,0BBh,039h,0BBh

ScreenType09PointData:   ; BED0
	DB 00Ah,079h,004h,086h
	DB 004h,091h,019h,0A6h,00Ah,046h,038h,09Bh
	DB 04Bh,0A7h,058h,09Ah,068h,0AAh,001h,037h
	DB 007h,02Ah,07Eh,09Bh,087h,09Bh,08Fh,09Bh
	DB 08Fh,0A8h,0A1h,095h,01Eh,02Ah,0B8h,095h
	DB 0BEh,088h,030h,024h,0B5h,079h,0B5h,046h
	DB 027h,04Fh,027h,070h,023h,079h,023h,082h
	DB 030h,08Fh,047h,084h,052h,089h,05Bh,080h
	DB 066h,08Bh,074h,085h,07Dh,085h,080h,089h
	DB 088h,081h,099h,081h,09Dh,077h,098h,070h
	DB 098h,04Fh,09Ch,046h,09Ch,03Dh,08Fh,030h
	DB 078h,03Bh,06Dh,036h,064h,03Fh,059h,034h
	DB 04Ch,03Ah,042h,03Ah,03Fh,036h,037h,03Eh
	DB 026h,03Eh,022h,047h,038h,024h,030h,018h
	DB 041h,024h,057h,015h,067h,025h,074h,018h
	DB 087h,024h,0A6h,018h,0BBh,02Eh,0BBh,039h


	; Font is limited and non-ASCII.
	; As usual ASCI 32 (Space) appears 256 bytes ahead of (Font).
	; Try POKE 23606,76:POKE 23607,190
FontData:; BF4C
Font   EQU (FontData-0100h)   ; BE4C
	DB 000h,000h,000h,000h,000h,000h,000h,000h	; CHR$(32) = Space
	DB 018h,018h,018h,018h,018h,000h,018h,018h	; CHR$(33) = Exclaimation Mark (!)
	DB 028h,028h,000h,000h,000h,000h,000h,000h	; CHR$(34) = Double Quote 34h = (")
	DB 000h,018h,018h,000h,000h,018h,018h,000h	; CHR$(35) = Colon (:) (not ASCII BTW!)
	DB 000h,062h,064h,008h,010h,026h,046h,000h	; CHR$(36) = Percentage (%)
	DB 03Ch,042h,099h,0A1h,0A1h,099h,042h,03Ch	; CHR$(37) = (C) symbol
	DB 000h,000h,000h,000h,000h,000h,000h,000h	; CHR$(38) = Space
	DB 010h,010h,000h,000h,000h,000h,000h,000h	; CHR$(39) = Apostrophe (')
	DB 008h,018h,018h,018h,018h,018h,018h,008h	; CHR$(40) = Open Bracket (
	DB 010h,018h,018h,018h,018h,018h,018h,010h	; CHR$(41) = Close Bracket )
	DB 000h,014h,058h,03Eh,07Ch,01Ah,028h,000h	; CHR$(42) = Asterisk (*)
	DB 000h,018h,018h,07Eh,078h,018h,018h,000h	; CHR$(43) = Plus (+)
	DB 000h,000h,000h,000h,000h,000h,020h,020h	; CHR$(44) = Comma (,)
	DB 000h,000h,000h,07Eh,07Eh,000h,000h,000h	; CHR$(45) = Minus (-)
	DB 000h,000h,000h,000h,000h,000h,018h,018h	; CHR$(46) = Period (.)
	DB 00Ch,00Ch,018h,018h,030h,030h,060h,060h	; CHR$(47) = Forward Slash (/)
	DB 07Ch,0FEh,0C6h,0C6h,0C6h,0FEh,07Ch,000h	; CHR$(48) = 0
	DB 018h,038h,058h,018h,018h,018h,03Ch,000h	; CHR$(49) = 1
	DB 07Ch,0FEh,006h,07Ch,0C0h,0FEh,0FEh,000h	; CHR$(50) = 2
	DB 0FEh,0FCh,008h,01Ch,006h,0FEh,0FCh,000h	; CHR$(51) = 3
	DB 00Ch,01Ch,03Ch,06Ch,0FEh,00Ch,00Ch,000h	; CHR$(52) = 4
	DB 0FEh,0FEh,0C0h,0FCh,006h,0FEh,07Ch,000h	; CHR$(53) = 5
	DB 07Ch,0FEh,0C0h,0FCh,0C6h,0FEh,07Ch,000h	; CHR$(54) = 6
	DB 0FEh,0FCh,00Ch,018h,018h,030h,030h,000h	; CHR$(55) = 7
	DB 07Ch,0FEh,0C6h,07Ch,0C6h,0FEh,07Ch,000h	; CHR$(56) = 8
	DB 07Ch,0FEh,0C6h,07Eh,006h,0FEh,07Ch,000h	; CHR$(57) = 9
	DB 000h,000h,000h,000h,000h,000h,000h,000h	; CHR$(58) = Space
	DB 000h,000h,000h,000h,000h,000h,000h,000h	; CHR$(59) = Space
	DB 000h,000h,000h,000h,000h,000h,000h,000h	; CHR$(60) = Space
	DB 000h,000h,000h,000h,000h,000h,000h,000h	; CHR$(61) = Space
	DB 000h,000h,000h,000h,000h,000h,000h,000h	; CHR$(62) = Space
	DB 000h,000h,000h,000h,000h,000h,000h,000h	; CHR$(63) = Space
	DB 000h,000h,000h,000h,000h,000h,000h,000h	; CHR$(64) = Space
	DB 038h,038h,06Ch,07Ch,0EEh,0EEh,0C6h,000h	; CHR$(65) = A
	DB 0FCh,0FEh,0E6h,0FCh,0E6h,0FEh,0FCh,000h	; CHR$(66) = B
	DB 03Ch,07Eh,0F8h,0E0h,0F8h,07Eh,03Ch,000h	; CHR$(67) = C
	DB 0F8h,0FCh,0FEh,0C6h,0FEh,0FCh,0F8h,000h	; CHR$(68) = D
	DB 0F8h,0F8h,0E0h,0FCh,0E0h,0FEh,0FEh,000h	; CHR$(69) = E
	DB 0FEh,0FEh,0E0h,0FCh,0E0h,0E0h,0E0h,000h	; CHR$(70) = F
	DB 03Ch,07Eh,0F8h,0E0h,0FEh,07Eh,03Ah,000h	; CHR$(71) = G
	DB 0EEh,0EEh,0FEh,0FEh,0FEh,0EEh,0EEh,000h	; CHR$(72) = H
	DB 07Ch,07Ch,038h,038h,038h,07Ch,07Ch,000h	; CHR$(73) = I
	DB 00Eh,00Eh,00Eh,00Eh,0EEh,07Ch,038h,000h	; CHR$(74) = J
	DB 0EEh,0ECh,0F8h,0F8h,0F8h,0ECh,0EEh,000h	; CHR$(75) = K
	DB 0E0h,0E0h,0E0h,0E0h,0FEh,0FEh,0FEh,000h	; CHR$(76) = L
	DB 082h,0EEh,0FEh,0FEh,0D6h,0D6h,0D6h,000h	; CHR$(77) = M
	DB 08Eh,0CEh,0EEh,0FEh,0EEh,0E6h,0E2h,000h	; CHR$(78) = N
	DB 038h,07Ch,0FEh,0EEh,0FEh,07Ch,038h,000h	; CHR$(79) = O
	DB 0FCh,0FEh,0E6h,0FEh,0FCh,0E0h,0E0h,000h	; CHR$(80) = P
	DB 038h,07Ch,0FEh,0EEh,0FEh,07Ch,03Eh,000h	; CHR$(81) = Q
	DB 0FCh,0FEh,0E6h,0FEh,0FCh,0ECh,0EEh,000h	; CHR$(82) = R
	DB 07Ch,0FEh,0F0h,07Ch,01Eh,0FEh,07Ch,000h	; CHR$(83) = S
	DB 0FEh,0FEh,0FEh,038h,038h,038h,038h,000h	; CHR$(84) = T
	DB 0EEh,0EEh,0EEh,0EEh,0FEh,0FEh,07Ch,000h	; CHR$(85) = U
	DB 0EEh,0EEh,06Ch,07Ch,038h,038h,010h,000h	; CHR$(86) = V
	DB 0D6h,0D6h,0D6h,0FEh,0FEh,0EEh,082h,000h	; CHR$(87) = W
	DB 0EEh,0EEh,06Ch,038h,06Ch,0EEh,0EEh,000h	; CHR$(88) = X
	DB 0EEh,06Ch,07Ch,038h,038h,038h,038h,000h	; CHR$(89) = Y
	DB 0FEh,0FCh,0F8h,010h,03Eh,07Eh,0FEh,000h	; CHR$(90) = Z


SprGfxFoodCan:   ; C124
	DB 014h      ; 20 pixels high
	DB 007h,0E0h,018h,018h,02Fh,0F4h,07Eh,01Eh
	DB 03Eh,034h,03Eh,054h,03Eh,0ECh,03Dh,0DCh
	DB 03Dh,0BCh,039h,0DCh,023h,0BCh,027h,07Ch
	DB 026h,0BCh,02Fh,0FCh,038h,01Ch,020h,0C4h
	DB 05Dh,022h,020h,0C4h,018h,018h,007h,0E0h

SprGfxObjMoneyBag:   ; C14D
	DB 010h      ; 16 pixels high
	DB 01Fh,0F8h,07Fh,07Eh,0F8h,01Eh,0F0h,04Fh
	DB 0F8h,00Fh,0F9h,07Fh,0FCh,00Fh,07Fh,07Fh
	DB 07Fh,0FFh,03Eh,01Eh,01Dh,0EEh,087h,0B4h
	DB 07Fh,018h,0CEh,004h,011h,034h,00Eh,0C8h

SprGfxObjSwede:   ; C16E
	DB 010h       ; 16 pixels high
	DB 007h,0A0h,01Fh,0E8h,03Bh,074h,06Ah,09Ah
	DB 05Fh,0DAh,0D8h,0CDh,0B0h,075h,0FCh,075h
	DB 0F2h,035h,0C0h,01Dh,0C8h,01Dh,076h,03Ah
	DB 070h,03Ah,038h,074h,01Fh,0E8h,007h,0A0h

SprGfxObjGem:   ; C18F
	DB 00Dh     ; 13 pixels high
	DB 01Fh,0F8h,028h,014h,048h,012h,09Ah,0B1h
	DB 0F7h,0EFh,0D5h,058h,0A7h,0B5h,0F7h,0F1h
	DB 008h,00Fh,0F7h,0F1h,077h,052h,037h,0D4h
	DB 017h,0F8h

SprGfxFoodStrippedCandy:   ; C1AA
	DB 010h                ; 16 pixels high
	DB 010h,000h,038h,000h,044h,000h,082h,000h
	DB 07Fh,000h,03Fh,080h,010h,040h,008h,020h
	DB 007h,0F0h,003h,0F8h,001h,004h,000h,082h
	DB 000h,07Fh,000h,03Eh,000h,014h,000h,008h

SprGfxFoodLegOfLamb:   ; C1CB
	DB 014h            ; 20 pixels high
	DB 00Fh,0FCh,010h,002h,011h,0C1h,011h,0C3h
	DB 018h,00Eh,00Fh,0FCh,00Fh,0F8h,007h,0F8h
	DB 007h,0F0h,007h,0F0h,003h,0E0h,003h,0E0h
	DB 003h,0C0h,000h,000h,001h,080h,001h,080h
	DB 001h,080h,001h,0C0h,007h,0E0h,007h,060h

SprGfxFoodLollypop:   ; C1F4
	DB 012h           ; 18 pixels high
	DB 000h,018h,000h,038h,000h,030h,000h,070h
	DB 000h,060h,000h,0E0h,00Fh,040h,03Fh,0C0h
	DB 07Fh,0E0h,07Fh,0E0h,0FFh,0F0h,0CFh,0F0h
	DB 0CFh,0F0h,0C7h,0F0h,061h,0E0h,071h,0E0h
	DB 03Fh,0C0h,00Fh,000h

SprGfxFoodCone:   ; C219
	DB 012h       ; 18 pixels high (NOTE: The last 4 bytes of the bitmap [0C 00 00 00] actually run into the Spawn1 Sprite - either accidently or intentionally e.g. to save memory?)
	DB 000h,001h,000h,00Fh,000h,054h,003h,0FEh
	DB 015h,054h,03Fh,0FCh,07Dh,054h,007h,0F8h
	DB 0C9h,0D0h,0D0h,0F8h,0E8h,0D0h,0F2h,070h
	DB 079h,050h,074h,060h,03Dh,040h,00Fh,000h

SprGfxSpawn1:   ; C23A
	DB 00Ch     ; 12 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 002h,000h,001h,040h,004h,020h,002h,080h
	DB 00Ah,0A0h,000h,050h,001h,000h,004h,040h

SprGfxSpawn2:   ; C253
	DB 00Dh     ; 13 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,080h
	DB 002h,000h,009h,050h,004h,080h,002h,0D0h
	DB 00Bh,088h,001h,0A0h,015h,008h,000h,0A0h
	DB 002h,000h

SprGfxSpawn3:   ; C26E
	DB 00Fh     ; 15 pixels high
	DB 000h,000h,001h,020h,002h,008h,080h,0A0h
	DB 022h,014h,014h,060h,003h,050h,055h,082h
	DB 009h,074h,013h,040h,024h,050h,001h,094h
	DB 00Ah,040h,000h,010h,001h,000h

SprGfxSpawn4:   ; C28D
	DB 010h     ; 16 pixels high
	DB 000h,080h,012h,008h,000h,040h,02Ah,002h
	DB 000h,0A8h,085h,040h,012h,052h,045h,0A8h
	DB 011h,014h,005h,028h,052h,052h,005h,000h
	DB 008h,090h,022h,044h,009h,020h,000h,040h


BackSpriteLockedCavernDoor:    ; C2AE
	DB 004h,018h               ; Width: 4 chars; Height: 24 pixels
	DB 0FFh,01Bh,018h,0FFh,003h,01Bh,018h,0B0h
	DB 003h,01Bh,018h,0B0h,007h,01Bh,018h,098h
	DB 00Dh,033h,00Ch,098h,01Ah,033h,00Ch,098h
	DB 03Ah,033h,00Ch,0ECh,07Ah,033h,000h,058h
	DB 05Ah,063h,00Eh,070h,0CEh,063h,017h,078h
	DB 08Ch,063h,019h,02Ch,00Ch,063h,00Eh,026h
	DB 00Ch,0C3h,000h,023h,01Ch,0C3h,003h,021h
	DB 032h,0C3h,003h,043h,062h,043h,002h,046h
	DB 0F8h,000h,000h,086h,07Fh,0C0h,003h,00Ch
	DB 00Fh,038h,01Ch,00Ch,003h,0C7h,0FCh,018h
	DB 000h,0F0h,0DFh,038h,000h,03Dh,087h,0F0h
	DB 000h,00Fh,000h,0C0h,000h,002h,000h,000h

SprGfxGhostSpider1:   ; C310
	DB 00Eh           ; 14 pixels high
	DB 00Ch,030h,00Ch,030h,0C0h,003h,0C6h,063h
	DB 060h,006h,01Fh,0F8h,039h,09Ch,074h,02Eh
	DB 076h,06Eh,079h,09Eh,07Fh,0FEh,03Fh,0FCh
	DB 01Fh,0F8h,00Fh,0F0h

SprGfxGhostSpider2:   ; C32D
	DB 00Eh           ; 14 pixels high
	DB 000h,000h,060h,006h,066h,066h,006h,060h
	DB 033h,0CCh,01Fh,0F8h,039h,09Ch,074h,02Eh
	DB 076h,06Eh,079h,09Eh,07Fh,0FEh,03Fh,0FCh
	DB 01Fh,0F8h,00Fh,0F0h

SprGfxGhostMonster1:   ; C34A
	DB 010h            ; 16 pixels high
	DB 003h,0FFh,0FFh,0FCh,03Fh,0F0h,00Fh,0FCh
	DB 03Fh,0FFh,0FFh,0FCh,03Fh,0F8h,013h,09Eh
	DB 065h,02Fh,0EDh,068h,033h,09Eh,03Fh,0F1h
	DB 067h,0F8h,003h,0B8h,003h,01Ch,002h,000h

SprGfxGhostMonster2:   ; C36B
	DB 010h            ; 16 pixels high
	DB 0FFh,080h,07Fh,0FFh,00Fh,0FCh,03Fh,0F0h
	DB 0FFh,0FFh,07Fh,0FEh,01Fh,0FCh,033h,098h
	DB 065h,02Fh,07Dh,06Eh,073h,098h,01Fh,0F8h
	DB 03Fh,0F8h,07Fh,06Eh,063h,062h,001h,020h

SprGfxGhostRabbit1:   ; C38C
	DB 00Bh           ; 11 pixels high
	DB 00Eh,0E0h,01Fh,0F0h,039h,038h,034h,090h
	DB 036h,0D8h,039h,038h,01Fh,0F0h,00Fh,0E0h
	DB 01Ch,070h,038h,038h,0F0h,01Eh

SprGfxGhostRabbit2:   ; C3A3
	DB 009h           ; 9 pixels high
	DB 00Eh,0E0h,01Fh,0F0h,039h,038h,034h,098h
	DB 036h,0D8h,039h,038h,01Fh,0F0h,03Fh,0F8h
	DB 0F8h,03Eh

SprGfxGhostGhoul1:   ; C3B6
	DB 014h          ; 20 pixels high
	DB 001h,0C0h,003h,080h,003h,000h,003h,000h
	DB 083h,081h,087h,0C1h,08Fh,0E1h,0CFh,0F3h
	DB 0DFh,0F3h,0DFh,0FBh,0DFh,0FBh,0DFh,0FBh
	DB 0D9h,09Bh,0D9h,09Bh,019h,098h,019h,098h
	DB 019h,098h,01Fh,0F8h,00Fh,0F0h,007h,0E0h

SprGfxGhostGhoul2:   ; C3DF
	DB 014h          ; 20 pixels high
	DB 003h,080h,001h,0C0h,000h,0C0h,000h,0C0h
	DB 001h,0C0h,003h,0E0h,087h,0F1h,08Fh,0F1h
	DB 08Fh,0F9h,0DFh,0FBh,0DFh,0FBh,0DFh,0FBh
	DB 0D9h,09Bh,0D9h,09Bh,0D9h,09Bh,0D9h,09Bh
	DB 099h,099h,00Fh,0F0h,00Fh,0F0h,007h,0E0h

SprGfxGhostGhost1:   ; C408
	DB 010h          ; 16 pixels high
	DB 003h,0C0h,007h,0E0h,07Fh,0FEh,0FFh,0FFh
	DB 0FFh,0FFh,07Fh,0FEh,03Fh,0FEh,01Fh,0FCh
	DB 01Ch,0ECh,018h,044h,018h,044h,01Ch,044h
	DB 00Ch,0CCh,00Fh,0F8h,007h,0F0h,003h,0C0h

SprGfxGhostGhost2:   ; C429
	DB 010h          ; 16 pixels high
	DB 078h,00Ch,0FCh,01Eh,0FEh,03Fh,0FFh,0FFh
	DB 07Fh,0FFh,03Fh,0FEh,01Fh,0FCh,01Fh,0FCh
	DB 01Ch,0ECh,018h,044h,018h,044h,01Ch,044h
	DB 00Ch,0CCh,00Fh,0F8h,007h,0F0h,003h,0C0h


SprGfxGhostBat1:   ; C44A
	DB 012h        ; 18 pixels high
	DB 000h,000h,000h,000h,000h,000h,004h,040h
	DB 00Ch,060h,003h,080h,007h,0C0h,006h,0C0h
	DB 00Dh,060h,01Fh,0F0h,01Ch,070h,038h,038h
	DB 030h,018h,060h,00Ch,040h,004h,0C0h,006h
	DB 080h,002h,080h,002h

SprGfxGhostBat2:   ; C46F
	DB 00Eh
	DB 080h,002h,080h,002h,080h,002h,040h,004h
	DB 060h,00Ch,064h,04Ch,03Ch,078h,03Bh,0B8h
	DB 017h,0D0h,006h,0C0h,005h,040h,00Fh,0E0h
	DB 00Ch,060h,008h,020h


BackSpriteEmptyChicken:        ; C48C
	DB 006h,01Eh               ; Width: 6 chars; Height: 30 pixels
	DB 000h,000h,00Fh,0FFh,0F8h,000h,000h,000h
	DB 0FFh,0FEh,03Eh,000h,000h,007h,0FFh,0FDh
	DB 0DFh,080h,000h,01Fh,0E7h,001h,0E8h,0C0h
	DB 000h,07Eh,0E4h,0F0h,0E7h,060h,001h,0F6h
	DB 073h,0FCh,073h,080h,003h,033h,027h,0F8h
	DB 033h,0C0h,004h,018h,00Fh,0FDh,038h,0C0h
	DB 008h,000h,00Fh,0FDh,018h,0E0h,000h,000h
	DB 01Fh,0FDh,018h,0E0h,000h,000h,01Fh,0FDh
	DB 018h,0E0h,000h,000h,03Fh,0FDh,018h,0E0h
	DB 000h,000h,03Fh,0FBh,038h,0E0h,000h,000h
	DB 07Fh,0FBh,038h,0E8h,000h,000h,07Fh,0F6h
	DB 071h,0D8h,000h,01Eh,0DFh,0EEh,071h,0DCh
	DB 000h,00Dh,03Fh,0DCh,0F3h,0BCh,000h,002h
	DB 0FFh,03Ch,0E3h,078h,000h,005h,0E0h,079h
	DB 0E3h,070h,000h,00Bh,09Eh,0F1h,0D8h,0E0h
	DB 000h,017h,03Eh,0E3h,0BFh,0C0h,00Ch,02Eh
	DB 01Fh,01Bh,07Fh,080h,01Eh,0DCh,007h,0FCh
	DB 0FEh,000h,037h,0B8h,001h,0BBh,0F8h,000h
	DB 033h,0F0h,000h,03Fh,0E0h,000h,01Dh,0E0h
	DB 000h,000h,000h,000h,003h,0C0h,000h,000h
	DB 000h,000h,006h,0E0h,000h,000h,000h,000h
	DB 006h,060h,000h,000h,000h,000h,003h,0C0h
	DB 000h,000h,000h,000h


BackSpriteFullChicken:         ; C542
	DB 006h,01Eh               ; Width: 6 chars; Height: 30 pixels
	DB 000h,000h,0FFh,0FFh,0FEh,000h,000h,007h
	DB 0FFh,0FFh,0FFh,080h,000h,01Fh,0FFh,00Fh
	DB 0FFh,0C0h,000h,07Fh,0FEh,0F7h,0FFh,0E0h
	DB 001h,0FFh,0F9h,0BBh,0FFh,0F0h,003h,0FFh
	DB 0F7h,0FDh,0FFh,0F8h,007h,0FFh,0EFh,0F5h
	DB 0FFh,0FCh,00Fh,0FFh,0DFh,0DEh,0FFh,0ECh
	DB 01Fh,0DFh,05Dh,0BEh,0FFh,0FEh,036h,0FDh
	DB 0BFh,0F6h,0DEh,0FEh,03Fh,0FFh,0B7h,0FEh
	DB 0FFh,0FEh,01Bh,0BFh,07Eh,0BEh,0FFh,0BAh
	DB 00Eh,0FBh,07Fh,0FDh,0BBh,0FAh,007h,0BEh
	DB 0F7h,07Dh,0FFh,0FEh,001h,0F6h,0FFh,0DBh
	DB 0FFh,0FEh,000h,0DDh,0FEh,0F7h,0FFh,07Eh
	DB 000h,03Bh,077h,0EDh,07Fh,0DEh,000h,017h
	DB 0FEh,0DFh,0FFh,0ECh,000h,00Bh,0FFh,03Fh
	DB 0FBh,0F8h,000h,01Fh,0C0h,0FBh,0FFh,0B0h
	DB 000h,01Fh,0BFh,0FFh,0BFh,0E0h,00Ch,02Fh
	DB 037h,0BFh,0FBh,0C0h,01Eh,0DEh,01Dh,0FBh
	DB 0FFh,080h,037h,0B8h,007h,0BFh,0BEh,000h
	DB 033h,0F0h,001h,0FBh,0F8h,000h,01Dh,0E0h
	DB 000h,03Fh,0E0h,000h,003h,0C0h,000h,000h
	DB 000h,000h,006h,0E0h,000h,000h,000h,000h
	DB 006h,060h,000h,000h,000h,000h,003h,0C0h
	DB 000h,000h,000h,000h

SprGfxDestroy1:   ; C5F8
	DB 00Bh       ; 11 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,003h,040h,005h,0C0h,007h,060h
	DB 006h,0A0h,003h,0C0h,001h,000h

SprGfxDestroy2:   ; C60F
	DB 00Dh       ; 13 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,080h
	DB 001h,0A0h,00Bh,048h,002h,0F0h,01Fh,040h
	DB 006h,0F8h,007h,0B0h,009h,0C8h,002h,0A0h
	DB 002h,090h

SprGfxDestroy3:   ; C62A
	DB 00Fh       ; 15 pixels high
	DB 000h,000h,005h,000h,011h,010h,009h,010h
	DB 004h,024h,038h,008h,000h,010h,070h,000h
	DB 000h,00Eh,010h,000h,064h,02Ch,00Ah,092h
	DB 012h,0A8h,002h,080h,000h,080h

SprGfxDestroy4:   ; C649
	DB 010h       ; 16 pixels high
	DB 001h,000h,011h,010h,008h,020h,000h,002h
	DB 040h,004h,020h,000h,000h,000h,0C0h,000h
	DB 000h,003h,000h,000h,040h,002h,080h,001h
	DB 000h,000h,020h,004h,044h,082h,004h,080h


BackSpriteTrophyHorns:         ; C66A
	DB 004h,010h               ; Width: 4 chars; Height: 16 pixels
	DB 000h,003h,0C0h,000h,000h,004h,020h,000h
	DB 000h,008h,010h,000h,000h,013h,0C8h,000h
	DB 000h,027h,0E4h,000h,000h,02Dh,0B4h,000h
	DB 000h,049h,092h,000h,000h,07Fh,0FEh,000h
	DB 003h,0F9h,09Fh,0C0h,007h,0F5h,0AFh,0E0h
	DB 00Fh,0F6h,06Fh,0F0h,01Ch,0B9h,09Dh,038h
	DB 030h,09Fh,0F9h,00Ch,020h,08Fh,0F1h,004h
	DB 000h,0C0h,003h,000h,000h,03Fh,0FCh,000h

BackSpriteTrophy:              ; C6AC
	DB 002h,010h               ; Width: 2 chars; Height: 16 pixels
	DB 003h,0C0h,004h,020h,008h,010h,013h,0C8h
	DB 027h,0E4h,02Dh,0B4h,04Dh,0B2h,04Fh,0F2h
	DB 049h,092h,094h,029h,0B6h,06Dh,0B9h,09Dh
	DB 0BFh,0FDh,098h,019h,0C0h,003h,03Fh,0FCh


BackSpriteBookshelf:           ; C6CE
	DB 005h,020h               ; Width: 5 chars; Height: 32 pixels
	DB 01Fh,0FFh,0FFh,0FFh,0F8h,018h,000h,000h
	DB 000h,018h,014h,000h,000h,000h,028h,013h
	DB 0FFh,0FFh,0FFh,0C8h,012h,000h,000h,000h
	DB 048h,012h,000h,000h,000h,048h,012h,000h
	DB 000h,000h,048h,03Fh,0FFh,0FFh,0FFh,0FCh
	DB 030h,000h,000h,000h,00Ch,028h,000h,000h
	DB 000h,014h,024h,000h,000h,000h,024h,023h
	DB 0FFh,0FFh,0FFh,0C4h,022h,000h,000h,000h
	DB 044h,022h,000h,000h,000h,044h,022h,000h
	DB 000h,000h,044h,07Fh,0FFh,0FFh,0FFh,0FEh
	DB 060h,000h,000h,000h,006h,050h,0C6h,0F6h
	DB 0EFh,00Ah,048h,0C7h,0F6h,0EDh,012h,047h
	DB 0CEh,0F6h,0EBh,0E2h,044h,0CEh,0F6h,0EDh
	DB 022h,044h,0DCh,0F6h,0EBh,022h,044h,0DCh
	DB 0F6h,0EDh,022h,044h,0F8h,0F6h,0EBh,022h
	DB 0FFh,0FFh,0FFh,0FFh,0FFh,000h,000h,000h
	DB 000h,000h,0FFh,0FFh,0FFh,0FFh,0FFh,07Fh
	DB 0FFh,0FFh,0FFh,0FEh,03Fh,0FFh,0FFh,0FFh
	DB 0FCh,01Fh,0FFh,0FFh,0FFh,0F8h,00Fh,0FFh
	DB 0FFh,0FFh,0F0h,007h,0FFh,0FFh,0FFh,0E0h


BackSpriteTrapdoorOpen:        ; C770
	DB 004h,020h               ; Width: 4 chars; Height: 32 pixels
	DB 000h,03Ch,0F0h,000h,00Eh,066h,0F9h,0C0h
	DB 01Fh,05Eh,0BBh,0F8h,03Fh,05Ch,0D1h,0FCh
	DB 077h,058h,055h,0FEh,07Bh,06Bh,056h,00Eh
	DB 0DDh,0BBh,077h,0F6h,0DFh,0D8h,001h,08Eh
	DB 04Fh,000h,000h,076h,063h,000h,000h,0F2h
	DB 03Eh,000h,000h,0F0h,000h,000h,000h,0CEh
	DB 07Eh,000h,000h,01Fh,03Fh,000h,000h,07Fh
	DB 0DEh,000h,000h,05Fh,0DBh,000h,000h,063h
	DB 0BEh,000h,000h,03Eh,0E0h,000h,000h,000h
	DB 00Eh,000h,000h,03Eh,07Eh,000h,000h,07Fh
	DB 04Eh,000h,000h,043h,073h,000h,000h,07Dh
	DB 03Fh,000h,000h,00Fh,000h,000h,000h,0E3h
	DB 03Fh,036h,07Dh,078h,07Fh,0EEh,0FEh,0BCh
	DB 06Fh,0EEh,0BEh,0BCh,02Fh,0DAh,0BEh,0CCh
	DB 037h,0DEh,0BFh,078h,019h,0DAh,0C7h,060h
	DB 00Fh,0CEh,07Eh,000h,001h,0C6h,000h,000h


BackSpriteTrapdoorClosed:      ; C7F2
	DB 004h,020h               ; Width: 4 chars; Height: 32 pixels
	DB 000h,03Ch,0F0h,000h,00Eh,066h,0F9h,0C0h
	DB 01Fh,05Eh,0BBh,0F8h,03Fh,05Ch,0D1h,0FCh
	DB 077h,058h,055h,0FEh,07Bh,06Bh,056h,00Eh
	DB 0DDh,0BBh,077h,0F6h,0DFh,0D8h,001h,08Eh
	DB 04Fh,0FFh,0FFh,076h,063h,092h,049h,0F2h
	DB 03Eh,092h,049h,0F0h,000h,0FFh,0F9h,0CEh
	DB 07Eh,0EAh,0ADh,01Fh,03Fh,0FFh,0F9h,07Fh
	DB 0DEh,092h,049h,05Fh,0DBh,092h,049h,063h
	DB 0BEh,092h,049h,03Eh,0E0h,092h,049h,000h
	DB 00Eh,0FFh,0F9h,03Eh,07Eh,0EAh,0ADh,07Fh
	DB 04Eh,0FFh,0F9h,043h,073h,092h,049h,07Dh
	DB 03Fh,092h,049h,00Fh,000h,0FFh,0FFh,0E3h
	DB 03Fh,036h,07Dh,078h,07Fh,0EEh,0FEh,0BCh
	DB 06Fh,0EEh,0BEh,0BCh,02Fh,0DAh,0BEh,0CCh
	DB 037h,0DEh,0BFh,078h,019h,0DAh,0C7h,060h
	DB 00Fh,0CEh,07Eh,000h,001h,0C6h,000h,000h

BackSpriteBearRug:             ; C874
	DB 006h,027h               ; Width: 6 chars; Height: 39 pixels
	DB 000h,003h,080h,000h,002h,000h,000h,007h
	DB 0C0h,000h,00Dh,000h,000h,007h,0C0h,000h
	DB 01Eh,000h,000h,007h,0C0h,000h,01Fh,000h
	DB 000h,003h,0C0h,000h,01Fh,000h,000h,003h
	DB 080h,000h,03Eh,000h,000h,003h,080h,000h
	DB 03Ch,000h,000h,003h,080h,000h,07Ch,000h
	DB 000h,003h,080h,000h,078h,000h,000h,003h
	DB 080h,000h,070h,000h,000h,002h,080h,000h
	DB 0F0h,000h,000h,007h,080h,000h,0B0h,000h
	DB 000h,007h,0C7h,0E1h,0F0h,000h,000h,006h
	DB 07Eh,03Bh,020h,000h,000h,007h,0FDh,0DFh
	DB 0E0h,000h,003h,0CFh,01Eh,03Ch,0E0h,000h
	DB 00Fh,0FEh,0EFh,0FBh,070h,000h,079h,0BFh
	DB 01Ch,0FCh,0DEh,000h,0BBh,0D9h,0FBh,067h
	DB 0F3h,0F0h,0FFh,0F6h,0FCh,0DBh,01Eh,07Fh
	DB 0BBh,0D9h,08Fh,0E6h,0EFh,0CEh,0E9h,0BFh
	DB 076h,03Fh,01Ch,003h,00Fh,0FBh,08Dh,0D9h
	DB 0F0h,000h,003h,0CCh,0FEh,036h,0E0h,000h
	DB 000h,007h,0C7h,0F9h,0E0h,000h,000h,007h
	DB 0FFh,0FFh,020h,000h,000h,004h,0C7h,0E1h
	DB 0F0h,000h,000h,007h,080h,000h,0B0h,000h
	DB 000h,002h,080h,000h,0F0h,000h,000h,003h
	DB 080h,000h,050h,000h,000h,002h,080h,000h
	DB 078h,000h,000h,003h,080h,000h,07Ch,000h
	DB 000h,003h,080h,000h,03Ch,000h,000h,003h
	DB 080h,000h,03Eh,000h,000h,003h,0C0h,000h
	DB 01Fh,000h,000h,007h,0C0h,000h,01Fh,000h
	DB 000h,007h,0C0h,000h,01Eh,000h,000h,007h
	DB 0C0h,000h,00Dh,000h,000h,003h,080h,000h
	DB 002h,000h


BackSpriteAttrTrophyHorns:     ; C960
	DB 004h,002h               ; Width: 4 chars; Height: 2 chars
	DB 047h,047h,047h,047h,047h,047h,047h,047h	 ; (Bright White)


BackSpriteAttrTrophy:          ; C96A
	DB 002h,002h               ; Width: 2 chars; Height: 2 chars
	DB 045h,045h,045h,045h     ; (Bright Cyan)


BackSpriteAttrBookshelf:       ; C970
	DB 005h,004h               ; Width: 5 chars; Height: 4 chars
	DB 046h,046h,046h,046h,046h,046h,046h,046h	; (Bright Yellow)
	DB 046h,046h,046h,045h,043h,044h,046h,046h
	DB 046h,046h,046h,046h


BackSpriteAttrTrapdoorOpen:    ; C986
	DB 004h,004h               ; Width: 4 chars; Height: 4 chars
	DB 043h,043h,043h,043h,043h,000h,000h,043h	; (Bright Magenta and Black=?Yield colour?)
	DB 043h,000h,000h,043h,043h,043h,043h,043h


BackSpriteAttrTrapdoorClosed:  ; C998
	DB 004h,004h               ; Width: 4 chars; Height: 4 chars
	DB 043h,043h,043h,043h,043h,046h,046h,043h	; (Bright Magenta and Yellow)
	DB 043h,046h,046h,043h,043h,043h,043h,043h


BackSpriteAttrBearRug:         ; C9AA
	DB 006h,005h               ; Width: 6 chars; Height: 5 chars
	DB 007h,007h,007h,007h,007h,007h,007h,007h	; (Bright White)
	DB 007h,007h,007h,007h,007h,007h,007h,007h
	DB 007h,007h,007h,007h,007h,007h,007h,007h
	DB 007h,007h,007h,007h,007h,007h


BackSpriteAcgShield:           ; C9CA
	DB 002h,010h               ; Width: 2 chars; Height: 16 pixels
	DB 001h,080h,007h,0E0h,00Fh,0F0h,01Fh,0D8h
	DB 030h,00Ch,03Fh,0DCh,07Fh,0FEh,07Fh,0FEh
	DB 054h,042h,0D5h,0DBh,0C5h,0D3h,0D5h,0DFh
	DB 0C4h,043h,0FFh,0FFh,0E7h,0E7h,081h,081h


BackSpriteShield2:             ; C9EC
	DB 002h,010h               ; Width: 2 chars; Height: 16 pixels
	DB 001h,080h,007h,0E0h,008h,010h,019h,098h
	DB 039h,09Ch,030h,00Ch,075h,0AEh,07Fh,0FEh
	DB 07Fh,0FEh,0DCh,02Fh,0D7h,0EBh,0C4h,023h
	DB 0D7h,0EBh,0FDh,07Fh,0E7h,0E7h,081h,081h


BackSpriteSuitOfArmour:        ; CA0E
	DB 002h,020h               ; Width: 2 chars; Height: 32 pixels
	DB 030h,00Ch,01Ch,038h,01Eh,07Ah,00Eh,072h
	DB 006h,062h,00Ah,052h,01Ch,03Ah,00Ah,052h
	DB 007h,0E2h,047h,0E7h,047h,0E2h,007h,0E0h
	DB 060h,006h,067h,0E6h,0A6h,065h,0CCh,033h
	DB 0ADh,0B5h,06Dh,0B6h,07Fh,0FEh,07Fh,0FEh
	DB 078h,01Eh,037h,0ECh,003h,0C0h,007h,0E0h
	DB 00Eh,070h,019h,098h,007h,0E0h,00Fh,0F0h
	DB 007h,0E0h,003h,0C0h,000h,000h,000h,000h


BackSpriteAttrAcgShield:       ; CA50
	DB 002h,002h               ; Width: 2 chars; Height: 2 chars
	DB 043h,047h,047h,043h     ; (Bright Magenta and White)


BackSpriteAttrShield2:         ; CA56
	DB 002h,002h               ; Width: 2 chars; Height: 2 chars
	DB 0FFh,0FFh,0FFh,0FFh     ; (Transparent)


BackSpriteAttrSuitOfArmour:    ; CA5C
	DB 002h,004h               ; Width: 2 chars; Height: 4 chars
	DB 045h,045h,045h,045h,045h,045h,045h,045h		; (Bright Cyan)


BackSpriteAttrClosedCavernDoor:    ; CA66
	DB 004h,003h                   ; Width: 4 chars; Height: 3 chars
	DB 0FFh,047h,047h,0FFh,0FFh,047h,047h,0FFh		; (Bright White and Transparent)
	DB 0FFh,0FFh,0FFh,0FFh


BackSpriteAttrClosedRoomDoor:      ; CA74
	DB 004h,003h                   ; Width: 4 chars; Height: 3 chars
	DB 043h,047h,047h,043h,043h,047h,047h,043h		; (Bright Magenta, White and Transparent)
	DB 043h,043h,043h,043h


BackSpriteClosedRoomDoor:      ; CA82
	DB 004h,018h               ; Width: 4 chars; Height: 24 pixels
	DB 0FFh,03Bh,0DCh,0FFh,01Fh,03Bh,0DCh,0F8h
	DB 00Ch,03Bh,0DCh,040h,03Eh,03Bh,0DCh,07Ch
	DB 07Ch,000h,000h,03Eh,004h,07Bh,0CEh,020h
	DB 0F8h,07Bh,0D7h,01Fh,0F8h,07Bh,0D1h,01Fh
	DB 008h,07Bh,0CEh,008h,0F0h,07Bh,0C0h,00Fh
	DB 0F0h,000h,000h,00Fh,010h,0FBh,0DFh,008h
	DB 0F0h,0FBh,0DFh,01Fh,0F8h,07Bh,0DEh,01Fh
	DB 0CCh,03Bh,0DCh,033h,03Fh,00Bh,0D0h,07Ch
	DB 07Dh,080h,001h,0BEh,03Bh,0F0h,00Fh,0DCh
	DB 017h,0BFh,0FDh,0E8h,007h,07Bh,0DEh,0E0h
	DB 003h,07Bh,0DEh,0C0h,000h,077h,0EEh,000h
	DB 000h,007h,0E0h,000h,000h,000h,000h,000h


BackSpriteClosedCavernDoor:    ; CAE4
	DB 004h,018h               ; Width: 4 chars; Height: 24 pixels
	DB 0FFh,03Bh,0DCh,0FFh,003h,03Bh,0DCh,0B0h
	DB 003h,03Bh,0DCh,0B0h,007h,03Bh,0DCh,098h
	DB 00Dh,000h,000h,098h,01Ah,07Bh,0CEh,04Eh
	DB 03Ah,07Bh,0D7h,0ECh,07Ah,07Bh,0D1h,058h
	DB 05Ah,07Bh,0CEh,070h,0CEh,07Bh,0C0h,078h
	DB 08Ch,000h,000h,02Ch,00Ch,0FBh,0DFh,026h
	DB 00Ch,0FBh,0DFh,023h,01Ch,07Bh,0DEh,021h
	DB 032h,03Bh,0DCh,043h,062h,00Bh,0D0h,046h
	DB 0F1h,000h,000h,086h,07Fh,0C0h,003h,00Ch
	DB 00Fh,038h,01Ch,00Ch,003h,0C7h,0FCh,018h
	DB 000h,0F0h,0DFh,038h,000h,03Dh,087h,0F0h
	DB 000h,00Fh,000h,0C0h,000h,002h,000h,000h


SprGfxMonsterMummy1:   ; CB46
	DB 018h            ; 24 pixels high
	DB 00Fh,000h,00Fh,078h,003h,078h,004h,030h
	DB 007h,070h,007h,040h,001h,0F0h,007h,0E0h
	DB 00Eh,020h,00Fh,0E0h,00Fh,0E0h,004h,020h
	DB 0CFh,0E5h,0E8h,067h,0F7h,0CBh,05Bh,0BEh
	DB 017h,0D4h,003h,080h,007h,0C0h,00Ch,060h
	DB 00Fh,0E0h,00Dh,060h,007h,0C0h,003h,080h

SprGfxMonsterMummy2:   ; CB77
	DB 018h            ; 24 pixels high
	DB 00Fh,0E8h,00Fh,0E8h,003h,030h,004h,070h
	DB 007h,040h,007h,0F0h,001h,0E0h,007h,0E0h
	DB 007h,010h,007h,0F0h,007h,0F0h,002h,010h
	DB 0AFh,0E5h,078h,067h,0F7h,0CBh,05Bh,0BEh
	DB 017h,0D4h,003h,080h,007h,0C0h,00Ch,060h
	DB 00Fh,0E0h,00Dh,060h,007h,0C0h,003h,080h

SprGfxMonsterMummy3:   ; CBA8
	DB 018h            ; 24 pixels high
	DB 000h,078h,00Fh,078h,00Fh,030h,007h,070h
	DB 004h,040h,007h,070h,007h,070h,001h,0E0h
	DB 007h,010h,007h,0F0h,007h,0F0h,002h,010h
	DB 0A7h,0F5h,0E4h,037h,0F3h,0EBh,05Bh,0FEh
	DB 017h,0F4h,001h,0C0h,003h,0E0h,006h,030h
	DB 007h,0F0h,006h,0B0h,003h,0E0h,001h,0C0h

SprGfxMonsterFrankenstein1:   ; CBD9
	DB 018h                   ; 24 pixels high
	DB 03Eh,000h,01Eh,060h,000h,0F0h,00Eh,070h
	DB 00Eh,0B0h,00Eh,0C4h,04Fh,0E4h,04Fh,0EAh
	DB 0A0h,00Ah,0AFh,0EEh,0EEh,0EEh,0FEh,0FEh
	DB 0FFh,0FEh,07Eh,0FCh,00Fh,0E0h,020h,008h
	DB 037h,0D8h,024h,048h,00Fh,0E0h,014h,050h
	DB 016h,0D0h,010h,010h,01Ah,0B0h,00Fh,0E0h

SprGfxMonsterFrankenstein2:   ; CC0A
	DB 018h                   ; 24 pixels high
	DB 01Eh,0F0h,01Eh,0F0h,000h,000h,00Eh,0E0h
	DB 04Eh,0E4h,04Eh,0E4h,0AFh,0EAh,0AFh,0EAh
	DB 0E0h,00Eh,0EFh,0EEh,0EFh,0EEh,0FEh,0FEh
	DB 0FFh,0FEh,07Eh,0FCh,00Fh,0E0h,020h,008h
	DB 037h,0D8h,024h,048h,00Fh,0E0h,014h,050h
	DB 016h,0D0h,010h,010h,01Ah,0B0h,00Fh,0E0h

SprGfxMonsterFrankenstein3:   ; CC3B
	DB 018h                   ; 24 pixels high
	DB 000h,0F8h,00Ch,0F0h,01Eh,000h,01Ch,0E0h
	DB 01Ah,0E0h,046h,0E0h,04Fh,0E0h,0AEh,0E4h
	DB 00Ah,0A0h,0EFh,0EAh,0EFh,0EEh,0FEh,0FEh
	DB 0FFh,0FEh,07Eh,0FCh,00Fh,0F0h,020h,008h
	DB 037h,0D8h,024h,048h,00Fh,0E0h,014h,050h
	DB 016h,0D0h,010h,010h,01Ah,0B0h,00Fh,0E0h

SprGfxMonsterDevil1:   ; CC6C
	DB 018h            ; 24 pixels high
	DB 00Ch,007h,00Ch,063h,000h,065h,00Ch,004h
	DB 00Ch,0ECh,00Eh,0F8h,00Fh,0D0h,00Fh,0C0h
	DB 005h,040h,00Bh,0A0h,00Dh,060h,0ABh,0A8h
	DB 0FFh,0FFh,03Fh,0FCh,007h,0C0h,00Ah,0A0h
	DB 011h,010h,014h,050h,016h,0D0h,031h,018h
	DB 07Bh,0BCh,06Fh,0ECh,047h,0C4h,040h,004h

SprGfxMonsterDevil2:   ; CC9D
	DB 018h            ; 24 pixels high
	DB 006h,0C7h,006h,0C3h,000h,005h,006h,0C4h
	DB 006h,0CCh,006h,0D8h,007h,0D0h,007h,0C0h
	DB 005h,040h,00Bh,0A0h,00Dh,060h,0ABh,0AAh
	DB 0FFh,0FEh,03Fh,0F8h,007h,0C0h,00Ah,0A0h
	DB 011h,010h,014h,050h,016h,0D0h,031h,018h
	DB 07Bh,0BCh,06Fh,0ECh,047h,0C4h,040h,004h

SprGfxMonsterDevil3:   ; CCCE
	DB 018h            ; 24 pixels high
	DB 000h,037h,006h,033h,006h,005h,000h,034h
	DB 007h,03Ch,007h,078h,003h,0F0h,007h,0F0h
	DB 002h,0A0h,005h,0D0h,006h,0B0h,0A5h,0D5h
	DB 0FFh,0FFh,03Fh,0FCh,003h,0E0h,005h,050h
	DB 008h,088h,00Ah,028h,00Bh,068h,018h,08Ch
	DB 039h,0CEh,037h,0F6h,023h,0E2h,020h,002h

SprGfxMonsterDracula1:   ; CCFF
	DB 018h              ; 24 pixels high
	DB 000h,0F0h,00Ch,000h,01Ch,0C0h,038h,0C0h
	DB 0B4h,0C2h,0CEh,0DEh,0F7h,0DEh,0F7h,0DEh
	DB 0F8h,03Eh,07Fh,0FCh,07Fh,0FCh,06Bh,0ACh
	DB 023h,088h,03Fh,0F8h,00Fh,0E0h,03Ah,0B8h
	DB 072h,09Ch,041h,004h,054h,054h,016h,0D0h
	DB 019h,030h,01Bh,0B0h,00Fh,0E0h,007h,0C0h

SprGfxMonsterDracula2:   ; CD30
	DB 018h              ; 24 pixels high
	DB 01Eh,0F0h,00Eh,0E0h,000h,000h,006h,0C0h
	DB 086h,0C2h,0F6h,0DEh,0F7h,0DEh,0F7h,0DEh
	DB 0F8h,03Eh,07Fh,0FCh,07Fh,0FCh,06Bh,0ACh
	DB 023h,088h,03Fh,0F8h,00Fh,0E0h,03Ah,0B8h
	DB 072h,09Ch,041h,004h,054h,054h,016h,0D0h
	DB 019h,030h,01Bh,0B0h,00Fh,0E0h,007h,0C0h

SprGfxMonsterDracula3:   ; CD61
	DB 018h              ; 24 pixels high
	DB 01Eh,000h,000h,060h,006h,070h,006h,038h
	DB 086h,05Ah,0F6h,0E6h,0F7h,0DEh,0F7h,0DEh
	DB 0F8h,03Eh,07Fh,0FCh,07Fh,0ECh,06Bh,0ACh
	DB 023h,088h,03Fh,0F8h,00Fh,0E0h,03Ah,0B8h
	DB 072h,09Ch,041h,004h,054h,054h,016h,0D0h
	DB 019h,030h,01Bh,0B0h,00Fh,0E0h,007h,0C0h

SprGfxTombstone:   ; CD92
	DB 015h        ; 21 pixels high
	DB 022h,000h,04Bh,0C0h,056h,080h,037h,060h
	DB 0FBh,000h,07Bh,080h,0FDh,080h,07Dh,0CEh
	DB 09Eh,0AEh,09Eh,077h,02Fh,0F9h,04Fh,0F6h
	DB 007h,0ECh,007h,0C0h,00Fh,0D8h,01Fh,0DCh
	DB 03Dh,0ECh,03Dh,0E2h,03Ah,0DCh,016h,0B8h
	DB 000h,070h

SprGfxObjCrucifix:   ; CDBD
	DB 012h          ; 18 pixels high
	DB 001h,080h,003h,0C0h,003h,0C0h,001h,080h
	DB 001h,080h,001h,080h,001h,080h,001h,080h
	DB 003h,0C0h,066h,066h,0FDh,0BFh,0FDh,0BFh
	DB 066h,066h,003h,0C0h,001h,080h,003h,0C0h
	DB 003h,0C0h,001h,080h

SprGfxObjSkull:   ; CDE2
	DB 00Fh       ; 15 pixels high
	DB 002h,0D0h,003h,050h,004h,0A8h,00Ch,008h
	DB 01Ch,0C8h,038h,044h,030h,084h,076h,032h
	DB 07Bh,05Ah,073h,01Ah,079h,012h,038h,002h
	DB 03Fh,002h,01Fh,0FCh,007h,0F0h

SprGfxGhostWitchLeft1:   ; CE01
	DB 016h              ; 22 pixels high
	DB 000h,00Ah,007h,0DAh,000h,0BAh,03Ch,0D8h
	DB 007h,0FCh,007h,0FEh,007h,0FEh,005h,0FFh
	DB 01Dh,0FFh,03Eh,0F7h,0E6h,0F6h,0C3h,078h
	DB 009h,060h,00Fh,0C0h,00Fh,0C0h,02Fh,020h
	DB 03Bh,040h,016h,0E0h,00Dh,0F0h,003h,0F8h
	DB 007h,0FCh,008h,01Fh

SprGfxGhostWitchLeft2:   ; CE2E
	DB 016h              ; 22 pixels high
	DB 000h,080h,007h,0D5h,000h,0BAh,03Ch,0D4h
	DB 007h,0FCh,007h,0FEh,007h,0FEh,005h,0FFh
	DB 00Dh,0FFh,01Eh,0F7h,076h,0F6h,0E3h,07Ch
	DB 049h,060h,00Fh,0C0h,00Fh,000h,02Fh,020h
	DB 03Bh,040h,016h,0E0h,00Dh,0F0h,003h,0F8h
	DB 007h,0FCh,008h,01Fh

SprGfxGhostWitchRight1:   ; CE5B
	DB 016h               ; 22 pixels high
	DB 010h,000h,0ABh,0E0h,05Dh,000h,02Bh,03Ch
	DB 03Fh,0E0h,07Fh,0E0h,07Fh,0E0h,0FFh,0A0h
	DB 0FFh,0B0h,0EFh,078h,06Fh,06Eh,03Eh,0C7h
	DB 006h,092h,003h,0F0h,000h,0F0h,004h,0F4h
	DB 002h,0DCh,007h,068h,00Fh,0B0h,01Fh,0C0h
	DB 03Fh,0E0h,0F8h,010h

SprGfxGhostWitchRight2:   ; CE88
	DB 016h               ; 22 pixels high
	DB 050h,000h,0ABh,0E0h,05Dh,000h,02Bh,03Ch
	DB 03Fh,0E0h,07Fh,0E0h,07Fh,0E0h,0FFh,0A0h
	DB 0FFh,0B8h,0EFh,07Ch,06Fh,067h,03Eh,0C3h
	DB 006h,090h,003h,0F0h,000h,0F0h,004h,0F4h
	DB 002h,0DCh,007h,068h,00Fh,0B0h,01Fh,0C0h
	DB 03Fh,0E0h,0F8h,010h

SprGfxGhostMonkLeft1:   ; CEB5
	DB 013h             ; 19 pixels high
	DB 00Ch,0CEh,01Fh,0FCh,03Fh,0F8h,02Fh,0B0h
	DB 017h,0B0h,03Bh,010h,03Dh,0B0h,07Eh,0F0h
	DB 0FFh,070h,0E3h,070h,01Dh,070h,00Ah,0E0h
	DB 015h,0C6h,024h,03Ch,047h,0FCh,04Fh,0F8h
	DB 07Fh,0E0h,03Fh,080h,01Eh,000h

SprGfxGhostMonkLeft2:   ; CEDC
	DB 013h             ; 19 pixels high
	DB 003h,000h,01Fh,0FFh,00Fh,0FCh,037h,0B0h
	DB 03Bh,0B0h,07Dh,010h,07Eh,0D0h,0FFh,070h
	DB 0E7h,0B0h,00Bh,0B0h,00Dh,070h,00Ch,0E0h
	DB 017h,0C0h,026h,01Fh,047h,0FCh,04Fh,0F8h
	DB 07Fh,0E0h,03Fh,080h,01Eh,000h

SprGfxGhostMonkRight1:   ; CF03
	DB 013h              ; 19 pixels high
	DB 000h,0C0h,0FFh,0F8h,03Fh,0F0h,00Dh,0ECh
	DB 00Dh,0DCh,008h,0BEh,00Dh,07Eh,00Eh,0FFh
	DB 00Dh,0E7h,00Dh,0D0h,00Eh,0B0h,007h,030h
	DB 003h,0E8h,0F8h,064h,03Fh,0E2h,01Fh,0F2h
	DB 007h,0F3h,001h,0FCh,000h,078h

SprGfxGhostMonkRight2:   ; CF2A
	DB 013h              ; 19 pixels high
	DB 073h,030h,03Fh,0F8h,01Fh,0FCh,00Dh,0F4h
	DB 00Dh,0E8h,008h,0DCh,00Dh,0BCh,00Fh,07Eh
	DB 00Eh,0FFh,00Eh,0C7h,00Eh,0B8h,007h,050h
	DB 063h,0A8h,03Ch,024h,03Fh,0E2h,01Fh,0F2h
	DB 007h,0FEh,001h,0FCh,000h,078h

SprGfxGhostBatLeft1:   ; CF51
	DB 013h            ; 19 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,067h,0F0h,0FFh,0FFh
	DB 0BFh,0FEh,0DFh,080h,0F7h,0F0h,0DCh,010h
	DB 025h,0F8h,00Bh,0E8h,00Ch,018h,007h,0F8h
	DB 003h,0F8h,000h,0FCh,000h,01Fh

SprGfxGhostBatLeft2:   ; CF78
	DB 00Dh            ; 13 pixels high
	DB 000h,01Fh,000h,0FCh,003h,0F8h,007h,004h
	DB 008h,038h,007h,090h,067h,0E0h,0FFh,09Fh
	DB 0BFh,0FEh,0DFh,0F0h,0F0h,000h,0B0h,000h
	DB 020h,000h

SprGfxGhostBatRight1:   ; CF93
	DB 00Dh             ; 13 pixels high
	DB 0F8h,000h,03Fh,000h,01Fh,0C0h,02Fh,0E0h
	DB 01Ch,010h,009h,0E0h,007h,0E6h,0F9h,0FFh
	DB 07Fh,0FDh,00Fh,0FBh,000h,00Fh,000h,00Dh
	DB 000h,004h

SprGfxGhostBatRight2:   ; CFAE
	DB 013h             ; 19 pixels high
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,00Fh,0E6h,0FFh,0FFh
	DB 07Fh,0FDh,001h,0FBh,00Fh,0EFh,008h,06Dh
	DB 01Fh,0A4h,027h,0D0h,018h,030h,01Fh,0E0h
	DB 01Fh,0C0h,03Fh,000h,0F8h,000h

BackSpriteBarrel:              ; CFD5
	DB 004h,020h               ; Width: 4 chars; Height: 32 pixels

	DB 000h,00Fh,0F0h,000h,000h,070h,00Eh,000h
	DB 001h,087h,0B1h,080h,002h,07Bh,0DEh,040h
	DB 004h,0FDh,0EFh,0A0h,00Bh,07Eh,0F7h,0D0h
	DB 017h,0BFh,07Bh,0E8h,017h,0DFh,0BDh,0E8h
	DB 02Fh,0FFh,0FFh,0F4h,06Eh,063h,08Fh,0B6h
	DB 05Eh,049h,027h,0BAh,056h,049h,024h,02Ah
	DB 05Eh,063h,08Ch,0BAh,0DCh,049h,024h,0FBh
	DB 0EEh,049h,024h,0F7h,0AFh,063h,08Ch,0B5h
	DB 0B7h,0FFh,0FFh,0EDh,0BBh,0DFh,0F7h,0DDh
	DB 09Dh,0EFh,0FBh,0B9h,0CEh,077h,0FEh,073h
	DB 0C7h,08Fh,0F1h,0E3h,063h,0F0h,00Fh,0C6h
	DB 070h,0FFh,0FFh,00Eh,038h,01Fh,0F8h,01Ch
	DB 01Eh,000h,040h,078h,00Fh,0C0h,023h,0F0h
	DB 003h,0FFh,0FFh,0C0h,000h,0FFh,0FFh,000h
	DB 000h,01Fh,0F8h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h


BackSpriteAttrBarrel:          ; D057
	DB 004h,004h               ; Width: 4 chars; Height: 4 chars

	DB 046h,046h,046h,046h,046h,046h,046h,046h		; (Bright Yellow)
	DB 046h,046h,046h,046h,046h,046h,046h,046h


BackSpriteAcgDoor:             ; D069
	DB 008h,028h               ; Width: 8 chars; Height: 40 pixels

	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,03Ch,000h,000h,000h,000h,03Ch,000h
	DB 000h,042h,000h,000h,000h,000h,042h,000h
	DB 000h,0BDh,000h,000h,000h,000h,0BDh,000h
	DB 000h,0EFh,000h,000h,000h,000h,0F7h,000h
	DB 0FFh,0EBh,0FFh,0FFh,07Fh,0FFh,0F7h,0FFh
	DB 000h,06Ah,01Fh,0FFh,07Fh,0F8h,056h,000h
	DB 000h,05Ah,03Fh,0FFh,07Fh,0FCh,052h,000h
	DB 000h,0D6h,03Fh,0E3h,063h,0FCh,06Bh,000h
	DB 000h,0D6h,07Fh,0D1h,051h,0FEh,06Bh,000h
	DB 000h,0B6h,07Fh,0D1h,051h,0FEh,069h,000h
	DB 000h,0B6h,0FFh,0CDh,04Dh,0FFh,06Dh,000h
	DB 001h,0B6h,0FFh,0E3h,063h,0FFh,06Dh,080h
	DB 001h,0A4h,0FFh,0FFh,0FFh,0FFh,025h,080h
	DB 001h,02Ch,0FFh,036h,030h,0FFh,034h,080h
	DB 001h,06Ch,0FFh,034h,0E6h,0FFh,036h,080h
	DB 003h,06Ch,0FFh,004h,0E4h,0FFh,036h,0C0h
	DB 003h,06Ch,0FFh,004h,0E4h,0FFh,036h,0C0h
	DB 002h,06Ch,0FFh,034h,0E7h,0FFh,036h,040h
	DB 002h,06Ch,0FFh,034h,0E7h,0FFh,036h,040h
	DB 006h,0CCh,07Fh,08Eh,030h,0FEh,033h,060h
	DB 004h,0CCh,07Fh,0FFh,0FFh,0FEh,033h,020h
	DB 007h,0F4h,03Fh,0FFh,07Fh,0FCh,02Fh,0E0h
	DB 01Fh,0FCh,01Fh,0FFh,07Fh,0F8h,03Fh,0F8h
	DB 038h,00Eh,00Fh,0FFh,07Fh,0F0h,070h,01Ch
	DB 067h,0F3h,003h,0FFh,07Fh,0C0h,0CFh,0E6h
	DB 05Fh,0FDh,000h,07Fh,0FEh,000h,0BFh,0FAh
	DB 03Fh,0FEh,000h,007h,060h,000h,07Fh,0FCh
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 07Fh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FEh
	DB 07Fh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FEh
	DB 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 0AAh,0AAh,0AAh,0AAh,0AAh,0AAh,0AAh,0AAh
	DB 055h,055h,055h,055h,055h,055h,055h,056h
	DB 02Ah,0AAh,0AAh,0AAh,0AAh,0AAh,0AAh,0ACh
	DB 000h,000h,000h,000h,000h,000h,000h,000h


BackSpriteAttrAcgDoor:         ; D1AB
	DB 008h,005h               ; Width: 8 chars; Height: 5 chars

	DB 0FFh,047h,043h,043h,043h,043h,047h,0FFh	; (Transparent, Bright White, Magenta, Yellow)
	DB 0FFh,047h,043h,043h,043h,043h,047h,0FFh
	DB 047h,047h,043h,043h,043h,043h,047h,047h
	DB 047h,047h,043h,043h,043h,043h,047h,047h
	DB 046h,046h,046h,046h,046h,046h,046h,046h


SprGfxObjAcgKey1:   ; D1D5
	DB 00Bh         ; 11 pixels heigh
	DB 00Ch,0CEh,00Ch,0DFh,00Fh,0D8h,00Fh,0D8h
	DB 00Ch,0D8h,00Ch,0DFh,007h,0FEh,03Fh,0FFh
	DB 05Fh,0FFh,040h,000h,03Fh,0FFh

SprGfxObjAcgKey2:   ; D1EC
	DB 00Fh         ; 15 pixels heigh
	DB 03Ch,000h,07Eh,000h,066h,000h,06Eh,001h
	DB 060h,001h,07Eh,003h,03Ch,00Fh,0FFh,0F0h
	DB 0FFh,0FFh,000h,00Fh,0FFh,0F0h,000h,00Fh
	DB 000h,003h,000h,001h,000h,001h

SprGfxObjAcgKey3:   ; D20B
	DB 013h
	DB 01Ch,000h,07Fh,000h,07Fh,000h,0C3h,080h
	DB 0C3h,0C0h,081h,0DCh,081h,066h,01Bh,042h
	DB 09Fh,073h,0C7h,0B1h,0C7h,0B1h,09Fh,073h
	DB 01Bh,042h,081h,066h,081h,0BCh

LD22A:   ; (unused)
	DB 0C3h,080h,0F8h,080h,07Fh,000h,01Ch,000h

SprGfxMushroom:   ; D232
	DB 010h       ; 16 pixels high
	DB 000h,070h,000h,0FCh,000h,07Eh,000h,07Eh
	DB 000h,0FCh,000h,0FCh,07Eh,03Ch,0CFh,0C8h
	DB 06Fh,0F0h,0FFh,03Ch,07Fh,03Eh,077h,0F3h
	DB 033h,0F3h,01Fh,09Eh,00Fh,0FCh,003h,0F0h



BackSpritePicture:             ; D253
	DB 004h,010h               ; Width: 4 chars; Height: 16 pixels

	DB 001h,0FFh,0FFh,080h,001h,0FFh,0FFh,080h
	DB 001h,080h,001h,080h,001h,087h,0E1h,080h
	DB 003h,08Dh,031h,0C0h,003h,018h,098h,0C0h
	DB 003h,013h,0C8h,0C0h,003h,016h,068h,0C0h
	DB 007h,01Fh,0F8h,0E0h,006h,019h,098h,060h
	DB 006h,019h,098h,060h,006h,00Fh,0F0h,060h
	DB 00Eh,000h,000h,070h,00Ch,000h,000h,030h
	DB 00Fh,0FFh,0FFh,0F0h,00Fh,0FFh,0FFh,0F0h


BackSpriteAttrPicture:         ; D295
	DB 004h,002h               ; Width: 4 chars; Height: 2 chars

	DB 046h,046h,046h,046h,046h,046h,046h,046h	; (Bright Yellow)


SprGfxObjSpanner:   ; D29F
	DB 010h         ; 16 pixels heigh
	DB 020h,000h,070h,000h,078h,000h,03Ch,000h
	DB 01Eh,000h,00Fh,000h,007h,080h,003h,0C0h
	DB 001h,0E0h,000h,0F8h,000h,07Eh,000h,07Fh
	DB 000h,07Fh,000h,063h,000h,063h,000h,022h

SprGfxGhostMini1:   ; D2C0
	DB 00Bh         ; 11 pixels high
	DB 009h,010h,0DDh,0B9h,0FFh,0FFh,07Fh,0FFh
	DB 03Fh,0FEh,01Ch,09Ch,00Ah,02Ch,00Bh,06Ch
	DB 00Ch,098h,007h,0F0h,001h,0E0h

SprGfxGhostMini2:   ; D2D7
	DB 00Bh         ; 11 pixels high
	DB 000h,000h,000h,000h,001h,001h,0D7h,0D7h
	DB 0FFh,0FFh,0F9h,03Eh,074h,05Ch,036h,0D8h
	DB 019h,030h,00Fh,0E0h,003h,0C0h


BackSpriteSkeleton:            ; D2EE
	DB 005h,028h               ; Width: 5 chars; Height: 40 pixels

	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,000h,000h,000h
	DB 000h,000h,000h,000h,000h,060h,000h,000h
	DB 000h,0E0h,078h,000h,000h,000h,0FCh,0ECh
	DB 040h,000h,000h,06Eh,0C6h,070h,000h,000h
	DB 0C1h,0C3h,060h,000h,000h,0C6h,0A1h,0C0h
	DB 000h,000h,0BFh,030h,080h,000h,000h,07Ch
	DB 01Ch,000h,000h,000h,06Bh,09Fh,000h,000h
	DB 0FFh,050h,04Eh,0FFh,000h,000h,024h,0E1h
	DB 000h,000h,000h,028h,010h,000h,000h,000h
	DB 012h,060h,000h,000h,000h,014h,030h,000h
	DB 000h,000h,014h,018h,000h,000h,000h,014h
	DB 046h,000h,000h,000h,00Ch,099h,000h,000h
	DB 000h,002h,0AEh,0E0h,000h,000h,006h,07Bh
	DB 060h,000h,050h,00Ch,0E7h,030h,000h,027h
	DB 018h,087h,018h,050h,017h,078h,0FFh,00Bh
	DB 098h,007h,000h,07Eh,003h,0B0h,005h,000h
	DB 03Ch,003h,080h,005h,000h,000h,000h,0E0h
	DB 00Bh,000h,000h,000h,040h,014h,000h,000h
	DB 000h,0F0h,014h,000h,000h,000h,028h,068h
	DB 000h,000h,000h,02Eh,0F0h,000h,000h,000h
	DB 01Fh,0B8h,000h,000h,000h,01Bh,0F8h,000h
	DB 000h,000h,01Fh,070h,000h,000h,000h,00Eh


BackSpriteAttrSkeleton:        ; D3B8
	DB 005h,005h               ; Width: 5 chars; Height: 5 chars

	DB 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,047h,047h	; (Bright White and Transparent)
	DB 047h,0FFh,0FFh,047h,047h,0FFh,0FFh,047h
	DB 047h,047h,047h,047h,047h,0FFh,0FFh,0FFh
	DB 047h


SprGfxMonsterHunchback1:   ; D3D3
	DB 018h	               ; 24 pixels high
	DB 000h,03Ch,03Ch,038h,01Ch,000h,000h,038h
	DB 00Eh,038h,00Eh,038h,00Fh,038h,067h,0F8h
	DB 003h,0F8h,060h,000h,077h,0F8h,037h,038h
	DB 037h,078h,043h,09Ch,01Dh,08Ch,006h,0C2h
	DB 07Bh,062h,07Fh,072h,053h,062h,073h,044h
	DB 03Eh,0CCh,01Eh,0F8h,005h,0F0h,003h,0E0h

SprGfxMonsterHunchback2:	; D404
	DB 018h	               ; 24 pixels high
	DB 00Fh,03Ch,007h,038h,000h,000h,007h,038h
	DB 007h,038h,007h,038h,007h,038h,037h,0F8h
	DB 007h,0F8h,030h,000h,027h,0F8h,026h,078h
	DB 026h,0F8h,003h,09Ch,01Dh,08Ch,006h,0CCh
	DB 07Bh,066h,07Fh,066h,053h,066h,073h,04Ch
	DB 03Eh,0CCh,01Eh,0F8h,005h,0F0h,003h,0E0h

SprGfxMonsterHunchback3:	; D435
	DB 018h	               ; 24 pixels high
	DB 00Fh,000h,007h,03Ch,000h,038h
	DB 007h,000h,007h,038h,007h,03Ch,007h,03Ch
	DB 067h,0F8h,007h,0F8h,060h,000h,077h,0F8h
	DB 037h,038h,037h,038h,043h,09Ch,01Dh,08Ch
	DB 006h,0C2h,07Bh,062h,07Fh,072h,053h,062h
	DB 073h,044h,03Eh,0CCh,01Eh,0F8h,005h,0F0h
	DB 003h,0E0h


BackSpriteBarrelPile:          ; D466							;OLD COMMENT: UnusedMemory:      ; 0D466h
	DB 005h,01Bh               ; Width: 5 chars; Height: 27 pixels

	DB 003h,0C0h,03Ch,003h,0C0h,00Fh,0F0h,0FFh
	DB 00Fh,0F0h,01Fh,0F9h,0FFh,09Fh,0F8h,01Fh
	DB 0F9h,0FFh,09Fh,0F8h,02Fh,0F6h,0FFh,06Fh
	DB 0F4h,043h,0C0h,03Ch,003h,0C4h,030h,00Fh
	DB 000h,0F0h,00Ch,02Ch,03Fh,0C3h,0FCh,034h
	DB 023h,07Fh,0E7h,0FEh,0C4h,030h,07Fh,0E7h
	DB 0FEh,00Ch,02Ch,0BFh,0DBh,0FCh,034h,013h
	DB 08Fh,000h,0F1h,0C8h,010h,0C0h,03Ch,003h
	DB 008h,00Ch,0B0h,0FFh,00Dh,030h,003h,08Dh
	DB 0FFh,0B1h,0C0h,000h,0C1h,0FFh,083h,000h
	DB 000h,0D2h,0FFh,04Bh,000h,000h,04Eh,03Ch
	DB 072h,000h,000h,043h,000h,0C2h,000h,000h
	DB 032h,0C3h,04Ch,000h,000h,00Eh,03Ch,070h
	DB 000h,000h,003h,000h,0C0h,000h,000h,002h
	DB 0C3h,040h,000h,000h,001h,03Ch,080h,000h
	DB 000h,001h,000h,080h,000h,000h,000h,0C3h
	DB 000h,000h,000h,000h,03Ch,000h,000h


BackSpriteAttrBarrelPile:      ; D4EF
	DB 005h,004h               ; Width: 5 chars; Height: 4 chars

	DB 043h,043h,043h,043h,043h,043h,043h,043h	; (Bright Magenta)
	DB 043h,043h,043h,043h,043h,043h,043h,043h
	DB 043h,043h,043h,043h


LD505:
	DB 000h,000h,000h,000h,000h,000h,001h,000h

	SAVESNA  "aticatac_cw.sna", PlayGame
