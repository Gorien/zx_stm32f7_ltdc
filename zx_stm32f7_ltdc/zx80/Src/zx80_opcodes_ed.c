/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	The program emulating the work of the processor z80
 *	Attention! this part must be included in the main program code
 *
 */


/*IN B, (C)*/
static uint8_t op_ED_0x40(void)
{
	IN_PORT_TO_R(B, BC);
	return(12);
}

/*OUT (C), B*/
static uint8_t op_ED_0x41(void)
{
	OUT_PORT_FROM_R(BC, B);
	return(12);
}

/*SUBC HL, BC*/
static uint8_t op_ED_0x42(void)
{
	SUBC16(HL, BC);
	return(15);
}

/*LD (@), BC*/
static uint8_t op_ED_0x43(void)
{
	LD_ADDR_FROM_RP(BC);
	return(20);
}

/*NEG*/
static uint8_t op_ED_0x44(void)
{
	NEG();
	return(8);
}

/*RETN*/
static uint8_t op_ED_0x45(void)
{
	RETN();
	return(14);
}

/*IM 0*/
static uint8_t op_ED_0x46(void)
{
	IM_MODE(0);
	return(8);
}

/*LD I, A*/
static uint8_t op_ED_0x47(void)
{
	LD_R_TO_R(I, A);
	return(9);
}

/*IN C, (C)*/
static uint8_t op_ED_0x48(void)
{
	IN_PORT_TO_R(C, BC);
	return(12);
}

/*OUT (C), C*/
static uint8_t op_ED_0x49(void)
{
	OUT_PORT_FROM_R(BC, C);
	return(12);
}

/*ADDC HL, BC*/
static uint8_t op_ED_0x4a(void)
{
	ADDC16(HL, BC);
	return(15);
}

/*LD BC, (@)*/
static uint8_t op_ED_0x4b(void)
{
	LD_ADDR_TO_RP(BC);
	return(20);
}

/*NEG*/
static uint8_t op_ED_0x4c(void)
{
	NEG();
	return(8);
}

/*RETI*/
static uint8_t op_ED_0x4d(void)
{
	RETI();
	return(14);
}

/*LD R, A*/
static uint8_t op_ED_0x4f(void)
{
	LD_R_A();
	return(9);
}

/*IN D, (C)*/
static uint8_t op_ED_0x50(void)
{
	IN_PORT_TO_R(D, BC);
	return(12);
}

/*OUT (C), D*/
static uint8_t op_ED_0x51(void)
{
	OUT_PORT_FROM_R(BC, D);
	return(12);
}

/*SUBC HL, DE*/
static uint8_t op_ED_0x52(void)
{
	SUBC16(HL, DE);
	return(15);
}

/*LD (@), DE*/
static uint8_t op_ED_0x53(void)
{
	LD_ADDR_FROM_RP(DE);
	return(20);
}

/*NEG*/
static uint8_t op_ED_0x54(void)
{
	NEG();
	return(8);
}

/*RETN*/
static uint8_t op_ED_0x55(void)
{
	RETN();
	return(14);
}

/*IM 1*/
static uint8_t op_ED_0x56(void)
{
	IM_MODE(0);
	return(8);
}

/*LD A, I*/
static uint8_t op_ED_0x57(void)
{
	LD_A_I();
	return(9);
}

/*IN E, (C)*/
static uint8_t op_ED_0x58(void)
{
	IN_PORT_TO_R(E, BC);
	return(12);
}

/*OUT (C), E*/
static uint8_t op_ED_0x59(void)
{
	OUT_PORT_FROM_R(BC, E);
	return(12);
}

/*ADDC HL, DE*/
static uint8_t op_ED_0x5a(void)
{
	ADDC16(HL, DE);
	return(15);
}

/*LD DE, (@)*/
static uint8_t op_ED_0x5b(void)
{
	LD_ADDR_TO_RP(DE);
	return(20);
}

