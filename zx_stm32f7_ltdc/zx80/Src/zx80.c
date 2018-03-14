/*
 *
 *	Author: Beloussov Yegor
 *	Created on: january 2018
 *
 *	The program emulating the work of the processor z80 (z80 in the Spectrum
 *	version)
 *
 */

#include "stm32f7xx_hal.h"
#include "tim.h"
#include "ltdc.h"
#include "fatfs.h"

#include "zx80.h"
#include "zx80_macros.h"

//#include "zx.h"
//#include "ay_3_891x.h"


//volatile uint16_t screen1_buf[49152]={0x0000};
uint16_t screen1_buf[49152]={0x0000};

uint16_t vector_nmi;
uint8_t INT_SCR;
uint8_t INT_mask;


uint32_t border_color [8]={0x00000000, 0x000000e7, 0x00e70000, 0x00e700e7, 0x0000e300, 0x0000e3e7, 0x00e7e300, 0x00e7e3e7};

uint8_t file_buf[0xff];
uint16_t file_pointer;
uint32_t memory_pointer;

uint32_t number_byte;
uint32_t total_read_byte;

FRESULT res;




#include "zx80_memory.c"
#include "zx80_registers.c"
#include "zx80_table.c"

#include "zx80_opcodes_ddcb.c"
#include "zx80_opcodes_fdcb.c"
#include "zx80_opcodes_cb.c"
#include "zx80_opcodes_dd.c"
#include "zx80_opcodes_ed.c"
#include "zx80_opcodes_fd.c"
#include "zx80_opcodes_base.c"

#include "zx80_scr_table.c"



uint8_t Next_Byte_File(void)
{
	uint8_t value;
	value=file_buf[file_pointer];

	file_pointer++;
	if(file_pointer==total_read_byte)
	{
		file_pointer=0;
		res=f_read(&SDFile, file_buf, 0xff, (void*)&total_read_byte);
		if(res!=FR_OK)
		{
			Error_Handler();
		}
	}
	return (value);
}

void zx80_load(void)
{
	if(f_mount(&SDFatFS, (TCHAR const*)SDPath, 0) != FR_OK)
    {
      Error_Handler();
    }
    else
    {
    	if(f_open(&SDFile, "exolon.z80", FA_READ) != FR_OK)
    	//if(f_open(&SDFile, "mywrite.txt", FA_CREATE_ALWAYS | FA_WRITE) != FR_OK)
    	{
    		Error_Handler();
    	}
    	else
    	{
    		res=f_read(&SDFile, file_buf, 30, (void*)&total_read_byte);

    		if((total_read_byte==0)||(total_read_byte!=30)||(res!=FR_OK))
    		{
    			Error_Handler();
    		}
    		else
    		{


    			A=file_buf[0];
    			F=file_buf[1];

    			C=file_buf[2];
    			B=file_buf[3];

    			L=file_buf[4];
    			H=file_buf[5];

    			PCL=file_buf[6];
    			PCH=file_buf[7];

    			SPL=file_buf[8];
    			SPH=file_buf[9];

    			I=file_buf[10];

    			R7=R=file_buf[11]&0x7f;
    			R|=file_buf[12]<<7;

    			LTDC->BCCR=border_color[(file_buf[12]&0x0e)>>1];

    			E=file_buf[13];
    			D=file_buf[14];

    			C_=file_buf[15];
    			B_=file_buf[16];

    			E_=file_buf[17];
    			D_=file_buf[18];

    			L_=file_buf[19];
    			H_=file_buf[20];

    			A_=file_buf[21];
    			F_=file_buf[22];

    			IYL=file_buf[23];
    			IYH=file_buf[24];

    			IXL=file_buf[25];
    			IXH=file_buf[26];

    			if(file_buf[27]==0)
    			{
    				IFF1=IFF2=INT_mask=0;
    			}
    			else
    			{
    				IFF1=IFF2=1;
    			}

    			if((file_buf[29]&0x07)==2)
    			{
    				IM=2;
    			}
    			else
    			{
    				IM=0;
    			}

    			if((file_buf[12]&0x20)!=0)
    			{
    				//compressed data
    				file_pointer=0;
    				memory_pointer=0x4000;

    	    		res=f_read(&SDFile, file_buf, 0xff, (void*)&total_read_byte);

    	    		if(res!=FR_OK)
    	    		{
    	    			Error_Handler();
    	    		}

    	    		while (1)
    	    		{
    	    			memory[memory_pointer]=Next_Byte_File();
    	    			memory_pointer++;

						if (memory[memory_pointer-1]==0xed)
						{
	    	    			memory[memory_pointer]=Next_Byte_File();
	    	    			memory_pointer++;

	    	    			if (memory[memory_pointer-1]==0xed)
	    	    			{

								memory_pointer-=2;

								uint8_t compression_count;
								uint8_t compression_number;
								uint8_t compression_value;

								compression_number=Next_Byte_File();

								if ((compression_number==0)&&(memory[memory_pointer-1]==0))
								{
									//end file
					    			HAL_GPIO_WritePin(GPIOB, LED_red_Pin, GPIO_PIN_SET);
					    			f_close(&SDFile);
					    			zx80_Init();
								}


								compression_value=Next_Byte_File();
								for (compression_count=0; compression_count<compression_number; compression_count++)
								{
									memory[memory_pointer+compression_count]=compression_value;
								}
								memory_pointer=memory_pointer+compression_number;
	    	    			}
						}
    	    		}
    			}
    			else
    			{
    				//uncompressed data
    				Error_Handler();
    			}


    			HAL_GPIO_WritePin(GPIOB, LED_red_Pin, GPIO_PIN_SET);
    			f_close(&SDFile);
    			zx80_Init();
    		}
    	}
    }
}


