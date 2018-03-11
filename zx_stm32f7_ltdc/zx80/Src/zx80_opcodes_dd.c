/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	The program emulating the work of the processor z80
 *	Attention! this part must be included in the main program code
 *
 */


/*ADD IX, BC*/
static uint8_t op_DD_0x09(void)
{
	ADD16(IX, BC);
	return(15);
}

/*ADD IX, DE*/
static uint8_t op_DD_0x19(void)
{
	ADD16(IX, DE);
	return(15);
}

/*LD IX, @*/
static uint8_t op_DD_0x21(void)
{
	LD_nn_TO_RP(IX);
	return(14);
}

/*LD (@), IX*/
static uint8_t op_DD_0x22(void)
{
	LD_ADDR_FROM_RP(IX);
	return(20);
}

/*INC IX*/
static uint8_t op_DD_0x23(void)
{
	INC16(IX);
	return(10);
}

/*INC IXH*/
static uint8_t op_DD_0x24(void)
{
	INC_R(IXH);
	return(8);
}

/*DEC IXH*/
static uint8_t op_DD_0x25(void)
{
	DEC_R(IXH);
	return(8);
}

/*LD IXH, #*/
static uint8_t op_DD_0x26(void)
{
	LD_n_TO_R(IXH);
	return(11);
}

/*ADD IX, IX*/
static uint8_t op_DD_0x29(void)
{
	ADD16(IX, IX);
	return(15);
}

/*LD IX, (@)*/
static uint8_t op_DD_0x2a(void)
{
	LD_ADDR_TO_RP(IX);
	return(20);
}

/*DEC IX*/
static uint8_t op_DD_0x2b(void)
{
	DEC16(IX);
	return(10);
}

/*INC IXL*/
static uint8_t op_DD_0x2c(void)
{
	INC_R(IXL);
	return(8);
}

/*DEC IXL*/
static uint8_t op_DD_0x2d(void)
{
	DEC_R(IXL);
	return(8);
}

/*LD IXL, #*/
static uint8_t op_DD_0x2e(void)
{
	LD_n_TO_R(IXL);
	return(11);
}

/*INC (IX+$)*/
static uint8_t op_DD_0x34(void)
{
	INC_ADDR_RP_AND_OFSET(IX);
	return(23);
}

/*DEC (IX+$)*/
static uint8_t op_DD_0x35(void)
{
	DEC_ADDR_RP_AND_OFSET(IX);
	return(23);
}

/*LD (IX+$), #*/
static uint8_t op_DD_0x36(void)
{
	LD_n_TO_ADDR_RP_AND_OFFSET(IX);
	return(19);
}

/*ADD IX, SP*/
static uint8_t op_DD_0x39(void)
{
	ADD16(IX, SP);
	return(15);
}

/*LD B, IXH*/
static uint8_t op_DD_0x44(void)
{
	LD_R_TO_R(B, IXH);
	return(8);
}

/*LD B, IXL*/
static uint8_t op_DD_0x45(void)
{
	LD_R_TO_R(B, IXL);
	return(8);
}

/*LD B, (IX+$)*/
static uint8_t op_DD_0x46(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(B, IX);
	return(19);
}

/*LD C, IXH*/
static uint8_t op_DD_0x4c(void)
{
	LD_R_TO_R(C, IXH);
	return(8);
}

/*LD C, IXL*/
static uint8_t op_DD_0x4d(void)
{
	LD_R_TO_R(C, IXL);
	return(8);
}

/*LD C, (IX+$)*/
static uint8_t op_DD_0x4e(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(C, IX);
	return(19);
}

/*LD D, IXH*/
static uint8_t op_DD_0x54(void)
{
	LD_R_TO_R(D, IXH);
	return(8);
}

/*LD D, IXL*/
static uint8_t op_DD_0x55(void)
{
	LD_R_TO_R(D, IXL);
	return(8);
}

/*LD D, (IX+$)*/
static uint8_t op_DD_0x56(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(D, IX);
	return(19);
}

/*LD E, IXH*/
static uint8_t op_DD_0x5c(void)
{
	LD_R_TO_R(E, IXH);
	return(8);
}

/*LD E, IXL*/
static uint8_t op_DD_0x5d(void)
{
	LD_R_TO_R(E, IXL);
	return(8);
}

/*LD E, (IX+$)*/
static uint8_t op_DD_0x5e(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(E, IX);
	return(19);
}

/*LD IXH, B*/
static uint8_t op_DD_0x60(void)
{
	LD_R_TO_R(IXH, B);
	return(8);
}

/*LD IXH, C*/
static uint8_t op_DD_0x61(void)
{
	LD_R_TO_R(IXH, C);
	return(8);
}

/*LD IXH, D*/
static uint8_t op_DD_0x62(void)
{
	LD_R_TO_R(IXH, D);
	return(8);
}

/*LD IXH, E*/
static uint8_t op_DD_0x63(void)
{
	LD_R_TO_R(IXH, E);
	return(8);
}

