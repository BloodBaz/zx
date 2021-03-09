



FRAMES					equ $5C78	; (23672) Used to choose index of start keys etc.
ChickenEnergy			equ $5E28	; Address of how much chicken energy you have (00 = None; F0 = Full)
LastChickenEnergy		equ $5E29	; Amount of chicken energy as rendered to screen
EnergyMax				equ $F0		; (240)
TimerMinutes			equ $5E3D	; Address of 2-byte BCD encoded "Minutes" on the timer
TimerSeconds			equ $5E3F	; Address of 1-byte BCD encoded "Seconds" on the timer
RoomsVisitedPercentBCD	equ $5E54	; Address of byte holding percentage of rooms visited in BCD format (used at Game Over to provide info to users)

GreenKeyStartRoom		equ $603E	; (24638) Address that holds the Start room for the Green Key
RedKeyStartRoom			equ $6046	; (24646) Address that holds the Start room for the Red Key
BlueKeyStartRoom		equ $604E	; (24654) Address that holds the Start room for the Blue Key
MummyStartRoom			equ $640E	; (24614) Address that holds the Start room for the Yellow Key


ExplosionObject			equ $EAA0	; (60064) ; When you collide with a nasty
MummyLeafObject			equ $EAE0




; Sprite Graphics Indexes
; Define Indexes into SprGfxTable (0-based)

SprGfxKnightLtIdx			EQU 0	; index 0-3   Player Knight Left (4 frames; 3 sprites)
SprGfxKnightRtIdx			EQU 4	; index 4-7   Player Knight Right (4 frames; 3 sprites)
SprGfxKnightUpIdx			EQU 8	; index 8-11  Knight Up (4 frames; 3 sprites)
SprGfxKnightDnIdx			EQU 12	; index 12-15 Knight Down (4 frames; 3 sprites)
SprGfxWizardLtIdx			EQU 16	; index 16-19 Wizard Left (4 frames; 3 sprites)
SprGfxWizardRtIdx			EQU 20	; index 20-23 Wizard Right (4 frames; 3 sprites)
SprGfxWizardUpIdx			EQU 24	; index 24-27 Wizard Up (4 frames; 3 sprites)
SprGfxWizardDnIdx			EQU 28	; index 28-31 Wizard Down (4 frames; 3 sprites)
SprGfxSerfLtIdx				EQU 32	; index 32-35 Serf   Left (4 frames; 3 sprites)
SprGfxSerfRtIdx				EQU 36	; index 36-39 Serf   Right (4 frames; 3 sprites)
SprGfxSerfUpIdx				EQU 40	; index 40-43 Serf   Up (4 frames; 3 sprites)
SprGfxSerfDnIdx				EQU 44	; index 44-47 Serf   Down (4 frames; 3 sprites)
									; index 48
SprGfxIconCursorLeftIdx		EQU 49	; index 49      Cursor Icon (left)
SprGfxIconCursorRightIdx	EQU 50	; index 50      Cursor Icon (right)
SprGfxWizardSpellIdx		EQU 51	; index 51-54 Wizard Spell (4 frames; 3 sprites)
SprGfxSerfSwordIdx			EQU 55	; index 55-62 Serf Sword (n, ne, e, sw, s, se, w, nw)
SprGfxKnightAxeIdx			EQU 63	; index 63-70 Knight's Axe (8 frames)
SprGfxIconKeyboardLeftIdx	EQU 71	; index 71      Icon: Keyboard Icon (left)
SprGfxIconKeyboardRightIdx	EQU 72	; index 72      Icon: Keyboard Icon (right)
SprGfxIconJoystickLeftIdx	EQU 73	; index 73      Icon: Joystick Icon (left)
SprGfxIconJoystickRightIdx	EQU 74	; index 74      Icon: Joystick Icon (right)
SprGfxGhostPumpkinIdx		EQU 75	; index 75      Ghost: Pumpkin (2 frames)
SprGfxGhostMiniIdx			EQU 77	; index 77      Ghost: Mini (2 frames)
SprGfxFoodCanIdx			EQU 79	; index 79      Food: Can
SprGfxFoodStrippedCandyIdx	EQU 80	; index 80      Food: Stripped Candy
SprGfxFoodLegOfLambIdx		EQU 81	; index 81      Food: Leg of Lamb
SprGfxFoodLollypopIdx		EQU 82	; index 82      Food: Lollypop
SprGfxFoodConeIdx			EQU 83	; index 83      Food: Cone
SprGfxFoodBowlIdx			EQU 84	; index 84      Food: Bowl
SprGfxFoodAppleIdx			EQU 85	; index 85      Food: Apple
SprGfxFoodMilkBottleIdx		EQU 86	; index 86      Food: Milk Bottle
SprGfxSpawnIdx				EQU 87	; index 87-90   Misc: Spawn (4 frames)
SprGfxGhostSpiderIdx		EQU 91	; index 91-92   Ghost: Spider (2 frames)
SprGfxGhostMonsterIdx		EQU 93	; index 93-94   Ghost: Monster (2 frames)
SprGfxGhostRabbitIdx		EQU 95	; index 95-96   Ghost: Rabbit (2 frames)
SprGfxGhostGhoulIdx			EQU 97	; index 97-98   Ghost: Ghoul (2 frames)
									; index 99-102  (4 frames)
SprGfxGhostGhostIdx			EQU 103	; index 103-104 Ghost: Ghost (2 frames)
SprGfxGhostBatIdx			EQU 105	; index 105-106 Ghost: Bat (2 frames)
SprGfxDestroyIdx			EQU 107	; index 107     Misc: Destroy (4 frames) (ghost animation when you kill it)
									; index 108-110 (3 frames)
