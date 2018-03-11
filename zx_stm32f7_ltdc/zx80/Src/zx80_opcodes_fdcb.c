/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	The program emulating the work of the processor z80
 *	Attention! this part must be included in the main program code
 *
 */


/*LD B, RLC (IY+$)*/
static uint8_t op_FDCB_0x00(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IY, B);
	return(23);
}

/*LD C, RLC (IY+$)*/
static uint8_t op_FDCB_0x01(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IY, C);
	return(23);
}

/*LD D, RLC (IY+$)*/
static uint8_t op_FDCB_0x02(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IY, D);
	return(23);
}

/*LD E, RLC (IY+$)*/
static uint8_t op_FDCB_0x03(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IY, E);
	return(23);
}

/*LD H, RLC (IY+$)*/
static uint8_t op_FDCB_0x04(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IY, H);
	return(23);
}

/*LD L, RLC (IY+$)*/
static uint8_t op_FDCB_0x05(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IY, L);
	return(23);
}

/*RLC (IY+$)*/
static uint8_t op_FDCB_0x06(void)
{
	RLC_ADDR_RP_AND_OFFSET(IY);
	return(23);
}

/*LD A, RLC (IY+$)*/
static uint8_t op_FDCB_0x07(void)
{
	RLC_ADDR_RP_AND_OFFSET_LD_R(IY, A);
	return(23);
}

/*LD B, RRC (IY+$)*/
static uint8_t op_FDCB_0x08(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IY, B);
	return(23);
}

/*LD C, RRC (IY+$)*/
static uint8_t op_FDCB_0x09(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IY, C);
	return(23);
}

/*LD D, RRC (IY+$)*/
static uint8_t op_FDCB_0x0a(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IY, D);
	return(23);
}

/*LD E, RRC (IY+$)*/
static uint8_t op_FDCB_0x0b(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IY, E);
	return(23);
}

/*LD H, RRC (IY+$)*/
static uint8_t op_FDCB_0x0c(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IY, H);
	return(23);
}

/*LD L, RRC (IY+$)*/
static uint8_t op_FDCB_0x0d(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IY, L);
	return(23);
}

/*RRC (IY+$)*/
static uint8_t op_FDCB_0x0e(void)
{
	RRC_ADDR_RP_AND_OFFSET(IY);
	return(23);
}

/*LD A, RRC (IY+$)*/
static uint8_t op_FDCB_0x0f(void)
{
	RRC_ADDR_RP_AND_OFFSET_LD_R(IY, A);
	return(23);
}

/*LD B, RL (IY+$)*/
static uint8_t op_FDCB_0x10(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IY, B);
	return(23);
}

/*LD C, RL (IY+$)*/
static uint8_t op_FDCB_0x11(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IY, C);
	return(23);
}

/*LD D, RL (IY+$)*/
static uint8_t op_FDCB_0x12(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IY, D);
	return(23);
}

/*LD E, RL (IY+$)*/
static uint8_t op_FDCB_0x13(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IY, E);
	return(23);
}

/*LD H, RL (IY+$)*/
static uint8_t op_FDCB_0x14(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IY, H);
	return(23);
}

/*LD L, RL (IY+$)*/
static uint8_t op_FDCB_0x15(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IY, L);
	return(23);
}

/*RL (IY+$)*/
static uint8_t op_FDCB_0x16(void)
{
	RL_ADDR_RP_AND_OFFSET(IY);
	return(23);
}

/*LD A, RL (IY+$)*/
static uint8_t op_FDCB_0x17(void)
{
	RL_ADDR_RP_AND_OFFSET_LD_R(IY, A);
	return(23);
}

/*LD B, RR (IY+$)*/
static uint8_t op_FDCB_0x18(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IY, B);
	return(23);
}

/*LD C, RR (IY+$)*/
static uint8_t op_FDCB_0x19(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IY, C);
	return(23);
}

/*LD D, RR (IY+$)*/
static uint8_t op_FDCB_0x1a(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IY, D);
	return(23);
}

/*LD E, RR (IY+$)*/
static uint8_t op_FDCB_0x1b(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IY, E);
	return(23);
}

/*LD H, RR (IY+$)*/
static uint8_t op_FDCB_0x1c(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IY, H);
	return(23);
}

/*LD L, RR (IY+$)*/
static uint8_t op_FDCB_0x1d(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IY, L);
	return(23);
}

