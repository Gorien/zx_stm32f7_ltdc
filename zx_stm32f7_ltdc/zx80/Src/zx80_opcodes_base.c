/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	The program emulating the work of the processor z80
 *	Attention! this part must be included in the main program code
 *
 */


/*NOP*/
static uint8_t op_0x00(void)
{
	return(4);
}

/*LD BC, @*/
static uint8_t op_0x01(void)
{
	LD_nn_TO_RP(BC);
	return(10);
}

/*LD (BC), A*/
static uint8_t op_0x02(void)
{
	LD_A_TO_ADDR_RP_MPTR(BC);
	return(7);
}

/*INC BC*/
static uint8_t op_0x03(void)
{
	INC16(BC);
	return(6);
}

/*INC B*/
static uint8_t op_0x04(void)
{
	INC_R(B);
	return(4);
}

/*DEC B*/
static uint8_t op_0x05(void)
{
	DEC_R(B);
	return(4);
}

/*LD B, #*/
static uint8_t op_0x06(void)
{
	LD_n_TO_R(B);
	return(7);
}

/*RLCA*/
static uint8_t op_0x07(void)
{
	RLCA();
	return(4);
}

/*EX AF, AF'*/
static uint8_t op_0x08(void)
{
	EX(AF, AF_);
	return(4);
}

/*ADD HL, BC*/
static uint8_t op_0x09(void)
{
	ADD16(HL, BC);
	return(11);
}

/*LD A, (BC)*/
static uint8_t op_0x0a(void)
{
	LD_A_FROM_ADDR_RP_MPTR(BC);
	return(7);
}

/*DEC BC*/
static uint8_t op_0x0b(void)
{
	DEC16(BC);
	return(6);
}

/*INC C*/
static uint8_t op_0x0c(void)
{
	INC_R(C);
	return(4);
}

/*DEC C*/
static uint8_t op_0x0d(void)
{
	DEC_R(C);
	return(4);
}

/*LD C, #*/
static uint8_t op_0x0e(void)
{
	LD_n_TO_R(C);
	return(7);
}

/*RRCA*/
static uint8_t op_0x0f(void)
{
	RRCA();
	return(4);
}

/*DJNZ %*/
static uint8_t op_0x10(void)
{
	d.u=memory[PC];
	PC+=1;
	B--;
	if(B)
	{
		JR(d.s);
		return(13);
	}
	else
	{
		return(8);
	}
}

/*LD DE, @*/
static uint8_t op_0x11(void)
{
	LD_nn_TO_RP(DE);
	return(10);
}

/*LD (DE), A*/
static uint8_t op_0x12(void)
{
	LD_A_TO_ADDR_RP_MPTR(DE);
	return(7);
}

/*INC DE*/
static uint8_t op_0x13(void)
{
	INC16(DE);
	return(6);
}

/*INC D*/
static uint8_t op_0x14(void)
{
	INC_R(D);
	return(4);
}

/*DEC D*/
static uint8_t op_0x15(void)
{
	DEC_R(D);
	return(4);
}

/*LD D, #*/
static uint8_t op_0x16(void)
{
	LD_n_TO_R(D);
	return(7);
}

/*RLA*/
static uint8_t op_0x17(void)
{
	RLA();
	return(4);
}

/*JR %*/
static uint8_t op_0x18(void)
{
	d.u=memory[PC];
	PC+=1;
	JR(d.s);
	return(12);
}

/*ADD HL, DE*/
static uint8_t op_0x19(void)
{
	ADD16(HL, DE);
	return(11);
}

/*LD A,(DE)*/
static uint8_t op_0x1a(void)
{
	LD_A_FROM_ADDR_RP_MPTR(DE);
	return(7);
}

/*DEC DE*/
static uint8_t op_0x1b(void)
{
	DEC16(DE);
	return(6);
}

/*INC E*/
static uint8_t op_0x1c(void)
{
	INC_R(E);
	return(4);
}

/*DEC E*/
static uint8_t op_0x1d(void)
{
	DEC_R(E);
	return(4);
}

/*LD E, #*/
static uint8_t op_0x1e(void)
{
	LD_n_TO_R(E);
	return(7);
}

/*RRA*/
static uint8_t op_0x1f(void)
{
	RRA();
	return(4);
}

/*JR NZ, %*/
static uint8_t op_0x20(void)
{
	d.u=memory[PC];
	PC+=1;
	if(!(F&FLAG_Z))
	{
		JR(d.s);
		return(12);
	}
	else
	{
		return(7);
	}
}

/*LD HL, @*/
static uint8_t op_0x21(void)
{
	LD_nn_TO_RP(HL);
	return(10);
}

/*LD (@), HL*/
static uint8_t op_0x22(void)
{
	LD_ADDR_FROM_RP(HL);
	return(16);
}

/*INC HL*/
static uint8_t op_0x23(void)
{
	INC16(HL);
	return(6);
}

