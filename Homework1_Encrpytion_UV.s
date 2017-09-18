	
	AREA	Assign1,	CODE,	READONLY
	EXPORT main
	ENTRY

main
	LDR R9, =DeltaOne
	LDR R1, [R9]
	LDR R9, =DeltaTwo
	LDR R2, [R9]
	LDR R9, =KZero
	LDR R3, [R9]
	LDR R9, =KOne
	LDR R4, [R9]
	LDR R9, =KTwo
	LDR R5, [R9]
	LDR R9, =KThree
	LDR R6, [R9]
	LDR R9, =LZero
	LDR R7, [R9]
	LDR R9, =RZero
	LDR R8, [R9]

Encrpyt
	ADD R9, R3, R8, LSL #4
	ADD R10, R4, R8, LSR #5
	ADD R11, R8, R1
	AND R9, R9, #0xFFFFFFFF
	AND R10, R10, #0xFFFFFFFF
	AND R11, R11, #0xFFFFFFFF
	EOR R9, R9, R10
	EOR R9, R9, R11
	ADD R7, R7, R9
	AND R7, R7, #0xFFFFFFFF
	
	;MOV R9, #0
	;MOV R10, #0
	;MOV R11, #0
	
	ADD R9, R5, R7, LSL #4
	ADD R10, R6, R7, LSR #5
	ADD R11, R7, R2
	AND R9, R9, #0xFFFFFFFF
	AND R10, R10, #0xFFFFFFFF
	AND R11, R11, #0xFFFFFFFF
	EOR R9, R9, R10
	EOR R9, R9, R11
	ADD R8, R8, R9
	AND R8, R8, #0xFFFFFFFF
	
	LDR R12, =LTwo
	LDR R0, =RTwo
	STR R7, [R12]
	STR R8, [R0]
	

DONE	
	MOV		r0, #0x18      ; angel_SWIreason_ReportException
	LDR		r1, =0x20026   ; ADP_Stopped_ApplicationExit
	SVC		#0x11		   ; previously SWI
	ALIGN
		
	AREA	Holder,	DATA, READWRITE
		
	EXPORT adrDO
	EXPORT adrDT
	EXPORT adrKZ
	EXPORT adrKO
	EXPORT adrKW
	EXPORT adrKT
	EXPORT adrLZ
	EXPORT adrRZ
	EXPORT adrLT
	EXPORT adrRT

adrDO  DCD  DeltaOne
adrDT  DCD  DeltaTwo
adrKZ  DCD  KZero
adrKO  DCD  KOne
adrKW  DCD  KTwo
adrKT  DCD  KThree
adrLZ  DCD  LZero
adrRZ  DCD  RZero
adrLT  DCD  LTwo
adrRT  DCD  RTwo

DeltaOne	DCD		0x11111111
DeltaTwo	DCD		0x22222222
KZero		DCD		0x90001C55
KOne		DCD		0x1234ABCD
KTwo		DCD		0xFEDCBA98
KThree		DCD		0xE2468AC0
LZero		DCD		0xA0000009
RZero		DCD		0x8000006B
LTwo		DCD		0
RTwo		DCD		0
	
	END