/*RR (IY+$)*/
static uint8_t op_FDCB_0x1e(void)
{
	RR_ADDR_RP_AND_OFFSET(IY);
	return(23);
}

/*LD A, RR (IY+$)*/
static uint8_t op_FDCB_0x1f(void)
{
	RR_ADDR_RP_AND_OFFSET_LD_R(IY, A);
	return(23);
}

/*LD B, SLA (IY+$)*/
static uint8_t op_FDCB_0x20(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IY, B);
	return(23);
}

/*LD C, SLA (IY+$)*/
static uint8_t op_FDCB_0x21(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IY, C);
	return(23);
}

/*LD D, SLA (IY+$)*/
static uint8_t op_FDCB_0x22(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IY, D);
	return(23);
}

/*LD E, SLA (IY+$)*/
static uint8_t op_FDCB_0x23(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IY, E);
	return(23);
}

/*LD H, SLA (IY+$)*/
static uint8_t op_FDCB_0x24(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IY, H);
	return(23);
}

/*LD L, SLA (IY+$)*/
static uint8_t op_FDCB_0x25(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IY, L);
	return(23);
}

/*SLA (IY+$)*/
static uint8_t op_FDCB_0x26(void)
{
	SLA_ADDR_RP_AND_OFFSET(IY);
	return(23);
}

/*LD A, SLA (IY+$)*/
static uint8_t op_FDCB_0x27(void)
{
	SLA_ADDR_RP_AND_OFFSET_LD_R(IY, A);
	return(23);
}

/*LD B, SRA (IY+$)*/
static uint8_t op_FDCB_0x28(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IY, B);
	return(23);
}

/*LD C, SRA (IY+$)*/
static uint8_t op_FDCB_0x29(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IY, C);
	return(23);
}

/*LD D, SRA (IY+$)*/
static uint8_t op_FDCB_0x2a(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IY, D);
	return(23);
}

/*LD E, SRA (IY+$)*/
static uint8_t op_FDCB_0x2b(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IY, E);
	return(23);
}

/*LD H, SRA (IY+$)*/
static uint8_t op_FDCB_0x2c(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IY, H);
	return(23);
}

/*LD L, SRA (IY+$)*/
static uint8_t op_FDCB_0x2d(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IY, L);
	return(23);
}

/*SRA (IY+$)*/
static uint8_t op_FDCB_0x2e(void)
{
	SRA_ADDR_RP_AND_OFFSET(IY);
	return(23);
}

/*LD A, SRA (IY+$)*/
static uint8_t op_FDCB_0x2f(void)
{
	SRA_ADDR_RP_AND_OFFSET_LD_R(IY, A);
	return(23);
}

/*LD B, SLL (IY+$)*/
static uint8_t op_FDCB_0x30(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IY, B);
	return(23);
}

/*LD C, SLL (IY+$)*/
static uint8_t op_FDCB_0x31(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IY, C);
	return(23);
}

/*LD D, SLL (IY+$)*/
static uint8_t op_FDCB_0x32(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IY, D);
	return(23);
}

/*LD E, SLL (IY+$)*/
static uint8_t op_FDCB_0x33(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IY, E);
	return(23);
}

/*LD H, SLL (IY+$)*/
static uint8_t op_FDCB_0x34(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IY, H);
	return(23);
}

/*LD L, SLL (IY+$)*/
static uint8_t op_FDCB_0x35(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IY, L);
	return(23);
}

/*SLL (IY+$)*/
static uint8_t op_FDCB_0x36(void)
{
	SLL_ADDR_RP_AND_OFFSET(IY);
	return(23);
}

/*LD A, SLL (IY+$)*/
static uint8_t op_FDCB_0x37(void)
{
	SLL_ADDR_RP_AND_OFFSET_LD_R(IY, A);
	return(23);
}

/*LD B, SRL (IY+$)*/
static uint8_t op_FDCB_0x38(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IY, B);
	return(23);
}

/*LD C, SRL (IY+$)*/
static uint8_t op_FDCB_0x39(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IY, C);
	return(23);
}

/*LD D, SRL (IY+$)*/
static uint8_t op_FDCB_0x3a(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IY, D);
	return(23);
}

/*LD E, SRL (IY+$)*/
static uint8_t op_FDCB_0x3b(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IY, E);
	return(23);
}

/*LD H, SRL (IY+$)*/
static uint8_t op_FDCB_0x3c(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IY, H);
	return(23);
}