/*INC H*/
static uint8_t op_0x24(void)
{
	INC_R(H);
	return(4);
}

/*DEC H*/
static uint8_t op_0x25(void)
{
	DEC_R(H);
	return(4);
}

/*LD H, #*/
static uint8_t op_0x26(void)
{
	LD_n_TO_R(H);
	return(7);
}

/*DAA*/
static uint8_t op_0x27(void)
{
	DAA();
	return(4);
}

/*JR Z, %*/
static uint8_t op_0x28(void)
{
	d.u=memory[PC];
	PC+=1;
	if(F&FLAG_Z)
	{
		JR(d.s);
		return(12);
	}
	else
	{
		return(7);
	}
}

/*ADD HL, HL*/
static uint8_t op_0x29(void)
{
	ADD16(HL, HL);
	return(11);
}

/*LD HL, (@)*/
static uint8_t op_0x2a(void)
{
	LD_ADDR_TO_RP(HL);
	return(16);
}

/*DEC HL*/
static uint8_t op_0x2b(void)
{
	DEC16(HL);
	return(6);
}

/*INC L*/
static uint8_t op_0x2c(void)
{
	INC_R(L);
	return(4);
}

/*DEC L*/
static uint8_t op_0x2d(void)
{
	DEC_R(L);
	return(4);
}

/*LD L, #*/
static uint8_t op_0x2e(void)
{
	LD_n_TO_R(L);
	return(7);
}

/*CPL*/
static uint8_t op_0x2f(void)
{
	CPL();
	return(4);
}

/*JR NC, %*/
static uint8_t op_0x30(void)
{
	d.u=memory[PC];
	PC+=1;
	if(!(F&FLAG_C))
	{
		JR(d.s);
		return(12);
	}
	else
	{
		return(7);
	}
}

/*LD SP, @*/
static uint8_t op_0x31(void)
{
	LD_nn_TO_RP(SP);
	return(10);
}

/*LD (@), A*/
static uint8_t op_0x32(void)
{
	LD_A_TO_ADDR_MPTR;
	return(13);
}

/*INC SP*/
static uint8_t op_0x33(void)
{
	INC16(SP);
	return(6);
}

/*INC (HL)*/
static uint8_t op_0x34(void)
{
	INC_ADDR_HL;
	return(11);
}

/*DEC (HL)*/
static uint8_t op_0x35(void)
{
	DEC_ADDR_HL;
	return(11);
}

/*LD (HL), #*/
static uint8_t op_0x36(void)
{
	LD_n_TO_ADDR_HL;
	return(10);
}

/*SCF*/
static uint8_t op_0x37(void)
{
	SCF();
	return(4);
}

/*JR C, %*/
static uint8_t op_0x38(void)
{
	d.u=memory[PC];
	PC+=1;
	if(F&FLAG_C)
	{
		JR(d.s);
		return(12);
	}
	else
	{
		return(7);
	}
}

/*ADD HL, SP*/
static uint8_t op_0x39(void)
{
	ADD16(HL, SP);
	return(11);
}

/*LD A, (@)*/
static uint8_t op_0x3a(void)
{
	LD_A_FROM_ADDR_MPTR;
	return(13);
}

/*DEC SP*/
static uint8_t op_0x3b(void)
{
	DEC16(SP);
	return(6);
}

/*INC A*/
static uint8_t op_0x3c(void)
{
	INC_R(A);
	return(4);
}

/*DEC A*/
static uint8_t op_0x3d(void)
{
	DEC_R(A);
	return(4);
}

/*LD A, #*/
static uint8_t op_0x3e(void)
{
	LD_n_TO_R(A);
	return(7);
}

/*CCF*/
static uint8_t op_0x3f(void)
{
	CCF();
	return(4);
}

/*LD B, B*/
static uint8_t op_0x40(void)
{
	LD_R_TO_R(B, B);
	return(4);
}

/*LD B, C*/
static uint8_t op_0x41(void)
{
	LD_R_TO_R(B, C);
	return(4);
}

/*LD B, D*/
static uint8_t op_0x42(void)
{
	LD_R_TO_R(B, D);
	return(4);
}

/*LD B, E*/
static uint8_t op_0x43(void)
{
	LD_R_TO_R(B, E);
	return(4);
}

/*LD B, H*/
static uint8_t op_0x44(void)
{
	LD_R_TO_R(B, H);
	return(4);
}

/*LD B, L*/
static uint8_t op_0x45(void)
{
	LD_R_TO_R(B, L);
	return(4);
}

/*LD B, (HL)*/
static uint8_t op_0x46(void)
{
	LD_ADDR_HL_TO_R(B);
	return(7);
}

/*LD B, A*/
static uint8_t op_0x47(void)
{
	LD_R_TO_R(B, A);
	return(4);
}

