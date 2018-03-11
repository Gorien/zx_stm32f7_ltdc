/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	The program emulating the work of the processor z80
 *	Attention! this part must be included in the main program code
 *
 */


/*RLC B*/
static uint8_t op_CB_0x00(void)
{
	RLC(B);
	return(8);
}

/*RLC C*/
static uint8_t op_CB_0x01(void)
{
	RLC(C);
	return(8);
}

/*RLC D*/
static uint8_t op_CB_0x02(void)
{
	RLC(D);
	return(8);
}

/*RLC E*/
static uint8_t op_CB_0x03(void)
{
	RLC(E);
	return(8);
}

/*RLC H*/
static uint8_t op_CB_0x04(void)
{
	RLC(H);
	return(8);
}

/*RLC L*/
static uint8_t op_CB_0x05(void)
{
	RLC(L);
	return(8);
}

/*RLC (HL)*/
static uint8_t op_CB_0x06(void)
{
	RLC_ADDR_HL;
	return(15);
}

/*RLC A*/
static uint8_t op_CB_0x07(void)
{
	RLC(A);
	return(8);
}

/*RRC B*/
static uint8_t op_CB_0x08(void)
{
	RRC(B);
	return(8);
}

/*RRC C*/
static uint8_t op_CB_0x09(void)
{
	RRC(C);
	return(8);
}

/*RRC D*/
static uint8_t op_CB_0x0a(void)
{
	RRC(D);
	return(8);
}

/*RRC E*/
static uint8_t op_CB_0x0b(void)
{
	RRC(E);
	return(8);
}

/*RRC H*/
static uint8_t op_CB_0x0c(void)
{
	RRC(H);
	return(8);
}

/*RRC L*/
static uint8_t op_CB_0x0d(void)
{
	RRC(L);
	return(8);
}

/*RRC (HL)*/
static uint8_t op_CB_0x0e(void)
{
	RRC_ADDR_HL;
	return(15);
}

/*RRC A*/
static uint8_t op_CB_0x0f(void)
{
	RRC(A);
	return(8);
}

/*RL B*/
static uint8_t op_CB_0x10(void)
{
	RL(B);
	return(8);
}

/*RL C*/
static uint8_t op_CB_0x11(void)
{
	RL(C);
	return(8);
}

/*RL D*/
static uint8_t op_CB_0x12(void)
{
	RL(D);
	return(8);
}

/*RL E*/
static uint8_t op_CB_0x13(void)
{
	RL(E);
	return(8);
}

/*RL H*/
static uint8_t op_CB_0x14(void)
{
	RL(H);
	return(8);
}

/*RL L*/
static uint8_t op_CB_0x15(void)
{
	RL(L);
	return(8);
}

/*RL (HL)*/
static uint8_t op_CB_0x16(void)
{
	RL_ADDR_HL;
	return(15);
}

/*RL A*/
static uint8_t op_CB_0x17(void)
{
	RL(A);
	return(8);
}

/*RR B*/
static uint8_t op_CB_0x18(void)
{
	RR(B);
	return(8);
}

/*RR C*/
static uint8_t op_CB_0x19(void)
{
	RR(C);
	return(8);
}

/*RR D*/
static uint8_t op_CB_0x1a(void)
{
	RR(D);
	return(8);
}

/*RR E*/
static uint8_t op_CB_0x1b(void)
{
	RR(E);
	return(8);
}

/*RR H*/
static uint8_t op_CB_0x1c(void)
{
	RR(H);
	return(8);
}

/*RR L*/
static uint8_t op_CB_0x1d(void)
{
	RR(L);
	return(8);
}

/*RR (HL)*/
static uint8_t op_CB_0x1e(void)
{
	RR_ADDR_HL;
	return(15);
}

/*RR A*/
static uint8_t op_CB_0x1f(void)
{
	RR(A);
	return(8);
}

/*SLA B*/
static uint8_t op_CB_0x20(void)
{
	SLA(B);
	return(8);
}

/*SLA C*/
static uint8_t op_CB_0x21(void)
{
	SLA(C);
	return(8);
}

/*SLA D*/
static uint8_t op_CB_0x22(void)
{
	SLA(D);
	return(8);
}

/*SLA E*/
static uint8_t op_CB_0x23(void)
{
	SLA(E);
	return(8);
}

/*SLA H*/
static uint8_t op_CB_0x24(void)
{
	SLA(H);
	return(8);
}

/*SLA L*/
static uint8_t op_CB_0x25(void)
{
	SLA(L);
	return(8);
}

/*SLA (HL)*/
static uint8_t op_CB_0x26(void)
{
	SLA_ADDR_HL;
	return(15);
}

/*SLA A*/
static uint8_t op_CB_0x27(void)
{
	SLA(A);
	return(8);
}

/*SRA B*/
static uint8_t op_CB_0x28(void)
{
	SRA(B);
	return(8);
}

/*SRA C*/
static uint8_t op_CB_0x29(void)
{
	SRA(C);
	return(8);
}

/*SRA D*/
static uint8_t op_CB_0x2a(void)
{
	SRA(D);
	return(8);
}

