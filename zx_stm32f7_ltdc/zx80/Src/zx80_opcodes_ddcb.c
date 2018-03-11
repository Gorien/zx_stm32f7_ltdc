/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	The program emulating the work of the processor z80
 *	Attention! this part must be included in the main program code
 *
 */


/*LD B, RLC (IX+$)*/
static uint8_t op_DDCB_0x00(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IX, B);
	return(23);
}

/*LD C, RLC (IX+$)*/
static uint8_t op_DDCB_0x01(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IX, C);
	return(23);
}

/*LD D, RLC (IX+$)*/
static uint8_t op_DDCB_0x02(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IX, D);
	return(23);
}

/*LD E, RLC (IX+$)*/
static uint8_t op_DDCB_0x03(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IX, E);
	return(23);
}

/*LD H, RLC (IX+$)*/
static uint8_t op_DDCB_0x04(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IX, H);
	return(23);
}

/*LD L, RLC (IX+$)*/
static uint8_t op_DDCB_0x05(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IX, L);
	return(23);
}

/*RLC (IX+$)*/
static uint8_t op_DDCB_0x06(void)
{
	RLC_ADDR_RP_AND_OFFSET(IX);
	return(23);
}

/*LD A, RLC (IX+$)*/
static uint8_t op_DDCB_0x07(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IX, A);
	return(23);
}

/*LD B, RRC (IX+$)*/
static uint8_t op_DDCB_0x08(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IX, B);
	return(23);
}

/*LD C, RRC (IX+$)*/
static uint8_t op_DDCB_0x09(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IX, C);
	return(23);
}

/*LD D, RRC (IX+$)*/
static uint8_t op_DDCB_0x0a(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IX, D);
	return(23);
}

/*LD E, RRC (IX+$)*/
static uint8_t op_DDCB_0x0b(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IX, E);
	return(23);
}

/*LD H, RRC (IX+$)*/
static uint8_t op_DDCB_0x0c(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IX, H);
	return(23);
}

/*LD L, RRC (IX+$)*/
static uint8_t op_DDCB_0x0d(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IX, L);
	return(23);
}

/*RRC (IX+$)*/
static uint8_t op_DDCB_0x0e(void)
{
	RRC_ADDR_RP_AND_OFFSET(IX);
	return(23);
}

/*LD A, RRC (IX+$)*/
static uint8_t op_DDCB_0x0f(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IX, A);
	return(23);
}

/*LD B, RL (IX+$)*/
static uint8_t op_DDCB_0x10(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IX, B);
	return(23);
}

/*LD C, RL (IX+$)*/
static uint8_t op_DDCB_0x11(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IX, C);
	return(23);
}

/*LD D, RL (IX+$)*/
static uint8_t op_DDCB_0x12(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IX, D);
	return(23);
}

/*LD E, RL (IX+$)*/
static uint8_t op_DDCB_0x13(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IX, E);
	return(23);
}

/*LD H, RL (IX+$)*/
static uint8_t op_DDCB_0x14(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IX, H);
	return(23);
}

/*LD L, RL (IX+$)*/
static uint8_t op_DDCB_0x15(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IX, L);
	return(23);
}

/*RL (IX+$)*/
static uint8_t op_DDCB_0x16(void)
{
	RL_ADDR_RP_AND_OFFSET(IX);
	return(23);
}

/*LD A, RL (IX+$)*/
static uint8_t op_DDCB_0x17(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IX, A);
	return(23);
}

/*LD B, RR (IX+$)*/
static uint8_t op_DDCB_0x18(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IX, B);
	return(23);
}

/*LD C, RR (IX+$)*/
static uint8_t op_DDCB_0x19(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IX, C);
	return(23);
}

/*LD D, RR (IX+$)*/
static uint8_t op_DDCB_0x1a(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IX, D);
	return(23);
}

/*LD E, RR (IX+$)*/
static uint8_t op_DDCB_0x1b(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IX, E);
	return(23);
}

/*LD H, RR (IX+$)*/
static uint8_t op_DDCB_0x1c(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IX, H);
	return(23);
}

/*LD L, RR (IX+$)*/
static uint8_t op_DDCB_0x1d(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IX, L);
	return(23);
}

