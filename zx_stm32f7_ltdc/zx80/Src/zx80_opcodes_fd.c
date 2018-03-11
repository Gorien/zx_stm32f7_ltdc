/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	The program emulating the work of the processor z80
 *	Attention! this part must be included in the main program code
 *
 */


/*ADD IY, BC*/
static uint8_t op_FD_0x09(void)
{
	ADD16(IY, BC);
	return(15);
}

/*ADD IY, DE*/
static uint8_t op_FD_0x19(void)
{
	ADD16(IY, DE);
	return(15);
}

/*LD IY, @*/
static uint8_t op_FD_0x21(void)
{
	LD_nn_TO_RP(IY);
	return(14);
}

/*LD (@), IY*/
static uint8_t op_FD_0x22(void)
{
	LD_ADDR_FROM_RP(IY);
	return(20);
}

/*INC IY*/
static uint8_t op_FD_0x23(void)
{
	INC16(IY);
	return(10);
}

/*INC IYH*/
static uint8_t op_FD_0x24(void)
{
	INC_R(IYH);
	return(8);
}

/*DEC IYH*/
static uint8_t op_FD_0x25(void)
{
	DEC_R(IYH);
	return(8);
}

/*LD IYH, #*/
static uint8_t op_FD_0x26(void)
{
	LD_n_TO_R(IYH);
	return(11);
}

/*ADD IY, IY*/
static uint8_t op_FD_0x29(void)
{
	ADD16(IY, IY);
	return(15);
}

/*LD IY, (@)*/
static uint8_t op_FD_0x2a(void)
{
	LD_ADDR_TO_RP(IY);
	return(20);
}

/*DEC IY*/
static uint8_t op_FD_0x2b(void)
{
	DEC16(IY);
	return(10);
}

/*INC IYL*/
static uint8_t op_FD_0x2c(void)
{
	INC_R(IYL);
	return(8);
}

/*DEC IYL*/
static uint8_t op_FD_0x2d(void)
{
	DEC_R(IYL);
	return(8);
}

/*LD IYL, #*/
static uint8_t op_FD_0x2e(void)
{
	LD_n_TO_R(IYL);
	return(11);
}

/*INC (IY+$)*/
static uint8_t op_FD_0x34(void)
{
	INC_ADDR_RP_AND_OFSET(IY);
	return(23);
}

/*DEC (IY+$)*/
static uint8_t op_FD_0x35(void)
{
	DEC_ADDR_RP_AND_OFSET(IY);
	return(23);
}

/*LD (IY+$), #*/
static uint8_t op_FD_0x36(void)
{
	LD_n_TO_ADDR_RP_AND_OFFSET(IY);
	return(19);
}

/*ADD IY, SP*/
static uint8_t op_FD_0x39(void)
{
	ADD16(IY, SP);
	return(15);
}

/*LD B, IYH*/
static uint8_t op_FD_0x44(void)
{
	LD_R_TO_R(B, IYH);
	return(8);
}

/*LD B, IYL*/
static uint8_t op_FD_0x45(void)
{
	LD_R_TO_R(B, IYL);
	return(8);
}

/*LD B, (IY+$)*/
static uint8_t op_FD_0x46(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(B, IY);
	return(19);
}

/*LD C, IYH*/
static uint8_t op_FD_0x4c(void)
{
	LD_R_TO_R(C, IYH);
	return(8);
}

/*LD C, IYL*/
static uint8_t op_FD_0x4d(void)
{
	LD_R_TO_R(C, IYL);
	return(8);
}

/*LD C, (IY+$)*/
static uint8_t op_FD_0x4e(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(C, IY);
	return(19);
}

/*LD D, IYH*/
static uint8_t op_FD_0x54(void)
{
	LD_R_TO_R(D, IYH);
	return(8);
}

/*LD D, IYL*/
static uint8_t op_FD_0x55(void)
{
	LD_R_TO_R(D, IYL);
	return(8);
}

/*LD D, (IY+$)*/
static uint8_t op_FD_0x56(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(D, IY);
	return(19);
}

/*LD E, IYH*/
static uint8_t op_FD_0x5c(void)
{
	LD_R_TO_R(E, IYH);
	return(8);
}

/*LD E, IYL*/
static uint8_t op_FD_0x5d(void)
{
	LD_R_TO_R(E, IYL);
	return(8);
}

/*LD E, (IY+$)*/
static uint8_t op_FD_0x5e(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(E, IY);
	return(19);
}

/*LD IYH, B*/
static uint8_t op_FD_0x60(void)
{
	LD_R_TO_R(IYH, B);
	return(8);
}

/*LD IYH, C*/
static uint8_t op_FD_0x61(void)
{
	LD_R_TO_R(IYH, C);
	return(8);
}

/*LD IYH, D*/
static uint8_t op_FD_0x62(void)
{
	LD_R_TO_R(IYH, D);
	return(8);
}

/*LD IYH, E*/
static uint8_t op_FD_0x63(void)
{
	LD_R_TO_R(IYH, E);
	return(8);
}