/*SRA E*/
static uint8_t op_CB_0x2b(void)
{
	SRA(E);
	return(8);
}

/*SRA H*/
static uint8_t op_CB_0x2c(void)
{
	SRA(H);
	return(8);
}

/*SRA L*/
static uint8_t op_CB_0x2d(void)
{
	SRA(L);
	return(8);
}

/*SRA (HL)*/
static uint8_t op_CB_0x2e(void)
{
	SRA_ADDR_HL;
	return(15);
}

/*SRA A*/
static uint8_t op_CB_0x2f(void)
{
	SRA(A);
	return(8);
}

/*SLL B*/
static uint8_t op_CB_0x30(void)
{
	SLL(B);
	return(8);
}

/*SLL C*/
static uint8_t op_CB_0x31(void)
{
	SLL(C);
	return(8);
}

/*SLL D*/
static uint8_t op_CB_0x32(void)
{
	SLL(D);
	return(8);
}

/*SLL E*/
static uint8_t op_CB_0x33(void)
{
	SLL(E);
	return(8);
}

/*SLL H*/
static uint8_t op_CB_0x34(void)
{
	SLL(H);
	return(8);
}

/*SLL L*/
static uint8_t op_CB_0x35(void)
{
	SLL(L);
	return(8);
}

/*SLL (HL)*/
static uint8_t op_CB_0x36(void)
{
	SLL_ADDR_HL;
	return(15);
}

/*SLL A*/
static uint8_t op_CB_0x37(void)
{
	SLL(A);
	return(8);
}

/*SRL B*/
static uint8_t op_CB_0x38(void)
{
	SRL(B);
	return(8);
}

/*SRL C*/
static uint8_t op_CB_0x39(void)
{
	SRL(C);
	return(8);
}

/*SRL D*/
static uint8_t op_CB_0x3a(void)
{
	SRL(D);
	return(8);
}

/*SRL E*/
static uint8_t op_CB_0x3b(void)
{
	SRL(E);
	return(8);
}

/*SRL H*/
static uint8_t op_CB_0x3c(void)
{
	SRL(H);
	return(8);
}

/*SRL L*/
static uint8_t op_CB_0x3d(void)
{
	SRL(L);
	return(8);
}

/*SRL (HL)*/
static uint8_t op_CB_0x3e(void)
{
	SRL_ADDR_HL;
	return(15);
}

/*SRL A*/
static uint8_t op_CB_0x3f(void)
{
	SRL(A);
	return(8);
}

/*BIT 0, B*/
static uint8_t op_CB_0x40(void)
{
	BIT(0, B);
	return(8);
}

/*BIT 0, C*/
static uint8_t op_CB_0x41(void)
{
	BIT(0, C);
	return(8);
}

/*BIT 0, D*/
static uint8_t op_CB_0x42(void)
{
	BIT(0, D);
	return(8);
}

/*BIT 0, E*/
static uint8_t op_CB_0x43(void)
{
	BIT(0, E);
	return(8);
}

/*BIT 0, H*/
static uint8_t op_CB_0x44(void)
{
	BIT(0, H);
	return(8);
}

/*BIT 0, L*/
static uint8_t op_CB_0x45(void)
{
	BIT(0, L);
	return(8);
}

/*BIT 0, (HL)*/
static uint8_t op_CB_0x46(void)
{
	BIT_ADDR_HL(0);
	return(12);
}

/*BIT 0, A*/
static uint8_t op_CB_0x47(void)
{
	BIT(0, A);
	return(8);
}

/*BIT 1, B*/
static uint8_t op_CB_0x48(void)
{
	BIT(1, B);
	return(8);
}

/*BIT 1, C*/
static uint8_t op_CB_0x49(void)
{
	BIT(1, C);
	return(8);
}

/*BIT 1, D*/
static uint8_t op_CB_0x4a(void)
{
	BIT(1, D);
	return(8);
}

/*BIT 1, E*/
static uint8_t op_CB_0x4b(void)
{
	BIT(1, E);
	return(8);
}

/*BIT 1, H*/
static uint8_t op_CB_0x4c(void)
{
	BIT(1, H);
	return(8);
}

/*BIT 1, L*/
static uint8_t op_CB_0x4d(void)
{
	BIT(1, L);
	return(8);
}

/*BIT 1, (HL)*/
static uint8_t op_CB_0x4e(void)
{
	BIT_ADDR_HL(1);
	return(12);
}

/*BIT 1, A*/
static uint8_t op_CB_0x4f(void)
{
	BIT(1, A);
	return(8);
}

/*BIT 2, B*/
static uint8_t op_CB_0x50(void)
{
	BIT(2, B);
	return(8);
}

/*BIT 2, C*/
static uint8_t op_CB_0x51(void)
{
	BIT(2, C);
	return(8);
}

/*BIT 2, D*/
static uint8_t op_CB_0x52(void)
{
	BIT(2, D);
	return(8);
}

/*BIT 2, E*/
static uint8_t op_CB_0x53(void)
{
	BIT(2, E);
	return(8);
}

/*BIT 2, H*/
static uint8_t op_CB_0x54(void)
{
	BIT(2, H);
	return(8);
}