/*RR (IX+$)*/
static uint8_t op_DDCB_0x1e(void)
{
	RR_ADDR_RP_AND_OFFSET(IX);
	return(23);
}

/*LD A, RR (IX+$)*/
static uint8_t op_DDCB_0x1f(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IX, A);
	return(23);
}

/*LD B, SLA (IX+$)*/
static uint8_t op_DDCB_0x20(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IX, B);
	return(23);
}

/*LD C, SLA (IX+$)*/
static uint8_t op_DDCB_0x21(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IX, C);
	return(23);
}

/*LD D, SLA (IX+$)*/
static uint8_t op_DDCB_0x22(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IX, D);
	return(23);
}

/*LD E, SLA (IX+$)*/
static uint8_t op_DDCB_0x23(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IX, E);
	return(23);
}

/*LD H, SLA (IX+$)*/
static uint8_t op_DDCB_0x24(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IX, H);
	return(23);
}

/*LD L, SLA (IX+$)*/
static uint8_t op_DDCB_0x25(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IX, L);
	return(23);
}

/*SLA (IX+$)*/
static uint8_t op_DDCB_0x26(void)
{
	SLA_ADDR_RP_AND_OFFSET(IX);
	return(23);
}

/*LD A, SLA (IX+$)*/
static uint8_t op_DDCB_0x27(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IX, A);
	return(23);
}

/*LD B, SRA (IX+$)*/
static uint8_t op_DDCB_0x28(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IX, B);
	return(23);
}

/*LD C, SRA (IX+$)*/
static uint8_t op_DDCB_0x29(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IX, C);
	return(23);
}

/*LD D, SRA (IX+$)*/
static uint8_t op_DDCB_0x2a(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IX, D);
	return(23);
}

/*LD E, SRA (IX+$)*/
static uint8_t op_DDCB_0x2b(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IX, E);
	return(23);
}

/*LD H, SRA (IX+$)*/
static uint8_t op_DDCB_0x2c(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IX, H);
	return(23);
}

/*LD L, SRA (IX+$)*/
static uint8_t op_DDCB_0x2d(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IX, L);
	return(23);
}

/*SRA (IX+$)*/
static uint8_t op_DDCB_0x2e(void)
{
	SRA_ADDR_RP_AND_OFFSET(IX);
	return(23);
}

/*LD A, SRA (IX+$)*/
static uint8_t op_DDCB_0x2f(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IX, A);
	return(23);
}

/*LD B, SLL (IX+$)*/
static uint8_t op_DDCB_0x30(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IX, B);
	return(23);
}

/*LD C, SLL (IX+$)*/
static uint8_t op_DDCB_0x31(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IX, C);
	return(23);
}

/*LD D, SLL (IX+$)*/
static uint8_t op_DDCB_0x32(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IX, D);
	return(23);
}

/*LD E, SLL (IX+$)*/
static uint8_t op_DDCB_0x33(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IX, E);
	return(23);
}

/*LD H, SLL (IX+$)*/
static uint8_t op_DDCB_0x34(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IX, H);
	return(23);
}

/*LD L, SLL (IX+$)*/
static uint8_t op_DDCB_0x35(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IX, L);
	return(23);
}

/*SLL (IX+$)*/
static uint8_t op_DDCB_0x36(void)
{
	SLL_ADDR_RP_AND_OFFSET(IX);
	return(23);
}

/*LD A, SLL (IX+$)*/
static uint8_t op_DDCB_0x37(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IX, A);
	return(23);
}

/*LD B, SRL (IX+$)*/
static uint8_t op_DDCB_0x38(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IX, B);
	return(23);
}

/*LD C, SRL (IX+$)*/
static uint8_t op_DDCB_0x39(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IX, C);
	return(23);
}

/*LD D, SRL (IX+$)*/
static uint8_t op_DDCB_0x3a(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IX, D);
	return(23);
}

/*LD E, SRL (IX+$)*/
static uint8_t op_DDCB_0x3b(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IX, E);
	return(23);
}

/*LD H, SRL (IX+$)*/
static uint8_t op_DDCB_0x3c(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IX, H);
	return(23);
}

/*LD L, SRL (IX+$)*/
static uint8_t op_DDCB_0x3d(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IX, L);
	return(23);
}

/*SRL (IX+$)*/
static uint8_t op_DDCB_0x3e(void)
{
	SRL_ADDR_RP_AND_OFFSET(IX);
	return(23);
}