/*LD C, B*/
static uint8_t op_0x48(void)
{
	LD_R_TO_R(C, B);
	return(4);
}

/*LD C, C*/
static uint8_t op_0x49(void)
{
	LD_R_TO_R(C, C);
	return(4);
}

/*LD C, D*/
static uint8_t op_0x4a(void)
{
	LD_R_TO_R(C, D);
	return(4);
}

/*LD C, E*/
static uint8_t op_0x4b(void)
{
	LD_R_TO_R(C, E);
	return(4);
}

/*LD C, H*/
static uint8_t op_0x4c(void)
{
	LD_R_TO_R(C, H);
	return(4);
}

/*LD C, L*/
static uint8_t op_0x4d(void)
{
	LD_R_TO_R(C, L);
	return(4);
}

/*LD C, (HL)*/
static uint8_t op_0x4e(void)
{
	LD_ADDR_HL_TO_R(C);
	return(7);
}

/*LD C, A*/
static uint8_t op_0x4f(void)
{
	LD_R_TO_R(C, A);
	return(4);
}

/*LD D, B*/
static uint8_t op_0x50(void)
{
	LD_R_TO_R(D, B);
	return(4);
}

/*LD D, C*/
static uint8_t op_0x51(void)
{
	LD_R_TO_R(D, C);
	return(4);
}

/*LD D, D*/
static uint8_t op_0x52(void)
{
	LD_R_TO_R(D, D);
	return(4);
}

/*LD D, E*/
static uint8_t op_0x53(void)
{
	LD_R_TO_R(D, E);
	return(4);
}

/*LD D, H*/
static uint8_t op_0x54(void)
{
	LD_R_TO_R(D, H);
	return(4);
}

/*LD D, L*/
static uint8_t op_0x55(void)
{
	LD_R_TO_R(D, L);
	return(4);
}

/*LD D, (HL)*/
static uint8_t op_0x56(void)
{
	LD_ADDR_HL_TO_R(D);
	return(7);
}

/*LD D, A*/
static uint8_t op_0x57(void)
{
	LD_R_TO_R(D, A);
	return(4);
}

/*LD E, B*/
static uint8_t op_0x58(void)
{
	LD_R_TO_R(E, B);
	return(4);
}

/*LD E, C*/
static uint8_t op_0x59(void)
{
	LD_R_TO_R(E, C);
	return(4);
}

/*LD E, D*/
static uint8_t op_0x5a(void)
{
	LD_R_TO_R(E, D);
	return(4);
}

/*LD E, E*/
static uint8_t op_0x5b(void)
{
	LD_R_TO_R(E, E);
	return(4);
}

/*LD E, H*/
static uint8_t op_0x5c(void)
{
	LD_R_TO_R(E, H);
	return(4);
}

/*LD E, L*/
static uint8_t op_0x5d(void)
{
	LD_R_TO_R(E, L);
	return(4);
}

/*LD E, (HL)*/
static uint8_t op_0x5e(void)
{
	LD_ADDR_HL_TO_R(E);
	return(7);
}

/*LD E, A*/
static uint8_t op_0x5f(void)
{
	LD_R_TO_R(E, A);
	return(4);
}

/*LD H, B*/
static uint8_t op_0x60(void)
{
	LD_R_TO_R(H, B);
	return(4);
}

/*LD H, C*/
static uint8_t op_0x61(void)
{
	LD_R_TO_R(H, C);
	return(4);
}

/*LD H, D*/
static uint8_t op_0x62(void)
{
	LD_R_TO_R(H, D);
	return(4);
}

/*LD H, E*/
static uint8_t op_0x63(void)
{
	LD_R_TO_R(H, E);
	return(4);
}

/*LD H, H*/
static uint8_t op_0x64(void)
{
	LD_R_TO_R(H, H);
	return(4);
}

/*LD H, L*/
static uint8_t op_0x65(void)
{
	LD_R_TO_R(H, L);
	return(4);
}

/*LD H, (HL)*/
static uint8_t op_0x66(void)
{
	LD_ADDR_HL_TO_R(H);
	return(7);
}

/*LD H, A*/
static uint8_t op_0x67(void)
{
	LD_R_TO_R(H, A);
	return(4);
}

/*LD L, B*/
static uint8_t op_0x68(void)
{
	LD_R_TO_R(L, B);
	return(4);
}

/*LD L, C*/
static uint8_t op_0x69(void)
{
	LD_R_TO_R(L, C);
	return(4);
}

/*LD L, D*/
static uint8_t op_0x6a(void)
{
	LD_R_TO_R(L, D);
	return(4);
}

/*LD L, E*/
static uint8_t op_0x6b(void)
{
	LD_R_TO_R(L, E);
	return(4);
}

/*LD L, H*/
static uint8_t op_0x6c(void)
{
	LD_R_TO_R(L, H);
	return(4);
}