/*LD L, SRL (IY+$)*/
static uint8_t op_FDCB_0x3d(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IY, L);
	return(23);
}

/*SRL (IY+$)*/
static uint8_t op_FDCB_0x3e(void)
{
	SRL_ADDR_RP_AND_OFFSET(IY);
	return(23);
}

/*LD A, SRL (IY+$)*/
static uint8_t op_FDCB_0x3f(void)
{
	SRL_ADDR_RP_AND_OFFSET_LD_R(IY, A);
	return(23);
}

/*BIT 0, (IY+$)*/
static uint8_t op_FDCB_0x47(void)
{
	BIT_ADDR_RP_AND_OFFSET(0, IY);
	return(20);
}

/*BIT 1, (IY+$)*/
static uint8_t op_FDCB_0x4f(void)
{
	BIT_ADDR_RP_AND_OFFSET(1, IY);
	return(20);
}

/*BIT 2, (IY+$)*/
static uint8_t op_FDCB_0x57(void)
{
	BIT_ADDR_RP_AND_OFFSET(2, IY);
	return(20);
}

/*BIT 3, (IY+$)*/
static uint8_t op_FDCB_0x5f(void)
{
	BIT_ADDR_RP_AND_OFFSET(3, IY);
	return(20);
}

/*BIT 4, (IY+$)*/
static uint8_t op_FDCB_0x67(void)
{
	BIT_ADDR_RP_AND_OFFSET(4, IY);
	return(20);
}

/*BIT 5, (IY+$)*/
static uint8_t op_FDCB_0x6f(void)
{
	BIT_ADDR_RP_AND_OFFSET(5, IY);
	return(20);
}

/*BIT 6, (IY+$)*/
static uint8_t op_FDCB_0x77(void)
{
	BIT_ADDR_RP_AND_OFFSET(6, IY);
	return(20);
}

/*BIT 7, (IY+$)*/
static uint8_t op_FDCB_0x7f(void)
{
	BIT_ADDR_RP_AND_OFFSET(7, IY);
	return(20);
}

/*LD B, RES 0, (IY+$)*/
static uint8_t op_FDCB_0x80(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, B);
	return(23);
}

/*LD C, RES 0, (IY+$)*/
static uint8_t op_FDCB_0x81(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, C);
	return(23);
}

/*LD D, RES 0, (IY+$)*/
static uint8_t op_FDCB_0x82(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, D);
	return(23);
}

/*LD E, RES 0, (IY+$)*/
static uint8_t op_FDCB_0x83(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, E);
	return(23);
}

/*LD H, RES 0, (IY+$)*/
static uint8_t op_FDCB_0x84(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, H);
	return(23);
}

/*LD L, RES 0, (IY+$)*/
static uint8_t op_FDCB_0x85(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, L);
	return(23);
}

/*RES 0, (IY+$)*/
static uint8_t op_FDCB_0x86(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(0, IY);
	return(23);
}

/*LD A, RES 0, (IY+$)*/
static uint8_t op_FDCB_0x87(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, A);
	return(23);
}

/*LD B, RES 1, (IY+$)*/
static uint8_t op_FDCB_0x88(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, B);
	return(23);
}

/*LD C, RES 1, (IY+$)*/
static uint8_t op_FDCB_0x89(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, C);
	return(23);
}

/*LD D, RES 1, (IY+$)*/
static uint8_t op_FDCB_0x8a(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, D);
	return(23);
}

/*LD E, RES 1, (IY+$)*/
static uint8_t op_FDCB_0x8b(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, E);
	return(23);
}

/*LD H, RES 1, (IY+$)*/
static uint8_t op_FDCB_0x8c(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, H);
	return(23);
}

/*LD L, RES 1, (IY+$)*/
static uint8_t op_FDCB_0x8d(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, L);
	return(23);
}

/*RES 1, (IY+$)*/
static uint8_t op_FDCB_0x8e(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(1, IY);
	return(23);
}

/*LD A, RES 1, (IY+$)*/
static uint8_t op_FDCB_0x8f(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, A);
	return(23);
}

/*LD B, RES 2, (IY+$)*/
static uint8_t op_FDCB_0x90(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, B);
	return(23);
}

/*LD C, RES 2, (IY+$)*/
static uint8_t op_FDCB_0x91(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, C);
	return(23);
}