/*LD A, SRL (IX+$)*/
static uint8_t op_DDCB_0x3f(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IX, A);
	return(23);
}

/*BIT 0, (IX+$)*/
static uint8_t op_DDCB_0x47(void)
{
	BIT_ADDR_RP_AND_OFFSET(0, IX);
	return(20);
}

/*BIT 1, (IX+$)*/
static uint8_t op_DDCB_0x4f(void)
{
	BIT_ADDR_RP_AND_OFFSET(1, IX);
	return(20);
}

/*BIT 2, (IX+$)*/
static uint8_t op_DDCB_0x57(void)
{
	BIT_ADDR_RP_AND_OFFSET(2, IX);
	return(20);
}

/*BIT 3, (IX+$)*/
static uint8_t op_DDCB_0x5f(void)
{
	BIT_ADDR_RP_AND_OFFSET(3, IX);
	return(20);
}

/*BIT 4, (IX+$)*/
static uint8_t op_DDCB_0x67(void)
{
	BIT_ADDR_RP_AND_OFFSET(4, IX);
	return(20);
}

/*BIT 5, (IX+$)*/
static uint8_t op_DDCB_0x6f(void)
{
	BIT_ADDR_RP_AND_OFFSET(5, IX);
	return(20);
}

/*BIT 6, (IX+$)*/
static uint8_t op_DDCB_0x77(void)
{
	BIT_ADDR_RP_AND_OFFSET(6, IX);
	return(20);
}

/*BIT 7, (IX+$)*/
static uint8_t op_DDCB_0x7f(void)
{
	BIT_ADDR_RP_AND_OFFSET(7, IX);
	return(20);
}

/*LD B, RES 0, (IX+$)*/
static uint8_t op_DDCB_0x80(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, B);
	return(23);
}

/*LD C, RES 0, (IX+$)*/
static uint8_t op_DDCB_0x81(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, C);
	return(23);
}

/*LD D, RES 0, (IX+$)*/
static uint8_t op_DDCB_0x82(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, D);
	return(23);
}

/*LD E, RES 0, (IX+$)*/
static uint8_t op_DDCB_0x83(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, E);
	return(23);
}

/*LD H, RES 0, (IX+$)*/
static uint8_t op_DDCB_0x84(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, H);
	return(23);
}

/*LD L, RES 0, (IX+$)*/
static uint8_t op_DDCB_0x85(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, L);
	return(23);
}

/*RES 0, (IX+$)*/
static uint8_t op_DDCB_0x86(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(0, IX);
	return(23);
}

/*LD A, RES 0, (IX+$)*/
static uint8_t op_DDCB_0x87(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, A);
	return(23);
}

/*LD B, RES 1, (IX+$)*/
static uint8_t op_DDCB_0x88(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, B);
	return(23);
}

/*LD C, RES 1, (IX+$)*/
static uint8_t op_DDCB_0x89(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, C);
	return(23);
}

/*LD D, RES 1, (IX+$)*/
static uint8_t op_DDCB_0x8a(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, D);
	return(23);
}

/*LD E, RES 1, (IX+$)*/
static uint8_t op_DDCB_0x8b(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, E);
	return(23);
}

/*LD H, RES 1, (IX+$)*/
static uint8_t op_DDCB_0x8c(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, H);
	return(23);
}

/*LD L, RES 1, (IX+$)*/
static uint8_t op_DDCB_0x8d(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, L);
	return(23);
}

/*RES 1, (IX+$)*/
static uint8_t op_DDCB_0x8e(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(1, IX);
	return(23);
}

/*LD A, RES 1, (IX+$)*/
static uint8_t op_DDCB_0x8f(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, A);
	return(23);
}

/*LD B, RES 2, (IX+$)*/
static uint8_t op_DDCB_0x90(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, B);
	return(23);
}

/*LD C, RES 2, (IX+$)*/
static uint8_t op_DDCB_0x91(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, C);
	return(23);
}

/*LD D, RES 2, (IX+$)*/
static uint8_t op_DDCB_0x92(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, D);
	return(23);
}

/*LD E, RES 2, (IX+$)*/
static uint8_t op_DDCB_0x93(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, E);
	return(23);
}