/*BIT 2, L*/
static uint8_t op_CB_0x55(void)
{
	BIT(2, L);
	return(8);
}

/*BIT 2, (HL)*/
static uint8_t op_CB_0x56(void)
{
	BIT_ADDR_HL(2);
	return(12);
}

/*BIT 2, A*/
static uint8_t op_CB_0x57(void)
{
	BIT(2, A);
	return(8);
}

/*BIT 3, B*/
static uint8_t op_CB_0x58(void)
{
	BIT(3, B);
	return(8);
}

/*BIT 3, C*/
static uint8_t op_CB_0x59(void)
{
	BIT(3, C);
	return(8);
}

/*BIT 3, D*/
static uint8_t op_CB_0x5a(void)
{
	BIT(3, D);
	return(8);
}

/*BIT 3, E*/
static uint8_t op_CB_0x5b(void)
{
	BIT(3, E);
	return(8);
}

/*BIT 3, H*/
static uint8_t op_CB_0x5c(void)
{
	BIT(3, H);
	return(8);
}

/*BIT 3, L*/
static uint8_t op_CB_0x5d(void)
{
	BIT(3, L);
	return(8);
}

/*BIT 3, (HL)*/
static uint8_t op_CB_0x5e(void)
{
	BIT_ADDR_HL(3);
	return(12);
}

/*BIT 3, A*/
static uint8_t op_CB_0x5f(void)
{
	BIT(3, A);
	return(8);
}

/*BIT 4, B*/
static uint8_t op_CB_0x60(void)
{
	BIT(4, B);
	return(8);
}

/*BIT 4, C*/
static uint8_t op_CB_0x61(void)
{
	BIT(4, C);
	return(8);
}

/*BIT 4, D*/
static uint8_t op_CB_0x62(void)
{
	BIT(4, D);
	return(8);
}

/*BIT 4, E*/
static uint8_t op_CB_0x63(void)
{
	BIT(4, E);
	return(8);
}

/*BIT 4, H*/
static uint8_t op_CB_0x64(void)
{
	BIT(4, H);
	return(8);
}

/*BIT 4, L*/
static uint8_t op_CB_0x65(void)
{
	BIT(4, L);
	return(8);
}

/*BIT 4, (HL)*/
static uint8_t op_CB_0x66(void)
{
	BIT_ADDR_HL(4);
	return(12);
}

/*BIT 4, A*/
static uint8_t op_CB_0x67(void)
{
	BIT(4, A);
	return(8);
}

/*BIT 5, B*/
static uint8_t op_CB_0x68(void)
{
	BIT(5, B);
	return(8);
}

/*BIT 5, C*/
static uint8_t op_CB_0x69(void)
{
	BIT(5, C);
	return(8);
}

/*BIT 5, D*/
static uint8_t op_CB_0x6a(void)
{
	BIT(5, D);
	return(8);
}

/*BIT 5, E*/
static uint8_t op_CB_0x6b(void)
{
	BIT(5, E);
	return(8);
}

/*BIT 5, H*/
static uint8_t op_CB_0x6c(void)
{
	BIT(5, H);
	return(8);
}

/*BIT 5, L*/
static uint8_t op_CB_0x6d(void)
{
	BIT(5, L);
	return(8);
}

/*BIT 5, (HL)*/
static uint8_t op_CB_0x6e(void)
{
	BIT_ADDR_HL(5);
	return(12);
}

/*BIT 5, A*/
static uint8_t op_CB_0x6f(void)
{
	BIT(5, A);
	return(8);
}

/*BIT 6, B*/
static uint8_t op_CB_0x70(void)
{
	BIT(6, B);
	return(8);
}

/*BIT 6, C*/
static uint8_t op_CB_0x71(void)
{
	BIT(6, C);
	return(8);
}

/*BIT 6, D*/
static uint8_t op_CB_0x72(void)
{
	BIT(6, D);
	return(8);
}

/*BIT 6, E*/
static uint8_t op_CB_0x73(void)
{
	BIT(6, E);
	return(8);
}

/*BIT 6, H*/
static uint8_t op_CB_0x74(void)
{
	BIT(6, H);
	return(8);
}

/*BIT 6, L*/
static uint8_t op_CB_0x75(void)
{
	BIT(6, L);
	return(8);
}

/*BIT 6, (HL)*/
static uint8_t op_CB_0x76(void)
{
	BIT_ADDR_HL(6);
	return(12);
}

/*BIT 6, A*/
static uint8_t op_CB_0x77(void)
{
	BIT(6, A);
	return(8);
}

/*BIT 7, B*/
static uint8_t op_CB_0x78(void)
{
	BIT(7, B);
	return(8);
}

/*BIT 7, C*/
static uint8_t op_CB_0x79(void)
{
	BIT(7, C);
	return(8);
}

/*BIT 7, D*/
static uint8_t op_CB_0x7a(void)
{
	BIT(7, D);
	return(8);
}

/*BIT 7, E*/
static uint8_t op_CB_0x7b(void)
{
	BIT(7, E);
	return(8);
}