/*LD D, RES 2, (IY+$)*/
static uint8_t op_FDCB_0x92(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, D);
	return(23);
}

/*LD E, RES 2, (IY+$)*/
static uint8_t op_FDCB_0x93(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, E);
	return(23);
}

/*LD H, RES 2, (IY+$)*/
static uint8_t op_FDCB_0x94(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, H);
	return(23);
}

/*LD L, RES 2, (IY+$)*/
static uint8_t op_FDCB_0x95(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, L);
	return(23);
}

/*RES 2, (IY+$)*/
static uint8_t op_FDCB_0x96(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(2, IY);
	return(23);
}

/*LD A, RES 2, (IY+$)*/
static uint8_t op_FDCB_0x97(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, A);
	return(23);
}

/*LD B, RES 3, (IY+$)*/
static uint8_t op_FDCB_0x98(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, B);
	return(23);
}

/*LD C, RES 3, (IY+$)*/
static uint8_t op_FDCB_0x99(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, C);
	return(23);
}

/*LD D, RES 3, (IY+$)*/
static uint8_t op_FDCB_0x9a(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, D);
	return(23);
}

/*LD E, RES 3, (IY+$)*/
static uint8_t op_FDCB_0x9b(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, E);
	return(23);
}

/*LD H, RES 3, (IY+$)*/
static uint8_t op_FDCB_0x9c(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, H);
	return(23);
}

/*LD L, RES 3, (IY+$)*/
static uint8_t op_FDCB_0x9d(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, L);
	return(23);
}

/*RES 3, (IY+$)*/
static uint8_t op_FDCB_0x9e(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(3, IY);
	return(23);
}

/*LD A, RES 3, (IY+$)*/
static uint8_t op_FDCB_0x9f(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, A);
	return(23);
}

/*LD B, RES 4, (IY+$)*/
static uint8_t op_FDCB_0xa0(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, B);
	return(23);
}

/*LD C, RES 4, (IY+$)*/
static uint8_t op_FDCB_0xa1(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, C);
	return(23);
}

/*LD D, RES 4, (IY+$)*/
static uint8_t op_FDCB_0xa2(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, D);
	return(23);
}

/*LD E, RES 4, (IY+$)*/
static uint8_t op_FDCB_0xa3(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, E);
	return(23);
}

/*LD H, RES 4, (IY+$)*/
static uint8_t op_FDCB_0xa4(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, H);
	return(23);
}

/*LD L, RES 4, (IY+$)*/
static uint8_t op_FDCB_0xa5(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, L);
	return(23);
}

/*RES 4, (IY+$)*/
static uint8_t op_FDCB_0xa6(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(4, IY);
	return(23);
}

/*LD A, RES 4, (IY+$)*/
static uint8_t op_FDCB_0xa7(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, A);
	return(23);
}

/*LD B, RES 5, (IY+$)*/
static uint8_t op_FDCB_0xa8(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, B);
	return(23);
}

/*LD C, RES 5, (IY+$)*/
static uint8_t op_FDCB_0xa9(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, C);
	return(23);
}

/*LD D, RES 5, (IY+$)*/
static uint8_t op_FDCB_0xaa(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, D);
	return(23);
}

/*LD E, RES 5, (IY+$)*/
static uint8_t op_FDCB_0xab(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, E);
	return(23);
}

/*LD H, RES 5, (IY+$)*/
static uint8_t op_FDCB_0xac(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, H);
	return(23);
}

/*LD L, RES 5, (IY+$)*/
static uint8_t op_FDCB_0xad(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, L);
	return(23);
}

/*RES 5, (IY+$)*/
static uint8_t op_FDCB_0xae(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(5, IY);
	return(23);
}

/*LD A, RES 5, (IY+$)*/
static uint8_t op_FDCB_0xaf(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, A);
	return(23);
}

/*LD B, RES 6, (IY+$)*/
static uint8_t op_FDCB_0xb0(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, B);
	return(23);
}

/*LD C, RES 6, (IY+$)*/
static uint8_t op_FDCB_0xb1(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, C);
	return(23);
}

/*LD D, RES 6, (IY+$)*/
static uint8_t op_FDCB_0xb2(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, D);
	return(23);
}

/*LD E, RES 6, (IY+$)*/
static uint8_t op_FDCB_0xb3(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, E);
	return(23);
}

