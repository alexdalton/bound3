ORIGIN 0
SEGMENT 0 CODE:

	LEA R0, DATA
; if successful, L2 read miss

	LDR R1, R0, l1p ; fills L2's way 0 slots 4 (because of instruction cache)
	LDR R2, R0, l2p
	LDR R3, R0, l3p
	LDR R4, R1, 0 ;  fills L2's way 1 slot 4
	LDR R5, R2, 0 ;  way 2
	ADD R5, R5, 5 ; 
	STR R5, R2, 0 ; change L1 cache line 2; line 2 = dirty
	LDR R6, R1, 0 ; make line 2 not most recently used in L1 cache
	LDR R7, R3, 0 ; evicts line2 (writeback to L2), loads line3 (fills l2 way 3 slot 0) (3 becomes MRU, 2 is dirty in L2)

; tested writeback L1 to L2 on read  miss

	LDR R1, R0, l4p ; Get addresses of lines 4 to 6
	LDR R2, R0, l5p ;
	LDR R3, R0, l6p ;

	LDR R4, R1, 0 ;  make lines 4-6 (in ways 4-6) become MRU, push 1-3 further down...
	LDR R5, R2, 0 ;
	LDR R6, R3, 0 ;

	LDR R1, R0, l7p ; Get addresses of lines 7 to 9
	LDR R2, R0, l8p ;
	LDR R3, R0, l9p ;

	LDR R4, R1, 0 ;  make 7-9 become MRU, push 1-3 further down...
	LDR R5, R2, 0 ;
	LDR R6, R3, 0 ;

	LDR R1, R0, lAp ; Get addresses of lines A to C
	LDR R2, R0, lBp ;
	LDR R3, R0, lCp ; Overwrite valid LRU

	LDR R4, R1, 0 ;  make A-C become MRU, first forces writeback of line 2 into memory.
; tested L2 read miss with writeback to memory

	LDR R5, R2, 0 ;
	LDR R6, R3, 0 ; 

	LDR R1, R0, L2p ; get address of the changed memory (line 2)
	
	LDR R7, R1, 0 ; Load that changed memory (line 2)
; verify that memory got the right data


; next verify that LRU works correctly a bit
	LDR R1, R0, l7p ; Get addresses of lines 7 to 9
	LDR R2, R0, l8p ;
	LDR R3, R0, l9p ;

	LDR R6, R3, 0 ;
	LDR R4, R1, 0 ;  make 9, 7, 8 become MRU, testing some LRU shenanigans
	LDR R5, R2, 0 ;



; next going to check the writeback from L1 cache to L2 with write miss for L2 (ie: L1 has dirty line that L2 doesn't have, and has to evict it from L1 cache)
	LDR R1, R0, l1p ; re-load line 1-3 addresses
	LDR R2, R0, l2p 
	LDR R3, R0, l3p 

	LDR R4, R1, 0 ;  load line 1. Change line 1
	ADD R4, R4, 4 ; make r4 = x1115
	STR R4, R1, 2 ;  (change line 1 ; it should have x1115 and x1111 both)
	LDR R5, R2, 0 ;  load line 2.
	
	LDR R4, R1, 0 ; reload line 1 to make sure it doesn't get evicted

	LDR R5, R3, 0 ;  load line 3

	LDR R4, R1, 2 ; reload line 1 to make sure it doesn't get evicted

	LDR R2, R0, l4p 
	LDR R3, R0, l5p

	LDR R5, R2, 0 ;  load line 4

	LDR R4, R1, 0 ; reload line 1 to make sure it doesn't get evicted from L1

	LDR R5, R3, 0 ;  load line 5

	LDR R4, R1, 2 ; reload line 1 to make sure it doesn't get evicted from L1

	LDR R2, R0, l6p 
	LDR R3, R0, l7p

	LDR R5, R2, 0 ;  load line 6

	LDR R4, R1, 0 ; reload line 1 to make sure it doesn't get evicted from L1

	LDR R5, R3, 0 ;  load line 7

	LDR R4, R1, 2 ; reload line 1 to make sure it doesn't get evicted from L1

	LDR R2, R0, l8p 
	LDR R3, R0, l9p

	LDR R5, R2, 0 ;  load line 8

	LDR R4, R1, 0 ; reload line 1 to make sure it doesn't get evicted from L1

	LDR R5, R3, 0 ;  load line 9. At this point line 1 gets evicted from L2, with no writeback.


; Now lines 2-9 have filled in the L2 cache slot. Need to cause writeback to memory, which looks
; like a writeback on write miss to L2.
; To do this, we need to evict the line from L1 cache by reading something that is in the L2 but not in the L1
; We choose to read line 8, which is not in L1 anymore since line 1 and line 9 are.

	LDR R4, R2, 0 ; load line 8 to evict line 1 from L1 cache. R4 <= x8888
	LDR R4, R1, 2 ; load line 1 again to see if it wrote correctly to L2 cache. R4 <= x1115

; tested L2 writeback on write miss





	
inf:
	BRnzp inf


SEGMENT 256 DATA:
l1p:	DATA2 line1
l2p:	DATA2 line2
l3p:	DATA2 line3
l4p:	DATA2 line4
l5p:	DATA2 line5
l6p:	DATA2 line6
l7p:	DATA2 line7
l8p:	DATA2 line8
l9p:	DATA2 line9
lAp:	DATA2 lineA
lBp:	DATA2 lineB
lCp:	DATA2 lineC

SEGMENT 32 line0:
NOP
NOP

SEGMENT 128 line1:
X1:	DATA2 4x1111
NOP
NOP
NOP
NOP
NOP
NOP
NOP


SEGMENT 128 line2:
X2:	DATA2 4x2222
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 line3:
X3:	DATA2 4x3333
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 line4:
X4:	DATA2 4x4444
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 line5:
X5:	DATA2 4x5555
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 line6:
X6:	DATA2 4x6666
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 line7:
X7:	DATA2 4x7777
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 line8:
X8:	DATA2 4x8888
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 line9:
X9:	DATA2 4x9999
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 lineA:
XA:	DATA2 4xAAAA
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 lineB:
XB:	DATA2 4xBBBB
NOP
NOP
NOP
NOP
NOP
NOP
NOP

SEGMENT 128 lineC:
XC:	DATA2 4xCCCC
NOP
NOP
NOP
NOP
NOP
NOP
NOP