/*LD L, L*/
static uint8_t op_0x6d(void)
{
	LD_R_TO_R(L, L);
	return(4);
}

/*LD L, (HL)*/
static uint8_t op_0x6e(void)
{
	LD_ADDR_HL_TO_R(L);
	return(7);
}

/*LD L, A*/
static uint8_t op_0x6f(void)
{
	LD_R_TO_R(L, A);
	return(4);
}

/*LD (HL), B*/
static uint8_t op_0x70(void)
{
	LD_ADDR_HL_FROM_R(B);
	return(7);
}

/*LD (HL), C*/
static uint8_t op_0x71(void)
{
	LD_ADDR_HL_FROM_R(C);
	return(7);
}

/*LD (HL), D*/
static uint8_t op_0x72(void)
{
	LD_ADDR_HL_FROM_R(D);
	return(7);
}

/*LD (HL), E*/
static uint8_t op_0x73(void)
{
	LD_ADDR_HL_FROM_R(E);
	return(7);
}

/*LD (HL), H*/
static uint8_t op_0x74(void)
{
	LD_ADDR_HL_FROM_R(H);
	return(7);
}

/*LD (HL), L*/
static uint8_t op_0x75(void)
{
	LD_ADDR_HL_FROM_R(L);
	return(7);
}

/*HALT*/
static uint8_t op_0x76(void)
{
	HALT();
	return(4);
}

/*LD (HL), A*/
static uint8_t op_0x77(void)
{
	LD_ADDR_HL_FROM_R(A);
	return(7);
}

/*LD A, B*/
static uint8_t op_0x78(void)
{
	LD_R_TO_R(A, B);
	return(4);
}

/*LD A, C*/
static uint8_t op_0x79(void)
{
	LD_R_TO_R(A, C);
	return(4);
}

/*LD A, D*/
static uint8_t op_0x7a(void)
{
	LD_R_TO_R(A, D);
	return(4);
}

/*LD A, E*/
static uint8_t op_0x7b(void)
{
	LD_R_TO_R(A, E);
	return(4);
}

/*LD A, H*/
static uint8_t op_0x7c(void)
{
	LD_R_TO_R(A, H);
	return(4);
}

/*LD A, L*/
static uint8_t op_0x7d(void)
{
	LD_R_TO_R(A, L);
	return(4);
}

/*LD A, (HL)*/
static uint8_t op_0x7e(void)
{
	LD_ADDR_HL_TO_R(A);
	return(7);
}

/*LD A, A*/
static uint8_t op_0x7f(void)
{
	LD_R_TO_R(A, A);
	return(4);
}

/*ADD A, B*/
static uint8_t op_0x80(void)
{
	ADD_A_AND_R(B);
	return(4);
}

/*ADD A, C*/
static uint8_t op_0x81(void)
{
	ADD_A_AND_R(C);
	return(4);
}

/*ADD A, D*/
static uint8_t op_0x82(void)
{
	ADD_A_AND_R(D);
	return(4);
}

/*ADD A, E*/
static uint8_t op_0x83(void)
{
	ADD_A_AND_R(E);
	return(4);
}

/*ADD A, H*/
static uint8_t op_0x84(void)
{
	ADD_A_AND_R(H);
	return(4);
}

/*ADD A, L*/
static uint8_t op_0x85(void)
{
	ADD_A_AND_R(L);
	return(4);
}

/*ADD A, (HL)*/
static uint8_t op_0x86(void)
{
	ADD_A_AND_ADDR_HL;
	return(7);
}

/*ADD A, A*/
static uint8_t op_0x87(void)
{
	ADD_A_AND_R(A);
	return(4);
}

/*ADDC A, B*/
static uint8_t op_0x88(void)
{
	ADC_A_AND_R(B);
	return(4);
}

/*ADDC A, C*/
static uint8_t op_0x89(void)
{
	ADC_A_AND_R(C);
	return(4);
}

/*ADDC A, D*/
static uint8_t op_0x8a(void)
{
	ADC_A_AND_R(D);
	return(4);
}

/*ADDC A, E*/
static uint8_t op_0x8b(void)
{
	ADC_A_AND_R(E);
	return(4);
}

/*ADDC A, H*/
static uint8_t op_0x8c(void)
{
	ADC_A_AND_R(H);
	return(4);
}

/*ADDC A, L*/
static uint8_t op_0x8d(void)
{
	ADC_A_AND_R(L);
	return(4);
}

/*ADDC A, (HL)*/
static uint8_t op_0x8e(void)
{
	ADC_A_AND_ADDR_HL;
	return(7);
}

/*ADDC A, A*/
static uint8_t op_0x8f(void)
{
	ADC_A_AND_R(A);
	return(4);
}

/*SUB B*/
static uint8_t op_0x90(void)
{
	SUB_A_AND_R(B);
	return(4);
}