/*LD IYH, IYH*/
static uint8_t op_FD_0x64(void)
{
	LD_R_TO_R(IYH, IYH);
	return(8);
}

/*LD IYH, IYL*/
static uint8_t op_FD_0x65(void)
{
	LD_R_TO_R(IYH, IYL);
	return(8);
}

/*LD H, (IY+$)*/
static uint8_t op_FD_0x66(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(H, IY);
	return(19);
}

/*LD IYH, A*/
static uint8_t op_FD_0x67(void)
{
	LD_R_TO_R(IYH, A);
	return(8);
}

/*LD IYL, B*/
static uint8_t op_FD_0x68(void)
{
	LD_R_TO_R(IYL, B);
	return(8);
}

/*LD IYL, C*/
static uint8_t op_FD_0x69(void)
{
	LD_R_TO_R(IYL, C);
	return(8);
}

/*LD IYL, D*/
static uint8_t op_FD_0x6a(void)
{
	LD_R_TO_R(IYL, D);
	return(8);
}

/*LD IYL, E*/
static uint8_t op_FD_0x6b(void)
{
	LD_R_TO_R(IYL, E);
	return(8);
}

/*LD IYL, IYH*/
static uint8_t op_FD_0x6c(void)
{
	LD_R_TO_R(IYL, IYH);
	return(8);
}

/*LD IYL, IYL*/
static uint8_t op_FD_0x6d(void)
{
	LD_R_TO_R(IYL, IYL);
	return(8);
}

/*LD L, (IY+$)*/
static uint8_t op_FD_0x6e(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(L, IY);
	return(19);
}

/*LD IYL, A*/
static uint8_t op_FD_0x6f(void)
{
	LD_R_TO_R(IYL, A);
	return(8);
}

/*LD (IY+$), B*/
static uint8_t op_FD_0x70(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IY, B);
	return(19);
}

/*LD (IY+$), C*/
static uint8_t op_FD_0x71(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IY, C);
	return(19);
}

/*LD (IY+$), D*/
static uint8_t op_FD_0x72(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IY, D);
	return(19);
}

/*LD (IY+$), E*/
static uint8_t op_FD_0x73(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IY, E);
	return(19);
}

/*LD (IY+$), H*/
static uint8_t op_FD_0x74(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IY, H);
	return(19);
}

/*LD (IY+$), L*/
static uint8_t op_FD_0x75(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IY, L);
	return(19);
}

/*LD (IY+$), A*/
static uint8_t op_FD_0x77(void)
{
	LD_ADDR_RP_AND_OFFSET_FROM_R(IY, A);
	return(19);
}

/*LD A, IYH*/
static uint8_t op_FD_0x7c(void)
{
	LD_R_TO_R(A, IYH);
	return(8);
}

/*LD A, IYL*/
static uint8_t op_FD_0x7d(void)
{
	LD_R_TO_R(A, IYL);
	return(8);
}

/*LD A, (IY+$)*/
static uint8_t op_FD_0x7e(void)
{
	LD_ADDR_RP_AND_OFFSET_TO_R(A, IY);
	return(19);
}

/*ADD A, IYH*/
static uint8_t op_FD_0x84(void)
{
	ADD_A_AND_R(IYH);
	return(8);
}

/*ADD A, IYL*/
static uint8_t op_FD_0x85(void)
{
	ADD_A_AND_R(IYL);
	return(8);
}

/*ADD A, (IY+$)*/
static uint8_t op_FD_0x86(void)
{
	ADD_A_AND_RP_AND_OFFSET(IY);
	return(19);
}

/*ADDC A, IYH*/
static uint8_t op_FD_0x8c(void)
{
	ADC_A_AND_R(IYH);
	return(8);
}

/*ADDC A, IYL*/
static uint8_t op_FD_0x8d(void)
{
	ADC_A_AND_R(IYL);
	return(8);
}

/*ADDC A, (IY+$)*/
static uint8_t op_FD_0x8e(void)
{
	ADC_A_AND_ADDR_RP_AND_OFFSET(IY);
	return(19);
}

/*SUB IYH*/
static uint8_t op_FD_0x94(void)
{
	SUB_A_AND_R(IYH);
	return(8);
}

/*SUB IYL*/
static uint8_t op_FD_0x95(void)
{
	SUB_A_AND_R(IYL);
	return(8);
}

/*SUB (IY+$)*/
static uint8_t op_FD_0x96(void)
{
	SUB_A_AND_RP_AND_OFFSET(IY);
	return(19);
}

/*SUBC A, IYH*/
static uint8_t op_FD_0x9c(void)
{
	SBC_A_AND_R(IYH);
	return(8);
}

/*SUBC A, IYL*/
static uint8_t op_FD_0x9d(void)
{
	SBC_A_AND_R(IYL);
	return(8);
}

/*SUBC A, (IY+$)*/
static uint8_t op_FD_0x9e(void)
{
	SBC_A_AND_ADDR_RP_AND_OFFSET(IY);
	return(19);
}