/*BIT 7, H*/
static uint8_t op_CB_0x7c(void)
{
	BIT(7, H);
	return(8);
}

/*BIT 7, L*/
static uint8_t op_CB_0x7d(void)
{
	BIT(7, L);
	return(8);
}

/*BIT 7, (HL)*/
static uint8_t op_CB_0x7e(void)
{
	BIT_ADDR_HL(7);
	return(12);
}

/*BIT 7, A*/
static uint8_t op_CB_0x7f(void)
{
	BIT(7, A);
	return(8);
}

/*RES 0, B*/
static uint8_t op_CB_0x80(void)
{
	RES_BIT_IN_R(0, B);
	return(8);
}

/*RES 0, C*/
static uint8_t op_CB_0x81(void)
{
	RES_BIT_IN_R(0, C);
	return(8);
}

/*RES 0, D*/
static uint8_t op_CB_0x82(void)
{
	RES_BIT_IN_R(0, D);
	return(8);
}

/*RES 0, E*/
static uint8_t op_CB_0x83(void)
{
	RES_BIT_IN_R(0, E);
	return(8);
}

/*RES 0, H*/
static uint8_t op_CB_0x84(void)
{
	RES_BIT_IN_R(0, H);
	return(8);
}

/*RES 0, L*/
static uint8_t op_CB_0x85(void)
{
	RES_BIT_IN_R(0, L);
	return(8);
}

/*RES 0, (HL)*/
static uint8_t op_CB_0x86(void)
{
	RES_BIT_ADDR_HL(0);
	return(15);
}

/*RES 0, A*/
static uint8_t op_CB_0x87(void)
{
	RES_BIT_IN_R(0, A);
	return(8);
}

/*RES 1, B*/
static uint8_t op_CB_0x88(void)
{
	RES_BIT_IN_R(1, B);
	return(8);
}

/*RES 1, C*/
static uint8_t op_CB_0x89(void)
{
	RES_BIT_IN_R(1, C);
	return(8);
}

/*RES 1, D*/
static uint8_t op_CB_0x8a(void)
{
	RES_BIT_IN_R(1, D);
	return(8);
}

/*RES 1, E*/
static uint8_t op_CB_0x8b(void)
{
	RES_BIT_IN_R(1, E);
	return(8);
}

/*RES 1, H*/
static uint8_t op_CB_0x8c(void)
{
	RES_BIT_IN_R(1, H);
	return(8);
}

/*RES 1, L*/
static uint8_t op_CB_0x8d(void)
{
	RES_BIT_IN_R(1, L);
	return(8);
}

/*RES 1, (HL)*/
static uint8_t op_CB_0x8e(void)
{
	RES_BIT_ADDR_HL(1);
	return(15);
}

/*RES 1, A*/
static uint8_t op_CB_0x8f(void)
{
	RES_BIT_IN_R(1, A);
	return(8);
}

/*RES 2, B*/
static uint8_t op_CB_0x90(void)
{
	RES_BIT_IN_R(2, B);
	return(8);
}

/*RES 2, C*/
static uint8_t op_CB_0x91(void)
{
	RES_BIT_IN_R(2, C);
	return(8);
}

/*RES 2, D*/
static uint8_t op_CB_0x92(void)
{
	RES_BIT_IN_R(2, D);
	return(8);
}

/*RES 2, E*/
static uint8_t op_CB_0x93(void)
{
	RES_BIT_IN_R(2, E);
	return(8);
}

/*RES 2, H*/
static uint8_t op_CB_0x94(void)
{
	RES_BIT_IN_R(2, H);
	return(8);
}

/*RES 2, L*/
static uint8_t op_CB_0x95(void)
{
	RES_BIT_IN_R(2, L);
	return(8);
}

/*RES 2, (HL)*/
static uint8_t op_CB_0x96(void)
{
	RES_BIT_ADDR_HL(2);
	return(15);
}

/*RES 2, A*/
static uint8_t op_CB_0x97(void)
{
	RES_BIT_IN_R(2, A);
	return(8);
}

/*RES 3, B*/
static uint8_t op_CB_0x98(void)
{
	RES_BIT_IN_R(3, B);
	return(8);
}

/*RES 3, C*/
static uint8_t op_CB_0x99(void)
{
	RES_BIT_IN_R(3, C);
	return(8);
}

/*RES 3, D*/
static uint8_t op_CB_0x9a(void)
{
	RES_BIT_IN_R(3, D);
	return(8);
}

/*RES 3, E*/
static uint8_t op_CB_0x9b(void)
{
	RES_BIT_IN_R(3, E);
	return(8);
}

/*RES 3, H*/
static uint8_t op_CB_0x9c(void)
{
	RES_BIT_IN_R(3, H);
	return(8);
}

/*RES 3, L*/
static uint8_t op_CB_0x9d(void)
{
	RES_BIT_IN_R(3, L);
	return(8);
}

/*RES 3, (HL)*/
static uint8_t op_CB_0x9e(void)
{
	RES_BIT_ADDR_HL(3);
	return(15);
}