/*SUB C*/
static uint8_t op_0x91(void)
{
	SUB_A_AND_R(C);
	return(4);
}

/*SUB D*/
static uint8_t op_0x92(void)
{
	SUB_A_AND_R(D);
	return(4);
}

/*SUB E*/
static uint8_t op_0x93(void)
{
	SUB_A_AND_R(E);
	return(4);
}

/*SUB H*/
static uint8_t op_0x94(void)
{
	SUB_A_AND_R(H);
	return(4);
}

/*SUB L*/
static uint8_t op_0x95(void)
{
	SUB_A_AND_R(L);
	return(4);
}

/*SUB (HL)*/
static uint8_t op_0x96(void)
{
	SUB_A_AND_ADDR_HL;
	return(7);
}

/*SUB A*/
static uint8_t op_0x97(void)
{
	SUB_A_AND_R(A);
	return(4);
}

/*SUBC A, B*/
static uint8_t op_0x98(void)
{
	SBC_A_AND_R(B);
	return(4);
}

/*SUBC A, C*/
static uint8_t op_0x99(void)
{
	SBC_A_AND_R(C);
	return(4);
}

/*SUBC A, D*/
static uint8_t op_0x9a(void)
{
	SBC_A_AND_R(D);
	return(4);
}

/*SUBC A, E*/
static uint8_t op_0x9b(void)
{
	SBC_A_AND_R(E);
	return(4);
}

/*SUBC A, H*/
static uint8_t op_0x9c(void)
{
	SBC_A_AND_R(H);
	return(4);
}

/*SUBC A, L*/
static uint8_t op_0x9d(void)
{
	SBC_A_AND_R(L);
	return(4);
}

/*SUBC A, (HL)*/
static uint8_t op_0x9e(void)
{
	SBC_A_AND_ADDR_HL;
	return(7);
}

/*SUBC A, A*/
static uint8_t op_0x9f(void)
{
	SBC_A_AND_R(A);
	return(4);
}

/*AND B*/
static uint8_t op_0xa0(void)
{
	AND(B);
	return(4);
}

/*AND C*/
static uint8_t op_0xa1(void)
{
	AND(C);
	return(4);
}

/*AND D*/
static uint8_t op_0xa2(void)
{
	AND(D);
	return(4);
}

/*AND E*/
static uint8_t op_0xa3(void)
{
	AND(E);
	return(4);
}

/*AND H*/
static uint8_t op_0xa4(void)
{
	AND(H);
	return(4);
}

/*AND L*/
static uint8_t op_0xa5(void)
{
	AND(L);
	return(4);
}

/*AND (HL)*/
static uint8_t op_0xa6(void)
{
	AND_ADDR_HL;
	return(7);
}

/*AND A*/
static uint8_t op_0xa7(void)
{
	AND(A);
	return(4);
}

/*XOR B*/
static uint8_t op_0xa8(void)
{
	XOR(B);
	return(4);
}

/*XOR C*/
static uint8_t op_0xa9(void)
{
	XOR(C);
	return(4);
}

/*XOR D*/
static uint8_t op_0xaa(void)
{
	XOR(D);
	return(4);
}

/*XOR E*/
static uint8_t op_0xab(void)
{
	XOR(E);
	return(4);
}

/*XOR H*/
static uint8_t op_0xac(void)
{
	XOR(H);
	return(4);
}

/*XOR L*/
static uint8_t op_0xad(void)
{
	XOR(L);
	return(4);
}

/*XOR (HL)*/
static uint8_t op_0xae(void)
{
	XOR_ADDR_HL;
	return(7);
}

/*XOR A*/
static uint8_t op_0xaf(void)
{
	XOR(A);
	return(4);
}

/*OR B*/
static uint8_t op_0xb0(void)
{
	OR(B);
	return(4);
}

/*OR C*/
static uint8_t op_0xb1(void)
{
	OR(C);
	return(4);
}

/*OR D*/
static uint8_t op_0xb2(void)
{
	OR(D);
	return(4);
}

/*OR E*/
static uint8_t op_0xb3(void)
{
	OR(E);
	return(4);
}

/*OR H*/
static uint8_t op_0xb4(void)
{
	OR(H);
	return(4);
}

/*OR L*/
static uint8_t op_0xb5(void)
{
	OR(L);
	return(4);
}

/*OR (HL)*/
static uint8_t op_0xb6(void)
{
	OR_ADDR_HL;
	return(7);
}

/*OR A*/
static uint8_t op_0xb7(void)
{
	OR(A);
	return(4);
}

/*CP B*/
static uint8_t op_0xb8(void)
{
	CP(B);
	return(4);
}

/*CP C*/
static uint8_t op_0xb9(void)
{
	CP(C);
	return(4);
}

/*CP D*/
static uint8_t op_0xba(void)
{
	CP(D);
	return(4);
}