void zx80_Init(void)
{
	HAL_LTDC_SetAddress(&hltdc, (uint32_t)&screen1_buf, 0);
	LTDC->LIPCR=0x004;
	LTDC->IER|=LTDC_IER_LIE;


	DMA2_Stream1->PAR=(uint32_t)&screen_data[7][255][0];
	DMA2_Stream1->M0AR=(uint32_t)&screen1_buf[0];
	DMA2_Stream1->NDTR=0x0008;
	//DMA2_Stream1->CR|=DMA_SxCR_EN;


	uint16_t count; //copy ROM
	for(count=0; count<16384; count++)
	{
		memory[count]=ROM[count];
	}

	//zx80_Reset();

	HAL_SuspendTick();//Disable SysTick Interrupt

	HAL_TIM_OC_Start_IT(&htim14, TIM_CHANNEL_1);
	HAL_TIM_Base_Start(&htim14);

	HAL_TIM_Base_Start(&htim13);

	zx80_screen();
}


void zx80_Reset(void)
{
	AF=0;
	BC=0;
	DE=0;
	HL=0;
	IX=0;
	IY=0;
	SP=0;
	PC=0;
	IFF1=IFF2=0;
	IM=0;
	MEMPTR=0;
}



uint8_t zx80_Run(void)
{
	//noise=(RNG->DR)&0x00ff;
	if((LTDC->ISR&LTDC_ISR_LIF)&&INT_mask)
	{
		LTDC->ICR=LTDC_ICR_CLIF;
		HAL_GPIO_TogglePin(GPIOB, LED_red_Pin);
		halt=DISABLE;
		if(IM)
		{
			IFF1=0;
			IFF2=0;
			vector_nmi=(I*256)+255;
			vector_nmi=(memory[vector_nmi+1]<<8)|memory[vector_nmi];
			RST(vector_nmi);
			return(19);
		}
		else
		{
			IFF1=0;
			IFF2=0;
			RST(0x38);
			return(13);
		}
	}
	INT_mask=IFF1;
	opcode=memory[PC];
	PC+=1;
	R++;
	return(*opcode_base[opcode])();
}

uint8_t in(uint16_t port)
{
	uint8_t input;
	switch (port)
	{
		case 0x7ffe:
		case 0xbffe:
		case 0xdffe:
		case 0xeffe:
		case 0xf7fe:
		case 0xfbfe:
		case 0xfdfe:
		case 0xfefe:
			GPIOF->ODR&=0x00ff;
			GPIOF->ODR|=port&0xff00;
			HAL_GPIO_TogglePin(GPIOB, LED_blue_Pin);


			input=GPIOG->IDR;
			input&=0x5f;
			break;
		case 0xfffd:
			input=0xff;//ay_3_891x[ay_3_891x_reg];
			break;
		default:
			input=0xff;
			break;
	}
	return input;
}

void out(uint16_t port, uint8_t value)
{
	switch (port)
	{
		case 0xbffd:
			//ay_3_891x[ay_3_891x_reg]=value;
			//(*ay_3_891x_fc [ay_3_891x_reg])(value);
			break;
		case 0xfffd:
			//ay_3_891x_reg=value&0xf;
			break;
		default:
			if ((port&0xff)==0x00fe)
			{
				LTDC->BCCR=border_color[value&0x07];//D[0-2] border color

				if (value&0x08)//PA7 out to rec.
				{
					GPIOD->BSRR=GPIO_PIN_3;
				}
				else
				{
					GPIOD->BSRR=(uint32_t)GPIO_PIN_3<<16;
				}

				if (value&0x10)//PA5 out speaker
				{
					GPIOD->BSRR=GPIO_PIN_4;
				}
				else
				{
					GPIOD->BSRR=(uint32_t)GPIO_PIN_4<<16;
				}
			}
			break;
	}
}