/*RES 3, A*/
static uint8_t op_CB_0x9f(void)
{
	RES_BIT_IN_R(3, A);
	return(8);
}

/*RES 4, B*/
static uint8_t op_CB_0xa0(void)
{
	RES_BIT_IN_R(4, B);
	return(8);
}

/*RES 4, C*/
static uint8_t op_CB_0xa1(void)
{
	RES_BIT_IN_R(4, C);
	return(8);
}

/*RES 4, D*/
static uint8_t op_CB_0xa2(void)
{
	RES_BIT_IN_R(4, D);
	return(8);
}

/*RES 4, E*/
static uint8_t op_CB_0xa3(void)
{
	RES_BIT_IN_R(4, E);
	return(8);
}

/*RES 4, H*/
static uint8_t op_CB_0xa4(void)
{
	RES_BIT_IN_R(4, H);
	return(8);
}

/*RES 4, L*/
static uint8_t op_CB_0xa5(void)
{
	RES_BIT_IN_R(4, L);
	return(8);
}

/*RES 4, (HL)*/
static uint8_t op_CB_0xa6(void)
{
	RES_BIT_ADDR_HL(4);
	return(15);
}

/*RES 4, A*/
static uint8_t op_CB_0xa7(void)
{
	RES_BIT_IN_R(4, A);
	return(8);
}

/*RES 5, B*/
static uint8_t op_CB_0xa8(void)
{
	RES_BIT_IN_R(5, B);
	return(8);
}

/*RES 5, C*/
static uint8_t op_CB_0xa9(void)
{
	RES_BIT_IN_R(5, C);
	return(8);
}

/*RES 5, D*/
static uint8_t op_CB_0xaa(void)
{
	RES_BIT_IN_R(5, D);
	return(8);
}

/*RES 5, E*/
static uint8_t op_CB_0xab(void)
{
	RES_BIT_IN_R(5, E);
	return(8);
}

/*RES 5, H*/
static uint8_t op_CB_0xac(void)
{
	RES_BIT_IN_R(5, H);
	return(8);
}

/*RES 5, L*/
static uint8_t op_CB_0xad(void)
{
	RES_BIT_IN_R(5, L);
	return(8);
}

/*RES 5, (HL)*/
static uint8_t op_CB_0xae(void)
{
	RES_BIT_ADDR_HL(5);
	return(15);
}

/*RES 5, A*/
static uint8_t op_CB_0xaf(void)
{
	RES_BIT_IN_R(5, A);
	return(8);
}

/*RES 6, B*/
static uint8_t op_CB_0xb0(void)
{
	RES_BIT_IN_R(6, B);
	return(8);
}

/*RES 6, C*/
static uint8_t op_CB_0xb1(void)
{
	RES_BIT_IN_R(6, C);
	return(8);
}

/*RES 6, D*/
static uint8_t op_CB_0xb2(void)
{
	RES_BIT_IN_R(6, D);
	return(8);
}

/*RES 6, E*/
static uint8_t op_CB_0xb3(void)
{
	RES_BIT_IN_R(6, E);
	return(8);
}

/*RES 6, H*/
static uint8_t op_CB_0xb4(void)
{
	RES_BIT_IN_R(6, H);
	return(8);
}

/*RES 6, L*/
static uint8_t op_CB_0xb5(void)
{
	RES_BIT_IN_R(6, L);
	return(8);
}

/*RES 6, (HL)*/
static uint8_t op_CB_0xb6(void)
{
	RES_BIT_ADDR_HL(6);
	return(15);
}

/*RES 6, A*/
static uint8_t op_CB_0xb7(void)
{
	RES_BIT_IN_R(6, A);
	return(8);
}

/*RES 7, B*/
static uint8_t op_CB_0xb8(void)
{
	RES_BIT_IN_R(7, B);
	return(8);
}

/*RES 7, C*/
static uint8_t op_CB_0xb9(void)
{
	RES_BIT_IN_R(7, C);
	return(8);
}

/*RES 7, D*/
static uint8_t op_CB_0xba(void)
{
	RES_BIT_IN_R(7, D);
	return(8);
}

/*RES 7, E*/
static uint8_t op_CB_0xbb(void)
{
	RES_BIT_IN_R(7, E);
	return(8);
}

/*RES 7, H*/
static uint8_t op_CB_0xbc(void)
{
	RES_BIT_IN_R(7, H);
	return(8);
}

/*RES 7, L*/
static uint8_t op_CB_0xbd(void)
{
	RES_BIT_IN_R(7, L);
	return(8);
}

/*RES 7, (HL)*/
static uint8_t op_CB_0xbe(void)
{
	RES_BIT_ADDR_HL(7);
	return(15);
}

/*RES 7, A*/
static uint8_t op_CB_0xbf(void)
{
	RES_BIT_IN_R(7, A);
	return(8);
}

/*SET 0, B*/
static uint8_t op_CB_0xc0(void)
{
	SET_BIT_IN_R(0, B);
	return(8);
}

/*SET 0, C*/
static uint8_t op_CB_0xc1(void)
{
	SET_BIT_IN_R(0, C);
	return(8);
}

