/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	The program emulating the work of the processor z80
 *	Attention! this part must be included in the main program code
 *
 */


/*основная группа регистров*/
union
{
	uint8_t r[21];//C, B, E, D, L, H, F, A, IXL, IXH, IYL, IYH, SPL, SPH, PCL, PCH, MEMPTRL, MEMPTRH, I, R, R7
	uint16_t rp[9];//BC, DE, HL, AF, IX, IY, SP, PC, MEMPTR
}reg;

/*теневая группа регистров*/
union
{
	uint8_t r[8];//C, B, E, D, L, H, F, A
	uint16_t rp[4];//BC, DE, HL, AF
}reg_;

/*флаги прерываний*/
uint8_t IFF1;
uint8_t IFF2;
uint8_t IM;
uint8_t halt=ENABLE;

/*временные регистры*/
uint8_t temp8;
uint16_t temp16;

uint16_t exx_temp;
uint32_t add_temp;
uint32_t sub_temp;
uint16_t cp_temp;
uint8_t bo_temp;

uint8_t in_temp;
uint8_t neg_temp;
uint16_t daa_temp;
uint8_t rot_temp;

uint8_t lookup;

/*объединение беззнаковой и знаковой переменной для определения смещения*/
union
{
	uint8_t u;
	int8_t s;
}d;

uint8_t opcode;