SprGfxMonsterMummyIdx		EQU 111	; index 111-114 Monster: Mummy (4 frames)
SprGfxMonsterFrankensteinIdx EQU 115; index 115-118 Monster: Frakenstein (4 frames)
SprGfxMonsterDevilIdx		EQU 119	; index 119-122 Monster: Devil (4 frames)
SprGfxMonsterDraculaIdx		EQU 123	; index 123-126 Monster: Dracula (4 frames)
SprGfxObjMummyLeafIdx		EQU 127	; index 127     Object: Red Mummy Leaf
SprGfxObjColourKeyIdx		EQU 128	; index 128     Object: Red/Green/Cyan/Yellow Colour Key
SprGfxObjBottleIdx			EQU 129	; index 129     Object: Green Bottle
SprGfxObjSwedeIdx			EQU 130	; index 130     Object: Cyan Swede
SprGfxObjWingIdx			EQU 131	; index 131     Object: Yellow Wing
SprGfxObjNecklaceIdx		EQU 132	; index 132     Object: Cyan Necklace
SprGfxObjTelescopeIdx		EQU 133	; index 133     Object: Green Telescope (Talon?)
SprGfxObjGemIdx				EQU 134	; index 134     Object: Magenta Gem
SprGfxObjMoneyBagIdx		EQU 135	; index 135     Object: Red Bag of Money
SprGfxObjSkullIdx			EQU 136	; index 136     Object: White Skull
SprGfxObjCrucifixIdx		EQU 137	; index 137     Object: Yellow Crucifix
SprGfxObjSpannerIdx			EQU 138	; index 138     Object: Green Spanner
SprGfxObjAcgKey1Idx			EQU 139	; index 139     Object: Yellow ACG Key (AC)
SprGfxObjAcgKey2Idx			EQU 140	; index 140     Object: Yellow ACG Key (G)
SprGfxObjAcgKey3Idx			EQU 141	; index 141     Object: Yellow ACG Key (handle)
SprGfxTombstoneIdx			EQU 142	; index 142     Misc: Tombstone
SprGfxGhostWitchLeftIdx		EQU 143	; index 143-144 Ghost: Witch Left  (2 frames)
SprGfxGhostWitchRightIdx	EQU 145	; index 145-146 Ghost: Witch Right (2 frames)
SprGfxGhostMonkLeftIdx		EQU 147	; index 147-148 Ghost: Monk  Left  (2 frames)
SprGfxGhostMonkRightIdx		EQU 149	; index 149-150 Ghost: Monk  Right (2 frames)
SprGfxGhostBatLeftIdx		EQU 151	; index 151-152 Ghost: Bat   Left  (2 frames)
SprGfxGhostBatRightIdx		EQU 153	; index 153-154 Ghost: Bat   Right (2 frames)
SprGfxMonsterHunchbackIdx	EQU 155	; index 155-158 Monster: Hunchback (4 frames)
SprGfxMushroomIdx			EQU 160	; index 160     Misc: Mushroom

; Colours (Black paper)
BRIGHT_BLACK	EQU $40
BRIGHT_BLUE 	EQU $41
BRIGHT_RED  	EQU $42
BRIGHT_MAGENTA	EQU $43
BRIGHT_GREEN	EQU $44
BRIGHT_CYAN 	EQU $45
BRIGHT_YELLOW	EQU $46
BRIGHT_WHITE	EQU $47



; 0-based Background Graphic Indexes
; There are 39 items - indexed 0 to 38 when 1 based
BkSprOpnCvnDoorIdx    EQU 0 		; 00h
BkSprOpnRmDoorIdx     EQU 1 		; 01h
BkSprLargeRmDoorIdx   EQU 2 		; 02h
BkSprLckRmDoorRedIdx  EQU 7 		; 07h
BkSprLckRmDoorGrnIdx  EQU 8 		; 08h
BkSprLckRmDoorBluIdx  EQU 9 		; 09h
BkSprLckRmDoorYelIdx  EQU 10		; 0Ah
BkSprLckCvnDoorRedIdx EQU 11		; 0Bh
BkSprLckCvnDoorGrnIdx EQU 12		; 0Ch
BkSprLckCvnDoorBluIdx EQU 13		; 0Dh
BkSprLckCvnDoorYelIdx EQU 14		; 0Eh
BkSprClockIdx         EQU 15		; 0Fh
BkSprGhostPictureIdx  EQU 16		; 10h
BkSprTableIdx         EQU 17		; 11h
BkSprFullChickenIdx   EQU 18		; 12h
BkSprEmptyChickenIdx  EQU 19		; 13h
BkSprTrophyHornsIdx   EQU 20		; 14h
BkSprTrophyIdx        EQU 21		; 15h
BkSprBookshelfIdx     EQU 22		; 16h
BkSprTrapdoorClsIdx   EQU 23		; 17h
BkSprTrapdoorOpnIdx   EQU 24		; 18h
BkSprBarrelIdx        EQU 25		; 19h
BkSprBearRugIdx       EQU 26		; 1Ah
BkSprAcgShieldIdx     EQU 27		; 1Bh
BkSprShield2Idx       EQU 28		; 1Ch
BkSprSuitOfArmourIdx  EQU 29		; 1Dh
BkSprClsRmDoorIdx     EQU 31		; 1Fh
;BkSprOpnRmDoorIdx     EQU 32		; 20h
BkSprClsCvnDoorIdx    EQU 33		; 21h
;BkSprOpnCvnDoorIdx    EQU 34		; 22h
BkSprAcgDoorIdx       EQU 35		; 23h
BkSprPictureIdx       EQU 36		; 24h
BkSprSkeletonIdx      EQU 37		; 25h
BkSprBarrelPileIdx    EQU 38		; 26h