/*SET 0, D*/
static uint8_t op_CB_0xc2(void)
{
	SET_BIT_IN_R(0, D);
	return(8);
}

/*SET 0, E*/
static uint8_t op_CB_0xc3(void)
{
	SET_BIT_IN_R(0, E);
	return(8);
}

/*SET 0, H*/
static uint8_t op_CB_0xc4(void)
{
	SET_BIT_IN_R(0, H);
	return(8);
}

/*SET 0, L*/
static uint8_t op_CB_0xc5(void)
{
	SET_BIT_IN_R(0, L);
	return(8);
}

/*SET 0, (HL)*/
static uint8_t op_CB_0xc6(void)
{

	SET_BIT_ADDR_HL(0);
	return(15);
}

/*SET 0, A*/
static uint8_t op_CB_0xc7(void)
{
	SET_BIT_IN_R(0, A);
	return(8);
}

/*SET 1, B*/
static uint8_t op_CB_0xc8(void)
{
	SET_BIT_IN_R(1, B);
	return(8);
}

/*SET 1, C*/
static uint8_t op_CB_0xc9(void)
{
	SET_BIT_IN_R(1, C);
	return(8);
}

/*SET 1, D*/
static uint8_t op_CB_0xca(void)
{
	SET_BIT_IN_R(1, D);
	return(8);
}

/*SET 1, E*/
static uint8_t op_CB_0xcb(void)
{
	SET_BIT_IN_R(1, E);
	return(8);
}

/*SET 1, H*/
static uint8_t op_CB_0xcc(void)
{
	SET_BIT_IN_R(1, H);
	return(8);
}

/*SET 1, L*/
static uint8_t op_CB_0xcd(void)
{
	SET_BIT_IN_R(1, L);
	return(8);
}

/*SET 1, (HL)*/
static uint8_t op_CB_0xce(void)
{
	SET_BIT_ADDR_HL(1);
	return(15);
}

/*SET 1, A*/
static uint8_t op_CB_0xcf(void)
{
	SET_BIT_IN_R(1, A);
	return(8);
}

/*SET 2, B*/
static uint8_t op_CB_0xd0(void)
{
	SET_BIT_IN_R(2, B);
	return(8);
}

/*SET 2, C*/
static uint8_t op_CB_0xd1(void)
{
	SET_BIT_IN_R(2, C);
	return(8);
}

/*SET 2, D*/
static uint8_t op_CB_0xd2(void)
{
	SET_BIT_IN_R(2, D);
	return(8);
}

/*SET 2, E*/
static uint8_t op_CB_0xd3(void)
{
	SET_BIT_IN_R(2, E);
	return(8);
}

/*SET 2, H*/
static uint8_t op_CB_0xd4(void)
{
	SET_BIT_IN_R(2, H);
	return(8);
}

/*SET 2, L*/
static uint8_t op_CB_0xd5(void)
{
	SET_BIT_IN_R(2, L);
	return(8);
}

/*SET 2, (HL)*/
static uint8_t op_CB_0xd6(void)
{
	SET_BIT_ADDR_HL(2);
	return(15);
}

/*SET 2, A*/
static uint8_t op_CB_0xd7(void)
{
	SET_BIT_IN_R(2, A);
	return(8);
}

/*SET 3, B*/
static uint8_t op_CB_0xd8(void)
{
	SET_BIT_IN_R(3, B);
	return(8);
}

/*SET 3, C*/
static uint8_t op_CB_0xd9(void)
{
	SET_BIT_IN_R(3, C);
	return(8);
}

/*SET 3, D*/
static uint8_t op_CB_0xda(void)
{
	SET_BIT_IN_R(3, D);
	return(8);
}

/*SET 3, E*/
static uint8_t op_CB_0xdb(void)
{
	SET_BIT_IN_R(3, E);
	return(8);
}

/*SET 3, H*/
static uint8_t op_CB_0xdc(void)
{
	SET_BIT_IN_R(3, H);
	return(8);
}

/*SET 3, L*/
static uint8_t op_CB_0xdd(void)
{
	SET_BIT_IN_R(3, L);
	return(8);
}

/*SET 3, (HL)*/
static uint8_t op_CB_0xde(void)
{
	SET_BIT_ADDR_HL(3);
	return(15);
}

/*SET 3, A*/
static uint8_t op_CB_0xdf(void)
{
	SET_BIT_IN_R(3, A);
	return(8);
}

/*SET 4, B*/
static uint8_t op_CB_0xe0(void)
{
	SET_BIT_IN_R(4, B);
	return(8);
}

/*SET 4, C*/
static uint8_t op_CB_0xe1(void)
{
	SET_BIT_IN_R(4, C);
	return(8);
}

/*SET 4, D*/
static uint8_t op_CB_0xe2(void)
{
	SET_BIT_IN_R(4, D);
	return(8);
}

/*SET 4, E*/
static uint8_t op_CB_0xe3(void)
{
	SET_BIT_IN_R(4, E);
	return(8);
}

/*SET 4, H*/
static uint8_t op_CB_0xe4(void)
{
	SET_BIT_IN_R(4, H);
	return(8);
}