/*NEG*/
static uint8_t op_ED_0x5c(void)
{
	NEG();
	return(8);
}

/*RETI*/
static uint8_t op_ED_0x5d(void)
{
	RETI();
	return(14);
}

/*IM 2*/
static uint8_t op_ED_0x5e(void)
{
	IM_MODE(2);
	return(8);
}

/*LD A, R*/
static uint8_t op_ED_0x5f(void)
{
	LD_A_R();
	return(9);
}

/*IN H, (C)*/
static uint8_t op_ED_0x60(void)
{
	IN_PORT_TO_R(H, BC);
	return(12);
}

/*OUT (C), H*/
static uint8_t op_ED_0x61(void)
{
	OUT_PORT_FROM_R(BC, H);
	return(12);
}

/*SUBC HL, HL*/
static uint8_t op_ED_0x62(void)
{
	SUBC16(HL, HL);
	return(15);
}

/*LD (@), HL*/
static uint8_t op_ED_0x63(void)
{
	LD_ADDR_FROM_RP(HL);
	return(20);
}

/*NEG*/
static uint8_t op_ED_0x64(void)
{
	NEG();
	return(8);
}

/*RETN*/
static uint8_t op_ED_0x65(void)
{
	RETN();
	return(14);
}

/*RRD*/
static uint8_t op_ED_0x67(void)
{
	RRD();
	return(18);
}

/*IN L, (C)*/
static uint8_t op_ED_0x68(void)
{
	IN_PORT_TO_R(L, BC);
	return(12);
}

/*OUT (C), L*/
static uint8_t op_ED_0x69(void)
{
	OUT_PORT_FROM_R(BC, L);
	return(12);
}

/*ADDC HL, HL*/
static uint8_t op_ED_0x6a(void)
{
	ADDC16(HL, HL);
	return(15);
}

/*LD HL, (@)*/
static uint8_t op_ED_0x6b(void)
{
	LD_ADDR_TO_RP(HL);
	return(20);
}

/*NEG*/
static uint8_t op_ED_0x6c(void)
{
	NEG();
	return(8);
}

/*RETI*/
static uint8_t op_ED_0x6d(void)
{
	RETI();
	return(14);
}

/*RLD*/
static uint8_t op_ED_0x6f(void)
{
	RLD();
	return(18);
}

/*IN_F (C)*/
static uint8_t op_ED_0x70(void)
{
	IN_F(BC);
	return(12);
}

/*OUT (C), 0*/
static uint8_t op_ED_0x71(void)
{
	OUT_PORT_FROM_R(BC, 0);
	return(12);
}

/*SUBC HL, SP*/
static uint8_t op_ED_0x72(void)
{
	SUBC16(HL, SP);
	return(15);
}

/*LD (@), SP*/
static uint8_t op_ED_0x73(void)
{
	LD_ADDR_FROM_RP(SP);
	return(20);
}

/*NEG*/
static uint8_t op_ED_0x74(void)
{
	NEG();
	return(8);
}

/*RETN*/
static uint8_t op_ED_0x75(void)
{
	RETN();
	return(14);
}

/*IN A, (C)*/
static uint8_t op_ED_0x78(void)
{
	IN_PORT_TO_R(A, BC);
	return(12);
}

/*OUT (C), A*/
static uint8_t op_ED_0x79(void)
{
	OUT_PORT_FROM_R(BC, A);
	return(12);
}

/*ADDC HL, SP*/
static uint8_t op_ED_0x7a(void)
{
	ADDC16(HL, SP);
	return(15);
}

/*LD SP, (@)*/
static uint8_t op_ED_0x7b(void)
{
	LD_ADDR_TO_RP(SP);
	return(20);
}

/*NEG*/
static uint8_t op_ED_0x7c(void)
{
	NEG();
	return(8);
}

/*RETI*/
static uint8_t op_ED_0x7d(void)
{
	RETI();
	return(14);
}