/*LD IXH, IXH*/
static uint8_t op_DD_0x64(void)
{
	LD_R_TO_R(IXH, IXH);
	return(8);
}

/*LD IXH, IXL*/
static uint8_t op_DD_0x65(void)
{
	LD_R_TO_R(IXH, IXL);
	return(8);
}

/*LD H, (IX+$)*/
static uint8_t op_DD_0x66(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(H, IX);
	return(19);
}

/*LD IXH, A*/
static uint8_t op_DD_0x67(void)
{
	LD_R_TO_R(IXH, A);
	return(8);
}

/*LD IXL, B*/
static uint8_t op_DD_0x68(void)
{
	LD_R_TO_R(IXL, B);
	return(8);
}

/*LD IXL, C*/
static uint8_t op_DD_0x69(void)
{
	LD_R_TO_R(IXL, C);
	return(8);
}

/*LD IXL, D*/
static uint8_t op_DD_0x6a(void)
{
	LD_R_TO_R(IXL, D);
	return(8);
}

/*LD IXL, E*/
static uint8_t op_DD_0x6b(void)
{
	LD_R_TO_R(IXL, E);
	return(8);
}

/*LD IXL, IXH*/
static uint8_t op_DD_0x6c(void)
{
	LD_R_TO_R(IXL, IXH);
	return(8);
}

/*LD IXL, IXL*/
static uint8_t op_DD_0x6d(void)
{
	LD_R_TO_R(IXL, IXL);
	return(8);
}

/*LD L, (IX+$)*/
static uint8_t op_DD_0x6e(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(L, IX);
	return(19);
}

/*LD IXL, A*/
static uint8_t op_DD_0x6f(void)
{
	LD_R_TO_R(IXL, A);
	return(8);
}

/*LD (IX+$), B*/
static uint8_t op_DD_0x70(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IX, B);
	return(19);
}

/*LD (IX+$), C*/
static uint8_t op_DD_0x71(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IX, C);
	return(19);
}

/*LD (IX+$), D*/
static uint8_t op_DD_0x72(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IX, D);
	return(19);
}

/*LD (IX+$), E*/
static uint8_t op_DD_0x73(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IX, E);
	return(19);
}

/*LD (IX+$), H*/
static uint8_t op_DD_0x74(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IX, H);
	return(19);
}

/*LD (IX+$), L*/
static uint8_t op_DD_0x75(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IX, L);
	return(19);
}

/*LD (IX+$), A*/
static uint8_t op_DD_0x77(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IX, A);
	return(19);
}

/*LD A, IXH*/
static uint8_t op_DD_0x7c(void)
{
	LD_R_TO_R(A, IXH);
	return(8);
}

/*LD A, IXL*/
static uint8_t op_DD_0x7d(void)
{
	LD_R_TO_R(A, IXL);
	return(8);
}

/*LD A, (IX+$)*/
static uint8_t op_DD_0x7e(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(A, IX);
	return(19);
}

/*ADD A, IXH*/
static uint8_t op_DD_0x84(void)
{
	ADD_A_AND_R(IXH);
	return(8);
}

/*ADD A, IXL*/
static uint8_t op_DD_0x85(void)
{
	ADD_A_AND_R(IXL);
	return(8);
}

/*ADD A, (IX+$)*/
static uint8_t op_DD_0x86(void)
{
	ADD_A_AND_RP_AND_OFFSET(IX);
	return(19);
}

/*ADDC A, IXH*/
static uint8_t op_DD_0x8c(void)
{
	ADC_A_AND_R(IXH);
	return(8);
}

/*ADDC A, IXL*/
static uint8_t op_DD_0x8d(void)
{
	ADC_A_AND_R(IXL);
	return(8);
}

/*ADDC A, (IX+$)*/
static uint8_t op_DD_0x8e(void)
{
	ADC_A_AND_ADDR_RP_AND_OFFSET(IX);
	return(19);
}

/*SUB IXH*/
static uint8_t op_DD_0x94(void)
{
	SUB_A_AND_R(IXH);
	return(8);
}

/*SUB IXL*/
static uint8_t op_DD_0x95(void)
{
	SUB_A_AND_R(IXL);
	return(8);
}

/*SUB (IX+$)*/
static uint8_t op_DD_0x96(void)
{
	SUB_A_AND_RP_AND_OFFSET(IX);
	return(19);
}

/*SUBC A, IXH*/
static uint8_t op_DD_0x9c(void)
{
	SBC_A_AND_R(IXH);
	return(8);
}

/*SUBC A, IXL*/
static uint8_t op_DD_0x9d(void)
{
	SBC_A_AND_R(IXL);
	return(8);
}

/*SUBC A, (IX+$)*/
static uint8_t op_DD_0x9e(void)
{
	SBC_A_AND_ADDR_RP_AND_OFFSET(IX);
	return(19);
}