/*SET 4, L*/
static uint8_t op_CB_0xe5(void)
{
	SET_BIT_IN_R(4, L);
	return(8);
}

/*SET 4, (HL)*/
static uint8_t op_CB_0xe6(void)
{
	SET_BIT_ADDR_HL(4);
	return(15);
}

/*SET 4, A*/
static uint8_t op_CB_0xe7(void)
{
	SET_BIT_IN_R(4, A);
	return(8);
}

/*SET 5, B*/
static uint8_t op_CB_0xe8(void)
{
	SET_BIT_IN_R(5, B);
	return(8);
}

/*SET 5, C*/
static uint8_t op_CB_0xe9(void)
{
	SET_BIT_IN_R(5, C);
	return(8);
}

/*SET 5, D*/
static uint8_t op_CB_0xea(void)
{
	SET_BIT_IN_R(5, D);
	return(8);
}

/*SET 5, E*/
static uint8_t op_CB_0xeb(void)
{
	SET_BIT_IN_R(5, E);
	return(8);
}

/*SET 5, H*/
static uint8_t op_CB_0xec(void)
{
	SET_BIT_IN_R(5, H);
	return(8);
}

/*SET 5, L*/
static uint8_t op_CB_0xed(void)
{
	SET_BIT_IN_R(5, L);
	return(8);
}

/*SET 5, (HL)*/
static uint8_t op_CB_0xee(void)
{
	SET_BIT_ADDR_HL(5);
	return(15);
}

/*SET 5, A*/
static uint8_t op_CB_0xef(void)
{
	SET_BIT_IN_R(5, A);
	return(8);
}

/*SET 6, B*/
static uint8_t op_CB_0xf0(void)
{
	SET_BIT_IN_R(6, B);
	return(8);
}

/*SET 6, C*/
static uint8_t op_CB_0xf1(void)
{
	SET_BIT_IN_R(6, C);
	return(8);
}

/*SET 6, D*/
static uint8_t op_CB_0xf2(void)
{
	SET_BIT_IN_R(6, D);
	return(8);
}

/*SET 6, E*/
static uint8_t op_CB_0xf3(void)
{
	SET_BIT_IN_R(6, E);
	return(8);
}

/*SET 6, H*/
static uint8_t op_CB_0xf4(void)
{
	SET_BIT_IN_R(6, H);
	return(8);
}

/*SET 6, L*/
static uint8_t op_CB_0xf5(void)
{
	SET_BIT_IN_R(6, L);
	return(8);
}

/*SET 6, (HL)*/
static uint8_t op_CB_0xf6(void)
{
	SET_BIT_ADDR_HL(6);
	return(15);
}

/*SET 6, A*/
static uint8_t op_CB_0xf7(void)
{
	SET_BIT_IN_R(6, A);
	return(8);
}

/*SET 7, B*/
static uint8_t op_CB_0xf8(void)
{
	SET_BIT_IN_R(7, B);
	return(8);
}

/*SET 7, C*/
static uint8_t op_CB_0xf9(void)
{
	SET_BIT_IN_R(7, C);
	return(8);
}

/*SET 7, D*/
static uint8_t op_CB_0xfa(void)
{
	SET_BIT_IN_R(7, D);
	return(8);
}

/*SET 7, E*/
static uint8_t op_CB_0xfb(void)
{
	SET_BIT_IN_R(7, E);
	return(8);
}

/*SET 7, H*/
static uint8_t op_CB_0xfc(void)
{
	SET_BIT_IN_R(7, H);
	return(8);
}

/*SET 7, L*/
static uint8_t op_CB_0xfd(void)
{
	SET_BIT_IN_R(7, L);
	return(8);
}

/*SET 7, (HL)*/
static uint8_t op_CB_0xfe(void)
{
	SET_BIT_ADDR_HL(7);
	return(15);
}

/*SET 7, A*/
static uint8_t op_CB_0xff(void)
{
	SET_BIT_IN_R(7, A);
	return(8);
}

