

	.org 23296

MonitorAddress: DEFW 5E26h
Monitor:	PUSH AF
	PUSH HL
	LD HL, (MonitorAddress)
	LD A, (HL)
	LD HL,22528+7
.loop	RRCA
	JR NC, .skip1
	LD (HL), 64+48+6
	JR .skip2
.skip1	LD (HL), 64+9
.skip2	DEC L
	JP P, .loop
	POP HL
	POP AF
	RET