/*LD H, RES 2, (IX+$)*/
static uint8_t op_DDCB_0x94(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, H);
	return(23);
}

/*LD L, RES 2, (IX+$)*/
static uint8_t op_DDCB_0x95(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, L);
	return(23);
}

/*RES 2, (IX+$)*/
static uint8_t op_DDCB_0x96(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(2, IX);
	return(23);
}

/*LD A, RES 2, (IX+$)*/
static uint8_t op_DDCB_0x97(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, A);
	return(23);
}

/*LD B, RES 3, (IX+$)*/
static uint8_t op_DDCB_0x98(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, B);
	return(23);
}

/*LD C, RES 3, (IX+$)*/
static uint8_t op_DDCB_0x99(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, C);
	return(23);
}

/*LD D, RES 3, (IX+$)*/
static uint8_t op_DDCB_0x9a(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, D);
	return(23);
}

/*LD E, RES 3, (IX+$)*/
static uint8_t op_DDCB_0x9b(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, E);
	return(23);
}

/*LD H, RES 3, (IX+$)*/
static uint8_t op_DDCB_0x9c(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, H);
	return(23);
}

/*LD L, RES 3, (IX+$)*/
static uint8_t op_DDCB_0x9d(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, L);
	return(23);
}

/*RES 3, (IX+$)*/
static uint8_t op_DDCB_0x9e(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(3, IX);
	return(23);
}

/*LD A, RES 3, (IX+$)*/
static uint8_t op_DDCB_0x9f(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, A);
	return(23);
}

/*LD B, RES 4, (IX+$)*/
static uint8_t op_DDCB_0xa0(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, B);
	return(23);
}

/*LD C, RES 4, (IX+$)*/
static uint8_t op_DDCB_0xa1(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, C);
	return(23);
}

/*LD D, RES 4, (IX+$)*/
static uint8_t op_DDCB_0xa2(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, D);
	return(23);
}

/*LD E, RES 4, (IX+$)*/
static uint8_t op_DDCB_0xa3(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, E);
	return(23);
}

/*LD H, RES 4, (IX+$)*/
static uint8_t op_DDCB_0xa4(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, H);
	return(23);
}

/*LD L, RES 4, (IX+$)*/
static uint8_t op_DDCB_0xa5(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, L);
	return(23);
}

/*RES 4, (IX+$)*/
static uint8_t op_DDCB_0xa6(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(4, IX);
	return(23);
}

/*LD A, RES 4, (IX+$)*/
static uint8_t op_DDCB_0xa7(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, A);
	return(23);
}

/*LD B, RES 5, (IX+$)*/
static uint8_t op_DDCB_0xa8(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, B);
	return(23);
}

/*LD C, RES 5, (IX+$)*/
static uint8_t op_DDCB_0xa9(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, C);
	return(23);
}

/*LD D, RES 5, (IX+$)*/
static uint8_t op_DDCB_0xaa(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, D);
	return(23);
}

/*LD E, RES 5, (IX+$)*/
static uint8_t op_DDCB_0xab(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, E);
	return(23);
}

/*LD H, RES 5, (IX+$)*/
static uint8_t op_DDCB_0xac(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, H);
	return(23);
}

/*LD L, RES 5, (IX+$)*/
static uint8_t op_DDCB_0xad(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, L);
	return(23);
}

/*RES 5, (IX+$)*/
static uint8_t op_DDCB_0xae(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(5, IX);
	return(23);
}

/*LD A, RES 5, (IX+$)*/
static uint8_t op_DDCB_0xaf(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, A);
	return(23);
}

/*LD B, RES 6, (IX+$)*/
static uint8_t op_DDCB_0xb0(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, B);
	return(23);
}

/*LD C, RES 6, (IX+$)*/
static uint8_t op_DDCB_0xb1(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, C);
	return(23);
}

/*LD D, RES 6, (IX+$)*/
static uint8_t op_DDCB_0xb2(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, D);
	return(23);
}

/*LD E, RES 6, (IX+$)*/
static uint8_t op_DDCB_0xb3(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, E);
	return(23);
}

/*LD H, RES 6, (IX+$)*/
static uint8_t op_DDCB_0xb4(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, H);
	return(23);
}

/*LD L, RES 6, (IX+$)*/
static uint8_t op_DDCB_0xb5(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, L);
	return(23);
}