/*LD H, RES 6, (IY+$)*/
static uint8_t op_FDCB_0xb4(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, H);
	return(23);
}

/*LD L, RES 6, (IY+$)*/
static uint8_t op_FDCB_0xb5(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, L);
	return(23);
}

/*RES 6, (IY+$)*/
static uint8_t op_FDCB_0xb6(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(6, IY);
	return(23);
}

/*LD A, RES 6, (IY+$)*/
static uint8_t op_FDCB_0xb7(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, A);
	return(23);
}

/*LD B, RES 7, (IY+$)*/
static uint8_t op_FDCB_0xb8(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, B);
	return(23);
}

/*LD C, RES 7, (IY+$)*/
static uint8_t op_FDCB_0xb9(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, C);
	return(23);
}

/*LD D, RES 7, (IY+$)*/
static uint8_t op_FDCB_0xba(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, D);
	return(23);
}

/*LD E, RES 7, (IY+$)*/
static uint8_t op_FDCB_0xbb(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, E);
	return(23);
}

/*LD H, RES 7, (IY+$)*/
static uint8_t op_FDCB_0xbc(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, H);
	return(23);
}

/*LD L, RES 7, (IY+$)*/
static uint8_t op_FDCB_0xbd(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, L);
	return(23);
}

/*RES 7, (IY+$)*/
static uint8_t op_FDCB_0xbe(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET(7, IY);
	return(23);
}

/*LD A, RES 7, (IY+$)*/
static uint8_t op_FDCB_0xbf(void)
{
	RES_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, A);
	return(23);
}

/*LD B, SET 0, (IY+$)*/
static uint8_t op_FDCB_0xc0(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, B);
	return(23);
}

/*LD C, SET 0, (IY+$)*/
static uint8_t op_FDCB_0xc1(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, C);
	return(23);
}

/*LD D, SET 0, (IY+$)*/
static uint8_t op_FDCB_0xc2(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, D);
	return(23);
}

/*LD E, SET 0, (IY+$)*/
static uint8_t op_FDCB_0xc3(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, E);
	return(23);
}

/*LD H, SET 0, (IY+$)*/
static uint8_t op_FDCB_0xc4(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, H);
	return(23);
}

/*LD L, SET 0, (IY+$)*/
static uint8_t op_FDCB_0xc5(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, L);;
	return(23);
}

/*SET 0, (IY+$)*/
static uint8_t op_FDCB_0xc6(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(0, IY);
	return(23);
}

/*LD A, SET 0, (IY+$)*/
static uint8_t op_FDCB_0xc7(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(0, IY, A);
	return(23);
}

/*LD B, SET 1, (IY+$)*/
static uint8_t op_FDCB_0xc8(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, B);
	return(23);
}

/*LD C, SET 1, (IY+$)*/
static uint8_t op_FDCB_0xc9(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, C);
	return(23);
}

/*LD D, SET 1, (IY+$)*/
static uint8_t op_FDCB_0xca(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, D);
	return(23);
}

/*LD E, SET 1, (IY+$)*/
static uint8_t op_FDCB_0xcb(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, E);
	return(23);
}

/*LD H, SET 1, (IY+$)*/
static uint8_t op_FDCB_0xcc(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, H);
	return(23);
}

/*LD L, SET 1, (IY+$)*/
static uint8_t op_FDCB_0xcd(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, L);
	return(23);
}

/*SET 1, (IY+$)*/
static uint8_t op_FDCB_0xce(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(1, IY);
	return(23);
}

/*LD A, SET 1, (IY+$)*/
static uint8_t op_FDCB_0xcf(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(1, IY, A);
	return(23);
}

/*LD B, SET 2, (IY+$)*/
static uint8_t op_FDCB_0xd0(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, B);
	return(23);
}

/*LD C, SET 2, (IY+$)*/
static uint8_t op_FDCB_0xd1(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, C);
	return(23);
}

/*LD D, SET 2, (IY+$)*/
static uint8_t op_FDCB_0xd2(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, D);
	return(23);
}

/*LD E, SET 2, (IY+$)*/
static uint8_t op_FDCB_0xd3(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, E);
	return(23);
}

/*LD H, SET 2, (IY+$)*/
static uint8_t op_FDCB_0xd4(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, H);
	return(23);
}

/*LD L, SET 2, (IY+$)*/
static uint8_t op_FDCB_0xd5(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, L);
	return(23);
}