/*AND IXH*/
static uint8_t op_DD_0xa4(void)
{
	AND(IXH);
	return(8);
}

/*AND IXL*/
static uint8_t op_DD_0xa5(void)
{
	AND(IXL);
	return(8);
}

/*AND (IX+$)*/
static uint8_t op_DD_0xa6(void)
{
	AND_ADDR_RP_AND_OFFSET(IX);
	return(19);
}

/*XOR IXH*/
static uint8_t op_DD_0xac(void)
{
	XOR(IXH);
	return(8);
}

/*XOR IXL*/
static uint8_t op_DD_0xad(void)
{
	XOR(IXL);
	return(8);
}

/*XOR (IX+$)*/
static uint8_t op_DD_0xae(void)
{
	XOR_ADDR_RP_AND_OFFSET(IX);
	return(19);
}

/*OR IXH*/
static uint8_t op_DD_0xb4(void)
{
	OR(IXH);
	return(8);
}

/*OR IXL*/
static uint8_t op_DD_0xb5(void)
{
	OR(IXL);
	return(8);
}

/*OR (IX+$)*/
static uint8_t op_DD_0xb6(void)
{
	OR_ADDR_RP_AND_OFFSET(IX);
	return(19);
}

/*CP IXH*/
static uint8_t op_DD_0xbc(void)
{
	CP(IXH);
	return(8);
}

/*CP IXL*/
static uint8_t op_DD_0xbd(void)
{
	CP(IXL);
	return(8);
}

/*CP (IX+$)*/
static uint8_t op_DD_0xbe(void)
{
	CP_AND_ADDR_RP_AND_OFFSET(IX);
	return(19);
}

/*prefix DDCB*/
static uint8_t op_DD_0xcb(void)
{
	d.u=memory[PC];
	PC+=1;
	opcode=memory[PC];
	PC+=1;
	return(*opcode_ddcb[opcode])();
}

/*POP IX*/
static uint8_t op_DD_0xe1(void)
{
	POP(IX);
	return(14);
}

/*EX (SP), IX*/
static uint8_t op_DD_0xe3(void)
{
	EX_MPTR(IX);
	return(23);
}

/*PUSH IX*/
static uint8_t op_DD_0xe5(void)
{
	PUSH(IX);
	return(15);
}

/*JP IX*/
static uint8_t op_DD_0xe9(void)
{
	JP(IX);
	return(8);
}

/*LD SP, IX*/
static uint8_t op_DD_0xf9(void)
{
	LD_RP_TO_RP(SP, IX);
	return(10);
}



/*NONI*/
static uint8_t non_DD (void)
{
	INT_mask=0;
	return(8);
}

static uint8_t (*const opcode_dd[0x100])(void)={
	non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x09, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x19, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    ,
	non_DD    , op_DD_0x21, op_DD_0x22, op_DD_0x23, op_DD_0x24, op_DD_0x25, op_DD_0x26, non_DD    , non_DD    , op_DD_0x29, op_DD_0x2a, op_DD_0x2b, op_DD_0x2c, op_DD_0x2d, op_DD_0x2e, non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x34, op_DD_0x35, op_DD_0x36, non_DD    , non_DD    , op_DD_0x39, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x44, op_DD_0x45, op_DD_0x46, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x4c, op_DD_0x4d, op_DD_0x4e, non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x54, op_DD_0x55, op_DD_0x56, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x5c, op_DD_0x5d, op_DD_0x5e, non_DD    ,
	op_DD_0x60, op_DD_0x61, op_DD_0x62, op_DD_0x63, op_DD_0x64, op_DD_0x65, op_DD_0x66, op_DD_0x67, op_DD_0x68, op_DD_0x69, op_DD_0x6a, op_DD_0x6b, op_DD_0x6c, op_DD_0x6d, op_DD_0x6e, op_DD_0x6f,
	op_DD_0x70, op_DD_0x71, op_DD_0x72, op_DD_0x73, op_DD_0x74, op_DD_0x75, non_DD    , op_DD_0x77, non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x7c, op_DD_0x7d, op_DD_0x7e, non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x84, op_DD_0x85, op_DD_0x86, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x8c, op_DD_0x8d, op_DD_0x8e, non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x94, op_DD_0x95, op_DD_0x96, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0x9c, op_DD_0x9d, op_DD_0x9e, non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0xa4, op_DD_0xa5, op_DD_0xa6, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0xac, op_DD_0xad, op_DD_0xae, non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0xb4, op_DD_0xb5, op_DD_0xb6, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0xbc, op_DD_0xbd, op_DD_0xbe, non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0xcb, non_DD    , non_DD    , non_DD    , non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    ,
	non_DD    , op_DD_0xe1, non_DD    , op_DD_0xe3, non_DD    , op_DD_0xe5, non_DD    , non_DD    , non_DD    , op_DD_0xe9, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    ,
	non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , op_DD_0xf9, non_DD    , non_DD    , non_DD    , non_DD    , non_DD    , non_DD
};