/*RES 6, (IX+$)*/
static uint8_t op_DDCB_0xb6(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(6, IX);
	return(23);
}

/*LD A, RES 6, (IX+$)*/
static uint8_t op_DDCB_0xb7(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, A);
	return(23);
}

/*LD B, RES 7, (IX+$)*/
static uint8_t op_DDCB_0xb8(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, B);
	return(23);
}

/*LD C, RES 7, (IX+$)*/
static uint8_t op_DDCB_0xb9(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, C);
	return(23);
}

/*LD D, RES 7, (IX+$)*/
static uint8_t op_DDCB_0xba(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, D);
	return(23);
}

/*LD E, RES 7, (IX+$)*/
static uint8_t op_DDCB_0xbb(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, E);
	return(23);
}

/*LD H, RES 7, (IX+$)*/
static uint8_t op_DDCB_0xbc(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, H);
	return(23);
}

/*LD L, RES 7, (IX+$)*/
static uint8_t op_DDCB_0xbd(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, L);
	return(23);
}

/*RES 7, (IX+$)*/
static uint8_t op_DDCB_0xbe(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(7, IX);
	return(23);
}

/*LD A, RES 7, (IX+$)*/
static uint8_t op_DDCB_0xbf(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, A);
	return(23);
}

/*LD B, SET 0, (IX+$)*/
static uint8_t op_DDCB_0xc0(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, B);
	return(23);
}

/*LD C, SET 0, (IX+$)*/
static uint8_t op_DDCB_0xc1(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, C);
	return(23);
}

/*LD D, SET 0, (IX+$)*/
static uint8_t op_DDCB_0xc2(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, D);
	return(23);
}

/*LD E, SET 0, (IX+$)*/
static uint8_t op_DDCB_0xc3(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, E);
	return(23);
}

/*LD H, SET 0, (IX+$)*/
static uint8_t op_DDCB_0xc4(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, H);
	return(23);
}

/*LD L, SET 0, (IX+$)*/
static uint8_t op_DDCB_0xc5(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, L);;
	return(23);
}

/*SET 0, (IX+$)*/
static uint8_t op_DDCB_0xc6(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(0, IX);
	return(23);
}

/*LD A, SET 0, (IX+$)*/
static uint8_t op_DDCB_0xc7(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IX, A);
	return(23);
}

/*LD B, SET 1, (IX+$)*/
static uint8_t op_DDCB_0xc8(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, B);
	return(23);
}

/*LD C, SET 1, (IX+$)*/
static uint8_t op_DDCB_0xc9(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, C);
	return(23);
}

/*LD D, SET 1, (IX+$)*/
static uint8_t op_DDCB_0xca(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, D);
	return(23);
}

/*LD E, SET 1, (IX+$)*/
static uint8_t op_DDCB_0xcb(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, E);
	return(23);
}

/*LD H, SET 1, (IX+$)*/
static uint8_t op_DDCB_0xcc(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, H);
	return(23);
}

/*LD L, SET 1, (IX+$)*/
static uint8_t op_DDCB_0xcd(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, L);
	return(23);
}

/*SET 1, (IX+$)*/
static uint8_t op_DDCB_0xce(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(1, IX);
	return(23);
}

/*LD A, SET 1, (IX+$)*/
static uint8_t op_DDCB_0xcf(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IX, A);
	return(23);
}

/*LD B, SET 2, (IX+$)*/
static uint8_t op_DDCB_0xd0(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, B);
	return(23);
}

/*LD C, SET 2, (IX+$)*/
static uint8_t op_DDCB_0xd1(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, C);
	return(23);
}

/*LD D, SET 2, (IX+$)*/
static uint8_t op_DDCB_0xd2(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, D);
	return(23);
}

/*LD E, SET 2, (IX+$)*/
static uint8_t op_DDCB_0xd3(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, E);
	return(23);
}

/*LD H, SET 2, (IX+$)*/
static uint8_t op_DDCB_0xd4(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, H);
	return(23);
}

/*LD L, SET 2, (IX+$)*/
static uint8_t op_DDCB_0xd5(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, L);
	return(23);
}

/*SET 2, (IX+$)*/
static uint8_t op_DDCB_0xd6(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(2, IX);
	return(23);
}