/*SET 2, (IY+$)*/
static uint8_t op_FDCB_0xd6(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(2, IY);
	return(23);
}

/*LD A, SET 2, (IY+$)*/
static uint8_t op_FDCB_0xd7(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(2, IY, A);
	return(23);
}

/*LD B, SET 3, (IY+$)*/
static uint8_t op_FDCB_0xd8(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, B);
	return(23);
}

/*LD C, SET 3, (IY+$)*/
static uint8_t op_FDCB_0xd9(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, C);
	return(23);
}

/*LD D, SET 3, (IY+$)*/
static uint8_t op_FDCB_0xda(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, D);
	return(23);
}

/*LD E, SET 3, (IY+$)*/
static uint8_t op_FDCB_0xdb(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, E);
	return(23);
}

/*LD H, SET 3, (IY+$)*/
static uint8_t op_FDCB_0xdc(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, H);
	return(23);
}

/*LD L, SET 3, (IY+$)*/
static uint8_t op_FDCB_0xdd(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, L);
	return(23);
}

/*SET 3, (IY+$)*/
static uint8_t op_FDCB_0xde(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(3, IY);
	return(23);
}

/*LD A, SET 3, (IY+$)*/
static uint8_t op_FDCB_0xdf(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(3, IY, A);
	return(23);
}

/*LD B, SET 4, (IY+$)*/
static uint8_t op_FDCB_0xe0(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, B);
	return(23);
}

/*LD C, SET 4, (IY+$)*/
static uint8_t op_FDCB_0xe1(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, C);
	return(23);
}

/*LD D, SET 4, (IY+$)*/
static uint8_t op_FDCB_0xe2(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, D);
	return(23);
}

/*LD E, SET 4, (IY+$)*/
static uint8_t op_FDCB_0xe3(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, E);
	return(23);
}

/*LD H, SET 4, (IY+$)*/
static uint8_t op_FDCB_0xe4(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, H);
	return(23);
}

/*LD L, SET 4, (IY+$)*/
static uint8_t op_FDCB_0xe5(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, L);
	return(23);
}

/*SET 4, (IY+$)*/
static uint8_t op_FDCB_0xe6(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(4, IY);
	return(23);
}

/*LD A, SET 4, (IY+$)*/
static uint8_t op_FDCB_0xe7(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(4, IY, A);
	return(23);
}

/*LD B, SET 5, (IY+$)*/
static uint8_t op_FDCB_0xe8(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, B);
	return(23);
}

/*LD C, SET 5, (IY+$)*/
static uint8_t op_FDCB_0xe9(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, C);
	return(23);
}

/*LD D, SET 5, (IY+$)*/
static uint8_t op_FDCB_0xea(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, D);
	return(23);
}

/*LD E, SET 5, (IY+$)*/
static uint8_t op_FDCB_0xeb(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, E);
	return(23);
}

/*LD H, SET 5, (IY+$)*/
static uint8_t op_FDCB_0xec(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, H);
	return(23);
}

/*LD L, SET 5, (IY+$)*/
static uint8_t op_FDCB_0xed(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, L);
	return(23);
}

/*SET 5, (IY+$)*/
static uint8_t op_FDCB_0xee(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(5, IY);
	return(23);
}

/*LD A, SET 5, (IY+$)*/
static uint8_t op_FDCB_0xef(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(5, IY, A);
	return(23);
}

/*LD B, SET 6, (IY+$)*/
static uint8_t op_FDCB_0xf0(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, B);
	return(23);
}

/*LD C, SET 6, (IY+$)*/
static uint8_t op_FDCB_0xf1(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, C);
	return(23);
}

/*LD D, SET 6, (IY+$)*/
static uint8_t op_FDCB_0xf2(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, D);
	return(23);
}

/*LD E, SET 6, (IY+$)*/
static uint8_t op_FDCB_0xf3(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, E);
	return(23);
}

/*LD H, SET 6, (IY+$)*/
static uint8_t op_FDCB_0xf4(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, H);
	return(23);
}

/*LD L, SET 6, (IY+$)*/
static uint8_t op_FDCB_0xf5(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, L);
	return(23);
}

/*SET 6, (IY+$)*/
static uint8_t op_FDCB_0xf6(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(6, IY);
	return(23);
}

/*LD A, SET 6, (IY+$)*/
static uint8_t op_FDCB_0xf7(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(6, IY, A);
	return(23);
}