/*CP E*/
static uint8_t op_0xbb(void)
{
	CP(E);
	return(4);
}

/*CP H*/
static uint8_t op_0xbc(void)
{
	CP(H);
	return(4);
}

/*CP L*/
static uint8_t op_0xbd(void)
{
	CP(L);
	return(4);
}

/*CP (HL)*/
static uint8_t op_0xbe(void)
{
	CP_AND_ADDR_HL;
	return(7);
}

/*CP A*/
static uint8_t op_0xbf(void)
{
	CP(A);
	return(4);
}

/*RET NZ*/
static uint8_t op_0xc0(void)
{
	if(!(F&FLAG_Z))
	{
		RET();
		return(11);
	}
	else
	{
		return(5);
	}
}

/*POP BC*/
static uint8_t op_0xc1(void)
{
	POP(BC);
	return(10);
}

/*JP NZ, @*/
static uint8_t op_0xc2(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(!(F&FLAG_Z))
	{
		JP(MEMPTR);
		return(10);
	}
	else
	{
		return(10);
	}
}

/*JP @*/
static uint8_t op_0xc3(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	JP(MEMPTR);
	return(10);
}

/*CALL NZ, @*/
static uint8_t op_0xc4(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(!(F&FLAG_Z))
	{
		CALL(MEMPTR);
		return(17);
	}
	else
	{
		return(10);
	}
}

/*PUSH BC*/
static uint8_t op_0xc5(void)
{
	PUSH(BC);
	return(11);
}

/*ADD A, #*/
static uint8_t op_0xc6(void)
{
	ADD_A_AND_n;
	return(7);
}

/*RST 0x00*/
static uint8_t op_0xc7(void)
{
	RST(0x00);
	return(11);
}

/*RET Z*/
static uint8_t op_0xc8(void)
{
	if(F&FLAG_Z)
	{
		RET();
		return(11);
	}
	else
	{
		return(5);
	}
}

/*RET*/
static uint8_t op_0xc9(void)
{
	RET();
	return(10);
}

/*JP Z, @*/
static uint8_t op_0xca(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(F&FLAG_Z)
	{
		JP(MEMPTR);
		return(10);
	}
	else
	{
		return(10);
	}
}

/*prefix CB*/
static uint8_t op_0xcb(void)
{

	opcode=memory[PC];
	PC+=1;
	R++;
	return(*opcode_cb[opcode])();
}

/*CALL Z, @*/
static uint8_t op_0xcc(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(F&FLAG_Z)
	{
		CALL(MEMPTR);
		return(17);
	}
	else
	{
		return(10);
	}
}

/*CALL @*/
static uint8_t op_0xcd(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	CALL(MEMPTR);
	return(17);
}

/*ADDC A, #*/
static uint8_t op_0xce(void)
{
	ADC_A_AND_n;
	return(7);
}

/*RST 0x08*/
static uint8_t op_0xcf(void)
{
	RST(0x08);
	return(11);
}

/*RET NC*/
static uint8_t op_0xd0(void)
{
	if(!(F&FLAG_C))
	{
		RET();
		return(11);
	}
	else
	{
		return(5);
	}
}

/*POP DE*/
static uint8_t op_0xd1(void)
{
	POP(DE);
	return(10);
}

/*JP NC, @*/
static uint8_t op_0xd2(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(!(F&FLAG_C))
	{
		JP(MEMPTR);
		return(10);
	}
	else
	{
		return(10);
	}
}

/*OUT (#), A*/
static uint8_t op_0xd3(void)
{
	OUT_PORT_An_FROM_A;
	return(11);
}

/*CALL NC, @*/
static uint8_t op_0xd4(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(!(F&FLAG_C))
	{
		CALL(MEMPTR);
		return(17);
	}
	else
	{
		return(10);
	}
}

/*PUSH DE*/
static uint8_t op_0xd5(void)
{
	PUSH(DE);
	return(11);
}

/*SUB #*/
static uint8_t op_0xd6(void)
{
	SUB_A_AND_n;
	return(7);
}

/*RST 0x10*/
static uint8_t op_0xd7(void)
{
	RST(0x10);
	return(11);
}

/*RET C*/
static uint8_t op_0xd8(void)
{
	if(F&FLAG_C)
	{
		RET();
		return(11);
	}
	else
	{
		return(5);
	}
}

/*EXX*/
static uint8_t op_0xd9(void)
{
	EXX();
	return(4);
}

/*JP C, @*/
static uint8_t op_0xda(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(F&FLAG_C)
	{
		JP(MEMPTR);
		return(10);
	}
	else
	{
		return(10);
	}
}

/*IN A,(#)*/
static uint8_t op_0xdb(void)
{
	IN_PORT_An_TO_A;
	return(11);
}

/*CALL C, @*/
static uint8_t op_0xdc(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(F&FLAG_C)
	{
		CALL(MEMPTR);
		return(17);
	}
	else
	{
		return(10);
	}
}