/*LD A, SET 2, (IX+$)*/
static uint8_t op_DDCB_0xd7(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IX, A);
	return(23);
}

/*LD B, SET 3, (IX+$)*/
static uint8_t op_DDCB_0xd8(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, B);
	return(23);
}

/*LD C, SET 3, (IX+$)*/
static uint8_t op_DDCB_0xd9(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, C);
	return(23);
}

/*LD D, SET 3, (IX+$)*/
static uint8_t op_DDCB_0xda(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, D);
	return(23);
}

/*LD E, SET 3, (IX+$)*/
static uint8_t op_DDCB_0xdb(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, E);
	return(23);
}

/*LD H, SET 3, (IX+$)*/
static uint8_t op_DDCB_0xdc(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, H);
	return(23);
}

/*LD L, SET 3, (IX+$)*/
static uint8_t op_DDCB_0xdd(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, L);
	return(23);
}

/*SET 3, (IX+$)*/
static uint8_t op_DDCB_0xde(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(3, IX);
	return(23);
}

/*LD A, SET 3, (IX+$)*/
static uint8_t op_DDCB_0xdf(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IX, A);
	return(23);
}

/*LD B, SET 4, (IX+$)*/
static uint8_t op_DDCB_0xe0(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, B);
	return(23);
}

/*LD C, SET 4, (IX+$)*/
static uint8_t op_DDCB_0xe1(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, C);
	return(23);
}

/*LD D, SET 4, (IX+$)*/
static uint8_t op_DDCB_0xe2(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, D);
	return(23);
}

/*LD E, SET 4, (IX+$)*/
static uint8_t op_DDCB_0xe3(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, E);
	return(23);
}

/*LD H, SET 4, (IX+$)*/
static uint8_t op_DDCB_0xe4(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, H);
	return(23);
}

/*LD L, SET 4, (IX+$)*/
static uint8_t op_DDCB_0xe5(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, L);
	return(23);
}

/*SET 4, (IX+$)*/
static uint8_t op_DDCB_0xe6(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(4, IX);
	return(23);
}

/*LD A, SET 4, (IX+$)*/
static uint8_t op_DDCB_0xe7(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IX, A);
	return(23);
}

/*LD B, SET 5, (IX+$)*/
static uint8_t op_DDCB_0xe8(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, B);
	return(23);
}

/*LD C, SET 5, (IX+$)*/
static uint8_t op_DDCB_0xe9(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, C);
	return(23);
}

/*LD D, SET 5, (IX+$)*/
static uint8_t op_DDCB_0xea(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, D);
	return(23);
}

/*LD E, SET 5, (IX+$)*/
static uint8_t op_DDCB_0xeb(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, E);
	return(23);
}

/*LD H, SET 5, (IX+$)*/
static uint8_t op_DDCB_0xec(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, H);
	return(23);
}

/*LD L, SET 5, (IX+$)*/
static uint8_t op_DDCB_0xed(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, L);
	return(23);
}

/*SET 5, (IX+$)*/
static uint8_t op_DDCB_0xee(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(5, IX);
	return(23);
}

/*LD A, SET 5, (IX+$)*/
static uint8_t op_DDCB_0xef(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IX, A);
	return(23);
}

/*LD B, SET 6, (IX+$)*/
static uint8_t op_DDCB_0xf0(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, B);
	return(23);
}

/*LD C, SET 6, (IX+$)*/
static uint8_t op_DDCB_0xf1(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, C);
	return(23);
}

/*LD D, SET 6, (IX+$)*/
static uint8_t op_DDCB_0xf2(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, D);
	return(23);
}

/*LD E, SET 6, (IX+$)*/
static uint8_t op_DDCB_0xf3(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, E);
	return(23);
}

/*LD H, SET 6, (IX+$)*/
static uint8_t op_DDCB_0xf4(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, H);
	return(23);
}

/*LD L, SET 6, (IX+$)*/
static uint8_t op_DDCB_0xf5(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, L);
	return(23);
}

/*SET 6, (IX+$)*/
static uint8_t op_DDCB_0xf6(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(6, IX);
	return(23);
}

/*LD A, SET 6, (IX+$)*/
static uint8_t op_DDCB_0xf7(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IX, A);
	return(23);
}

/*LD B, SET 7, (IX+$)*/
static uint8_t op_DDCB_0xf8(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, B);
	return(23);
}