static uint8_t (*const opcode_cb[0x100])(void)={
	op_CB_0x00, op_CB_0x01, op_CB_0x02, op_CB_0x03, op_CB_0x04, op_CB_0x05, op_CB_0x06, op_CB_0x07, op_CB_0x08, op_CB_0x09, op_CB_0x0a, op_CB_0x0b, op_CB_0x0c, op_CB_0x0d, op_CB_0x0e, op_CB_0x0f,
	op_CB_0x10, op_CB_0x11, op_CB_0x12, op_CB_0x13, op_CB_0x14, op_CB_0x15, op_CB_0x16, op_CB_0x17, op_CB_0x18, op_CB_0x19, op_CB_0x1a, op_CB_0x1b, op_CB_0x1c, op_CB_0x1d, op_CB_0x1e, op_CB_0x1f,
	op_CB_0x20, op_CB_0x21, op_CB_0x22, op_CB_0x23, op_CB_0x24, op_CB_0x25, op_CB_0x26, op_CB_0x27, op_CB_0x28, op_CB_0x29, op_CB_0x2a, op_CB_0x2b, op_CB_0x2c, op_CB_0x2d, op_CB_0x2e, op_CB_0x2f,
	op_CB_0x30, op_CB_0x31, op_CB_0x32, op_CB_0x33, op_CB_0x34, op_CB_0x35, op_CB_0x36, op_CB_0x37, op_CB_0x38, op_CB_0x39, op_CB_0x3a, op_CB_0x3b, op_CB_0x3c, op_CB_0x3d, op_CB_0x3e, op_CB_0x3f,
	op_CB_0x40, op_CB_0x41, op_CB_0x42, op_CB_0x43, op_CB_0x44, op_CB_0x45, op_CB_0x46, op_CB_0x47, op_CB_0x48, op_CB_0x49, op_CB_0x4a, op_CB_0x4b, op_CB_0x4c, op_CB_0x4d, op_CB_0x4e, op_CB_0x4f,
	op_CB_0x50, op_CB_0x51, op_CB_0x52, op_CB_0x53, op_CB_0x54, op_CB_0x55, op_CB_0x56, op_CB_0x57, op_CB_0x58, op_CB_0x59, op_CB_0x5a, op_CB_0x5b, op_CB_0x5c, op_CB_0x5d, op_CB_0x5e, op_CB_0x5f,
	op_CB_0x60, op_CB_0x61, op_CB_0x62, op_CB_0x63, op_CB_0x64, op_CB_0x65, op_CB_0x66, op_CB_0x67, op_CB_0x68, op_CB_0x69, op_CB_0x6a, op_CB_0x6b, op_CB_0x6c, op_CB_0x6d, op_CB_0x6e, op_CB_0x6f,
	op_CB_0x70, op_CB_0x71, op_CB_0x72, op_CB_0x73, op_CB_0x74, op_CB_0x75, op_CB_0x76, op_CB_0x77, op_CB_0x78, op_CB_0x79, op_CB_0x7a, op_CB_0x7b, op_CB_0x7c, op_CB_0x7d, op_CB_0x7e, op_CB_0x7f,
	op_CB_0x80, op_CB_0x81, op_CB_0x82, op_CB_0x83, op_CB_0x84, op_CB_0x85, op_CB_0x86, op_CB_0x87, op_CB_0x88, op_CB_0x89, op_CB_0x8a, op_CB_0x8b, op_CB_0x8c, op_CB_0x8d, op_CB_0x8e, op_CB_0x8f,
	op_CB_0x90, op_CB_0x91, op_CB_0x92, op_CB_0x93, op_CB_0x94, op_CB_0x95, op_CB_0x96, op_CB_0x97, op_CB_0x98, op_CB_0x99, op_CB_0x9a, op_CB_0x9b, op_CB_0x9c, op_CB_0x9d, op_CB_0x9e, op_CB_0x9f,
	op_CB_0xa0, op_CB_0xa1, op_CB_0xa2, op_CB_0xa3, op_CB_0xa4, op_CB_0xa5, op_CB_0xa6, op_CB_0xa7, op_CB_0xa8, op_CB_0xa9, op_CB_0xaa, op_CB_0xab, op_CB_0xac, op_CB_0xad, op_CB_0xae, op_CB_0xaf,
	op_CB_0xb0, op_CB_0xb1, op_CB_0xb2, op_CB_0xb3, op_CB_0xb4, op_CB_0xb5, op_CB_0xb6, op_CB_0xb7, op_CB_0xb8, op_CB_0xb9, op_CB_0xba, op_CB_0xbb, op_CB_0xbc, op_CB_0xbd, op_CB_0xbe, op_CB_0xbf,
	op_CB_0xc0, op_CB_0xc1, op_CB_0xc2, op_CB_0xc3, op_CB_0xc4, op_CB_0xc5, op_CB_0xc6, op_CB_0xc7, op_CB_0xc8, op_CB_0xc9, op_CB_0xca, op_CB_0xcb, op_CB_0xcc, op_CB_0xcd, op_CB_0xce, op_CB_0xcf,
	op_CB_0xd0, op_CB_0xd1, op_CB_0xd2, op_CB_0xd3, op_CB_0xd4, op_CB_0xd5, op_CB_0xd6, op_CB_0xd7, op_CB_0xd8, op_CB_0xd9, op_CB_0xda, op_CB_0xdb, op_CB_0xdc, op_CB_0xdd, op_CB_0xde, op_CB_0xdf,
	op_CB_0xe0, op_CB_0xe1, op_CB_0xe2, op_CB_0xe3, op_CB_0xe4, op_CB_0xe5, op_CB_0xe6, op_CB_0xe7, op_CB_0xe8, op_CB_0xe9, op_CB_0xea, op_CB_0xeb, op_CB_0xec, op_CB_0xed, op_CB_0xee, op_CB_0xef,
	op_CB_0xf0, op_CB_0xf1, op_CB_0xf2, op_CB_0xf3, op_CB_0xf4, op_CB_0xf5, op_CB_0xf6, op_CB_0xf7, op_CB_0xf8, op_CB_0xf9, op_CB_0xfa, op_CB_0xfb, op_CB_0xfc, op_CB_0xfd, op_CB_0xfe, op_CB_0xff
};