/*prefix DD*/
static uint8_t op_0xdd(void)
{
	opcode=memory[PC];
	PC+=1;
	R++;
	return(*opcode_dd[opcode])();
}

/*SUBC A, #*/
static uint8_t op_0xde(void)
{
	SBC_A_AND_n;
	return(7);
}

/*RST 0x18*/
static uint8_t op_0xdf(void)
{
	RST(0x18);
	return(11);
}

/*RET PO*/
static uint8_t op_0xe0(void)
{
	if(!(F&FLAG_P))
	{
		RET();
		return(11);
	}
	else
	{
		return(5);
	}
}

/*POP HL*/
static uint8_t op_0xe1(void)
{
	POP(HL);
	return(10);
}

/*JP PO, @*/
static uint8_t op_0xe2(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(!(F&FLAG_P))
	{
		JP(MEMPTR);
		return(10);
	}
	else
	{
		return(10);
	}
}

/*EX (SP), HL*/
static uint8_t op_0xe3(void)
{
	EX_MPTR(HL);
	return(19);
}

/*CALL PO, @*/
static uint8_t op_0xe4(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(!(F&FLAG_P))
	{
		CALL(MEMPTR);
		return(17);
	}
	else
	{
		return(10);
	}
}

/*PUSH HL*/
static uint8_t op_0xe5(void)
{
	PUSH(HL);
	return(11);
}

/*AND #*/
static uint8_t op_0xe6(void)
{
	AND_n;
	return(7);
}

/*RST 0x20*/
static uint8_t op_0xe7(void)
{
	RST(0x20);
	return(11);
}

/*RET PE*/
static uint8_t op_0xe8(void)
{
	if(F&FLAG_P)
	{
		RET();
		return(11);
	}
	else
	{
		return(5);
	}
}

/*JP HL*/
static uint8_t op_0xe9(void)
{
	JP(HL);
	return(4);
}

/*JP PE, @*/
static uint8_t op_0xea(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(F&FLAG_P)
	{
		JP(MEMPTR);
		return(10);
	}
	else
	{
		return(10);
	}
}

/*EX DE, HL*/
static uint8_t op_0xeb(void)
{
	EX(DE, HL);
	return(4);
}

/*CALL PE, @*/
static uint8_t op_0xec(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(F&FLAG_P)
	{
		CALL(MEMPTR);
		return(17);
	}
	else
	{
		return(10);
	}
}

/*prefix ED*/
static uint8_t op_0xed(void)
{
	opcode=memory[PC];
	PC+=1;
	R++;
	return(*opcode_ed[opcode])();
}

/*XOR #*/
static uint8_t op_0xee(void)
{
	XOR_n;
	return(7);
}

/*RST 0x28*/
static uint8_t op_0xef(void)
{
	RST(0x28);
	return(11);
}

/*RET P*/
static uint8_t op_0xf0(void)
{
	if(!(F&FLAG_S))
	{
		RET();
		return(11);
	}
	else
	{
		return(5);
	}
}

/*POP AF*/
static uint8_t op_0xf1(void)
{
	POP(AF);
	return(10);
}

/*JP P, @*/
static uint8_t op_0xf2(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(!(F&FLAG_S))
	{
		JP(MEMPTR);
		return(10);
	}
	else
	{
		return(10);
	}
}

/*DI*/
static uint8_t op_0xf3(void)
{
	DI();
	return(4);
}

/*CALL P, @*/
static uint8_t op_0xf4(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(!(F&FLAG_S))
	{
		CALL(MEMPTR);
		return(17);
	}
	else
	{
		return(10);
	}
}

/*PUSH AF*/
static uint8_t op_0xf5(void)
{
	PUSH(AF);
	return(11);
}

/*OR #*/
static uint8_t op_0xf6(void)
{
	OR_n;
	return(7);
}

/*RST 0x30*/
static uint8_t op_0xf7(void)
{
	RST(0x30);
	return(11);
}

/*RET M*/
static uint8_t op_0xf8(void)
{
	if(F&FLAG_S)
	{
		RET();
		return(11);
	}
	else
	{
		return(5);
	}
}

/*LD SP, HL*/
static uint8_t op_0xf9(void)
{
	LD_RP_TO_RP(SP, HL);
	return(6);
}

/*JP M, @*/
static uint8_t op_0xfa(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(F&FLAG_S)
	{
		JP(MEMPTR);
		return(10);
	}
	else
	{
		return(10);
	}
}

/*EI*/
static uint8_t op_0xfb(void)
{
	EI();
	return(4);
}

/*CALL M, @*/
static uint8_t op_0xfc(void)
{
	MEMPTRL=memory[PC];
	PC+=1;
	MEMPTRH=memory[PC];
	PC+=1;
	if(F&FLAG_S)
	{
		CALL(MEMPTR);
		return(17);
	}
	else
	{
		return(10);
	}
}