/*LDI*/
static uint8_t op_ED_0xa0(void)
{
	LDI();
	return(16);
}

/*CPI*/
static uint8_t op_ED_0xa1(void)
{
	CPI();
	return(16);
}

/*INI*/
static uint8_t op_ED_0xa2(void)
{
	INI();
	return(16);
}

/*OUTI*/
static uint8_t op_ED_0xa3(void)
{
	OUTI();
	return(16);
}

/*LDD*/
static uint8_t op_ED_0xa8(void)
{
	LDD();
	return(16);
}

/*CPD*/
static uint8_t op_ED_0xa9(void)
{
	CPD();
	return(16);
}

/*IND*/
static uint8_t op_ED_0xaa(void)
{
	IND();
	return(16);
}

/*OUTD*/
static uint8_t op_ED_0xab(void)
{
	OUTD();
	return(16);
}

/*LDIR*/
static uint8_t op_ED_0xb0(void)
{
	LDIR();
}

/*CPIR*/
static uint8_t op_ED_0xb1(void)
{
	CPIR();
}

/*INIR*/
static uint8_t op_ED_0xb2(void)
{
	INIR();
}

/*OTIR*/
static uint8_t op_ED_0xb3(void)
{
	OTIR();
}

/*LDDR*/
static uint8_t op_ED_0xb8(void)
{
	LDDR();
}

/*CPDR*/
static uint8_t op_ED_0xb9(void)
{
	CPDR();
}

/*INDR*/
static uint8_t op_ED_0xba(void)
{
	INDR();
}

/*OTDR*/
static uint8_t op_ED_0xbb(void)
{
	OTDR();
}

/*NONI*/
static uint8_t noni_ED(void)
{
	INT_mask=0;
	return(8);
}

static uint8_t (*const opcode_ed [0x100])(void)={
	noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	op_ED_0x40, op_ED_0x41, op_ED_0x42, op_ED_0x43, op_ED_0x44, op_ED_0x45, op_ED_0x46, op_ED_0x47, op_ED_0x48, op_ED_0x49, op_ED_0x4a, op_ED_0x4b, op_ED_0x4c, op_ED_0x4d, op_ED_0x46, op_ED_0x4f,
	op_ED_0x50, op_ED_0x51, op_ED_0x52, op_ED_0x53, op_ED_0x54, op_ED_0x55, op_ED_0x56, op_ED_0x57, op_ED_0x58, op_ED_0x59, op_ED_0x5a, op_ED_0x5b, op_ED_0x5c, op_ED_0x5d, op_ED_0x5e, op_ED_0x5f,
	op_ED_0x60, op_ED_0x61, op_ED_0x62, op_ED_0x63, op_ED_0x64, op_ED_0x65, op_ED_0x46, op_ED_0x67, op_ED_0x68, op_ED_0x69, op_ED_0x6a, op_ED_0x6b, op_ED_0x6c, op_ED_0x6d, op_ED_0x46, op_ED_0x6f,
	op_ED_0x70, op_ED_0x71, op_ED_0x72, op_ED_0x73, op_ED_0x74, op_ED_0x75, op_ED_0x56, noni_ED   , op_ED_0x78, op_ED_0x79, op_ED_0x7a, op_ED_0x7b, op_ED_0x7c, op_ED_0x7d, op_ED_0x5e, noni_ED   ,
	noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	op_ED_0xa0, op_ED_0xa1, op_ED_0xa2, op_ED_0xa3, noni_ED   , noni_ED   , noni_ED   , noni_ED   , op_ED_0xa8, op_ED_0xa9, op_ED_0xaa, op_ED_0xab, noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	op_ED_0xb0, op_ED_0xb1, op_ED_0xb2, op_ED_0xb3, noni_ED   , noni_ED   , noni_ED   , noni_ED   , op_ED_0xb8, op_ED_0xb9, op_ED_0xba, op_ED_0xbb, noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   ,
	noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED   , noni_ED
};
