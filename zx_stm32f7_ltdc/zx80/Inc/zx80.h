/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	The main interface header file of the processor emulator is z80 (z80 in the
 *	Spectrum version).In writing the emulator code, different Internet
 *	resources were used. Most of the code is borrowed from
 *	https://sourceforge.net/projects/z80ex/. Creation of the famous Pigmaker57 aka Boo-boo.
 *
 */

#ifndef INC_Z80_H_
#define INC_Z80_H_

extern uint8_t screen_RAM [6144];
extern uint8_t memory[0x10004];
extern uint8_t const ROM[16384];
extern uint8_t INT_SCR;
extern uint8_t port_rf;
extern uint16_t border;


//extern volatile uint16_t screen1_buf[49152];
extern uint16_t screen1_buf[49152];
extern uint16_t scr_byte_counter;

void zx80_Init(void);
void zx80_Reset(void);
uint8_t zx80_Run(void);
void zx80_screen(void);
void zx80_load(void);

void poke(uint16_t addr, uint8_t value);
uint8_t peek(uint16_t addr);
void poke16(uint16_t addr, uint16_t value);
uint16_t peek16(uint16_t addr);

uint8_t in(uint16_t port);
void out(uint16_t port, uint8_t value);


#endif /* INC_Z80_H_ */