/*LD C, SET 7, (IX+$)*/
static uint8_t op_DDCB_0xf9(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, C);
	return(23);
}

/*LD D, SET 7, (IX+$)*/
static uint8_t op_DDCB_0xfa(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, D);
	return(23);
}

/*LD E, SET 7, (IX+$)*/
static uint8_t op_DDCB_0xfb(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, E);
	return(23);
}

/*LD H, SET 7, (IX+$)*/
static uint8_t op_DDCB_0xfc(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, H);
	return(23);
}

/*LD L, SET 7, (IX+$)*/
static uint8_t op_DDCB_0xfd(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, L);
	return(23);
}

/*SET 7, (IX+$)*/
static uint8_t op_DDCB_0xfe(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(7, IX);
	return(23);
}

/*LD A, SET 7, (IX+$)*/
static uint8_t op_DDCB_0xff(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IX, A);
	return(23);
}

static uint8_t (*const opcode_ddcb[0x100])(void)={
	op_DDCB_0x00, op_DDCB_0x01, op_DDCB_0x02, op_DDCB_0x03, op_DDCB_0x04, op_DDCB_0x05, op_DDCB_0x06, op_DDCB_0x07, op_DDCB_0x08, op_DDCB_0x09, op_DDCB_0x0a, op_DDCB_0x0b, op_DDCB_0x0c, op_DDCB_0x0d, op_DDCB_0x0e, op_DDCB_0x0f,
	op_DDCB_0x10, op_DDCB_0x11, op_DDCB_0x12, op_DDCB_0x13, op_DDCB_0x14, op_DDCB_0x15, op_DDCB_0x16, op_DDCB_0x17, op_DDCB_0x18, op_DDCB_0x19, op_DDCB_0x1a, op_DDCB_0x1b, op_DDCB_0x1c, op_DDCB_0x1d, op_DDCB_0x1e, op_DDCB_0x1f,
	op_DDCB_0x20, op_DDCB_0x21, op_DDCB_0x22, op_DDCB_0x23, op_DDCB_0x24, op_DDCB_0x25, op_DDCB_0x26, op_DDCB_0x27, op_DDCB_0x28, op_DDCB_0x29, op_DDCB_0x2a, op_DDCB_0x2b, op_DDCB_0x2c, op_DDCB_0x2d, op_DDCB_0x2e, op_DDCB_0x2f,
	op_DDCB_0x30, op_DDCB_0x31, op_DDCB_0x32, op_DDCB_0x33, op_DDCB_0x34, op_DDCB_0x35, op_DDCB_0x36, op_DDCB_0x37, op_DDCB_0x38, op_DDCB_0x39, op_DDCB_0x3a, op_DDCB_0x3b, op_DDCB_0x3c, op_DDCB_0x3d, op_DDCB_0x3e, op_DDCB_0x3f,
	op_DDCB_0x47, op_DDCB_0x47, op_DDCB_0x47, op_DDCB_0x47, op_DDCB_0x47, op_DDCB_0x47, op_DDCB_0x47, op_DDCB_0x47, op_DDCB_0x4f, op_DDCB_0x4f, op_DDCB_0x4f, op_DDCB_0x4f, op_DDCB_0x4f, op_DDCB_0x4f, op_DDCB_0x4f, op_DDCB_0x4f,
	op_DDCB_0x57, op_DDCB_0x57, op_DDCB_0x57, op_DDCB_0x57, op_DDCB_0x57, op_DDCB_0x57, op_DDCB_0x57, op_DDCB_0x57, op_DDCB_0x5f, op_DDCB_0x5f, op_DDCB_0x5f, op_DDCB_0x5f, op_DDCB_0x5f, op_DDCB_0x5f, op_DDCB_0x5f, op_DDCB_0x5f,
	op_DDCB_0x67, op_DDCB_0x67, op_DDCB_0x67, op_DDCB_0x67, op_DDCB_0x67, op_DDCB_0x67, op_DDCB_0x67, op_DDCB_0x67, op_DDCB_0x6f, op_DDCB_0x6f, op_DDCB_0x6f, op_DDCB_0x6f, op_DDCB_0x6f, op_DDCB_0x6f, op_DDCB_0x6f, op_DDCB_0x6f,
	op_DDCB_0x77, op_DDCB_0x77, op_DDCB_0x77, op_DDCB_0x77, op_DDCB_0x77, op_DDCB_0x77, op_DDCB_0x77, op_DDCB_0x77, op_DDCB_0x7f, op_DDCB_0x7f, op_DDCB_0x7f, op_DDCB_0x7f, op_DDCB_0x7f, op_DDCB_0x7f, op_DDCB_0x7f, op_DDCB_0x7f,
	op_DDCB_0x80, op_DDCB_0x81, op_DDCB_0x82, op_DDCB_0x83, op_DDCB_0x84, op_DDCB_0x85, op_DDCB_0x86, op_DDCB_0x87, op_DDCB_0x88, op_DDCB_0x89, op_DDCB_0x8a, op_DDCB_0x8b, op_DDCB_0x8c, op_DDCB_0x8d, op_DDCB_0x8e, op_DDCB_0x8f,
	op_DDCB_0x90, op_DDCB_0x91, op_DDCB_0x92, op_DDCB_0x93, op_DDCB_0x94, op_DDCB_0x95, op_DDCB_0x96, op_DDCB_0x97, op_DDCB_0x98, op_DDCB_0x99, op_DDCB_0x9a, op_DDCB_0x9b, op_DDCB_0x9c, op_DDCB_0x9d, op_DDCB_0x9e, op_DDCB_0x9f,
	op_DDCB_0xa0, op_DDCB_0xa1, op_DDCB_0xa2, op_DDCB_0xa3, op_DDCB_0xa4, op_DDCB_0xa5, op_DDCB_0xa6, op_DDCB_0xa7, op_DDCB_0xa8, op_DDCB_0xa9, op_DDCB_0xaa, op_DDCB_0xab, op_DDCB_0xac, op_DDCB_0xad, op_DDCB_0xae, op_DDCB_0xaf,
	op_DDCB_0xb0, op_DDCB_0xb1, op_DDCB_0xb2, op_DDCB_0xb3, op_DDCB_0xb4, op_DDCB_0xb5, op_DDCB_0xb6, op_DDCB_0xb7, op_DDCB_0xb8, op_DDCB_0xb9, op_DDCB_0xba, op_DDCB_0xbb, op_DDCB_0xbc, op_DDCB_0xbd, op_DDCB_0xbe, op_DDCB_0xbf,
	op_DDCB_0xc0, op_DDCB_0xc1, op_DDCB_0xc2, op_DDCB_0xc3, op_DDCB_0xc4, op_DDCB_0xc5, op_DDCB_0xc6, op_DDCB_0xc7, op_DDCB_0xc8, op_DDCB_0xc9, op_DDCB_0xca, op_DDCB_0xcb, op_DDCB_0xcc, op_DDCB_0xcd, op_DDCB_0xce, op_DDCB_0xcf,
	op_DDCB_0xd0, op_DDCB_0xd1, op_DDCB_0xd2, op_DDCB_0xd3, op_DDCB_0xd4, op_DDCB_0xd5, op_DDCB_0xd6, op_DDCB_0xd7, op_DDCB_0xd8, op_DDCB_0xd9, op_DDCB_0xda, op_DDCB_0xdb, op_DDCB_0xdc, op_DDCB_0xdd, op_DDCB_0xde, op_DDCB_0xdf,
	op_DDCB_0xe0, op_DDCB_0xe1, op_DDCB_0xe2, op_DDCB_0xe3, op_DDCB_0xe4, op_DDCB_0xe5, op_DDCB_0xe6, op_DDCB_0xe7, op_DDCB_0xe8, op_DDCB_0xe9, op_DDCB_0xea, op_DDCB_0xeb, op_DDCB_0xec, op_DDCB_0xed, op_DDCB_0xee, op_DDCB_0xef,
	op_DDCB_0xf0, op_DDCB_0xf1, op_DDCB_0xf2, op_DDCB_0xf3, op_DDCB_0xf4, op_DDCB_0xf5, op_DDCB_0xf6, op_DDCB_0xf7, op_DDCB_0xf8, op_DDCB_0xf9, op_DDCB_0xfa, op_DDCB_0xfb, op_DDCB_0xfc, op_DDCB_0xfd, op_DDCB_0xfe, op_DDCB_0xff
};