/*LD B, SET 7, (IY+$)*/
static uint8_t op_FDCB_0xf8(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, B);
	return(23);
}

/*LD C, SET 7, (IY+$)*/
static uint8_t op_FDCB_0xf9(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, C);
	return(23);
}

/*LD D, SET 7, (IY+$)*/
static uint8_t op_FDCB_0xfa(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, D);
	return(23);
}

/*LD E, SET 7, (IY+$)*/
static uint8_t op_FDCB_0xfb(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, E);
	return(23);
}

/*LD H, SET 7, (IY+$)*/
static uint8_t op_FDCB_0xfc(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, H);
	return(23);
}

/*LD L, SET 7, (IY+$)*/
static uint8_t op_FDCB_0xfd(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, L);
	return(23);
}

/*SET 7, (IY+$)*/
static uint8_t op_FDCB_0xfe(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET(7, IY);
	return(23);
}

/*LD A, SET 7, (IY+$)*/
static uint8_t op_FDCB_0xff(void)
{
	SET_BIT_ADDR_RP_AND_OFFSET_LD_R(7, IY, A);
	return(23);
}

static uint8_t (*const opcode_fdcb[0x100])(void)={
	op_FDCB_0x00, op_FDCB_0x01, op_FDCB_0x02, op_FDCB_0x03, op_FDCB_0x04, op_FDCB_0x05, op_FDCB_0x06, op_FDCB_0x07, op_FDCB_0x08, op_FDCB_0x09, op_FDCB_0x0a, op_FDCB_0x0b, op_FDCB_0x0c, op_FDCB_0x0d, op_FDCB_0x0e, op_FDCB_0x0f,
	op_FDCB_0x10, op_FDCB_0x11, op_FDCB_0x12, op_FDCB_0x13, op_FDCB_0x14, op_FDCB_0x15, op_FDCB_0x16, op_FDCB_0x17, op_FDCB_0x18, op_FDCB_0x19, op_FDCB_0x1a, op_FDCB_0x1b, op_FDCB_0x1c, op_FDCB_0x1d, op_FDCB_0x1e, op_FDCB_0x1f,
	op_FDCB_0x20, op_FDCB_0x21, op_FDCB_0x22, op_FDCB_0x23, op_FDCB_0x24, op_FDCB_0x25, op_FDCB_0x26, op_FDCB_0x27, op_FDCB_0x28, op_FDCB_0x29, op_FDCB_0x2a, op_FDCB_0x2b, op_FDCB_0x2c, op_FDCB_0x2d, op_FDCB_0x2e, op_FDCB_0x2f,
	op_FDCB_0x30, op_FDCB_0x31, op_FDCB_0x32, op_FDCB_0x33, op_FDCB_0x34, op_FDCB_0x35, op_FDCB_0x36, op_FDCB_0x37, op_FDCB_0x38, op_FDCB_0x39, op_FDCB_0x3a, op_FDCB_0x3b, op_FDCB_0x3c, op_FDCB_0x3d, op_FDCB_0x3e, op_FDCB_0x3f,
	op_FDCB_0x47, op_FDCB_0x47, op_FDCB_0x47, op_FDCB_0x47, op_FDCB_0x47, op_FDCB_0x47, op_FDCB_0x47, op_FDCB_0x47, op_FDCB_0x4f, op_FDCB_0x4f, op_FDCB_0x4f, op_FDCB_0x4f, op_FDCB_0x4f, op_FDCB_0x4f, op_FDCB_0x4f, op_FDCB_0x4f,
	op_FDCB_0x57, op_FDCB_0x57, op_FDCB_0x57, op_FDCB_0x57, op_FDCB_0x57, op_FDCB_0x57, op_FDCB_0x57, op_FDCB_0x57, op_FDCB_0x5f, op_FDCB_0x5f, op_FDCB_0x5f, op_FDCB_0x5f, op_FDCB_0x5f, op_FDCB_0x5f, op_FDCB_0x5f, op_FDCB_0x5f,
	op_FDCB_0x67, op_FDCB_0x67, op_FDCB_0x67, op_FDCB_0x67, op_FDCB_0x67, op_FDCB_0x67, op_FDCB_0x67, op_FDCB_0x67, op_FDCB_0x6f, op_FDCB_0x6f, op_FDCB_0x6f, op_FDCB_0x6f, op_FDCB_0x6f, op_FDCB_0x6f, op_FDCB_0x6f, op_FDCB_0x6f,
	op_FDCB_0x77, op_FDCB_0x77, op_FDCB_0x77, op_FDCB_0x77, op_FDCB_0x77, op_FDCB_0x77, op_FDCB_0x77, op_FDCB_0x77, op_FDCB_0x7f, op_FDCB_0x7f, op_FDCB_0x7f, op_FDCB_0x7f, op_FDCB_0x7f, op_FDCB_0x7f, op_FDCB_0x7f, op_FDCB_0x7f,
	op_FDCB_0x80, op_FDCB_0x81, op_FDCB_0x82, op_FDCB_0x83, op_FDCB_0x84, op_FDCB_0x85, op_FDCB_0x86, op_FDCB_0x87, op_FDCB_0x88, op_FDCB_0x89, op_FDCB_0x8a, op_FDCB_0x8b, op_FDCB_0x8c, op_FDCB_0x8d, op_FDCB_0x8e, op_FDCB_0x8f,
	op_FDCB_0x90, op_FDCB_0x91, op_FDCB_0x92, op_FDCB_0x93, op_FDCB_0x94, op_FDCB_0x95, op_FDCB_0x96, op_FDCB_0x97, op_FDCB_0x98, op_FDCB_0x99, op_FDCB_0x9a, op_FDCB_0x9b, op_FDCB_0x9c, op_FDCB_0x9d, op_FDCB_0x9e, op_FDCB_0x9f,
	op_FDCB_0xa0, op_FDCB_0xa1, op_FDCB_0xa2, op_FDCB_0xa3, op_FDCB_0xa4, op_FDCB_0xa5, op_FDCB_0xa6, op_FDCB_0xa7, op_FDCB_0xa8, op_FDCB_0xa9, op_FDCB_0xaa, op_FDCB_0xab, op_FDCB_0xac, op_FDCB_0xad, op_FDCB_0xae, op_FDCB_0xaf,
	op_FDCB_0xb0, op_FDCB_0xb1, op_FDCB_0xb2, op_FDCB_0xb3, op_FDCB_0xb4, op_FDCB_0xb5, op_FDCB_0xb6, op_FDCB_0xb7, op_FDCB_0xb8, op_FDCB_0xb9, op_FDCB_0xba, op_FDCB_0xbb, op_FDCB_0xbc, op_FDCB_0xbd, op_FDCB_0xbe, op_FDCB_0xbf,
	op_FDCB_0xc0, op_FDCB_0xc1, op_FDCB_0xc2, op_FDCB_0xc3, op_FDCB_0xc4, op_FDCB_0xc5, op_FDCB_0xc6, op_FDCB_0xc7, op_FDCB_0xc8, op_FDCB_0xc9, op_FDCB_0xca, op_FDCB_0xcb, op_FDCB_0xcc, op_FDCB_0xcd, op_FDCB_0xce, op_FDCB_0xcf,
	op_FDCB_0xd0, op_FDCB_0xd1, op_FDCB_0xd2, op_FDCB_0xd3, op_FDCB_0xd4, op_FDCB_0xd5, op_FDCB_0xd6, op_FDCB_0xd7, op_FDCB_0xd8, op_FDCB_0xd9, op_FDCB_0xda, op_FDCB_0xdb, op_FDCB_0xdc, op_FDCB_0xdd, op_FDCB_0xde, op_FDCB_0xdf,
	op_FDCB_0xe0, op_FDCB_0xe1, op_FDCB_0xe2, op_FDCB_0xe3, op_FDCB_0xe4, op_FDCB_0xe5, op_FDCB_0xe6, op_FDCB_0xe7, op_FDCB_0xe8, op_FDCB_0xe9, op_FDCB_0xea, op_FDCB_0xeb, op_FDCB_0xec, op_FDCB_0xed, op_FDCB_0xee, op_FDCB_0xef,
	op_FDCB_0xf0, op_FDCB_0xf1, op_FDCB_0xf2, op_FDCB_0xf3, op_FDCB_0xf4, op_FDCB_0xf5, op_FDCB_0xf6, op_FDCB_0xf7, op_FDCB_0xf8, op_FDCB_0xf9, op_FDCB_0xfa, op_FDCB_0xfb, op_FDCB_0xfc, op_FDCB_0xfd, op_FDCB_0xfe, op_FDCB_0xff
};