/*AND IYH*/
static uint8_t op_FD_0xa4(void)
{
	AND(IYH);
	return(8);
}

/*AND IYL*/
static uint8_t op_FD_0xa5(void)
{
	AND(IYL);
	return(8);
}

/*AND (IY+$)*/
static uint8_t op_FD_0xa6(void)
{
	AND_ADDR_RP_AND_OFFSET(IY);
	return(19);
}

/*XOR IYH*/
static uint8_t op_FD_0xac(void)
{
	XOR(IYH);
	return(8);
}

/*XOR IYL*/
static uint8_t op_FD_0xad(void)
{
	XOR(IYL);
	return(8);
}

/*XOR (IY+$)*/
static uint8_t op_FD_0xae(void)
{
	XOR_ADDR_RP_AND_OFFSET(IY);
	return(19);
}

/*OR IYH*/
static uint8_t op_FD_0xb4(void)
{
	OR(IYH);
	return(8);
}

/*OR IYL*/
static uint8_t op_FD_0xb5(void)
{
	OR(IYL);
	return(8);
}

/*OR (IY+$)*/
static uint8_t op_FD_0xb6(void)
{
	OR_ADDR_RP_AND_OFFSET(IY);
	return(19);
}

/*CP IYH*/
static uint8_t op_FD_0xbc(void)
{
	CP(IYH);
	return(8);
}

/*CP IYL*/
static uint8_t op_FD_0xbd(void)
{
	CP(IYL);
	return(8);
}

/*CP (IY+$)*/
static uint8_t op_FD_0xbe(void)
{
	CP_AND_ADDR_RP_AND_OFFSET(IY);
	return(19);
}

/*prefix FDCB*/
static uint8_t op_FD_0xcb(void)
{
	d.u=memory[PC];
	PC+=1;
	opcode=memory[PC];
	PC+=1;
	return(*opcode_fdcb[opcode])();
}

/*POP IY*/
static uint8_t op_FD_0xe1(void)
{
	POP(IY);
	return(14);
}

/*EX (SP), IY*/
static uint8_t op_FD_0xe3(void)
{
	EX_MPTR(IY);
	return(23);
}

/*PUSH IY*/
static uint8_t op_FD_0xe5(void)
{
	PUSH(IY);
	return(15);
}

/*JP IY*/
static uint8_t op_FD_0xe9(void)
{
	JP(IY);
	return(8);
}

/*LD SP, IY*/
static uint8_t op_FD_0xf9(void)
{
	LD_RP_TO_RP(SP, IY);
	return(10);
}

/*NONI*/
static uint8_t non_FD (void)
{
	INT_mask=0;
	return(8);
}

static uint8_t (*const opcode_fd[0x100])(void)={
	non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x09, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x19, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    ,
	non_FD    , op_FD_0x21, op_FD_0x22, op_FD_0x23, op_FD_0x24, op_FD_0x25, op_FD_0x26, non_FD    , non_FD    , op_FD_0x29, op_FD_0x2a, op_FD_0x2b, op_FD_0x2c, op_FD_0x2d, op_FD_0x2e, non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x34, op_FD_0x35, op_FD_0x36, non_FD    , non_FD    , op_FD_0x39, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x44, op_FD_0x45, op_FD_0x46, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x4c, op_FD_0x4d, op_FD_0x4e, non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x54, op_FD_0x55, op_FD_0x56, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x5c, op_FD_0x5d, op_FD_0x5e, non_FD    ,
	op_FD_0x60, op_FD_0x61, op_FD_0x62, op_FD_0x63, op_FD_0x64, op_FD_0x65, op_FD_0x66, op_FD_0x67, op_FD_0x68, op_FD_0x69, op_FD_0x6a, op_FD_0x6b, op_FD_0x6c, op_FD_0x6d, op_FD_0x6e, op_FD_0x6f,
	op_FD_0x70, op_FD_0x71, op_FD_0x72, op_FD_0x73, op_FD_0x74, op_FD_0x75, non_FD    , op_FD_0x77, non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x7c, op_FD_0x7d, op_FD_0x7e, non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x84, op_FD_0x85, op_FD_0x86, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x8c, op_FD_0x8d, op_FD_0x8e, non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x94, op_FD_0x95, op_FD_0x96, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0x9c, op_FD_0x9d, op_FD_0x9e, non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0xa4, op_FD_0xa5, op_FD_0xa6, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0xac, op_FD_0xad, op_FD_0xae, non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0xb4, op_FD_0xb5, op_FD_0xb6, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0xbc, op_FD_0xbd, op_FD_0xbe, non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0xcb, non_FD    , non_FD    , non_FD    , non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    ,
	non_FD    , op_FD_0xe1, non_FD    , op_FD_0xe3, non_FD    , op_FD_0xe5, non_FD    , non_FD    , non_FD    , op_FD_0xe9, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    ,
	non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , op_FD_0xf9, non_FD    , non_FD    , non_FD    , non_FD    , non_FD    , non_FD
};