/*prefix FD*/
static uint8_t op_0xfd(void)
{
	opcode=memory[PC];
	PC+=1;
	R++;
	return(*opcode_fd[opcode])();
}

/*CP #*/
static uint8_t op_0xfe(void)
{
	CP_AND_n;
	return(7);
}

/*RST 0x38*/
static uint8_t op_0xff(void)
{
	RST(0x38);
	return(11);
}

static uint8_t (*const opcode_base [0x100])(void)={
	op_0x00, op_0x01, op_0x02, op_0x03, op_0x04, op_0x05, op_0x06, op_0x07, op_0x08, op_0x09, op_0x0a, op_0x0b, op_0x0c, op_0x0d, op_0x0e, op_0x0f,
	op_0x10, op_0x11, op_0x12, op_0x13, op_0x14, op_0x15, op_0x16, op_0x17, op_0x18, op_0x19, op_0x1a, op_0x1b, op_0x1c, op_0x1d, op_0x1e, op_0x1f,
	op_0x20, op_0x21, op_0x22, op_0x23, op_0x24, op_0x25, op_0x26, op_0x27, op_0x28, op_0x29, op_0x2a, op_0x2b, op_0x2c, op_0x2d, op_0x2e, op_0x2f,
	op_0x30, op_0x31, op_0x32, op_0x33, op_0x34, op_0x35, op_0x36, op_0x37, op_0x38, op_0x39, op_0x3a, op_0x3b, op_0x3c, op_0x3d, op_0x3e, op_0x3f,
	op_0x40, op_0x41, op_0x42, op_0x43, op_0x44, op_0x45, op_0x46, op_0x47, op_0x48, op_0x49, op_0x4a, op_0x4b, op_0x4c, op_0x4d, op_0x4e, op_0x4f,
	op_0x50, op_0x51, op_0x52, op_0x53, op_0x54, op_0x55, op_0x56, op_0x57, op_0x58, op_0x59, op_0x5a, op_0x5b, op_0x5c, op_0x5d, op_0x5e, op_0x5f,
	op_0x60, op_0x61, op_0x62, op_0x63, op_0x64, op_0x65, op_0x66, op_0x67, op_0x68, op_0x69, op_0x6a, op_0x6b, op_0x6c, op_0x6d, op_0x6e, op_0x6f,
	op_0x70, op_0x71, op_0x72, op_0x73, op_0x74, op_0x75, op_0x76, op_0x77, op_0x78, op_0x79, op_0x7a, op_0x7b, op_0x7c, op_0x7d, op_0x7e, op_0x7f,
	op_0x80, op_0x81, op_0x82, op_0x83, op_0x84, op_0x85, op_0x86, op_0x87, op_0x88, op_0x89, op_0x8a, op_0x8b, op_0x8c, op_0x8d, op_0x8e, op_0x8f,
	op_0x90, op_0x91, op_0x92, op_0x93, op_0x94, op_0x95, op_0x96, op_0x97, op_0x98, op_0x99, op_0x9a, op_0x9b, op_0x9c, op_0x9d, op_0x9e, op_0x9f,
	op_0xa0, op_0xa1, op_0xa2, op_0xa3, op_0xa4, op_0xa5, op_0xa6, op_0xa7,	op_0xa8, op_0xa9, op_0xaa, op_0xab, op_0xac, op_0xad, op_0xae, op_0xaf,
	op_0xb0, op_0xb1, op_0xb2, op_0xb3, op_0xb4, op_0xb5, op_0xb6, op_0xb7, op_0xb8, op_0xb9, op_0xba, op_0xbb, op_0xbc, op_0xbd, op_0xbe, op_0xbf,
	op_0xc0, op_0xc1, op_0xc2, op_0xc3, op_0xc4, op_0xc5, op_0xc6, op_0xc7, op_0xc8, op_0xc9, op_0xca, op_0xcb, op_0xcc, op_0xcd, op_0xce, op_0xcf,
	op_0xd0, op_0xd1, op_0xd2, op_0xd3, op_0xd4, op_0xd5, op_0xd6, op_0xd7, op_0xd8, op_0xd9, op_0xda, op_0xdb, op_0xdc, op_0xdd, op_0xde, op_0xdf,
	op_0xe0, op_0xe1, op_0xe2, op_0xe3, op_0xe4, op_0xe5, op_0xe6, op_0xe7, op_0xe8, op_0xe9, op_0xea, op_0xeb, op_0xec, op_0xed, op_0xee, op_0xef,
	op_0xf0, op_0xf1, op_0xf2, op_0xf3, op_0xf4, op_0xf5, op_0xf6, op_0xf7, op_0xf8, op_0xf9, op_0xfa, op_0xfb, op_0xfc, op_0xfd, op_0xfe, op_0xff
};
